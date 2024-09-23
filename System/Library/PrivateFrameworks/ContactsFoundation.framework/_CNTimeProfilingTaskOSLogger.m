@implementation _CNTimeProfilingTaskOSLogger

- (_CNTimeProfilingTaskOSLogger)init
{
  id v2;

  CNInitializerUnavailableException(self, a2, sel_initWithOSLog_);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_CNTimeProfilingTaskOSLogger)initWithOSLog:(id)a3
{
  id v5;
  _CNTimeProfilingTaskOSLogger *v6;
  _CNTimeProfilingTaskOSLogger *v7;
  _CNTimeProfilingTaskOSLogger *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNTimeProfilingTaskOSLogger;
  v6 = -[_CNTimeProfilingTaskOSLogger init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_os_log, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("os_log"), self->_os_log);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)taskWillBegin:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNTimeProfilingTaskOSLogger os_log](self, "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_18F80C000, v5, OS_LOG_TYPE_DEFAULT, "Task '%{public}@' beginning", (uint8_t *)&v7, 0xCu);

  }
}

- (void)task:(id)a3 didCompleteAfter:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNTimeProfilingTaskOSLogger os_log](self, "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_18F80C000, v8, OS_LOG_TYPE_DEFAULT, "Task '%{public}@' complete (%{public}@)", (uint8_t *)&v10, 0x16u);

  }
}

- (void)task:(id)a3 didFailWithError:(id)a4 after:(double)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNTimeProfilingTaskOSLogger os_log](self, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v12;
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_18F80C000, v11, OS_LOG_TYPE_DEFAULT, "Task '%{public}@' failed (%{public}@): %{public}@", (uint8_t *)&v13, 0x20u);

  }
}

- (OS_os_log)os_log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_os_log, 0);
}

@end
