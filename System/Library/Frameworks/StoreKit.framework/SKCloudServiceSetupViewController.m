@implementation SKCloudServiceSetupViewController

- (SKCloudServiceSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SKCloudServiceSetupConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SKCloudServiceSetupViewController *v10;

  v5 = objc_alloc_init(SKCloudServiceSetupConfiguration);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("CFBundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKCloudServiceSetupConfiguration setApplicationIdentifier:](v5, "setApplicationIdentifier:", v8);

  objc_msgSend(v7, "objectForKey:", CFSTR("CFBundleVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKCloudServiceSetupConfiguration setApplicationVersion:](v5, "setApplicationVersion:", v9);

  -[SKCloudServiceSetupConfiguration setTargetsFinanceApplication:](v5, "setTargetsFinanceApplication:", 1);
  -[SKCloudServiceSetupConfiguration setForPublicSDK:](v5, "setForPublicSDK:", 1);
  v10 = -[SKCloudServiceSetupViewController initWithConfiguration:](self, "initWithConfiguration:", v5);

  return v10;
}

- (SKCloudServiceSetupViewController)initWithCoder:(id)a3
{
  return -[SKCloudServiceSetupViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (SKCloudServiceSetupViewController)initWithConfiguration:(id)a3
{
  id v4;
  SKCloudServiceSetupViewController *v5;
  uint64_t v6;
  SKCloudServiceSetupConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKCloudServiceSetupViewController;
  v5 = -[SKCloudServiceSetupViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (SKCloudServiceSetupConfiguration *)v6;

    -[SKCloudServiceSetupViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
    -[SKCloudServiceSetupViewController _requestRemoteViewController](v5, "_requestRemoteViewController");
  }

  return v5;
}

- (void)dealloc
{
  _UIResilientRemoteViewContainerViewController *remoteViewContainerViewController;
  void *v4;
  objc_super v5;

  remoteViewContainerViewController = self->_remoteViewContainerViewController;
  if (remoteViewContainerViewController)
  {
    -[_UIResilientRemoteViewContainerViewController willMoveToParentViewController:](remoteViewContainerViewController, "willMoveToParentViewController:", 0);
    if (-[_UIResilientRemoteViewContainerViewController isViewLoaded](self->_remoteViewContainerViewController, "isViewLoaded"))
    {
      -[_UIResilientRemoteViewContainerViewController view](self->_remoteViewContainerViewController, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

    }
    -[_UIResilientRemoteViewContainerViewController removeFromParentViewController](self->_remoteViewContainerViewController, "removeFromParentViewController");
  }
  v5.receiver = self;
  v5.super_class = (Class)SKCloudServiceSetupViewController;
  -[SKCloudServiceSetupViewController dealloc](&v5, sel_dealloc);
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)setModalInPresentation:(BOOL)a3
{
  objc_class *v3;
  id v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Changing the value of the modalInPresentation property of an instance of %@ is not supported."), v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _UIResilientRemoteViewContainerViewController *remoteViewContainerViewController;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKCloudServiceSetupViewController;
  -[SKCloudServiceSetupViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[SKCloudServiceSetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  remoteViewContainerViewController = self->_remoteViewContainerViewController;
  if (remoteViewContainerViewController)
  {
    -[_UIResilientRemoteViewContainerViewController view](remoteViewContainerViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v6);

  }
}

- (void)viewDidLayoutSubviews
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
  v13.super_class = (Class)SKCloudServiceSetupViewController;
  -[SKCloudServiceSetupViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[SKCloudServiceSetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_UIResilientRemoteViewContainerViewController view](self->_remoteViewContainerViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidAppear:(BOOL)a3
{
  UIAlertController *alertController;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKCloudServiceSetupViewController;
  -[SKCloudServiceSetupViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  self->_isFullyAppeared = 1;
  alertController = self->_alertController;
  if (alertController)
    -[SKCloudServiceSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", alertController, 1, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKCloudServiceSetupViewController;
  -[SKCloudServiceSetupViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (self->_alertController)
  {
    -[SKCloudServiceSetupViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    objc_msgSend(v4, "setOpaque:", 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKCloudServiceSetupViewController;
  -[SKCloudServiceSetupViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_isFullyAppeared = 0;
}

- (void)safariViewController:(id)a3 didCompleteInitialLoad:(BOOL)a4
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  _WORD v11[8];

  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!v8)
    goto LABEL_10;
  v11[0] = 0;
  LODWORD(v10) = 2;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, v11, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_10:

  }
}

- (void)safariViewControllerDidFinish:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  SFSafariViewController *safariViewController;
  uint64_t v11;
  _WORD v12[8];

  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!v8)
    goto LABEL_10;
  v12[0] = 0;
  LODWORD(v11) = 2;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, v12, v11);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_10:

  }
  safariViewController = self->_safariViewController;
  self->_safariViewController = 0;

}

- (void)cloudServiceSetupRemoteViewController:(id)a3 didFinishLoadingWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  void (**v7)(void *, _BOOL8);
  id loadCompletionHandler;
  uint64_t v9;
  id v10;

  v5 = a4;
  v10 = a5;
  v7 = (void (**)(void *, _BOOL8))_Block_copy(self->_loadCompletionHandler);
  if (v7)
  {
    loadCompletionHandler = self->_loadCompletionHandler;
    self->_loadCompletionHandler = 0;

    v9 = (uint64_t)v10;
    if (!v10 && !v5)
    {
      -[SKCloudServiceSetupViewController _errorWithCode:errorDescriptionLocalizationKey:](self, "_errorWithCode:errorDescriptionLocalizationKey:", 0, CFSTR("UNKNOWN_ERROR"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (id)v9;
    v7[2](v7, v5);
  }

}

- (void)cloudServiceSetupRemoteViewController:(id)a3 requestsDismissalWithAnimation:(BOOL)a4 completion:(id)a5
{
  -[SKCloudServiceSetupViewController _dismissCloudServiceSetupViewControllerWithAnimation:completion:](self, "_dismissCloudServiceSetupViewControllerWithAnimation:completion:", a4, a5);
}

- (void)cloudServiceSetupRemoteViewController:(id)a3 requestsPresentingSafariViewControllerWithURL:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  SFSafariViewController *v15;
  SFSafariViewController *safariViewController;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (self->_safariViewController)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __141__SKCloudServiceSetupViewController_cloudServiceSetupRemoteViewController_requestsPresentingSafariViewControllerWithURL_animated_completion___block_invoke;
    v17[3] = &unk_1E5B276C8;
    v17[4] = self;
    v18 = v10;
    v19 = v11;
    v21 = v7;
    v20 = v12;
    -[SKCloudServiceSetupViewController cloudServiceSetupRemoteViewController:requestsDismissingSafariViewControllerAnimated:completion:](self, "cloudServiceSetupRemoteViewController:requestsDismissingSafariViewControllerAnimated:completion:", v18, 0, v17);

  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v13 = (void *)getSFSafariViewControllerClass_softClass;
    v26 = getSFSafariViewControllerClass_softClass;
    if (!getSFSafariViewControllerClass_softClass)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __getSFSafariViewControllerClass_block_invoke;
      v22[3] = &unk_1E5B26828;
      v22[4] = &v23;
      __getSFSafariViewControllerClass_block_invoke((uint64_t)v22);
      v13 = (void *)v24[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v23, 8);
    v15 = (SFSafariViewController *)objc_msgSend([v14 alloc], "initWithURL:", v11);
    safariViewController = self->_safariViewController;
    self->_safariViewController = v15;

    -[SFSafariViewController setDelegate:](self->_safariViewController, "setDelegate:", self);
    -[SFSafariViewController setModalPresentationStyle:](self->_safariViewController, "setModalPresentationStyle:", 3);
    -[SKCloudServiceSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_safariViewController, v7, v12);
  }

}

uint64_t __141__SKCloudServiceSetupViewController_cloudServiceSetupRemoteViewController_requestsPresentingSafariViewControllerWithURL_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cloudServiceSetupRemoteViewController:requestsPresentingSafariViewControllerWithURL:animated:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)cloudServiceSetupRemoteViewController:(id)a3 requestsDismissingSafariViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  SFSafariViewController *safariViewController;
  _QWORD v12[5];
  void (**v13)(_QWORD);

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = v9;
  safariViewController = self->_safariViewController;
  if (safariViewController)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __133__SKCloudServiceSetupViewController_cloudServiceSetupRemoteViewController_requestsDismissingSafariViewControllerAnimated_completion___block_invoke;
    v12[3] = &unk_1E5B273D0;
    v12[4] = self;
    v13 = v9;
    -[SFSafariViewController dismissViewControllerAnimated:completion:](safariViewController, "dismissViewControllerAnimated:completion:", v6, v12);

  }
  else if (v9)
  {
    v9[2](v9);
  }

}

uint64_t __133__SKCloudServiceSetupViewController_cloudServiceSetupRemoteViewController_requestsDismissingSafariViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1016);
  *(_QWORD *)(v2 + 1016) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)overrideCreditCardPresentationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__SKCloudServiceSetupViewController_overrideCreditCardPresentationWithCompletion___block_invoke;
  v6[3] = &unk_1E5B26970;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __82__SKCloudServiceSetupViewController_overrideCreditCardPresentationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v2 = (void *)getSUCreditCardReaderViewControllerClass_softClass_0;
  v10 = getSUCreditCardReaderViewControllerClass_softClass_0;
  if (!getSUCreditCardReaderViewControllerClass_softClass_0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getSUCreditCardReaderViewControllerClass_block_invoke_0;
    v6[3] = &unk_1E5B26828;
    v6[4] = &v7;
    __getSUCreditCardReaderViewControllerClass_block_invoke_0((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v7, 8);
  v4 = objc_alloc_init(v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  objc_msgSend(v4, "setCompletionBlock:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setModalPresentationStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SKCloudServiceSetupViewController_overrideRedeemCameraPerformAction_withObject___block_invoke;
  block[3] = &unk_1E5B269C0;
  v9 = v6;
  v10 = a3;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __82__SKCloudServiceSetupViewController_overrideRedeemCameraPerformAction_withObject___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (*(_QWORD *)(a1 + 48) == 1
    && (v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 968)), v2, !v2))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v4 = (void *)getSURedeemCameraViewControllerClass_softClass_0;
    v16 = getSURedeemCameraViewControllerClass_softClass_0;
    v5 = MEMORY[0x1E0C809B0];
    if (!getSURedeemCameraViewControllerClass_softClass_0)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getSURedeemCameraViewControllerClass_block_invoke_0;
      location[3] = &unk_1E5B26828;
      location[4] = &v13;
      __getSURedeemCameraViewControllerClass_block_invoke_0((uint64_t)location);
      v4 = (void *)v14[3];
    }
    v6 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v13, 8);
    v7 = objc_alloc_init(v6);
    objc_initWeak(location, *(id *)(a1 + 32));
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __82__SKCloudServiceSetupViewController_overrideRedeemCameraPerformAction_withObject___block_invoke_2;
    v10[3] = &unk_1E5B26998;
    objc_copyWeak(&v11, location);
    objc_msgSend(v7, "setCodeHandler:", v10);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
    objc_msgSend(v8, "setModalPresentationStyle:", 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 968), v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 968));

    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 968));
      objc_msgSend(v9, "performAction:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

    }
  }
}

