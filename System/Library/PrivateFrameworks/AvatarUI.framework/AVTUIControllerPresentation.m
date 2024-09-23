@implementation AVTUIControllerPresentation

+ (AVTUIControllerPresentation)presentationWithWrappingForController:(id)a3
{
  id v3;
  AVTTransparentNavigationController *v4;
  AVTAvatarContainerViewController *v5;
  void *v6;
  void *v7;
  AVTUIControllerPresentation *v8;

  v3 = a3;
  v4 = -[AVTTransparentNavigationController initWithRootViewController:]([AVTTransparentNavigationController alloc], "initWithRootViewController:", v3);
  v5 = objc_alloc_init(AVTAvatarContainerViewController);
  -[AVTAvatarContainerViewController view](v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransparentNavigationController view](v4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[AVTAvatarContainerViewController addChildViewController:](v5, "addChildViewController:", v4);
  -[AVTTransparentNavigationController didMoveToParentViewController:](v4, "didMoveToParentViewController:", v5);
  v8 = -[AVTUIControllerPresentation initWithController:]([AVTUIControllerPresentation alloc], "initWithController:", v5);
  -[AVTUIControllerPresentation setDelegate:](v8, "setDelegate:", v3);

  return v8;
}

- (AVTUIControllerPresentation)initWithController:(id)a3
{
  id v5;
  AVTUIControllerPresentation *v6;
  AVTUIControllerPresentation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTUIControllerPresentation;
  v6 = -[AVTUIControllerPresentation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controller, a3);

  return v7;
}

- (void)viewWillBeObstructed
{
  void *v3;
  id v4;

  -[AVTUIControllerPresentation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTUIControllerPresentation delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controllerPresentationWillObstructView:", self);

  }
}

- (UIViewController)controller
{
  return self->_controller;
}

- (MSMessagesAppViewController)modalMessagesController
{
  return (MSMessagesAppViewController *)objc_loadWeakRetained((id *)&self->_modalMessagesController);
}

- (void)setModalMessagesController:(id)a3
{
  objc_storeWeak((id *)&self->_modalMessagesController, a3);
}

- (AVTUIControllerPresentationDelegate)delegate
{
  return (AVTUIControllerPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_modalMessagesController);
  objc_storeStrong((id *)&self->_controller, 0);
}

+ (void)setPendingGlobalPresentation:(id)a3
{
  objc_storeStrong((id *)&s_pendingPresentation, a3);
}

+ (AVTUIControllerPresentation)pendingGlobalPresentation
{
  return (AVTUIControllerPresentation *)(id)s_pendingPresentation;
}

@end
