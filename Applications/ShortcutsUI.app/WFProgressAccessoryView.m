@implementation WFProgressAccessoryView

- (WFProgressAccessoryView)initWithTintColor:(id)a3 runningContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  WFProgressAccessoryView *v9;
  NSBundle *v10;
  void *v11;
  id v12;
  BSUICAPackageView *micaView;
  id v14;
  void *v15;
  UIButton *v16;
  UIButton *cancelButton;
  UIButton *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  WFProgressAccessoryView *v23;
  objc_super v25;
  _QWORD v26[4];

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WFProgressAccessoryView;
  v9 = -[WFProgressAccessoryView initWithFrame:](&v25, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v9)
  {
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(WFProgressAccessoryView, v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(objc_alloc((Class)BSUICAPackageView), "initWithPackageName:inBundle:", CFSTR("zoomy-progress-D73"), v11);
    objc_msgSend(v12, "setState:", CFSTR("compact"));
    micaView = v9->_micaView;
    v9->_micaView = (BSUICAPackageView *)v12;
    v14 = v12;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v16 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v15, 0));
    -[UIButton addTarget:action:forControlEvents:](v16, "addTarget:action:forControlEvents:", v9, "touchedDownCancelButton", 17);
    -[UIButton addTarget:action:forControlEvents:](v16, "addTarget:action:forControlEvents:", v9, "touchedUpCancelButton", 480);
    cancelButton = v9->_cancelButton;
    v9->_cancelButton = v16;
    v18 = v16;

    objc_storeStrong((id *)&v9->_runningContext, a4);
    -[WFProgressAccessoryView addSubview:](v9, "addSubview:", v14);
    -[WFProgressAccessoryView addSubview:](v9, "addSubview:", v18);
    -[WFProgressAccessoryView tintControlWithColor:animated:](v9, "tintControlWithColor:animated:", v6, 0);
    -[WFProgressAccessoryView updateProgressWithValue:](v9, "updateProgressWithValue:", 0.0);
    v26[0] = WFWorkflowRunKindAppShortcut;
    v26[1] = WFWorkflowRunKindAppIntent;
    v26[2] = WFWorkflowRunKindContextualAction;
    v26[3] = WFWorkflowRunKindINShortcut;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView runningContext](v9, "runningContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "runKind"));
    LODWORD(cancelButton) = objc_msgSend(v19, "containsObject:", v21);

    if ((_DWORD)cancelButton)
      v22 = 1;
    else
      v22 = 3;
    -[WFProgressAccessoryView setProgressSuppressionState:](v9, "setProgressSuppressionState:", v22);
    v23 = v9;

  }
  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double x;
  double y;
  double width;
  double height;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v16.receiver = self;
  v16.super_class = (Class)WFProgressAccessoryView;
  -[WFProgressAccessoryView layoutSubviews](&v16, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "displayScale");
  v5 = 1.0 / v4;

  -[WFProgressAccessoryView bounds](self, "bounds");
  v18 = CGRectOffset(v17, v5, 0.0);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
  objc_msgSend(v10, "setFrame:", x, y, width, height);

  -[WFProgressAccessoryView bounds](self, "bounds");
  v20 = CGRectOffset(v19, v5, 0.0);
  v11 = v20.origin.x;
  v12 = v20.origin.y;
  v13 = v20.size.width;
  v14 = v20.size.height;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView cancelButton](self, "cancelButton"));
  objc_msgSend(v15, "setFrame:", v11, v12, v13, v14);

}

- (void)setCancelAction:(id)a3
{
  void *v4;
  UIAction *v5;
  UIAction *cancelAction;
  void *v7;
  id v8;

  v8 = a3;
  if (v8 || !self->_cancelAction)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView cancelButton](self, "cancelButton"));
    objc_msgSend(v4, "addAction:forControlEvents:", v8, 64);

    v5 = (UIAction *)v8;
    cancelAction = self->_cancelAction;
    self->_cancelAction = v5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView cancelButton](self, "cancelButton"));
    objc_msgSend(v7, "removeAction:forControlEvents:", self->_cancelAction, 64);

    cancelAction = self->_cancelAction;
    self->_cancelAction = 0;
  }

}

