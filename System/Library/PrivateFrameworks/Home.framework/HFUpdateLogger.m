@implementation HFUpdateLogger

- (OS_os_activity)loggerActivity
{
  return self->_loggerActivity;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUpdateLogger clientDescription](self, "clientDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> \"%@\"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)clientDescription
{
  return self->_clientDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_loggerActivity, 0);
  objc_storeStrong((id *)&self->_clientDescription, 0);
}

- (void)finish
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  os_activity_scope_state_s state;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HFUpdateLogger softTimeoutTimer](self, "softTimeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUpdateLogger startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (self)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    -[HFUpdateLogger loggerActivity](self, "loggerActivity");
    v8 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v8, &state);

    HFLogForCategory(0x29uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v7;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Update finished in %f seconds", (uint8_t *)&v12, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(state.opaque[0]) = 134217984;
      *(uint64_t *)((char *)state.opaque + 4) = v7;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Update finished in %f seconds", (uint8_t *)&state, 0xCu);
    }

  }
  +[HFUpdateLoggerDebuggingController _sharedInstance](HFUpdateLoggerDebuggingController, "_sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_removeRunningLogger:", self);

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSTimer)softTimeoutTimer
{
  return self->_softTimeoutTimer;
}

- (HFUpdateLogger)initWithTimeout:(double)a3 description:(id)a4
{
  id v6;
  HFUpdateLogger *v7;
  void *v8;
  os_activity_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_activity_scope_state_s v15;
  objc_super v16;
  uint8_t buf[4];
  HFUpdateLogger *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFUpdateLogger;
  v7 = -[HFUpdateLogger init](&v16, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFUpdateLogger setStartDate:](v7, "setStartDate:", v8);

    -[HFUpdateLogger setClientDescription:](v7, "setClientDescription:", v6);
    v9 = _os_activity_create(&dword_1DD34E000, "HFUpdateLogger", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    -[HFUpdateLogger setLoggerActivity:](v7, "setLoggerActivity:", v9);

    -[HFUpdateLogger setSoftTimeoutInterval:](v7, "setSoftTimeoutInterval:", a3);
    if (a3 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v7, sel__handleTimeout_, 0, 0, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFUpdateLogger setSoftTimeoutTimer:](v7, "setSoftTimeoutTimer:", v10);

    }
    +[HFUpdateLoggerDebuggingController _sharedInstance](HFUpdateLoggerDebuggingController, "_sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_addRunningLogger:", v7);

    -[HFUpdateLogger loggerActivity](v7, "loggerActivity", 0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v12, &v15);

    HFLogForCategory(0x29uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "%@: Starting log for: %@", buf, 0x16u);
    }

    os_activity_scope_leave(&v15);
  }

  return v7;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setSoftTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_softTimeoutTimer, a3);
}

- (void)setSoftTimeoutInterval:(double)a3
{
  self->_softTimeoutInterval = a3;
}

- (void)setLoggerActivity:(id)a3
{
  objc_storeStrong((id *)&self->_loggerActivity, a3);
}

- (void)setClientDescription:(id)a3
{
  objc_storeStrong((id *)&self->_clientDescription, a3);
}

+ (id)runningLoggers
{
  void *v2;
  void *v3;

  +[HFUpdateLoggerDebuggingController _sharedInstance](HFUpdateLoggerDebuggingController, "_sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_runningLoggers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)history
{
  void *v2;
  void *v3;
  void *v4;

  +[HFUpdateLoggerDebuggingController _sharedInstance](HFUpdateLoggerDebuggingController, "_sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_historyStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_handleTimeout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  HFUpdateLogger *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HFUpdateLogger softTimeoutTimer](self, "softTimeoutTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[HFUpdateLogger setDidReachSoftTimeout:](self, "setDidReachSoftTimeout:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUpdateLogger startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  if (self)
  {
    -[HFUpdateLogger loggerActivity](self, "loggerActivity", 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v9, &v12);

    HFLogForCategory(0x29uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      v15 = 2048;
      v16 = v8;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "%@: Soft timeout reached after %f seconds. The update will continue until it completes.", buf, 0x16u);
    }

    os_activity_scope_leave(&v12);
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = 0;
      v15 = 2048;
      v16 = v8;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "%@: Soft timeout reached after %f seconds. The update will continue until it completes.", buf, 0x16u);
    }

  }
}

- (double)softTimeoutInterval
{
  return self->_softTimeoutInterval;
}

- (BOOL)didReachSoftTimeout
{
  return self->_didReachSoftTimeout;
}

- (void)setDidReachSoftTimeout:(BOOL)a3
{
  self->_didReachSoftTimeout = a3;
}

@end
