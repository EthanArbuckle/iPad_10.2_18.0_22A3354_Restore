@implementation DDAutoCloseNavigationController

- (void)closePressed
{
  -[DDAutoCloseNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  -[DDAutoCloseNavigationController target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDAutoCloseNavigationController target](self, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionDidFinish:shouldDismiss:", v7, 0);

  v8.receiver = self;
  v8.super_class = (Class)DDAutoCloseNavigationController;
  -[DDAutoCloseNavigationController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
}

- (DDFlightAction)target
{
  return (DDFlightAction *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
