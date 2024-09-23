@implementation AMSSharedStoreReview

- (void)applicationDidForeground
{
  NSObject *v3;
  _QWORD block[5];

  if (+[AMSSharedStoreReview _isGroupedLogicSupported](AMSSharedStoreReview, "_isGroupedLogicSupported"))
  {
    -[AMSStoreReviewGatingController didEnterForegroundWithCompletionHandler:](self->_storeReviewGatingController, "didEnterForegroundWithCompletionHandler:", &__block_literal_global_116);
  }
  else
  {
    -[AMSSharedStoreReview sharedStoreReviewQueue](self, "sharedStoreReviewQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AMSSharedStoreReview_applicationDidForeground__block_invoke_2;
    block[3] = &unk_1E253DBD8;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (AMSSharedStoreReview)initWithBag:(id)a3
{
  id v5;
  AMSSharedStoreReview *v6;
  AMSSharedStoreReview *v7;
  AMSStoreReviewGatingController *v8;
  NSObject *p_super;
  dispatch_queue_t v10;
  OS_dispatch_queue *sharedStoreReviewQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSSharedStoreReview;
  v6 = -[AMSSharedStoreReview init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    if (+[AMSSharedStoreReview _isGroupedLogicSupported](AMSSharedStoreReview, "_isGroupedLogicSupported"))
    {
      v8 = -[AMSStoreReviewGatingController initWithBag:]([AMSStoreReviewGatingController alloc], "initWithBag:", v5);
      p_super = &v7->_storeReviewGatingController->super;
      v7->_storeReviewGatingController = v8;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      p_super = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create("com.apple.AppleMediaServices.sharedstorereview", p_super);
      sharedStoreReviewQueue = v7->_sharedStoreReviewQueue;
      v7->_sharedStoreReviewQueue = (OS_dispatch_queue *)v10;

    }
  }

  return v7;
}

+ (BOOL)_isGroupedLogicSupported
{
  return _os_feature_enabled_impl();
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "bagKeySet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBagKeySet registerBagKeySet:forProfile:profileVersion:](AMSBagKeySet, "registerBagKeySet:forProfile:profileVersion:", v2, v3, v4);

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSSharedStoreReview");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_storeReviewGatingController, 0);
  objc_storeStrong((id *)&self->_sharedStoreReviewQueue, 0);
}

- (BOOL)isEnabled
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AMSSharedStoreReview bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "BOOLForKey:", 0x1E254CFE0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "valueWithError:", &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetching enabled bag value error: %{public}@", buf, 0x20u);

    }
    v6 = 0;
  }

  return v6;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (id)isReviewEnabled
{
  void *v2;
  void *v3;
  void *v4;

  -[AMSSharedStoreReview bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "BOOLForKey:", 0x1E254CFE0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valuePromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __48__AMSSharedStoreReview_applicationDidForeground__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "integerForKey:", 0x1E254D040);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v3, "valueWithError:", &v12);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v12;

    if (v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_opt_class();
        AMSSetLogKeyIfNeeded();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v14 = v8;
        v15 = 2114;
        v16 = v9;
        v17 = 2114;
        v18 = v10;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Session interval bag value error: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      +[AMSSharedStoreReview _storeReviewMetrics](AMSSharedStoreReview, "_storeReviewMetrics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = objc_claimAutoreleasedReturnValue();
      +[AMSSharedStoreReview _applicationDidForegroundWithCurrentTime:storeReviewMetrics:sessionInterval:](AMSSharedStoreReview, "_applicationDidForegroundWithCurrentTime:storeReviewMetrics:sessionInterval:", v7, v6, -[NSObject integerValue](v4, "integerValue"));
    }

    goto LABEL_13;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSSetLogKeyIfNeeded();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping tracking for foreground as shared store review is disabled.", buf, 0x16u);
LABEL_13:

  }
}

