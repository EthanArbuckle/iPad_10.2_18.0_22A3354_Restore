@implementation HKHeartRateSummaryWorkoutStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumHeartRate, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
}

- (HKHeartRateSummaryWorkoutStatistics)initWithDateInterval:(id)a3 numberOfBuckets:(int64_t)a4 workoutUUID:(id)a5 workoutActivityType:(unint64_t)a6
{
  HKHeartRateSummaryWorkoutStatistics *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  result = -[HKHeartRateSummaryStatistics initWithDateInterval:numberOfBuckets:sessionUUID:](&v8, sel_initWithDateInterval_numberOfBuckets_sessionUUID_, a3, a4, a5);
  if (result)
    result->_workoutActivityType = a6;
  return result;
}

- (id)initFromStatistics:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  v5 = -[HKHeartRateSummaryStatistics initFromStatistics:](&v8, sel_initFromStatistics_, v4);
  v6 = v5;
  if (v5)
  {
    v5[7] = (id)*((_QWORD *)v4 + 7);
    objc_storeStrong(v5 + 8, *((id *)v4 + 8));
    objc_storeStrong(v6 + 9, *((id *)v4 + 9));
  }

  return v6;
}

- (void)_setAverageHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRate, a3);
}

- (void)_setMaximumHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_maximumHeartRate, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  v4 = a3;
  -[HKHeartRateSummaryStatistics encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKHeartRateSummaryWorkoutStatistics workoutActivityType](self, "workoutActivityType", v7.receiver, v7.super_class), CFSTR("WorkoutActivityTypeKey"));
  -[HKHeartRateSummaryWorkoutStatistics averageHeartRate](self, "averageHeartRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AverageHeartRateKey"));

  -[HKHeartRateSummaryWorkoutStatistics maximumHeartRate](self, "maximumHeartRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MaximumHeartRateKey"));

}

- (HKHeartRateSummaryWorkoutStatistics)initWithCoder:(id)a3
{
  id v4;
  HKHeartRateSummaryWorkoutStatistics *v5;
  uint64_t v6;
  HKQuantity *averageHeartRate;
  uint64_t v8;
  HKQuantity *maximumHeartRate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  v5 = -[HKHeartRateSummaryStatistics initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_workoutActivityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WorkoutActivityTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AverageHeartRateKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    averageHeartRate = v5->_averageHeartRate;
    v5->_averageHeartRate = (HKQuantity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MaximumHeartRateKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    maximumHeartRate = v5->_maximumHeartRate;
    v5->_maximumHeartRate = (HKQuantity *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKHeartRateSummaryWorkoutStatistics *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v25;

  v5 = (HKHeartRateSummaryWorkoutStatistics *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25.receiver = self;
      v25.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
      if (-[HKHeartRateSummaryStatistics isEqual:](&v25, sel_isEqual_, v5))
      {
        v6 = -[HKHeartRateSummaryWorkoutStatistics workoutActivityType](self, "workoutActivityType");
        if (v6 == -[HKHeartRateSummaryWorkoutStatistics workoutActivityType](v5, "workoutActivityType"))
        {
          -[HKHeartRateSummaryWorkoutStatistics averageHeartRate](self, "averageHeartRate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummaryWorkoutStatistics averageHeartRate](v5, "averageHeartRate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7 == v8)
          {
            -[HKHeartRateSummaryWorkoutStatistics maximumHeartRate](self, "maximumHeartRate", v21, v23);
          }
          else
          {
            -[HKHeartRateSummaryWorkoutStatistics averageHeartRate](v5, "averageHeartRate");
            v9 = objc_claimAutoreleasedReturnValue();
            if (!v9)
            {
              v12 = 0;
LABEL_22:

              goto LABEL_11;
            }
            v3 = (void *)v9;
            -[HKHeartRateSummaryWorkoutStatistics averageHeartRate](self, "averageHeartRate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKHeartRateSummaryWorkoutStatistics averageHeartRate](v5, "averageHeartRate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v10, "isEqual:", v11))
            {
              v12 = 0;
LABEL_21:

              goto LABEL_22;
            }
            -[HKHeartRateSummaryWorkoutStatistics maximumHeartRate](self, "maximumHeartRate", v11, v10);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummaryWorkoutStatistics maximumHeartRate](v5, "maximumHeartRate");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v14 == (void *)v15)
          {

            v12 = 1;
          }
          else
          {
            v16 = (void *)v15;
            -[HKHeartRateSummaryWorkoutStatistics maximumHeartRate](v5, "maximumHeartRate");
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = (void *)v17;
              -[HKHeartRateSummaryWorkoutStatistics maximumHeartRate](self, "maximumHeartRate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKHeartRateSummaryWorkoutStatistics maximumHeartRate](v5, "maximumHeartRate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v19, "isEqual:", v20);

            }
            else
            {

              v12 = 0;
            }
          }
          v11 = v22;
          v10 = v24;
          if (v7 == v8)
            goto LABEL_22;
          goto LABEL_21;
        }
      }
    }
    v12 = 0;
  }
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  v3 = -[HKHeartRateSummaryStatistics hash](&v10, sel_hash);
  v4 = -[HKHeartRateSummaryWorkoutStatistics workoutActivityType](self, "workoutActivityType");
  -[HKHeartRateSummaryWorkoutStatistics averageHeartRate](self, "averageHeartRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[HKHeartRateSummaryWorkoutStatistics maximumHeartRate](self, "maximumHeartRate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash") ^ v3;

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKQuantity *averageHeartRate;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  HKQuantity *maximumHeartRate;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  uint64_t v19;
  void *v20;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryStatistics sessionUUID](self, "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HKHeartRateSummaryWorkoutStatistics workoutActivityType](self, "workoutActivityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryStatistics dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryStatistics dateInterval](self, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  averageHeartRate = self->_averageHeartRate;
  +[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](averageHeartRate, "doubleValueForUnit:", v10);
  v12 = v11;
  maximumHeartRate = self->_maximumHeartRate;
  +[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](maximumHeartRate, "doubleValueForUnit:", v14);
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@:%p count:%@ session:%@ activityType:%@ (%@ - %@) average:%.1fbpm max:%.1fbpm>"), v19, self, v18, v3, v4, v6, v8, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (HKQuantity)averageHeartRate
{
  return self->_averageHeartRate;
}

- (HKQuantity)maximumHeartRate
{
  return self->_maximumHeartRate;
}

@end
