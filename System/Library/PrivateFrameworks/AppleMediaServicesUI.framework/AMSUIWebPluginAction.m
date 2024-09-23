@implementation AMSUIWebPluginAction

- (AMSUIWebPluginAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebPluginAction *v7;
  void *v8;
  NSString *v9;
  NSString *actionIdentifier;
  void *v11;
  NSString *v12;
  NSString *bundleIdentifier;
  void *v14;
  NSDictionary *v15;
  NSDictionary *options;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebPluginAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v18, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    actionIdentifier = v7->_actionIdentifier;
    v7->_actionIdentifier = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("options"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    options = v7->_options;
    v7->_options = v15;

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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)AMSUIWebPluginAction;
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
    -[AMSUIWebPluginAction bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebPluginAction actionIdentifier](self, "actionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v6;
    v25 = 2114;
    v26 = v7;
    v27 = 2114;
    v28 = v8;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running plugin action. Bundle identifier: %{public}@, action identifier: %{public}@", buf, 0x2Au);

  }
  -[AMSUIWebPluginAction actionIdentifier](self, "actionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v19 = (void *)MEMORY[0x24BE08340];
LABEL_11:
    AMSError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "promiseWithError:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[AMSUIWebPluginAction bundleIdentifier](self, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v19 = (void *)MEMORY[0x24BE08340];
    goto LABEL_11;
  }
  -[AMSUIWebAction context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pluginLoader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebPluginAction bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pluginForBundleIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AMSUIWebPluginAction actionIdentifier](self, "actionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebPluginAction options](self, "options");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "runActionWithIdentifier:options:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "promiseWithError:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  return v18;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