- (BOOL)isRunningFromActionButton
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView runningContext](self, "runningContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "runSource"));
  v4 = objc_msgSend(v3, "isEqualToString:", WFWorkflowRunSourceActionButton);

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  double width;
  double height;
  CGSize result;

  if (a4 == 4)
  {
    width = 50.0;
    height = 50.0;
  }
  else if ((id)-[WFProgressAccessoryView progressSuppressionState](self, "progressSuppressionState", a3.width, a3.height, v4, v5) == (id)3)
  {
    height = 24.0;
    width = 23.0;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)tintControlWithColor:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;

  v4 = a4;
  v6 = a3;
  -[WFProgressAccessoryView lastKnownProgressValue](self, "lastKnownProgressValue");
  if (v7 < 1.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publishedObjectWithName:", CFSTR("stop button")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publishedObjectWithName:", CFSTR("back fill")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "publishedObjectWithName:", CFSTR("progress fill")));

    v30 = 0.0;
    v31 = 0.0;
    v28 = 0;
    v29 = 0.0;
    objc_msgSend(v6, "getRed:green:blue:alpha:", &v31, &v30, &v29, &v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v31, v30, v29, 0.37));
    v15 = v14;
    if (v4)
    {
      v16 = objc_msgSend(v11, "strokeColor");
      CFRetain(v16);
      v24 = v9;
      v17 = objc_retainAutorelease(v15);
      objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeColor")));
      objc_msgSend(v18, "setFromValue:", v16);
      objc_msgSend(v18, "setToValue:", objc_msgSend(objc_retainAutorelease(v17), "CGColor"));
      objc_msgSend(v18, "setDuration:", 0.300000012);
      objc_msgSend(v18, "setFillMode:", kCAFillModeForwards);
      objc_msgSend(v11, "addAnimation:forKey:", v18, CFSTR("strokeColor"));
      CFRelease(v16);
      v19 = objc_msgSend(v13, "strokeColor");
      CFRetain(v19);
      v20 = objc_retainAutorelease(v6);
      objc_msgSend(v13, "setStrokeColor:", objc_msgSend(v20, "CGColor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeColor")));
      objc_msgSend(v21, "setFromValue:", v19);
      v22 = objc_retainAutorelease(v20);
      objc_msgSend(v21, "setToValue:", objc_msgSend(v22, "CGColor"));
      objc_msgSend(v21, "setDuration:", 0.300000012);
      v9 = v24;
      objc_msgSend(v21, "setFillMode:", kCAFillModeForwards);
      objc_msgSend(v13, "addAnimation:forKey:", v21, CFSTR("strokeColor"));
      CFRelease(v19);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000054AC;
      v25[3] = &unk_100034BC0;
      v26 = v24;
      v27 = v22;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v25, 0, 2.0, 0.15);

    }
    else
    {
      objc_msgSend(v11, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v14), "CGColor"));
      v23 = objc_retainAutorelease(v6);
      objc_msgSend(v13, "setStrokeColor:", objc_msgSend(v23, "CGColor"));
      objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v23), "CGColor"));
    }

  }
}

