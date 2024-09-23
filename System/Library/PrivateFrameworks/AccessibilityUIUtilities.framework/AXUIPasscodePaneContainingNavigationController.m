@implementation AXUIPasscodePaneContainingNavigationController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXUIPasscodePaneContainingNavigationController;
  -[AXUIPasscodePaneContainingNavigationController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[AXUIPasscodePaneContainingNavigationController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AXUIPasscodePaneContainingNavigationController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIPasscodePaneContainingNavigationController setInterfaceOrientation:](self, "setInterfaceOrientation:", objc_msgSend(v7, "navigationControllerPreferredInterfaceOrientationForPresentation:", self));

  }
  -[AXUIPasscodePaneContainingNavigationController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;

  -[AXUIPasscodePaneContainingNavigationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "axui_activeInterfaceOrientationForNavigationController:", self);

  if ((unint64_t)(v4 - 2) > 2)
    return 2;
  else
    return qword_1BD8E78C8[v4 - 2];
}

@end
