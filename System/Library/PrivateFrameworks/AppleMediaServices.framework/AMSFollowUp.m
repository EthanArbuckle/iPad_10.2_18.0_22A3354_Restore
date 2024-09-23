@implementation AMSFollowUp

- (AMSFollowUp)init
{
  AMSFollowUp *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  FLFollowUpController *followUpController;
  dispatch_queue_t v7;
  OS_dispatch_queue *followUpQueue;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)AMSFollowUp;
  v2 = -[AMSFollowUp init](&v10, sel_init);
  if (v2)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v3 = (void *)_MergedGlobals_108;
    v15 = _MergedGlobals_108;
    if (!_MergedGlobals_108)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getFLFollowUpControllerClass_block_invoke;
      v11[3] = &unk_1E253DDB8;
      v11[4] = &v12;
      __getFLFollowUpControllerClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v12, 8);
    v5 = objc_msgSend([v4 alloc], "initWithClientIdentifier:", CFSTR("com.apple.AppleMediaServices"));
    followUpController = v2->_followUpController;
    v2->_followUpController = (FLFollowUpController *)v5;

    v7 = dispatch_queue_create("com.apple.AppleMediaServices.followUpQueue", 0);
    followUpQueue = v2->_followUpQueue;
    v2->_followUpQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (id)clearFollowUpItem:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "backingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFollowUp clearFollowUpWithBackingIdentifier:](self, "clearFollowUpWithBackingIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)clearFollowUpWithBackingIdentifier:(id)a3
{
  id v4;
  AMSMutableBinaryPromise *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  AMSMutableBinaryPromise *v10;
  id v11;
  AMSMutableBinaryPromise *v12;
  AMSMutableBinaryPromise *v13;
  _QWORD block[5];
  id v16;
  AMSMutableBinaryPromise *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(AMSMutableBinaryPromise);
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v19 = (id)objc_opt_class();
    v20 = 2114;
    v21 = v4;
    v8 = v19;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: Clearing follow up with backing identifier: %{public}@", buf, 0x16u);

  }
  -[AMSFollowUp followUpQueue](self, "followUpQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AMSFollowUp_clearFollowUpWithBackingIdentifier___block_invoke;
  block[3] = &unk_1E25414B8;
  block[4] = self;
  v16 = v4;
  v10 = v5;
  v17 = v10;
  v11 = v4;
  dispatch_async(v9, block);

  v12 = v17;
  v13 = v10;

  return v13;
}

void __50__AMSFollowUp_clearFollowUpWithBackingIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "followUpController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v4 = objc_msgSend(v2, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v3, &v16);
  v5 = v16;

  if (!v5)
  {
    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if ((v4 & 1) != 0)
    {
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      v11 = v9;
      v12 = "%{public}@: Cleared follow up with backing identifier: %{public}@";
      v13 = v8;
      v14 = 22;
    }
    else
    {
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      v11 = v15;
      v12 = "%{public}@: Follow up clear finished without clearing anything";
      v13 = v8;
      v14 = 12;
    }
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);

LABEL_13:
    objc_msgSend(*(id *)(a1 + 48), "finishWithSuccess");
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v5);
LABEL_14:

}

- (id)clearFollowUpWithIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    AMSHashIfNeeded(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v10;
    v18 = 2114;
    v19 = v12;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_INFO, "%{public}@: Clearing follow up (account: %{public}@, identifier: %{public}@)", (uint8_t *)&v16, 0x20u);

  }
  +[AMSFollowUpItem backingIdentifierForIdentifier:account:](AMSFollowUpItem, "backingIdentifierForIdentifier:account:", v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFollowUp clearFollowUpWithBackingIdentifier:](self, "clearFollowUpWithBackingIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)pendingFollowUps
{
  AMSMutablePromise *v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  AMSMutablePromise *v8;
  AMSMutablePromise *v9;
  AMSMutablePromise *v10;
  _QWORD v12[5];
  AMSMutablePromise *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(AMSMutablePromise);
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = (id)objc_opt_class();
    v6 = v15;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "%{public}@: Fetching all pending follow ups", buf, 0xCu);

  }
  -[AMSFollowUp followUpQueue](self, "followUpQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __31__AMSFollowUp_pendingFollowUps__block_invoke;
  v12[3] = &unk_1E253E2B0;
  v12[4] = self;
  v8 = v3;
  v13 = v8;
  dispatch_async(v7, v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __31__AMSFollowUp_pendingFollowUps__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  AMSFollowUpItem *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = a1;
  objc_msgSend(*(id *)(a1 + 32), "followUpController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v3, "pendingFollowUpItems:", &v33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v33;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v5 = v4;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasPrefix:", 0x1E2556C20);

        if (v13)
        {
          v14 = -[AMSFollowUpItem initWithFollowUpItem:]([AMSFollowUpItem alloc], "initWithFollowUpItem:", v11);
          objc_msgSend(v2, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v8);
  }

  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v28)
  {
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_opt_class();
      v19 = v18;
      AMSLogableError(v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v18;
      v36 = 2114;
      v37 = (uint64_t)v20;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch pending follow ups with error %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(v27 + 40), "finishWithError:", v28);
  }
  else
  {
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (void *)objc_opt_class();
      v23 = v22;
      v24 = objc_msgSend(v2, "count");
      *(_DWORD *)buf = 138543618;
      v35 = v22;
      v36 = 2050;
      v37 = v24;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_INFO, "%{public}@: Fetched %{public}lu follow ups", buf, 0x16u);

    }
    v25 = *(void **)(v27 + 40);
    v26 = (void *)objc_msgSend(v2, "copy");
    objc_msgSend(v25, "finishWithResult:", v26);

  }
}

