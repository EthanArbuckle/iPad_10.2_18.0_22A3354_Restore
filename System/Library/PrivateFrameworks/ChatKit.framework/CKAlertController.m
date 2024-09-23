@implementation CKAlertController

+ (CKAlertController)alertControllerWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5
{
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CKAlertController;
  objc_msgSendSuper2(&v8, sel_alertControllerWithTitle_message_preferredStyle_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setWantsWindowedPresentation:", 1);
    objc_msgSend(v5, "setPreserveModalPresentationStyle:", 0);
    objc_msgSend(v5, "setShouldHidePresentingWindow:", 0);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return (CKAlertController *)v6;
}

- (BOOL)allowsRotation
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAlertController;
  -[CKAlertController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[CKAlertController alertDelegate](self, "alertDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerViewDidDisappear:", self);

}

- (void)addAction:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAlertController;
  -[CKAlertController addAction:](&v3, sel_addAction_, a3);
}

- (void)presentFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_msgSend(a3, "presentViewController:animated:completion:", self, a4, a5);
}

- (BOOL)wantsWindowedPresentation
{
  return self->_wantsWindowedPresentation;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (BOOL)preserveModalPresentationStyle
{
  return self->_preserveModalPresentationStyle;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

- (BOOL)shouldHidePresentingWindow
{
  return self->_shouldHidePresentingWindow;
}

- (void)setShouldHidePresentingWindow:(BOOL)a3
{
  self->_shouldHidePresentingWindow = a3;
}

- (CKAlertControllerDelegate)alertDelegate
{
  return (CKAlertControllerDelegate *)objc_loadWeakRetained((id *)&self->_alertDelegate);
}

- (void)setAlertDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_alertDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertDelegate);
}

@end
