@implementation ServiceCardContainerViewController

- (void)viewDidLoad
{
  objc_super v3;
  uint8_t buf[4];
  ServiceCardContainerViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)ServiceCardContainerViewController;
  -[ServiceCardContainerViewController viewDidLoad](&v3, sel_viewDidLoad);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v5 = self;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Start.", buf, 0xCu);
  }
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(v4, "setAutoresizingMask:", 40);
  -[ServiceCardContainerViewController setView:](self, "setView:", v4);

}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return self->_remoteViewController;
}

- (void)setChildViewController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[ServiceCardContainerViewController childViewController](self, "childViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v12;
  if (v5 != v12)
  {
    -[ServiceCardContainerViewController childViewController](self, "childViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_childViewController, a3);
    if (v7)
    {
      objc_msgSend(v7, "willMoveToParentViewController:", 0);
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      objc_msgSend(v7, "removeFromParentViewController");
    }
    if (v12)
    {
      -[ServiceCardContainerViewController addChildViewController:](self, "addChildViewController:", v12);
      objc_msgSend(v12, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ServiceCardContainerViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      objc_msgSend(v9, "setFrame:");

      objc_msgSend(v9, "setAutoresizingMask:", 18);
      -[ServiceCardContainerViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v9);

      objc_msgSend(v12, "didMoveToParentViewController:", self);
    }

    v6 = v12;
  }

}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  ServiceCardContainerViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v5 = self;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Dealloc.", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)ServiceCardContainerViewController;
  -[ServiceCardContainerViewController dealloc](&v3, sel_dealloc);
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (_UIRemoteViewController)remoteViewController
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
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
