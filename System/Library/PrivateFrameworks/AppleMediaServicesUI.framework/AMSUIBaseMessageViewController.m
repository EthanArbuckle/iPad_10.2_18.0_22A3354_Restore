@implementation AMSUIBaseMessageViewController

- (AMSUIBaseMessageViewController)initWithRequest:(id)a3
{
  id v5;
  AMSUIBaseMessageViewController *v6;
  AMSUIBaseMessageViewController *v7;
  AMSBinaryPromise *v8;
  AMSBinaryPromise *loadPromise;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIBaseMessageViewController;
  v6 = -[AMSUIBaseMessageViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_currentIconPlayCount = 0;
    objc_storeStrong((id *)&v6->_dialogRequest, a3);
    v7->_impressionsReportingFrequency = 1;
    v8 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x24BE08078]);
    loadPromise = v7->_loadPromise;
    v7->_loadPromise = v8;

    v7->_shouldAutomaticallyReportMetrics = 1;
    v7->_isImageSymbolImage = 0;
    -[AMSUIBaseMessageViewController setViewRespectsSystemMinimumLayoutMargins:](v7, "setViewRespectsSystemMinimumLayoutMargins:", 0);
    -[AMSUIBaseMessageViewController _preloadImageIfNeeded](v7, "_preloadImageIfNeeded");
    if (!-[AMSUIBaseMessageViewController _isLoadingImage](v7, "_isLoadingImage"))
    {
      -[AMSUIBaseMessageViewController loadPromise](v7, "loadPromise");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishWithSuccess");

    }
  }

  return v7;
}

- (AMSUIBaseMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v9;
  id v10;
  AMSUIBaseMessageViewController *v11;
  AMSUIBaseMessageViewController *v12;

  v9 = a4;
  v10 = a5;
  v11 = -[AMSUIBaseMessageViewController initWithRequest:](self, "initWithRequest:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a5);
    objc_storeStrong((id *)&v12->_bag, a4);
  }

  return v12;
}

- (void)loadView
{
  AMSUIMessageView *v3;

  v3 = -[AMSUIMessageView initWithStyle:]([AMSUIMessageView alloc], "initWithStyle:", -[AMSUIBaseMessageViewController _messageStyle](self, "_messageStyle"));
  -[AMSUIMessageView setIsImageSymbolImage:](v3, "setIsImageSymbolImage:", -[AMSUIBaseMessageViewController isImageSymbolImage](self, "isImageSymbolImage"));
  -[AMSUIBaseMessageViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)AMSUIBaseMessageViewController;
  -[AMSUIBaseMessageViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIBaseMessageViewController _setDialogRequest:](self, "_setDialogRequest:", v3);

  -[AMSUIBaseMessageViewController _commitAppearance](self, "_commitAppearance");
  if (os_variant_has_internal_content()
    && (objc_msgSend(MEMORY[0x24BE08418], "isRunningUnitTests") & 1) == 0)
  {
    -[AMSUIBaseMessageViewController _setupDebugMenu](self, "_setupDebugMenu");
  }
  if (-[AMSUIBaseMessageViewController _isLoadingImage](self, "_isLoadingImage"))
  {
    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreLayoutImageView:", 1);

  }
  objc_initWeak(&location, self);
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__AMSUIBaseMessageViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_24CB4F498;
  objc_copyWeak(&v8, &location);
  v6 = (id)-[AMSUIBaseMessageViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__AMSUIBaseMessageViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v14, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {

LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v14, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_preferredContentSizeCategoryDidChange:", v13);

    goto LABEL_5;
  }
  objc_msgSend(v14, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "legibilityWeight");
  v11 = objc_msgSend(v5, "legibilityWeight");

  if (v10 != v11)
    goto LABEL_4;
LABEL_5:

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIBaseMessageViewController;
  -[AMSUIBaseMessageViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    v7 = v6;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Did appear", buf, 0xCu);

  }
  -[AMSUIBaseMessageViewController _resetAndPlayMICAPlayer](self, "_resetAndPlayMICAPlayer");
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AMSUIBaseMessageViewController _messageStyle](self, "_messageStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ viewDidAppear"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_recordNewsDebugEventWithCategory:", v11);

  if (-[AMSUIBaseMessageViewController shouldAutomaticallyReportMetrics](self, "shouldAutomaticallyReportMetrics"))
    -[AMSUIBaseMessageViewController enqueueImpressionMetrics](self, "enqueueImpressionMetrics");
}

- (int64_t)_iconAnimationPlayCount
{
  return 1;
}

- (UIImageSymbolConfiguration)_effectiveImageSymbolConfiguration
{
  return 0;
}

- (id)_messageFontCompatibleWith:(id)a3
{
  return 0;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  return 0;
}

- (unint64_t)_messageStyle
{
  return 3;
}

- (AMSUIMessageView)_messageView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIBaseMessageViewController;
  -[AMSUIBaseMessageViewController view](&v3, sel_view);
  return (AMSUIMessageView *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_primaryImageRenderingMode
{
  return 0;
}

- (void)enqueueImpressionMetrics
{
  unint64_t v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = -[AMSUIBaseMessageViewController impressionsReportingFrequency](self, "impressionsReportingFrequency");
  if (v3 == 2)
  {
    v4 = 1;
  }
  else if (v3 == 1)
  {
    v4 = !-[AMSUIBaseMessageViewController didEnqueueMetrics](self, "didEnqueueMetrics");
  }
  else
  {
    v4 = 0;
  }
  if (!-[AMSUIBaseMessageViewController didEnqueueMetrics](self, "didEnqueueMetrics"))
    -[AMSUIBaseMessageViewController enqueueImpressionEngagementMetrics](self, "enqueueImpressionEngagementMetrics");
  if ((v4 & 1) != 0)
  {
    -[AMSUIBaseMessageViewController setDidEnqueueMetrics:](self, "setDidEnqueueMetrics:", 1);
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clickstreamMetricsEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIBaseMessageViewController _notifyMetricsFields:](self, "_notifyMetricsFields:", v6);

    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AMSUIBaseMessageViewController _messageStyle](self, "_messageStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ _notifyMetricsFields/impression"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_recordNewsDebugEventWithCategory:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2048;
      v18 = -[AMSUIBaseMessageViewController impressionsReportingFrequency](self, "impressionsReportingFrequency");
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_INFO, "%{public}@: Will not enqueue impression metrics (impressionsReportingFrequency: %lu)", buf, 0x16u);

    }
  }
}

- (void)enqueueImpressionEngagementMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  __int128 buf;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AMSUIBaseMessageViewController _messageStyle](self, "_messageStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ enqueueImpressionEngagementMetrics"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_recordNewsDebugEventWithCategory:", v6);

  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metricsEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSUIBaseMessageViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[AMSUIBaseMessageViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageViewControllerDidEnqueueImpression:", self);

    }
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
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
      v14 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueueing Engagement Impression MetricsEvent", (uint8_t *)&buf, 0xCu);

    }
    v15 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __68__AMSUIBaseMessageViewController_enqueueImpressionEngagementMetrics__block_invoke;
    v23[3] = &unk_24CB4F4C0;
    v23[4] = self;
    v24 = v8;
    v16 = v23;
    AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v15;
    *((_QWORD *)&buf + 1) = 3221225472;
    v26 = __AMSDispatchAsyncGlobal_block_invoke;
    v27 = &unk_24CB4F3C0;
    v28 = v17;
    v29 = v16;
    v19 = v17;
    dispatch_async(v18, &buf);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
      v22 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_INFO, "%{public}@: No Engagement MetricsEvent to enqueue", (uint8_t *)&buf, 0xCu);

    }
  }

}

void __68__AMSUIBaseMessageViewController_enqueueImpressionEngagementMetrics__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x24BE08260];
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalInstanceUsingBag:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueEvent:", *(_QWORD *)(a1 + 40));

}

