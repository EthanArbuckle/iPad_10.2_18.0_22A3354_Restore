@implementation AMSUIWebCheckDownloadQueueAction

- (AMSUIWebCheckDownloadQueueAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebCheckDownloadQueueAction *v7;
  uint64_t v8;
  id contentType;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebCheckDownloadQueueAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v11, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentType"));
    v8 = objc_claimAutoreleasedReturnValue();
    contentType = v7->_contentType;
    v7->_contentType = (id)v8;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebCheckDownloadQueueAction;
  v3 = -[AMSUIWebAction runAction](&v20, sel_runAction);
  -[AMSUIWebCheckDownloadQueueAction contentType](self, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking download queue", buf, 0x16u);

    }
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v10 = (void *)getAPRequestHandlerClass_softClass;
    v24 = getAPRequestHandlerClass_softClass;
    if (!getAPRequestHandlerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getAPRequestHandlerClass_block_invoke;
      v26 = &unk_24CB4F3E8;
      v27 = &v21;
      __getAPRequestHandlerClass_block_invoke((uint64_t)buf);
      v10 = (void *)v22[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v21, 8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(v4, "longLongValue");
    else
      v12 = 0;
    objc_msgSend(v11, "checkDownloadQueueWithContentType:", v12);
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to check download queue. Content type is missing", buf, 0x16u);

    }
    v16 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "promiseWithError:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (id)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong(&self->_contentType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contentType, 0);
}

@end
