@implementation _ASExtensionViewController

- (_ASExtensionViewController)initWithExtension:(id)a3
{
  id v5;
  _ASExtensionViewController *v6;
  _ASExtensionViewController *v7;
  _ASExtensionViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ASExtensionViewController;
  v6 = -[_ASExtensionViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    -[_ASExtensionViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
    v8 = v7;
  }

  return v7;
}

- (void)_extensionRequestDidFinish:(BOOL)a3
{
  _QWORD block[4];
  id v5;
  BOOL v6;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57___ASExtensionViewController__extensionRequestDidFinish___block_invoke;
  block[3] = &unk_24C9500A8;
  objc_copyWeak(&v5, &location);
  v6 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setRemoteViewController:(id)a3
{
  UIViewController *v4;
  void *v5;
  void *v6;
  UIViewController *remoteViewController;
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
  UIViewController *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v4 = (UIViewController *)a3;
  -[_ASExtensionViewController _endDelayingPresentation](self, "_endDelayingPresentation");
  -[UIViewController view](v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASExtensionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v4;
  v20 = v4;

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIViewController willMoveToParentViewController:](self->_remoteViewController, "willMoveToParentViewController:", self);
  objc_msgSend(v6, "addSubview:", v5);
  -[_ASExtensionViewController addChildViewController:](self, "addChildViewController:", self->_remoteViewController);
  v16 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(v5, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  objc_msgSend(v5, "rightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  objc_msgSend(v5, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v15);

}

- (void)setDismissOnBackground:(BOOL)a3
{
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_dismissOnBackground != a3)
  {
    if (a3)
    {
      objc_initWeak(&location, self);
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __53___ASExtensionViewController_setDismissOnBackground___block_invoke;
      v5[3] = &unk_24C94F530;
      objc_copyWeak(&v6, &location);
      -[UIViewController _as_setApplicationBackgroundBlock:](self, "_as_setApplicationBackgroundBlock:", v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      -[UIViewController _as_setApplicationBackgroundBlock:](self, "_as_setApplicationBackgroundBlock:", 0);
    }
    self->_dismissOnBackground = a3;
  }
}

- (void)_beginRequestWithConnectionHandler:(id)a3
{
  id v4;
  NSExtension *extension;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[_ASExtensionViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
  extension = self->_extension;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke;
  v7[3] = &unk_24C950120;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[NSExtension _as_instantiateViewControllerWithConnectionHandler:](extension, "_as_instantiateViewControllerWithConnectionHandler:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_beginNonUIRequest:(BOOL)a3 connectionHandler:(id)a4
{
  id v6;
  NSExtension *extension;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  _ASExtensionViewController *v15;
  id v16;
  id v17;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  self->_allowRequestingUIFromNonUIRequest = a3;
  extension = self->_extension;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke;
  v14 = &unk_24C950120;
  v15 = self;
  objc_copyWeak(&v17, &location);
  v8 = v6;
  v16 = v8;
  -[NSExtension _as_instantiateViewControllerWithConnectionHandler:](extension, "_as_instantiateViewControllerWithConnectionHandler:", &v11);
  if (-[_ASExtensionViewController _shouldUseNonUIRequestTimer](self, "_shouldUseNonUIRequestTimer", v11, v12, v13, v14, v15))
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__nonUIRequestTimedOut, 0, 0, 3.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTolerance:", 0.2);
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTimer:forMode:", v9, *MEMORY[0x24BDBCB80]);

    objc_storeWeak((id *)&self->_nonUIRequestTimer, v9);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (BOOL)_shouldUseNonUIRequestTimer
{
  return 1;
}

- (void)_invalidateNonUIRequestTimerIfNeeded
{
  NSTimer **p_nonUIRequestTimer;
  id WeakRetained;

  p_nonUIRequestTimer = &self->_nonUIRequestTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_nonUIRequestTimer);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)p_nonUIRequestTimer, 0);
}

- (void)_nonUIRequestTimedOut
{
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, a1, a3, "Killing extension due to timeout during non-UI request", a5, a6, a7, a8, 0);
}

- (void)prepareToCancelRequestWithHostContext:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85___ASExtensionViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke;
  v14[3] = &unk_24C94F718;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_remoteViewController;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_remoteViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteViewController;
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_remoteViewController;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (BOOL)dismissOnBackground
{
  return self->_dismissOnBackground;
}

- (NSExtensionContext)nonUIHostContext
{
  return (NSExtensionContext *)self->_nonUIHostContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_nonUIRequestTimer);
  objc_storeStrong((id *)&self->_nonUIHostContext, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end
