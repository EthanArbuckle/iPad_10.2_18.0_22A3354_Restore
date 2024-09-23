@implementation CoreDAVPutTask

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVPutTask;
  -[CoreDAVPostOrPutTask description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVPutTask nextETag](self, "nextETag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| New ETag: [%@]"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)httpMethod
{
  return CFSTR("PUT");
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  uint64_t v5;
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
  char v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CoreDAVPutTask setNextETag:](self, "setNextETag:", 0);
  if (!v4)
  {
    -[CoreDAVTask responseHeaders](self, "responseHeaders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CDVObjectForKeyCaseInsensitive:", CFSTR("ETag"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVPutTask setNextETag:](self, "setNextETag:", v8);
    goto LABEL_12;
  }
  v5 = objc_msgSend(v4, "code");
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super._accountInfoProvider);
  objc_msgSend(v6, "logHandleForAccountInfoProvider:", WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 1)
  {
    if (!v8)
      goto LABEL_12;
    v9 = v8;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    *(_DWORD *)buf = 138543362;
    v21 = (id)objc_opt_class();
    v10 = v21;
    v11 = "%{public}@ cancelled";
    v12 = v9;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 12;
    goto LABEL_10;
  }
  if (!v8)
    goto LABEL_12;
  v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v21 = (id)objc_opt_class();
    v22 = 2112;
    v23 = v4;
    v10 = v21;
    v11 = "%{public}@ failed: %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 22;
LABEL_10:
    _os_log_impl(&dword_209602000, v12, v13, v11, buf, v14);

  }
LABEL_11:

LABEL_12:
  -[CoreDAVTask delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[CoreDAVTask delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVPutTask nextETag](self, "nextETag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "putTask:completedWithNewETag:error:", self, v18, v4);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }
  v19.receiver = self;
  v19.super_class = (Class)CoreDAVPutTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v19, sel_finishCoreDAVTaskWithError_, v4);

}

- (NSString)nextETag
{
  return self->_nextETag;
}

- (void)setNextETag:(id)a3
{
  objc_storeStrong((id *)&self->_nextETag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextETag, 0);
}

@end