void __82__SKCloudServiceSetupViewController_overrideRedeemCameraPerformAction_withObject___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[122], "remoteViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceViewControllerProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "redeemCameraCodeDetected:", v7);

  }
}

- (void)loadWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  void *v6;
  void (**v7)(void *, _QWORD, void *);
  id loadCompletionHandler;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SKCloudServiceSetupReloadContext *v40;
  NSDictionary *v41;
  _QWORD v42[4];
  id v43;

  v41 = options;
  v6 = completionHandler;
  v7 = (void (**)(void *, _QWORD, void *))_Block_copy(self->_loadCompletionHandler);
  if (v7)
  {
    loadCompletionHandler = self->_loadCompletionHandler;
    self->_loadCompletionHandler = 0;

    -[SKCloudServiceSetupViewController _errorWithCode:errorDescriptionLocalizationKey:](self, "_errorWithCode:errorDescriptionLocalizationKey:", 0, CFSTR("CLOUD_SERVICE_SETUP_VIEW_CONTROLLER_LOAD_PREEMPTED"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);

  }
  if (+[SKCloudServiceController authorizationStatus](SKCloudServiceController, "authorizationStatus") == SKCloudServiceAuthorizationStatusAuthorized)
  {
    if (self->_isUnableToLoadRemoteViewController)
    {
      v10 = (void *)objc_msgSend(v6, "copy");
      v11 = self->_loadCompletionHandler;
      self->_loadCompletionHandler = v10;

      -[SKCloudServiceSetupViewController _reportErrorForMissingSystemMusicApplication](self, "_reportErrorForMissingSystemMusicApplication");
      goto LABEL_47;
    }
    if (self->_isInlineOfferUnsupported)
    {
      v13 = (void *)objc_msgSend(v6, "copy");
      v14 = self->_loadCompletionHandler;
      self->_loadCompletionHandler = v13;

      -[SKCloudServiceSetupViewController _reportCompletionForInlineOfferUnsupported](self, "_reportCompletionForInlineOfferUnsupported");
      goto LABEL_47;
    }
    -[NSDictionary objectForKey:](v41, "objectForKey:", CFSTR("SKCloudServiceSetupOptionsActionKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[SKCloudServiceSetupViewController _errorWithCode:errorDescriptionLocalizationKey:](self, "_errorWithCode:errorDescriptionLocalizationKey:", 0, CFSTR("CLOUD_SERVICE_SETUP_VIEW_CONTROLLER_REQUIRES_ACTION"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, void *))v6 + 2))(v6, 0, v16);
LABEL_46:

      goto LABEL_47;
    }
    v16 = (void *)-[NSDictionary mutableCopy](v41, "mutableCopy");
    v40 = objc_alloc_init(SKCloudServiceSetupReloadContext);
    -[SKCloudServiceSetupReloadContext setAction:](v40, "setAction:", v15);
    objc_msgSend(v16, "removeObjectForKey:", CFSTR("SKCloudServiceSetupOptionsActionKey"));
    -[NSDictionary objectForKey:](v41, "objectForKey:", CFSTR("adamId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v17, "unsignedLongLongValue"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v16, "removeObjectForKey:", CFSTR("adamId"));
        v19 = 0;
LABEL_19:
        -[NSDictionary objectForKey:](v41, "objectForKey:", CFSTR("at"));
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v16, "removeObjectForKey:", CFSTR("at"));
        }
        -[NSDictionary objectForKey:](v41, "objectForKey:", CFSTR("ct"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v16, "removeObjectForKey:", CFSTR("ct"));
        }
        -[NSDictionary objectForKey:](v41, "objectForKey:", CFSTR("messageId"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v16, "removeObjectForKey:", CFSTR("messageId"));
        }
        v34 = (void *)v20;
        v36 = v17;
        -[NSDictionary objectForKey:](v41, "objectForKey:", CFSTR("_SKCloudServiceSetupOptionsUserInfoKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v37 = v15;
        v33 = v21;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
        v35 = v19;
        -[NSDictionary objectForKey:](v41, "objectForKey:", CFSTR("_SKCloudServiceSetupOptionsAudioAccessorySerialNumberKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = (id)objc_msgSend(v22, "mutableCopy");
          if (!v24)
            v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v24, "setObject:forKey:", v23, CFSTR("audioAccessorySerialNumber"));
          v25 = objc_msgSend(v24, "copy");

          v22 = (id)v25;
        }
        objc_msgSend(v16, "removeObjectForKey:", CFSTR("_SKCloudServiceSetupOptionsAudioAccessorySerialNumberKey"));
        -[NSDictionary objectForKey:](v41, "objectForKey:", CFSTR("_SKCloudServiceSetupOptionsAudioAccessoryUniqueDeviceIdentifierKey"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = (id)objc_msgSend(v22, "mutableCopy");
          if (!v27)
            v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v27, "setObject:forKey:", v26, CFSTR("audioAccessoryGUID"));
          v28 = objc_msgSend(v27, "copy");

          v22 = (id)v28;
        }
        objc_msgSend(v16, "removeObjectForKey:", CFSTR("_SKCloudServiceSetupOptionsAudioAccessoryUniqueDeviceIdentifierKey"));
        -[SKCloudServiceSetupReloadContext setUserInfo:](v40, "setUserInfo:", v22);
        objc_msgSend(v16, "removeObjectForKey:", CFSTR("_SKCloudServiceSetupOptionsUserInfoKey"));
        if (-[SKCloudServiceSetupConfiguration forPublicSDK](self->_configuration, "forPublicSDK"))
          objc_msgSend(v16, "setObject:forKey:", CFSTR("true"), CFSTR("sdk"));
        v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v16, "count"))
        {
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __71__SKCloudServiceSetupViewController_loadWithOptions_completionHandler___block_invoke;
          v42[3] = &unk_1E5B26B78;
          v30 = v29;
          v43 = v30;
          objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v42);
          if (objc_msgSend(v30, "count"))
            -[SKCloudServiceSetupReloadContext setQueryItems:](v40, "setQueryItems:", v30);

        }
        v31 = (void *)objc_msgSend(v6, "copy");
        v32 = self->_loadCompletionHandler;
        self->_loadCompletionHandler = v31;

        -[SKCloudServiceSetupViewController reloadWithContext:](self, "reloadWithContext:", v40);
        v15 = v37;
        goto LABEL_46;
      }
      v18 = v17;
    }
    v19 = v18;
    objc_msgSend(v16, "removeObjectForKey:", CFSTR("adamId"));
    if (v19)
      objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("adamId"));
    goto LABEL_19;
  }
  if (v6)
  {
    -[SKCloudServiceSetupViewController _errorWithCode:errorDescriptionLocalizationKey:](self, "_errorWithCode:errorDescriptionLocalizationKey:", 6, CFSTR("PERMISSION_DENIED"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v6 + 2))(v6, 0, v12);

  }
