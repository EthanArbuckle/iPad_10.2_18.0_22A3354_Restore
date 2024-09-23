@implementation ACHActivityAwardingDateCache

- (ACHActivityAwardingDateCache)initWithCalendar:(id)a3
{
  id v5;
  ACHActivityAwardingDateCache *v6;
  ACHActivityAwardingDateCache *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACHActivityAwardingDateCache;
  v6 = -[ACHActivityAwardingDateCache init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_calendar, a3);

  return v7;
}

- (void)_clearDateVariables
{
  NSNumber *dayOfWeekForToday;
  NSNumber *numberOfDaysInThisMonth;
  NSNumber *dayOfMonthForToday;

  dayOfWeekForToday = self->_dayOfWeekForToday;
  self->_dayOfWeekForToday = 0;

  numberOfDaysInThisMonth = self->_numberOfDaysInThisMonth;
  self->_numberOfDaysInThisMonth = 0;

  dayOfMonthForToday = self->_dayOfMonthForToday;
  self->_dayOfMonthForToday = 0;

}

- (void)setCurrentDateComponents:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_currentDateComponents, a3);
  if (self->_currentDateComponents)
  {
    -[ACHActivityAwardingDateCache calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromComponents:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHActivityAwardingDateCache setCurrentDate:](self, "setCurrentDate:", v6);

  }
  else
  {
    -[ACHActivityAwardingDateCache setCurrentDate:](self, "setCurrentDate:", 0);
  }
  -[ACHActivityAwardingDateCache _clearDateVariables](self, "_clearDateVariables");

}

- (NSNumber)dayOfWeekForToday
{
  NSNumber *dayOfWeekForToday;
  void *v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;

  dayOfWeekForToday = self->_dayOfWeekForToday;
  if (!dayOfWeekForToday)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[ACHActivityAwardingDateCache calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHActivityAwardingDateCache currentDate](self, "currentDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "component:fromDate:", 512, v6));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_dayOfWeekForToday;
    self->_dayOfWeekForToday = v7;

    dayOfWeekForToday = self->_dayOfWeekForToday;
  }
  return dayOfWeekForToday;
}

- (NSNumber)dayOfWeekForLastDayOfFitnessWeek
{
  NSNumber *dayOfWeekForLastDayOfFitnessWeek;
  NSNumber *v4;
  NSNumber *v5;

  dayOfWeekForLastDayOfFitnessWeek = self->_dayOfWeekForLastDayOfFitnessWeek;
  if (!dayOfWeekForLastDayOfFitnessWeek)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", MEMORY[0x2199C8740](0, a2));
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dayOfWeekForLastDayOfFitnessWeek;
    self->_dayOfWeekForLastDayOfFitnessWeek = v4;

    dayOfWeekForLastDayOfFitnessWeek = self->_dayOfWeekForLastDayOfFitnessWeek;
  }
  return dayOfWeekForLastDayOfFitnessWeek;
}

- (NSNumber)numberOfDaysInThisMonth
{
  NSNumber *numberOfDaysInThisMonth;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSNumber *v8;
  NSNumber *v9;

  numberOfDaysInThisMonth = self->_numberOfDaysInThisMonth;
  if (!numberOfDaysInThisMonth)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[ACHActivityAwardingDateCache calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHActivityAwardingDateCache currentDate](self, "currentDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rangeOfUnit:inUnit:forDate:", 16, 8, v6);
    objc_msgSend(v4, "numberWithUnsignedInteger:", v7);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_numberOfDaysInThisMonth;
    self->_numberOfDaysInThisMonth = v8;

    numberOfDaysInThisMonth = self->_numberOfDaysInThisMonth;
  }
  return numberOfDaysInThisMonth;
}

- (NSNumber)dayOfMonthForToday
{
  NSNumber *dayOfMonthForToday;
  void *v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;

  dayOfMonthForToday = self->_dayOfMonthForToday;
  if (!dayOfMonthForToday)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[ACHActivityAwardingDateCache calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHActivityAwardingDateCache currentDate](self, "currentDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "component:fromDate:", 16, v6));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_dayOfMonthForToday;
    self->_dayOfMonthForToday = v7;

    dayOfMonthForToday = self->_dayOfMonthForToday;
  }
  return dayOfMonthForToday;
}

- (NSDateComponents)currentDateComponents
{
  return self->_currentDateComponents;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_currentDateComponents, 0);
  objc_storeStrong((id *)&self->_dayOfMonthForToday, 0);
  objc_storeStrong((id *)&self->_numberOfDaysInThisMonth, 0);
  objc_storeStrong((id *)&self->_dayOfWeekForLastDayOfFitnessWeek, 0);
  objc_storeStrong((id *)&self->_dayOfWeekForToday, 0);
}

@end
