@implementation CDPServiceViewController

- (void)viewDidLoad
{
  id v3;
  CDPRemoteUILocalSecretEntryViewController *v4;
  void *v5;
  UIViewController **p_contentViewController;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v22.receiver = self;
  v22.super_class = (Class)CDPServiceViewController;
  -[CDPServiceViewController viewDidLoad](&v22, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x24BE75588]);
  v4 = objc_alloc_init(CDPRemoteUILocalSecretEntryViewController);
  -[CDPRemoteUILocalSecretEntryViewController navigationItem](v4, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("local-secret-entry-view"));

  objc_msgSend(v3, "showController:", v4);
  p_contentViewController = &self->_contentViewController;
  objc_storeStrong((id *)&self->_contentViewController, v3);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v7 = (void *)getBFFStyleClass_softClass_2;
  v27 = getBFFStyleClass_softClass_2;
  if (!getBFFStyleClass_softClass_2)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __getBFFStyleClass_block_invoke_2;
    v23[3] = &unk_24C854C48;
    v23[4] = &v24;
    __getBFFStyleClass_block_invoke_2((uint64_t)v23);
    v7 = (void *)v25[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v8, "sharedStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyThemeToNavigationController:", v3);

  -[UIViewController willMoveToParentViewController:](*p_contentViewController, "willMoveToParentViewController:", self);
  -[CDPServiceViewController addChildViewController:](self, "addChildViewController:", *p_contentViewController);
  -[CDPServiceViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIViewController view](*p_contentViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[CDPServiceViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](*p_contentViewController, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  -[UIViewController didMoveToParentViewController:](*p_contentViewController, "didMoveToParentViewController:", self);
}

- (unint64_t)supportedInterfaceOrientations
{
  return -[UIViewController supportedInterfaceOrientations](self->_contentViewController, "supportedInterfaceOrientations");
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A27668);
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A0EC40);
}

- (void)offsetForCurrentKeyboard:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__CDPServiceViewController_offsetForCurrentKeyboard___block_invoke;
    v11[3] = &unk_24C855240;
    v7 = v4;
    v12 = v7;
    -[CDPServiceViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __53__CDPServiceViewController_offsetForCurrentKeyboard___block_invoke_2;
    v9[3] = &unk_24C855268;
    v10 = v7;
    objc_msgSend(v8, "hostKeyboardOffset:", v9);

  }
}

uint64_t __53__CDPServiceViewController_offsetForCurrentKeyboard___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

uint64_t __53__CDPServiceViewController_offsetForCurrentKeyboard___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  float v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return (*(uint64_t (**)(uint64_t, double))(v2 + 16))(v2, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
