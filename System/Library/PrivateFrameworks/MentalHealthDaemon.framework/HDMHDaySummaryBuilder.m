@implementation HDMHDaySummaryBuilder

- (HDMHDaySummaryBuilder)initWithDayIndex:(int64_t)a3 gregorianCalendar:(id)a4
{
  id v7;
  HDMHDaySummaryBuilder *v8;
  HDMHDaySummaryBuilder *v9;
  uint64_t v10;
  NSMutableArray *momentaryStatesOfMind;
  HKStateOfMind *lastDailyStateOfMind;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMHDaySummaryBuilder;
  v8 = -[HDMHDaySummaryBuilder init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_dayIndex = a3;
    objc_storeStrong((id *)&v8->_gregorianCalendar, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    momentaryStatesOfMind = v9->_momentaryStatesOfMind;
    v9->_momentaryStatesOfMind = (NSMutableArray *)v10;

    lastDailyStateOfMind = v9->_lastDailyStateOfMind;
    v9->_lastDailyStateOfMind = 0;

  }
  return v9;
}

- (void)addStateOfMind:(id)a3
{
  HKStateOfMind **p_lastDailyStateOfMind;
  HKStateOfMind *lastDailyStateOfMind;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "reflectiveInterval") == 2)
  {
    lastDailyStateOfMind = self->_lastDailyStateOfMind;
    p_lastDailyStateOfMind = &self->_lastDailyStateOfMind;
    if (!lastDailyStateOfMind
      || (objc_msgSend(v10, "startDate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HKStateOfMind startDate](*p_lastDailyStateOfMind, "startDate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "hk_isAfterOrEqualToDate:", v8),
          v8,
          v7,
          v9))
    {
      objc_storeStrong((id *)p_lastDailyStateOfMind, a3);
    }
  }
  else
  {
    -[NSMutableArray addObject:](self->_momentaryStatesOfMind, "addObject:", v10);
  }

}

- (id)daySummary
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE65DA8]), "initWithDayIndex:momentaryStatesOfMind:dailyStateOfMind:", self->_dayIndex, self->_momentaryStatesOfMind, self->_lastDailyStateOfMind);
}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_lastDailyStateOfMind, 0);
  objc_storeStrong((id *)&self->_momentaryStatesOfMind, 0);
}

@end
