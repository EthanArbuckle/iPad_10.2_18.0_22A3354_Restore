@implementation AMSUIEngagementViewController

- (AMSUIEngagementViewController)initWithRequest:(id)a3 bag:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSUIEngagementViewController *v12;
  AMSUIEngagementViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIEngagementViewController;
  v12 = -[AMSUIEngagementViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bag, a4);
    objc_storeStrong((id *)&v13->_request, a3);
    objc_storeStrong((id *)&v13->_effectiveRequest, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    -[AMSUIEngagementViewController _setup](v13, "_setup");
  }

  return v13;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUIEngagementViewController;
  -[AMSUICommonViewController loadView](&v5, sel_loadView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_primaryBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIEngagementViewController;
  -[AMSUIEngagementViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIEngagementViewController;
  -[AMSUIEngagementViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!-[AMSUIEngagementViewController started](self, "started"))
  {
    -[AMSUIEngagementViewController setStarted:](self, "setStarted:", 1);
    -[AMSUIEngagementViewController _enqueueDisplayEvent](self, "_enqueueDisplayEvent");
    -[AMSUIEngagementViewController _startEngagement](self, "_startEngagement");
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementViewController;
  -[AMSUIEngagementViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIEngagementViewController childController](self, "childController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (id)requestIsSupported
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BE08078]);
  -[AMSUIEngagementViewController _preloadChildVC](self, "_preloadChildVC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__AMSUIEngagementViewController_requestIsSupported__block_invoke;
  v7[3] = &unk_24CB4FB08;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "addFinishBlock:", v7);

  return v5;
}

uint64_t __51__AMSUIEngagementViewController_requestIsSupported__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithSuccess");
  else
    return objc_msgSend(v2, "finishWithError:");
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

- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
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
  NSObject *v19;
  id v20;
  int v22;
  id v23;
  uint64_t v24;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  -[AMSUIEngagementViewController delegate](self, "delegate");
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
      v22 = 138543362;
      v23 = (id)objc_opt_class();
      v16 = v23;
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to request content view", (uint8_t *)&v22, 0xCu);

    }
    -[AMSUIEngagementViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "engagementViewController:contentViewWithDictionary:frame:", self, v10, x, y, width, height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = 138543362;
      v23 = (id)objc_opt_class();
      v20 = v23;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Delegate does not implement contentViewWithDictionary", (uint8_t *)&v22, 0xCu);

    }
    AMSError();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
  }

  return v18;
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI carrier link succeeded", (uint8_t *)&v18, 0x16u);

    }
    -[AMSUIEngagementViewController _receivedCarrierLinkResult:](self, "_receivedCarrierLinkResult:", v7);
  }
  else
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v15;
      v20 = 2114;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dynamic UI carrier link failed with error: %{public}@", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI purchase succeeded", (uint8_t *)&v18, 0x16u);

    }
    -[AMSUIEngagementViewController _receivedPurchaseResult:](self, "_receivedPurchaseResult:", v7);
  }
  else
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v15;
      v20 = 2114;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dynamic UI purchase failed with error: %{public}@", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI did resolve", (uint8_t *)&v14, 0x16u);

  }
  if (v8)
  {
    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BE08180]);
    objc_msgSend(v13, "setUserInfo:", v7);
  }
  -[AMSUIEngagementViewController resolveWithResult:error:](self, "resolveWithResult:error:", v13, v8);

}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig", a3);
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
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI will dismiss", (uint8_t *)&v9, 0x16u);

  }
  -[AMSUIEngagementViewController _dismiss](self, "_dismiss");
  return 0;
}

- (BOOL)dynamicViewController:(id)a3 handleDelegateAction:(id)a4 completionHandler:(id)a5
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
  char v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[AMSUIEngagementViewController delegate](self, "delegate");
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
      v35 = v14;
      v36 = 2114;
      v37 = v16;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to handle delegate action (identifier: %{public}@)", buf, 0x16u);

    }
    -[AMSUIEngagementViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __94__AMSUIEngagementViewController_dynamicViewController_handleDelegateAction_completionHandler___block_invoke;
    v31[3] = &unk_24CB4F4E8;
    v31[4] = self;
    v32 = v7;
    v33 = v8;
    v18 = objc_msgSend(v17, "engagementViewController:handleDynamicDelegateAction:completionHandler:", self, v32, v31);

    if ((v18 & 1) != 0)
    {
      v19 = 1;
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
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_opt_class();
      v22 = v21;
      objc_msgSend(v7, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v21;
      v36 = 2114;
      v37 = v23;
      _os_log_impl(&dword_211102000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Delegate does not implement handleDynamicDelegateAction (identifier: %{public}@)", buf, 0x16u);

    }
    AMSError();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v24);

  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v25, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_opt_class();
    v28 = v27;
    objc_msgSend(v7, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v27;
    v36 = 2114;
    v37 = v29;
    _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate action not handled (identifier: %{public}@)", buf, 0x16u);

  }
  (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x24BDBD1C0], 0);
  v19 = 0;
LABEL_18:

  return v19;
}

