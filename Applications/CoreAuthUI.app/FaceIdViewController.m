@implementation FaceIdViewController

- (void)loadView
{
  uint64_t v3;
  NSObject *v4;
  ScreenDimmingView *v5;
  ScreenDimmingView *dimmingView;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  UIColor *v13;
  id v14;
  UIColor *tintColor;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  LAUIPearlGlyphView *v23;
  LAUIPearlGlyphView *glyphView;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  LAUIPearlGlyphView *v28;
  LAUIPearlGlyphView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  unint64_t v40;
  LAUIPhysicalButtonView *v41;
  LAUIPhysicalButtonView *physicalButtonView;
  void *v43;
  uint64_t v44;
  void *v45;
  NSBundle *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  double v54;
  double v55;
  LAUIHorizontalArrowView *v56;
  LAUIHorizontalArrowView *horizontalArrowView;
  double v58;
  void *v59;
  void *v60;
  id v61;
  uint8_t buf[4];
  FaceIdViewController *v63;

  v3 = LACLogFaceIDUI(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v63 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "loadView on %{public}@", buf, 0xCu);
  }

  v5 = objc_opt_new(ScreenDimmingView);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = (unint64_t)objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[ScreenDimmingView setDimEnabled:](self->_dimmingView, "setDimEnabled:", 1);
  -[FaceIdViewController setView:](self, "setView:", self->_dimmingView);
  self->_pearlUIState = 0;
  self->_fallbackVisible = 1;
  self->_showFallback = 0;
  self->_coachingFeedback = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10007E180));

  if (v10)
  {
    v61 = 0;
    v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(UIColor, v11), v10, &v61);
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue(v12);
    v14 = v61;
    tintColor = self->_tintColor;
    self->_tintColor = v13;

    if (!self->_tintColor)
    {
      v17 = LACLogFaceIDUI(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100055AFC((uint64_t)v14, v18);

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v20 = LACLightweightUIModeFromOptions();

  v21 = +[LAUIPearlGlyphStaticConfiguration createSystemApertureConfiguration](LAUIPearlGlyphStaticConfiguration, "createSystemApertureConfiguration");
  if (v20)
  {
    v22 = 0;
  }
  else if (sub_10001C8C8())
  {
    v22 = 4;
  }
  else
  {
    v22 = 1;
  }
  objc_msgSend(v21, "setInitialStyle:", v22);
  v23 = (LAUIPearlGlyphView *)objc_msgSend(objc_alloc((Class)LAUIPearlGlyphView), "initWithConfiguration:", v21);
  glyphView = self->_glyphView;
  self->_glyphView = v23;

  v26 = LACLogFaceIDUI(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = self->_glyphView;
    *(_DWORD *)buf = 138412290;
    v63 = (FaceIdViewController *)v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "glyph created: %@", buf, 0xCu);
  }

  if ((sub_10001C8C8() & 1) == 0 && v20)
  {
    v29 = self->_glyphView;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[LAUIPearlGlyphView setIdleColor:animated:](v29, "setIdleColor:animated:", v30, 0);

  }
  if (sub_10001C8C8())
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", &off_10007E198));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", &off_10007E1B0));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", &off_10007E1C8));
    v35 = objc_msgSend(v34, "integerValue");

    if (v35 == (id)2)
      -[LAUIPearlGlyphView setFaceVisibility:animated:](self->_glyphView, "setFaceVisibility:animated:", 7, 0);
  }
  -[FaceIdViewController _setupToastWithGlyph:](self, "_setupToastWithGlyph:", self->_glyphView);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController internalInfo](self, "internalInfo"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("FaceIdWithButton")));

  if (objc_msgSend(v37, "intValue") != 2)
  {
    v38 = objc_alloc((Class)LAUIPhysicalButtonView);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v40 = (unint64_t)objc_msgSend(v39, "userInterfaceIdiom");

    v41 = (LAUIPhysicalButtonView *)objc_msgSend(v38, "initWithStyle:", (v40 & 0xFFFFFFFFFFFFFFFBLL) == 1);
    physicalButtonView = self->_physicalButtonView;
    self->_physicalButtonView = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", &off_10007E1E0));
    if (v45)
    {
      -[LAUIPhysicalButtonView setInstruction:](self->_physicalButtonView, "setInstruction:", v45);
    }
    else
    {
      v46 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v44));
      v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("PEARL_DOUBLECLICK_TO_CONTINUE"), &stru_10007CCD0, CFSTR("MobileUI")));
      -[LAUIPhysicalButtonView setInstruction:](self->_physicalButtonView, "setInstruction:", v48);

    }
    -[LAUIPhysicalButtonView setAnimating:](self->_physicalButtonView, "setAnimating:", 1);
    -[LAUIPhysicalButtonView setHidden:](self->_physicalButtonView, "setHidden:", objc_msgSend(v37, "intValue") == 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController view](self, "view"));
    objc_msgSend(v49, "addSubview:", self->_physicalButtonView);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController view](self, "view"));
    objc_msgSend(v50, "bringSubviewToFront:", self->_physicalButtonView);

  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v52 = (unint64_t)objc_msgSend(v51, "userInterfaceIdiom");

  if ((v52 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v53, "bounds");
    v55 = v54;

    v56 = objc_opt_new(LAUIHorizontalArrowView);
    horizontalArrowView = self->_horizontalArrowView;
    self->_horizontalArrowView = v56;

    -[LAUIHorizontalArrowView sizeToFit](self->_horizontalArrowView, "sizeToFit");
    -[LAUIHorizontalArrowView frame](self->_horizontalArrowView, "frame");
    -[LAUIHorizontalArrowView setDisplacement:](self->_horizontalArrowView, "setDisplacement:", v55 * 0.5 - v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController view](self, "view"));
    objc_msgSend(v59, "addSubview:", self->_horizontalArrowView);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController view](self, "view"));
    objc_msgSend(v60, "bringSubviewToFront:", self->_horizontalArrowView);

  }
  -[FaceIdViewController _updatePearlViews](self, "_updatePearlViews");

}

