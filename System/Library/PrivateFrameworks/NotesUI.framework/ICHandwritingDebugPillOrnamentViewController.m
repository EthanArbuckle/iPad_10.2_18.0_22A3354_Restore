@implementation ICHandwritingDebugPillOrnamentViewController

- (ICHandwritingDebugPillOrnamentViewController)initWithRootViewController:(id)a3 delegate:(id)a4
{
  id v6;
  ICHandwritingDebugPillOrnamentViewController *v7;
  ICHandwritingDebugViewController *v8;
  ICHandwritingDebugViewController *handwritingDebugViewController;
  uint64_t v10;
  UINavigationController *handwritingDebugNavigationController;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICHandwritingDebugPillOrnamentViewController;
  v7 = -[ICPillOrnamentViewController initWithRootViewController:contentAnchorPoint:sceneAnchorPoint:offset:cornerRadius:](&v13, sel_initWithRootViewController_contentAnchorPoint_sceneAnchorPoint_offset_cornerRadius_, a3, 0.0, 0.5, 1.0, 0.5, 24.0, 0.0, 32.0);
  if (v7)
  {
    v8 = -[ICHandwritingDebugViewController initWithDelegate:]([ICHandwritingDebugViewController alloc], "initWithDelegate:", v6);
    handwritingDebugViewController = v7->_handwritingDebugViewController;
    v7->_handwritingDebugViewController = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7->_handwritingDebugViewController);
    handwritingDebugNavigationController = v7->_handwritingDebugNavigationController;
    v7->_handwritingDebugNavigationController = (UINavigationController *)v10;

  }
  return v7;
}

- (void)viewDidLoad
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICHandwritingDebugPillOrnamentViewController;
  -[ICHandwritingDebugPillOrnamentViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[ICHandwritingDebugPillOrnamentViewController handwritingDebugNavigationController](self, "handwritingDebugNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICHandwritingDebugPillOrnamentViewController handwritingDebugNavigationController](self, "handwritingDebugNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHandwritingDebugPillOrnamentViewController addChildViewController:](self, "addChildViewController:", v5);

  -[ICPillOrnamentViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHandwritingDebugPillOrnamentViewController handwritingDebugNavigationController](self, "handwritingDebugNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v8);

  -[ICHandwritingDebugPillOrnamentViewController handwritingDebugNavigationController](self, "handwritingDebugNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_addAnchorsToFillSuperview");

  -[ICHandwritingDebugPillOrnamentViewController handwritingDebugNavigationController](self, "handwritingDebugNavigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didMoveToParentViewController:", self);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICHandwritingDebugPillOrnamentViewController;
  -[ICHandwritingDebugPillOrnamentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[ICPillOrnamentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 400.0, 600.0);
  -[ICHandwritingDebugPillOrnamentViewController refresh](self, "refresh");
}

- (ICHandwritingDebugDelegate)delegate
{
  void *v2;
  void *v3;

  -[ICHandwritingDebugPillOrnamentViewController handwritingDebugViewController](self, "handwritingDebugViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICHandwritingDebugDelegate *)v3;
}

- (void)refresh
{
  id v2;

  -[ICHandwritingDebugPillOrnamentViewController handwritingDebugViewController](self, "handwritingDebugViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refresh");

}

- (ICHandwritingDebugViewController)handwritingDebugViewController
{
  return self->_handwritingDebugViewController;
}

- (void)setHandwritingDebugViewController:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingDebugViewController, a3);
}

- (UINavigationController)handwritingDebugNavigationController
{
  return self->_handwritingDebugNavigationController;
}

- (void)setHandwritingDebugNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingDebugNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handwritingDebugNavigationController, 0);
  objc_storeStrong((id *)&self->_handwritingDebugViewController, 0);
}

@end