LABEL_47:

}

void __71__SKCloudServiceSetupViewController_loadWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v7, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

    }
  }

}

- (void)reloadWithContext:(id)a3
{
  SKCloudServiceSetupReloadContext *v4;
  SKCloudServiceSetupReloadContext *activeCloudServiceSetupReloadContext;
  BOOL v6;
  SKCloudServiceSetupReloadContext *v7;
  SKCloudServiceSetupReloadContext *v8;
  SKCloudServiceSetupReloadContext *v9;

  v4 = (SKCloudServiceSetupReloadContext *)a3;
  activeCloudServiceSetupReloadContext = self->_activeCloudServiceSetupReloadContext;
  if (activeCloudServiceSetupReloadContext != v4)
  {
    v9 = v4;
    v6 = -[SKCloudServiceSetupReloadContext isEqual:](activeCloudServiceSetupReloadContext, "isEqual:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (SKCloudServiceSetupReloadContext *)-[SKCloudServiceSetupReloadContext copy](v9, "copy");
      v8 = self->_activeCloudServiceSetupReloadContext;
      self->_activeCloudServiceSetupReloadContext = v7;

      -[SKCloudServiceSetupViewController _reloadWithActiveCloudServiceSetupReloadContext](self, "_reloadWithActiveCloudServiceSetupReloadContext");
      v4 = v9;
    }
  }

}

