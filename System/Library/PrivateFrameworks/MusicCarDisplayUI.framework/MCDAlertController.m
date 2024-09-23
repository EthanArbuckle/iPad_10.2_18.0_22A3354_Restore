@implementation MCDAlertController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  UIView *v5;
  UIView *presentingViewControllerView;
  UIView *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDAlertController;
  -[MCDAlertController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[MCDAlertController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  presentingViewControllerView = self->_presentingViewControllerView;
  self->_presentingViewControllerView = v5;

  v7 = self->_presentingViewControllerView;
  v8 = objc_opt_class();
  MCDSetChargeOnDescendantsOfView(v7, v8, 0.0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  UIView *presentingViewControllerView;
  uint64_t v5;
  UIView *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDAlertController;
  -[MCDAlertController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  presentingViewControllerView = self->_presentingViewControllerView;
  v5 = objc_opt_class();
  MCDSetChargeOnDescendantsOfView(presentingViewControllerView, v5, -0.9);
  v6 = self->_presentingViewControllerView;
  self->_presentingViewControllerView = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewControllerView, 0);
}

@end