void __94__AMSUIEngagementViewController_dynamicViewController_handleDelegateAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v6 = (void *)MEMORY[0x24BE081D8];
    v7 = a4;
    objc_msgSend(v6, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web UI purchase succeeded", (uint8_t *)&v12, 0x16u);

    }
    -[AMSUIEngagementViewController _receivedPurchaseResult:](self, "_receivedPurchaseResult:", v7);

  }
}

- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BE081D8];
  v12 = a6;
  objc_msgSend(v11, "sharedConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_opt_class();
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v15;
    v20 = 2114;
    v21 = v16;
    _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web UI did resolve", (uint8_t *)&v18, 0x16u);

  }
  if (v10)
  {
    v17 = 0;
  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x24BE08180]);
    objc_msgSend(v17, "setUserInfo:", v9);
  }
  -[AMSUIEngagementViewController resolveWithResult:error:](self, "resolveWithResult:error:", v17, v10);
  (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, MEMORY[0x24BDBD1C8], 0);

}

- (void)_dismiss
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[AMSUIEngagementViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AMSUIEngagementViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "engagementViewControllerShouldDismiss:", self);

  }
  else
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
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caller not observing dismissals", buf, 0x16u);

    }
    -[AMSUIEngagementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_enqueueDisplayEvent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engagementMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    -[AMSUIEngagementViewController setEngagementMetrics:](self, "setEngagementMetrics:", v6);
  }
  else
  {
    -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("engagementItem.meta.metrics.engagementMetrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    -[AMSUIEngagementViewController setEngagementMetrics:](self, "setEngagementMetrics:", v10);
  }

  -[AMSUIEngagementViewController engagementMetrics](self, "engagementMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
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
      *(_DWORD *)buf = 138543618;
      v25 = v14;
      v26 = 2114;
      v27 = v15;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing display event.", buf, 0x16u);

    }
    -[AMSUIEngagementViewController engagementMetrics](self, "engagementMetrics", CFSTR("eventType"), CFSTR("engagementMetrics"), CFSTR("UnifiedMessageDisplayed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x24BE08148]);
    -[AMSUIEngagementViewController bag](self, "bag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithBag:", v19);
    v21 = (id)objc_msgSend(v20, "enqueueData:", v17);

  }
}

- (id)_isOriginatingURLTrusted
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originatingURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v31 = v5;
    v32 = 2114;
    v33 = v6;
    v34 = 2114;
    v35 = v8;
    v36 = 2114;
    v37 = v10;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking if originating URL %{public}@ is trusted for request %{public}@", buf, 0x2Au);

  }
  -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "originatingURL");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_9;
  }
  v13 = (void *)v12;
  -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "destinationStyle");

  if (v15)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    return v24;
  }
  v16 = objc_alloc_init(MEMORY[0x24BE08078]);
  +[AMSUIEngagementTask createBagForSubProfile](AMSUIEngagementTask, "createBagForSubProfile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayForKey:", CFSTR("trustedEngagementReferrers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valuePromise");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __57__AMSUIEngagementViewController__isOriginatingURLTrusted__block_invoke;
  v28[3] = &unk_24CB4F560;
  v21 = v16;
  v29 = v21;
  objc_msgSend(v19, "addErrorBlock:", v28);
  v26[0] = v20;
  v26[1] = 3221225472;
  v26[2] = __57__AMSUIEngagementViewController__isOriginatingURLTrusted__block_invoke_2;
  v26[3] = &unk_24CB4FBA8;
  v26[4] = self;
  v22 = v21;
  v27 = v22;
  objc_msgSend(v19, "addSuccessBlock:", v26);
  v23 = v27;
  v24 = v22;

  return v24;
}

void __57__AMSUIEngagementViewController__isOriginatingURLTrusted__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  AMSError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

