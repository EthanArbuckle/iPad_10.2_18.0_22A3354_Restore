@implementation ACHActivityAwardingEnvironment

- (ACHActivityAwardingEnvironment)initWithDataProvider:(id)a3
{
  id v4;
  ACHActivityAwardingEnvironment *v5;
  ACHActivityAwardingEnvironment *v6;
  ACHActivityAwardingDateCache *v7;
  void *v8;
  uint64_t v9;
  ACHActivityAwardingDateCache *dateCache;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACHActivityAwardingEnvironment;
  v5 = -[ACHActivityAwardingEnvironment init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataProvider, v4);
    v7 = [ACHActivityAwardingDateCache alloc];
    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ACHActivityAwardingDateCache initWithCalendar:](v7, "initWithCalendar:", v8);
    dateCache = v6->_dateCache;
    v6->_dateCache = (ACHActivityAwardingDateCache *)v9;

    v6->_experienceType = 3;
  }

  return v6;
}

- (void)setCurrentDateComponents:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACHActivityAwardingEnvironment dateCache](self, "dateCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentDateComponents:", v4);

}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_super v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[ACHActivityAwardingEnvironment valueForKeyLoggingEnabled](self, "valueForKeyLoggingEnabled"))
  {
    v9.receiver = self;
    v9.super_class = (Class)ACHActivityAwardingEnvironment;
    -[ACHActivityAwardingEnvironment valueForKey:](&v9, sel_valueForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ACHLogAwardEngine();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@", buf, 0x16u);
    }

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ACHActivityAwardingEnvironment;
    -[ACHActivityAwardingEnvironment valueForKey:](&v8, sel_valueForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  ACHLogAwardEngine();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ACHActivityAwardingEnvironment valueForUndefinedKey:].cold.1((uint64_t)v3, v4);

  return 0;
}

- (int64_t)todayActivityMoveMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "todayActivitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityMoveMode");

  return v4;
}

- (BOOL)todayIsStandalonePhoneFitnessMode
{
  void *v2;
  void *v3;
  char v4;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "todayActivitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isStandalonePhoneSummary");

  return v4;
}

- (id)todayMoveValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayMoveValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)todayMoveGoal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayMoveGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)yesterdayMoveValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "yesterdayMoveValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)bestMoveValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestMoveValue");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousBestMoveGoal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "bestMoveGoalValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bestMoveGoal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestMoveGoalValue");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)totalDaysOfMoveHistory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalMoveGoalsAttempted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)totalMoveGoalsMet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalMoveGoalsMade"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentMoveStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentMoveStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentWeekMoveStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentWeekMoveStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentMonthMoveStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentMonthMoveStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bestMoveStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestMoveStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousBestMoveStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "bestMoveStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentMovePercentage
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  if (-[ACHActivityAwardingEnvironment todayActivityMoveMode](self, "todayActivityMoveMode") == 2)
    v3 = 3;
  else
    v3 = 0;
  ACHCanonicalUnitForGoalType(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ACHActivityAwardingEnvironment todayActivityMoveMode](self, "todayActivityMoveMode") == 2)
    -[ACHActivityAwardingEnvironment todayMoveTimeValue](self, "todayMoveTimeValue");
  else
    -[ACHActivityAwardingEnvironment todayMoveValue](self, "todayMoveValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = -[ACHActivityAwardingEnvironment todayActivityMoveMode](self, "todayActivityMoveMode");
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 2)
    objc_msgSend(v9, "todayMoveTimeGoal");
  else
    objc_msgSend(v9, "todayMoveGoal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v4);
  v13 = v12;

  if (v13 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 / v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &unk_24D15B678;
  }

  return v14;
}

- (id)previousMovePercentage
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;

  if (-[ACHActivityAwardingEnvironment todayActivityMoveMode](self, "todayActivityMoveMode") == 2)
    v3 = 3;
  else
    v3 = 0;
  ACHCanonicalUnitForGoalType(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACHActivityAwardingEnvironment todayActivityMoveMode](self, "todayActivityMoveMode");
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 2)
    objc_msgSend(v6, "previousProcessedTodayMoveTimeValue");
  else
    objc_msgSend(v6, "previousProcessedTodayMoveValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v4);
  v10 = v9;

  v11 = -[ACHActivityAwardingEnvironment todayActivityMoveMode](self, "todayActivityMoveMode");
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 == 2)
    objc_msgSend(v12, "todayMoveTimeGoal");
  else
    objc_msgSend(v12, "todayMoveGoal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValueForUnit:", v4);
  v16 = v15;

  if (v16 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10 / v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = &unk_24D15B678;
  }

  return v17;
}

- (id)todayAgnosticMoveValue
{
  if (-[ACHActivityAwardingEnvironment todayActivityMoveMode](self, "todayActivityMoveMode") == 2)
    -[ACHActivityAwardingEnvironment todayMoveTimeValue](self, "todayMoveTimeValue");
  else
    -[ACHActivityAwardingEnvironment todayMoveValue](self, "todayMoveValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)todayAgnosticMoveGoal
{
  if (-[ACHActivityAwardingEnvironment todayActivityMoveMode](self, "todayActivityMoveMode") == 2)
    -[ACHActivityAwardingEnvironment todayMoveTimeGoal](self, "todayMoveTimeGoal");
  else
    -[ACHActivityAwardingEnvironment todayMoveGoal](self, "todayMoveGoal");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)todayMoveTimeValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayMoveTimeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)todayMoveTimeGoal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayMoveTimeGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)yesterdayMoveTimeValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "yesterdayMoveTimeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)bestMoveTimeValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestMoveTimeValue");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousBestMoveTimeGoal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "bestMoveTimeGoalValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bestMoveTimeGoal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestMoveTimeGoalValue");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentMoveTimePercentage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  ACHCanonicalUnitForGoalType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingEnvironment todayMoveValue](self, "todayMoveValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "todayMoveGoal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v3);
  v10 = v9;

  if (v10 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6 / v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &unk_24D15B678;
  }

  return v11;
}