- (void)_setupToastWithGlyph:(id)a3
{
  id v4;
  FaceIdToastViewController *v5;
  uint64_t v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  void *v10;
  FaceIdToastViewController *v11;
  FaceIdToastViewController *toastController;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  v5 = [FaceIdToastViewController alloc];
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PEARL"), &stru_10007CCD0, CFSTR("MobileUI")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v11 = -[FaceIdToastViewController initWithGlyph:title:lightweightUIMode:](v5, "initWithGlyph:title:lightweightUIMode:", v4, v9, LACLightweightUIModeFromOptions());
  toastController = self->_toastController;
  self->_toastController = v11;

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008B1C;
  v15[3] = &unk_100079B80;
  objc_copyWeak(&v16, &location);
  -[FaceIdToastViewController setOnTap:](self->_toastController, "setOnTap:", v15);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008B48;
  v13[3] = &unk_100079B80;
  objc_copyWeak(&v14, &location);
  -[FaceIdToastViewController setOnDynamicIslandPresented:](self->_toastController, "setOnDynamicIslandPresented:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FaceIdViewController;
  -[FaceIdViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[FaceIdViewController _updatePearlViews](self, "_updatePearlViews");
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  FaceIdViewController *v17;

  v15.receiver = self;
  v15.super_class = (Class)FaceIdViewController;
  v4 = -[TransitionViewController viewDidAppear:](&v15, "viewDidAppear:", a3);
  self->_animationStart = 0.0;
  if (self->_silentFallback)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LAErrorHelper silentInternalErrorWithMessage:](LAErrorHelper, "silentInternalErrorWithMessage:", CFSTR("Silent UI fallback")));
    -[TransitionViewController uiFailureWithError:](self, "uiFailureWithError:", v5);
LABEL_3:

    return;
  }
  if (!self->_hwIssueEvent)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController internalInfo](self, "internalInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FaceIdWithButton")));

    v9 = objc_msgSend(v5, "intValue");
    if ((_DWORD)v9 == 2)
    {
      v10 = LACLogFaceIDUI(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will suspend to wait for a double press", buf, 0xCu);
      }

      -[FaceIdViewController setSuspended:](self, "setSuspended:", 1);
    }
    else
    {
      v12 = -[FaceIdToastViewController lightweightUI](self->_toastController, "lightweightUI");
      if (v12)
      {
        v13 = LACLogFaceIDUI(v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v17 = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ will suspend because of lightweight UI", buf, 0xCu);
        }

        -[FaceIdViewController setSuspended:](self, "setSuspended:", 1);
      }
      -[FaceIdViewController _presentToast](self, "_presentToast");
    }
    goto LABEL_3;
  }
  v6 = LACLogFaceIDUI(v4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ is showing HW event UI", buf, 0xCu);
  }

  -[FaceIdViewController _showFailAlert](self, "_showFailAlert");
}

- (void)_presentToast
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  FaceIdToastViewController *toastController;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  FaceIdViewController *v11;
  __int16 v12;
  const __CFString *v13;

  if (self->_toastController)
  {
    v3 = -[FaceIdViewController isBeingDismissed](self, "isBeingDismissed");
    if ((v3 & 1) != 0 || self->_dismissed)
    {
      v4 = LACLogFaceIDUI(v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_dismissed)
          v6 = CFSTR("dismissed");
        else
          v6 = CFSTR("being dismissed");
        *(_DWORD *)buf = 138543618;
        v11 = self;
        v12 = 2114;
        v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will not present Face ID glyph because %{public}@ is %{public}@", buf, 0x16u);
      }

    }
    else
    {
      if (self->_toastWasUsedForJindoPresentation)
        -[FaceIdViewController _setupToastWithGlyph:](self, "_setupToastWithGlyph:", self->_glyphView);
      if (sub_10001C8C8())
        self->_toastWasUsedForJindoPresentation = 1;
      objc_initWeak((id *)buf, self);
      toastController = self->_toastController;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100008FD0;
      v8[3] = &unk_100079B80;
      objc_copyWeak(&v9, (id *)buf);
      -[PresentationViewController presentOnParentViewController:animated:completionHandler:](toastController, "presentOnParentViewController:animated:completionHandler:", self, 0, v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_handleToastPresented
{
  dispatch_time_t v3;
  LAUIPhysicalButtonView *physicalButtonView;
  UIAccessibilityNotifications v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_toastWasUsedForJindoPresentation)
  {
    objc_initWeak(&location, self);
    v3 = dispatch_time(0, 200000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100009100;
    v7[3] = &unk_100079B80;
    objc_copyWeak(&v8, &location);
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  physicalButtonView = self->_physicalButtonView;
  if (physicalButtonView)
  {
    if ((-[LAUIPhysicalButtonView isHidden](physicalButtonView, "isHidden") & 1) == 0)
    {
      v5 = UIAccessibilityAnnouncementNotification;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPhysicalButtonView instruction](self->_physicalButtonView, "instruction"));
      UIAccessibilityPostNotification(v5, v6);

    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  UIColor *tintColor;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FaceIdViewController;
  -[FaceIdViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  tintColor = self->_tintColor;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  objc_msgSend(v7, "setTintColor:", tintColor);

}

- (void)_cancelIfPossible
{
  uint64_t v3;
  NSObject *v4;
  int64_t pearlUIState;
  int64_t v6;
  int v8;
  FaceIdViewController *v9;
  __int16 v10;
  int v11;

  v3 = LACLogFaceIDUI(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    pearlUIState = self->_pearlUIState;
    v8 = 138543618;
    v9 = self;
    v10 = 1024;
    v11 = pearlUIState;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ requested cancel while in state:%d", (uint8_t *)&v8, 0x12u);
  }

  if ((sub_10001C8C8() & 1) != 0)
    goto LABEL_11;
  if (self->_coachingFeedback == 1)
  {
    v6 = self->_pearlUIState;
    if (v6 == 3 || v6 == 0)
    {
      -[ScreenDimmingView setDimEnabled:](self->_dimmingView, "setDimEnabled:", 0);
LABEL_11:
      if (!-[FaceIdViewController processHomeButtonPressed](self, "processHomeButtonPressed"))
        -[TransitionViewController uiCancel](self, "uiCancel");
    }
  }
}

- (void)_showFailAlert
{
  int v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  char v14;
  _QWORD v15[4];
  id v16;
  char v17;
  id location;

  objc_initWeak(&location, self);
  v3 = sub_10001C8C8();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));

  if (!v4)
  {
    if (v3)
    {
      v7 = objc_loadWeakRetained(&location);
      objc_msgSend(v7, "_presentAlertAnimated:specialUi:", 1, 1);

      goto LABEL_11;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController toastController](self, "toastController"));
    if ((objc_msgSend(v8, "isViewLoaded") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController toastController](self, "toastController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

      if (v11)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController toastController](self, "toastController"));
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100009538;
        v12[3] = &unk_100079BA8;
        v6 = &v13;
        objc_copyWeak(&v13, &location);
        v14 = 0;
        objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, v12);
        goto LABEL_3;
      }
    }
    else
    {

    }
    -[FaceIdViewController _presentAlertAnimated:specialUi:](self, "_presentAlertAnimated:specialUi:", 0, 0);
    goto LABEL_11;
  }
  -[FaceIdViewController setDismissingTemporarily:](self, "setDismissingTemporarily:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000094CC;
  v15[3] = &unk_100079BA8;
  v6 = &v16;
  objc_copyWeak(&v16, &location);
  v17 = v3;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, v15);