- (void)updateProgressWithValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD v9[6];

  if (!-[WFProgressAccessoryView hasCompleted](self, "hasCompleted"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publishedObjectWithName:", CFSTR("progress fill")));

    objc_msgSend(v6, "setStrokeStart:", 0.999 - a3 * 0.999 / 0.999);
    if (a3 <= 0.0 || a3 >= 1.0)
    {
      if (a3 >= 1.0)
        -[WFProgressAccessoryView setHasCompleted:](self, "setHasCompleted:", 1);
      if ((id)-[WFProgressAccessoryView progressSuppressionState](self, "progressSuppressionState") != (id)1)
        goto LABEL_11;
      if (a3 > 0.0)
        -[WFProgressAccessoryView setProgressSuppressionState:](self, "setProgressSuppressionState:", 3);
      if (a3 >= 1.0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        -[WFProgressAccessoryView tintControlWithColor:animated:](self, "tintControlWithColor:animated:", v7, 0);

        v8 = dispatch_time(0, 150000000);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100005480;
        v9[3] = &unk_100034AA0;
        v9[4] = self;
        *(double *)&v9[5] = a3;
        dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
      }
      else
      {
LABEL_11:
        -[WFProgressAccessoryView setLastKnownProgressValue:](self, "setLastKnownProgressValue:", a3);
        -[WFProgressAccessoryView updateMicaViewState](self, "updateMicaViewState");
      }
    }

  }
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  _QWORD v3[6];

  self->_activeLayoutMode = a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000053E4;
  v3[3] = &unk_100034AA0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)updateMicaViewState
{
  int64_t v3;
  double v4;
  const __CFString *v5;
  id v6;

  v3 = -[WFProgressAccessoryView activeLayoutMode](self, "activeLayoutMode");
  -[WFProgressAccessoryView lastKnownProgressValue](self, "lastKnownProgressValue");
  if (v3 == 4)
  {
    if (v4 >= 1.0)
    {
      v5 = CFSTR("zoom-done");
    }
    else if (-[WFProgressAccessoryView isTouchingDownButton](self, "isTouchingDownButton"))
    {
      v5 = CFSTR("zoom-press");
    }
    else
    {
      v5 = CFSTR("zoom");
    }
  }
  else if (v4 >= 1.0)
  {
    v5 = CFSTR("compact-done");
  }
  else
  {
    v5 = CFSTR("compact");
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
  objc_msgSend(v6, "setState:", v5);

}

- (void)setProgressSuppressionState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (-[WFProgressAccessoryView progressSuppressionState](self, "progressSuppressionState") != a3)
  {
    self->_progressSuppressionState = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView progressSuppressionTimer](self, "progressSuppressionTimer"));
    objc_msgSend(v5, "invalidate");

    -[WFProgressAccessoryView setProgressSuppressionTimer:](self, "setProgressSuppressionTimer:", 0);
    if (a3 == 3)
    {
      -[WFProgressAccessoryView setMicaViewHidden:animated:](self, "setMicaViewHidden:animated:", 0, 1);
    }
    else
    {
      if ((id)-[WFProgressAccessoryView activeLayoutMode](self, "activeLayoutMode") != (id)4)
        -[WFProgressAccessoryView setMicaViewHidden:animated:](self, "setMicaViewHidden:animated:", 1, 0);
      if ((id)-[WFProgressAccessoryView progressSuppressionState](self, "progressSuppressionState") == (id)1)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_1000053B4;
        v8[3] = &unk_100034910;
        v8[4] = self;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 1.0));
        -[WFProgressAccessoryView setProgressSuppressionTimer:](self, "setProgressSuppressionTimer:", v6);

      }
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView systemApertureElementContext](self, "systemApertureElementContext"));
    objc_msgSend(v7, "setElementNeedsUpdate");

  }
}

- (void)setMicaViewHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  _QWORD block[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v4 = a4;
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
  v8 = objc_msgSend(v7, "isHidden");

  if (v8 != v5)
  {
    if (v4)
    {
      if (v5)
      {
        v14[4] = self;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000052B0;
        v15[3] = &unk_100034BE8;
        v15[4] = self;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000052E4;
        v14[3] = &unk_100034AC8;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v15, v14, 0.4);
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
        objc_msgSend(v9, "setHidden:", 0);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
        objc_msgSend(v10, "setAlpha:", 0.0);

        v11 = dispatch_time(0, 50000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100005318;
        block[3] = &unk_100034BE8;
        block[4] = self;
        dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

      }
    }
    else
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[WFProgressAccessoryView micaView](self, "micaView"));
      objc_msgSend(v12, "setHidden:", v5);

    }
  }
}

- (void)touchedDownCancelButton
{
  -[WFProgressAccessoryView setIsTouchingDownButton:](self, "setIsTouchingDownButton:", 1);
  -[WFProgressAccessoryView updateMicaViewState](self, "updateMicaViewState");
}

- (void)touchedUpCancelButton
{
  -[WFProgressAccessoryView setIsTouchingDownButton:](self, "setIsTouchingDownButton:", 0);
  -[WFProgressAccessoryView updateMicaViewState](self, "updateMicaViewState");
}

- (UIAction)cancelAction
{
  return self->_cancelAction;
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (int64_t)progressSuppressionState
{
  return self->_progressSuppressionState;
}

- (BSUICAPackageView)micaView
{
  return self->_micaView;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (BOOL)isTouchingDownButton
{
  return self->_isTouchingDownButton;
}

- (void)setIsTouchingDownButton:(BOOL)a3
{
  self->_isTouchingDownButton = a3;
}

- (double)lastKnownProgressValue
{
  return self->_lastKnownProgressValue;
}

- (void)setLastKnownProgressValue:(double)a3
{
  self->_lastKnownProgressValue = a3;
}

- (BOOL)hasCompleted
{
  return self->_hasCompleted;
}

- (void)setHasCompleted:(BOOL)a3
{
  self->_hasCompleted = a3;
}

- (NSTimer)progressSuppressionTimer
{
  return self->_progressSuppressionTimer;
}

- (void)setProgressSuppressionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_progressSuppressionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSuppressionTimer, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_micaView, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
}

@end
