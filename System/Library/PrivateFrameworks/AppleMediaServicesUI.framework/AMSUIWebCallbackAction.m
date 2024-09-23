@implementation AMSUIWebCallbackAction

- (AMSUIWebCallbackAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebCallbackAction *v7;
  void *v8;
  NSString *v9;
  NSString *service;
  void *v11;
  NSDictionary *v12;
  NSDictionary *data;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebCallbackAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v15, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    service = v7->_service;
    v7->_service = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    data = v7->_data;
    v7->_data = v12;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  AMSUIWebJSRequest *v15;
  void *v16;
  AMSUIWebJSRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)AMSUIWebCallbackAction;
  v3 = -[AMSUIWebAction runAction](&v26, sel_runAction);
  AMSGenerateLogCorrelationKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    -[AMSUIWebAction context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCallbackAction service](self, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v7;
    v29 = 2114;
    v30 = v9;
    v31 = 2114;
    v32 = v10;
    v33 = 2114;
    v34 = v4;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling back to the JS service: %{public}@ key: %{public}@", buf, 0x2Au);

  }
  -[AMSUIWebAction context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUIWebSetSubLogKey(v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x24BE08340]);
  v15 = [AMSUIWebJSRequest alloc];
  -[AMSUIWebCallbackAction service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AMSUIWebJSRequest initWithServiceName:logKey:](v15, "initWithServiceName:logKey:", v16, v13);

  -[AMSUIWebCallbackAction data](self, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebJSRequest setOptions:](v17, "setOptions:", v18);

  -[AMSUIWebAction context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "runJSRequest:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __35__AMSUIWebCallbackAction_runAction__block_invoke;
  v24[3] = &unk_24CB50DB8;
  v22 = v14;
  v25 = v22;
  objc_msgSend(v21, "addFinishBlock:", v24);

  return v22;
}

void __35__AMSUIWebCallbackAction_runAction__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    objc_msgSend(a2, "body");
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = (id)v4;
    if (v4)
      v5 = v4;
    else
      v5 = MEMORY[0x24BDBD1B8];
    objc_msgSend(v3, "finishWithResult:", v5);

  }
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
