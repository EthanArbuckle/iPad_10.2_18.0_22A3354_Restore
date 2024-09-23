@implementation AMSUIEngagementTask

- (AMSUIEngagementTask)initWithRequest:(id)a3 bag:(id)a4 presentingViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSUIEngagementTask *v12;
  AMSUIEngagementTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIEngagementTask;
  v12 = -[AMSTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bag, a4);
    objc_storeStrong((id *)&v13->_request, a3);
    objc_storeStrong((id *)&v13->_presentingViewController, a5);
  }

  return v13;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (id)presentEngagement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AMSUIEngagementTask presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[AMSUIEngagementTask _isRemotePresentationEnabled](self, "_isRemotePresentationEnabled"))
      -[AMSUIEngagementTask _presentEngagementRemotely](self, "_presentEngagementRemotely");
    else
      -[AMSUIEngagementTask _presentEngagementLocally](self, "_presentEngagementLocally");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promiseWithError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (AMSUIEngagementViewController)taskController
{
  AMSUIEngagementViewController *taskController;
  AMSUIEngagementViewController *v4;
  void *v5;
  void *v6;
  AMSUIEngagementViewController *v7;
  AMSUIEngagementViewController *v8;
  void *v9;

  taskController = self->_taskController;
  if (!taskController)
  {
    v4 = [AMSUIEngagementViewController alloc];
    -[AMSUIEngagementTask request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementTask bag](self, "bag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AMSUIEngagementViewController initWithRequest:bag:delegate:](v4, "initWithRequest:bag:delegate:", v5, v6, self);
    v8 = self->_taskController;
    self->_taskController = v7;

    -[AMSUIEngagementTask clientInfo](self, "clientInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementViewController setClientInfo:](self->_taskController, "setClientInfo:", v9);

    taskController = self->_taskController;
  }
  return taskController;
}

+ (AMSBagKeySet)bagKeySet
{
  return +[AMSUIWebViewController bagKeySet](AMSUIWebViewController, "bagKeySet");
}

+ (NSString)bagSubProfile
{
  return +[AMSUIWebViewController bagSubProfile](AMSUIWebViewController, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSUIWebViewController bagSubProfileVersion](AMSUIWebViewController, "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return +[AMSUIWebViewController createBagForSubProfile](AMSUIWebViewController, "createBagForSubProfile");
}

- (id)engagementViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  int v23;
  id v24;
  uint64_t v25;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  -[AMSUIEngagementTask delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if ((v12 & 1) != 0)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = (id)objc_opt_class();
      v16 = v24;
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to request content view", (uint8_t *)&v23, 0xCu);

    }
    -[AMSUIEngagementTask delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementTask taskController](self, "taskController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "engagementTaskViewController:contentViewWithDictionary:frame:", v18, v10, x, y, width, height);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = 138543362;
      v24 = (id)objc_opt_class();
      v21 = v24;
      _os_log_impl(&dword_211102000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Delegate does not implement contentViewWithDictionary", (uint8_t *)&v23, 0xCu);

    }
    AMSError();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
  }

  return v19;
}

- (void)engagementViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  -[AMSUIEngagementTask setError:](self, "setError:", a5);
  v7 = v23;
  if (v23)
  {
    -[AMSUIEngagementTask result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v23, "carrierLinkResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIEngagementTask result](self, "result");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCarrierLinkResult:", v9);

      objc_msgSend(v23, "purchaseResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIEngagementTask result](self, "result");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPurchaseResult:", v11);

      -[AMSUIEngagementTask result](self, "result");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userInfo");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = MEMORY[0x24BDBD1B8];
      if (v14)
        v17 = (void *)v14;
      else
        v17 = (void *)MEMORY[0x24BDBD1B8];
      objc_msgSend(v23, "userInfo");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = v18;
      else
        v20 = v16;
      objc_msgSend(v17, "ams_dictionaryByAddingEntriesFromDictionary:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIEngagementTask result](self, "result");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setUserInfo:", v21);

    }
    else
    {
      -[AMSUIEngagementTask setResult:](self, "setResult:", v23);
    }
    v7 = v23;
  }

}

