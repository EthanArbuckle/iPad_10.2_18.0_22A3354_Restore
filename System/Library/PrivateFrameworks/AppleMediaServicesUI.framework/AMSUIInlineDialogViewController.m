@implementation AMSUIInlineDialogViewController

- (AMSUIInlineDialogViewController)init
{
  AMSUIInlineDialogViewController *v2;
  AMSUIInlineDialogViewController *v3;
  AMSBinaryPromise *v4;
  AMSBinaryPromise *loadPromise;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSUIInlineDialogViewController;
  v2 = -[AMSUIInlineDialogViewController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_impressionsReportingFrequency = 1;
    v4 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x24BE08078]);
    loadPromise = v3->_loadPromise;
    v3->_loadPromise = v4;

    -[AMSBinaryPromise finishWithSuccess](v3->_loadPromise, "finishWithSuccess");
    v3->_shouldAutomaticallyReportMetrics = 1;
  }
  return v3;
}

- (AMSUIInlineDialogViewController)initWithRequest:(id)a3
{
  id v5;
  AMSUIInlineDialogViewController *v6;
  AMSUIInlineDialogViewController *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIInlineDialogViewController;
  v6 = -[AMSUIInlineDialogViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dialogRequest, a3);
    v7->_impressionsReportingFrequency = 1;
    v7->_shouldAutomaticallyReportMetrics = 1;
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
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
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initialized with a dialog request, will not listen for engagement pushes.", buf, 0x16u);

    }
  }

  return v7;
}

- (AMSUIInlineDialogViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v9;
  id v10;
  AMSUIInlineDialogViewController *v11;
  AMSUIInlineDialogViewController *v12;

  v9 = a4;
  v10 = a5;
  v11 = -[AMSUIInlineDialogViewController initWithRequest:](self, "initWithRequest:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a5);
    objc_storeStrong((id *)&v12->_bag, a4);
  }

  return v12;
}

- (AMSUIInlineDialogViewController)initWithServiceType:(id)a3 placement:(id)a4
{
  id v7;
  id v8;
  AMSUIInlineDialogViewController *v9;
  AMSEngagement *v10;
  AMSEngagement *engagement;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AMSUIInlineDialogViewController;
  v9 = -[AMSUIInlineDialogViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    v10 = (AMSEngagement *)objc_alloc_init(MEMORY[0x24BE08148]);
    engagement = v9->_engagement;
    v9->_engagement = v10;

    v9->_impressionsReportingFrequency = 1;
    objc_storeStrong((id *)&v9->_placement, a4);
    objc_storeStrong((id *)&v9->_serviceType, a3);
    v9->_shouldAutomaticallyReportMetrics = 1;
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
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
      *(_DWORD *)buf = 138544130;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      v22 = 2114;
      v23 = v8;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initialized (placement: %{public}@, serviceType: %{public}@)", buf, 0x2Au);

    }
    -[AMSUIInlineDialogViewController _setupEngagement](v9, "_setupEngagement");
  }

  return v9;
}

- (AMSUIInlineDialogViewController)initWithServiceType:(id)a3 placement:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSUIInlineDialogViewController *v12;
  AMSEngagement *v13;
  AMSEngagement *engagement;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIInlineDialogViewController;
  v12 = -[AMSUIInlineDialogViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  if (v12)
  {
    v13 = (AMSEngagement *)objc_alloc_init(MEMORY[0x24BE08148]);
    engagement = v12->_engagement;
    v12->_engagement = v13;

    objc_storeStrong((id *)&v12->_context, a5);
    objc_storeStrong((id *)&v12->_placement, a4);
    objc_storeStrong((id *)&v12->_serviceType, a3);
    v12->_shouldAutomaticallyReportMetrics = 1;
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v17;
      v23 = 2114;
      v24 = v18;
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v9;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initialized (placement: %{public}@, serviceType: %{public}@)", buf, 0x2Au);

    }
    -[AMSUIInlineDialogViewController _setupEngagement](v12, "_setupEngagement");
  }

  return v12;
}

