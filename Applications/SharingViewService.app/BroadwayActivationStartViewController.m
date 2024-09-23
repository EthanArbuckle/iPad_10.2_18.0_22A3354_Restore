@implementation BroadwayActivationStartViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BroadwayActivationStartViewController)initWithCoder:(id)a3
{
  BroadwayActivationStartViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BroadwayActivationStartViewController;
  result = -[BroadwayActivationStartViewController initWithCoder:](&v4, "initWithCoder:", a3);
  if (result)
    *(_QWORD *)(&result->_activationStarted + 1) = 999;
  return result;
}

- (void)prepareForRetry
{
  BYTE1(self->_activationCode) = 0;
  *(_QWORD *)(&self->_activationStarted + 1) = 999;
  BYTE2(self->_activationResult) = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  CFTypeID TypeID;
  uint64_t TypedValue;
  UIActivityIndicatorView *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double Width;
  double v28;
  double v29;
  double Height;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;

  v3 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController viewWillAppear:]", 30, "Start ViewWillAppear");
  v37.receiver = self;
  v37.super_class = (Class)BroadwayActivationStartViewController;
  -[SVSBaseViewController viewWillAppear:](&v37, "viewWillAppear:", v3);
  if (!BYTE1(self->_activationResult))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "_remoteViewControllerProxy"));
    objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "userInfo"));
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("activationCode"), TypeID, 0);
    v9 = (UIActivityIndicatorView *)objc_claimAutoreleasedReturnValue(TypedValue);
    v10 = *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1);
    *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1) = v9;

    v11 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapOutsideView:");
    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v11, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v11, "setCancelsTouchesInView:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BroadwayActivationStartViewController view](self, "view"));
    objc_msgSend(v12, "addGestureRecognizer:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
    objc_msgSend(v13, "setSwipeDismissible:", 1);

    v14 = SFFontForTextStyleWithAdditionalSymbolicTraits(UIFontTextStyleTitle1, 0x8000);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(*(id *)((char *)&self->_cardView + 1), "setFont:", v15);

    objc_msgSend(*(id *)((char *)&self->_cardView + 1), "setAdjustsFontForContentSizeCategory:", 0);
    v16 = SFFontForTextStyleWithAdditionalSymbolicTraits(UIFontTextStyleBody, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "titleLabel"));
    objc_msgSend(v18, "setFont:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "titleLabel"));
    objc_msgSend(v19, "setAdjustsFontForContentSizeCategory:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemExtraLightGrayColor](UIColor, "systemExtraLightGrayColor"));
    objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "setBackgroundColor:", v20);

    v21 = SFFontForTextStyleWithAdditionalSymbolicTraits(UIFontTextStyleCallout, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(*(id *)((char *)&self->_progressView + 1), "setFont:", v22);

    objc_msgSend(*(id *)((char *)&self->_progressView + 1), "setAdjustsFontForContentSizeCategory:", 0);
    objc_msgSend(*(id *)((char *)&self->_cardView + 1), "setAlpha:", 0.0);
    objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "setAlpha:", 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URLForResource:withExtension:", CFSTR("Broadway"), CFSTR("mov")));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URLForResource:withExtension:", CFSTR("Broadway"), CFSTR("scnz")));

    if (SFDeviceModelCodeGet(objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "addAnimationObserver:", self)) == 1)
      objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "_setContinuousCornerRadius:", 34.0);
    objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "setVideoURL:sceneURL:", v24, v26);
    -[SVSCardContainerView frame](self->super._containerView, "frame");
    Width = CGRectGetWidth(v38);
    objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "videoSizePoints");
    v29 = Width / v28;
    -[SVSCardContainerView frame](self->super._containerView, "frame");
    Height = CGRectGetHeight(v39);
    objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "videoSizePoints");
    if (v29 >= Height / v31)
      v29 = Height / v31;
    objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "videoSizePoints");
    v33 = v32 * v29;
    objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "videoSizePoints");
    UISizeRoundToViewScale(self->super._containerView, v33, v29 * v34);
    v36 = v35;
    objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setConstant:");
    objc_msgSend(*(id *)((char *)&self->_cardViewWidth + 1), "setConstant:", v36);
    objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "setPaused:", 0);
    if (dword_1001A8BE8 <= 30
      && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    {
      LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController viewWillAppear:]", 30, "Movie start\n");
    }

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSString *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BroadwayActivationStartViewController;
  -[SVSBaseViewController viewDidAppear:](&v16, "viewDidAppear:", a3);
  if (BYTE1(self->_activationResult))
  {
    -[BroadwayActivationStartViewController handleActivateButton:](self, "handleActivateButton:", 0);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "physicalCard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nameOnCard"));
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "physicalCard"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameOnCard"));
      v9 = v8;
      if (v8)
      {
        v10 = sub_100111F68(v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      }
      else
      {
        v12 = objc_opt_new(NSString);
        v13 = sub_100111F68(v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v13);

      }
      objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "setModelContents:", v11);

    }
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10011215C;
    v15[3] = &unk_10017E1F0;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001121A4;
    v14[3] = &unk_10017DF28;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 65538, v15, v14, 1.5, 0.7);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController viewDidDisappear:]", 30, "Start ViewDidDisappear");
  v6.receiver = self;
  v6.super_class = (Class)BroadwayActivationStartViewController;
  -[BroadwayActivationStartViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  objc_msgSend(*(id *)((char *)&self->_cardViewHeight + 1), "removeAnimationObserver:", self);
  v5 = *(NSLayoutConstraint **)((char *)&self->_cardViewHeight + 1);
  *(NSLayoutConstraint **)((char *)&self->_cardViewHeight + 1) = 0;

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v4;
  id v6;
  void *v7;
  void *v8;

  if (BYTE1(self->_activationCode))
    return 0;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v4 = v7 == v8;
  return v4;
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController handleDismissButton:]", 30, "Dismiss button");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (void)handleActivateButton:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD handler[4];
  dispatch_source_t v12;
  BroadwayActivationStartViewController *v13;

  v4 = a3;
  if (!BYTE1(self->_activationCode))
  {
    if (dword_1001A8BE8 <= 30
      && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    {
      LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController handleActivateButton:]", 30, "Activate button");
    }
    BYTE1(self->_activationCode) = 1;
    objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "setHidden:", 1);
    objc_msgSend(*(id *)((char *)&self->_activateButton + 1), "setHidden:", 0);
    objc_msgSend(*(id *)((char *)&self->_activityLabel + 1), "startAnimating");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
    objc_msgSend(v5, "setSwipeDismissible:", 0);

    if (dword_1001A8BE8 <= 30
      && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    {
      LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController handleActivateButton:]", 30, "Start activation with activation code %@", *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1));
    }
    if (objc_msgSend(self->super._mainController, "test")
      && objc_msgSend(self->super._mainController, "forcedActivationResult") != (id)999)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100111D04;
      handler[3] = &unk_10017E1A0;
      v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      v13 = self;
      v7 = v12;
      dispatch_source_set_event_handler(v7, handler);
      SFDispatchTimerSet(v7, 1.0, -1.0, -4.0);
      dispatch_resume(v7);

    }
    else
    {
      v6 = -[objc_class sharedInstance](off_1001A8C58(), "sharedInstance");
      v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "physicalCard"));
      v9 = *(uint64_t *)((char *)&self->_activityIndicatorView + 1);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100111D50;
      v10[3] = &unk_10017DD68;
      v10[4] = self;
      -[NSObject activatePhysicalCard:withActivationCode:forFeatureIdentifier:completion:](v7, "activatePhysicalCard:withActivationCode:forFeatureIdentifier:completion:", v8, v9, 2, v10);

    }
  }

}

