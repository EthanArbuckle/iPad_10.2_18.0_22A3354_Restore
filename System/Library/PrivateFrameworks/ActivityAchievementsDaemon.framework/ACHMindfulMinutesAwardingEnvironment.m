@implementation ACHMindfulMinutesAwardingEnvironment

- (ACHMindfulMinutesAwardingEnvironment)initWithHealthStore:(id)a3 workoutClient:(id)a4 calendar:(id)a5 currentDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ACHMindfulMinutesAwardingEnvironment *v14;
  ACHMindfulMinutesAwardingEnvironment *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ACHMindfulMinutesAwardingEnvironment;
  v14 = -[ACHMindfulMinutesAwardingEnvironment init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_calendar, a5);
    objc_storeWeak((id *)&v15->_healthStore, v10);
    objc_storeStrong((id *)&v15->_currentDate, a6);
    objc_storeWeak((id *)&v15->_workoutClient, v11);
  }

  return v15;
}

- (double)todayMindfulMinutesValue
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[ACHMindfulMinutesAwardingEnvironment _dayDateIntervalForCurrentDate](self, "_dayDateIntervalForCurrentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  v13 = 0;
  objc_msgSend(WeakRetained, "mindfulMinutesForForDateInterval:error:", v3, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v6)
  {
    ACHLogAwardEngine();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingEnvironment] Failed to compute todayMindfulMinutesValue: %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v9);
  v11 = v10;

  return v11;
}

- (double)numberOfMindfulMinutesInCurrentMonth
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[ACHMindfulMinutesAwardingEnvironment _monthDateIntervalForCurrentDate](self, "_monthDateIntervalForCurrentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  v13 = 0;
  objc_msgSend(WeakRetained, "mindfulMinutesForForDateInterval:error:", v3, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v6)
  {
    ACHLogAwardEngine();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingEnvironment] Failed to compute numberOfMindfulMinutesInCurrentMonth: %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v9);
  v11 = v10;

  return v11;
}

- (void)logValues
{
  NSObject *v3;
  NSDate *currentDate;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSDate *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  ACHLogAwardEngine();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentDate = self->_currentDate;
    -[ACHMindfulMinutesAwardingEnvironment todayMindfulMinutesValue](self, "todayMindfulMinutesValue");
    v6 = v5;
    -[ACHMindfulMinutesAwardingEnvironment numberOfMindfulMinutesInCurrentMonth](self, "numberOfMindfulMinutesInCurrentMonth");
    v8 = 138412802;
    v9 = currentDate;
    v10 = 2048;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingEnvironment] currentDate: %@, todayMindfulMinutesValue: %f, numberOfMindfulMinutesInCurrentMonth: %f", (uint8_t *)&v8, 0x20u);
  }

}

- (id)_dayDateIntervalForCurrentDate
{
  void *v3;
  void *v4;
  void *v5;

  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 28, self->_currentDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v4, self->_currentDate);

  return v5;
}

- (id)_monthDateIntervalForCurrentDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 28, self->_currentDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "year");
  objc_msgSend(v3, "month");
  ACHDateComponentsForYearMonthDay();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v5, self->_currentDate);

  return v6;
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_loadWeakRetained((id *)&self->_healthStore);
}

- (void)setHealthStore:(id)a3
{
  objc_storeWeak((id *)&self->_healthStore, a3);
}

- (ACHAwardsWorkoutClient)workoutClient
{
  return (ACHAwardsWorkoutClient *)objc_loadWeakRetained((id *)&self->_workoutClient);
}

- (void)setWorkoutClient:(id)a3
{
  objc_storeWeak((id *)&self->_workoutClient, a3);
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
  objc_destroyWeak((id *)&self->_workoutClient);
  objc_destroyWeak((id *)&self->_healthStore);
}

@end
