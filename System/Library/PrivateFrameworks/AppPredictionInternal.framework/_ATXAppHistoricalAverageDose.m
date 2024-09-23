@implementation _ATXAppHistoricalAverageDose

- (_ATXAppHistoricalAverageDose)initWith:(id)a3 endDate:(id)a4 timeZone:(id)a5 alpha:(double)a6
{
  id v10;
  id v11;
  id v12;
  _ATXAppHistoricalAverageDose *v13;
  _ATXAppHistoricalAverageDose *v14;
  uint64_t v15;
  NSDate *currentDay;
  double v17;
  _ATXMovingAverage *v18;
  _ATXMovingAverage *movingAverage;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_ATXAppHistoricalAverageDose;
  v13 = -[_ATXAppHistoricalAverageDose init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_timeZone, a5);
    +[ATXTimeUtil getDayFromTime:timeZone:](ATXTimeUtil, "getDayFromTime:timeZone:", v10, v14->_timeZone);
    v15 = objc_claimAutoreleasedReturnValue();
    currentDay = v14->_currentDay;
    v14->_currentDay = (NSDate *)v15;

    objc_msgSend(v11, "timeIntervalSinceDate:", v10);
    v14->_currentDuration = v17;
    v18 = -[_ATXMovingAverage initWithAlpha:]([_ATXMovingAverage alloc], "initWithAlpha:", a6);
    movingAverage = v14->_movingAverage;
    v14->_movingAverage = v18;

    v14->_dayCount = 0;
  }

  return v14;
}

- (void)addDuration:(id)a3 endDate:(id)a4
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  +[ATXTimeUtil getDayFromTime:timeZone:](ATXTimeUtil, "getDayFromTime:timeZone:", v13, self->_timeZone);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v13);
  v10 = v9;
  if (objc_msgSend(v8, "isEqual:", self->_currentDay))
  {
    self->_currentDuration = v10 + self->_currentDuration;
LABEL_7:

    return;
  }
  if (objc_msgSend(v8, "compare:", self->_currentDay) == 1)
  {
    while (objc_msgSend(v8, "compare:", self->_currentDay) == 1)
      -[_ATXAppHistoricalAverageDose _finishCurrentDay](self, "_finishCurrentDay");
    self->_currentDuration = v10;
    goto LABEL_7;
  }
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild") & 1) != 0
    || +[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:", 0.0001))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LaunchDay is %@, which is earlier than currentDay: %@ - Time Zone: %@"), v8, self->_currentDay, self->_timeZone);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppDailyDose.m"), 92, CFSTR("LaunchDay is %@, which is earlier than currentDay: %@"), v8, self->_currentDay);

  __break(1u);
}

- (void)skipTo:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "compare:", self->_currentDay) == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppDailyDose.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[day compare:_currentDay] != NSOrderedAscending"));

  }
  while (objc_msgSend(v6, "compare:", self->_currentDay) == 1)
    -[_ATXAppHistoricalAverageDose _finishCurrentDay](self, "_finishCurrentDay");

}

- (void)_updateMovingAverageForOneDay:(double)a3
{
  -[_ATXMovingAverage addElement:](self->_movingAverage, "addElement:", a3);
}

- (void)_finishCurrentDay
{
  NSDate *v3;
  NSDate *currentDay;

  -[_ATXAppHistoricalAverageDose _updateMovingAverageForOneDay:](self, "_updateMovingAverageForOneDay:", self->_currentDuration);
  +[ATXTimeUtil nextStartOfDayAfter:timeZone:](ATXTimeUtil, "nextStartOfDayAfter:timeZone:", self->_currentDay, self->_timeZone);
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentDay = self->_currentDay;
  self->_currentDay = v3;

  self->_currentDuration = 0.0;
}

- (_ATXMovingAverage)movingAverage
{
  return self->_movingAverage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movingAverage, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_currentDay, 0);
}

@end