- (void)handleCompletedIfReady
{
  uint64_t v3;
  const char *v4;
  const char *v5;

  if (!BYTE2(self->_activationResult))
  {
    v3 = *(_QWORD *)(&self->_activationStarted + 1);
    if (v3 == 999 || !BYTE1(self->_activationResult))
    {
      if (dword_1001A8BE8 <= 30
        && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
      {
        v4 = "no";
        if (v3 == 999)
          v5 = "yes";
        else
          v5 = "no";
        if (BYTE1(self->_activationResult))
          v4 = "yes";
        LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController handleCompletedIfReady]", 30, "Not ready to transition to done yet due to activateInProgress: %s, animationCompleted: %s", v5, v4);
      }
    }
    else
    {
      if (dword_1001A8BE8 <= 30
        && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
      {
        LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController handleCompletedIfReady]", 30, "Done started");
      }
      BYTE2(self->_activationResult) = 1;
      _objc_msgSend(self->super._mainController, "showCompletedUI:", *(_QWORD *)(&self->_activationStarted + 1));
    }
  }
}

- (void)handleTapOutsideView:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController handleTapOutsideView:]", 30, "Dismissing on tap outside view");
  objc_msgSend(self->super._mainController, "dismiss:", 1);

}

- (void)animationDidStart
{
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController animationDidStart]", 30, "Card animation did start");
}

- (void)animationDidComplete
{
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationStartViewController animationDidComplete]", 30, "Card animation did complete");
  BYTE1(self->_activationResult) = 1;
  -[BroadwayActivationStartViewController handleCompletedIfReady](self, "handleCompletedIfReady");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activateButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cardView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cardViewHeight + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cardViewWidth + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