LABEL_3:

  objc_destroyWeak(v6);
LABEL_11:
  objc_destroyWeak(&location);
}

- (void)_presentAlertAnimated:(BOOL)a3 specialUi:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  unsigned int v9;
  FaceIdToastViewController *v10;
  dispatch_time_t v11;
  FaceIdToastViewController *v12;
  FaceIdAlertViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  LAUIPearlGlyphView *glyphView;
  void *v19;
  uint64_t v20;
  NSBundle *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSBundle *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSBundle *v31;
  void *v32;
  void *v33;
  int64_t hwIssueEvent;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  NSBundle *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSBundle *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  BOOL v48;
  BOOL v49;
  _QWORD v50[4];
  id v51;
  id location;
  _QWORD block[4];
  FaceIdToastViewController *v54;

  v4 = a4;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10007E1F8));
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      -[FaceIdViewController _setGlyphToNoMatchWithSpecialUi:](self, "_setGlyphToNoMatchWithSpecialUi:", 1);
      -[FaceIdViewController _shake:](self, "_shake:", 1);
      -[FaceIdViewController setSuspended:](self, "setSuspended:", 1);
      v10 = self->_toastController;
      v11 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009B14;
      block[3] = &unk_100079A08;
      v54 = v10;
      v12 = v10;
      dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

      return;
    }
  }
  objc_initWeak(&location, self);
  v13 = objc_opt_new(FaceIdAlertViewController);
  -[FaceIdViewController setAlertController:](self, "setAlertController:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
  objc_msgSend(v14, "setPreferredStyle:", 1);

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100009BD0;
  v50[3] = &unk_100079B80;
  objc_copyWeak(&v51, &location);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
  objc_msgSend(v15, "setOnDismiss:", v50);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
  v17 = v16;
  if (v4)
    glyphView = 0;
  else
    glyphView = self->_glyphView;
  objc_msgSend(v16, "setGlyph:", glyphView);

  if (self->_pearlUIState == 5)
  {
    -[FaceIdViewController _hideGlyphWithSpecialUi:](self, "_hideGlyphWithSpecialUi:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
    v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PEARL_LOCKOUT"), &stru_10007CCD0, CFSTR("MobileUI")));
    objc_msgSend(v19, "setTitle:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
    v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("PEARL_LOCKOUT_DESCRIPTION"), &stru_10007CCD0, CFSTR("MobileUI")));
    objc_msgSend(v24, "setMessage:", v28);
LABEL_17:

    goto LABEL_18;
  }
  if (!self->_hwIssueEvent)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
    v38 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v37));
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("PEARL_FAILED"), &stru_10007CCD0, CFSTR("MobileUI")));
    objc_msgSend(v36, "setTitle:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationSubtitle](self, "authenticationSubtitle"));
    objc_msgSend(v41, "setMessage:", v42);

    -[FaceIdViewController _setGlyphToNoMatchWithSpecialUi:](self, "_setGlyphToNoMatchWithSpecialUi:", v4);
    if (v4)
      -[FaceIdViewController _shake:](self, "_shake:", 1);
    goto LABEL_18;
  }
  -[FaceIdViewController _hideGlyphWithSpecialUi:](self, "_hideGlyphWithSpecialUi:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
  v31 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v30));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("PEARL_HW_ISSUE_TITLE"), &stru_10007CCD0, CFSTR("MobileUI")));
  objc_msgSend(v29, "setTitle:", v33);

  hwIssueEvent = self->_hwIssueEvent;
  if (hwIssueEvent == 9)
  {
    v35 = CFSTR("PEARL_HW_ISSUE_LOW_TEMPERATURE");
    goto LABEL_16;
  }
  if (hwIssueEvent == 10)
  {
    v35 = CFSTR("PEARL_HW_ISSUE_HIGH_TEMPERATURE");
LABEL_16:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
    v44 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v43));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", v35, &stru_10007CCD0, CFSTR("MobileUI")));
    objc_msgSend(v24, "setMessage:", v28);
    goto LABEL_17;
  }
LABEL_18:
  -[FaceIdViewController _setActionButtons](self, "_setActionButtons");
  -[FaceIdViewController _dismissCoachingViews](self, "_dismissCoachingViews");
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController dimmingView](self, "dimmingView"));
  objc_msgSend(v45, "setDimEnabled:", 0);

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100009C40;
  v46[3] = &unk_100079C10;
  objc_copyWeak(&v47, &location);
  v48 = a3;
  v49 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v46);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);
}

- (void)_hideGlyphWithSpecialUi:(BOOL)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[FaceIdViewController toastController](self, "toastController"));
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, &stru_100079C30);

  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
    objc_msgSend(v4, "setGlyph:", 0);

  }
}

- (void)_setGlyphToNoMatchWithSpecialUi:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (a3)
  {
    -[LAUIPearlGlyphView setShakeEnabled:](self->_glyphView, "setShakeEnabled:", 0);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController glyphView](self, "glyphView"));
    objc_msgSend(v5, "setStyle:animated:", 2, 0);

  }
  -[FaceIdViewController _setGlyphState:animated:](self, "_setGlyphState:animated:", 4, v3);
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  int v13;
  FaceIdViewController *v14;
  __int16 v15;
  const char *v16;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController toastController](self, "toastController"));
  v6 = objc_msgSend(v5, "lightweightUI");

  v7 = v6 | v3;
  v9 = LACLogFaceIDUI(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "resumed";
    if ((_DWORD)v7)
      v11 = "suspended";
    v13 = 138543618;
    v14 = self;
    v15 = 2080;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ has been %s", (uint8_t *)&v13, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController dimmingView](self, "dimmingView"));
  objc_msgSend(v12, "setHidden:", v7);

  self->_suspended = v7;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)_uiCancelWithUnderlyingError
{
  -[TransitionViewController uiCancelWithError:](self, "uiCancelWithError:", self->_underlyingError);
}