- (void)_setupDebugMenu
{
  void *v3;
  char isKindOfClass;
  id v5;

  if (-[AMSUIBaseMessageViewController _debugInfoIsNotEmpty](self, "_debugInfoIsNotEmpty"))
  {
    -[AMSUIBaseMessageViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[AMSUIBaseMessageViewController view](self, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setupDebugButtonWithTarget:action:", self, sel__presentDebugMenu);

    }
  }
}

- (BOOL)_debugInfoIsNotEmpty
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("debugInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v4, "count") != 0;
  return v5;
}

- (void)_presentDebugMenu
{
  void *v3;
  void *v4;
  id v5;

  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("debugInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIDebugMenu presentDebugMenuWithPresentingVC:debugInfo:](AMSUIDebugMenu, "presentDebugMenuWithPresentingVC:debugInfo:", self, v4);

}

- (void)_handleDialogResult:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  AMSUIActionContext *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  AMSUIActionContext *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  char v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BE081D8];
  v8 = a3;
  objc_msgSend(v7, "sharedMessagingUIConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v61 = (id)objc_opt_class();
    v11 = v61;
    _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Attempting to handle dialog request", buf, 0xCu);

  }
  objc_msgSend(v8, "originalRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedActionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "locateActionWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "kind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08108]), "initWithDialogAction:", v14);
    if ((objc_msgSend(v14, "requiresDelegate") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v18 = (AMSUIActionContext *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v18 = (AMSUIActionContext *)objc_claimAutoreleasedReturnValue();
      }
      -[AMSUIActionContext OSLogObject](v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_28:

        -[AMSUIBaseMessageViewController delegate](self, "delegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_opt_respondsToSelector();

        objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = (void *)v40;
        if ((v39 & 1) != 0)
        {
          if (!v40)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v41, "OSLogObject");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = (void *)objc_opt_class();
            v44 = v43;
            objc_msgSend(v17, "identifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v61 = v43;
            v62 = 2114;
            v63 = v45;
            _os_log_impl(&dword_211102000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to handle delegate action (identifier: %{public}@)", buf, 0x16u);

          }
          -[AMSUIBaseMessageViewController delegate](self, "delegate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v57[0] = MEMORY[0x24BDAC760];
          v57[1] = 3221225472;
          v57[2] = __72__AMSUIBaseMessageViewController__handleDialogResult_completionHandler___block_invoke;
          v57[3] = &unk_24CB4F4E8;
          v57[4] = self;
          v58 = v17;
          v59 = v6;
          v47 = objc_msgSend(v46, "messageViewController:handleDelegateAction:completionHandler:", self, v58, v57);

          if ((v47 & 1) != 0)
            goto LABEL_45;
        }
        else
        {
          if (!v40)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v41, "OSLogObject");
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            v49 = (void *)objc_opt_class();
            v50 = v49;
            objc_msgSend(v17, "identifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v61 = v49;
            v62 = 2114;
            v63 = v51;
            _os_log_impl(&dword_211102000, v48, OS_LOG_TYPE_DEBUG, "%{public}@: Delegate does not implement handleDelegateAction (identifier: %{public}@)", buf, 0x16u);

          }
          (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x24BDBD1C8], 0);
        }
        objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v52)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v52, "OSLogObject");
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v54 = (void *)objc_opt_class();
          v55 = v54;
          objc_msgSend(v17, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v61 = v54;
          v62 = 2114;
          v63 = v56;
          _os_log_impl(&dword_211102000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate action not handled (identifier: %{public}@)", buf, 0x16u);

        }
        (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x24BDBD1C0], 0);
LABEL_45:

        goto LABEL_46;
      }
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v61 = v20;
      v21 = v20;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_INFO, "%{public}@: Delegate is required to process action", buf, 0xCu);
    }
    else
    {
      v26 = [AMSUIActionContext alloc];
      -[AMSUIBaseMessageViewController account](self, "account");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIBaseMessageViewController bag](self, "bag");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[AMSUIActionContext initWithAccount:bag:presentingViewController:processInfo:](v26, "initWithAccount:bag:presentingViewController:processInfo:", v27, v28, self, 0);

      objc_msgSend(v17, "actionPayload");
      v19 = objc_claimAutoreleasedReturnValue();
      v29 = +[AMSUIActionRunner canHandle:context:](AMSUIActionRunner, "canHandle:context:", v19, v18);
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v30 = objc_claimAutoreleasedReturnValue();
      v21 = (id)v30;
      if (v29)
      {
        if (!v30)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v21, "OSLogObject");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v61 = v32;
          v33 = v32;
          _os_log_impl(&dword_211102000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: AMS ActionRunner can handle action", buf, 0xCu);

        }
        +[AMSUIActionRunner handle:context:](AMSUIActionRunner, "handle:context:", v19, v18);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addFinishBlock:", v6);

        goto LABEL_45;
      }
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v61 = v36;
        v37 = v36;
        _os_log_impl(&dword_211102000, v35, OS_LOG_TYPE_INFO, "%{public}@: AMS ActionRunner cannot handle action", buf, 0xCu);

      }
    }

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v61 = v24;
    v25 = v24;
    _os_log_impl(&dword_211102000, v23, OS_LOG_TYPE_INFO, "%{public}@: No action kind", buf, 0xCu);

  }
  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x24BDBD1C0], 0);