- (AMSUIInlineDialogViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5 account:(id)a6 context:(id)a7
{
  id v13;
  id v14;
  AMSUIInlineDialogViewController *v15;
  AMSUIInlineDialogViewController *v16;

  v13 = a5;
  v14 = a6;
  v15 = -[AMSUIInlineDialogViewController initWithServiceType:placement:context:](self, "initWithServiceType:placement:context:", a3, a4, a7);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a6);
    objc_storeStrong((id *)&v16->_bag, a5);
  }

  return v16;
}

- (void)loadView
{
  AMSUIInlineDialogView *v3;
  AMSUIInlineDialogView *v4;
  void *v5;
  id v6;

  v3 = [AMSUIInlineDialogView alloc];
  v4 = -[AMSUICommonView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AMSUIInlineDialogViewController setView:](self, "setView:", v4);

  -[AMSUIInlineDialogViewController dialogRequest](self, "dialogRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIInlineDialogViewController dialogRequest](self, "dialogRequest");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSUIInlineDialogViewController _setDialogRequest:](self, "_setDialogRequest:", v6);

  }
}

- (void)_setDialogRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "style") == 3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
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
      v18 = 138543618;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Rendering message as Banner", (uint8_t *)&v18, 0x16u);

    }
    -[AMSUIInlineDialogViewController _setDialogRequestBanner:](self, "_setDialogRequestBanner:", v4);
  }
  else
  {
    v9 = objc_msgSend(v4, "style");
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 == 6)
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_opt_class();
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v13;
        v20 = 2114;
        v21 = v14;
        _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Rendering message as Dashboard Message", (uint8_t *)&v18, 0x16u);

      }
      -[AMSUIInlineDialogViewController _setDialogRequestDashboardMessage:](self, "_setDialogRequestDashboardMessage:", v4);
    }
    else
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
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
        _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Rendering message as Bubble Tip", (uint8_t *)&v18, 0x16u);

      }
      -[AMSUIInlineDialogViewController _setDialogRequestBubbleTip:](self, "_setDialogRequestBubbleTip:", v4);
    }
  }

}