- (void)_setActionButtons
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  NSBundle *v7;
  void *v8;
  unsigned int fallbackVisible;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  _BOOL4 showFallback;
  id v17;
  uint64_t v18;
  int v19;
  FaceIdAlertViewController *alertController;
  NSBundle *v21;
  void *v22;
  void *v23;
  id *v24;
  NSBundle *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSBundle *v29;
  void *v30;
  void *v31;
  FaceIdAlertViewController *v32;
  void *v33;
  FaceIdAlertViewController *v34;
  void *v35;
  uint64_t v36;
  NSBundle *v37;
  void *v38;
  uint64_t v39;
  FaceIdAlertViewController *v40;
  uint64_t v41;
  NSBundle *v42;
  void *v43;
  void *v44;
  void *v45;
  NSBundle *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSBundle *v50;
  void *v51;
  void *v52;
  FaceIdAlertViewController *v53;
  void *v54;
  FaceIdAlertViewController *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  FaceIdAlertViewController *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  int64_t pearlUIState;
  void *v67;
  void *v68;
  void *v69;
  NSBundle *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSBundle *v74;
  uint64_t v75;
  int v76;
  NSBundle *v77;
  void *v78;
  FaceIdAlertViewController *v79;
  void *v80;
  NSBundle *v81;
  NSBundle *v82;
  NSBundle *v83;
  NSBundle *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD *v88;
  void *v89;
  void *v90;
  _QWORD v91[5];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[5];
  id v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t *v102;
  _BYTE *v103;
  id v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  unsigned __int8 v124;
  id location;
  _BYTE buf[24];
  int v127;
  __int16 v128;
  _BOOL4 v129;
  __int16 v130;
  _BOOL4 v131;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_10007E210));
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v124 = 0;
  v86 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue", v4);
  else
    v6 = 1;
  v124 = v6;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v120 = 0;
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10007CCD0, CFSTR("MobileUI")));

  v113 = 0;
  v114 = &v113;
  v115 = 0x2020000000;
  v116 = 0;
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_10007E228));
  fallbackVisible = objc_msgSend(v90, "BOOLValue");
  self->_fallbackVisible = fallbackVisible;
  if (self->_pearlUIState == 7)
  {
    *((_BYTE *)v114 + 24) = 1;
    fallbackVisible = self->_fallbackVisible;
  }
  if (!fallbackVisible)
    *((_BYTE *)v122 + 24) = 1;
  v10 = objc_msgSend(v90, "intValue", v86);
  if ((_DWORD)v10 == 2 || !*((_BYTE *)v122 + 24) || *((_BYTE *)v114 + 24))
    self->_showFallback = 1;
  v11 = LACLogFaceIDUI(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
    v14 = self->_fallbackVisible;
    v15 = *((unsigned __int8 *)v122 + 24);
    showFallback = self->_showFallback;
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 1024;
    v127 = v15;
    v128 = 1024;
    v129 = v14;
    v130 = 1024;
    v131 = showFallback;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ will present %{public}@ with buttons - cancel:%d, fallback:%d, show fallback immediately:%d", buf, 0x28u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v127) = self->_showFallback;
  v109 = 0;
  v110 = &v109;
  v111 = 0x2020000000;
  v112 = 0;
  v105 = 0;
  v106 = &v105;
  v107 = 0x2020000000;
  v108 = 0;
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_10000AD74;
  v97[3] = &unk_100079CC0;
  v97[4] = self;
  v99 = &v113;
  v17 = v3;
  v98 = v17;
  v100 = &v105;
  v101 = &v109;
  objc_copyWeak(&v104, &location);
  v102 = &v121;
  v103 = buf;
  v88 = objc_retainBlock(v97);
  v19 = 0;
  switch(self->_pearlUIState)
  {
    case 2:
      alertController = self->_alertController;
      v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v18));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PEARL_TRY_AGAIN"), &stru_10007CCD0, CFSTR("MobileUI")));
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = sub_10000B040;
      v95[3] = &unk_100079B80;
      v24 = &v96;
      objc_copyWeak(&v96, &location);
      -[FaceIdAlertViewController _addActionWithTitle:style:handler:shouldDismissHandler:](alertController, "_addActionWithTitle:style:handler:shouldDismissHandler:", v23, 0, v95, &stru_100079CE0);

      ((void (*)(void))v88[2])();
      if (self->_fallbackVisible)
      {
        v19 = 1;
        if (!self->_showFallback)
          self->_showFallback = 1;
      }
      else
      {
        v19 = 1;
      }
      goto LABEL_25;
    case 4:
      goto LABEL_23;
    case 5:
      if (self->_fallbackVisible && !self->_showFallback)
        self->_showFallback = 1;
      goto LABEL_23;
    case 6:
      v25 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v18));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("FACE_ID_REQUIRED"), &stru_10007CCD0, CFSTR("MobileUI")));
      -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v27);

      v29 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v28));
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DTO_IS_ACTIVE"), &stru_10007CCD0, CFSTR("MobileUI-Ratchet")));
      -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", v31);

      v32 = self->_alertController;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationTitle](self, "authenticationTitle"));
      -[FaceIdAlertViewController setTitle:](v32, "setTitle:", v33);

      v34 = self->_alertController;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationSubtitle](self, "authenticationSubtitle"));
      -[FaceIdAlertViewController setMessage:](v34, "setMessage:", v35);

      v37 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v36));
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10007CCD0, CFSTR("MobileUI")));

      *((_BYTE *)v118 + 24) = 1;
      v40 = self->_alertController;
      v42 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v41));
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_10007CCD0, CFSTR("MobileUI")));
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472;
      v93[2] = sub_10000B0DC;
      v93[3] = &unk_100079D08;
      v24 = &v94;
      objc_copyWeak(&v94, &location);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v44, 0, v93));
      -[FaceIdAlertViewController addAction:](v40, "addAction:", v45);

      v19 = 0;
      v89 = (void *)v39;