- (void)engagementViewControllerShouldDismiss:(id)a3
{
  id v3;

  -[AMSUIEngagementTask taskController](self, "taskController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[AMSUIEngagementTask delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
      v14 = (void *)objc_opt_class();
      v15 = v14;
      objc_msgSend(v7, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v14;
      v37 = 2114;
      v38 = v16;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to handle delegate action (identifier: %{public}@)", buf, 0x16u);

    }
    -[AMSUIEngagementTask delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementTask taskController](self, "taskController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __94__AMSUIEngagementTask_engagementViewController_handleDynamicDelegateAction_completionHandler___block_invoke;
    v32[3] = &unk_24CB4F4E8;
    v32[4] = self;
    v33 = v7;
    v34 = v8;
    v19 = objc_msgSend(v17, "engagementTaskViewController:handleDynamicDelegateAction:completionHandler:", v18, v33, v32);

    if ((v19 & 1) != 0)
    {
      v20 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = (void *)objc_opt_class();
      v23 = v22;
      objc_msgSend(v7, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v22;
      v37 = 2114;
      v38 = v24;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: Delegate does not implement handleDynamicDelegateAction (identifier: %{public}@)", buf, 0x16u);

    }
    AMSError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v25);

  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)objc_opt_class();
    v29 = v28;
    objc_msgSend(v7, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v28;
    v37 = 2114;
    v38 = v30;
    _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate action not handled (identifier: %{public}@)", buf, 0x16u);

  }
  (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x24BDBD1C0], 0);
  v20 = 0;
LABEL_18:

  return v20;
}

void __94__AMSUIEngagementTask_engagementViewController_handleDynamicDelegateAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v23 = (void *)objc_opt_class();
      v24 = *(void **)(a1 + 40);
      v17 = v23;
      objc_msgSend(v24, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v23;
      v27 = 2114;
      v28 = v18;
      v19 = "%{public}@: Delegate responded with neither an error or response (identifier: %{public}@)";
      v20 = v14;
      v21 = OS_LOG_TYPE_ERROR;
      v22 = 22;
      goto LABEL_13;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v15 = (void *)objc_opt_class();
    v16 = *(void **)(a1 + 40);
    v17 = v15;
    objc_msgSend(v16, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v15;
    v27 = 2114;
    v28 = v18;
    v29 = 2114;
    v30 = v5;
    v19 = "%{public}@: Delegate responded with a response (identifier: %{public}@, response: %{public}@)";
    v20 = v14;
    v21 = OS_LOG_TYPE_DEFAULT;
    v22 = 32;
LABEL_13:
    _os_log_impl(&dword_211102000, v20, v21, v19, (uint8_t *)&v25, v22);

LABEL_14:
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_opt_class();
    v10 = *(void **)(a1 + 40);
    v11 = v9;
    objc_msgSend(v10, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v9;
    v27 = 2114;
    v28 = v6;
    v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Delegate responded with error (identifier: %{public}@, error: %{public}@)", (uint8_t *)&v25, 0x20u);

  }
  if (v5)
    goto LABEL_9;
LABEL_15:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

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

- (BOOL)_isInitialEngagementViewController
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  char v10;

  -[AMSUIEngagementTask clientInfo](self, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("iCloudQuota"));

  if (!v5)
    return -[AMSUIEngagementTask isRootRemotePresentation](self, "isRootRemotePresentation");
  -[AMSUIEngagementTask presentingViewController](self, "presentingViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend(v7, "parentViewController");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    while (v9);
    v10 = isKindOfClass ^ 1;

  }
  else
  {
    v10 = 1;
  }
  return v10 & 1;
}

- (BOOL)_isRemotePresentationEnabled
{
  _BOOL4 v3;

  v3 = -[AMSUIEngagementTask remotePresentation](self, "remotePresentation");
  if (v3)
    LOBYTE(v3) = !-[AMSUIEngagementTask _isRemoteViewService](self, "_isRemoteViewService");
  return v3;
}

- (BOOL)_isRemoteViewService
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_24CB8C928, "containsObject:", v3);

  return v4;
}

