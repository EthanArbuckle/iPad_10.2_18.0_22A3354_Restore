@implementation QLScreenTimeItemViewController

- (QLScreenTimeItemViewController)initWithBundleIdentifier:(id)a3
{
  id v5;
  QLScreenTimeItemViewController *v6;
  QLScreenTimeItemViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLScreenTimeItemViewController;
  v6 = -[QLItemViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);

  return v7;
}

- (QLScreenTimeItemViewController)initWithCategoryIdentifier:(id)a3
{
  id v5;
  QLScreenTimeItemViewController *v6;
  QLScreenTimeItemViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLScreenTimeItemViewController;
  v6 = -[QLItemViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_categoryIdentifier, a3);

  return v7;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  void *v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  double v10;
  double Helper_x8__OBJC_CLASS___STBlockingViewController;
  uint64_t v12;
  STBlockingViewController *v13;
  STBlockingViewController *blockingViewController;
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
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BEBD4B8];
  v7 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v6, "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLScreenTimeItemViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  Helper_x8__OBJC_CLASS___STBlockingViewController = gotLoadHelper_x8__OBJC_CLASS___STBlockingViewController(v10);
  v13 = (STBlockingViewController *)objc_msgSend(*(id *)(v12 + 2080), "newTranslucentBlockingViewController", Helper_x8__OBJC_CLASS___STBlockingViewController);
  blockingViewController = self->_blockingViewController;
  self->_blockingViewController = v13;

  -[QLScreenTimeItemViewController addChildViewController:](self, "addChildViewController:", self->_blockingViewController);
  -[QLScreenTimeItemViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController view](self->_blockingViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[STBlockingViewController didMoveToParentViewController:](self->_blockingViewController, "didMoveToParentViewController:", self);
  -[STBlockingViewController view](self->_blockingViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[QLScreenTimeItemViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD1628];
  v30 = CFSTR("lockoutView");
  -[STBlockingViewController view](self->_blockingViewController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[lockoutView]|"), 0, 0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addConstraints:", v22);

  -[QLScreenTimeItemViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD1628];
  v28 = CFSTR("lockoutView");
  -[STBlockingViewController view](self->_blockingViewController, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[lockoutView]|"), 0, 0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addConstraints:", v27);

  v7[2](v7, 0);
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (void)showBlockingViewControllerWithPolicy:(int64_t)a3
{
  if (self->_policy != a3)
  {
    self->_policy = a3;
    -[QLScreenTimeItemViewController _updateBlockingViewControllerWithCurrentPolicy](self, "_updateBlockingViewControllerWithCurrentPolicy");
    if (self->_policy)
      -[STBlockingViewController showWithAnimation:completionHandler:](self->_blockingViewController, "showWithAnimation:completionHandler:", 1, 0);
  }
}

- (void)hideBlockingViewControllerWithCompletionHandler:(id)a3
{
  -[STBlockingViewController hideWithAnimation:completionHandler:](self->_blockingViewController, "hideWithAnimation:completionHandler:", 1, a3);
  self->_policy = 0;
}

- (void)_updateBlockingViewControllerWithCurrentPolicy
{
  if (self->_policy)
  {
    if (self->_bundleIdentifier)
    {
      -[STBlockingViewController updateAppearanceUsingPolicy:forBundleIdentifier:](self->_blockingViewController, "updateAppearanceUsingPolicy:forBundleIdentifier:");
    }
    else if (self->_categoryIdentifier)
    {
      -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:](self->_blockingViewController, "updateAppearanceUsingPolicy:forCategoryIdentifier:");
    }
  }
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_categoryIdentifier, a3);
}

- (STBlockingViewController)blockingViewController
{
  return self->_blockingViewController;
}

- (void)setBlockingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_blockingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingViewController, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