LABEL_25:
      objc_destroyWeak(v24);
      break;
    case 7:
      v46 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v18));
      v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("PASSCODE_TO_RETRY_FACE_ID"), &stru_10007CCD0, CFSTR("MobileUI")));
      -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v48);

      v50 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v49));
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("DTO_IS_ACTIVE"), &stru_10007CCD0, CFSTR("MobileUI-Ratchet")));
      -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", v52);

      v53 = self->_alertController;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationTitle](self, "authenticationTitle"));
      -[FaceIdAlertViewController setTitle:](v53, "setTitle:", v54);

      v55 = self->_alertController;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationSubtitle](self, "authenticationSubtitle"));
      -[FaceIdAlertViewController setMessage:](v55, "setMessage:", v56);

LABEL_23:
      ((void (*)(void))v88[2])();
      v19 = 0;
      break;
    default:
      break;
  }
  if (*((_BYTE *)v122 + 24))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", &off_10007E258));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[LAUtils truncateString:maxLength:](LAUtils, "truncateString:maxLength:", v57, 32));

    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "stringByTrimmingCharactersInSet:", v59));

      if (v60 && objc_msgSend(v60, "length"))
        goto LABEL_34;
    }
    else
    {
      v60 = 0;
    }
    v61 = v89;

    v60 = v61;
LABEL_34:
    v62 = self->_alertController;
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_10000B144;
    v91[3] = &unk_100079D30;
    objc_copyWeak(&v92, &location);
    v91[4] = &v117;
    -[FaceIdAlertViewController _addActionWithTitle:style:handler:shouldDismissHandler:](v62, "_addActionWithTitle:style:handler:shouldDismissHandler:", v60, 1, v91, &stru_100079D50);
    objc_destroyWeak(&v92);

  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdAlertViewController actions](self->_alertController, "actions"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectAtIndexedSubscript:", 0));
  -[FaceIdAlertViewController setPreferredAction:](self->_alertController, "setPreferredAction:", v64);

  pearlUIState = self->_pearlUIState;
  if (pearlUIState != 5 && (unint64_t)(pearlUIState - 8) <= 0xFFFFFFFFFFFFFFFDLL && !self->_hwIssueEvent)
  {
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      if (*((_BYTE *)v106 + 24))
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", &off_10007E1C8));
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[LAUtils truncateString:maxLength:](LAUtils, "truncateString:maxLength:", v68, 512));
        -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", v69);

      }
      else
      {
        v76 = *((unsigned __int8 *)v110 + 24);
        if (v19)
        {
          if (*((_BYTE *)v110 + 24))
          {
            v77 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v65));
            v67 = (void *)objc_claimAutoreleasedReturnValue(v77);
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("TRY_AGAIN_OR_ENTER_PASSCODE")));
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", v68, &stru_10007CCD0, CFSTR("MobileUI")));
          }
          else
          {
            v82 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v65));
            v67 = (void *)objc_claimAutoreleasedReturnValue(v82);
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN_OR_ENTER_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));
            v68 = v78;
          }
          -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", v78);
          if (!v76)
            goto LABEL_41;
        }
        else
        {
          if (*((_BYTE *)v110 + 24))
          {
            v81 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v65));
            v67 = (void *)objc_claimAutoreleasedReturnValue(v81);
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ENTER_PASSCODE")));
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", v68, &stru_10007CCD0, CFSTR("MobileUI")));
          }
          else
          {
            v83 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v65));
            v67 = (void *)objc_claimAutoreleasedReturnValue(v83);
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("ENTER_YOUR_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));
            v68 = v78;
          }
          -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", v78);
          if (!v76)
            goto LABEL_41;
        }

      }
    }
    else
    {
      if (!v19)
      {
        -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", 0);
        goto LABEL_50;
      }
      v70 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v65));
      v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_10007CCD0, CFSTR("MobileUI")));
      -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", v72);

      if (!+[LAUtils isLocationBasedPolicy:](LAUtils, "isLocationBasedPolicy:", -[TransitionViewController policy](self, "policy")))
      {
LABEL_50:
        v79 = self->_alertController;
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationSubtitle](self, "authenticationSubtitle"));
        -[FaceIdAlertViewController setMessage:](v79, "setMessage:", v80);

        goto LABEL_51;
      }
      if (self->_fallbackVisible)
      {
        v74 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v73));
        v67 = (void *)objc_claimAutoreleasedReturnValue(v74);
        v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_10007CCD0, CFSTR("MobileUI")));
      }
      else
      {
        v84 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v73));
        v67 = (void *)objc_claimAutoreleasedReturnValue(v84);
        v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("FACE_ID_REQUIRED_MESSAGE"), &stru_10007CCD0, CFSTR("MobileUI")));
      }
      v85 = (void *)v75;
      -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", v75);
      v68 = v85;
    }
LABEL_41:

    goto LABEL_50;
  }
LABEL_51:

  objc_destroyWeak(&v104);
  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v121, 8);

  objc_destroyWeak(&location);
}