- (void)didAttemptPromptReview
{
  NSObject *v3;
  _QWORD block[5];

  if (+[AMSSharedStoreReview _isGroupedLogicSupported](AMSSharedStoreReview, "_isGroupedLogicSupported"))
  {
    -[AMSStoreReviewGatingController didPromptWithCompletionHandler:](self->_storeReviewGatingController, "didPromptWithCompletionHandler:", &__block_literal_global_14_2);
  }
  else
  {
    -[AMSSharedStoreReview sharedStoreReviewQueue](self, "sharedStoreReviewQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__AMSSharedStoreReview_didAttemptPromptReview__block_invoke_2;
    block[3] = &unk_1E253DBD8;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

void __46__AMSSharedStoreReview_didAttemptPromptReview__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) != 0)
  {
    +[AMSSharedStoreReview _storeReviewMetrics](AMSSharedStoreReview, "_storeReviewMetrics");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSSharedStoreReview _logDidAttemptPromptReviewWithStoreReviewMetrics:currentTime:](AMSSharedStoreReview, "_logDidAttemptPromptReviewWithStoreReviewMetrics:currentTime:", v6, v1);

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "OSLogObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping tracking for did attempt review as shared store review is disabled.", buf, 0x16u);

    }
  }
}

- (id)shouldAttemptReview
{
  AMSMutablePromise *v3;
  AMSStoreReviewGatingController *storeReviewGatingController;
  AMSMutablePromise *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[4];
  AMSMutablePromise *v10;

  if (+[AMSSharedStoreReview _isGroupedLogicSupported](AMSSharedStoreReview, "_isGroupedLogicSupported"))
  {
    v3 = objc_alloc_init(AMSMutablePromise);
    storeReviewGatingController = self->_storeReviewGatingController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke;
    v9[3] = &unk_1E2545798;
    v5 = v3;
    v10 = v5;
    -[AMSStoreReviewGatingController canPromptWithCompletionHandler:](storeReviewGatingController, "canPromptWithCompletionHandler:", v9);
    v6 = v10;
  }
  else
  {
    -[AMSSharedStoreReview isReviewEnabled](self, "isReviewEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_2;
    v8[3] = &unk_1E25457C0;
    v8[4] = self;
    objc_msgSend(v6, "continueWithBlock:", v8);
    v5 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

id __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping checking for should attempt review as shared store review is disabled.", buf, 0x16u);

    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "integerForKey:", 0x1E254D020);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valuePromise");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_19;
    v14[3] = &unk_1E25457C0;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "continueWithBlock:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Session count bag value error: %{public}@", buf, 0x20u);

    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSSharedStoreReview _storeReviewMetrics](AMSSharedStoreReview, "_storeReviewMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[AMSSharedStoreReview _isRepeatedPromptsSupported](AMSSharedStoreReview, "_isRepeatedPromptsSupported"))
    {
      objc_msgSend(*(id *)(a1 + 32), "bag");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "integerForKey:", 0x1E254D000);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "valuePromise");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_20;
      v20[3] = &unk_1E2541FD8;
      v20[4] = *(_QWORD *)(a1 + 32);
      v21 = v13;
      v22 = v5;
      objc_msgSend(v16, "continueWithBlock:", v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:sessionCount:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:sessionCount:", v13, objc_msgSend(v5, "integerValue"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v12;
}