- (void)handleSafariScriptURL:(id)a3
{
  _UIResilientRemoteViewContainerViewController *remoteViewContainerViewController;
  id v4;
  void *v5;
  id v6;

  remoteViewContainerViewController = self->_remoteViewContainerViewController;
  v4 = a3;
  -[_UIResilientRemoteViewContainerViewController remoteViewController](remoteViewContainerViewController, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceViewControllerProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "handleSafariScriptURL:", v4);
}

- (id)_errorWithCode:(int64_t)a3 errorDescriptionLocalizationKey:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_1E5B2D460, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_reportErrorForMissingSystemMusicApplication
{
  id loadCompletionHandler;
  void *v4;
  void (**v5)(id, _QWORD, void *);

  v5 = (void (**)(id, _QWORD, void *))_Block_copy(self->_loadCompletionHandler);
  if (v5)
  {
    loadCompletionHandler = self->_loadCompletionHandler;
    self->_loadCompletionHandler = 0;

    -[SKCloudServiceSetupViewController _errorWithCode:errorDescriptionLocalizationKey:](self, "_errorWithCode:errorDescriptionLocalizationKey:", 0, CFSTR("CLOUD_SERVICE_SETUP_VIEW_CONTROLLER_MISSING_SYSTEM_MUSIC_APPLICATION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v4);

  }
}

- (void)_reportCompletionForInlineOfferUnsupported
{
  id loadCompletionHandler;
  void (**v4)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))_Block_copy(self->_loadCompletionHandler);
  if (v4)
  {
    loadCompletionHandler = self->_loadCompletionHandler;
    self->_loadCompletionHandler = 0;

    v4[2](v4, 1, 0);
  }

}

