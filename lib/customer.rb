class Customer

  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

 # OBJECT RELATIONSHIPS - #new_meal, #meals, #waiters

 # Returns an Array of Meal instances associated with this customer
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

 # Returns an Array of Waiter instances associated w/ this customer's meals
  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end

  # Initializes a meal using the current Customer instance, 
    # a provided Waiter instance and a total and tip
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def new_meal_20_percent(waiter, total)
    tip = total * 0.2
    Meal.new(waiter, self, total, tip)
  end

  def self.oldest_customer # Class method to find the odlest customer
    oldest_age = 0
    oldest_customer = nil #not assigned yet 
    self.all.each do |customer|
      if customer.age > oldest_age
        oldest_age = customer.age
        oldest_customer = customer
      end
    end
    oldest_customer
  end

end