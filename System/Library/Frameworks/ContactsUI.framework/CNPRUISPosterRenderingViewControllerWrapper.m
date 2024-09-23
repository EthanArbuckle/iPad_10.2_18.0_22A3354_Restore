@implementation CNPRUISPosterRenderingViewControllerWrapper

- (UIView)obscurableContentView
{
  return (UIView *)-[PRUISPosterRenderingViewController obscurableContentView](self->_wrappedPosterRenderingViewController, "obscurableContentView");
}

- (CNPRUISPosterRenderingViewControllerWrapper)initWithConfiguration:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  CNPRUISPosterRenderingViewControllerWrapper *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  PRUISPosterRenderingViewController *wrappedPosterRenderingViewController;
  CNPRUISPosterRenderingViewControllerWrapper *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNPRUISPosterRenderingViewControllerWrapper;
  v8 = -[CNPRUISPosterRenderingViewControllerWrapper init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "wrappedPosterConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc((Class)getPRUISPosterRenderingViewControllerClass[0]());
    objc_msgSend(v7, "wrappedIncomingCallPosterContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithConfiguration:context:", v9, v11);
    wrappedPosterRenderingViewController = v8->_wrappedPosterRenderingViewController;
    v8->_wrappedPosterRenderingViewController = (PRUISPosterRenderingViewController *)v12;

    v14 = v8;
  }

  return v8;
}

- (void)registerLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[PRUISPosterRenderingViewController obscurableContentView](self->_wrappedPosterRenderingViewController, "obscurableContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  v8 = v4;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE063550))
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;

  -[PRUISPosterRenderingViewController registerPosterAppearanceObserver:](self->_wrappedPosterRenderingViewController, "registerPosterAppearanceObserver:", v7);
}

- (void)snapshotWithCompletionBlock:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PRUISPosterRenderingViewController snapshotWithOptions:forScreen:completionBlock:](self->_wrappedPosterRenderingViewController, "snapshotWithOptions:forScreen:completionBlock:", 2, 0, v4);
  else
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedPosterRenderingViewController, 0);
}

@end