- (void)_shake:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSBundle *v7;
  void *v8;
  id v9;

  if (a3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController toastController](self, "toastController"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController alertController](self, "alertController"));
  v5 = v4;
  objc_msgSend(v4, "shake");

  LODWORD(v5) = UIAccessibilityAnnouncementNotification;
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v6));
  v9 = (id)objc_claimAutoreleasedReturnValue(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_10007CCD0, CFSTR("MobileUI")));
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v5, v8);

}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  NSObject *v11;
  NSError *underlyingError;
  id v13;
  int v14;
  FaceIdViewController *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;

  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = LACLogFaceIDUI(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543874;
    v15 = self;
    v16 = 1024;
    v17 = a3;
    v18 = 2114;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ has received mechanism event %d (%{public}@)", (uint8_t *)&v14, 0x1Cu);
  }

  underlyingError = self->_underlyingError;
  self->_underlyingError = 0;

  switch(a3)
  {
    case 1:
    case 6:
      v13 = objc_msgSend(v8, "copy");
      -[FaceIdViewController _handleNoMatchOrSensorInactive:](self, "_handleNoMatchOrSensorInactive:", v13);
      goto LABEL_16;
    case 2:
      -[FaceIdViewController _handleMatch](self, "_handleMatch");
      if (!v9)
        goto LABEL_25;
      goto LABEL_24;
    case 3:
      self->_animationStart = CFAbsoluteTimeGetCurrent();
      -[FaceIdViewController _setGlyphState:animated:](self, "_setGlyphState:animated:", 2, 1);
      if (self->_pearlUIState != 4)
        goto LABEL_23;
      self->_pearlUIState = 3;
      if (!v9)
        goto LABEL_25;
      goto LABEL_24;
    case 5:
      -[FaceIdViewController _handleSensorActive](self, "_handleSensorActive");
      if (!v9)
        goto LABEL_25;
      goto LABEL_24;
    case 7:
      v13 = objc_msgSend(v8, "copy");
      -[FaceIdViewController _handleBioLockout:](self, "_handleBioLockout:", v13);
LABEL_16:

      if (!v9)
        goto LABEL_25;
      goto LABEL_24;
    case 8:
    case 9:
    case 10:
      self->_hwIssueEvent = a3;
      if (!-[TransitionViewController appeared](self, "appeared"))
        goto LABEL_23;
      -[FaceIdViewController _showFailAlert](self, "_showFailAlert");
      if (!v9)
        goto LABEL_25;
      goto LABEL_24;
    case 11:
      self->_silentFallback = 1;
      if (!v9)
        goto LABEL_25;
      goto LABEL_24;
    case 12:
      -[LAUIPhysicalButtonView setHidden:](self->_physicalButtonView, "setHidden:", 1);
      if (!v9)
        goto LABEL_25;
      goto LABEL_24;
    case 13:
      -[LAUIPhysicalButtonView setHidden:](self->_physicalButtonView, "setHidden:", 0);
      goto LABEL_23;
    case 14:
      -[FaceIdViewController _processCoachingFeedback:](self, "_processCoachingFeedback:", (int)objc_msgSend(v8, "intValue"));
      if (!v9)
        goto LABEL_25;
      goto LABEL_24;
    default:
LABEL_23:
      if (v9)
LABEL_24:
        v9[2](v9);
LABEL_25:

      return;
  }
}

- (void)_handleMatch
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  FaceIdViewController *v11;
  __int16 v12;
  double v13;

  self->_pearlUIState = 1;
  -[FaceIdViewController _dismissCoachingViews](self, "_dismissCoachingViews");
  -[ScreenDimmingView setDimEnabled:](self->_dimmingView, "setDimEnabled:", 0);
  v4 = self->_animationStart - CFAbsoluteTimeGetCurrent() + 0.4;
  if (v4 > 0.0)
  {
    v5 = LACLogFaceIDUI(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v11 = self;
      v12 = 2048;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will extend animation time by %.02f sec", buf, 0x16u);
    }

  }
  objc_initWeak((id *)buf, self);
  v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B6A4;
  block[3] = &unk_100079B80;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)_handleSensorActive
{
  FaceIdAlertViewController *alertController;
  NSBundle *v4;
  void *v5;
  void *v6;

  self->_animationStart = 0.0;
  if (self->_alertController)
  {
    self->_pearlUIState = 3;
    alertController = self->_alertController;
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PEARL"), &stru_10007CCD0, CFSTR("MobileUI")));
    -[FaceIdAlertViewController setTitle:](alertController, "setTitle:", v6);

  }
  else if (-[FaceIdViewController isSuspended](self, "isSuspended") && self->_pearlUIState == 2)
  {
    self->_pearlUIState = 3;
    -[FaceIdViewController _presentToast](self, "_presentToast");
  }
  -[FaceIdViewController _setGlyphState:animated:](self, "_setGlyphState:animated:", 1, 1);
}

- (void)_handleNoMatchOrSensorInactive:(id)a3
{
  id v4;
  int64_t pearlUIState;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned int v10;
  int64_t v11;
  NSError *v12;
  NSError *underlyingError;
  int64_t v14;
  id v15;

  v4 = a3;
  pearlUIState = self->_pearlUIState;
  if (pearlUIState == 3 || pearlUIState == 0)
  {
    v15 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", &off_10007E270));
    v8 = objc_msgSend(v7, "BOOLValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", &off_10007E240));
    v10 = objc_msgSend(v9, "BOOLValue");

    if (+[LAUtils isLocationBasedPolicy:](LAUtils, "isLocationBasedPolicy:", -[TransitionViewController policy](self, "policy")))
    {
      if ((v8 & 1) != 0)
      {
        v11 = 6;
        if (v10)
          v11 = 4;
        self->_pearlUIState = v11;
        if ((v10 & 1) == 0)
        {
          v12 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", &off_10007E1C8));
          underlyingError = self->_underlyingError;
          self->_underlyingError = v12;

        }
        goto LABEL_17;
      }
      v14 = 2;
    }
    else
    {
      v14 = 4;
      if (!self->_pearlUIState)
        v14 = 2;
    }
    self->_pearlUIState = v14;
LABEL_17:
    -[FaceIdViewController _showFailAlert](self, "_showFailAlert");
    v4 = v15;
  }

}

- (void)_handleBioLockout:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  int64_t v11;
  NSError *v12;
  NSError *underlyingError;
  id v14;

  v4 = a3;
  v14 = v4;
  if ((unint64_t)(self->_pearlUIState - 5) >= 3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", &off_10007E240));
    v6 = objc_msgSend(v5, "BOOLValue");

    v7 = +[LAUtils isLocationBasedPolicy:](LAUtils, "isLocationBasedPolicy:", -[TransitionViewController policy](self, "policy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", &off_10007E228));
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v7 && (v6 & 1) == 0)
    {
      self->_pearlUIState = 6;
LABEL_9:
      v12 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", &off_10007E1C8));
      underlyingError = self->_underlyingError;
      self->_underlyingError = v12;

      goto LABEL_11;
    }
    if ((v7 & v6 & 1) == 0)
    {
      self->_pearlUIState = 5;
      goto LABEL_11;
    }
    v11 = 7;
    if (v10)
      v11 = 5;
    self->_pearlUIState = v11;
    if ((v11 & 2) != 0)
      goto LABEL_9;
  }
LABEL_11:
  -[FaceIdViewController _showFailAlert](self, "_showFailAlert");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  unint64_t v9;
  objc_super v10;
  _QWORD v11[5];
  _QWORD v12[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v9 = (unint64_t)objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v11[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000BB4C;
    v12[3] = &unk_100079D78;
    v12[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000BB94;
    v11[3] = &unk_100079D78;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v12, v11);
  }
  v10.receiver = self;
  v10.super_class = (Class)FaceIdViewController;
  -[FaceIdViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)_dismissCoachingViews
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = -[LAUIHorizontalArrowView isAnimating](self->_horizontalArrowView, "isAnimating");
  if ((_DWORD)v3)
  {
    v4 = LACLogFaceIDUI(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dismissing coaching views", v6, 2u);
    }

    -[LAUIHorizontalArrowView setAnimating:](self->_horizontalArrowView, "setAnimating:", 0);
  }
}

