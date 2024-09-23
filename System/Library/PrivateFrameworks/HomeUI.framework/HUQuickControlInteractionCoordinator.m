@implementation HUQuickControlInteractionCoordinator

- (HUQuickControlInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HUQuickControlInteractionCoordinator *v9;
  HUQuickControlInteractionCoordinator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlInteractionCoordinator;
  v9 = -[HUQuickControlInteractionCoordinator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controlView, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlInteractionCoordinator.m"), 29, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUQuickControlInteractionCoordinator beginUserInteractionWithFirstTouchGestureRecognizer:]", objc_opt_class());

}

- (BOOL)isUserInteractionActive
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlInteractionCoordinator.m"), 39, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUQuickControlInteractionCoordinator isUserInteractionActive]", objc_opt_class());

  return 0;
}

- (BOOL)viewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (HUQuickControlControllableView)controlView
{
  return self->_controlView;
}

- (HUQuickControlInteractionCoordinatorDelegate)delegate
{
  return (HUQuickControlInteractionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controlView, 0);
}

@end
