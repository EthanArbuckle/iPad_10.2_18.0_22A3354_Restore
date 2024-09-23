@implementation HUQuickControlSimpleInteractionCoordinator

- (HUQuickControlSimpleInteractionCoordinator)initWithContraptionViewController:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HUQuickControlSimpleInteractionCoordinator *v10;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUQuickControlSimpleInteractionCoordinator initWithControlView:delegate:](self, "initWithControlView:delegate:", v9, v8);

  if (v10)
    objc_storeStrong((id *)&v10->_contraptionViewController, a3);

  return v10;
}

- (HUQuickControlSimpleInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4
{
  id v6;
  HUQuickControlSimpleInteractionCoordinator *v7;
  HUQuickControlSimpleInteractionCoordinator *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlSimpleInteractionCoordinator;
  v7 = -[HUQuickControlInteractionCoordinator initWithControlView:delegate:](&v10, sel_initWithControlView_delegate_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_shouldDismissAutomatically = 1;
    objc_msgSend(v6, "setInteractionDelegate:", v7);
  }

  return v8;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUserInteractionWithFirstTouchGestureRecognizer:", v4);

}

- (BOOL)isUserInteractionActive
{
  void *v2;
  char v3;

  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionActive");

  return v3;
}

- (BOOL)isUserInteractionEnabled
{
  void *v2;
  char v3;

  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionEnabled");

  return v3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)setValue:(id)a3
{
  -[HUQuickControlSimpleInteractionCoordinator _setValue:notifyDelegate:updateControlView:](self, "_setValue:notifyDelegate:updateControlView:", a3, 0, 1);
}

- (void)_setValue:(id)a3 notifyDelegate:(BOOL)a4 updateControlView:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v11 = a3;
  objc_storeStrong(&self->_value, a3);
  if (v5)
  {
    -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:", v11);

  }
  if (v6)
  {
    -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactionCoordinator:viewValueDidChange:", self, v11);

  }
}

- (void)_requestDismissalIfNecessary
{
  void *v3;
  int v4;
  id v5;

  if (-[HUQuickControlSimpleInteractionCoordinator shouldDismissAutomatically](self, "shouldDismissAutomatically")
    && !-[HUQuickControlSimpleInteractionCoordinator isUserInteractionActive](self, "isUserInteractionActive")
    && !-[HUQuickControlSimpleInteractionCoordinator hasStartedSecondTouch](self, "hasStartedSecondTouch"))
  {
    -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasModelValueChangedForInteractionCoordinator:", self);

    if (v4)
    {
      -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interactionCoordinatorWantsDismissal:", self);

    }
  }
}

- (void)controlView:(id)a3 valueDidChange:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a4;
  -[HUQuickControlSimpleInteractionCoordinator value](self, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v9)
  {

    -[HUQuickControlSimpleInteractionCoordinator _setValue:notifyDelegate:updateControlView:](self, "_setValue:notifyDelegate:updateControlView:", v9, 1, 0);
  }
  else
  {
    v6 = (void *)v5;
    -[HUQuickControlSimpleInteractionCoordinator value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v9);

    -[HUQuickControlSimpleInteractionCoordinator _setValue:notifyDelegate:updateControlView:](self, "_setValue:notifyDelegate:updateControlView:", v9, 1, 0);
    if ((v8 & 1) == 0)
      -[HUQuickControlSimpleInteractionCoordinator _requestDismissalIfNecessary](self, "_requestDismissalIfNecessary");
  }

}

- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v8;

  v5 = a5;
  v6 = a4;
  -[HUQuickControlInteractionCoordinator delegate](self, "delegate", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interactionCoordinator:interactionStateDidChange:", self, v6);

  -[HUQuickControlSimpleInteractionCoordinator setHasStartedSecondTouch:](self, "setHasStartedSecondTouch:", !v5);
  if (!v6)
    -[HUQuickControlSimpleInteractionCoordinator _requestDismissalIfNecessary](self, "_requestDismissalIfNecessary");
}

- (id)value
{
  return self->_value;
}

- (BOOL)shouldDismissAutomatically
{
  return self->_shouldDismissAutomatically;
}

- (void)setShouldDismissAutomatically:(BOOL)a3
{
  self->_shouldDismissAutomatically = a3;
}

- (HUQuickControlInteractiveViewController)contraptionViewController
{
  return self->_contraptionViewController;
}

- (BOOL)hasStartedSecondTouch
{
  return self->_hasStartedSecondTouch;
}

- (void)setHasStartedSecondTouch:(BOOL)a3
{
  self->_hasStartedSecondTouch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contraptionViewController, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