void __57__AMSUIEngagementViewController__isOriginatingURLTrusted__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "effectiveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originatingURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "_isURLTrusted:inDomains:", v6, v4);

  v7 = *(void **)(a1 + 40);
  if ((_DWORD)v3)
  {
    objc_msgSend(v7, "finishWithSuccess");
  }
  else
  {
    AMSError();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v8);

  }
}

- (BOOL)_isURLTrusted:(id)a3 inDomains:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "length", (_QWORD)v15))
        {
          if (objc_msgSend(v12, "hasPrefix:", CFSTR(".")))
          {
            if ((objc_msgSend(v6, "hasSuffix:", v12) & 1) != 0)
              goto LABEL_15;
          }
          else if (!objc_msgSend(v6, "caseInsensitiveCompare:", v12))
          {
LABEL_15:
            v13 = 1;
            goto LABEL_16;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (int64_t)_modalPresentationStyle
{
  void *v2;
  uint64_t v3;

  -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationStyle");

  if (v3 == 3)
    return 1;
  else
    return 2 * (v3 != 2);
}

- (id)_preloadChildVC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[AMSUIEngagementViewController loadVCPromise](self, "loadVCPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AMSUIEngagementViewController _isOriginatingURLTrusted](self, "_isOriginatingURLTrusted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promiseAdapter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__AMSUIEngagementViewController__preloadChildVC__block_invoke;
    v8[3] = &unk_24CB4FBD0;
    v8[4] = self;
    objc_msgSend(v5, "thenWithBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementViewController setLoadVCPromise:](self, "setLoadVCPromise:", v6);

  }
  -[AMSUIEngagementViewController loadVCPromise](self, "loadVCPromise");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __48__AMSUIEngagementViewController__preloadChildVC__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "effectiveRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadViewControllerForEngagementController:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_receivedCarrierLinkResult:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BE08180];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setCarrierLinkResult:", v5);

  v8 = CFSTR("didCarrierLink");
  v9[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v7);

  -[AMSUIEngagementViewController resolveWithResult:error:](self, "resolveWithResult:error:", v6, 0);
}

- (void)_receivedPurchaseResult:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BE08180];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setPurchaseResult:", v5);

  v8 = CFSTR("didPurchase");
  v9[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v7);

  -[AMSUIEngagementViewController resolveWithResult:error:](self, "resolveWithResult:error:", v6, 0);
}

- (void)resolveWithResult:(id)a3 error:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  char v23;
  NSObject *v24;
  char v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t)a3;
  v7 = (unint64_t)a4;
  v8 = (void *)v7;
  if (!(v6 | v7))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v10;
      v30 = 2114;
      v31 = v11;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot resolve without either a result or error", (uint8_t *)&v28, 0x16u);
LABEL_31:

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v14;
      v30 = 2114;
      v31 = v15;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot resolve with both a result and error. Dropping result.", (uint8_t *)&v28, 0x16u);

    }
    goto LABEL_18;
  }
  if (!v6)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v20;
      v30 = 2114;
      v31 = v21;
      v32 = 2114;
      v33 = (uint64_t)v8;
      _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Resolving with an error: %{public}@", (uint8_t *)&v28, 0x20u);

    }
    v6 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    AMSLogKey();
    v19 = objc_claimAutoreleasedReturnValue();
    v28 = 138543874;
    v29 = v18;
    v30 = 2114;
    v31 = v19;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resolving with a result: %@", (uint8_t *)&v28, 0x20u);

  }
LABEL_23:

  -[AMSUIEngagementViewController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  -[AMSUIEngagementViewController delegate](self, "delegate");
  v24 = objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if ((v23 & 1) != 0)
  {
    -[NSObject engagementViewController:didFinishWithResult:error:](v24, "engagementViewController:didFinishWithResult:error:", self, v6, v8);
  }
  else
  {
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v9, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_opt_class();
        AMSLogKey();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v26;
        v30 = 2114;
        v31 = v27;
        _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caller not observing resolutions", (uint8_t *)&v28, 0x16u);

      }
      goto LABEL_31;
    }
    -[AMSUIEngagementViewController delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject engagementViewController:didResolveWithResult:error:](v9, "engagementViewController:didResolveWithResult:error:", self, v6, v8);
  }
LABEL_32:

}

- (void)updateEffectiveRequest:(id)a3
{
  AMSEngagementRequest *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  AMSEngagementRequest *effectiveRequest;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (AMSEngagementRequest *)a3;
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
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Effective request updated", (uint8_t *)&v10, 0x16u);

  }
  effectiveRequest = self->_effectiveRequest;
  self->_effectiveRequest = v4;

  -[AMSUIEngagementViewController _enqueueDisplayEvent](self, "_enqueueDisplayEvent");
}

