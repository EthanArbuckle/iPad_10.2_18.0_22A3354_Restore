@implementation NDOAppleCareWebViewController

- (NDOAppleCareWebViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 params:(id)a5
{
  return -[NDOAppleCareWebViewController initWithWarranty:serialNumber:params:source:](self, "initWithWarranty:serialNumber:params:source:", a3, a4, a5, CFSTR("UNKNOWN"));
}

- (NDOAppleCareWebViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 params:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NDOAppleCareWebViewController *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)NDOAppleCareWebViewController;
  v15 = -[NDOAppleCareWebViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, CFSTR("NDOAppleCareWebView"), v14);

  if (v15)
  {
    -[NDOAppleCareWebViewController setWarranty:](v15, "setWarranty:", v10);
    -[NDOAppleCareWebViewController setSerialNumber:](v15, "setSerialNumber:", v11);
    -[NDOAppleCareWebViewController setParams:](v15, "setParams:", v12);
    -[NDOAppleCareWebViewController setSource:](v15, "setSource:", v13);
  }

  return v15;
}

- (NDOAppleCareWebViewController)initWithWarranty:(id)a3 serialNumber:(id)a4
{
  return -[NDOAppleCareWebViewController initWithWarranty:serialNumber:params:](self, "initWithWarranty:serialNumber:params:", a3, a4, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 6)
  {

    return 30;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    return 30;
  return 2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NDOAppleCareWebViewController webview](self, "webview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("loading"));

  v4.receiver = self;
  v4.super_class = (Class)NDOAppleCareWebViewController;
  -[NDOAppleCareWebViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NDOAppleCareWebViewController;
  -[NDOAppleCareWebViewController loadView](&v8, sel_loadView);
  -[NDOAppleCareWebViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NDOAppleCareWebViewController headerView](self, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelTapped_);
    -[NDOAppleCareWebViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

    -[NDOAppleCareWebViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesBackButton:", 1);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NDOAppleCareWebViewController;
  -[NDOAppleCareWebViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[NDOAppleCareWebViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NDOAppleCareWebViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNavigationBarHidden:", 0);

    -[NDOAppleCareWebViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BEBD790]);
    objc_msgSend(v7, "configureWithTransparentBackground");
    objc_msgSend(v6, "setScrollEdgeAppearance:", v7);
    objc_msgSend(v6, "setStandardAppearance:", v7);
    objc_msgSend(v6, "setCompactAppearance:", v7);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NDOAppleCareWebViewController;
  -[NDOAppleCareWebViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[NDOAppleCareWebViewController setRetriesRemaining:](self, "setRetriesRemaining:", 2);
  -[NDOAppleCareWebViewController webview](self, "webview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNavigationDelegate:", self);

  -[NDOAppleCareWebViewController loadWebview:](self, "loadWebview:", 0);
  -[NDOAppleCareWebViewController setIsLoading:](self, "setIsLoading:", 1);
  -[NDOAppleCareWebViewController webview](self, "webview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("loading"), 1, 0);

  -[NDOAppleCareWebViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[NDOAppleCareWebViewController headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBarStyle:", 0);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A8]), "initWithTitle:", &stru_24F3352F8);
    -[NDOAppleCareWebViewController setWebViewNavigationItem:](self, "setWebViewNavigationItem:", v7);

    v8 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F3352F8, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, self, sel_cancelTapped_);

    -[NDOAppleCareWebViewController webViewNavigationItem](self, "webViewNavigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", v11);

    -[NDOAppleCareWebViewController headerView](self, "headerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOAppleCareWebViewController webViewNavigationItem](self, "webViewNavigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushNavigationItem:animated:", v14, 0);

    -[NDOAppleCareWebViewController headerView](self, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

  }
}

- (void)loadWebview:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__NDOAppleCareWebViewController_loadWebview___block_invoke;
  v6[3] = &unk_24F334AB0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __45__NDOAppleCareWebViewController_loadWebview___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  uint64_t *v8;
  id v9;
  NSObject *v10;
  dispatch_semaphore_t v11;
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
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD block[5];
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  __CFString *v50;
  _QWORD v51[2];
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  objc_msgSend(*(id *)(a1 + 32), "warranty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "agsURL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("https://agreements.apple.com/acsales");
  if (v3)
    v5 = (__CFString *)v3;
  v50 = v5;

  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("WebFlowURL"), CFSTR("com.apple.NewDeviceOutreach"));
  if (v6)
  {
    _NDOLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v6;
      _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "Using override URL: %@", buf, 0xCu);
    }

    v8 = v46;
    v9 = v6;
    v10 = v8[5];
    v8[5] = (uint64_t)v9;
  }
  else
  {
    v11 = dispatch_semaphore_create(0);
    v12 = (void *)objc_opt_new();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __45__NDOAppleCareWebViewController_loadWebview___block_invoke_35;
    v42[3] = &unk_24F334A60;
    v44 = &v45;
    v10 = v11;
    v43 = v10;
    objc_msgSend(v12, "webURLOverride:", v42);

    dispatch_semaphore_wait(v10, 0);
  }

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v46[5]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(*(id *)(a1 + 32), "warranty");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "acOfferIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queryItemWithName:value:", CFSTR("cid"), v16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("callerId"), CFSTR("NewDeviceOutreach"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v39;
  v51[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQueryItems:", v18);

  objc_msgSend(*(id *)(a1 + 32), "params");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "params");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@&%@"), v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
LABEL_10:
      _NDOLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v25;
        _os_log_impl(&dword_229EC7000, v26, OS_LOG_TYPE_DEFAULT, "Begining web flow with URL: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTimeoutInterval:", 30.0);
      v28 = (void *)objc_opt_new();
      objc_msgSend(v28, "defaultDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "serialNumber");
      v30 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "ndo_addBasicHeadersWithBundleID:", 0);
      objc_msgSend(v27, "ndo_signWithAccountHeaders:avoidUI:", *(unsigned __int8 *)(a1 + 40), 0);
      objc_msgSend(*(id *)(a1 + 32), "warranty");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "acOfferIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "serialNumber");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "ndo_addOASHeadersWithOfferID:serialNumber:primarySerialNumber:", v32, v33, v30);

      objc_msgSend(&unk_24F33B0F8, "stringValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setValue:forHTTPHeaderField:", v34, CFSTR("oceanVersion"));

      if (*(_BYTE *)(a1 + 40))
      {
        _NDOLogSystem();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v27, "headerDescription");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v36;
          _os_log_impl(&dword_229EC7000, v35, OS_LOG_TYPE_DEFAULT, "Retrying request: %@", buf, 0xCu);

        }
      }
      else
      {
        _NDOLogSystem();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v27, "headerDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v37;
          _os_log_impl(&dword_229EC7000, v35, OS_LOG_TYPE_DEFAULT, "Starting request: %@", buf, 0xCu);

        }
      }

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__NDOAppleCareWebViewController_loadWebview___block_invoke_54;
      block[3] = &unk_24F334A88;
      block[4] = *(_QWORD *)(a1 + 32);
      v41 = v27;
      v38 = v27;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend(v13, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      goto LABEL_10;
  }
  _NDOLogSystem();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    __45__NDOAppleCareWebViewController_loadWebview___block_invoke_cold_1((uint64_t)v13, v30);
LABEL_21:

  _Block_object_dispose(&v45, 8);
}

void __45__NDOAppleCareWebViewController_loadWebview___block_invoke_35(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (v4)
  {
    _NDOLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_229EC7000, v5, OS_LOG_TYPE_DEFAULT, "Using override URL: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __45__NDOAppleCareWebViewController_loadWebview___block_invoke_54(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "webview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "loadRequest:", *(_QWORD *)(a1 + 40));

}

- (void)setIsLoading:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a3)
  {
    -[NDOAppleCareWebViewController spinner](self, "spinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startAnimating");

    -[NDOAppleCareWebViewController webview](self, "webview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v6 = 1;
  }
  else
  {
    if (!-[NDOAppleCareWebViewController initialLoadCompleted](self, "initialLoadCompleted"))
      return;
    -[NDOAppleCareWebViewController spinner](self, "spinner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAnimating");

    -[NDOAppleCareWebViewController webview](self, "webview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v6 = 0;
  }
  objc_msgSend(v5, "setHidden:", v6);

}

- (void)cancelTapped:(id)a3
{
  id v3;

  -[NDOAppleCareWebViewController presenter](self, "presenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webviewFinishedWithCompletion:", 0);

}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[NDOAppleCareWebViewController webview](self, "webview", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canGoBack");

  if (v6)
  {
    -[NDOAppleCareWebViewController webview](self, "webview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "goBack");

  }
  else
  {
    -[NDOAppleCareWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("loading"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[NDOAppleCareWebViewController webview](self, "webview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOAppleCareWebViewController setIsLoading:](self, "setIsLoading:", objc_msgSend(v13, "isLoading"));

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NDOAppleCareWebViewController;
    -[NDOAppleCareWebViewController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v7, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("close"));

  if (v12)
  {
    _NDOLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = CFSTR("close");
      _os_log_impl(&dword_229EC7000, v13, OS_LOG_TYPE_DEFAULT, "Caught redirection to url of scheme '%@', close", (uint8_t *)&v27, 0xCu);
    }

    v8[2](v8, 0);
    -[NDOAppleCareWebViewController presenter](self, "presenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "webviewFinishedWithCompletion:", 2);
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v10, "scheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("ready"));

  if (v16)
  {
    _NDOLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = CFSTR("ready");
      _os_log_impl(&dword_229EC7000, v17, OS_LOG_TYPE_DEFAULT, "Caught redirection to url of scheme '%@', stop animating spinner and show webview", (uint8_t *)&v27, 0xCu);
    }

    v8[2](v8, 0);
    -[NDOAppleCareWebViewController setInitialLoadCompleted:](self, "setInitialLoadCompleted:", 1);
    -[NDOAppleCareWebViewController setIsLoading:](self, "setIsLoading:", 0);
  }
  else
  {
    objc_msgSend(v10, "scheme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("complete"));

    if (v19)
    {
      _NDOLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138412290;
        v28 = CFSTR("complete");
        _os_log_impl(&dword_229EC7000, v20, OS_LOG_TYPE_DEFAULT, "Caught redirection to url of scheme '%@', hide buttons", (uint8_t *)&v27, 0xCu);
      }

      v8[2](v8, 0);
      -[NDOAppleCareWebViewController webViewNavigationItem](self, "webViewNavigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[NDOAppleCareWebViewController webViewNavigationItem](self, "webViewNavigationItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setHidesBackButton:", 1);

        -[NDOAppleCareWebViewController webViewNavigationItem](self, "webViewNavigationItem");
      }
      else
      {
        -[NDOAppleCareWebViewController navigationItem](self, "navigationItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setHidesBackButton:", 1);

        -[NDOAppleCareWebViewController navigationItem](self, "navigationItem");
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRightBarButtonItem:animated:", 0, 0);
      goto LABEL_18;
    }
    objc_msgSend(v7, "targetFrame");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v8[2](v8, 1);
    }
    else
    {
      _NDOLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_229EC7000, v25, OS_LOG_TYPE_DEFAULT, "Attempting to open to url to blank frame, open in safari", (uint8_t *)&v27, 2u);
      }

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE81A8]), "initWithURL:", v10);
      -[NDOAppleCareWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v26, 1, &__block_literal_global_0);
      v8[2](v8, 0);

    }
  }
LABEL_19:

}

void __89__NDOAppleCareWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _NDOLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_229EC7000, v0, OS_LOG_TYPE_DEFAULT, "Return from safari", v1, 2u);
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, uint64_t);
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  int v15;
  _DWORD v16[7];

  *(_QWORD *)&v16[5] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, uint64_t))a5;
  objc_msgSend(a4, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "statusCode");

  if (v9 != 401)
  {
    if (v9 == 200)
    {
      _NDOLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        v11 = "successfully loaded webpage";
        v12 = v10;
        v13 = 2;
LABEL_11:
        _os_log_impl(&dword_229EC7000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);
      }
    }
    else
    {
      _NDOLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134217984;
        *(_QWORD *)v16 = v9;
        v11 = "Failed to load webpage with status: %ld";
        v12 = v10;
        v13 = 12;
        goto LABEL_11;
      }
    }
