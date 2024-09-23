@implementation CoreDAVHeadTask

- (id)httpMethod
{
  return CFSTR("HEAD");
}

- (unint64_t)cachePolicy
{
  return 0;
}

- (id)requestBody
{
  return 0;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == 1)
    {
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v19 = (id)objc_opt_class();
          v11 = v19;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
          v15 = 12;
LABEL_9:
          _os_log_impl(&dword_209602000, v13, v14, v12, buf, v15);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (v9)
    {
      v16 = v9;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v19 = (id)objc_opt_class();
        v20 = 2112;
        v21 = v5;
        v11 = v19;
        v12 = "%{public}@ failed: %@";
        v13 = v16;
        v14 = OS_LOG_TYPE_ERROR;
        v15 = 22;
        goto LABEL_9;
      }
LABEL_10:

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CoreDAVHeadTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v17, sel_finishCoreDAVTaskWithError_, v5);

}

@end