- (id)previousMoveTimePercentage
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  ACHCanonicalUnitForGoalType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousProcessedTodayMoveValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v3);
  v7 = v6;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "todayMoveGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v3);
  v11 = v10;

  if (v11 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 / v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &unk_24D15B678;
  }

  return v12;
}

- (id)todayExerciseValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayExerciseValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)todayExerciseGoal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayExerciseGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)yesterdayExerciseValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "yesterdayExerciseValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)bestExerciseValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestExerciseValue");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousBestExerciseGoal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "bestExerciseGoalValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bestExerciseGoal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestExerciseGoalValue");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)totalDaysOfExerciseHistory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalExerciseGoalsAttempted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)totalExerciseGoalsMet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalExerciseGoalsMade"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentExerciseStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentExerciseStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentWeekExerciseStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentWeekExerciseStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bestExerciseStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestExerciseStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousBestExerciseStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "bestExerciseStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentExercisePercentage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  ACHCanonicalUnitForGoalType(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingEnvironment todayExerciseValue](self, "todayExerciseValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "todayExerciseGoal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v3);
  v10 = v9;

  if (v10 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6 / v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &unk_24D15B678;
  }

  return v11;
}

- (id)previousExercisePercentage
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  ACHCanonicalUnitForGoalType(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousProcessedTodayExerciseValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v3);
  v7 = v6;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "todayExerciseGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v3);
  v11 = v10;

  if (v11 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 / v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &unk_24D15B678;
  }

  return v12;
}

- (id)todayStandValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayStandValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)todayStandGoal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayStandGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)yesterdayStandValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ACHCanonicalUnitForGoalType(2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "yesterdayStandValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)bestStandValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousBestStandGoal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandGoalValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bestStandGoal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandGoalValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)totalDaysOfStandHistory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalStandGoalsAttempted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)totalStandGoalsMet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalStandGoalsMade"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentStandStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentStandStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentWeekStandStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentWeekStandStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bestStandStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousBestStandStreak
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandStreak"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentStandPercentage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  ACHCanonicalUnitForGoalType(2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingEnvironment todayStandValue](self, "todayStandValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "todayStandGoal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v3);
  v10 = v9;

  if (v10 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6 / v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &unk_24D15B678;
  }

  return v11;
}

- (id)previousStandPercentage
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  ACHCanonicalUnitForGoalType(2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousProcessedTodayStandValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v3);
  v7 = v6;

  -[ACHActivityAwardingEnvironment dataProvider](self, "dataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "todayStandGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v3);
  v11 = v10;

  if (v11 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 / v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &unk_24D15B678;
  }

  return v12;
}

- (id)currentStreakForAllActivity
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  -[ACHActivityAwardingEnvironment currentMoveStreak](self, "currentMoveStreak");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[ACHActivityAwardingEnvironment currentExerciseStreak](self, "currentExerciseStreak");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v4 >= v6)
    v4 = v6;
  -[ACHActivityAwardingEnvironment currentStandStreak](self, "currentStandStreak");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v4 >= v8)
    v9 = v8;
  else
    v9 = v4;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
}

- (id)currentWeekStreakForAllActivity
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  -[ACHActivityAwardingEnvironment currentWeekMoveStreak](self, "currentWeekMoveStreak");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[ACHActivityAwardingEnvironment currentWeekExerciseStreak](self, "currentWeekExerciseStreak");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v4 >= v6)
    v4 = v6;
  -[ACHActivityAwardingEnvironment currentWeekStandStreak](self, "currentWeekStandStreak");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v4 >= v8)
    v9 = v8;
  else
    v9 = v4;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
}

- (id)dayOfWeekForToday
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingEnvironment dateCache](self, "dateCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dayOfWeekForToday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dayOfWeekForLastDayOfFitnessWeek
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingEnvironment dateCache](self, "dateCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dayOfWeekForLastDayOfFitnessWeek");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)numberOfDaysInThisMonth
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingEnvironment dateCache](self, "dateCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberOfDaysInThisMonth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dayOfMonthForToday
{
  void *v2;
  void *v3;

  -[ACHActivityAwardingEnvironment dateCache](self, "dateCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dayOfMonthForToday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)requiredDaysOfActivityHistoryForRecords
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE01570]);
}

- (id)requiredDaysOfActivityHistoryForStreaks
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE01578]);
}

- (ACHActivityAwardingDataProvider)dataProvider
{
  return (ACHActivityAwardingDataProvider *)objc_loadWeakRetained((id *)&self->_dataProvider);
}

- (void)setDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_dataProvider, a3);
}

- (BOOL)valueForKeyLoggingEnabled
{
  return self->_valueForKeyLoggingEnabled;
}

- (void)setValueForKeyLoggingEnabled:(BOOL)a3
{
  self->_valueForKeyLoggingEnabled = a3;
}

- (unint64_t)experienceType
{
  return self->_experienceType;
}

- (void)setExperienceType:(unint64_t)a3
{
  self->_experienceType = a3;
}

- (ACHActivityAwardingDateCache)dateCache
{
  return self->_dateCache;
}

- (void)setDateCache:(id)a3
{
  objc_storeStrong((id *)&self->_dateCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_21407B000, a2, OS_LOG_TYPE_FAULT, "Activity Awarding environment asked for key it doesn't support: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