- (id)pendingFollowUpsForAccount:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  AMSFollowUp *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    AMSHashIfNeeded(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, "%{public}@: Fetching pending follow up for account %{public}@", buf, 0x16u);

  }
  -[AMSFollowUp pendingFollowUps](self, "pendingFollowUps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__AMSFollowUp_pendingFollowUpsForAccount___block_invoke;
  v14[3] = &unk_1E25422F8;
  v15 = v4;
  v16 = self;
  v11 = v4;
  objc_msgSend(v10, "thenWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __42__AMSFollowUp_pendingFollowUpsForAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __42__AMSFollowUp_pendingFollowUpsForAccount___block_invoke_2;
  v20 = &unk_1E25422D0;
  v21 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ams_filterUsingTest:", &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    v9 = objc_msgSend(v4, "count");
    AMSHashIfNeeded(*(void **)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v7;
    v24 = 2050;
    v25 = v9;
    v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, "%{public}@: Fetched %{public}ld follow ups for account %{public}@", buf, 0x20u);

  }
  if (objc_msgSend(v4, "count"))
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "hashedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("No follow-ups exist for %@."), v13, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    AMSError(7, CFSTR("Item Not Found"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

uint64_t __42__AMSFollowUp_pendingFollowUpsForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ams_DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_DSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ams_DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pendingFollowUpWithIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  AMSMutablePromise *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  AMSMutablePromise *v15;
  id v16;
  id v17;
  AMSMutablePromise *v18;
  AMSMutablePromise *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  AMSFollowUp *v24;
  AMSMutablePromise *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AMSMutablePromise);
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    AMSHashIfNeeded(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v11;
    v28 = 2114;
    v29 = v13;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_INFO, "%{public}@: Fetching pending follow up (account: %{public}@, identifier: %{public}@)", buf, 0x20u);

  }
  -[AMSFollowUp followUpQueue](self, "followUpQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__AMSFollowUp_pendingFollowUpWithIdentifier_account___block_invoke;
  v21[3] = &unk_1E2541468;
  v22 = v6;
  v23 = v7;
  v24 = self;
  v15 = v8;
  v25 = v15;
  v16 = v7;
  v17 = v6;
  dispatch_async(v14, v21);

  v18 = v25;
  v19 = v15;

  return v19;
}