- (void)_processCoachingFeedback:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  FaceIdAlertViewController *alertController;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  int v27;
  int64_t v28;

  v5 = LACLogFaceIDUI(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100055B70(a3, (uint64_t)self, v6);

  if (self->_dismissed)
    a3 = 1;
  if (a3 == 10)
  {
    v7 = -[FaceIdViewController interfaceOrientation](self, "interfaceOrientation");
    if (v7 != (id)2)
    {
      v14 = LACLogFaceIDUI(v7);
      v9 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        v10 = "ignoring pose marginal coaching feedback because device is not upside down";
        v11 = v9;
        v12 = OS_LOG_TYPE_DEFAULT;
        v13 = 2;
        goto LABEL_14;
      }
LABEL_15:

      return;
    }
    if (self->_coachingFeedback != 10)
    {
      self->_coachingFeedback = 10;
      goto LABEL_20;
    }
LABEL_10:
    v8 = LACLogFaceIDUI(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v27 = 134217984;
      v28 = a3;
      v10 = "ignoring the same coaching feedback: %ld";
      v11 = v9;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v27, v13);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (a3 == self->_coachingFeedback)
    goto LABEL_10;
  self->_coachingFeedback = a3;
  if (a3 == 11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", &off_10007E228));
    if (objc_msgSend(v16, "BOOLValue")
      && !+[LAUtils isBiometricOnlyPolicy:](LAUtils, "isBiometricOnlyPolicy:", -[TransitionViewController policy](self, "policy")))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", &off_10007E198));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", &off_10007E1C8));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", &off_10007E270));
      v26 = objc_msgSend(v25, "BOOLValue");

      if ((v26 & 1) == 0)
      {
        -[TransitionViewController uiFallback](self, "uiFallback");
        return;
      }
    }
    else
    {

    }
  }
LABEL_20:
  alertController = self->_alertController;
  if (alertController)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdAlertViewController view](alertController, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "superview"));

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController view](self, "view"));
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIHorizontalArrowView superview](self->_horizontalArrowView, "superview"));

  if (v20 != v19)
  {
    -[LAUIHorizontalArrowView removeFromSuperview](self->_horizontalArrowView, "removeFromSuperview");
    objc_msgSend(v19, "addSubview:", self->_horizontalArrowView);
    objc_msgSend(v19, "bringSubviewToFront:", self->_horizontalArrowView);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController _coachingTextForFeedback:](self, "_coachingTextForFeedback:", a3));
  if (self->_pearlUIState)
  {
    -[FaceIdAlertViewController setTitle:](self->_alertController, "setTitle:", v21);
  }
  else
  {
    -[FaceIdToastViewController setTitleText:](self->_toastController, "setTitleText:", v21);
    -[FaceIdToastViewController viewDidLayoutSubviews](self->_toastController, "viewDidLayoutSubviews");
  }
  -[FaceIdViewController _updatePearlViews](self, "_updatePearlViews");

}

- (id)_coachingTextForFeedback:(int64_t)a3
{
  NSBundle *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  NSBundle *v7;
  NSBundle *v8;
  void *v9;

  if (a3 == 10)
  {
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v5 = v4;
    v6 = CFSTR("PEARL_COACHING_LOOK_DOWN");
  }
  else if (a3 == 8)
  {
    v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = v4;
    v6 = CFSTR("PEARL_COACHING_CAMERA_COVERED");
  }
  else
  {
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5 = v4;
    v6 = CFSTR("PEARL");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_10007CCD0, CFSTR("MobileUI")));

  return v9;
}