LABEL_46:

}

void __72__AMSUIBaseMessageViewController__handleDialogResult_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
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
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
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
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
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

- (void)_notifyMetricsFields:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[AMSUIBaseMessageViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if ((v6 & 1) != 0)
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = (id)objc_opt_class();
        v10 = v16;
        _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueueing metrics fields", (uint8_t *)&v15, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("topic"));
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("topic"));
      -[AMSUIBaseMessageViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "messageViewController:enqueueEventWithFields:inTopic:", self, v13, v11);

    }
    else
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v15 = 138543362;
        v16 = (id)objc_opt_class();
        v14 = v16;
        _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_INFO, "%{public}@: Delegate does observe for metrics. Dropping metrics event.", (uint8_t *)&v15, 0xCu);

      }
    }

  }
}

- (void)_preloadImageIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "iconImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "iconURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIBaseMessageViewController _loadIconAssetWithURL:](self, "_loadIconAssetWithURL:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __55__AMSUIBaseMessageViewController__preloadImageIfNeeded__block_invoke;
      v12[3] = &unk_24CB4F510;
      v12[4] = self;
      objc_msgSend(v10, "resultWithTimeout:completion:", v12, 2.0);
      -[AMSUIBaseMessageViewController loadPromise](self, "loadPromise");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishWithPromise:", v10);

    }
  }

}

void __55__AMSUIBaseMessageViewController__preloadImageIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543618;
      v10 = (id)objc_opt_class();
      v11 = 2114;
      v12 = v4;
      v7 = v10;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Icon loading failed with error %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "loadPromise");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithSuccess");

  }
}

- (void)_setDialogRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIBaseMessageViewController _updateTextWithAttributes](self, "_updateTextWithAttributes");
  v12 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v12;
  else
    v6 = 0;

  objc_msgSend(v6, "iconImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (-[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "ams_imageWithRenderingMode:", -[AMSUIBaseMessageViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode")), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8, v7))
  {
    -[AMSUIBaseMessageViewController _effectiveImageSymbolConfiguration](self, "_effectiveImageSymbolConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreferredSymbolConfiguration:", v9);

    objc_msgSend(v5, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v7);

  }
}

- (id)_loadIconAssetWithURL:(id)a3
{
  id v4;
  AMSUIEngagementContentRecord *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  if (+[AMSUIEngagementContentRecord isURLEngagementContent:](AMSUIEngagementContentRecord, "isURLEngagementContent:", v4))
  {
    v5 = -[AMSUIEngagementContentRecord initWithURL:]([AMSUIEngagementContentRecord alloc], "initWithURL:", v4);
    -[AMSUIEngagementContentRecord contentExtension](v5, "contentExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AMSUIBaseMessageViewController set_isLoadingImage:](self, "set_isLoadingImage:", 1);
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("caar")))
    -[AMSUIBaseMessageViewController _setMICAIconAssetWithURL:](self, "_setMICAIconAssetWithURL:", v4);
  else
    -[AMSUIBaseMessageViewController _setImageWithURL:](self, "_setImageWithURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__AMSUIBaseMessageViewController__loadIconAssetWithURL___block_invoke;
  v9[3] = &unk_24CB4F510;
  v9[4] = self;
  objc_msgSend(v7, "addFinishBlock:", v9);

  return v7;
}

void __56__AMSUIBaseMessageViewController__loadIconAssetWithURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  __int128 buf;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v7 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_INFO, "%{public}@: Finished icon loading", (uint8_t *)&buf, 0xCu);

  }
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__AMSUIBaseMessageViewController__loadIconAssetWithURL___block_invoke_46;
  v13[3] = &unk_24CB4F4C0;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v4;
  v9 = v13;
  v10 = v4;
  AMSLogKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = v8;
  *((_QWORD *)&buf + 1) = 3221225472;
  v16 = __AMSDispatchAsync_block_invoke_1;
  v17 = &unk_24CB4F3C0;
  v18 = v11;
  v19 = v9;
  v12 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], &buf);

}