- (void)_setDialogRequestBanner:(id)a3
{
  id v4;
  AMSUIBannerMessageViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  AMSUIBannerMessageViewController *v10;

  v4 = a3;
  v5 = [AMSUIBannerMessageViewController alloc];
  -[AMSUIInlineDialogViewController bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIInlineDialogViewController account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIBannerMessageViewController initWithRequest:bag:account:](v5, "initWithRequest:bag:account:", v4, v6, v7);

  -[AMSUIInlineDialogViewController preferredAppearance](self, "preferredAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  -[AMSUIBannerMessageViewController setPreferredAppearance:](v10, "setPreferredAppearance:", v9);
  -[AMSUIBaseMessageViewController setDelegate:](v10, "setDelegate:", self);
  -[AMSUIInlineDialogViewController _setContentController:](self, "_setContentController:", v10);

}

- (void)_setDialogRequestBubbleTip:(id)a3
{
  id v4;
  AMSUIBubbleTipViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  AMSUIBubbleTipViewController *v10;

  v4 = a3;
  v5 = [AMSUIBubbleTipViewController alloc];
  -[AMSUIInlineDialogViewController bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIInlineDialogViewController account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIBubbleTipViewController initWithRequest:bag:account:](v5, "initWithRequest:bag:account:", v4, v6, v7);

  -[AMSUIInlineDialogViewController preferredAppearance](self, "preferredAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  -[AMSUIBubbleTipViewController setPreferredAppearance:](v10, "setPreferredAppearance:", v9);
  -[AMSUIBaseMessageViewController setDelegate:](v10, "setDelegate:", self);
  -[AMSUIInlineDialogViewController _setContentController:](self, "_setContentController:", v10);

}

- (void)_setDialogRequestDashboardMessage:(id)a3
{
  id v4;
  AMSUIDashboardMessageViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  AMSUIDashboardMessageViewController *v10;

  v4 = a3;
  v5 = [AMSUIDashboardMessageViewController alloc];
  -[AMSUIInlineDialogViewController bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIInlineDialogViewController account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIDashboardMessageViewController initWithRequest:bag:account:](v5, "initWithRequest:bag:account:", v4, v6, v7);

  -[AMSUIInlineDialogViewController preferredAppearance](self, "preferredAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  -[AMSUIDashboardMessageViewController setPreferredAppearance:](v10, "setPreferredAppearance:", v9);
  -[AMSUIBaseMessageViewController setDelegate:](v10, "setDelegate:", self);
  -[AMSUIInlineDialogViewController _setContentController:](self, "_setContentController:", v10);

}

- (void)_setContentController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromParentViewController");

    -[AMSUIInlineDialogViewController setChildContentController:](self, "setChildContentController:", 0);
  }
  if (v4)
  {
    objc_msgSend(v4, "setShouldAutomaticallyReportMetrics:", -[AMSUIInlineDialogViewController shouldAutomaticallyReportMetrics](self, "shouldAutomaticallyReportMetrics"));
    objc_msgSend(v4, "setImpressionsReportingFrequency:", -[AMSUIInlineDialogViewController impressionsReportingFrequency](self, "impressionsReportingFrequency"));
    -[AMSUIInlineDialogViewController setChildContentController:](self, "setChildContentController:", v4);
    objc_initWeak(&location, v4);
    objc_msgSend(v4, "loadPromise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__AMSUIInlineDialogViewController__setContentController___block_invoke;
    v10[3] = &unk_24CB4FDF8;
    objc_copyWeak(&v11, &location);
    v10[4] = self;
    objc_msgSend(v9, "addFinishBlock:", v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __57__AMSUIInlineDialogViewController__setContentController___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__AMSUIInlineDialogViewController__setContentController___block_invoke_2;
  v2[3] = &unk_24CB4F588;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
}

void __57__AMSUIInlineDialogViewController__setContentController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "childContentController");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v3 == WeakRetained)
    {
      if (!v4)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_opt_class();
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v12;
        v32 = 2114;
        v33 = v13;
        _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Child controller loaded, adding to view heiarchy", buf, 0x16u);

      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "view", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subviews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "removeFromSuperview");
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v17);
      }

      objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", WeakRetained);
      objc_msgSend(*(id *)(a1 + 32), "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", v21);

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(void **)(a1 + 32);
      objc_msgSend(v22, "view");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject bounds](v6, "bounds");
      objc_msgSend(v5, "messageViewController:didUpdateSize:", v22, v23, v24);
    }
    else
    {
      if (!v4)
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
        v31 = v7;
        v32 = 2114;
        v33 = v8;
        v9 = "%{public}@: [%{public}@] Child controller loaded but a different child is being presented";
LABEL_11:
        _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
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
      v10 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v8;
      v9 = "%{public}@: [%{public}@] Child controller loaded but disappeared";
      goto LABEL_11;
    }
  }

}

- (void)_tearDownContentView
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
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
      v17 = 138543618;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Tearing down content", (uint8_t *)&v17, 0x16u);

    }
    -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromParentViewController");

    -[AMSUIInlineDialogViewController setChildContentController:](self, "setChildContentController:", 0);
    -[AMSUIInlineDialogViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsLayout");

    -[AMSUIInlineDialogViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIInlineDialogViewController view](self, "view");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject frame](v13, "frame");
    objc_msgSend(v5, "messageViewController:didUpdateSize:", self, v14, 0.0);
  }
  else
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2114;
      v20 = v16;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No content to teardown.", (uint8_t *)&v17, 0x16u);

    }
  }

}

- (void)enqueueImpressionMetrics
{
  id v2;

  -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueImpressionMetrics");

}

- (void)setPreferredAppearance:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_7;
  }
  else
  {

  }
  -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
  {
LABEL_7:
    -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredAppearance:", v8);
    goto LABEL_8;
  }
LABEL_9:

}

- (AMSUIAppearance)preferredAppearance
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;
  void *v7;

  -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v6 = objc_opt_isKindOfClass();

    if ((v6 & 1) == 0)
    {
      v7 = 0;
      return (AMSUIAppearance *)v7;
    }
    -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "preferredAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSUIAppearance *)v7;
}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSUIInlineDialogViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[AMSUIInlineDialogViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageViewController:enqueueEventWithFields:inTopic:", v13, v8, v9);

  }
}

