@implementation AMSFairPlayContext

- (AMSFairPlayContext)init
{
  AMSFairPlayContext *v2;
  AMSFairPlayContext *v3;
  unsigned int v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)AMSFairPlayContext;
  v2 = -[AMSFairPlayContext init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v11 = 0;
    v4 = -[AMSFairPlayContext fairplayContextIDWithError:](v2, "fairplayContextIDWithError:", &v11);
    v5 = v11;
    v3->_contextID = v4;
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_opt_class();
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v14 = v8;
        v15 = 2114;
        v16 = v9;
        v17 = 2114;
        v18 = v5;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] failed to intialize fairplay context. Error: %{public}@", buf, 0x20u);

      }
    }

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[AMSFairPlayContext destroyContext](self, "destroyContext");
  v3.receiver = self;
  v3.super_class = (Class)AMSFairPlayContext;
  -[AMSFairPlayContext dealloc](&v3, sel_dealloc);
}

- (void)destroyContext
{
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[AMSFairPlayContext contextID](self, "contextID"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138543362;
      v6 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_INFO, "%{public}@: Destroying context", (uint8_t *)&v5, 0xCu);
    }

    VLxCLgDpiF(-[AMSFairPlayContext contextID](self, "contextID"));
    self->_contextID = 0;
  }
}

- (unsigned)fairplayContextIDWithError:(id *)a3
{
  unsigned int *p_contextID;
  int v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  void *v19;
  unsigned int v20;
  uint8_t v22[4];
  uint64_t v23;
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_contextID = &self->_contextID;
  if (self->_contextID)
  {
    df35957c4e0();
    if (!v6)
      return *p_contextID;
    v7 = v6;
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
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Fairplay context is invalid (%ld)", buf, 0x16u);
    }

    -[AMSFairPlayContext destroyContext](self, "destroyContext");
  }
  memset(buf, 0, sizeof(buf));
  if (AMSFairPlayGetHardwareInfo((uint64_t)buf)
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to initialize global context due to hardware info")), v10 = (void *)objc_claimAutoreleasedReturnValue(), AMSError(505, CFSTR("Fairplay Error"), v10, 0), v11 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v11))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v22 = 138543362;
      v23 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_INFO, "%{public}@: Creating context", v22, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "ams_realHomeDirectory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("/Media/iTunes_Control/iTunes"));
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = (__CFString *)v15;
    else
      v16 = CFSTR("/private/var/mobile/Media/iTunes_Control/iTunes");
    v17 = objc_retainAutorelease(v16);
    v18 = XtCqEf5X(0, (uint64_t)buf, -[__CFString UTF8String](v17, "UTF8String"), (uint64_t)p_contextID);
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to initialize global context with status: %ld"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(505, CFSTR("Fairplay Error"), v19, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v11);
  v20 = *p_contextID;

  return v20;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

@end