id __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v9;
      v22 = 2114;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Prompt interval bag value fetch failed: %{public}@, falling back to behaviour without repeated prompt support", (uint8_t *)&v20, 0x20u);

    }
    v12 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:sessionCount:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:sessionCount:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "integerValue"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:currentTime:sessionCount:promptInterval:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:currentTime:sessionCount:promptInterval:", v15, v16, objc_msgSend(*(id *)(a1 + 48), "integerValue"), objc_msgSend(v5, "integerValue"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (BOOL)shouldAttemptPromptReview
{
  dispatch_semaphore_t v3;
  AMSStoreReviewGatingController *storeReviewGatingController;
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  _BYTE *v32;
  _BYTE buf[24];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (+[AMSSharedStoreReview _isGroupedLogicSupported](AMSSharedStoreReview, "_isGroupedLogicSupported"))
  {
    v3 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    storeReviewGatingController = self->_storeReviewGatingController;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __49__AMSSharedStoreReview_shouldAttemptPromptReview__block_invoke;
    v30[3] = &unk_1E25457E8;
    v32 = buf;
    v5 = v3;
    v31 = v5;
    -[AMSStoreReviewGatingController canPromptWithCompletionHandler:](storeReviewGatingController, "canPromptWithCompletionHandler:", v30);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    v6 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else if (-[AMSSharedStoreReview isEnabled](self, "isEnabled"))
  {
    -[AMSSharedStoreReview bag](self, "bag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "integerForKey:", 0x1E254D020);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v8, "valueWithError:", &v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v29;

    if (v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_opt_class();
        AMSSetLogKeyIfNeeded();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2114;
        v34 = v14;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Session count bag value error: %{public}@", buf, 0x20u);

      }
      v6 = 0;
    }
    else
    {
      +[AMSSharedStoreReview _storeReviewMetrics](AMSSharedStoreReview, "_storeReviewMetrics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[AMSSharedStoreReview _isRepeatedPromptsSupported](AMSSharedStoreReview, "_isRepeatedPromptsSupported"))
      {
        -[AMSSharedStoreReview bag](self, "bag");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "integerForKey:", 0x1E254D000);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        objc_msgSend(v19, "valueWithError:", &v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v28;

        if (v5)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v21, "OSLogObject");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_opt_class();
            AMSSetLogKeyIfNeeded();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            AMSLogableError(v5);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2114;
            v34 = v25;
            _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Prompt interval bag value fetch failed: %{public}@, falling back to behaviour without repeated prompt support", buf, 0x20u);

          }
          v6 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:sessionCount:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:sessionCount:", v10, objc_msgSend(v9, "integerValue"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:currentTime:sessionCount:promptInterval:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:currentTime:sessionCount:promptInterval:", v10, v26, objc_msgSend(v9, "integerValue"), objc_msgSend(v20, "integerValue"));

        }
      }
      else
      {
        v6 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:sessionCount:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:sessionCount:", v10, objc_msgSend(v9, "integerValue"));
        v5 = 0;
      }
    }

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v5, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping checking for should attempt review as shared store review is disabled.", buf, 0x16u);

    }
    v6 = 0;
  }

  return v6;
}

intptr_t __49__AMSSharedStoreReview_shouldAttemptPromptReview__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_applicationDidForegroundWithCurrentTime:(id)a3 storeReviewMetrics:(id)a4 sessionInterval:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("last-session-timestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[AMSSharedStoreReview _shouldLogNewSessionWithLastLoggedTimeStamp:currentTime:sessionInterval:](AMSSharedStoreReview, "_shouldLogNewSessionWithLastLoggedTimeStamp:currentTime:sessionInterval:", v9, v7, a5))
  {
    +[AMSSharedStoreReview _logNewSessionWithStoreReviewMetrics:currentTime:](AMSSharedStoreReview, "_logNewSessionWithStoreReviewMetrics:currentTime:", v8, v7);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping tracking for foreground as last logged time stamp is within session interval.", (uint8_t *)&v14, 0x16u);

    }
  }

}

+ (BOOL)_shouldLogNewSessionWithLastLoggedTimeStamp:(id)a3 currentTime:(id)a4 sessionInterval:(int64_t)a5
{
  double v6;

  if (!a3)
    return 1;
  objc_msgSend(a4, "timeIntervalSinceDate:");
  return v6 >= (double)a5;
}

