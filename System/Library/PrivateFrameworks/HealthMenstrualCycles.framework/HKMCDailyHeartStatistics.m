@implementation HKMCDailyHeartStatistics

- (HKMCHeartStatistics)tenthPercentileAwakeHeartRateStatistics
{
  return self->_tenthPercentileAwakeHeartRateStatistics;
}

- (HKMCHeartStatistics)tenthPercentileAsleepHeartRateStatistics
{
  return self->_tenthPercentileAsleepHeartRateStatistics;
}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMCDailyHeartStatistics)initWithCoder:(id)a3
{
  id v4;
  HKMCDailyHeartStatistics *v5;
  uint64_t v6;
  HKMCHeartStatistics *tenthPercentileAsleepHeartRateStatistics;
  uint64_t v8;
  HKMCHeartStatistics *tenthPercentileAwakeHeartRateStatistics;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMCDailyHeartStatistics;
  v5 = -[HKMCDailyHeartStatistics init](&v11, sel_init);
  if (v5)
  {
    v5->_dayIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TenthPercentileAsleepHeartRateStatistics"));
    v6 = objc_claimAutoreleasedReturnValue();
    tenthPercentileAsleepHeartRateStatistics = v5->_tenthPercentileAsleepHeartRateStatistics;
    v5->_tenthPercentileAsleepHeartRateStatistics = (HKMCHeartStatistics *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TenthPercentileAwakeHeartRateStatistics"));
    v8 = objc_claimAutoreleasedReturnValue();
    tenthPercentileAwakeHeartRateStatistics = v5->_tenthPercentileAwakeHeartRateStatistics;
    v5->_tenthPercentileAwakeHeartRateStatistics = (HKMCHeartStatistics *)v8;

  }
  return v5;
}

- (HKMCDailyHeartStatistics)initWithDayIndex:(int64_t)a3 tenthPercentileAsleepHeartRateStatistics:(id)a4 tenthPercentileAwakeHeartRateStatistics:(id)a5
{
  id v9;
  id v10;
  HKMCDailyHeartStatistics *v11;
  HKMCDailyHeartStatistics *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKMCDailyHeartStatistics;
  v11 = -[HKMCDailyHeartStatistics init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_dayIndex = a3;
    objc_storeStrong((id *)&v11->_tenthPercentileAsleepHeartRateStatistics, a4);
    objc_storeStrong((id *)&v12->_tenthPercentileAwakeHeartRateStatistics, a5);
  }

  return v12;
}

+ (id)dailyHeartStatisticsWithDayIndex:(int64_t)a3 asleepStatistics:(id)a4 awakeStatistics:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  +[HKMCHeartStatistics heartStatisticsFromStatistics:](HKMCHeartStatistics, "heartStatisticsFromStatistics:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMCHeartStatistics heartStatisticsFromStatistics:](HKMCHeartStatistics, "heartStatisticsFromStatistics:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDayIndex:tenthPercentileAsleepHeartRateStatistics:tenthPercentileAwakeHeartRateStatistics:", a3, v9, v10);
  return v11;
}

- (BOOL)isEmpty
{
  return !self->_tenthPercentileAwakeHeartRateStatistics && self->_tenthPercentileAsleepHeartRateStatistics == 0;
}

- (BOOL)getData:(id *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  id v13;
  id v15;

  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v7;
  *a3 = v9;
  if (v9)
    v10 = v8 == 0;
  else
    v10 = 0;
  v11 = v10;
  if (!v10)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HKMCDailyHeartStatistics getData:error:].cold.1(v12, (uint64_t)self, (uint64_t)v8);
    v13 = v8;
    if (v8)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

  }
  return v11;
}

- (int64_t)bucketIndexForIntervalComponents:(id)a3 anchorDate:(id)a4
{
  return self->_dayIndex;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t dayIndex;
  id v5;

  dayIndex = self->_dayIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", dayIndex, CFSTR("DayIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tenthPercentileAsleepHeartRateStatistics, CFSTR("TenthPercentileAsleepHeartRateStatistics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tenthPercentileAwakeHeartRateStatistics, CFSTR("TenthPercentileAwakeHeartRateStatistics"));

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_dayIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p dayIndex:%@ tenthPercentileAsleepHeartRateStatistics:%@ tenthPercentileAwakeHeartRateStatistics:%@>"), v4, self, v5, self->_tenthPercentileAsleepHeartRateStatistics, self->_tenthPercentileAwakeHeartRateStatistics);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKMCDailyHeartStatistics *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v5 = (HKMCDailyHeartStatistics *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[HKMCDailyHeartStatistics dayIndex](self, "dayIndex");
      if (v6 == -[HKMCDailyHeartStatistics dayIndex](v5, "dayIndex"))
      {
        -[HKMCDailyHeartStatistics tenthPercentileAwakeHeartRateStatistics](self, "tenthPercentileAwakeHeartRateStatistics");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCDailyHeartStatistics tenthPercentileAwakeHeartRateStatistics](v5, "tenthPercentileAwakeHeartRateStatistics");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          -[HKMCDailyHeartStatistics tenthPercentileAsleepHeartRateStatistics](self, "tenthPercentileAsleepHeartRateStatistics", v21, v23);
        }
        else
        {
          -[HKMCDailyHeartStatistics tenthPercentileAwakeHeartRateStatistics](v5, "tenthPercentileAwakeHeartRateStatistics");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            v12 = 0;
LABEL_20:

            goto LABEL_21;
          }
          v3 = (void *)v9;
          -[HKMCDailyHeartStatistics tenthPercentileAwakeHeartRateStatistics](self, "tenthPercentileAwakeHeartRateStatistics");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCDailyHeartStatistics tenthPercentileAwakeHeartRateStatistics](v5, "tenthPercentileAwakeHeartRateStatistics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v11))
          {
            v12 = 0;
LABEL_19:

            goto LABEL_20;
          }
          -[HKMCDailyHeartStatistics tenthPercentileAsleepHeartRateStatistics](self, "tenthPercentileAsleepHeartRateStatistics", v11, v10);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCDailyHeartStatistics tenthPercentileAsleepHeartRateStatistics](v5, "tenthPercentileAsleepHeartRateStatistics");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v13 == (void *)v14)
        {

          v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          -[HKMCDailyHeartStatistics tenthPercentileAsleepHeartRateStatistics](v5, "tenthPercentileAsleepHeartRateStatistics");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            -[HKMCDailyHeartStatistics tenthPercentileAsleepHeartRateStatistics](self, "tenthPercentileAsleepHeartRateStatistics");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKMCDailyHeartStatistics tenthPercentileAsleepHeartRateStatistics](v5, "tenthPercentileAsleepHeartRateStatistics");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v18, "isEqual:", v19);

          }
          else
          {

            v12 = 0;
          }
        }
        v11 = v22;
        v10 = v24;
        if (v7 == v8)
          goto LABEL_20;
        goto LABEL_19;
      }
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_dayIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[HKMCHeartStatistics hash](self->_tenthPercentileAwakeHeartRateStatistics, "hash");
  v6 = v5 ^ -[HKMCHeartStatistics hash](self->_tenthPercentileAsleepHeartRateStatistics, "hash") ^ v4;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tenthPercentileAwakeHeartRateStatistics, 0);
  objc_storeStrong((id *)&self->_tenthPercentileAsleepHeartRateStatistics, 0);
}

- (void)getData:(uint64_t)a3 error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_218A9C000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error archiving data: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