void __56__AMSUIBaseMessageViewController__loadIconAssetWithURL___block_invoke_46(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "set_isLoadingImage:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_messageView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPreLayoutImageView:", 0);

  }
}

- (void)_resetAndPlayMICAPlayer
{
  void *v3;
  id v4;

  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    if (-[AMSUIBaseMessageViewController _iconAnimationPlayCount](self, "_iconAnimationPlayCount"))
    {
      -[AMSUIBaseMessageViewController _startObservingMICAPlayer](self, "_startObservingMICAPlayer");
      self->_currentIconPlayCount = 0;
      -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "micaPlayer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "play");

    }
  }
}

- (id)_setMICAIconAssetWithURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v18 = (id)objc_opt_class();
    v7 = v18;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_INFO, "%{public}@: Loading MICA asset", buf, 0xCu);

  }
  +[AMSUIAssetLoader sharedLoader](AMSUIAssetLoader, "sharedLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchWithAssetURL:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke;
  v15[3] = &unk_24CB4F538;
  v15[4] = self;
  v16 = v4;
  v11 = v4;
  objc_msgSend(v9, "addSuccessBlock:", v15);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_2;
  v14[3] = &unk_24CB4F560;
  v14[4] = self;
  objc_msgSend(v9, "addErrorBlock:", v14);
  objc_msgSend(v9, "binaryPromiseAdapter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 buf;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully loaded MICA asset", (uint8_t *)&buf, 0xCu);

  }
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_48;
  v13[3] = &unk_24CB4F370;
  v8 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v15 = v8;
  v9 = v13;
  v10 = v3;
  AMSLogKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = v7;
  *((_QWORD *)&buf + 1) = 3221225472;
  v17 = __AMSDispatchAsync_block_invoke_1;
  v18 = &unk_24CB4F3C0;
  v19 = v11;
  v20 = v9;
  v12 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], &buf);

}

void __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_48(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_messageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setupMICAAssetWithData:originalURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_resetAndPlayMICAPlayer");
}

void __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v3;
    v6 = v11;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load MICA asset with error %{public}@", buf, 0x16u);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_50;
  v8[3] = &unk_24CB4F4C0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_50(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_messageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageViewController:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_setImageWithURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v21 = (id)objc_opt_class();
    v7 = v21;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_INFO, "%{public}@: Loading image asset", buf, 0xCu);

  }
  +[AMSUIImageLoader defaultLoader](AMSUIImageLoader, "defaultLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchImageWithURL:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_isURLSystemImage:", v4))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v21 = v12;
      v13 = v12;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Setting MessageView isImageSymbolImage true", buf, 0xCu);

    }
    -[AMSUIBaseMessageViewController setIsImageSymbolImage:](self, "setIsImageSymbolImage:", 1);
  }
  objc_initWeak((id *)buf, self);
  v14 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke;
  v18[3] = &unk_24CB4F5B0;
  v18[4] = self;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v9, "addSuccessBlock:", v18);
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_2;
  v17[3] = &unk_24CB4F560;
  v17[4] = self;
  objc_msgSend(v9, "addErrorBlock:", v17);
  objc_msgSend(v9, "binaryPromiseAdapter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v15;
}

void __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully loaded image asset", buf, 0xCu);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_53;
  v8[3] = &unk_24CB4F588;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v9 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

  objc_destroyWeak(&v10);
}

void __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_53(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "ams_imageWithRenderingMode:", objc_msgSend(WeakRetained, "_primaryImageRenderingMode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_effectiveImageSymbolConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "imageWithSymbolConfiguration:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    objc_msgSend(WeakRetained, "_messageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v4);

    objc_msgSend(WeakRetained, "_messageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
  else
  {
    objc_msgSend(WeakRetained, "set_loadedImage:", v3);
  }

}

void __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v3;
    v6 = v11;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load image %{public}@", buf, 0x16u);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_55;
  v8[3] = &unk_24CB4F4C0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_55(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_messageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageViewController:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_startObservingMICAPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "micaPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIBaseMessageViewController setCurrentIconPlayCount:](self, "setCurrentIconPlayCount:", 0);
    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "micaPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Began observing MICA Player", (uint8_t *)&v10, 0xCu);

    }
  }
}