- (BOOL)_isWindowPresentation
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_24CB8C940, "containsObject:", v3);

  return v4;
}

- (id)_presentEngagementLocally
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BE08340]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke;
  v8[3] = &unk_24CB4F4C0;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "allowMultiplePresentations") & 1) == 0
    && ((objc_msgSend(*(id *)(a1 + 32), "isRunning") & 1) != 0
     || objc_msgSend(*(id *)(a1 + 32), "isFinished")))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "OSLogObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      AMSLogKey();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 32), "isRunning");
      v7 = objc_msgSend(*(id *)(a1 + 32), "isFinished");
      *(_DWORD *)buf = 138544130;
      v23 = v4;
      v24 = 2114;
      v25 = v5;
      v26 = 1024;
      v27 = v6;
      v28 = 1024;
      v29 = v7;
      _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement task not available. Running: %d, Finished: %d", buf, 0x22u);

    }
    v8 = *(void **)(a1 + 40);
    AMSError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v9);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
    objc_msgSend(*(id *)(a1 + 32), "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "silentlyCheckURL");

    v12 = MEMORY[0x24BDAC760];
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "taskController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "requestIsSupported");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_66;
      v20[3] = &unk_24CB4FA28;
      v15 = *(void **)(a1 + 40);
      v20[4] = *(_QWORD *)(a1 + 32);
      v21 = v15;
      objc_msgSend(v14, "addFinishBlock:", v20);

    }
    else
    {
      v16 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_presentTaskController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finishWithPromise:", v17);

    }
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_69;
    v19[3] = &unk_24CB4FA50;
    v18 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v18, "addFinishBlock:", v19);
  }
}

void __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
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
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
      objc_msgSend(*(id *)(a1 + 32), "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v7;
      v27 = 2114;
      v28 = v8;
      v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silently failing with URL: %{public}@", (uint8_t *)&v25, 0x20u);

    }
    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = v15;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "presented"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE07D30]);

    objc_msgSend(v4, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "code");
    objc_msgSend(v4, "ams_title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_message");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_underlyingError");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AMSCustomError();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v24);
  }
  else
  {
    v16 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_presentTaskController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishWithPromise:", v17);

  }
}

void __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_69(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_2;
  block[3] = &unk_24CB4F0E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismissing AMSUIEngagementTaskViewController", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "taskController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_presentEngagementRemotely
{
  AMSUIEngagementRemoteViewTask *v3;
  void *v4;
  void *v5;
  AMSUIEngagementRemoteViewTask *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = [AMSUIEngagementRemoteViewTask alloc];
  -[AMSUIEngagementTask request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIEngagementTask presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSUIEngagementRemoteViewTask initWithRequest:presentingViewController:](v3, "initWithRequest:presentingViewController:", v4, v5);

  -[AMSUIEngagementTask bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIEngagementRemoteViewTask setBag:](v6, "setBag:", v7);

  -[AMSUIEngagementTask clientInfo](self, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AMSUIEngagementRemoteViewTask setClientInfo:](v6, "setClientInfo:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementRemoteViewTask setClientInfo:](v6, "setClientInfo:", v9);

  }
  -[AMSUIEngagementRemoteViewTask presentEngagement](v6, "presentEngagement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_presentTaskController
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE08340]);
  -[AMSUIEngagementTask setPresented:](self, "setPresented:", 1);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting AMSUIEngagementTaskViewController", buf, 0x16u);

  }
  -[AMSUIEngagementTask taskController](self, "taskController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __45__AMSUIEngagementTask__presentTaskController__block_invoke;
  v15[3] = &unk_24CB4F4C0;
  v15[4] = self;
  v16 = v3;
  v10 = v3;
  v11 = -[AMSUIEngagementTask _presentViewController:dismissBlock:](self, "_presentViewController:dismissBlock:", v8, v15);

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __45__AMSUIEngagementTask__presentTaskController__block_invoke_75;
  v14[3] = &unk_24CB4FA78;
  v14[4] = self;
  objc_msgSend(v10, "catchWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __45__AMSUIEngagementTask__presentTaskController__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v4;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismiss block called", (uint8_t *)&v16, 0x16u);

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isFinished") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "error");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v7;
LABEL_8:
      objc_msgSend(v9, "finishWithError:", v8);
LABEL_15:

      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "result");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v11;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "request");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "failOnDismiss");

      if (v14)
      {
        v15 = *(void **)(a1 + 40);
        AMSError();
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v9 = v15;
        goto LABEL_8;
      }
      v8 = objc_alloc_init(MEMORY[0x24BE08180]);
      v12 = *(void **)(a1 + 40);
    }
    objc_msgSend(v12, "finishWithResult:", v8);
    goto LABEL_15;
  }
}

