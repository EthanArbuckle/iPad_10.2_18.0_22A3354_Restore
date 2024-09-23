@implementation AVPresentationContext

- (AVPresentationContext)initWithPresentationController:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  AVPresentationContext *v8;
  AVPresentationContext *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *backgroundView;
  UIView *v14;
  UIView *touchBlockingView;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVPresentationContext;
  v8 = -[AVPresentationContext init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentationController, v6);
    objc_msgSend(v6, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v9->_avFullScreenViewController, v11);

    }
    else
    {
      objc_storeWeak((id *)&v9->_avFullScreenViewController, 0);
    }

    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v12;

    -[UIView setUserInteractionEnabled:](v9->_backgroundView, "setUserInteractionEnabled:", 0);
    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    touchBlockingView = v9->_touchBlockingView;
    v9->_touchBlockingView = v14;

    objc_storeStrong((id *)&v9->_configuration, a4);
  }

  return v9;
}

- (BOOL)canBeInteractivelyDismissed
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = 1;
  if (!+[AVPresentationContext supportsInteractiveCounterRotationDismissals](AVPresentationContext, "supportsInteractiveCounterRotationDismissals"))
  {
    -[AVPresentationContext presentationController](self, "presentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "_supportedInterfaceOrientationsForWindow:", v6);
    -[AVPresentationContext presentationController](self, "presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportedInterfaceOrientations");

    v3 = ((1 << objc_msgSend(v6, "_windowInterfaceOrientation")) & ~(v10 & v7)) == 0;
  }
  return v3;
}

- (UIView)containerView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AVPresentationContext presentationController](self, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AVPresentationContext transitionContext](self, "transitionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerView");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIView *)v6;
}

