@implementation CKSendMenuPopoverTransitioningDelegate

- (CKSendMenuPopoverTransitioningDelegate)init
{
  CKSendMenuPopoverTransitioningDelegate *v2;
  CKSendMenuPopoverTransitioningDelegate *v3;
  CKSendMenuPopoverPresentationController *presentationController;
  uint64_t v5;
  CKSendMenuPopoverPresentationConfiguration *configuration;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKSendMenuPopoverTransitioningDelegate;
  v2 = -[CKSendMenuPopoverTransitioningDelegate init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    presentationController = v2->_presentationController;
    v2->_presentationController = 0;

    v5 = objc_opt_new();
    configuration = v3->_configuration;
    v3->_configuration = (CKSendMenuPopoverPresentationConfiguration *)v5;

  }
  return v3;
}

- (id)animationControllerForDismissedController:(id)a3
{
  void *v6;

  if (!self->_presentationController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKSendMenuPopoverTransitioningDelegate.m"), 46, CFSTR("presentationController required – programmer error."));

  }
  return -[CKSendMenuPopoverAnimationController initWithConfiguration:presenting:]([CKSendMenuPopoverAnimationController alloc], "initWithConfiguration:presenting:", self->_configuration, 0);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  void *v8;

  if (!self->_presentationController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKSendMenuPopoverTransitioningDelegate.m"), 60, CFSTR("presentationController required – programmer error."));

  }
  return -[CKSendMenuPopoverAnimationController initWithConfiguration:presenting:]([CKSendMenuPopoverAnimationController alloc], "initWithConfiguration:presenting:", self->_configuration, 1);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  CKSendMenuPopoverPresentationController *presentationController;
  id v8;
  id v9;
  CKSendMenuPopoverPresentationController *v10;
  CKSendMenuPopoverPresentationController *v11;

  presentationController = self->_presentationController;
  if (!presentationController)
  {
    v8 = a4;
    v9 = a3;
    v10 = -[CKSendMenuPopoverPresentationController initWithConfiguration:popoverViewController:presentingViewController:]([CKSendMenuPopoverPresentationController alloc], "initWithConfiguration:popoverViewController:presentingViewController:", self->_configuration, v9, v8);

    v11 = self->_presentationController;
    self->_presentationController = v10;

    presentationController = self->_presentationController;
  }
  return presentationController;
}

- (CKSendMenuPopoverPresentationController)presentationController
{
  return self->_presentationController;
}

- (void)setPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationController, a3);
}

- (CKSendMenuPopoverPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
}

@end