LABEL_14:

    v7[2](v7, 1);
    goto LABEL_15;
  }
  if (-[NDOAppleCareWebViewController retriesRemaining](self, "retriesRemaining") < 1)
  {
    _NDOLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NDOAppleCareWebViewController webView:decidePolicyForNavigationResponse:decisionHandler:].cold.1(v10);
    goto LABEL_14;
  }
  -[NDOAppleCareWebViewController setRetriesRemaining:](self, "setRetriesRemaining:", -[NDOAppleCareWebViewController retriesRemaining](self, "retriesRemaining") - 1);
  _NDOLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 67109376;
    v16[0] = 2 - -[NDOAppleCareWebViewController retriesRemaining](self, "retriesRemaining");
    LOWORD(v16[1]) = 1024;
    *(_DWORD *)((char *)&v16[1] + 2) = 2;
    _os_log_impl(&dword_229EC7000, v14, OS_LOG_TYPE_DEFAULT, "Retrying webview load attempt (%d/%d)", (uint8_t *)&v15, 0xEu);
  }

  v7[2](v7, 0);
  -[NDOAppleCareWebViewController loadWebview:](self, "loadWebview:", 1);
LABEL_15:

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "Failed to load webpage with error: %@", buf, 0xCu);
  }

  v8 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WEBVIEW_FAIL_ALERT_MESSAGE"), &stru_24F3352F8, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", 0, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24F3352F8, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__NDOAppleCareWebViewController_webView_didFailProvisionalNavigation_withError___block_invoke;
  v16[3] = &unk_24F3349A0;
  v16[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15);

  -[NDOAppleCareWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

void __80__NDOAppleCareWebViewController_webView_didFailProvisionalNavigation_withError___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "webviewFinishedWithCompletion:", 0);

}

