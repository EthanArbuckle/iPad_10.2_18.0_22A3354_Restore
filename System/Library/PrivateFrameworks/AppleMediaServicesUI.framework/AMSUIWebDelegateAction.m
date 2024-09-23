@implementation AMSUIWebDelegateAction

- (AMSUIWebDelegateAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebDelegateAction *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *delegateData;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebDelegateAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v12, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    delegateData = v7->_delegateData;
    v7->_delegateData = v9;

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
  uint64_t v12;
  _QWORD v14[5];
  _QWORD v15[5];
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebDelegateAction;
  v3 = -[AMSUIWebAction runAction](&v16, sel_runAction);
  -[AMSUIWebDelegateAction delegateData](self, "delegateData");
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
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running delegate action", buf, 0x16u);

  }
  -[AMSUIWebDelegateAction _handleResolveActionWithData:](self, "_handleResolveActionWithData:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[AMSUIWebDelegateAction _handleActionObject:](self, "_handleActionObject:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = (void *)MEMORY[0x24BE08340];
      AMSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "promiseWithError:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v12 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __35__AMSUIWebDelegateAction_runAction__block_invoke;
  v15[3] = &unk_24CB4F560;
  v15[4] = self;
  objc_msgSend(v9, "addErrorBlock:", v15);
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __35__AMSUIWebDelegateAction_runAction__block_invoke_36;
  v14[3] = &unk_24CB50FC0;
  v14[4] = self;
  objc_msgSend(v9, "addSuccessBlock:", v14);

  return v9;
}

void __35__AMSUIWebDelegateAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate action failed. %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

void __35__AMSUIWebDelegateAction_runAction__block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
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
    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate action succeeded. %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (id)_handleResolveActionWithData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void *v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  _QWORD v57[4];

  v57[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("resolve")))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (objc_msgSend(v8, "isEqualToString:", CFSTR("success")))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buyParams"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;

      v15 = (void *)MEMORY[0x24BDBCF20];
      v57[0] = CFSTR("buyParams");
      v57[1] = CFSTR("action");
      v57[2] = CFSTR("state");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = MEMORY[0x24BDAC760];
      v49 = 3221225472;
      v50 = __55__AMSUIWebDelegateAction__handleResolveActionWithData___block_invoke;
      v51 = &unk_24CB50440;
      v52 = v17;
      v18 = v17;
      objc_msgSend(v4, "ams_filterUsingTest:", &v48);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebDelegateAction _infoWithBuyParams:additionalInfo:](self, "_infoWithBuyParams:additionalInfo:", v12, v19);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = 0;
    }
    else
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("failed")))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;

        if (v14)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("code"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("code"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "longLongValue");

          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("message"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v22;
          else
            v23 = 0;

          v24 = CFSTR("Unknown Error");
          if (v23)
            v24 = v23;
          v25 = v24;

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("userInfo"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;

          AMSCustomError();
          v9 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          AMSError();
          v9 = objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v9 = 0;
      }
      v10 = 0;
    }

  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionName"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;

  if (!(v10 | v9))
  {
    if (!objc_msgSend(v29, "isEqualToString:", CFSTR("interruptionResolved")))
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_53;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;

    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("status"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("status"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "longLongValue");

      if (v34)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v34);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v47 = v35;
        AMSErrorWithFormat();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = 0;
LABEL_52:

        goto LABEL_53;
      }
    }
    else
    {

    }
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("buyParams"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v36;
    else
      v35 = 0;

    -[AMSUIWebDelegateAction _infoWithBuyParams:additionalInfo:](self, "_infoWithBuyParams:additionalInfo:", v35, v31);
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_52;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", v47, v48, v49, v50, v51);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v10 | v9)
  {
    if (!v37)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v38, "OSLogObject");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_opt_class();
      AMSLogKey();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v44;
      v55 = 2114;
      v56 = v45;
      _os_log_impl(&dword_211102000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action is a resolve action", buf, 0x16u);

    }
    -[AMSUIWebDelegateAction _didResolveWithResult:error:](self, "_didResolveWithResult:error:", v10, v9);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v37)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v38, "OSLogObject");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_opt_class();
      AMSLogKey();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v40;
      v55 = 2114;
      v56 = v41;
      _os_log_impl(&dword_211102000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action is not a resolve action", buf, 0x16u);

    }
    v42 = 0;
  }

  return v42;
}

uint64_t __55__AMSUIWebDelegateAction__handleResolveActionWithData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)_infoWithBuyParams:(id)a3 additionalInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = v8;

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE07D10]);
  return v9;
}

- (id)_handleActionObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[AMSUIWebAction context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AMSUIWebAction context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "action:handleActionObject:", self, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BE08340];
    -[AMSUIWebAction context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSErrorWithFormat();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "promiseWithError:", v12, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_didResolveWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AMSUIWebAction context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if ((v10 & 1) != 0)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v14;
      v27 = 2114;
      v28 = v15;
      v29 = 2114;
      v30 = v6;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Forwarding resolve payload to delegate: Result=%{public}@ Error=%{public}@", buf, 0x2Au);

    }
    -[AMSUIWebAction context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "action:didResolveWithResult:error:", self, v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2114;
      v28 = v21;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate does not handle resolve action.", buf, 0x16u);

    }
    v22 = (void *)MEMORY[0x24BE08340];
    -[AMSUIWebAction context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AMSErrorWithFormat();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "promiseWithError:", v23, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (NSDictionary)delegateData
{
  return self->_delegateData;
}

- (void)setDelegateData:(id)a3
{
  objc_storeStrong((id *)&self->_delegateData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateData, 0);
}

@end
