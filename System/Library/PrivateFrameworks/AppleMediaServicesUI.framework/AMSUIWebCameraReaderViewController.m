@implementation AMSUIWebCameraReaderViewController

- (AMSUIWebCameraReaderViewController)initWithContext:(id)a3
{
  id v5;
  AMSUIWebCameraReaderViewController *v6;
  AMSUIWebCameraReaderViewController *v7;
  AMSUIWebNavigationBarModel *v8;
  AMSUIWebNavigationBarModel *navigationBarModel;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebCameraReaderViewController;
  v6 = -[AMSUICommonViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = objc_alloc_init(AMSUIWebNavigationBarModel);
    navigationBarModel = v7->_navigationBarModel;
    v7->_navigationBarModel = v8;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE580], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE578], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE440], 0);

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebCameraReaderViewController;
  -[AMSUICommonViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebCameraReaderViewController;
  -[AMSUICommonViewController loadView](&v3, sel_loadView);
  -[AMSUIWebCameraReaderViewController _applyAppearance](self, "_applyAppearance");
  -[AMSUIWebCameraReaderViewController _setupPage](self, "_setupPage");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebCameraReaderViewController;
  -[AMSUIWebCameraReaderViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[AMSUIWebCameraReaderViewController _layoutPage](self, "_layoutPage");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebCameraReaderViewController;
  -[AMSUIWebCameraReaderViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    -[AMSUIWebCameraReaderViewController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Presenting camera reader", buf, 0x16u);

  }
  -[AMSUIWebCameraReaderViewController _cameraReader](self, "_cameraReader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_INFO, "%{public}@: setting up camera session", buf, 0xCu);
    }

    -[AMSUIWebCameraReaderViewController _setupCameraReader](self, "_setupCameraReader");
  }
  -[AMSUIWebCameraReaderViewController _applyAppearance](self, "_applyAppearance");
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebCameraReaderViewController;
  -[AMSUIWebCameraReaderViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v4 = *MEMORY[0x24BDB1D50];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__AMSUIWebCameraReaderViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_24CB507F0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDB2460], "requestAccessForMediaType:completionHandler:", v4, v5);
}

void __52__AMSUIWebCameraReaderViewController_viewDidAppear___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__AMSUIWebCameraReaderViewController_viewDidAppear___block_invoke_28;
    block[3] = &unk_24CB4F0E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] denied camera access", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "postEvent:options:", CFSTR("VideoAuthorizationDenied"), MEMORY[0x24BDBD1B8]);

  }
}

void __52__AMSUIWebCameraReaderViewController_viewDidAppear___block_invoke_28(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] starting camera session", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_cameraReader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)AMSUIWebCameraReaderViewController;
  -[AMSUIWebCameraReaderViewController viewDidDisappear:](&v17, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_INFO, "%{public}@: evaluating camera session teardown", buf, 0xCu);
  }

  -[AMSUIWebCameraReaderViewController model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "prefersSessionTeardown"))
  {

  }
  else
  {
    -[AMSUIWebCameraReaderViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "reducedMemoryMode");

    if (!v9)
      return;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
    v12 = objc_opt_class();
    -[AMSUIWebCameraReaderViewController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2114;
    v21 = v14;
    _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] cancelling camera session", buf, 0x16u);

  }
  -[AMSUIWebCameraReaderViewController _cameraReader](self, "_cameraReader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancel");

  -[AMSUIWebCameraReaderViewController _cameraReader](self, "_cameraReader");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ams_removeFromParentViewController");

  -[AMSUIWebCameraReaderViewController setChildController:](self, "setChildController:", 0);
}

+ (BOOL)cameraSupported
{
  return objc_msgSend(MEMORY[0x24BE27E40], "supportedCameraCount") != 0;
}

- (void)_setChild:(id)a3
{
  id v4;

  v4 = a3;
  -[AMSUIWebCameraReaderViewController setChildController:](self, "setChildController:", v4);
  -[UIViewController ams_setChildViewController:](self, "ams_setChildViewController:", v4);

}

