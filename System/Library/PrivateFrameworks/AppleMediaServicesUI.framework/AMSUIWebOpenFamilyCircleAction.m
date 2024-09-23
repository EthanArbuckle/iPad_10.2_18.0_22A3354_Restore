@implementation AMSUIWebOpenFamilyCircleAction

- (AMSUIWebOpenFamilyCircleAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebOpenFamilyCircleAction *v7;
  void *v8;
  NSString *v9;
  NSString *clientName;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebOpenFamilyCircleAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v12, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    clientName = v7->_clientName;
    v7->_clientName = v9;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  AMSUIWebOpenFamilyCircleAction *v31;
  id v32;
  _BYTE *v33;
  objc_super v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)AMSUIWebOpenFamilyCircleAction;
  v3 = -[AMSUIWebAction runAction](&v34, sel_runAction);
  v4 = objc_alloc_init(MEMORY[0x24BE08340]);
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
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting to open family circle", buf, 0x16u);

  }
  v35 = 0;
  v36 = (uint64_t)&v35;
  v37 = 0x2050000000;
  v9 = (void *)getFACircleContextClass_softClass_0;
  v38 = (void *)getFACircleContextClass_softClass_0;
  v10 = MEMORY[0x24BDAC760];
  if (!getFACircleContextClass_softClass_0)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getFACircleContextClass_block_invoke_0;
    v45 = (uint64_t (*)(uint64_t, uint64_t))&unk_24CB4F3E8;
    v46 = (void (*)(uint64_t))&v35;
    __getFACircleContextClass_block_invoke_0((uint64_t)buf);
    v9 = *(void **)(v36 + 24);
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v35, 8);
  v12 = [v11 alloc];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v13 = (_QWORD *)getFACircleEventTypeInitiateSymbolLoc_ptr_0;
  v45 = (uint64_t (*)(uint64_t, uint64_t))getFACircleEventTypeInitiateSymbolLoc_ptr_0;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr_0)
  {
    v14 = (void *)FamilyCircleUILibrary_0();
    v13 = dlsym(v14, "FACircleEventTypeInitiate");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
    getFACircleEventTypeInitiateSymbolLoc_ptr_0 = (uint64_t)v13;
  }
  _Block_object_dispose(buf, 8);
  if (!v13)
    getAIDAServiceTypeCloud_cold_1();
  v15 = (void *)objc_msgSend(v12, "initWithEventType:", *v13);
  -[AMSUIWebOpenFamilyCircleAction clientName](self, "clientName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClientName:", v16);

  -[AMSUIWebAction context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "flowController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__7;
  v46 = __Block_byref_object_dispose__7;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v20 = (void *)getFACircleStateControllerClass_softClass_0;
  v43 = getFACircleStateControllerClass_softClass_0;
  if (!getFACircleStateControllerClass_softClass_0)
  {
    v35 = v10;
    v36 = 3221225472;
    v37 = (uint64_t)__getFACircleStateControllerClass_block_invoke_0;
    v38 = &unk_24CB4F3E8;
    v39 = &v40;
    __getFACircleStateControllerClass_block_invoke_0((uint64_t)&v35);
    v20 = (void *)v41[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v40, 8);
  v47 = (id)objc_msgSend([v21 alloc], "initWithPresenter:", v19);
  AMSLogKey();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v29[0] = v10;
  v29[1] = 3221225472;
  v29[2] = __43__AMSUIWebOpenFamilyCircleAction_runAction__block_invoke;
  v29[3] = &unk_24CB51A20;
  v24 = v22;
  v33 = buf;
  v30 = v24;
  v31 = self;
  v25 = v4;
  v32 = v25;
  objc_msgSend(v23, "performWithContext:completion:", v15, v29);
  v26 = v32;
  v27 = v25;

  _Block_object_dispose(buf, 8);
  return v27;
}

void __43__AMSUIWebOpenFamilyCircleAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id)AMSSetLogKey();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  objc_msgSend(v3, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open family circle. %{public}@", (uint8_t *)&v19, 0x20u);

    }
    v14 = *(void **)(a1 + 48);
    objc_msgSend(v3, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithError:", v15);

  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successully opened family circle", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", MEMORY[0x24BDBD1C8]);
  }

}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
}

@end