- (void)_destroyViewControllers
{
  LAUIPearlGlyphView *glyphView;
  uint64_t v4;
  NSObject *v5;
  LAUIPearlGlyphView *v6;
  LAUIPearlGlyphView *v7;
  LAUIHorizontalArrowView *horizontalArrowView;
  FaceIdToastViewController *toastController;
  FaceIdAlertViewController *alertController;
  int v11;
  LAUIPearlGlyphView *v12;

  glyphView = self->_glyphView;
  if (glyphView)
  {
    -[LAUIPearlGlyphView setPaused:](glyphView, "setPaused:", 1);
    -[LAUIPearlGlyphView purgeBuffers](self->_glyphView, "purgeBuffers");
    v4 = LACLogFaceIDUI(-[LAUIPearlGlyphView removeFromSuperview](self->_glyphView, "removeFromSuperview"));
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = self->_glyphView;
      v11 = 138412290;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "glyph destroyed: %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = self->_glyphView;
    self->_glyphView = 0;

  }
  horizontalArrowView = self->_horizontalArrowView;
  self->_horizontalArrowView = 0;

  toastController = self->_toastController;
  self->_toastController = 0;

  alertController = self->_alertController;
  self->_alertController = 0;

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C2EC;
  v9[3] = &unk_100079DA0;
  objc_copyWeak(&v11, &location);
  v7 = v6;
  v10 = v7;
  v8.receiver = self;
  v8.super_class = (Class)FaceIdViewController;
  -[FaceIdViewController dismissViewControllerAnimated:completion:](&v8, "dismissViewControllerAnimated:completion:", v4, v9);
  self->_dismissed = 1;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  double v7;
  _QWORD v8[5];
  _QWORD *v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C4F4;
  v12[3] = &unk_100079DA0;
  objc_copyWeak(&v14, &location);
  v5 = v4;
  v13 = v5;
  v6 = objc_retainBlock(v12);
  if (!self->_dismissed && (self->_toastController || self->_alertController))
  {
    if (self->_pearlUIState == 1)
      v7 = 1.0;
    else
      v7 = 0.0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C53C;
    v8[3] = &unk_100079DF0;
    objc_copyWeak(&v10, &location);
    v8[4] = self;
    v9 = v6;
    -[FaceIdViewController _dismissAlertWithDelay:temporarily:completion:](self, "_dismissAlertWithDelay:temporarily:completion:", 0, v8, v7);

    objc_destroyWeak(&v10);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)FaceIdViewController;
    -[TransitionViewController dismissChildWithCompletionHandler:](&v11, "dismissChildWithCompletionHandler:", v6);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_dismissToastWithDelay:(double)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  FaceIdToastViewController *toastController;
  void (**v8)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  toastController = self->_toastController;
  if (toastController)
  {
    v8 = v6;
    -[FaceIdToastViewController dismissWithDelay:completion:](toastController, "dismissWithDelay:completion:", v6, a3);
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  if (v6)
  {
    v8 = v6;
    v6[2](v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_dismissAlertWithDelay:(double)a3 temporarily:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD, double);
  FaceIdAlertViewController *alertController;
  FaceIdAlertViewController *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD, double);
  id v13;
  id location;

  v5 = a4;
  v8 = (void (**)(_QWORD, double))a5;
  -[FaceIdViewController setDismissingTemporarily:](self, "setDismissingTemporarily:", v5);
  if (self->_alertController)
  {
    objc_initWeak(&location, self);
    alertController = self->_alertController;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000C7A8;
    v11[3] = &unk_100079E18;
    v12 = v8;
    objc_copyWeak(&v13, &location);
    -[FaceIdAlertViewController dismissWithDelay:completion:](alertController, "dismissWithDelay:completion:", v11, a3);
    v10 = self->_alertController;
    self->_alertController = 0;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else if (v8)
  {
    v8[2](v8, a3);
  }

}

- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4
{
  FaceIdToastViewController *toastController;
  LAUIPearlGlyphView *glyphView;

  toastController = self->_toastController;
  if (toastController)
  {
    -[FaceIdToastViewController setGlyphState:animated:](toastController, "setGlyphState:animated:");
  }
  else
  {
    glyphView = self->_glyphView;
    if (glyphView)
    {
      if (-[LAUIPearlGlyphView state](glyphView, "state") != (id)a3)
        -[LAUIPearlGlyphView setState:animated:withCompletion:](self->_glyphView, "setState:animated:withCompletion:");
    }
  }
}

- (void)_updatePearlViews
{
  LAUIHorizontalArrowView *horizontalArrowView;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  id v13;
  LAUIHorizontalArrowView *v14;
  LAUIHorizontalArrowView *v15;
  uint64_t v16;
  LAUIHorizontalArrowView *v17;
  _BOOL8 v18;
  CGRect v19;
  CGRect v20;

  -[LAUIPhysicalButtonView updateFrame](self->_physicalButtonView, "updateFrame");
  horizontalArrowView = self->_horizontalArrowView;
  if (horizontalArrowView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIHorizontalArrowView superview](horizontalArrowView, "superview"));
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = +[LACMobileGestalt faceIDCameraOrientation](LACMobileGestalt, "faceIDCameraOrientation");
    switch((unint64_t)-[FaceIdViewController interfaceOrientation](self, "interfaceOrientation"))
    {
      case 1uLL:
        v14 = self->_horizontalArrowView;
        if (v13 != (id)2)
          goto LABEL_11;
        goto LABEL_12;
      case 2uLL:
        v14 = self->_horizontalArrowView;
        if (v13 != (id)2)
          goto LABEL_11;
        goto LABEL_9;
      case 3uLL:
        v14 = self->_horizontalArrowView;
        if (v13 == (id)2)
          goto LABEL_11;
LABEL_9:
        v19.origin.x = v6;
        v19.origin.y = v8;
        v19.size.width = v10;
        v19.size.height = v12;
        -[LAUIHorizontalArrowView setCenter:](v14, "setCenter:", 80.0, CGRectGetMidY(v19));
        v15 = self->_horizontalArrowView;
        v16 = 0;
        goto LABEL_13;
      case 4uLL:
        v14 = self->_horizontalArrowView;
        if (v13 == (id)2)
        {
LABEL_11:
          v17 = v14;
          v18 = 0;
        }
        else
        {
LABEL_12:
          v20.origin.x = v6;
          v20.origin.y = v8;
          v20.size.width = v10;
          v20.size.height = v12;
          -[LAUIHorizontalArrowView setCenter:](v14, "setCenter:", v10 + -80.0, CGRectGetMidY(v20));
          v15 = self->_horizontalArrowView;
          v16 = 1;
LABEL_13:
          -[LAUIHorizontalArrowView setDirection:](v15, "setDirection:", v16);
          v18 = self->_coachingFeedback == 8;
          v17 = self->_horizontalArrowView;
        }
        -[LAUIHorizontalArrowView setAnimating:](v17, "setAnimating:", v18);
        break;
      default:
        return;
    }
  }
}

- (BOOL)processHomeButtonPressed
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  int v8;
  FaceIdViewController *v9;

  if (!sub_10001CAC8() || (id)-[TransitionViewController policy](self, "policy") != (id)1004)
    return 0;
  v3 = LACLogFaceIDUI(1004);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ recognized home gesture in Jindo for Stockholm", (uint8_t *)&v8, 0xCu);
  }

  -[FaceIdViewController uiEvent:options:](self, "uiEvent:options:", 10, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdViewController toastController](self, "toastController"));
  v6 = 1;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, &stru_100079E78);

  return v6;
}

- (BOOL)isUiReady
{
  return 0;
}

- (void)uiEvent:(int64_t)a3 options:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FaceIdViewController;
  -[TransitionViewController uiEvent:options:](&v6, "uiEvent:options:", a3, a4);
  if (sub_10001C8C8())
  {
    if ((a3 | 4) == 6)
      -[FaceIdViewController _dismissAlertWithDelay:temporarily:completion:](self, "_dismissAlertWithDelay:temporarily:completion:", a3 == 6, 0, 0.0);
  }
}

- (int64_t)pearlUIState
{
  return self->_pearlUIState;
}

- (void)setPearlUIState:(int64_t)a3
{
  self->_pearlUIState = a3;
}

- (FaceIdToastViewController)toastController
{
  return self->_toastController;
}

- (void)setToastController:(id)a3
{
  objc_storeStrong((id *)&self->_toastController, a3);
}

- (LAUIPearlGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphView, a3);
}

- (FaceIdAlertViewController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (ScreenDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (BOOL)dismissingTemporarily
{
  return self->_dismissingTemporarily;
}

- (void)setDismissingTemporarily:(BOOL)a3
{
  self->_dismissingTemporarily = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_toastController, 0);
  objc_storeStrong((id *)&self->_horizontalArrowView, 0);
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
}

@end
