@implementation CRKExecutionTimer

+ (id)startedTimerWithDescription:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescription:", v4);

  objc_msgSend(v5, "start");
  return v5;
}

- (CRKExecutionTimer)initWithDescription:(id)a3
{
  id v4;
  CRKExecutionTimer *v5;
  uint64_t v6;
  NSString *timerDescription;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKExecutionTimer;
  v5 = -[CRKExecutionTimer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timerDescription = v5->_timerDescription;
    v5->_timerDescription = (NSString *)v6;

  }
  return v5;
}

- (void)start
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CRKExecutionTimer startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKExecutionTimer startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExecutionTimer.m"), 37, CFSTR("Timer was already started at %@"), v6);

  }
  v7 = (id)objc_opt_new();
  -[CRKExecutionTimer setStartDate:](self, "setStartDate:", v7);

}

- (id)stop
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  -[CRKExecutionTimer endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKExecutionTimer endDate](self, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExecutionTimer.m"), 42, CFSTR("Timer was already stopped at %@"), v15);

  }
  v5 = (void *)objc_opt_new();
  -[CRKExecutionTimer setEndDate:](self, "setEndDate:", v5);

  -[CRKExecutionTimer endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKExecutionTimer startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[CRKExecutionTimer timerDescription](self, "timerDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("'%@' took %.2f seconds"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)timerDescription
{
  return self->_timerDescription;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timerDescription, 0);
}

@end
