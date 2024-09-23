@implementation AKAuthorizationContainerViewController

- (AKAuthorizationContainerViewController)init
{
  return -[AKAuthorizationContainerViewController initWithRootViewController:authorizationContext:](self, "initWithRootViewController:authorizationContext:", 0, 0);
}

- (AKAuthorizationContainerViewController)initWithRootViewController:(id)a3 authorizationContext:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  AKAuthorizationContainerViewController *v10;
  id *p_isa;
  AKAuthorizationContainerViewController *v12;
  void *v13;
  uint64_t v14;
  __objc2_class *v15;
  AKAuthorizationContainerViewController *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if (v14 == 1)
      v15 = AKAuthorizationContaineriPadViewController;
    else
      v15 = AKAuthorizationContaineriPhoneViewController;
    v12 = (AKAuthorizationContainerViewController *)objc_msgSend([v15 alloc], "initWithRootViewController:authorizationContext:", v7, v8);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)AKAuthorizationContainerViewController;
    v10 = -[AKAuthorizationContainerViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
    p_isa = (id *)&v10->super.super.super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_rootViewController, a3);
      objc_storeStrong(p_isa + 122, a4);
    }
    v12 = p_isa;
    self = v12;
  }
  v16 = v12;

  return v16;
}

- (AKAuthorizationContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  -[AKAuthorizationContainerViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (AKAuthorizationContainerViewController)initWithCoder:(id)a3
{
  -[AKAuthorizationContainerViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (void)setPaneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_paneDelegate, a3);
  -[AKAuthorizationContainerViewController _setPaneDelegateForTopViewController](self, "_setPaneDelegateForTopViewController");
}

- (void)_setPaneDelegateForTopViewController
{
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;

  -[AKAuthorizationContainerViewController rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AKAuthorizationContainerViewController rootViewController](self, "rootViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationContainerViewController _setPaneDelegateForViewController:](self, "_setPaneDelegateForViewController:", v5);

  }
}

- (void)_setPaneDelegateForViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAuthorizationContainerViewController paneDelegate](self, "paneDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationContainerViewController _setPaneDelegate:forViewController:](self, "_setPaneDelegate:forViewController:", v5, v4);

}

- (void)_clearPaneDelegateForViewController:(id)a3
{
  -[AKAuthorizationContainerViewController _setPaneDelegate:forViewController:](self, "_setPaneDelegate:forViewController:", 0, a3);
}

- (void)_setPaneDelegate:(id)a3 forViewController:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setPaneDelegate:", v6);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationContainerViewController _clearPaneDelegateForViewController:](self, "_clearPaneDelegateForViewController:", v7);

  -[AKAuthorizationContainerViewController _setPaneDelegateForViewController:](self, "_setPaneDelegateForViewController:", v8);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (AKAuthorizationContainerViewControllerDelegate)delegate
{
  return (AKAuthorizationContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKAuthorizationPaneViewControllerDelegate)paneDelegate
{
  return (AKAuthorizationPaneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_paneDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_paneDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
