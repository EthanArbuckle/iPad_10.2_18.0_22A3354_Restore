@implementation EDWindow

- (EDWindow)initWithWindowScene:(id)a3
{
  id v3;
  EDWindow *v4;
  void *v5;
  void *v6;
  EDWindowRootViewController *v7;
  void *v8;
  EDWindowRootViewController *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EDWindow;
  v3 = a3;
  v4 = -[EDWindow initWithWindowScene:](&v11, sel_initWithWindowScene_, v3);
  -[EDWindow setHidden:](v4, "setHidden:", 0, v11.receiver, v11.super_class);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDWindow setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[EDWindow setWindowLevel:](v4, "setWindowLevel:", *MEMORY[0x24BDF7D70] + -1.0);
  -[EDWindow _setWindowControlsStatusBarOrientation:](v4, "_setWindowControlsStatusBarOrientation:", 0);
  -[EDWindow layer](v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisableUpdateMask:", 2);

  v7 = [EDWindowRootViewController alloc];
  objc_msgSend(v3, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bounds");
  v9 = -[EDWindowRootViewController initWithScreenBounds:](v7, "initWithScreenBounds:");
  -[EDWindow setRootViewController:](v4, "setRootViewController:", v9);

  return v4;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_preventsRootPresentationController
{
  return 1;
}

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  EDWindow *v11;
  EDWindow *v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[EDWindow rootViewController](self, "rootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lensView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
  if (!objc_msgSend(v9, "pointInside:withEvent:", v7)
    || (objc_msgSend(v9, "isHidden") & 1) != 0
    || (objc_msgSend(v9, "alpha"), v10 == 0.0))
  {
    v11 = self;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)EDWindow;
    -[EDWindow hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y);
    v11 = (EDWindow *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[EDWindow trackingDelegate](self, "trackingDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackedTouchesBegan:", v5);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[EDWindow trackingDelegate](self, "trackingDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackedTouchesMoved:", v5);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[EDWindow trackingDelegate](self, "trackingDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackedTouchesEnded:", v5);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[EDWindow trackingDelegate](self, "trackingDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackedTouchesCancelled:", v5);

}

- (EDWindowTrackingDelegate)trackingDelegate
{
  return (EDWindowTrackingDelegate *)objc_loadWeakRetained((id *)&self->_trackingDelegate);
}

- (void)setTrackingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_trackingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trackingDelegate);
}

@end
