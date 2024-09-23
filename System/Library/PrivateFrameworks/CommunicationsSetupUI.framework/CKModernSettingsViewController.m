@implementation CKModernSettingsViewController

- (void)viewDidLoad
{
  void *v3;
  objc_class *v4;
  UIViewController *v5;
  void *v6;
  void *v7;
  UIViewController *settingsViewController;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)CKModernSettingsViewController;
  -[CKModernSettingsViewController viewDidLoad](&v9, sel_viewDidLoad);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v3 = (void *)getCKSettingsHostingViewControllerClass_softClass;
  v14 = getCKSettingsHostingViewControllerClass_softClass;
  if (!getCKSettingsHostingViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getCKSettingsHostingViewControllerClass_block_invoke;
    v10[3] = &unk_24D075F68;
    v10[4] = &v11;
    __getCKSettingsHostingViewControllerClass_block_invoke((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v11, 8);
  if (v4)
  {
    v5 = (UIViewController *)objc_alloc_init(v4);
    -[CKModernSettingsViewController addChildViewController:](self, "addChildViewController:", v5);
    -[CKModernSettingsViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[UIViewController didMoveToParentViewController:](v5, "didMoveToParentViewController:", self);
    settingsViewController = self->_settingsViewController;
    self->_settingsViewController = v5;

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
  v13.super_class = (Class)CKModernSettingsViewController;
  -[CKModernSettingsViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[CKModernSettingsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIViewController view](self->_settingsViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (UIViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsViewController, 0);
}

@end