- (NDOAppleCareWebViewPresenterProtocol)presenter
{
  return (NDOAppleCareWebViewPresenterProtocol *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (NDOWarranty)warranty
{
  return (NDOWarranty *)objc_getProperty(self, a2, 984, 1);
}

- (void)setWarranty:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 992, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (NSString)params
{
  return (NSString *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (WKWebView)webview
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webview);
}

- (void)setWebview:(id)a3
{
  objc_storeWeak((id *)&self->_webview, a3);
}

- (UINavigationBar)headerView
{
  return (UINavigationBar *)objc_loadWeakRetained((id *)&self->_headerView);
}

- (void)setHeaderView:(id)a3
{
  objc_storeWeak((id *)&self->_headerView, a3);
}

- (UINavigationItem)webViewNavigationItem
{
  return (UINavigationItem *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setWebViewNavigationItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_spinner);
}

- (void)setSpinner:(id)a3
{
  objc_storeWeak((id *)&self->_spinner, a3);
}

- (BOOL)initialLoadCompleted
{
  return self->_initialLoadCompleted;
}

- (void)setInitialLoadCompleted:(BOOL)a3
{
  self->_initialLoadCompleted = a3;
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (int)retriesRemaining
{
  return self->_retriesRemaining;
}

- (void)setRetriesRemaining:(int)a3
{
  self->_retriesRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_destroyWeak((id *)&self->_spinner);
  objc_storeStrong((id *)&self->_webViewNavigationItem, 0);
  objc_destroyWeak((id *)&self->_headerView);
  objc_destroyWeak((id *)&self->_webview);
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

void __45__NDOAppleCareWebViewController_loadWebview___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_229EC7000, a2, OS_LOG_TYPE_ERROR, "Failed to instatiate web flow from: %@", (uint8_t *)&v2, 0xCu);
}

- (void)webView:(os_log_t)log decidePolicyForNavigationResponse:decisionHandler:.cold.1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = 2;
  _os_log_error_impl(&dword_229EC7000, log, OS_LOG_TYPE_ERROR, "Failed to load webpage after %d retries", (uint8_t *)v1, 8u);
}

@end