- (void)_setup
{
  void *v3;
  uint64_t v4;
  AMSEngagementOfflineBag *v5;
  AMSEngagementOfflineBag *v6;
  id v7;

  -[AMSUIEngagementViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", -[AMSUIEngagementViewController _modalPresentationStyle](self, "_modalPresentationStyle"));
  -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "destinationStyle");

  if (v4 == 1)
  {
    v5 = [AMSEngagementOfflineBag alloc];
    -[AMSUIEngagementViewController bag](self, "bag");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = -[AMSEngagementOfflineBag initWithUnderlyingBag:](v5, "initWithUnderlyingBag:", v7);
    -[AMSUIEngagementViewController setBag:](self, "setBag:", v6);

  }
}

- (void)_startEngagement
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)AMSSetLogKey();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementViewController effectiveRequest](self, "effectiveRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting engagement task with URL: %{public}@", buf, 0x20u);

  }
  -[AMSUIEngagementViewController _preloadChildVC](self, "_preloadChildVC");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isFinished");
  v15 = MEMORY[0x24BDAC760];
  if ((v14 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke;
    block[3] = &unk_24CB4F0E8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  objc_initWeak((id *)buf, self);
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_2;
  v18[3] = &unk_24CB4FBF8;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v13, "addErrorBlock:", v18);
  v16[0] = v15;
  v16[1] = 3221225472;
  v16[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_6;
  v16[3] = &unk_24CB4FC20;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v13, "addSuccessBlock:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke(uint64_t a1)
{
  void *v1;
  AMSUICommonLoadingViewController *v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(AMSUICommonLoadingViewController);
  objc_msgSend(v1, "_updateChildViewController:", v2);

}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_3;
  v5[3] = &unk_24CB4F588;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  AMSUICommonErrorViewController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  AMSUICommonErrorViewController *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "effectiveRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)AMSSetLogKey();

  v7 = [AMSUICommonErrorViewController alloc];
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "effectiveRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "bag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_4;
  v20[3] = &unk_24CB4F800;
  objc_copyWeak(&v21, v2);
  v15 = v12;
  v16 = 3221225472;
  v17 = __49__AMSUIEngagementViewController__startEngagement__block_invoke_5;
  v18 = &unk_24CB4F800;
  objc_copyWeak(&v19, v2);
  v13 = -[AMSUICommonErrorViewController initWithError:logKey:bag:retryAction:cancelAction:](v7, "initWithError:logKey:bag:retryAction:cancelAction:", v8, v10, v11, v20, &v15);

  objc_msgSend(WeakRetained, "engagementMetrics", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonErrorViewController setEngagementMetrics:](v13, "setEngagementMetrics:", v14);

  objc_msgSend(WeakRetained, "_updateChildViewController:", v13);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "childController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "unsetChildViewController:", v1);

  objc_msgSend(WeakRetained, "setChildController:", 0);
  objc_msgSend(WeakRetained, "_startEngagement");

}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismiss");

}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_7;
  v5[3] = &unk_24CB4F588;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "effectiveRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)AMSSetLogKey();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(WeakRetained, "_updateChildViewController:", *(_QWORD *)(a1 + 32));

}

- (void)_updateChildViewController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__AMSUIEngagementViewController__updateChildViewController___block_invoke;
  v6[3] = &unk_24CB4F4C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __60__AMSUIEngagementViewController__updateChildViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "childController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "childController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unsetChildViewController:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "setChildController:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "childController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChildViewController:", v6);

}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (AMSUIEngagementViewControllerDelegate)delegate
{
  return (AMSUIEngagementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (AMSEngagementRequest)effectiveRequest
{
  return self->_effectiveRequest;
}

- (UIViewController)childController
{
  return self->_childController;
}

- (void)setChildController:(id)a3
{
  objc_storeStrong((id *)&self->_childController, a3);
}

- (NSDictionary)engagementMetrics
{
  return self->_engagementMetrics;
}

- (void)setEngagementMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_engagementMetrics, a3);
}

- (AMSPromise)loadVCPromise
{
  return self->_loadVCPromise;
}

- (void)setLoadVCPromise:(id)a3
{
  objc_storeStrong((id *)&self->_loadVCPromise, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_loadVCPromise, 0);
  objc_storeStrong((id *)&self->_engagementMetrics, 0);
  objc_storeStrong((id *)&self->_childController, 0);
  objc_storeStrong((id *)&self->_effectiveRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end
