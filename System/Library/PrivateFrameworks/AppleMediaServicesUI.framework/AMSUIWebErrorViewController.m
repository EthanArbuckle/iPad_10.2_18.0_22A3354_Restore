@implementation AMSUIWebErrorViewController

- (AMSUIWebErrorViewController)initWithContext:(id)a3
{
  id v5;
  AMSUIWebErrorViewController *v6;
  AMSUIWebErrorViewController *v7;

  v5 = a3;
  v6 = -[AMSUICommonViewController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  AMSUIWebClientContext *context;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebErrorViewController;
  -[AMSUIWebErrorViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  -[AMSUIWebErrorViewController _applyAppearance](self, "_applyAppearance");
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
    v6 = (void *)objc_opt_class();
    context = self->_context;
    v8 = v6;
    -[AMSUIWebClientContext logKey](context, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIErrorView title](self->_errorView, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIErrorView message](self->_errorView, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v14 = v6;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error page displayed. Title: %{public}@, Message: %{public}@", buf, 0x2Au);

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AMSUIErrorView *v31;
  AMSUIErrorView *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int has_internal_content;
  void *v54;
  void *v55;
  void *v56;
  AMSUIErrorView *errorView;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id location;
  objc_super v63;
  const __CFString *v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v63.receiver = self;
  v63.super_class = (Class)AMSUIWebErrorViewController;
  -[AMSUICommonViewController loadView](&v63, sel_loadView);
  -[AMSUIWebErrorViewController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("user cancelled"));

  if ((v8 & 1) == 0)
  {
    v9 = objc_alloc(MEMORY[0x24BE08288]);
    -[AMSUIWebErrorViewController model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithSubsystem:category:error:", *MEMORY[0x24BE07EB0], CFSTR("bootstrap"), v11);

    -[AMSUIWebErrorViewController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClientApp:", v15);

    -[AMSUIWebErrorViewController context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clientOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("inlineInterrupt"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AMSUIWebErrorViewController context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "clientOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("inlineInterrupt"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEventInlineInterruption:", objc_msgSend(v21, "BOOLValue"));

    }
    else
    {
      objc_msgSend(v12, "setEventInlineInterruption:", 0);
    }

    -[AMSUIWebErrorViewController context](self, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "versionNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v64 = CFSTR("html");
      -[AMSUIWebErrorViewController context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "versionNumber");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setJsVersions:", v26);

    }
    else
    {
      objc_msgSend(v12, "jsVersions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setJsVersions:", v24);
    }

    -[AMSUIWebErrorViewController context](self, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "URL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUrl:", v28);

    -[AMSUIWebErrorViewController context](self, "context");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "metrics");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "enqueueEvent:", v12);

  }
  v31 = [AMSUIErrorView alloc];
  v32 = -[AMSUIErrorView initWithFrame:title:](v31, "initWithFrame:title:", &stru_24CB5A078, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AMSUIWebErrorViewController setErrorView:](self, "setErrorView:", v32);

  -[AMSUIWebErrorViewController model](self, "model");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "errorTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    v36 = v34;
  }
  else
  {
    -[AMSUIWebErrorViewController context](self, "context");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bag");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    AMSUILocalizedStringFromBundle(CFSTR("DEFAULT_ERROR_TITLE"), v38, v39);
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[AMSUIWebErrorViewController model](self, "model");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "actionButtonTitle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    v43 = v41;
  }
  else
  {
    -[AMSUIWebErrorViewController context](self, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bag");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    AMSUILocalizedStringFromBundle(CFSTR("DEFAULT_ERROR_BUTTON"), v45, v46);
    v43 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[AMSUIWebErrorViewController context](self, "context");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bag");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("DEFAULT_ERROR_MESSAGE"), v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebErrorViewController model](self, "model");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v51, "errorMessageInternalOnly") & 1) == 0)
  {

LABEL_20:
    -[AMSUIWebErrorViewController model](self, "model");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "errorMessage");
    v52 = v50;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  -[AMSUIWebErrorViewController model](self, "model");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "errorMessageInternalOnly"))
  {
    has_internal_content = os_variant_has_internal_content();

    if (!has_internal_content)
      goto LABEL_22;
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  -[AMSUIWebErrorViewController errorView](self, "errorView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setTitle:", v36);

  -[AMSUIWebErrorViewController errorView](self, "errorView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setButtonTitle:", v43);

  -[AMSUIWebErrorViewController errorView](self, "errorView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setMessage:", v50);

  objc_initWeak(&location, self);
  errorView = self->_errorView;
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __39__AMSUIWebErrorViewController_loadView__block_invoke;
  v60[3] = &unk_24CB4F800;
  objc_copyWeak(&v61, &location);
  -[AMSUIErrorView setButtonAction:](errorView, "setButtonAction:", v60);
  -[AMSUIWebErrorViewController _enqueuePageEventIfNeeded](self, "_enqueuePageEventIfNeeded");
  -[AMSUICommonViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebErrorViewController errorView](self, "errorView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addSubview:", v59);

  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);

}

void __39__AMSUIWebErrorViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
    objc_msgSend(WeakRetained, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v4;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action button tapped", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(WeakRetained, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(WeakRetained, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "runAction");

  }
  objc_msgSend(WeakRetained, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(WeakRetained, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionBlock");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v15)[2](v15, v8 != 0);

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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebErrorViewController;
  -[AMSUIWebErrorViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIWebErrorViewController errorView](self, "errorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)willPresentPageModel:(id)a3 appearance:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    objc_storeStrong((id *)&self->_model, v9);
    objc_storeStrong((id *)&self->_appearance, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      -[AMSUIWebErrorViewController context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid error page model: %{public}@", (uint8_t *)&v15, 0x20u);

    }
  }

}

- (void)_applyAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[AMSUIWebErrorViewController appearance](self, "appearance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  -[AMSUIWebErrorViewController errorView](self, "errorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_setBackgroundColor:", v6);

  objc_msgSend(v12, "backgroundColor");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v3;
  -[AMSUICommonViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_setBackgroundColor:", v10);

  -[AMSUIWebErrorViewController _showCancelButtonIfNeeded](self, "_showCancelButtonIfNeeded");
}

- (void)_enqueuePageEventIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebErrorViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metricsOverlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engagementMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
    goto LABEL_9;
  -[AMSUIWebErrorViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("engagementMetrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;

  if (v6)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
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
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing engagement display event.", buf, 0x16u);

    }
    -[AMSUIWebErrorViewController context](self, "context", CFSTR("eventType"), CFSTR("pageType"), CFSTR("engagementMetrics"), CFSTR("pageUrl"), CFSTR("page"), CFSTR("AMSError"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x24BE08148]);
    -[AMSUIWebErrorViewController context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithBag:", v19);
    v21 = (id)objc_msgSend(v20, "enqueueData:", v16);

  }
}

- (void)_showCancelButtonIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  AMSUIWebFlowAction *v12;
  void *v13;
  AMSUIWebFlowAction *v14;
  AMSUIWebButtonModel *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AMSUIWebBarButtonItemModel *v20;
  AMSUIWebNavigationBarModel *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  -[AMSUIWebErrorViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentContainer");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hidesBackButton");
  -[AMSUIWebErrorViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if ((v9 < 2 || v6) && !-[AMSUIWebErrorViewController showingCancelButton](self, "showingCancelButton"))
  {
    objc_msgSend(v5, "rightBarButtonItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      -[AMSUIWebErrorViewController setShowingCancelButton:](self, "setShowingCancelButton:", 1);
      v12 = [AMSUIWebFlowAction alloc];
      -[AMSUIWebErrorViewController context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[AMSUIWebFlowAction initWithContext:](v12, "initWithContext:", v13);

      -[AMSUIWebFlowAction setPresentationType:](v14, "setPresentationType:", 4);
      v15 = objc_alloc_init(AMSUIWebButtonModel);
      -[AMSUIWebErrorViewController context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSUILocalizedStringFromBundle(CFSTR("CANCEL"), v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebButtonModel setTitle:](v15, "setTitle:", v19);

      -[AMSUIWebButtonModel setAction:](v15, "setAction:", v14);
      -[AMSUIWebButtonModel setEnabled:](v15, "setEnabled:", 1);
      -[AMSUIWebButtonModel setStyle:](v15, "setStyle:", 3);
      v20 = objc_alloc_init(AMSUIWebBarButtonItemModel);
      -[AMSUIWebBarButtonItemModel setButtonModel:](v20, "setButtonModel:", v15);
      v21 = objc_alloc_init(AMSUIWebNavigationBarModel);
      -[AMSUIWebNavigationBarModel setLeftBarButtonItemModel:](v21, "setLeftBarButtonItemModel:", v20);
      -[AMSUIWebErrorViewController model](self, "model");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "navigationBar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "style") == 1)
        v24 = 1;
      else
        v24 = 5;
      -[AMSUIWebNavigationBarModel setStyle:](v21, "setStyle:", v24);

      objc_msgSend(v25, "applyNavigationModel:", v21);
    }
  }

}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_appearance, a3);
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (AMSUIErrorView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (AMSUIWebErrorPageModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (BOOL)showingCancelButton
{
  return self->_showingCancelButton;
}

- (void)setShowingCancelButton:(BOOL)a3
{
  self->_showingCancelButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

@end
