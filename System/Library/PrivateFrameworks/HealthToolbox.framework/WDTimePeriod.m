@implementation WDTimePeriod

- (id)sleep_titleString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDTimePeriod startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDTimePeriod endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compareDate:toDate:toUnitGranularity:", v4, v3, 4);

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 | objc_msgSend(v8, "compareDate:toDate:toUnitGranularity:", v5, v3, 4);

  if (v9)
    objc_msgSend(MEMORY[0x24BDD1510], "hk_dayIntervalFormatter");
  else
    objc_msgSend(MEMORY[0x24BDD1510], "hk_mediumMonthDayDateIntervalFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:toDate:", v4, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)sleep_timePeriodForSample:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSleepStartDateForDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[WDTimePeriod timePeriodWithStartDate:endDate:](WDTimePeriod, "timePeriodWithStartDate:endDate:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (WDTimePeriod)timePeriodWithStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  WDTimePeriod *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(WDTimePeriod);
  -[WDTimePeriod setStartDate:](v7, "setStartDate:", v6);

  -[WDTimePeriod setEndDate:](v7, "setEndDate:", v5);
  return v7;
}

+ (WDTimePeriod)timePeriodWithSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "timePeriodWithStartDate:endDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (WDTimePeriod *)v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_startDate, "hash");
  return -[NSDate hash](self->_endDate, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  WDTimePeriod *v4;
  char v5;

  v4 = (WDTimePeriod *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  if (v4 == self)
  {
    v5 = 1;
    goto LABEL_7;
  }
  if (-[NSDate isEqual:](self->_startDate, "isEqual:", v4->_startDate))
    v5 = -[NSDate isEqual:](self->_endDate, "isEqual:", v4->_endDate);
  else
LABEL_5:
    v5 = 0;
LABEL_7:

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), self->_startDate, self->_endDate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDTimePeriod *v4;

  v4 = -[WDTimePeriod init](+[WDTimePeriod allocWithZone:](WDTimePeriod, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_startDate, self->_startDate);
  objc_storeStrong((id *)&v4->_endDate, self->_endDate);
  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