- (AVPresentationContextTransition)currentTransition
{
  void *v3;

  if (-[AVPresentationContext isPresenting](self, "isPresenting"))
  {
    -[AVPresentationContext presentingTransition](self, "presentingTransition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[AVPresentationContext isDismissing](self, "isDismissing"))
  {
    -[AVPresentationContext dismissingTransition](self, "dismissingTransition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (AVPresentationContextTransition *)v3;
}

- (id)fromView
{
  void *v2;
  void *v3;

  -[AVPresentationContext transitionContext](self, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasActiveTransition
{
  return -[AVPresentationContext isPresenting](self, "isPresenting")
      || -[AVPresentationContext isDismissing](self, "isDismissing");
}

- (BOOL)isDismissing
{
  void *v2;
  char v3;

  -[AVPresentationContext presentationController](self, "presentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dismissing");

  return v3;
}

- (BOOL)isPresenting
{
  void *v2;
  char v3;

  -[AVPresentationContext presentationController](self, "presentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presenting");

  return v3;
}

- (UIView)presentedView
{
  void *v2;
  void *v3;

  -[AVPresentationContext presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (AVPresentationContainerView)presentedPresentationContainerView
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  -[AVPresentationContext presentedView](self, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[AVPresentationContext presentedView](self, "presentedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v6 = objc_opt_isKindOfClass();

    if ((v6 & 1) == 0)
    {
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Presented view is not of type AVPresentationContainerView. Falling back to out-of-band presented view.", v10, 2u);
      }

    }
    -[AVPresentationContext presentationController](self, "presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentedPresentationContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (AVPresentationContainerView *)v5;
}

- (UIViewController)presentedViewController
{
  void *v2;
  void *v3;

  -[AVPresentationContext presentationController](self, "presentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (id)presentingView
{
  void *v3;

  if (-[AVPresentationContext isPresenting](self, "isPresenting"))
  {
    -[AVPresentationContext fromView](self, "fromView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[AVPresentationContext isDismissing](self, "isDismissing"))
  {
    -[AVPresentationContext toView](self, "toView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (UIWindow)presentationWindow
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[AVPresentationContext presentationController](self, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[AVPresentationContext presentationController](self, "presentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v5 = v9;
    }
    else
    {
      -[AVPresentationContext presentationController](self, "presentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentedViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return (UIWindow *)v5;
}

- (AVFullScreenViewController)rotatableWindowViewController
{
  void *v2;
  void *v3;

  -[AVPresentationContext rotatableSecondWindow](self, "rotatableSecondWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVFullScreenViewController *)v3;
}

- (void)setTransitionContext:(id)a3
{
  UIViewControllerContextTransitioning **p_transitionContext;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_transitionContext = &self->_transitionContext;
  WeakRetained = objc_loadWeakRetained((id *)p_transitionContext);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_transitionContext, obj);
    v6 = obj;
  }

}

- (BOOL)wasInitiallyInteractive
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  char v6;

  if (-[AVPresentationContext isPresenting](self, "isPresenting"))
  {
    -[AVPresentationContext presentingTransition](self, "presentingTransition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v3;
    v6 = objc_msgSend(v3, "wasInitiallyInteractive");

    LOBYTE(v4) = v6;
    return v4;
  }
  v4 = -[AVPresentationContext isDismissing](self, "isDismissing");
  if (v4)
  {
    -[AVPresentationContext dismissingTransition](self, "dismissingTransition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v4;
}

- (int64_t)transitionType
{
  if (-[AVPresentationContext isPresenting](self, "isPresenting"))
    return 1;
  if (-[AVPresentationContext isDismissing](self, "isDismissing"))
    return 2;
  return 0;
}

- (id)toView
{
  void *v2;
  void *v3;

  -[AVPresentationContext transitionContext](self, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AVPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (UIView)touchBlockingView
{
  return self->_touchBlockingView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return (UIViewControllerContextTransitioning *)objc_loadWeakRetained((id *)&self->_transitionContext);
}

- (BOOL)allowsSecondWindowPresentations
{
  return self->_allowsSecondWindowPresentations;
}

- (void)setAllowsSecondWindowPresentations:(BOOL)a3
{
  self->_allowsSecondWindowPresentations = a3;
}

- (BOOL)wasInitiallyPresentedWithoutSecondWindow
{
  return self->_wasInitiallyPresentedWithoutSecondWindow;
}

- (void)setWasInitiallyPresentedWithoutSecondWindow:(BOOL)a3
{
  self->_wasInitiallyPresentedWithoutSecondWindow = a3;
}

- (UIWindow)rotatableSecondWindow
{
  return self->_rotatableSecondWindow;
}

- (void)setRotatableSecondWindow:(id)a3
{
  objc_storeStrong((id *)&self->_rotatableSecondWindow, a3);
}

- (AVFullScreenViewController)avFullScreenViewController
{
  return (AVFullScreenViewController *)objc_loadWeakRetained((id *)&self->_avFullScreenViewController);
}

- (AVPresentationContextTransition)presentingTransition
{
  return self->_presentingTransition;
}

- (void)setPresentingTransition:(id)a3
{
  objc_storeStrong((id *)&self->_presentingTransition, a3);
}

- (AVPresentationContextTransition)dismissingTransition
{
  return self->_dismissingTransition;
}

- (void)setDismissingTransition:(id)a3
{
  objc_storeStrong((id *)&self->_dismissingTransition, a3);
}

- (BOOL)allowsPausingWhenTransitionCompletes
{
  return self->_allowsPausingWhenTransitionCompletes;
}

- (void)setAllowsPausingWhenTransitionCompletes:(BOOL)a3
{
  self->_allowsPausingWhenTransitionCompletes = a3;
}

- (AVPresentationController)presentationController
{
  return (AVPresentationController *)objc_loadWeakRetained((id *)&self->_presentationController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationController);
  objc_storeStrong((id *)&self->_dismissingTransition, 0);
  objc_storeStrong((id *)&self->_presentingTransition, 0);
  objc_destroyWeak((id *)&self->_avFullScreenViewController);
  objc_storeStrong((id *)&self->_rotatableSecondWindow, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (BOOL)supportsInteractiveCounterRotationDismissals
{
  return objc_msgSend(MEMORY[0x1E0DC3FA0], "avkit_supportsInteractiveCounterRotationDismissals");
}

@end