id __45__AMSUIEngagementTask__presentTaskController__block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "presented"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE07D30]);

  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "code");
  objc_msgSend(v3, "ams_title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_message");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_underlyingError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  AMSCustomError();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_presentViewController:(id)a3 dismissBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE08340]);
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke;
  aBlock[3] = &unk_24CB4F3C0;
  v10 = v8;
  v23 = v10;
  v11 = v7;
  v24 = v11;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke_2;
  v18[3] = &unk_24CB4FAE0;
  v18[4] = self;
  v19 = v6;
  v20 = v11;
  v21 = _Block_copy(aBlock);
  v12 = v21;
  v13 = v11;
  v14 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v18);
  v15 = v21;
  v16 = v10;

  return v16;
}

uint64_t __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = objc_alloc_init(MEMORY[0x24BE08180]);
  objc_msgSend(v2, "finishWithResult:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  AMSUIEngagementWrapperViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  AMSUIEngagementWrapperViewController *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_frontmostController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD17C8];
      v9 = objc_opt_class();
      v10 = v9;
      if (v7)
      {
        AMSLogKey();
        v1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v1);
      }
      else
      {
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v11;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Presenting view controller is nil!", buf, 0xCu);
      if (v7)
      {

        v11 = (void *)v1;
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPresentationRequest");

  if (v13)
  {
    v14 = -[AMSUIEngagementWrapperViewController initWithViewController:]([AMSUIEngagementWrapperViewController alloc], "initWithViewController:", *(_QWORD *)(a1 + 40));
    -[AMSUIEngagementWrapperViewController setDismissBlock:](v14, "setDismissBlock:", *(_QWORD *)(a1 + 48));
    -[AMSUIEngagementWrapperViewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", objc_msgSend(*(id *)(a1 + 32), "_modalPresentationStyle"));
    -[AMSUIEngagementWrapperViewController presentationController](v14, "presentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v14);

    objc_msgSend(*(id *)(a1 + 32), "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementWrapperViewController setModalInPresentation:](v14, "setModalInPresentation:", objc_msgSend(v16, "suppressInteractiveModalDismissal"));

    objc_msgSend(v4, "presentViewController:animated:completion:", v14, 1, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "presentationStyle");

    if (v18 == 4)
    {
      v14 = -[AMSUIEngagementCardWrapperViewController initWithViewController:]([AMSUIEngagementCardWrapperViewController alloc], "initWithViewController:", *(_QWORD *)(a1 + 40));
      objc_msgSend(MEMORY[0x24BE7B3F8], "defaultConfiguration");
      v19 = (AMSUIEngagementWrapperViewController *)objc_claimAutoreleasedReturnValue();
      -[AMSUIEngagementWrapperViewController setSupportsDarkMode:](v19, "setSupportsDarkMode:", 1);
      v20 = (id)objc_msgSend(v4, "presentProxCardFlowWithDelegate:initialViewController:configuration:", *(_QWORD *)(a1 + 32), v14, v19);
      objc_msgSend(*(id *)(a1 + 32), "request");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIEngagementWrapperViewController setPresentationStyle:](v14, "setPresentationStyle:", objc_msgSend(v21, "presentationStyle"));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cachedNavigationController");
      v14 = (AMSUIEngagementWrapperViewController *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v14 = (AMSUIEngagementWrapperViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", *(_QWORD *)(a1 + 40));
        -[AMSUIEngagementWrapperViewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", objc_msgSend(*(id *)(a1 + 32), "_modalPresentationStyle"));
        objc_msgSend(*(id *)(a1 + 32), "setCachedNavigationController:", v14);
      }
      v19 = -[AMSUIEngagementWrapperViewController initWithViewController:]([AMSUIEngagementWrapperViewController alloc], "initWithViewController:", v14);
      -[AMSUIEngagementWrapperViewController setModalPresentationStyle:](v19, "setModalPresentationStyle:", objc_msgSend(*(id *)(a1 + 32), "_modalPresentationStyle"));
      objc_msgSend(*(id *)(a1 + 32), "request");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIEngagementWrapperViewController setModalInPresentation:](v19, "setModalInPresentation:", objc_msgSend(v22, "suppressInteractiveModalDismissal"));

      objc_msgSend(*(id *)(a1 + 32), "request");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "presentationStyle");

      if (v24 == 5)
      {
        -[AMSUIEngagementWrapperViewController sheetPresentationController](v19, "sheetPresentationController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD950], "_detentWithIdentifier:resolutionContextBlock:", CFSTR("Custom"), &__block_literal_global_6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setDetents:", v27);

        objc_msgSend(v25, "setPrefersEdgeAttachedInCompactHeight:", 1);
        objc_msgSend(v25, "setPrefersScrollingExpandsWhenScrolledToEdge:", 0);
        objc_msgSend(v25, "setPreferredCornerRadius:", 12.0);

      }
      -[AMSUIEngagementWrapperViewController setDismissBlock:](v19, "setDismissBlock:", *(_QWORD *)(a1 + 56));
      -[AMSUIEngagementWrapperViewController presentationController](v14, "presentationController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setDelegate:", v19);

      objc_msgSend(v4, "presentViewController:animated:completion:", v19, 1, 0);
    }

  }
}

double __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke_88(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v2 = a2;
  objc_msgSend(v2, "_containerBounds");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  objc_msgSend(v2, "_fullHeightPresentedViewFrame");
  v9 = v8;
  v10 = objc_msgSend(v2, "_isEdgeAttached");
  v11 = 0.0;
  if (v10)
    objc_msgSend(v2, "_containerSafeAreaInsets");
  v12 = 1.1;
  if (!IsAccessibilityCategory)
    v12 = 1.0;
  v13 = dbl_2112546E0[v4 > 568.0];
  v14 = v12 * (v9 - v11);
  if (objc_msgSend(v2, "_isEdgeAttached"))
    v15 = v13;
  else
    v15 = 1.0;
  v16 = v14 * v15;

  return v16;
}

- (int64_t)_modalPresentationStyle
{
  void *v2;
  uint64_t v3;

  -[AMSUIEngagementTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationStyle");

  if (v3 == 3)
    return 1;
  else
    return 2 * (v3 != 2);
}

- (BOOL)allowMultiplePresentations
{
  return self->_allowMultiplePresentations;
}

- (void)setAllowMultiplePresentations:(BOOL)a3
{
  self->_allowMultiplePresentations = a3;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (AMSUIEngagementTaskDelegate)delegate
{
  return (AMSUIEngagementTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isRootRemotePresentation
{
  return self->_isRootRemotePresentation;
}

- (void)setIsRootRemotePresentation:(BOOL)a3
{
  self->_isRootRemotePresentation = a3;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (BOOL)remotePresentation
{
  return self->_remotePresentation;
}

- (void)setRemotePresentation:(BOOL)a3
{
  self->_remotePresentation = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (UIViewController)cachedNavigationController
{
  return self->_cachedNavigationController;
}

- (void)setCachedNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_cachedNavigationController, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)presented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (AMSEngagementResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cachedNavigationController, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_taskController, 0);
}

@end
