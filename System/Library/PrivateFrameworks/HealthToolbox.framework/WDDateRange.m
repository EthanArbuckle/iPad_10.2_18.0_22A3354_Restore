@implementation WDDateRange

+ (id)dateRangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartDate:endDate:", v7, v6);

  return v8;
}

+ (id)dateRangeWithTimePeriod:(int64_t)a3 anchorDate:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimePeriod:anchorDate:", a3, v6);

  return v7;
}

- (WDDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  WDDateRange *v9;
  WDDateRange *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[WDDateRange init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

- (WDDateRange)initWithTimePeriod:(int64_t)a3 anchorDate:(id)a4
{
  id v6;
  WDDateRange *v7;
  WDDateRange *v8;
  uint64_t v9;
  NSDate *startDate;
  uint64_t v11;
  NSDate *endDate;

  v6 = a4;
  v7 = -[WDDateRange init](self, "init");
  v8 = v7;
  if (v7)
  {
    -[WDDateRange _getStartDateFromAnchorDate:timePeriod:](v7, "_getStartDateFromAnchorDate:timePeriod:", v6, a3);
    v9 = objc_claimAutoreleasedReturnValue();
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v9;

    -[WDDateRange _getEndDateFromStartDate:timePeriod:](v8, "_getEndDateFromStartDate:timePeriod:", v8->_startDate, a3);
    v11 = objc_claimAutoreleasedReturnValue();
    endDate = v8->_endDate;
    v8->_endDate = (NSDate *)v11;

  }
  return v8;
}

- (BOOL)dateInRange:(id)a3
{
  NSDate *startDate;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  startDate = self->_startDate;
  v5 = a3;
  -[NSDate timeIntervalSinceReferenceDate](startDate, "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v11 = v10;

  return v11 <= v9 && v7 <= v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSDate description](self->_startDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_endDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("WDDateRange(%@ %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_getStartDateFromAnchorDate:(id)a3 timePeriod:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v5 = (void *)MEMORY[0x24BDBCE48];
  v6 = a3;
  objc_msgSend(v5, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 8716, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHour:", 0);
  objc_msgSend(v8, "setMinute:", 0);
  objc_msgSend(v8, "setSecond:", 0);
  switch(a4)
  {
    case 0:
      goto LABEL_5;
    case 1:
      objc_msgSend(v8, "setWeekday:", 1);
      goto LABEL_5;
    case 2:
      objc_msgSend(v8, "setDay:", 1);
LABEL_5:
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateFromComponents:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 3:
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateFromComponents:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v12, "setMonth:", -2);
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = v12;
      v16 = v10;
      goto LABEL_15;
    case 4:
      v17 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      v10 = v17;
      v18 = -5;
      goto LABEL_14;
    case 5:
      v17 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      v10 = v17;
      goto LABEL_13;
    case 6:
      v19 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      v10 = v19;
      v20 = -1;
      goto LABEL_12;
    case 7:
      v19 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      v10 = v19;
      v20 = -4;
      goto LABEL_12;
    case 8:
      v19 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      v10 = v19;
      v20 = -9;
LABEL_12:
      objc_msgSend(v19, "setYear:", v20);
      v17 = v10;
LABEL_13:
      v18 = -11;
LABEL_14:
      objc_msgSend(v17, "setMonth:", v18);
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v15 = v10;
      v16 = v14;
LABEL_15:
      objc_msgSend(v13, "dateByAddingComponents:toDate:options:", v15, v16, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (id)_getEndDateFromStartDate:(id)a3 timePeriod:(int64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x24BDBCE68];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v8 = v7;
  switch(a4)
  {
    case 0:
      objc_msgSend(v7, "setDay:", 1);
      break;
    case 1:
      objc_msgSend(v7, "setWeekOfYear:", 1);
      break;
    case 2:
      v9 = 1;
      goto LABEL_7;
    case 3:
      v9 = 3;
      goto LABEL_7;
    case 4:
      v9 = 6;
LABEL_7:
      objc_msgSend(v7, "setMonth:", v9);
      break;
    case 5:
      v10 = 1;
      goto LABEL_12;
    case 6:
      v10 = 2;
      goto LABEL_12;
    case 7:
      v10 = 5;
      goto LABEL_12;
    case 8:
      v10 = 10;
LABEL_12:
      objc_msgSend(v7, "setYear:", v10);
      break;
    default:
      break;
  }
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v8, v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
