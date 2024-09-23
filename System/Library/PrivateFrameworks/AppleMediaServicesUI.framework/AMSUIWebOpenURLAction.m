@implementation AMSUIWebOpenURLAction

- (AMSUIWebOpenURLAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebOpenURLAction *v7;
  AMSUIWebOpenURLAction *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t type;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebOpenURLAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v18, sel_initWithJSObject_context_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_type = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appLink"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appLink"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (v11)
        v8->_type = 1;
    }
    else
    {

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        type = objc_msgSend(v12, "longLongValue");
      else
        type = v8->_type;
      v8->_type = type;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    objc_storeStrong((id *)&v8->_URL, v16);
    if (v15)

  }
  return v8;
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
  int64_t v10;
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
  uint64_t v21;
  void *v22;
  void *v23;
  id result;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)AMSUIWebOpenURLAction;
  v3 = -[AMSUIWebAction runAction](&v33, sel_runAction);
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
    -[AMSUIWebOpenURLAction URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AMSUIWebOpenURLAction type](self, "type");
    *(_DWORD *)buf = 138544130;
    v35 = v6;
    v36 = 2114;
    v37 = v7;
    v38 = 2114;
    v39 = v9;
    v40 = 2048;
    v41 = v10;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening URL: %{public}@ type: %ld", buf, 0x2Au);

  }
  -[AMSUIWebOpenURLAction URL](self, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    switch(-[AMSUIWebOpenURLAction type](self, "type"))
    {
      case 0:
        goto LABEL_19;
      case 1:
        v12 = (void *)MEMORY[0x24BE082E8];
        -[AMSUIWebOpenURLAction URL](self, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIWebAction context](self, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "clientInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIWebAction context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bag");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "openURL:clientInfo:bag:", v13, v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      case 2:
        v20 = (void *)objc_opt_class();
        -[AMSUIWebOpenURLAction URL](self, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_openUniversalLink:", v13);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 3:
        v22 = (void *)objc_opt_class();
        -[AMSUIWebOpenURLAction URL](self, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_openIgnoringOverrides:", v13);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v18 = (void *)v21;
LABEL_12:

        if (!v18)
          goto LABEL_19;
        objc_msgSend(v18, "promiseAdapter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        return v23;
      default:
        objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v25, "OSLogObject");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = objc_opt_class();
          AMSLogKey();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v27;
          v36 = 2114;
          v37 = v28;
          _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to handle unknown type", buf, 0x16u);

        }
LABEL_19:
        v29 = (void *)MEMORY[0x24BE082E8];
        -[AMSUIWebOpenURLAction URL](self, "URL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v29) = objc_msgSend(v29, "openStandardURL:", v30);

        v19 = (void *)MEMORY[0x24BE08340];
        if (!(_DWORD)v29)
          goto LABEL_21;
        objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
        result = (id)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x24BE08340];
LABEL_21:
    AMSError();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "promiseWithError:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    return v32;
  }
  return result;
}

+ (id)_openUniversalLink:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
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
    *(_DWORD *)buf = 138543874;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening universal link: %@", buf, 0x20u);

  }
  v8 = objc_alloc_init(MEMORY[0x24BE08078]);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BEBDFE0];
  v16 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__AMSUIWebOpenURLAction__openUniversalLink___block_invoke;
  v13[3] = &unk_24CB507F0;
  v11 = v8;
  v14 = v11;
  objc_msgSend(v9, "openURL:options:completionHandler:", v3, v10, v13);

  return v11;
}

void __44__AMSUIWebOpenURLAction__openUniversalLink___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
  }
  else
  {
    AMSError();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v3);

  }
}

+ (id)_openIgnoringOverrides:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setAllowURLOverrides:", 0);
  objc_msgSend(v5, "setIgnoreAppLinkEnabledProperty:", 1);
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__AMSUIWebOpenURLAction__openIgnoringOverrides___block_invoke;
  v9[3] = &unk_24CB50B68;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "openURL:configuration:completionHandler:", v3, v5, v9);

  return v7;
}

void __48__AMSUIWebOpenURLAction__openIgnoringOverrides___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    AMSError();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
