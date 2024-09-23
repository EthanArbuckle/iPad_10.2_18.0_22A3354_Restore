@implementation CoreDAVCopyOrMoveTask

- (CoreDAVCopyOrMoveTask)initWithURL:(id)a3
{
  CDVInheritedInitializerUsageDisallowed();
}

- (CoreDAVCopyOrMoveTask)initWithSourceURL:(id)a3 destinationURL:(id)a4
{
  return -[CoreDAVCopyOrMoveTask initWithSourceURL:destinationURL:andOverwrite:](self, "initWithSourceURL:destinationURL:andOverwrite:", a3, a4, 0);
}

- (CoreDAVCopyOrMoveTask)initWithSourceURL:(id)a3 destinationURL:(id)a4 andOverwrite:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CoreDAVCopyOrMoveTask *v15;
  CoreDAVCopyOrMoveTask *v16;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  id v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  if (!v8
    || (v10 = v9,
        objc_msgSend(v8, "CDVRawPath"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "length"),
        v11,
        !v12))
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = *MEMORY[0x24BDBCAB8];
    v20 = CFSTR("Non-nil and non-zero length sourceURL required.");
    goto LABEL_12;
  }
  if (!v10
    || (objc_msgSend(v10, "CDVRawPath"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "length"),
        v13,
        !v14))
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = *MEMORY[0x24BDBCAB8];
    v20 = CFSTR("Non-nil and non-zero length destinationURL required.");
    goto LABEL_12;
  }
  if (objc_msgSend(v8, "isEqual:", v10))
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = *MEMORY[0x24BDBCAB8];
    v20 = CFSTR("The value for sourceURL and the value for destinationURL must not be the same.");
LABEL_12:
    objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)CoreDAVCopyOrMoveTask;
  v15 = -[CoreDAVTask initWithURL:](&v22, sel_initWithURL_, v8);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_destinationURL, a4);
    *(&v16->_overwrite + 1) = a5;
  }

  return v16;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVCopyOrMoveTask;
  -[CoreDAVTask description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVTask url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Source URL: [%@]"), v6);

  -[CoreDAVCopyOrMoveTask destinationURL](self, "destinationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Destination URL: [%@]"), v8);

  objc_msgSend((id)objc_opt_class(), "stringFromOverwriteValue:", -[CoreDAVCopyOrMoveTask overwrite](self, "overwrite"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Overwrite: [%@]"), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)requestBody
{
  return 0;
}

- (id)additionalHeaderValues
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVCopyOrMoveTask;
  -[CoreDAVTask additionalHeaderValues](&v14, sel_additionalHeaderValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[CoreDAVCopyOrMoveTask destinationURL](self, "destinationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("Destination"));
  v7 = -[CoreDAVCopyOrMoveTask overwrite](self, "overwrite");
  if (v7 == 1)
  {
    v8 = CFSTR("T");
  }
  else
  {
    if (v7 != 2)
      goto LABEL_8;
    v8 = CFSTR("F");
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("Overwrite"));
LABEL_8:
  if (self->_shouldSendOrder)
  {
    -[NSURL CDVRawLastPathComponent](self->_priorOrderedURL, "CDVRawLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      CDVRelativeOrderHeaderString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("Position"));
    }

  }
  return v3;
}

- (void)setPriorOrderedURL:(id)a3
{
  NSURL **p_priorOrderedURL;

  p_priorOrderedURL = &self->_priorOrderedURL;
  objc_storeStrong((id *)&self->_priorOrderedURL, a3);
  if (*p_priorOrderedURL)
    self->_shouldSendOrder = 1;
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
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
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
LABEL_11:
          _os_log_impl(&dword_209602000, v13, v14, v12, buf, v15);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if (v9)
    {
      v22 = v9;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = (id)objc_opt_class();
        v27 = 2112;
        v28 = v5;
        v11 = v26;
        v12 = "%{public}@ failed: %@";
        v13 = v22;
        v14 = OS_LOG_TYPE_ERROR;
        v15 = 22;
        goto LABEL_11;
      }
LABEL_12:

    }
    v23 = v5;
    goto LABEL_14;
  }
  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rootElement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "responses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  self->super._numDownloadedElements = objc_msgSend(v21, "count");
  -[CoreDAVCopyOrMoveTask _callBackToDelegateWithResponses:error:](self, "_callBackToDelegateWithResponses:error:", v21, v5);
  v24.receiver = self;
  v24.super_class = (Class)CoreDAVCopyOrMoveTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v24, sel_finishCoreDAVTaskWithError_, v5);

}

- (void)_callBackToDelegateWithResponses:(id)a3 error:(id)a4
{
  CDVAbstractMethod();
}

+ (id)stringFromOverwriteValue:(int)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_24C1DA078[a3];
}

- (int)overwrite
{
  return *(&self->_overwrite + 1);
}

- (void)setOverwrite:(int)a3
{
  *(&self->_overwrite + 1) = a3;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
  objc_storeStrong((id *)&self->_destinationURL, a3);
}

- (NSURL)priorOrderedURL
{
  return self->_priorOrderedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorOrderedURL, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

@end