- (void)_setupPage
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[AMSUIWebCameraReaderViewController _setupCameraReader](self, "_setupCameraReader");
  -[AMSUIWebCameraReaderViewController _setupInfoView](self, "_setupInfoView");
  -[AMSUIWebCameraReaderViewController _setupCameraToggle](self, "_setupCameraToggle");
  -[AMSUIWebCameraReaderViewController _setupTextEntry](self, "_setupTextEntry");
  -[AMSUIWebCameraReaderViewController model](self, "model");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isFullScreen") & 1) != 0)
  {
    -[AMSUIWebCameraReaderViewController model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "style");

    if (v5 != 9)
    {
      -[AMSUIWebCameraReaderViewController _setupNavigationModel](self, "_setupNavigationModel");
      -[AMSUIWebCameraReaderViewController _commitNavigationBarModel](self, "_commitNavigationBarModel");
    }
  }
  else
  {

  }
}

- (void)_setupCameraReader
{
  void *v3;
  uint64_t v4;

  -[AMSUIWebCameraReaderViewController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pageType");

  switch(v4)
  {
    case 2:
      -[AMSUIWebCameraReaderViewController _setupPageForIDCard](self, "_setupPageForIDCard");
      break;
    case 1:
      -[AMSUIWebCameraReaderViewController _setupPageForGiftCard](self, "_setupPageForGiftCard");
      break;
    case 0:
      -[AMSUIWebCameraReaderViewController _setupPageForCreditCard](self, "_setupPageForCreditCard");
      break;
  }
}

- (void)_setupInfoView
{
  void *v3;
  char v4;
  AMSUIWebCameraReaderInfoView *v5;
  AMSUIWebCameraReaderInfoView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[AMSUIWebCameraReaderViewController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFullScreen");

  if ((v4 & 1) == 0)
  {
    v5 = [AMSUIWebCameraReaderInfoView alloc];
    v6 = -[AMSUIWebCameraReaderInfoView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AMSUIWebCameraReaderViewController setInfoView:](self, "setInfoView:", v6);

    -[AMSUIWebCameraReaderViewController model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "primaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderViewController infoView](self, "infoView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v8);

    -[AMSUIWebCameraReaderViewController model](self, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "secondaryLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderViewController infoView](self, "infoView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "secondaryLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v12);

    -[AMSUIWebCameraReaderViewController infoView](self, "infoView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomLink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderViewController model](self, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomLinkLabel");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = &stru_24CB5A078;
    objc_msgSend(v16, "setTitle:forState:", v20, 0);

    -[AMSUIWebCameraReaderViewController model](self, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomLinkAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderViewController infoView](self, "infoView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBottomLinkAction:", v22);

    -[AMSUICommonViewController view](self, "view");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", self->_infoView);

  }
}

- (void)_setupTextEntry
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  id v21;

  -[AMSUIWebCameraReaderViewController model](self, "model");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "allowsTextEntry"))
  {
    -[AMSUIWebCameraReaderViewController model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFullScreen");

    if (!v4)
      return;
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 10);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v21);
    -[AMSUIWebCameraReaderViewController setTextFieldSafeAreaBackdrop:](self, "setTextFieldSafeAreaBackdrop:", v5);
    -[AMSUICommonViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderViewController textFieldSafeAreaBackdrop](self, "textFieldSafeAreaBackdrop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    v8 = objc_alloc_init(MEMORY[0x24BEBDA20]);
    objc_msgSend(v8, "addTarget:action:", self, sel__overlayTapGestureAction_);
    v9 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[AMSUIWebCameraReaderViewController setOverlay:](self, "setOverlay:", v9);

    -[AMSUIWebCameraReaderViewController overlay](self, "overlay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    -[AMSUIWebCameraReaderViewController overlay](self, "overlay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 0.0);

    -[AMSUIWebCameraReaderViewController overlay](self, "overlay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addGestureRecognizer:", v8);

    -[AMSUICommonViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderViewController _makeTextFieldWithPlaceholderColor:](self, "_makeTextFieldWithPlaceholderColor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setClearsPlaceholderOnBeginEditing:", 0);
    objc_msgSend(v16, "setDelegate:", self);
    -[AMSUIWebCameraReaderViewController model](self, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textFieldPlaceholder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPlaceholder:", v18);

    -[AMSUIWebCameraReaderViewController setTextField:](self, "setTextField:", v16);
    -[AMSUICommonViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v16);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x24BEBE580], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x24BEBE578], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_keyboardDidHide_, *MEMORY[0x24BEBE440], 0);

  }
}

