@implementation FCAppActivationMonitor

- (FCAppActivationMonitor)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAppActivationMonitor init]";
    v9 = 2080;
    v10 = "FCAppActivationMonitor.m";
    v11 = 1024;
    v12 = 21;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAppActivationMonitor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCAppActivationMonitor)initWithAppActivityMonitor:(id)a3
{
  id v4;
  FCAppActivationMonitor *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCAppActivationMonitor;
  v5 = -[FCAppActivationMonitor init](&v7, sel_init);
  if (v5)
    objc_msgSend(v4, "addObserver:", v5);

  return v5;
}

- (void)activityObservingApplicationDidBecomeActive
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FCAppActivationMonitor setLastActivationDate:](self, "setLastActivationDate:", v3);

}

- (void)activityObservingApplicationDidEnterBackground
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FCAppActivationMonitor setLastBackgroundDate:](self, "setLastBackgroundDate:", v3);

}

- (NSDate)lastActivationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastActivationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)lastBackgroundDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastBackgroundDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBackgroundDate, 0);
  objc_storeStrong((id *)&self->_lastActivationDate, 0);
}

@end