- (unint64_t)impressionsReportingFrequency
{
  return self->_impressionsReportingFrequency;
}

- (void)setImpressionsReportingFrequency:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImpressionsReportingFrequency:", a3);

  }
  self->_impressionsReportingFrequency = a3;
}

- (BOOL)shouldAutomaticallyReportMetrics
{
  return self->_shouldAutomaticallyReportMetrics;
}

- (void)setShouldAutomaticallyReportMetrics:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIInlineDialogViewController childContentController](self, "childContentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldAutomaticallyReportMetrics:", v3);

  }
  self->_shouldAutomaticallyReportMetrics = v3;
}

- (void)_setupEngagement
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[AMSUIInlineDialogViewController engagement](self, "engagement");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v29 = (id)v3;
    -[AMSUIInlineDialogViewController serviceType](self, "serviceType");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[AMSUIInlineDialogViewController placement](self, "placement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v7, "OSLogObject");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_opt_class();
          AMSLogKey();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v9;
          v35 = 2114;
          v36 = v10;
          _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing initial message event request", buf, 0x16u);

        }
        v11 = objc_alloc(MEMORY[0x24BE08158]);
        -[AMSUIInlineDialogViewController serviceType](self, "serviceType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc(MEMORY[0x24BE08170]);
        -[AMSUIInlineDialogViewController placement](self, "placement");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIInlineDialogViewController context](self, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v13, "initWithPlacement:context:", v14, v15);
        v32 = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v11, "initWithServiceType:placementInfo:", v12, v17);

        -[AMSUIInlineDialogViewController engagement](self, "engagement");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "enqueueMessageEvent:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = MEMORY[0x24BDAC760];
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke;
        v31[3] = &unk_24CB4FE20;
        v31[4] = self;
        objc_msgSend(v20, "addSuccessBlock:", v31);
        v30[0] = v21;
        v30[1] = 3221225472;
        v30[2] = __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_2;
        v30[3] = &unk_24CB4F560;
        v30[4] = self;
        objc_msgSend(v20, "addErrorBlock:", v30);
        objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v22, "OSLogObject");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_opt_class();
          AMSLogKey();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v24;
          v35 = 2114;
          v36 = v25;
          _os_log_impl(&dword_211102000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning to observe for updates", buf, 0x16u);

        }
        -[AMSUIInlineDialogViewController engagement](self, "engagement");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIInlineDialogViewController placement](self, "placement");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIInlineDialogViewController serviceType](self, "serviceType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObserver:placement:serviceType:", self, v27, v28);

      }
    }
    else
    {

    }
  }
}

void __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
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
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully obtained response", buf, 0x16u);

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_18;
  v9[3] = &unk_24CB4F4C0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFetchResponse:", *(_QWORD *)(a1 + 40));
}

void __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
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
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Successfully obtained response", buf, 0x16u);

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_20;
  v9[3] = &unk_24CB4F4C0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFailToFetchWithError:", *(_QWORD *)(a1 + 40));
}

- (id)_findDialogRequestInResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIInlineDialogViewController placement](self, "placement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIInlineDialogViewController placement](self, "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "messageActions", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "placementsMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "makeDialogRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE081D8];
  v6 = a4;
  objc_msgSend(v5, "sharedMessagingUIConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIInlineDialogViewController placement](self, "placement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] action for %@ was pushed", (uint8_t *)&v13, 0x20u);

  }
  -[AMSUIInlineDialogViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageViewController:didSelectActionWithDialogResult:", self, v6);

}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  double height;
  double width;
  id v7;

  height = a4.height;
  width = a4.width;
  -[AMSUIInlineDialogViewController delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageViewController:didUpdateSize:", self, width, height);

}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AMSUIInlineDialogViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageViewController:didFailWithError:", self, v5);

}

- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[AMSUIInlineDialogViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AMSUIInlineDialogViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "messageViewController:shouldEnqueueMetricsForDialogResult:", self, v5);

  }
  else
  {
    v9 = -[AMSUIInlineDialogViewController shouldAutomaticallyReportMetrics](self, "shouldAutomaticallyReportMetrics");
  }

  return v9;
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD block[5];
  id v36;
  _QWORD v37[5];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[AMSUIInlineDialogViewController serviceType](self, "serviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v11);

  if ((v13 & 1) != 0)
  {
    -[AMSUIInlineDialogViewController placement](self, "placement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v10);

    if ((v15 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v9)
      {
        if (!v16)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "OSLogObject");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_opt_class();
          AMSLogKey();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSUIInlineDialogViewController placement](self, "placement");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v39 = v19;
          v40 = 2114;
          v41 = v20;
          v42 = 2112;
          v43 = v21;
          _os_log_impl(&dword_211102000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Message for %@ was pushed to", buf, 0x20u);

        }
        -[AMSUIInlineDialogViewController delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_opt_respondsToSelector();

        v24 = MEMORY[0x24BDAC760];
        if ((v23 & 1) != 0)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke_26;
          block[3] = &unk_24CB4F4C0;
          block[4] = self;
          v36 = v9;
          dispatch_async(MEMORY[0x24BDAC9B8], block);

        }
        v33[0] = v24;
        v33[1] = 3221225472;
        v33[2] = __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke_2;
        v33[3] = &unk_24CB4F4C0;
        v33[4] = self;
        v34 = v9;
        dispatch_async(MEMORY[0x24BDAC9B8], v33);

      }
      else
      {
        if (!v16)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "OSLogObject");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_opt_class();
          AMSLogKey();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSUIInlineDialogViewController placement](self, "placement");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v39 = v30;
          v40 = 2114;
          v41 = v31;
          v42 = 2112;
          v43 = v32;
          _os_log_impl(&dword_211102000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Nil message for %@ was pushed", buf, 0x20u);

        }
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke;
        v37[3] = &unk_24CB4F0E8;
        v37[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], v37);
      }
      goto LABEL_17;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v25, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = objc_opt_class();
    AMSLogKey();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v27;
    v40 = 2114;
    v41 = v28;
    _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Ignoring dialog pushed due to wrong placement and service type", buf, 0x16u);

  }
LABEL_17:

}

uint64_t __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownContentView");
}

void __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke_26(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageViewController:didLoadDialogRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDialogRequest:", *(_QWORD *)(a1 + 40));
}

- (void)_didFetchResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIInlineDialogViewController _findDialogRequestInResponse:](self, "_findDialogRequestInResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIInlineDialogViewController setDialogRequest:](self, "setDialogRequest:", v5);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found message to display", (uint8_t *)&v18, 0x16u);

    }
    -[AMSUIInlineDialogViewController viewIfLoaded](self, "viewIfLoaded");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[AMSUIInlineDialogViewController _setDialogRequest:](self, "_setDialogRequest:", v5);
    -[AMSUIInlineDialogViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[AMSUIInlineDialogViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "messageViewController:didLoadDialogRequest:", self, v5);

    }
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
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
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No message found to display", (uint8_t *)&v18, 0x16u);

    }
    -[AMSUIInlineDialogViewController _tearDownContentView](self, "_tearDownContentView");
  }

}

- (void)_didFailToFetchWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIInlineDialogViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageViewController:didFailWithError:", self, v4);

}

- (CGPoint)anchorPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_anchorPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_anchorPoint, &v3, 16, 1, 0);
}

- (AMSBinaryPromise)loadPromise
{
  return self->_loadPromise;
}

- (void)setLoadPromise:(id)a3
{
  objc_storeStrong((id *)&self->_loadPromise, a3);
}

- (AMSUIMessageViewControllerDelegate)delegate
{
  return (AMSUIMessageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSEngagement)engagement
{
  return self->_engagement;
}

- (void)setEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_engagement, a3);
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)setDialogRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dialogRequest, a3);
}

- (NSString)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_placement, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (AMSUIMessageViewController)childContentController
{
  return self->_childContentController;
}

- (void)setChildContentController:(id)a3
{
  objc_storeStrong((id *)&self->_childContentController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childContentController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_engagement, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadPromise, 0);
}

@end