- (id)_makeTextFieldWithPlaceholderColor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  AMSUIWebCameraTextField *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BEBB360];
  v19[0] = v5;
  v7 = *MEMORY[0x24BEBB368];
  v18[0] = v6;
  v18[1] = v7;
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.7, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)

  v10 = objc_alloc(MEMORY[0x24BDD1458]);
  -[AMSUIWebCameraReaderViewController model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textFieldPlaceholder");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_24CB5A078;
  v15 = (void *)objc_msgSend(v10, "initWithString:attributes:", v14, v9);

  v16 = -[AMSUIWebCameraTextField initWithFrame:]([AMSUIWebCameraTextField alloc], "initWithFrame:", 0.0, 0.0, 1.0, 44.0);
  -[AMSUIWebCameraTextField setAutocorrectionType:](v16, "setAutocorrectionType:", 1);
  -[AMSUIWebCameraTextField setAutocapitalizationType:](v16, "setAutocapitalizationType:", 3);
  -[AMSUIWebCameraTextField setFont:](v16, "setFont:", v5);
  -[AMSUIWebCameraTextField setAttributedPlaceholder:](v16, "setAttributedPlaceholder:", v15);

  return v16;
}

- (void)_layoutPage
{
  void *v3;
  int v4;

  -[AMSUIWebCameraReaderViewController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFullScreen");

  if (v4)
    -[AMSUIWebCameraReaderViewController _layoutFullScreen](self, "_layoutFullScreen");
  else
    -[AMSUIWebCameraReaderViewController _layoutHalfScreen](self, "_layoutHalfScreen");
  -[AMSUIWebCameraReaderViewController _layoutTextField](self, "_layoutTextField");
}

- (void)_layoutHalfScreen
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
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v11 * 0.66;
  -[AMSUIWebCameraReaderViewController childController](self, "childController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v5, v7, v9, v12);

  -[AMSUICommonViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[AMSUIWebCameraReaderViewController infoView](self, "infoView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v17, v12, v19, v21 - v12);

}

- (void)_layoutFullScreen
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
  id v14;

  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIWebCameraReaderViewController childController](self, "childController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  -[AMSUIWebCameraReaderViewController infoView](self, "infoView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

}

- (void)_layoutTextField
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  BOOL v8;
  void *v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  CGRect v23;

  -[AMSUIWebCameraReaderViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUICommonViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeAreaInsets");
    v6 = v5;

    -[AMSUIWebCameraReaderViewController textField](self, "textField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isFirstResponder"))
    {
      -[AMSUIWebCameraReaderViewController keyboardRect](self, "keyboardRect");
      v8 = CGRectEqualToRect(v23, *MEMORY[0x24BDBF090]);

      if (!v8)
      {
        -[AMSUIWebCameraReaderViewController textField](self, "textField");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CGRectGetMinY(self->_keyboardRect) + -44.0;
        -[AMSUICommonViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        objc_msgSend(v9, "setFrame:", 0.0, v10);

        -[AMSUIWebCameraReaderViewController textFieldSafeAreaBackdrop](self, "textFieldSafeAreaBackdrop");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v12 = CGRectGetMinY(self->_keyboardRect) + -44.0;
        -[AMSUICommonViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bounds");
        objc_msgSend(v22, "setFrame:", 0.0, v12);
LABEL_8:

        return;
      }
    }
    else
    {

    }
    -[AMSUIWebCameraReaderViewController textField](self, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICommonViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16 + -44.0 - v6;
    -[AMSUICommonViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    objc_msgSend(v14, "setFrame:", 0.0, v17);

    -[AMSUIWebCameraReaderViewController textFieldSafeAreaBackdrop](self, "textFieldSafeAreaBackdrop");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSUICommonViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v20 = v19 + -44.0 - v6;
    -[AMSUICommonViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    objc_msgSend(v22, "setFrame:", 0.0, v20);

    goto LABEL_8;
  }
}

- (void)_commitNavigationBarModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AMSUIWebCameraReaderViewController navigationBarModel](self, "navigationBarModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStyle:", 5);

  -[AMSUIWebCameraReaderViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebCameraReaderViewController navigationBarModel](self, "navigationBarModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyNavigationModel:", v6);

}

- (void)_setupNavigationModel
{
  void *v3;
  void *v4;
  id v5;

  -[AMSUIWebCameraReaderViewController model](self, "model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebCameraReaderViewController navigationBarModel](self, "navigationBarModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

}

- (void)_setupCameraToggle
{
  void *v3;
  int v4;

  -[AMSUIWebCameraReaderViewController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsCameraToggle");

  if (v4)
  {
    -[AMSUIWebCameraReaderViewController _setCameraToggleButton](self, "_setCameraToggleButton");
    -[AMSUIWebCameraReaderViewController _setCancelButton](self, "_setCancelButton");
    -[AMSUIWebCameraReaderViewController _commitNavigationBarModel](self, "_commitNavigationBarModel");
  }
}

- (void)_setCancelButton
{
  AMSUIWebFlowAction *v3;
  void *v4;
  AMSUIWebButtonModel *v5;
  void *v6;
  void *v7;
  AMSUIWebBarButtonItemModel *v8;
  void *v9;
  AMSUIWebFlowAction *v10;

  v3 = [AMSUIWebFlowAction alloc];
  -[AMSUIWebCameraReaderViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIWebFlowAction initWithContext:](v3, "initWithContext:", v4);

  -[AMSUIWebFlowAction setPresentationType:](v10, "setPresentationType:", 4);
  v5 = objc_alloc_init(AMSUIWebButtonModel);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("CANCEL"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebButtonModel setTitle:](v5, "setTitle:", v7);

  -[AMSUIWebButtonModel setAction:](v5, "setAction:", v10);
  -[AMSUIWebButtonModel setEnabled:](v5, "setEnabled:", 1);
  -[AMSUIWebButtonModel setStyle:](v5, "setStyle:", 3);
  v8 = objc_alloc_init(AMSUIWebBarButtonItemModel);
  -[AMSUIWebBarButtonItemModel setButtonModel:](v8, "setButtonModel:", v5);
  -[AMSUIWebCameraReaderViewController navigationBarModel](self, "navigationBarModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItemModel:", v8);

}

- (void)_setRedeemButton
{
  AMSUIWebButtonModel *v3;
  void *v4;
  void *v5;
  AMSUIWebBarButtonItemModel *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v3 = objc_alloc_init(AMSUIWebButtonModel);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("REDEEM"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebButtonModel setTitle:](v3, "setTitle:", v5);

  -[AMSUIWebButtonModel setEnabled:](v3, "setEnabled:", 1);
  -[AMSUIWebButtonModel setStyle:](v3, "setStyle:", 0);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __54__AMSUIWebCameraReaderViewController__setRedeemButton__block_invoke;
  v11 = &unk_24CB4F800;
  objc_copyWeak(&v12, &location);
  -[AMSUIWebButtonModel setActionBlock:](v3, "setActionBlock:", &v8);
  v6 = objc_alloc_init(AMSUIWebBarButtonItemModel);
  -[AMSUIWebBarButtonItemModel setButtonModel:](v6, "setButtonModel:", v3, v8, v9, v10, v11);
  -[AMSUIWebCameraReaderViewController navigationBarModel](self, "navigationBarModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItemModel:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __54__AMSUIWebCameraReaderViewController__setRedeemButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_redeemAction");

}

- (void)_setCameraToggleButton
{
  AMSUIWebButtonModel *v3;
  AMSUIWebBarButtonItemModel *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v3 = objc_alloc_init(AMSUIWebButtonModel);
  -[AMSUIWebButtonModel setSystemImageName:](v3, "setSystemImageName:", CFSTR("arrow.triangle.2.circlepath.camera"));
  -[AMSUIWebButtonModel setEnabled:](v3, "setEnabled:", 1);
  -[AMSUIWebButtonModel setStyle:](v3, "setStyle:", 0);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __60__AMSUIWebCameraReaderViewController__setCameraToggleButton__block_invoke;
  v9 = &unk_24CB4F800;
  objc_copyWeak(&v10, &location);
  -[AMSUIWebButtonModel setActionBlock:](v3, "setActionBlock:", &v6);
  v4 = objc_alloc_init(AMSUIWebBarButtonItemModel);
  -[AMSUIWebBarButtonItemModel setButtonModel:](v4, "setButtonModel:", v3, v6, v7, v8, v9);
  -[AMSUIWebCameraReaderViewController navigationBarModel](self, "navigationBarModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItemModel:", v4);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __60__AMSUIWebCameraReaderViewController__setCameraToggleButton__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cameraReader");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "toggleCamera");

}

- (id)_outputForCreditCardReaderObjects:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v8 = *MEMORY[0x24BE27E28];
    v9 = *MEMORY[0x24BE27E18];
    v10 = *MEMORY[0x24BE27E20];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v8);

        if (v14)
        {
          objc_msgSend(v12, "stringValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("cardNumber"));

        }
        objc_msgSend(v12, "type");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v9);

        if (v17)
        {
          objc_msgSend(v12, "stringValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("cardholderName"));

        }
        objc_msgSend(v12, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqual:", v10);

        if (v20)
        {
          v21 = v12;
          objc_msgSend(v21, "dayValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("cardExpirationDay"));

          objc_msgSend(v21, "monthValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("cardExpirationMonth"));

          objc_msgSend(v21, "yearValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("cardExpirationYear"));

          objc_msgSend(v21, "stringValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("cardExpirationString"));
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)_setupPageForCreditCard
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_opt_class(), "cameraSupported"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE27E40]);
    objc_msgSend(v3, "setHidePlacementText:", 1);
    objc_msgSend(v3, "setDelegate:", self);
    v4 = *MEMORY[0x24BE27E18];
    v6[0] = *MEMORY[0x24BE27E28];
    v6[1] = v4;
    v6[2] = *MEMORY[0x24BE27E20];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOutputObjectTypes:", v5);

    -[AMSUIWebCameraReaderViewController _setChild:](self, "_setChild:", v3);
  }
}

- (void)_setupPageForGiftCard
{
  id v3;

  if (objc_msgSend(MEMORY[0x24BE27E58], "isCRCodeRedeemerAvailable"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE27E58]);
    objc_msgSend(v3, "setDelegate:", self);
    -[AMSUIWebCameraReaderViewController _setChild:](self, "_setChild:", v3);

  }
}

- (id)_outputForGiftCardReaderObjects:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "valueForKey:", *MEMORY[0x24BE27E08]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AMSUIWebCameraReaderViewController _outputForGiftCardReaderCode:](self, "_outputForGiftCardReaderCode:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_outputForGiftCardReaderCode:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("giftCardCode"));
  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)_setupPageForIDCard
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_opt_class(), "cameraSupported"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE27E40]);
    objc_msgSend(v3, "setHidePlacementText:", 1);
    objc_msgSend(v3, "setDelegate:", self);
    v4 = *MEMORY[0x24BE27E30];
    v6[0] = *MEMORY[0x24BE27E38];
    v6[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOutputObjectTypes:", v5);

    -[AMSUIWebCameraReaderViewController _setChild:](self, "_setChild:", v3);
  }
}

- (id)_outputForIDCardReaderObjects:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  UIImage *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = *MEMORY[0x24BE27E38];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "type", (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v9);

        if (v13)
        {
          v14 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;

          if (v15)
          {
            objc_msgSend(v15, "imageValue");
            v16 = (UIImage *)objc_claimAutoreleasedReturnValue();
            UIImagePNGRepresentation(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("cardImage"));
            objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("image/png"), CFSTR("mimeType"));

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_applyAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AMSUIWebCameraReaderViewController appearance](self, "appearance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AMSUICommonViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_setBackgroundColor:", v4);

  if (!v3)
  objc_msgSend(v9, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AMSUIWebCameraReaderViewController infoView](self, "infoView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_setBackgroundColor:", v7);

  if (!v6)
}

