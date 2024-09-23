@implementation FARemoteServiceViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FARemoteServiceViewController;
  -[FARemoteServiceViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FARemoteServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[FARemoteServiceViewController _showLoadingView](self, "_showLoadingView");
}

- (void)presentModalRUIController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[FARemoteServiceViewController _presentAsChildViewController:](self, "_presentAsChildViewController:", v7);
  if (v6)
    v8 = v6;
  else
    v8 = &__block_literal_global_15;
  v11 = _Block_copy(v8);

  -[FARemoteServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "ruiModalPresentationStyle");

  objc_msgSend(v9, "presentWithRUIModalPresentationStyle:completion:", v10, v11);
}

- (void)dismissModalRUIController:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(void);

  if (a4)
    v5 = a4;
  else
    v5 = &__block_literal_global_16_0;
  v7 = (void (**)(void))_Block_copy(v5);
  v7[2]();
  -[FARemoteServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissWithCompletion:", &__block_literal_global_17);

}

- (void)replaceModalRUIController:(id)a3 byController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FARemoteServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "ruiModalPresentationStyle");
  v13 = objc_msgSend(v9, "ruiModalPresentationStyle");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __83__FARemoteServiceViewController_replaceModalRUIController_byController_completion___block_invoke;
  v17[3] = &unk_24C88C3C8;
  v17[4] = self;
  v18 = v9;
  v19 = v8;
  v20 = v10;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  objc_msgSend(v11, "replaceModalRUIControllerWithStyle:byController:completion:", v12, v13, v17);

}

uint64_t __83__FARemoteServiceViewController_replaceModalRUIController_byController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_presentAsChildViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 48), "removeFromParentViewController");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)ruiPresentAlertController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[FARemoteServiceViewController childViewControllers](self, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[FARemoteServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  }
  else
  {
    -[FARemoteServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__FARemoteServiceViewController_ruiPresentAlertController___block_invoke;
    v8[3] = &unk_24C88B958;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "presentAlertProxyWithCompletion:", v8);

  }
}

uint64_t __59__FARemoteServiceViewController_ruiPresentAlertController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)ruiDidDismissAlertController:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[FARemoteServiceViewController childViewControllers](self, "childViewControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[FARemoteServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissAlertProxyWithCompletion:", &__block_literal_global_18_0);

  }
}

- (void)startFlowWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_circleContext, a3);
  -[FARemoteServiceViewController _showFamilyFlow](self, "_showFamilyFlow");
}

- (void)_showLoadingView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __49__FARemoteServiceViewController__showLoadingView__block_invoke;
  v10 = &unk_24C88D0B8;
  objc_copyWeak(&v11, &location);
  +[FASwiftUIHostingControllerProvider getLoadingControllerWithCancelAction:](_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider, "getLoadingControllerWithCancelAction:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEBD7A0]);
  v5 = (void *)objc_msgSend(v4, "initWithRootViewController:", v3, v7, v8, v9, v10);
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequestedContentSize:", 3);

  -[FARemoteServiceViewController _presentAsChildViewController:](self, "_presentAsChildViewController:", v5);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__FARemoteServiceViewController__showLoadingView__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewControllerProxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissWithCompletion:", &__block_literal_global_20);

}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A45188);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A455C0);
}

- (void)_showFamilyFlow
{
  FACircleStateController *v3;
  FACircleContext *circleContext;
  FACircleStateController *v5;
  _QWORD v6[5];
  FACircleStateController *v7;

  v3 = -[FACircleStateController initWithPresenter:]([FACircleStateController alloc], "initWithPresenter:", self);
  -[FACircleStateController setPresentationType:](v3, "setPresentationType:", 1);
  circleContext = self->_circleContext;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__FARemoteServiceViewController__showFamilyFlow__block_invoke;
  v6[3] = &unk_24C88C5A8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[FACircleStateController _performOperationWithContext:viewController:completion:](v5, "_performOperationWithContext:viewController:completion:", circleContext, self, v6);

}

uint64_t __48__FARemoteServiceViewController__showFamilyFlow__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_remoteViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationFinishedWithResponse:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_dismissAndExit");
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  FARemoteServiceViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FARemoteServiceViewController;
  -[FARemoteServiceViewController dealloc](&v4, sel_dealloc);
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

- (void)_removeChildViewControllers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[FARemoteServiceViewController childViewControllers](self, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");

        -[FARemoteServiceViewController removeChildViewController:notifyDidMove:](self, "removeChildViewController:notifyDidMove:", v8, 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_presentAsChildViewController:(id)a3
{
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
  id v27;

  v27 = a3;
  -[FARemoteServiceViewController _removeChildViewControllers](self, "_removeChildViewControllers");
  -[FARemoteServiceViewController addChildViewController:](self, "addChildViewController:", v27);
  -[FARemoteServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(v27, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(v27, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FARemoteServiceViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v27, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FARemoteServiceViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  objc_msgSend(v27, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FARemoteServiceViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leftAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  objc_msgSend(v27, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FARemoteServiceViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  objc_msgSend(v27, "didMoveToParentViewController:", self);
}

- (void)_dismissAndExit
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__FARemoteServiceViewController__dismissAndExit__block_invoke;
  block[3] = &unk_24C88B7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __48__FARemoteServiceViewController__dismissAndExit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_dismissAndExit");
}

- (void)_main_dismissAndExit
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[FARemoteServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissWithCompletion:", &__block_literal_global_44_0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupConnection, 0);
  objc_storeStrong((id *)&self->_circleContext, 0);
}

@end
