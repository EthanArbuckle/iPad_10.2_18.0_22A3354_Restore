@implementation CoreDAVDeleteTask

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVDeleteTask;
  -[CoreDAVActionBackedTask description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVDeleteTask previousETag](self, "previousETag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Previous ETag: [%@]"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)httpMethod
{
  return CFSTR("DELETE");
}

- (id)additionalHeaderValues
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVDeleteTask;
  -[CoreDAVTask additionalHeaderValues](&v7, sel_additionalHeaderValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[CoreDAVDeleteTask previousETag](self, "previousETag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("If-Match"));

  return v3;
}

- (id)requestBody
{
  return 0;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "code") == 1)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
      objc_msgSend(v6, "logHandleForAccountInfoProvider:", WeakRetained);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v24 = (id)objc_opt_class();
          v10 = v24;
          v11 = "%{public}@ cancelled";
          v12 = v9;
          v13 = OS_LOG_TYPE_INFO;
          v14 = 12;
LABEL_16:
          _os_log_impl(&dword_209602000, v12, v13, v11, buf, v14);

          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v5, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")))
      {
        v16 = objc_msgSend(v5, "code");

        if (v16 == 404)
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
          objc_msgSend(v8, "logHandleForAccountInfoProvider:", v17);
          v9 = objc_claimAutoreleasedReturnValue();

          if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v24 = self;
            _os_log_impl(&dword_209602000, v9, OS_LOG_TYPE_INFO, "Tried to delete an unknown resource.  Swallowing this error %@", buf, 0xCu);
          }
          v6 = v5;
          v5 = 0;
          goto LABEL_17;
        }
      }
      else
      {

      }
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
      objc_msgSend(v6, "logHandleForAccountInfoProvider:", v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v24 = (id)objc_opt_class();
          v25 = 2112;
          v26 = v5;
          v10 = v24;
          v11 = "%{public}@ failed: %@";
          v12 = v9;
          v13 = OS_LOG_TYPE_ERROR;
          v14 = 22;
          goto LABEL_16;
        }
LABEL_17:

      }
    }

  }
  -[CoreDAVTask delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[CoreDAVTask delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deleteTask:completedWithError:", self, v5);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }
  v22.receiver = self;
  v22.super_class = (Class)CoreDAVDeleteTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v22, sel_finishCoreDAVTaskWithError_, v5);

}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
  objc_storeStrong((id *)&self->_previousETag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousETag, 0);
}

@end