- (void)_requestRemoteViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  _UIResilientRemoteViewContainerViewController *v6;
  _UIResilientRemoteViewContainerViewController *remoteViewContainerViewController;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.Music.StoreFlowExtension"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(&location, self);
    v4 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke;
    v12[3] = &unk_1E5B276F0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v3, "setRequestInterruptionBlock:", v12);
    -[SKCloudServiceSetupViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_10, 3.0);
    v5 = (void *)MEMORY[0x1E0DC42F0];
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke_2;
    v10[3] = &unk_1E5B27738;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "instantiateWithExtension:completion:", v3, v10);
    v6 = (_UIResilientRemoteViewContainerViewController *)objc_claimAutoreleasedReturnValue();
    remoteViewContainerViewController = self->_remoteViewContainerViewController;
    self->_remoteViewContainerViewController = v6;

    -[SKCloudServiceSetupViewController addChildViewController:](self, "addChildViewController:", self->_remoteViewContainerViewController);
    if (-[SKCloudServiceSetupViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SKCloudServiceSetupViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIResilientRemoteViewContainerViewController view](self->_remoteViewContainerViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

    }
    -[_UIResilientRemoteViewContainerViewController didMoveToParentViewController:](self->_remoteViewContainerViewController, "didMoveToParentViewController:", self);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_isUnableToLoadRemoteViewController = 1;
    -[SKCloudServiceSetupViewController _reportErrorForMissingSystemMusicApplication](self, "_reportErrorForMissingSystemMusicApplication");
  }

}

