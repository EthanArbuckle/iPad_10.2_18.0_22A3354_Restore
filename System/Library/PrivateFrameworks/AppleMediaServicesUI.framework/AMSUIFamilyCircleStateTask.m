@implementation AMSUIFamilyCircleStateTask

- (AMSUIFamilyCircleStateTask)initWithJSONDictionary:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  AMSUIFamilyCircleStateTask *v8;
  AMSUIFamilyCircleStateTask *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AMSUIFamilyCircleStateTask;
  v8 = -[AMSTask init](&v28, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_19;
  -[AMSUIFamilyCircleStateTask setPresentingViewController:](v8, "setPresentingViewController:", v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientBundleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("additionalParameters"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  if (!v11)
  {
    v29 = 0;
    v30 = (uint64_t)&v29;
    v31 = 0x2020000000;
    v25 = (id *)getFACircleEventTypeInitiateSymbolLoc_ptr;
    v32 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr;
    if (!getFACircleEventTypeInitiateSymbolLoc_ptr)
    {
      v26 = (void *)FamilyCircleUILibrary();
      v25 = (id *)dlsym(v26, "FACircleEventTypeInitiate");
      *(_QWORD *)(v30 + 24) = v25;
      getFACircleEventTypeInitiateSymbolLoc_ptr = (uint64_t)v25;
    }
    _Block_object_dispose(&v29, 8);
    if (!v25)
      getAIDAServiceTypeCloud_cold_1();
    v11 = *v25;
    if (v13)
      goto LABEL_16;
    goto LABEL_24;
  }
  if (!v13)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bundleIdentifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_16:
  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v18 = (void *)getFACircleContextClass_softClass;
  v37 = getFACircleContextClass_softClass;
  if (!getFACircleContextClass_softClass)
  {
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = (uint64_t)__getFACircleContextClass_block_invoke;
    v32 = &unk_24CB4F3E8;
    v33 = &v34;
    __getFACircleContextClass_block_invoke((uint64_t)&v29);
    v18 = (void *)v35[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v34, 8);
  v20 = (void *)objc_msgSend([v19 alloc], "initWithEventType:", v11);
  -[AMSUIFamilyCircleStateTask setFaContext:](v9, "setFaContext:", v20);

  -[AMSUIFamilyCircleStateTask faContext](v9, "faContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClientBundleID:", v13);

  -[AMSUIFamilyCircleStateTask faContext](v9, "faContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClientName:", v15);

  -[AMSUIFamilyCircleStateTask faContext](v9, "faContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAdditionalParameters:", v17);

LABEL_19:
  return v9;
}

- (id)present
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__1;
  v12[4] = __Block_byref_object_dispose__1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v3 = (void *)getFACircleStateControllerClass_softClass;
  v18 = getFACircleStateControllerClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getFACircleStateControllerClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getFACircleStateControllerClass_block_invoke;
    v14[3] = &unk_24CB4F3E8;
    v14[4] = &v15;
    __getFACircleStateControllerClass_block_invoke((uint64_t)v14);
    v3 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v15, 8);
  v6 = [v5 alloc];
  -[AMSUIFamilyCircleStateTask presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v6, "initWithPresenter:", v7);

  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __37__AMSUIFamilyCircleStateTask_present__block_invoke;
  v11[3] = &unk_24CB4FC98;
  v11[4] = self;
  v11[5] = v12;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "binaryPromiseAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v12, 8);
  return v9;
}

id __37__AMSUIFamilyCircleStateTask_present__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v2 = objc_alloc_init(MEMORY[0x24BE08078]);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "faContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__AMSUIFamilyCircleStateTask_present__block_invoke_2;
  v10[3] = &unk_24CB4FC70;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v11 = v2;
  v12 = v5;
  v10[4] = v6;
  v7 = v2;
  objc_msgSend(v3, "performWithContext:completion:", v4, v10);

  objc_msgSend(v7, "promiseAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __37__AMSUIFamilyCircleStateTask_present__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_msgSend(v3, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedActionConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open family circle. %{public}@", (uint8_t *)&v18, 0x20u);

    }
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v3, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithError:", v14);

  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully opened family circle", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
  }

}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (FACircleContext)faContext
{
  return self->_faContext;
}

- (void)setFaContext:(id)a3
{
  objc_storeStrong((id *)&self->_faContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faContext, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