- (void)_preferredContentSizeCategoryDidChange:(id)a3
{
  id v4;

  -[AMSUIBaseMessageViewController _updateTextWithAttributes:](self, "_updateTextWithAttributes:", a3);
  -[AMSUIBaseMessageViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageViewController:didUpdateSize:", self, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

}

- (void)_updateTextWithAttributes
{
  id v3;

  -[AMSUIBaseMessageViewController traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIBaseMessageViewController _updateTextWithAttributes:](self, "_updateTextWithAttributes:", v3);

}

- (void)_updateTextWithAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  AMSUIMessageMarkdownConfiguration *v14;
  AMSUIMessageMarkdownGenerator *v15;
  void *v16;
  void *v17;
  AMSUIMessageMarkdownGenerator *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  AMSUIMessageMarkdownConfiguration *v33;
  AMSUIMessageMarkdownGenerator *v34;
  void *v35;
  void *v36;
  AMSUIMessageMarkdownGenerator *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;

  v68 = a3;
  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIBaseMessageViewController _titleTextColor](self, "_titleTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[AMSUIAppearance _defaultTitleColor](AMSUIAppearance, "_defaultTitleColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    -[AMSUIBaseMessageViewController _titleFontCompatibleWith:](self, "_titleFontCompatibleWith:", v68);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      +[AMSUIAppearance _defaultTitleFontForStyle:withTraitCollection:](AMSUIAppearance, "_defaultTitleFontForStyle:withTraitCollection:", -[AMSUIBaseMessageViewController _messageStyle](self, "_messageStyle"), v68);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v14 = -[AMSUIMessageMarkdownConfiguration initWithColor:font:]([AMSUIMessageMarkdownConfiguration alloc], "initWithColor:font:", v9, v13);
    v15 = [AMSUIMessageMarkdownGenerator alloc];
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[AMSUIMessageMarkdownGenerator initWithMarkdownString:configuration:](v15, "initWithMarkdownString:configuration:", v17, v14);

    -[AMSUIMessageMarkdownGenerator generate](v18, "generate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitle:", v19);

  }
  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "message");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "style");

    if (v25 == 8)
      goto LABEL_19;
    -[AMSUIBaseMessageViewController _messageTextColor](self, "_messageTextColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      +[AMSUIAppearance _defaultMessageColor](AMSUIAppearance, "_defaultMessageColor");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v28;

    -[AMSUIBaseMessageViewController _messageFontCompatibleWith:](self, "_messageFontCompatibleWith:", v68);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      +[AMSUIAppearance _defaultMessageFontForStyle:withTraitCollection:](AMSUIAppearance, "_defaultMessageFontForStyle:withTraitCollection:", -[AMSUIBaseMessageViewController _messageStyle](self, "_messageStyle"), v68);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = v31;

    v33 = -[AMSUIMessageMarkdownConfiguration initWithColor:font:]([AMSUIMessageMarkdownConfiguration alloc], "initWithColor:font:", v21, v32);
    v34 = [AMSUIMessageMarkdownGenerator alloc];
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "message");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[AMSUIMessageMarkdownGenerator initWithMarkdownString:configuration:](v34, "initWithMarkdownString:configuration:", v36, v33);

    -[AMSUIMessageMarkdownGenerator generate](v37, "generate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setMessage:", v38);

  }
LABEL_19:
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_setTextViewText");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "titleAccessibilityLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v43)
  {
    objc_msgSend(v44, "titleAccessibilityLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "length");

    if (v47 < 2)
      goto LABEL_25;
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "titleAccessibilityLabel");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v44, "title");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
      goto LABEL_25;
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "title");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v49;
  objc_msgSend(v41, "addObject:", v49);

LABEL_25:
  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "messageAccessibilityLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v53)
  {
    objc_msgSend(v54, "messageAccessibilityLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "length");

    if (v57 < 2)
      goto LABEL_31;
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "messageAccessibilityLabel");
    v59 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v54, "message");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v60)
      goto LABEL_31;
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "message");
    v59 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v59;
  objc_msgSend(v41, "addObject:", v59);

LABEL_31:
  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v41, "componentsJoinedByString:", CFSTR(", "));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "textView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setAccessibilityLabel:", v62);
  }
  else
  {
    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "textView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "attributedText");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "string");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "textView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setAccessibilityLabel:", v65);

  }
}

