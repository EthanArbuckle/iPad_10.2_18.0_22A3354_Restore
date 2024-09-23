@implementation HMUserListViewController

- (HMUserListViewController)initWithHome:(id)a3 loadHandler:(id)a4
{
  id v6;
  id v7;
  HMUserListViewController *v8;
  HMUserListViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMUserListViewController;
  v8 = -[HMUserListViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HMUserListViewController setHome:](v8, "setHome:", v6);
    -[HMUserListViewController setLoadHandler:](v9, "setLoadHandler:", v7);
    -[HMUserListViewController _requestRemoteViewController](v9, "_requestRemoteViewController");
  }

  return v9;
}

- (void)presentWhenLoaded
{
  -[HMUserListViewController setShouldPresentWhenLoaded:](self, "setShouldPresentWhenLoaded:", 1);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMUserListViewController;
  -[HMUserListViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMUserListViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)_requestRemoteViewController
{
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HMUserListViewController__requestRemoteViewController__block_invoke;
  v6[3] = &unk_1E3AB5D10;
  v6[4] = self;
  -[HMUserListViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", v6, 15.0);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __56__HMUserListViewController__requestRemoteViewController__block_invoke_2;
  v5[3] = &unk_1E3AB5D38;
  v5[4] = self;
  +[HMUserListRemoteViewController requestViewControllerWithConnectionHandler:](HMUserListRemoteViewController, "requestViewControllerWithConnectionHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMUserListViewController setCancelServiceInvocation:](self, "setCancelServiceInvocation:", v4);

}

- (void)_configureAndAddRemoteViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
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
  HMUserListViewController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMUserListViewController remoteViewController](self, "remoteViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HMUserListViewController remoteViewController](self, "remoteViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[HMUserListViewController remoteViewController](self, "remoteViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);

      -[HMUserListViewController remoteViewController](self, "remoteViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUserListViewController addChildViewController:](self, "addChildViewController:", v8);

      -[HMUserListViewController remoteViewController](self, "remoteViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMUserListViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v10);

      -[HMUserListViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      objc_msgSend(v10, "setFrame:");

      -[HMUserListViewController remoteViewController](self, "remoteViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didMoveToParentViewController:", self);

      -[HMUserListViewController remoteViewController](self, "remoteViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serviceViewControllerProxy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v19;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@serviceViewControllerProxy: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      -[HMUserListViewController home](v17, "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHomeUUID:", v21);

      if (-[HMUserListViewController shouldPresentWhenLoaded](v17, "shouldPresentWhenLoaded"))
        -[HMUserListViewController _presentAsTopmostViewController](v17, "_presentAsTopmostViewController");

    }
  }
}

- (void)_finishSetupWithError:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  -[HMUserListViewController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[HMUserListViewController _endDelayingPresentation](self, "_endDelayingPresentation");
  -[HMUserListViewController loadHandler](self, "loadHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMUserListViewController loadHandler](self, "loadHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v9);

    -[HMUserListViewController setLoadHandler:](self, "setLoadHandler:", 0);
  }
  -[HMUserListViewController completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMUserListViewController completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

    -[HMUserListViewController setCompletionHandler:](self, "setCompletionHandler:", 0);
  }

}

- (void)userManagementDidLoad
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HMUserListViewController_userManagementDidLoad__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)userManagementDidFinishWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HMUserListViewController_userManagementDidFinishWithError___block_invoke;
  v6[3] = &unk_1E3AB5ED8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_presentAsTopmostViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    do
    {
      objc_msgSend(v5, "presentedViewController");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v14;
      v5 = v14;
    }
    while (v7);
  }
  else
  {
    v8 = v5;
  }
  v15 = v8;
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "horizontalSizeClass") != 2)
  {

    goto LABEL_11;
  }
  objc_msgSend(v15, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "userInterfaceIdiom") != 1)
  {
    objc_msgSend(v15, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 5)
      goto LABEL_10;
LABEL_11:
    v13 = 5;
    goto LABEL_12;
  }

LABEL_10:
  v13 = 2;
LABEL_12:
  -[HMUserListViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", v13);
  objc_msgSend(v15, "presentViewController:animated:completion:", self, 1, 0);

}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (BOOL)shouldPresentWhenLoaded
{
  return self->_shouldPresentWhenLoaded;
}

- (void)setShouldPresentWhenLoaded:(BOOL)a3
{
  self->_shouldPresentWhenLoaded = a3;
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setLoadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (_UIAsyncInvocation)cancelServiceInvocation
{
  return self->_cancelServiceInvocation;
}

- (void)setCancelServiceInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_cancelServiceInvocation, a3);
}

- (HMUserListRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelServiceInvocation, 0);
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

uint64_t __61__HMUserListViewController_userManagementDidFinishWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishSetupWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__HMUserListViewController_userManagementDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "loadHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

    objc_msgSend(*(id *)(a1 + 32), "setLoadHandler:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
}

uint64_t __56__HMUserListViewController__requestRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_finishSetupWithError:", v3);

  }
  return 0;
}

void __56__HMUserListViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_configureAndAddRemoteViewController");
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 1005, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_finishSetupWithError:", v9);
  }

}

@end