+ (id)_storeReviewMetrics
{
  void *v2;
  void *v3;
  __objc2_class *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal"))
  {
    v4 = AMSDefaults;
  }
  else
  {
    v4 = AMSStorage;
  }
  -[__objc2_class sharedStoreReviewMetricsForProcess:](v4, "sharedStoreReviewMetricsForProcess:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  v6 = v5;

  if (!v6)
  {
LABEL_8:
    v8 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v7 = 0;
    goto LABEL_9;
  }
  v7 = v6;
  v8 = v7;
LABEL_9:

  return v8;
}

+ (void)_logNewSessionWithStoreReviewMetrics:(id)a3 currentTime:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("last-session-timestamp"));

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("session-count"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &unk_1E25AF9E0;
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "integerValue") + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("session-count"));
  v12 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(a1, "_persistStoreReviewMetrics:", v12);

}

+ (void)_logDidAttemptPromptReviewWithStoreReviewMetrics:(id)a3 currentTime:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("did-attempt-review-timestamp"));

  v7 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(a1, "_persistStoreReviewMetrics:", v7);

}

+ (void)_persistStoreReviewMetrics:(id)a3
{
  id v3;
  void *v4;
  __objc2_class *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal"))
  {
    v5 = AMSDefaults;
  }
  else
  {
    v5 = AMSStorage;
  }
  v6 = (void *)objc_msgSend(v3, "copy");

  -[__objc2_class setSharedStoreReviewMetrics:forProcess:](v5, "setSharedStoreReviewMetrics:forProcess:", v6, v7);
}

+ (BOOL)_shouldPromptReviewForStoreReviewMetrics:(id)a3 sessionCount:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("session-count"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &unk_1E25AF9E0;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("did-attempt-review-timestamp"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = 0;
  else
    v11 = objc_msgSend(v9, "integerValue") >= a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    AMSSetLogKeyIfNeeded();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v19 = 138544386;
    v17 = CFSTR("Not prompted before.");
    v20 = v14;
    if (v10)
      v17 = v10;
    v21 = 2114;
    v22 = v15;
    v23 = 1024;
    v24 = v11;
    v25 = 2114;
    v26 = v9;
    v27 = 2114;
    v28 = v17;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Should prompt: %d, with session count: %{public}@, last attempt: %{public}@", (uint8_t *)&v19, 0x30u);

  }
  return v11;
}

+ (BOOL)_shouldPromptReviewForStoreReviewMetrics:(id)a3 currentTime:(id)a4 sessionCount:(int64_t)a5 promptInterval:(int64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  double v16;
  double v17;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session-count"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &unk_1E25AF9E0;
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("did-attempt-review-timestamp"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "timeIntervalSinceDate:", v15);
  v17 = v16;

  v19 = (v17 >= (double)a6 || v15 == 0) && objc_msgSend(v14, "integerValue") >= a5;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_opt_class();
    AMSSetLogKeyIfNeeded();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v27 = 138544642;
    v25 = CFSTR("Not prompted before.");
    v28 = v22;
    if (v15)
      v25 = v15;
    v29 = 2114;
    v30 = v23;
    v31 = 1024;
    v32 = v19;
    v33 = 2114;
    v34 = v14;
    v35 = 2114;
    v36 = v25;
    v37 = 2048;
    v38 = a6;
    _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Should prompt: %d, with session count: %{public}@, last attempt: %{public}@, prompt interval: %ld", (uint8_t *)&v27, 0x3Au);

  }
  return v19;
}

+ (BOOL)_isRepeatedPromptsSupported
{
  return _os_feature_enabled_impl();
}

- (OS_dispatch_queue)sharedStoreReviewQueue
{
  return self->_sharedStoreReviewQueue;
}

- (AMSStoreReviewGatingController)storeReviewGatingController
{
  return self->_storeReviewGatingController;
}

- (void)setStoreReviewGatingController:(id)a3
{
  objc_storeStrong((id *)&self->_storeReviewGatingController, a3);
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

@end
