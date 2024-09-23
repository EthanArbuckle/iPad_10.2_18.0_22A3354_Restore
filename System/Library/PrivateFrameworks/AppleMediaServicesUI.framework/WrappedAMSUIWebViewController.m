@implementation WrappedAMSUIWebViewController

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(void);
  objc_super v7;

  v3 = a3;
  if ((-[WrappedAMSUIWebViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[WrappedAMSUIWebViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[WrappedAMSUIWebViewController dismissBlock](self, "dismissBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WrappedAMSUIWebViewController dismissBlock](self, "dismissBlock");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)WrappedAMSUIWebViewController;
  -[WrappedAMSUIWebViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissBlock, 0);
}

@end