- (void)_didTapActionButton:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  AMSUIMessagingActionContext *v39;
  _BOOL4 v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  AMSUIMessagingActionContext *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_msgSend(v6, "dialogAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v13 = v9;
    objc_msgSend(v9, "identifier");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v55 = (id)objc_opt_class();
      v56 = 2114;
      v57 = v10;
      v16 = v55;
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Action invoked (identifier: %{public}@)", buf, 0x16u);

    }
    v17 = objc_alloc(MEMORY[0x24BE08138]);
    -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithOriginalRequest:selectedActionIdentifier:", v18, v10);

    objc_msgSend(v19, "originalRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "locateActionWithIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v21 = -[AMSUIBaseMessageViewController shouldAutomaticallyReportMetrics](self, "shouldAutomaticallyReportMetrics");
    -[AMSUIBaseMessageViewController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[AMSUIBaseMessageViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v24, "messageViewController:shouldEnqueueMetricsForDialogResult:", self, v19);

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
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (void *)objc_opt_class();
      v28 = CFSTR("false");
      if (v21)
        v28 = CFSTR("true");
      *(_DWORD *)buf = 138543618;
      v55 = v27;
      v56 = 2114;
      v57 = v28;
      v29 = v27;
      _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_INFO, "%{public}@: shouldAutoEnqueue %{public}@", buf, 0x16u);

    }
    if (v21)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v55 = v32;
        v33 = v32;
        _os_log_impl(&dword_211102000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueueing engagement metrics", buf, 0xCu);

      }
      v34 = objc_alloc(MEMORY[0x24BE08148]);
      -[AMSUIBaseMessageViewController bag](self, "bag");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "initWithBag:", v35);
      objc_msgSend(v36, "handleDialogResult:", v19);

      if (v11)
      {
        -[NSObject clickstreamMetricsEvent](v11, "clickstreamMetricsEvent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIBaseMessageViewController _notifyMetricsFields:](self, "_notifyMetricsFields:", v37);

      }
    }
    -[NSObject deepLink](v11, "deepLink");
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[AMSUIBaseMessageViewController bag](self, "bag");
    v39 = (AMSUIMessagingActionContext *)objc_claimAutoreleasedReturnValue();
    if (v39 && v38)
    {
      v40 = +[AMSUIMessagingActionRunner canRespondToDeeplink:](AMSUIMessagingActionRunner, "canRespondToDeeplink:", v38);

      if (!v40)
      {
LABEL_44:
        v52[0] = MEMORY[0x24BDAC760];
        v52[1] = 3221225472;
        v52[2] = __54__AMSUIBaseMessageViewController__didTapActionButton___block_invoke;
        v52[3] = &unk_24CB4F5D8;
        v52[4] = self;
        v53 = v19;
        v51 = v19;
        -[AMSUIBaseMessageViewController _handleDialogResult:completionHandler:](self, "_handleDialogResult:completionHandler:", v51, v52);

        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v41, "OSLogObject");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v55 = v43;
        v56 = 2114;
        v57 = v38;
        v44 = v43;
        _os_log_impl(&dword_211102000, v42, OS_LOG_TYPE_INFO, "%{public}@: AMS can respond to action with deeplink %{public}@", buf, 0x16u);

      }
      v45 = [AMSUIMessagingActionContext alloc];
      -[AMSUIBaseMessageViewController bag](self, "bag");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIBaseMessageViewController account](self, "account");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[AMSUIMessagingActionContext initWithBag:account:clientInfo:](v45, "initWithBag:account:clientInfo:", v46, v47, v48);

      +[AMSUIMessagingTemporaryActionDataProvider parametersForAppStoreOptInNotificationWithDeeplink:](AMSUIMessagingTemporaryActionDataProvider, "parametersForAppStoreOptInNotificationWithDeeplink:", v38);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v49;
      if (v39 && v49)
      {
        +[AMSUIMessagingActionRunner performWithDeeplink:context:parameters:](AMSUIMessagingActionRunner, "performWithDeeplink:context:parameters:", v38, v39, v49);

      }
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bodyAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bodyAction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[__CFString OSLogObject](v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = (id)objc_opt_class();
    v12 = v55;
    _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Action invoked but failed dialog action found", buf, 0xCu);

  }
LABEL_45:

}

