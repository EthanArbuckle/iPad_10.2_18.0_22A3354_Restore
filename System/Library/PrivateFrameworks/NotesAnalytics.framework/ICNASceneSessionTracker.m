@implementation ICNASceneSessionTracker

- (ICNASceneSessionTracker)initWithSessionTypeEnum:(int64_t)a3
{
  ICNASceneSessionTracker *v4;
  ICNASceneSessionTracker *v5;
  NSDate *lastStartDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICNASceneSessionTracker;
  v4 = -[ICNASceneSessionTracker init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sessionTypeEnum = a3;
    v4->_duration = 0.0;
    lastStartDate = v4->_lastStartDate;
    v4->_lastStartDate = 0;

    v5->_count = 0;
  }
  return v5;
}

- (void)startTimer
{
  id v3;

  if (!-[ICNASceneSessionTracker timerIsOn](self, "timerIsOn"))
  {
    -[ICNASceneSessionTracker setCount:](self, "setCount:", -[ICNASceneSessionTracker count](self, "count") + 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNASceneSessionTracker setLastStartDate:](self, "setLastStartDate:", v3);

  }
}

- (void)endTimer
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  if (-[ICNASceneSessionTracker timerIsOn](self, "timerIsOn"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASceneSessionTracker lastStartDate](self, "lastStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    v6 = v5;
    -[ICNASceneSessionTracker duration](self, "duration");
    -[ICNASceneSessionTracker setDuration:](self, "setDuration:", v6 + v7);

    -[ICNASceneSessionTracker setLastStartDate:](self, "setLastStartDate:", 0);
  }
}

- (id)sessionSummaryItemData
{
  ICASSessionType *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  ICASSessionSummaryArrayItemData *v11;
  void *v12;
  void *v13;
  void *v14;
  ICASSessionSummaryArrayItemData *v15;

  v3 = -[ICASSessionType initWithSessionType:]([ICASSessionType alloc], "initWithSessionType:", -[ICNASceneSessionTracker sessionTypeEnum](self, "sessionTypeEnum"));
  -[ICNASceneSessionTracker duration](self, "duration");
  v5 = v4;
  -[ICNASceneSessionTracker lastStartDate](self, "lastStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASceneSessionTracker lastStartDate](self, "lastStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

  }
  else
  {
    v10 = 0.0;
  }

  v11 = [ICASSessionSummaryArrayItemData alloc];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  ICNARoundTo2SigFigs((v5 + v10) * 1000.0);
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[ICNASceneSessionTracker count](self, "count")));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICASSessionSummaryArrayItemData initWithSessionType:sessionDuration:sessionCount:](v11, "initWithSessionType:sessionDuration:sessionCount:", v3, v13, v14);

  return v15;
}

- (BOOL)timerIsOn
{
  void *v2;
  BOOL v3;

  -[ICNASceneSessionTracker lastStartDate](self, "lastStartDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)sessionTypeEnum
{
  return self->_sessionTypeEnum;
}

- (void)setSessionTypeEnum:(int64_t)a3
{
  self->_sessionTypeEnum = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDate)lastStartDate
{
  return self->_lastStartDate;
}

- (void)setLastStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastStartDate, a3);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStartDate, 0);
}

@end