- (id)_cameraReader
{
  void *v2;
  id v3;

  -[AMSUIWebCameraReaderViewController childController](self, "childController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)_handleCameraOutput:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AMSUIWebJSRequest *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (!v7 && !v8)
  {
    AMSError();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[AMSUIWebCameraReaderViewController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUIWebSetSubLogKey(v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
    *(_DWORD *)buf = 138543618;
    v25 = objc_opt_class();
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending event", buf, 0x16u);
  }

  v22[0] = CFSTR("output");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v22[0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = CFSTR("error");
  v23[0] = v14;
  AMSUIWebJSError(v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)

  if (!v6)
  v18 = -[AMSUIWebJSRequest initWithServiceName:logKey:]([AMSUIWebJSRequest alloc], "initWithServiceName:logKey:", CFSTR("CameraReaderInfo"), v11);
  -[AMSUIWebJSRequest setOptions:](v18, "setOptions:", v17);
  -[AMSUIWebCameraReaderViewController context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "runJSRequest:", v18);

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
      -[AMSUIWebCameraReaderViewController context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid camera page model: %{public}@", (uint8_t *)&v15, 0x20u);

    }
  }

}

- (void)cameraReaderDidCancel:(id)a3
{
  id v4;

  AMSError();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebCameraReaderViewController _handleCameraOutput:error:](self, "_handleCameraOutput:error:", 0, v4);

}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  -[AMSUIWebCameraReaderViewController _handleCameraOutput:error:](self, "_handleCameraOutput:error:", 0, a4);
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  -[AMSUIWebCameraReaderViewController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pageType");

  if (v6 == 2)
  {
    -[AMSUIWebCameraReaderViewController _outputForIDCardReaderObjects:](self, "_outputForIDCardReaderObjects:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[AMSUIWebCameraReaderViewController _outputForCreditCardReaderObjects:](self, "_outputForCreditCardReaderObjects:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:
  -[AMSUIWebCameraReaderViewController setOutput:](self, "setOutput:", v8);

}

- (void)cameraReaderDidEnd:(id)a3
{
  id v4;

  -[AMSUIWebCameraReaderViewController output](self, "output", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebCameraReaderViewController _handleCameraOutput:error:](self, "_handleCameraOutput:error:", v4, 0);

}

- (void)codeRedeemerControllerDidCancel:(id)a3
{
  id v4;

  AMSError();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebCameraReaderViewController _handleCameraOutput:error:](self, "_handleCameraOutput:error:", 0, v4);

}

- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = *MEMORY[0x24BE27E10];
  v6 = a4;
  objc_msgSend(v6, "valueForKey:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebCameraReaderViewController _outputForGiftCardReaderObjects:](self, "_outputForGiftCardReaderObjects:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebCameraReaderViewController _handleCameraOutput:error:](self, "_handleCameraOutput:error:", v7, v8);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[AMSUIWebCameraReaderViewController _setRedeemButton](self, "_setRedeemButton", a3);
  -[AMSUIWebCameraReaderViewController _commitNavigationBarModel](self, "_commitNavigationBarModel");
  -[AMSUICommonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebCameraReaderViewController overlay](self, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:belowSubview:", v5, self->_textField);

  -[AMSUIWebCameraReaderViewController overlay](self, "overlay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");

  -[AMSUIWebCameraReaderViewController overlay](self, "overlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  -[AMSUIWebCameraReaderViewController overlay](self, "overlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__AMSUIWebCameraReaderViewController_textFieldDidBeginEditing___block_invoke;
  v12[3] = &unk_24CB4F0E8;
  v12[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v12, 0.2);
  -[AMSUIWebCameraReaderViewController _cameraReader](self, "_cameraReader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancel");

}

void __63__AMSUIWebCameraReaderViewController_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.4);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[AMSUIWebCameraReaderViewController _redeemAction](self, "_redeemAction", a3);
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v6[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__AMSUIWebCameraReaderViewController_textFieldDidEndEditing___block_invoke;
  v7[3] = &unk_24CB4F0E8;
  v7[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__AMSUIWebCameraReaderViewController_textFieldDidEndEditing___block_invoke_2;
  v6[3] = &unk_24CB507F0;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v7, v6, 0.2);
  UIKeyboardOrderOutAutomatic();
  -[AMSUIWebCameraReaderViewController _cameraReader](self, "_cameraReader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");

  -[AMSUIWebCameraReaderViewController textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", 0);

}

void __61__AMSUIWebCameraReaderViewController_textFieldDidEndEditing___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __61__AMSUIWebCameraReaderViewController_textFieldDidEndEditing___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeFromSuperview");

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  double v11;
  __int128 v12;
  __int128 v13;

  v12 = 0u;
  v13 = 0u;
  v10 = 0;
  v11 = 0.0;
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE468]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getValue:", &v12);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE400]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getValue:", &v10);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE408]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getValue:", &v11);

  -[AMSUICommonViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:fromView:", 0, v12, v13);
  -[AMSUIWebCameraReaderViewController setKeyboardRect:](self, "setKeyboardRect:");

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__AMSUIWebCameraReaderViewController_keyboardWillShow___block_invoke;
  v9[3] = &unk_24CB4F0E8;
  v9[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", v10 << 16, v9, 0, v11, 0.0);

}

uint64_t __55__AMSUIWebCameraReaderViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTextField");
}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  double v11;
  __int128 v12;
  __int128 v13;

  v12 = 0u;
  v13 = 0u;
  v10 = 0;
  v11 = 0.0;
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE468]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getValue:", &v12);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE400]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getValue:", &v10);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE408]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getValue:", &v11);

  -[AMSUICommonViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:fromView:", 0, v12, v13);
  -[AMSUIWebCameraReaderViewController setKeyboardRect:](self, "setKeyboardRect:");

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__AMSUIWebCameraReaderViewController_keyboardWillHide___block_invoke;
  v9[3] = &unk_24CB4F0E8;
  v9[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", v10 << 16, v9, 0, v11, 0.0);

}

uint64_t __55__AMSUIWebCameraReaderViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTextField");
}

