@implementation HKWorkoutTrainingLoad

- (HKWorkoutTrainingLoad)initWithQuantity:(id)a3 dateInterval:(id)a4
{
  id v6;
  id v7;
  HKWorkoutTrainingLoad *v8;
  uint64_t v9;
  HKQuantity *quantity;
  uint64_t v11;
  NSDateInterval *dateInterval;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutTrainingLoad;
  v8 = -[HKWorkoutTrainingLoad init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    quantity = v8->_quantity;
    v8->_quantity = (HKQuantity *)v9;

    v11 = objc_msgSend(v7, "copy");
    dateInterval = v8->_dateInterval;
    v8->_dateInterval = (NSDateInterval *)v11;

  }
  return v8;
}

- (HKWorkoutTrainingLoad)initWithQuantity:(id)a3 dateInterval:(id)a4 count:(int64_t)a5
{
  self->_workoutsCount = a5;
  return -[HKWorkoutTrainingLoad initWithQuantity:dateInterval:](self, "initWithQuantity:dateInterval:", a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKQuantity *quantity;
  id v5;

  quantity = self->_quantity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", quantity, CFSTR("quantity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_workoutsCount, CFSTR("workoutsCount"));

}

- (HKWorkoutTrainingLoad)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HKWorkoutTrainingLoad *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quantity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("workoutsCount"));

  v8 = -[HKWorkoutTrainingLoad initWithQuantity:dateInterval:count:](self, "initWithQuantity:dateInterval:count:", v5, v6, v7);
  return v8;
}

- (HKQuantity)quantity
{
  return (HKQuantity *)objc_getProperty(self, a2, 8, 1);
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)workoutsCount
{
  return self->_workoutsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end
