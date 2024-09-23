@implementation NDOAppleCareAMSUIViewController

- (NDOAppleCareAMSUIViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 source:(id)a5 deeplinkParams:(id)a6
{
  return (NDOAppleCareAMSUIViewController *)-[NDOAppleCareAMSUIViewController _initWithWarranty:serialNumber:source:isMultiCall:url:deeplinkParams:purchaseBody:](self, "_initWithWarranty:serialNumber:source:isMultiCall:url:deeplinkParams:purchaseBody:", a3, a4, a5, 0, 0, a6, 0);
}

- (NDOAppleCareAMSUIViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 source:(id)a5 url:(id)a6 purchaseBody:(id)a7 deeplinkParams:(id)a8
{
  return (NDOAppleCareAMSUIViewController *)-[NDOAppleCareAMSUIViewController _initWithWarranty:serialNumber:source:isMultiCall:url:deeplinkParams:purchaseBody:](self, "_initWithWarranty:serialNumber:source:isMultiCall:url:deeplinkParams:purchaseBody:", a3, a4, a5, 1, a6, a8, a7);
}

- (id)_initWithWarranty:(id)a3 serialNumber:(id)a4 source:(id)a5 isMultiCall:(BOOL)a6 url:(id)a7 deeplinkParams:(id)a8 purchaseBody:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NDOAppleCareAMSUIViewController *v26;
  NDOAppleCareAMSUIViewController *v27;
  NSObject *v28;
  _BOOL4 v30;
  id v31;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v30 = a6;
  v50 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "aida_accountForPrimaryiCloudAccount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BE08060];
  objc_msgSend(MEMORY[0x24BE083F8], "bagKeySet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE083F8], "bagSubProfile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE083F8], "bagSubProfileVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerBagKeySet:forProfile:profileVersion:", v21, v22, v23);

  v24 = v13;
  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", CFSTR("AppleCare"), CFSTR("1"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)NDOAppleCareAMSUIViewController;
  v26 = -[AMSUIWebViewController initWithBag:account:clientInfo:](&v33, sel_initWithBag_account_clientInfo_, v25, v19, 0);
  v27 = v26;
  if (v26)
  {
    -[NDOAppleCareAMSUIViewController setWarranty:](v26, "setWarranty:", v31);
    -[NDOAppleCareAMSUIViewController setSerialNumber:](v27, "setSerialNumber:", v24);
    -[NDOAppleCareAMSUIViewController setSource:](v27, "setSource:", v14);
    -[NDOAppleCareAMSUIViewController setUlSalesURL:](v27, "setUlSalesURL:", v15);
    -[NDOAppleCareAMSUIViewController setDeeplinkParams:](v27, "setDeeplinkParams:", v16);
    -[NDOAppleCareAMSUIViewController setPurchaseAPIBody:](v27, "setPurchaseAPIBody:", v17);
    -[NDOAppleCareAMSUIViewController setIsMultipleDevicePurchaseCall:](v27, "setIsMultipleDevicePurchaseCall:", v30);
    -[NDOAppleCareAMSUIViewController setModalPresentationStyle:](v27, "setModalPresentationStyle:", 3);
    -[AMSUIWebViewController setDelegate:](v27, "setDelegate:", v27);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[AMSUIWebViewController setLoadUsingWebKit:](v27, "setLoadUsingWebKit:", 1);
    _NDOLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136448002;
      v35 = "-[NDOAppleCareAMSUIViewController _initWithWarranty:serialNumber:source:isMultiCall:url:deeplinkParams:purchaseBody:]";
      v36 = 2112;
      v37 = v24;
      v38 = 2112;
      v39 = v14;
      v40 = 2112;
      v41 = v15;
      v42 = 2112;
      v43 = v16;
      v44 = 2112;
      v45 = v17;
      v46 = 1024;
      v47 = v30;
      v48 = 2112;
      v49 = 0;
      _os_log_debug_impl(&dword_229EC7000, v28, OS_LOG_TYPE_DEBUG, "%{public}s: serialNumber: %@, source: %@, url: %@, deeplinkParams: %@, body: %@, isMultiCall: %d, clientInfo: %@", buf, 0x4Eu);
    }

  }
  return v27;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NDOAppleCareAMSUIViewController;
  -[AMSUIWebViewController loadView](&v5, sel_loadView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelTapped_);
  -[NDOAppleCareAMSUIViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NDOAppleCareAMSUIViewController;
  -[NDOAppleCareAMSUIViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[NDOAppleCareAMSUIViewController loadAMSUIView](self, "loadAMSUIView");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NDOAppleCareAMSUIViewController;
  -[AMSUIWebViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[NDOAppleCareAMSUIViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:", 0);

  -[NDOAppleCareAMSUIViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BEBD790]);
  objc_msgSend(v6, "configureWithTransparentBackground");
  objc_msgSend(v5, "setScrollEdgeAppearance:", v6);
  objc_msgSend(v5, "setStandardAppearance:", v6);
  objc_msgSend(v5, "setCompactAppearance:", v6);

}

- (void)loadAMSUIView
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[NDOAppleCareAMSUIViewController loadAMSUIView]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_229EC7000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to instatiate amsUI flow from: %@", (uint8_t *)&v2, 0x16u);
}

void __48__NDOAppleCareAMSUIViewController_loadAMSUIView__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __48__NDOAppleCareAMSUIViewController_loadAMSUIView__block_invoke_27(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id __48__NDOAppleCareAMSUIViewController_loadAMSUIView__block_invoke_52(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "loadRequest:", *(_QWORD *)(a1 + 40));
}

- (void)cancelTapped:(id)a3
{
  id v3;

  -[NDOAppleCareAMSUIViewController presenter](self, "presenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "amsUIViewFinishedWithCompletion:", 0);

}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  -[NDOAppleCareAMSUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  return 0;
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _NDOLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[NDOAppleCareAMSUIViewController webViewController:handleDelegateAction:completion:]";
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_229EC7000, v9, OS_LOG_TYPE_DEFAULT, "%s: %@ action: %@", (uint8_t *)&v15, 0x20u);
  }

  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (int)objc_msgSend(v10, "intValue");

    v12 = v8;
  }
  else
  {
    v11 = 2;
  }
  -[NDOAppleCareAMSUIViewController presenter](self, "presenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "amsUIViewFinishedWithCompletion:params:", v11, v8);

  return 1;
}

- (NDOAppleCareAMSUIViewPresenterProtocol)presenter
{
  return (NDOAppleCareAMSUIViewPresenterProtocol *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
  self->_navController = (UINavigationController *)a3;
}

- (NDOWarranty)warranty
{
  return (NDOWarranty *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setWarranty:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (BOOL)initialLoadCompleted
{
  return self->_initialLoadCompleted;
}

- (void)setInitialLoadCompleted:(BOOL)a3
{
  self->_initialLoadCompleted = a3;
}

- (BOOL)isMultipleDevicePurchaseCall
{
  return self->_isMultipleDevicePurchaseCall;
}

- (void)setIsMultipleDevicePurchaseCall:(BOOL)a3
{
  self->_isMultipleDevicePurchaseCall = a3;
}

- (NSString)deeplinkParams
{
  return (NSString *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setDeeplinkParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (NSString)ulSalesURL
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setUlSalesURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (NSDictionary)purchaseAPIBody
{
  return (NSDictionary *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setPurchaseAPIBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseAPIBody, 0);
  objc_storeStrong((id *)&self->_ulSalesURL, 0);
  objc_storeStrong((id *)&self->_deeplinkParams, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end
