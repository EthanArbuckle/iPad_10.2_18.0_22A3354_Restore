@implementation AMSUIWebActionRunnerAction

- (AMSUIWebActionRunnerAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v7;
  AMSUIWebActionRunnerAction *v8;
  AMSUIWebActionRunnerAction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebActionRunnerAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v11, sel_initWithJSObject_context_, v7, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_actionPayload, a3);

  return v9;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AMSUIActionContext *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AMSUIActionContext *v18;
  void *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)AMSUIWebActionRunnerAction;
  v3 = -[AMSUIWebAction runAction](&v22, sel_runAction);
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
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deferring action to UIActionRunner", buf, 0x16u);

  }
  -[AMSUIWebAction context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flowController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [AMSUIActionContext alloc];
  -[AMSUIWebAction context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAction context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAction context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AMSUIActionContext initWithAccount:bag:presentingViewController:processInfo:](v11, "initWithAccount:bag:presentingViewController:processInfo:", v13, v15, v10, v17);

  -[AMSUIWebActionRunnerAction actionPayload](self, "actionPayload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIActionRunner handle:context:](AMSUIActionRunner, "handle:context:", v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSDictionary)actionPayload
{
  return self->_actionPayload;
}

- (void)setActionPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionPayload, 0);
}

@end