void __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  _WORD v9[8];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    objc_msgSend(v2, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v6 = v4;
    else
      v6 = v4 & 2;
    if (v6)
    {
      v9[0] = 0;
      LODWORD(v8) = 2;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_12:

        objc_msgSend(WeakRetained, "_remoteViewControllerExtensionWasInterrupted");
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, v9, v8);
      v5 = objc_claimAutoreleasedReturnValue();
      free(v7);
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke_88()
{
  return 0;
}

void __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_didReceiveRemoteViewController:", v4);

}

- (void)_didReceiveRemoteViewController:(id)a3
{
  objc_msgSend(a3, "setDelegate:", self);
  -[SKCloudServiceSetupViewController _endDelayingPresentation](self, "_endDelayingPresentation");
  self->_isRemoteViewControllerReady = 1;
  -[SKCloudServiceSetupViewController _reloadWithActiveCloudServiceSetupReloadContext](self, "_reloadWithActiveCloudServiceSetupReloadContext");
}

- (void)_reloadWithActiveCloudServiceSetupReloadContext
{
  void *v3;
  id v4;

  if (self->_isRemoteViewControllerReady && self->_activeCloudServiceSetupReloadContext)
  {
    -[_UIResilientRemoteViewContainerViewController remoteViewController](self->_remoteViewContainerViewController, "remoteViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceViewControllerProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!self->_hasInitializedServiceViewController)
    {
      objc_msgSend(v4, "applyConfiguration:", self->_configuration);
      self->_hasInitializedServiceViewController = 1;
    }
    objc_msgSend(v4, "reloadWithContext:", self->_activeCloudServiceSetupReloadContext);

  }
}

- (void)_dismissCloudServiceSetupViewControllerWithAnimation:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  int v16;
  SKCloudServiceSetupViewController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  -[SKCloudServiceSetupViewController parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v16 = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v7;
      LODWORD(v15) = 22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_12:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v16, v15);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog();
    }

    goto LABEL_12;
  }
  -[SKCloudServiceSetupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v6);
LABEL_14:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "cloudServiceSetupViewControllerDidDismiss:", self);
  if (v6 && v7)
    v6[2](v6);

}

- (void)_remoteViewControllerExtensionWasInterrupted
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    -[SKCloudServiceSetupViewController transitionCoordinator](self, "transitionCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __81__SKCloudServiceSetupViewController__remoteViewControllerExtensionWasInterrupted__block_invoke_2;
      v5[3] = &unk_1E5B27760;
      v5[4] = self;
      objc_msgSend(v3, "animateAlongsideTransition:completion:", 0, v5);

    }
    else if (self->_isFullyAppeared)
    {
      -[SKCloudServiceSetupViewController _dismissCloudServiceSetupViewControllerWithAnimation:completion:](self, "_dismissCloudServiceSetupViewControllerWithAnimation:completion:", 1, 0);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__SKCloudServiceSetupViewController__remoteViewControllerExtensionWasInterrupted__block_invoke;
    block[3] = &unk_1E5B267D8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __81__SKCloudServiceSetupViewController__remoteViewControllerExtensionWasInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerExtensionWasInterrupted");
}

uint64_t __81__SKCloudServiceSetupViewController__remoteViewControllerExtensionWasInterrupted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerExtensionWasInterrupted");
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (SKCloudServiceSetupConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_safariViewController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong(&self->_loadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_activeCloudServiceSetupReloadContext, 0);
  objc_storeStrong((id *)&self->_remoteViewContainerViewController, 0);
  objc_destroyWeak((id *)&self->_presentedRedeemCameraViewController);
}

@end
