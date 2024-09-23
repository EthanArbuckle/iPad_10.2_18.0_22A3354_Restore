@implementation STKStickerPickerSceneViewController

- (STKStickerPickerSceneViewController)init
{
  STKStickerPickerSceneViewController *v2;
  STKStickerPickerSceneViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STKStickerPickerSceneViewController;
  v2 = -[STKStickerPickerSceneViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
  v3 = v2;
  if (v2)
    -[STKStickerPickerSceneViewController setupSceneHosting](v2, "setupSceneHosting");
  return v3;
}

- (void)setupSceneHosting
{
  id v3;
  void *v4;
  _UISceneHostingController *v5;
  _UISceneHostingController *hostingController;
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
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_hostingController)
  {
    -[STKStickerPickerSceneViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_0, 3.0);
    objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.StickerKit.StickerPickerService"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc(MEMORY[0x24BEBDCF8]);
    +[FBSSceneSpecification specification](STKStickerPickerSceneSpecification, "specification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (_UISceneHostingController *)objc_msgSend(v3, "initWithProcessIdentity:sceneSpecification:", v24, v4);
    hostingController = self->_hostingController;
    self->_hostingController = v5;

    -[_UISceneHostingController setDelegate:](self->_hostingController, "setDelegate:", self);
    -[_UISceneHostingController sceneViewController](self->_hostingController, "sceneViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[STKStickerPickerSceneViewController addChildViewController:](self, "addChildViewController:", v23);
    objc_msgSend(v23, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STKStickerPickerSceneViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v7);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v7, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v20;
    objc_msgSend(v7, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    objc_msgSend(v7, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v11;
    objc_msgSend(v7, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v15);

    objc_msgSend(v23, "didMoveToParentViewController:", self);
  }
}

uint64_t __56__STKStickerPickerSceneViewController_setupSceneHosting__block_invoke()
{
  return 0;
}

+ (UIEdgeInsets)additionalInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 600.0;
  v3 = 300.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (void)stickerPickerSceneDidRequestDismissal
{
  void *v3;
  char v4;
  id v5;

  -[STKStickerPickerSceneViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[STKStickerPickerSceneViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stickerPickerSceneDidRequestDismissal:", self);

  }
}

- (id)_remoteSheet
{
  return self->_hostingController;
}

- (STKStickerPickerSceneViewControllerDelegate)delegate
{
  return (STKStickerPickerSceneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostingController, 0);
}

@end