void __53__AMSFollowUp_pendingFollowUpWithIdentifier_account___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[AMSFollowUpItem backingIdentifierForIdentifier:account:](AMSFollowUpItem, "backingIdentifierForIdentifier:account:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v30 = 0;
  objc_msgSend(v3, "_pendingFollowUpWithBackingIdentifier:error:", v2, &v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v30;
  if (v5)
  {
    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(void **)(a1 + 40);
      v10 = v8;
      AMSHashIfNeeded(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v32 = v8;
      v33 = 2114;
      v34 = v11;
      v35 = 2114;
      v36 = v12;
      v37 = 2114;
      v38 = v13;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: Failed to fetch pending follow up (account: %{public}@, error: %{public}@, identifier: %{public}@)", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v5);
  }
  else
  {
    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v4)
    {
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_opt_class();
        v18 = *(void **)(a1 + 40);
        v19 = v17;
        AMSHashIfNeeded(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v32 = v17;
        v33 = 2114;
        v34 = v20;
        v35 = 2114;
        v36 = v21;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_INFO, "%{public}@: Fetched pending follow up (account: %{public}@, identifier: %{public}@)", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v4);
    }
    else
    {
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_opt_class();
        v24 = *(void **)(a1 + 40);
        v25 = v23;
        AMSHashIfNeeded(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v32 = v23;
        v33 = 2114;
        v34 = v26;
        v35 = 2114;
        v36 = v27;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch pending follow up as no item could be found (account: %{public}@, identifier: %{public}@)", buf, 0x20u);

      }
      v28 = *(void **)(a1 + 56);
      AMSError(7, CFSTR("Item Not Found"), CFSTR("Follow up item could not be found"), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "finishWithError:", v29);

    }
  }

}

- (id)postFollowUpItem:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  AMSMutablePromise *v12;
  id v13;
  AMSMutablePromise *v14;
  AMSMutablePromise *v15;
  _QWORD block[5];
  id v18;
  AMSMutablePromise *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: Posting follow up item with identifier %{public}@", buf, 0x16u);

  }
  -[AMSFollowUp followUpQueue](self, "followUpQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AMSFollowUp_postFollowUpItem___block_invoke;
  block[3] = &unk_1E25414B8;
  block[4] = self;
  v18 = v4;
  v12 = v5;
  v19 = v12;
  v13 = v4;
  dispatch_async(v11, block);

  v14 = v19;
  v15 = v12;

  return v15;
}

void __32__AMSFollowUp_postFollowUpItem___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "backingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v2, "_pendingFollowUpWithBackingIdentifier:error:", v3, &v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v28;

  if (v5)
  {
    v6 = a1[6];
LABEL_13:
    objc_msgSend(v6, "finishWithError:", v5);
    goto LABEL_14;
  }
  if ((objc_msgSend(a1[5], "shouldOverwriteItem:", v4) & 1) == 0)
  {
    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = a1[5];
      v13 = v11;
      objc_msgSend(v12, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v11;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to post follow up item with identifier %{public}@; Unable to overwrite a follow up with higher priority.",
        buf,
        0x16u);

    }
    v15 = a1[6];
    AMSError(6, CFSTR("Unable To Overwrite"), CFSTR("Unable to overwrite a follow up with higher priority"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    goto LABEL_13;
  }
  if (v4)
  {
    v7 = objc_msgSend(v4, "priority");
    if (v7 == objc_msgSend(a1[5], "priority"))
      v8 = 1;
    else
      v8 = 2;
  }
  else
  {
    v8 = 2;
  }
  objc_msgSend(a1[5], "generateItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "followUpController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v18 = objc_msgSend(v17, "postFollowUpItem:error:", v16, &v27);
  v5 = v27;

  if ((v18 & 1) != 0)
  {
    v19 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finishWithResult:", v20);

  }
  else
  {
    if (v5)
    {
      +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = (void *)objc_opt_class();
        v24 = a1[5];
        v25 = v23;
        objc_msgSend(v24, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2114;
        v32 = v26;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_INFO, "%{public}@: Successfully posted follow up item with identifier %{public}@", buf, 0x16u);

      }
    }
    else
    {
      AMSError(0, CFSTR("Follow Up Post Failed"), CFSTR("Follow up post failed for an unknown reason"), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1[6], "finishWithError:", v5);
  }

LABEL_14:
}

- (id)_pendingFollowUpWithBackingIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  AMSFollowUpItem *v10;
  id v11;
  uint64_t v12;
  AMSFollowUpItem *i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AMSFollowUp followUpController](self, "followUpController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v7, "pendingFollowUpItems:", &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v27;

  if (v9)
  {
    if (a4)
    {
      v10 = 0;
      *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_opt_class();
        v20 = v19;
        AMSLogableError(v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v19;
        v31 = 2112;
        v32 = v6;
        v33 = 2114;
        v34 = v21;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch pending follow ups with identifier: %@ error: %{public}@", buf, 0x20u);

      }
      v10 = 0;
    }
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v8;
    v10 = (AMSFollowUpItem *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v12 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v10; i = (AMSFollowUpItem *)((char *)i + 1))
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v11);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "uniqueIdentifier", (_QWORD)v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v6, "isEqualToString:", v15);

          if (v16)
          {
            v10 = -[AMSFollowUpItem initWithFollowUpItem:]([AMSFollowUpItem alloc], "initWithFollowUpItem:", v14);
            goto LABEL_19;
          }
        }
        v10 = (AMSFollowUpItem *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_19:

  }
  return v10;
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (OS_dispatch_queue)followUpQueue
{
  return self->_followUpQueue;
}

- (void)setFollowUpQueue:(id)a3
{
  objc_storeStrong((id *)&self->_followUpQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpQueue, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
}

@end
