@implementation GKHostedAuthenticateViewController

- (GKHostedAuthenticateViewController)init
{
  GKHostedAuthenticateViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKHostedAuthenticateViewController;
  result = -[GKHostedAuthenticateViewController init](&v3, sel_init);
  if (result)
  {
    result->_rotationLocked = 1;
    result->_origin = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[GKExtensionRemoteViewController cancelExtension](self->_extensionHostViewController, "cancelExtension");
  v3.receiver = self;
  v3.super_class = (Class)GKHostedAuthenticateViewController;
  -[GKHostedAuthenticateViewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideAccessPoint");

  -[GKHostedAuthenticateViewController extensionHostViewController](self, "extensionHostViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[GKHostedAuthenticateViewController _setupExtensionHostViewController](self, "_setupExtensionHostViewController");
  v7.receiver = self;
  v7.super_class = (Class)GKHostedAuthenticateViewController;
  -[GKHostedAuthenticateViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKHostedAuthenticateViewController;
  -[GKHostedAuthenticateViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showAccessPoint");

}

- (void)setModalPresentationStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
    v6 = 16;
  else
    v6 = 2;
  v7.receiver = self;
  v7.super_class = (Class)GKHostedAuthenticateViewController;
  -[GKHostedAuthenticateViewController setModalPresentationStyle:](&v7, sel_setModalPresentationStyle_, v6);
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)continueWithMode:(int64_t)a3
{
  self->_mode = a3;
  if (-[GKHostedAuthenticateViewController mode](self, "mode") == 2)
    -[GKHostedAuthenticateViewController setRotationLocked:](self, "setRotationLocked:", 0);
  -[GKHostedAuthenticateViewController _setupChildViewController](self, "_setupChildViewController");
}

- (void)_setupChildViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[GKHostedAuthenticateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  -[GKHostedAuthenticateViewController setWantsFullScreenLayout:](self, "setWantsFullScreenLayout:", 1);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    -[GKHostedAuthenticateViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
    -[GKHostedAuthenticateViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 16);
    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authenticateExtensionFormSheetSize");
    -[GKHostedAuthenticateViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
  else
  {
    -[GKHostedAuthenticateViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
    -[GKHostedAuthenticateViewController _setIgnoreAppSupportedOrientations:](self, "_setIgnoreAppSupportedOrientations:", 1);
  }
  if (!self->_extensionHostViewController)
    -[GKHostedAuthenticateViewController _setupExtensionHostViewController](self, "_setupExtensionHostViewController");
}

- (void)_setupExtensionHostViewController
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  +[GKAuthenticateHostViewController authenticateExtension](GKAuthenticateHostViewController, "authenticateExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:withParentViewController:](GKExtensionRemoteViewController, "setupCallbackBlocksForExtension:withParentViewController:", v3, self);
    -[GKHostedAuthenticateViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_41, 5.0);
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__GKHostedAuthenticateViewController__setupExtensionHostViewController__block_invoke_13;
    v4[3] = &unk_1E59C5A08;
    objc_copyWeak(&v5, &location);
    v4[4] = self;
    +[GKExtensionRemoteViewController viewControllerForExtension:inputItems:completionHandler:](GKExtensionRemoteViewController, "viewControllerForExtension:inputItems:completionHandler:", v3, 0, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

}

uint64_t __71__GKHostedAuthenticateViewController__setupExtensionHostViewController__block_invoke(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;

  if (a2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __71__GKHostedAuthenticateViewController__setupExtensionHostViewController__block_invoke_cold_1(v4);
  }
  return a2 ^ 1u;
}

void __71__GKHostedAuthenticateViewController__setupExtensionHostViewController__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  id v32;
  void *v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v34, (id *)(a1 + 40));
  if (v5)
  {
    v7 = v5;
    v8 = objc_loadWeakRetained(&v34);
    objc_msgSend(v8, "setExtensionHostViewController:", v7);

    v36[0] = &unk_1E5A5E298;
    v35[0] = CFSTR("MessageCommandKey");
    v35[1] = CFSTR("MessageParamKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "origin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sendMessageToExtension:", v10);
    v11 = objc_loadWeakRetained(&v34);
    objc_msgSend(v11, "addChildViewController:", v7);

    v12 = objc_loadWeakRetained(&v34);
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v7, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

    v23 = objc_loadWeakRetained(&v34);
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v25);

    v26 = objc_loadWeakRetained(&v34);
    objc_msgSend(v7, "didMoveToParentViewController:", v26);

    v27 = objc_loadWeakRetained(&v34);
    objc_msgSend(v7, "setDelegate:", v27);

  }
  else
  {
    v7 = objc_loadWeakRetained(&v34);
    objc_msgSend(v7, "extensionDidFinishWithError:", v6);
  }

  v28 = objc_loadWeakRetained(&v34);
  objc_msgSend(v28, "remoteViewReadyHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_loadWeakRetained(&v34);
    objc_msgSend(v30, "remoteViewReadyHandler");
    v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v32 = objc_loadWeakRetained(&v34);
    objc_msgSend(v32, "extensionHostViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v31)[2](v31, v33, 0);

  }
  objc_destroyWeak(&v34);

}

- (void)setExtensionHostViewController:(id)a3
{
  GKAuthenticateHostViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GKAuthenticateHostViewController *extensionHostViewController;
  _QWORD v11[4];
  id v12;
  id location;

  v5 = (GKAuthenticateHostViewController *)a3;
  if (self->_extensionHostViewController != v5)
  {
    objc_storeStrong((id *)&self->_extensionHostViewController, a3);
    v6 = (void *)MEMORY[0x1E0C99E08];
    +[GKExtensionRemoteViewController initialItemsForExtension](GKExtensionRemoteViewController, "initialItemsForExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mode);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("AuthenticateModeKey"));

    objc_initWeak(&location, self);
    extensionHostViewController = self->_extensionHostViewController;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__GKHostedAuthenticateViewController_setExtensionHostViewController___block_invoke;
    v11[3] = &unk_1E59C5A30;
    objc_copyWeak(&v12, &location);
    -[GKExtensionRemoteViewController setInitialState:withReply:](extensionHostViewController, "setInitialState:withReply:", v8, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __69__GKHostedAuthenticateViewController_setExtensionHostViewController___block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __69__GKHostedAuthenticateViewController_setExtensionHostViewController___block_invoke_2;
  v1[3] = &unk_1E59C48A0;
  objc_copyWeak(&v2, &to);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
  objc_destroyWeak(&v2);
  objc_destroyWeak(&to);
}

void __69__GKHostedAuthenticateViewController_setExtensionHostViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_endDelayingPresentation");

}

- (void)extensionDidFinishWithError:(id)a3
{
  void *v4;

  -[GKHostedAuthenticateViewController finishAuthenticationWithError:](self, "finishAuthenticationWithError:", a3);
  -[GKAuthenticateHostViewController willMoveToParentViewController:](self->_extensionHostViewController, "willMoveToParentViewController:", 0);
  -[GKAuthenticateHostViewController view](self->_extensionHostViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[GKAuthenticateHostViewController removeFromParentViewController](self->_extensionHostViewController, "removeFromParentViewController");
  -[GKHostedAuthenticateViewController setExtensionHostViewController:](self, "setExtensionHostViewController:", 0);
}

- (void)finishAuthenticationWithError:(id)a3
{
  void (**completionHandler)(id, id);
  objc_super v5;

  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3);
    -[GKHostedAuthenticateViewController setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)GKHostedAuthenticateViewController;
  -[GKHostedAuthenticateViewController dismissViewControllerAnimated:completion:](&v5, sel_dismissViewControllerAnimated_completion_, 1, &__block_literal_global_21);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[GKHostedAuthenticateViewController error](self, "error", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "code") == 2 || -[GKHostedAuthenticateViewController mode](self, "mode") == 2)
  {
    -[GKHostedAuthenticateViewController finishAuthenticationWithError:](self, "finishAuthenticationWithError:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__GKHostedAuthenticateViewController_dismissViewControllerAnimated_completion___block_invoke;
    v8[3] = &unk_1E59C6AC8;
    v8[4] = self;
    objc_msgSend(v7, "authenticatePlayerWithExistingCredentialsWithHandler:", v8);

  }
}

uint64_t __79__GKHostedAuthenticateViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAuthenticationWithError:");
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return !self->_rotationLocked;
}

- (void)setRotationLocked:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (self->_rotationLocked != v3)
    {
      self->_rotationLocked = v3;
      if (!v3)
        objc_msgSend((id)objc_opt_class(), "attemptRotationToDeviceOrientation");
    }
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__GKHostedAuthenticateViewController_setRotationLocked___block_invoke;
    v5[3] = &unk_1E59C5278;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

uint64_t __56__GKHostedAuthenticateViewController_setRotationLocked___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRotationLocked:", *(unsigned __int8 *)(a1 + 40));
}

- (void)onboardingFlowDidSignOut
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 6, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[GKHostedAuthenticateViewController finishAuthenticationWithError:](self, "finishAuthenticationWithError:", v3);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (BOOL)disablesSignIn
{
  return self->_disablesSignIn;
}

- (void)setDisablesSignIn:(BOOL)a3
{
  self->_disablesSignIn = a3;
}

- (BOOL)isRotationLocked
{
  return self->_rotationLocked;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (id)remoteViewReadyHandler
{
  return self->_remoteViewReadyHandler;
}

- (void)setRemoteViewReadyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (GKAuthenticateHostViewController)extensionHostViewController
{
  return self->_extensionHostViewController;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_storeStrong((id *)&self->_extensionHostViewController, 0);
  objc_storeStrong(&self->_remoteViewReadyHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

void __71__GKHostedAuthenticateViewController__setupExtensionHostViewController__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "We failed to present Game Center dashboard extension.", v1, 2u);
}

@end
