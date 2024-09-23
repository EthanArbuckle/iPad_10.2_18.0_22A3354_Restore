@implementation EDSceneDelegate

- (id)appDelegate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  EDWindow *v7;
  UIWindow *window;
  void *v9;
  void *v10;
  EDWindow *v11;

  v6 = a3;
  v7 = -[EDWindow initWithWindowScene:]([EDWindow alloc], "initWithWindowScene:", v6);

  window = self->_window;
  self->_window = &v7->super;
  v11 = v7;

  -[EDSceneDelegate appDelegate](self, "appDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSceneDelegate lensView](self, "lensView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v9);

  -[EDWindow setTrackingDelegate:](v11, "setTrackingDelegate:", self);
  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");

}

- (id)lensView
{
  void *v2;
  void *v3;

  -[UIWindow rootViewController](self->_window, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lensView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)trackedTouchesBegan:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  id v14;

  v14 = a3;
  -[EDSceneDelegate appDelegate](self, "appDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSceneDelegate lensView](self, "lensView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeLensView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    objc_msgSend(v14, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", self->_window);
    v9 = v8;
    v11 = v10;
    objc_msgSend(v4, "activeLensView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateCenterOffsetAtTouchDown:", v9, v11);

  }
  if (self->_touchesBeganTime == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_touchesBeganTime = v13;
  }

}

- (void)trackedTouchesEnded:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  CGPoint v16;
  CGRect v17;

  v15 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  if (v4 - self->_touchesBeganTime > 0.2)
  {
    -[EDSceneDelegate appDelegate](self, "appDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSceneDelegate lensView](self, "lensView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSceneDelegate window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    objc_msgSend(v5, "activeLensView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v6)
    {
      objc_msgSend(v6, "frame");
      v16.x = v10;
      v16.y = v12;
      v14 = CGRectContainsPoint(v17, v16);

      if (v14)
        objc_msgSend(v6, "selectColor");
    }
    else
    {

    }
    -[EDSceneDelegate resetTouchesBeganTime](self, "resetTouchesBeganTime");
    objc_msgSend(v5, "dismissEyedropper");

  }
}

- (void)trackedTouchesMoved:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  CGPoint v16;
  CGRect v17;

  v15 = a3;
  -[EDSceneDelegate appDelegate](self, "appDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSceneDelegate lensView](self, "lensView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isActive")
    || (objc_msgSend(v4, "activeLensView"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6 != v5))
  {
    objc_msgSend(v15, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSceneDelegate window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    -[EDSceneDelegate window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v16.x = v10;
    v16.y = v12;
    v14 = CGRectContainsPoint(v17, v16);

    if (v14)
      objc_msgSend(v5, "setActive:", 1);

  }
  -[EDSceneDelegate resetTouchesBeganTime](self, "resetTouchesBeganTime");
  objc_msgSend(v5, "updateLensViewWithEvent:", v15);

}

- (void)resetTouchesBeganTime
{
  self->_touchesBeganTime = 0.0;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