- (void)keyboardDidHide:(id)a3
{
  CGSize v4;
  void *v5;
  int v6;
  void *v7;

  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_keyboardRect.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_keyboardRect.size = v4;
  -[AMSUIWebCameraReaderViewController model](self, "model", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsCameraToggle");

  if (v6)
  {
    -[AMSUIWebCameraReaderViewController _setCameraToggleButton](self, "_setCameraToggleButton");
  }
  else
  {
    -[AMSUIWebCameraReaderViewController navigationBarModel](self, "navigationBarModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItemModel:", 0);

  }
  -[AMSUIWebCameraReaderViewController _commitNavigationBarModel](self, "_commitNavigationBarModel");
}

- (void)_redeemAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[AMSUIWebCameraReaderViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[AMSUIWebCameraReaderViewController textField](self, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[AMSUIWebCameraReaderViewController _outputForGiftCardReaderCode:](self, "_outputForGiftCardReaderCode:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraReaderViewController _handleCameraOutput:error:](self, "_handleCameraOutput:error:", v7, 0);

  }
}

- (void)_hideKeyboard
{
  -[AMSUIWebCameraTextField resignFirstResponder](self->_textField, "resignFirstResponder");
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_appearance, a3);
}

- (UIViewController)childController
{
  return self->_childController;
}

- (void)setChildController:(id)a3
{
  objc_storeStrong((id *)&self->_childController, a3);
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (AMSUIWebCameraReaderInfoView)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_infoView, a3);
}

- (AMSUIWebCameraReaderPageModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (AMSUIWebNavigationBarModel)navigationBarModel
{
  return self->_navigationBarModel;
}

- (void)setNavigationBarModel:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarModel, a3);
}

- (NSDictionary)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (CGRect)keyboardRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardRect.origin.x;
  y = self->_keyboardRect.origin.y;
  width = self->_keyboardRect.size.width;
  height = self->_keyboardRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardRect:(CGRect)a3
{
  self->_keyboardRect = a3;
}

- (UIView)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (AMSUIWebCameraTextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (UIView)textFieldSafeAreaBackdrop
{
  return self->_textFieldSafeAreaBackdrop;
}

- (void)setTextFieldSafeAreaBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldSafeAreaBackdrop, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldSafeAreaBackdrop, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_navigationBarModel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_childController, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

@end
