@implementation AMSTimeout

+ (id)timeoutWithExpiration:(double)a3
{
  AMSTimeout *v4;
  void *v5;
  AMSTimeout *v6;

  v4 = [AMSTimeout alloc];
  v5 = (void *)objc_opt_new();
  v6 = -[AMSTimeout initWithExpiration:clockSource:](v4, "initWithExpiration:clockSource:", v5, a3);

  return v6;
}

- (AMSTimeout)initWithExpiration:(double)a3 clockSource:(id)a4
{
  id v7;
  AMSTimeout *v8;
  AMSTimeout *v9;
  double v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSTimeout;
  v8 = -[AMSTimeout init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clockSource, a4);
    objc_msgSend(v7, "currentTimestampWithOffset:", a3);
    v9->_expirationTimestamp = v10;
  }

  return v9;
}

- (BOOL)hasExpired
{
  BOOL result;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_expired)
    return 1;
  -[AMSTimeout clockSource](self, "clockSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTimestampWithOffset:", 0.0);
  v6 = v5;

  -[AMSTimeout timestampAtPreviousQuery](self, "timestampAtPreviousQuery");
  if (v6 < v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Current timestamp is older than the previous. A monotonic clock source was expected.", (uint8_t *)&v14, 0x16u);

    }
  }
  -[AMSTimeout setTimestampAtPreviousQuery:](self, "setTimestampAtPreviousQuery:", v6);
  -[AMSTimeout expirationTimestamp](self, "expirationTimestamp");
  result = v6 > v13;
  self->_expired = v6 > v13;
  return result;
}

- (AMSTimeoutClockSource)clockSource
{
  return self->_clockSource;
}

- (void)setClockSource:(id)a3
{
  objc_storeStrong((id *)&self->_clockSource, a3);
}

- (double)expirationTimestamp
{
  return self->_expirationTimestamp;
}

- (void)setExpirationTimestamp:(double)a3
{
  self->_expirationTimestamp = a3;
}

- (double)timestampAtPreviousQuery
{
  return self->_timestampAtPreviousQuery;
}

- (void)setTimestampAtPreviousQuery:(double)a3
{
  self->_timestampAtPreviousQuery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockSource, 0);
}

@end
