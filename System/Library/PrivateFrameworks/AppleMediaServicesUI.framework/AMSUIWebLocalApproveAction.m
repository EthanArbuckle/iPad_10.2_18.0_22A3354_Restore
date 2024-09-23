@implementation AMSUIWebLocalApproveAction

- (AMSUIWebLocalApproveAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebLocalApproveAction *v7;
  void *v8;
  NSString *v9;
  NSString *itemIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebLocalApproveAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v12, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    itemIdentifier = v7->_itemIdentifier;
    v7->_itemIdentifier = v9;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  objc_super v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)AMSUIWebLocalApproveAction;
  v3 = -[AMSUIWebAction runAction](&v23, sel_runAction);
  -[AMSUIWebLocalApproveAction itemIdentifier](self, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No itemIdentifier found", buf, 0x16u);

    }
    v19 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "promiseWithError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BE08340]);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v7 = (void *)getAPRequestHandlerClass_softClass_0;
    v27 = getAPRequestHandlerClass_softClass_0;
    v8 = MEMORY[0x24BDAC760];
    if (!getAPRequestHandlerClass_softClass_0)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getAPRequestHandlerClass_block_invoke_0;
      v29 = &unk_24CB4F3E8;
      v30 = &v24;
      __getAPRequestHandlerClass_block_invoke_0((uint64_t)buf);
      v7 = (void *)v25[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v24, 8);
    -[AMSUIWebLocalApproveAction itemIdentifier](self, "itemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __39__AMSUIWebLocalApproveAction_runAction__block_invoke;
    v21[3] = &unk_24CB4F828;
    v21[4] = self;
    v11 = v6;
    v22 = v11;
    objc_msgSend(v9, "localApproveRequestWithItemIdentifier:completion:", v10, v21);

    v12 = v22;
    v13 = v11;

    v14 = v13;
  }

  return v14;
}

void __39__AMSUIWebLocalApproveAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
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
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v3;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] APRequestHandler encountered error: %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3 == 0, CFSTR("approved"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("itemIdentifier");
  v12[0] = v8;
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v10);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
