@implementation ICDebugTimer

+ (id)debugTimerForClass:(Class)a3
{
  if (objc_msgSend((id)enabledTimers, "containsObject:", a3))
    return objc_alloc_init(ICDebugTimer);
  else
    return 0;
}

+ (void)enableTimersForClass:(Class)a3
{
  if (enableTimersForClass__onceToken != -1)
    dispatch_once(&enableTimersForClass__onceToken, &__block_literal_global_4);
  objc_msgSend((id)enabledTimers, "addObject:", a3);
}

void __37__ICDebugTimer_enableTimersForClass___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)enabledTimers;
  enabledTimers = v0;

}

- (void)start
{
  id v3;

  -[ICDebugTimer setElapsedTime:](self, "setElapsedTime:", 0.0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDebugTimer setStartingDate:](self, "setStartingDate:", v3);

}

- (void)pause
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[ICDebugTimer startingDate](self, "startingDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;
  -[ICDebugTimer elapsedTime](self, "elapsedTime");
  -[ICDebugTimer setElapsedTime:](self, "setElapsedTime:", v6 - v5);

  -[ICDebugTimer setStartingDate:](self, "setStartingDate:", 0);
}

- (void)resume
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDebugTimer setStartingDate:](self, "setStartingDate:", v3);

}

- (void)stop
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[ICDebugTimer startingDate](self, "startingDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;
  -[ICDebugTimer elapsedTime](self, "elapsedTime");
  -[ICDebugTimer setElapsedTime:](self, "setElapsedTime:", v6 - v5);

  -[ICDebugTimer setStartingDate:](self, "setStartingDate:", 0);
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (NSDate)startingDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartingDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingDate, 0);
}

@end
