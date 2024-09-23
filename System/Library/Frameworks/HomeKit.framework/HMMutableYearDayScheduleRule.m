@implementation HMMutableYearDayScheduleRule

- (void)setValidFrom:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMMutableYearDayScheduleRule setStartDate:](self, "setStartDate:", v4);
  -[HMMutableYearDayScheduleRule endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  if (v5)
    -[HMMutableYearDayScheduleRule endDate](self, "endDate");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v4, v8);

  -[HMYearDayScheduleRule setDateInterval:](self, "setDateInterval:", v7);
}

- (void)setValidUntil:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMMutableYearDayScheduleRule setEndDate:](self, "setEndDate:", v4);
  -[HMMutableYearDayScheduleRule startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  if (v5)
    -[HMMutableYearDayScheduleRule startDate](self, "startDate");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v8, v4);

  -[HMYearDayScheduleRule setDateInterval:](self, "setDateInterval:", v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMYearDayScheduleRule *v4;
  void *v5;
  HMYearDayScheduleRule *v6;

  v4 = +[HMYearDayScheduleRule allocWithZone:](HMYearDayScheduleRule, "allocWithZone:", a3);
  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMYearDayScheduleRule initWithDateInterval:](v4, "initWithDateInterval:", v5);

  return v6;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
