@implementation LUISwipeUpAnimationController

- (LUISwipeUpAnimationController)init
{
  LUISwipeUpAnimationController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUISwipeUpAnimationController;
  result = -[LUISwipeUpAnimationController init](&v3, "init");
  if (result)
    result->_enabled = 1;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController panGesture](self, "panGesture"));
  objc_msgSend(v3, "removeGestureRecognizer:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController blackBottomView](self, "blackBottomView"));
  objc_msgSend(v5, "removeFromSuperview");

  v6.receiver = self;
  v6.super_class = (Class)LUISwipeUpAnimationController;
  -[LUISwipeUpAnimationController dealloc](&v6, "dealloc");
}

- (void)startTrackingSwipeUpGestureForView:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[LUISwipeUpAnimationController setContentView:](self, "setContentView:", a3);
  v6 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "handlePan:");
  -[LUISwipeUpAnimationController setPanGesture:](self, "setPanGesture:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController panGesture](self, "panGesture"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController panGesture](self, "panGesture"));
  objc_msgSend(v8, "addGestureRecognizer:", v9);

  -[LUISwipeUpAnimationController setDelegate:](self, "setDelegate:", v10);
}

- (void)handlePan:(id)a3
{
  void *v4;
  double v5;
  double v6;
  char *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController contentView](self, "contentView"));
  objc_msgSend(v20, "translationInView:", v4);
  v6 = v5;

  v7 = (char *)objc_msgSend(v20, "state");
  if ((unint64_t)(v7 - 3) >= 3)
  {
    if (v7 != (char *)2)
    {
      if (v7 != (char *)1)
        goto LABEL_16;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController delegate](self, "delegate"));
      v12 = objc_opt_respondsToSelector(v11, "swipeUpAnimationControllerSwipeGestureDidBegin:");

      if ((v12 & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController delegate](self, "delegate"));
        objc_msgSend(v13, "swipeUpAnimationControllerSwipeGestureDidBegin:", self);

      }
    }
    if (v6 / -100.0 >= 0.0)
    {
      if (v6 / -100.0 >= 1.0)
      {
        objc_msgSend(v20, "setEnabled:", 0);
        objc_msgSend(v20, "setEnabled:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController delegate](self, "delegate"));
        v15 = objc_opt_respondsToSelector(v14, "swipeUpAnimationControllerSwipeGestureDidPassThreshold:");

        if ((v15 & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController delegate](self, "delegate"));
          objc_msgSend(v16, "swipeUpAnimationControllerSwipeGestureDidPassThreshold:", self);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController delegate](self, "delegate"));
        v18 = objc_opt_respondsToSelector(v17, "swipeUpAnimationControllerSwipeGestureDidEnd:");

        if ((v18 & 1) != 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController delegate](self, "delegate"));
          objc_msgSend(v19, "swipeUpAnimationControllerSwipeGestureDidEnd:", self);

        }
      }
      else
      {
        -[LUISwipeUpAnimationController _updateTransitionProgress:](self, "_updateTransitionProgress:");
      }
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "swipeUpAnimationControllerSwipeGestureDidEnd:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController delegate](self, "delegate"));
      objc_msgSend(v10, "swipeUpAnimationControllerSwipeGestureDidEnd:", self);

    }
    -[LUISwipeUpAnimationController _resetTransition](self, "_resetTransition");
  }
LABEL_16:

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  CGRect v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController contentView](self, "contentView"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController contentView](self, "contentView"));
  objc_msgSend(v8, "frame");
  LOBYTE(v4) = v7 >= CGRectGetHeight(v10) + -100.0;

  return (char)v4;
}

- (void)_updateTransitionProgress:(double)a3
{
  long double v4;
  void *v5;
  void *v6;
  double Height;
  void *v8;
  double Width;
  void *v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGRect v13;
  CGRect v14;

  v4 = a3 * 100.0 / pow(3.0, a3);
  CGAffineTransformMakeTranslation(&v12, 0.0, -v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController contentView](self, "contentView"));
  v11 = v12;
  objc_msgSend(v5, "setTransform:", &v11);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "bounds");
  Height = CGRectGetHeight(v13);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v14);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController blackBottomView](self, "blackBottomView"));
  objc_msgSend(v10, "setFrame:", 0.0, (double)(Height - v4), Width, (double)v4);

}

- (void)_resetTransition
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000C8B0;
  v2[3] = &unk_100068C58;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v2, 0, 0.300000012, 0.0);
}

- (UIView)blackBottomView
{
  UIView *blackBottomView;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  blackBottomView = self->_blackBottomView;
  if (!blackBottomView)
  {
    v4 = objc_opt_new(UIView);
    v5 = self->_blackBottomView;
    self->_blackBottomView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIView setBackgroundColor:](self->_blackBottomView, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
    objc_msgSend(v9, "addSubview:", self->_blackBottomView);

    blackBottomView = self->_blackBottomView;
  }
  return blackBottomView;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[LUISwipeUpAnimationController panGesture](self, "panGesture"));
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (LUISwipeUpAnimationControllerDelegate)delegate
{
  return (LUISwipeUpAnimationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (void)setBlackBottomView:(id)a3
{
  objc_storeStrong((id *)&self->_blackBottomView, a3);
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
  objc_storeStrong((id *)&self->_panGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_blackBottomView, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
