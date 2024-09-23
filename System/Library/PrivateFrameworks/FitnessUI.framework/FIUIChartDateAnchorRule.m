@implementation FIUIChartDateAnchorRule

- (id)generateAnchorFromDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[FIUIChartDateAnchorRule _floorDate:](self, "_floorDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartDateAnchorRule _anchorDiffComponents](self, "_anchorDiffComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 252, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[FIUIChartDateAnchorRule _componentsSuccessful:](self, "_componentsSuccessful:", v7))
  {
    v8 = v4;
    v9 = v7;
  }
  else
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v5, v4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:", 252, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v9;
      v4 = v8;
    }
    while (!-[FIUIChartDateAnchorRule _componentsSuccessful:](self, "_componentsSuccessful:", v9));
  }

  return v8;
}

- (void)setCalendarUnit:(unint64_t)a3
{
  if ((a3 & 0xFC) == 0)
    -[FIUIChartDateAnchorRule setCalendarUnit:].cold.1();
  self->_calendarUnit = a3;
}

- (id)_floorDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int64_t calendarUnit;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDBCE48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 252, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  calendarUnit = self->_calendarUnit;
  if (calendarUnit <= 15)
  {
    if (calendarUnit == 4)
    {
      objc_msgSend(v7, "setSecond:", 0);
      objc_msgSend(v7, "setMinute:", 0);
      objc_msgSend(v7, "setHour:", 0);
      objc_msgSend(v7, "setDay:", 1);
      objc_msgSend(v7, "setMonth:", 1);
    }
    else if (calendarUnit == 8)
    {
      objc_msgSend(v7, "setSecond:", 0);
      objc_msgSend(v7, "setMinute:", 0);
      objc_msgSend(v7, "setHour:", 0);
      objc_msgSend(v7, "setDay:", 1);
    }
  }
  else
  {
    switch(calendarUnit)
    {
      case 16:
        objc_msgSend(v7, "setSecond:", 0);
        objc_msgSend(v7, "setMinute:", 0);
        objc_msgSend(v7, "setHour:", 0);
        break;
      case 32:
        objc_msgSend(v7, "setSecond:", 0);
        objc_msgSend(v7, "setMinute:", 0);
        break;
      case 64:
        objc_msgSend(v7, "setSecond:", 0);
        break;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_anchorDiffComponents
{
  id v3;
  void *v4;
  int64_t calendarUnit;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  v4 = v3;
  calendarUnit = self->_calendarUnit;
  if (calendarUnit > 31)
  {
    switch(calendarUnit)
    {
      case 32:
        objc_msgSend(v3, "setHour:", -1);
        break;
      case 64:
        objc_msgSend(v3, "setMinute:", -1);
        break;
      case 128:
        objc_msgSend(v3, "setSecond:", -1);
        break;
    }
  }
  else
  {
    switch(calendarUnit)
    {
      case 4:
        objc_msgSend(v3, "setYear:", -1);
        break;
      case 8:
        objc_msgSend(v3, "setMonth:", -1);
        break;
      case 16:
        objc_msgSend(v3, "setDay:", -1);
        break;
    }
  }
  return v4;
}

- (BOOL)_componentsSuccessful:(id)a3
{
  id v4;
  int64_t calendarUnit;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  calendarUnit = self->_calendarUnit;
  v6 = -1;
  if (calendarUnit > 31)
  {
    switch(calendarUnit)
    {
      case 32:
        v6 = objc_msgSend(v4, "hour");
        break;
      case 64:
        v6 = objc_msgSend(v4, "minute");
        break;
      case 128:
        v6 = objc_msgSend(v4, "second");
        break;
    }
  }
  else
  {
    switch(calendarUnit)
    {
      case 4:
        v6 = objc_msgSend(v4, "year");
        break;
      case 8:
        v6 = objc_msgSend(v4, "month");
        break;
      case 16:
        v6 = objc_msgSend(v4, "day");
        break;
    }
  }
  v7 = v6 % self->_roundingValue == 0;

  return v7;
}

- (unint64_t)calendarUnit
{
  return self->_calendarUnit;
}

- (int64_t)roundingValue
{
  return self->_roundingValue;
}

- (void)setRoundingValue:(int64_t)a3
{
  self->_roundingValue = a3;
}

- (void)setCalendarUnit:.cold.1()
{
  __assert_rtn("-[FIUIChartDateAnchorRule setCalendarUnit:]", "FIUIChartDateAnchorRule.m", 30, "(component & kNLAxisDescriptorAnchorRuleDateComponentBitmask) > 0 && \"Unexpected calendar unit\");
}

@end