void __54__AMSUIBaseMessageViewController__didTapActionButton___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  v1 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__AMSUIBaseMessageViewController__didTapActionButton___block_invoke_2;
  v6[3] = &unk_24CB4F4C0;
  v2 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  v3 = v6;
  AMSLogKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v1;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_1;
  block[3] = &unk_24CB4F3C0;
  v9 = v4;
  v10 = v3;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __54__AMSUIBaseMessageViewController__didTapActionButton___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageViewController:didSelectActionWithDialogResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)micaPlayerDidChangePlaybackTime:(id)a3 isPlaybackAtEnd:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  int64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  int64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  int64_t v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    v23 = 138543618;
    v24 = v9;
    v25 = 2050;
    v26 = -[AMSUIBaseMessageViewController currentIconPlayCount](self, "currentIconPlayCount");
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: micaPlayerDidChangePlaybackTime (currentIconPlayCount: %{public}ld)", (uint8_t *)&v23, 0x16u);

  }
  v11 = -[AMSUIBaseMessageViewController _iconAnimationPlayCount](self, "_iconAnimationPlayCount");
  if (v11 >= 1)
  {
    v12 = v11;
    if (v4)
    {
      -[AMSUIBaseMessageViewController setCurrentIconPlayCount:](self, "setCurrentIconPlayCount:", -[AMSUIBaseMessageViewController currentIconPlayCount](self, "currentIconPlayCount") + 1);
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = (void *)objc_opt_class();
        v16 = v15;
        v17 = -[AMSUIBaseMessageViewController currentIconPlayCount](self, "currentIconPlayCount");
        v23 = 138543618;
        v24 = v15;
        v25 = 2050;
        v26 = v17;
        _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: MICA playback at end (currentIconPlayCount: %{public}ld)", (uint8_t *)&v23, 0x16u);

      }
    }
    if (-[AMSUIBaseMessageViewController currentIconPlayCount](self, "currentIconPlayCount") >= v12)
    {
      objc_msgSend(v6, "pause");
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = (void *)objc_opt_class();
        v21 = v20;
        v22 = -[AMSUIBaseMessageViewController currentIconPlayCount](self, "currentIconPlayCount");
        v23 = 138543874;
        v24 = v20;
        v25 = 2050;
        v26 = v22;
        v27 = 2050;
        v28 = v12;
        _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Paused MICA playback (currentIconPlayCount: %{public}ld, maxPlayCount: %{public}ld)", (uint8_t *)&v23, 0x20u);

      }
    }
  }

}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (AMSUIMessageViewControllerDelegate)delegate
{
  return (AMSUIMessageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)impressionsReportingFrequency
{
  return self->_impressionsReportingFrequency;
}

- (void)setImpressionsReportingFrequency:(unint64_t)a3
{
  self->_impressionsReportingFrequency = a3;
}

- (AMSBinaryPromise)loadPromise
{
  return self->_loadPromise;
}

- (void)setLoadPromise:(id)a3
{
  objc_storeStrong((id *)&self->_loadPromise, a3);
}

- (BOOL)shouldAutomaticallyReportMetrics
{
  return self->_shouldAutomaticallyReportMetrics;
}

- (void)setShouldAutomaticallyReportMetrics:(BOOL)a3
{
  self->_shouldAutomaticallyReportMetrics = a3;
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

- (BOOL)didEnqueueMetrics
{
  return self->_didEnqueueMetrics;
}

- (void)setDidEnqueueMetrics:(BOOL)a3
{
  self->_didEnqueueMetrics = a3;
}

- (int64_t)currentIconPlayCount
{
  return self->_currentIconPlayCount;
}

- (void)setCurrentIconPlayCount:(int64_t)a3
{
  self->_currentIconPlayCount = a3;
}

- (BOOL)isImageSymbolImage
{
  return self->_isImageSymbolImage;
}

- (void)setIsImageSymbolImage:(BOOL)a3
{
  self->_isImageSymbolImage = a3;
}

- (BOOL)_isLoadingImage
{
  return self->__isLoadingImage;
}

- (void)set_isLoadingImage:(BOOL)a3
{
  self->__isLoadingImage = a3;
}

- (UIImage)_loadedImage
{
  return self->__loadedImage;
}

- (void)set_loadedImage:(id)a3
{
  objc_storeStrong((id *)&self->__loadedImage, a3);
}

- (UIColor)_messageTextColor
{
  return self->__messageTextColor;
}

- (UIColor)_titleTextColor
{
  return self->__titleTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleTextColor, 0);
  objc_storeStrong((id *)&self->__messageTextColor, 0);
  objc_storeStrong((id *)&self->__loadedImage, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_loadPromise, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
}

@end
