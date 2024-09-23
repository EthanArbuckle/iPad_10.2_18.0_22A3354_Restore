@implementation CoreDAVGetTask

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVGetTask;
  -[CoreDAVTask description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "octetStreamData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("| Data length in bytes: [%lu]"), objc_msgSend(v8, "length"));

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("| Data length in bytes: [unknown]"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)httpMethod
{
  return CFSTR("GET");
}

- (unint64_t)cachePolicy
{
  return -[CoreDAVGetTask forceNoCache](self, "forceNoCache");
}

- (id)requestBody
{
  return 0;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  return objc_alloc_init(CoreDAVOctetStreamParser);
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
  void *v17;
  char v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
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
          v26 = (id)objc_opt_class();
          v11 = v26;
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
        v26 = (id)objc_opt_class();
        v27 = 2112;
        v28 = v5;
        v11 = v26;
        v12 = "%{public}@ failed: %@";
        v13 = v16;
        v14 = OS_LOG_TYPE_ERROR;
        v15 = 22;
        goto LABEL_9;
      }
LABEL_10:

    }
  }
  -[CoreDAVTask delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "octetStreamData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
    -[CoreDAVTask delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "getTask:data:error:", self, v22, v5);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }
  v24.receiver = self;
  v24.super_class = (Class)CoreDAVGetTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v24, sel_finishCoreDAVTaskWithError_, v5);

}

- (id)appSpecificDataItemResult
{
  return self->_appSpecificDataItemResult;
}

- (void)setAppSpecificDataItemResult:(id)a3
{
  objc_storeStrong(&self->_appSpecificDataItemResult, a3);
}

- (BOOL)forceNoCache
{
  return self->_forceNoCache;
}

- (void)setForceNoCache:(BOOL)a3
{
  self->_forceNoCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appSpecificDataItemResult, 0);
}

@end
