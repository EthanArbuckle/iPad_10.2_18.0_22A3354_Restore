@implementation AMSUIWebOTPAction

- (AMSUIWebOTPAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebOTPAction *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebOTPAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v11, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_enabled = objc_msgSend(v9, "BOOLValue");

    }
    else
    {
      v7->_enabled = 0;
    }

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebOTPAction;
  v3 = -[AMSUIWebAction runAction](&v19, sel_runAction);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AMSUIWebOTPAction enabled](self, "enabled");
    *(_DWORD *)buf = 138543874;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    v24 = 1024;
    v25 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running action. (enabled: %d)", buf, 0x1Cu);

  }
  v9 = -[AMSUIWebOTPAction enabled](self, "enabled");
  -[AMSUIWebAction context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
    v13 = objc_msgSend(v11, "startOTPListener");
  else
    v13 = objc_msgSend(v11, "stopOTPListener");
  v14 = v13;

  if ((v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "promiseWithError:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    return v18;
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
