@implementation HKHeartRateSummaryWorkoutRecoveryStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perMinuteReadings, 0);
}

- (HKHeartRateSummaryWorkoutRecoveryStatistics)initWithDateInterval:(id)a3 numberOfBuckets:(int64_t)a4 workoutUUID:(id)a5 workoutActivityType:(unint64_t)a6
{
  HKHeartRateSummaryWorkoutRecoveryStatistics *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  result = -[HKHeartRateSummaryStatistics initWithDateInterval:numberOfBuckets:sessionUUID:](&v8, sel_initWithDateInterval_numberOfBuckets_sessionUUID_, a3, a4, a5);
  if (result)
    result->_workoutActivityType = a6;
  return result;
}

- (id)initFromStatistics:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  v5 = -[HKHeartRateSummaryStatistics initFromStatistics:](&v10, sel_initFromStatistics_, v4);
  v6 = v5;
  if (v5)
  {
    v5[7] = *((_QWORD *)v4 + 7);
    v7 = objc_msgSend(*((id *)v4 + 8), "copy");
    v8 = (void *)v6[8];
    v6[8] = v7;

  }
  return v6;
}

- (void)_setPerMinuteReadings:(id)a3
{
  NSDictionary *v4;
  NSDictionary *perMinuteReadings;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  perMinuteReadings = self->_perMinuteReadings;
  self->_perMinuteReadings = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  v4 = a3;
  -[HKHeartRateSummaryStatistics encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKHeartRateSummaryWorkoutRecoveryStatistics workoutActivityType](self, "workoutActivityType", v5.receiver, v5.super_class), CFSTR("WorkoutActivityTypeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_perMinuteReadings, CFSTR("PerMinuteReadings"));

}

- (HKHeartRateSummaryWorkoutRecoveryStatistics)initWithCoder:(id)a3
{
  id v4;
  HKHeartRateSummaryWorkoutRecoveryStatistics *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *perMinuteReadings;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  v5 = -[HKHeartRateSummaryStatistics initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_workoutActivityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WorkoutActivityTypeKey"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("PerMinuteReadings"));
    v10 = objc_claimAutoreleasedReturnValue();
    perMinuteReadings = v5->_perMinuteReadings;
    v5->_perMinuteReadings = (NSDictionary *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryStatistics sessionUUID](self, "sessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HKHeartRateSummaryWorkoutRecoveryStatistics workoutActivityType](self, "workoutActivityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryStatistics dateInterval](self, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryStatistics dateInterval](self, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryWorkoutRecoveryStatistics perMinuteReadings](self, "perMinuteReadings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@:%p count:%@ session:%@ activityType:%@ (%@ - %@) minutes:%@>"), v14, self, v3, v4, v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HKHeartRateSummaryWorkoutRecoveryStatistics *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (HKHeartRateSummaryWorkoutRecoveryStatistics *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v13.receiver = self,
          v13.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics,
          -[HKHeartRateSummaryStatistics isEqual:](&v13, sel_isEqual_, v4))
      && (v5 = -[HKHeartRateSummaryWorkoutRecoveryStatistics workoutActivityType](self, "workoutActivityType"),
          v5 == -[HKHeartRateSummaryWorkoutRecoveryStatistics workoutActivityType](v4, "workoutActivityType")))
    {
      -[HKHeartRateSummaryWorkoutRecoveryStatistics perMinuteReadings](self, "perMinuteReadings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHeartRateSummaryWorkoutRecoveryStatistics perMinuteReadings](v4, "perMinuteReadings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v11 = 1;
      }
      else
      {
        -[HKHeartRateSummaryWorkoutRecoveryStatistics perMinuteReadings](v4, "perMinuteReadings");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HKHeartRateSummaryWorkoutRecoveryStatistics perMinuteReadings](self, "perMinuteReadings");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummaryWorkoutRecoveryStatistics perMinuteReadings](v4, "perMinuteReadings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

        }
        else
        {
          v11 = 0;
        }

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  v3 = -[HKHeartRateSummaryStatistics hash](&v8, sel_hash);
  v4 = -[HKHeartRateSummaryWorkoutRecoveryStatistics workoutActivityType](self, "workoutActivityType");
  -[HKHeartRateSummaryWorkoutRecoveryStatistics perMinuteReadings](self, "perMinuteReadings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (NSDictionary)perMinuteReadings
{
  return self->_perMinuteReadings;
}

@end
