@implementation WFBannerViewController

- (WFBannerViewController)initWithDelegate:(id)a3 associatedRunningContext:(id)a4
{
  id v6;
  id v7;
  WFBannerViewController *v8;
  WFBannerViewController *v9;
  uint64_t v10;
  BNBannerSource *bannerSource;
  void *v12;
  WFBannerViewController *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFBannerViewController;
  v8 = -[WFBannerViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_associatedRunningContext, a4);
    objc_storeWeak((id *)&v9->_delegate, v6);
    v10 = objc_claimAutoreleasedReturnValue(+[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:](BNBannerSource, "bannerSourceForDestination:forRequesterIdentifier:", 0, VCBundleIdentifierShortcutsUI));
    bannerSource = v9->_bannerSource;
    v9->_bannerSource = (BNBannerSource *)v10;

    -[BNBannerSource setDelegate:](v9->_bannerSource, "setDelegate:", v9);
    v9->_viewIsAppearingCalled = 0;
    v9->_viewWillAppearCalled = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, "updateHomeGestureOwnership", WFBannerShouldUpdateHomeGestureOwnershipNotification, 0);

    v13 = v9;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController systemIdleTimerOverrideAssertion](self, "systemIdleTimerOverrideAssertion"));
  objc_msgSend(v3, "invalidate");

  -[WFBannerViewController stopObservingKeyboard](self, "stopObservingKeyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, WFBannerShouldUpdateHomeGestureOwnershipNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)WFBannerViewController;
  -[WFBannerViewController dealloc](&v5, "dealloc");
}

- (void)loadView
{
  WFTouchCapturingView *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFBannerViewController;
  -[WFBannerViewController loadView](&v10, "loadView");
  v3 = objc_alloc_init(WFTouchCapturingView);
  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_100012270;
  v7 = &unk_100034938;
  objc_copyWeak(&v8, &location);
  -[WFTouchCapturingView setTouchCapturedHandler:](v3, "setTouchCapturedHandler:", &v4);
  -[WFBannerViewController setView:](self, "setView:", v3, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  objc_super v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)WFBannerViewController;
  -[WFBannerViewController viewWillAppear:](&v30, "viewWillAppear:", a3);
  -[WFBannerViewController setViewWillAppearCalled:](self, "setViewWillAppearCalled:", 1);
  -[WFBannerViewController resetLocalIdleTimer](self, "resetLocalIdleTimer");
  -[WFBannerViewController bannerSize](self, "bannerSize");
  -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
  v5 = objc_msgSend(v4, "bannerFramesEnabled");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.9)));
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
    objc_msgSend(v13, "setBorderWidth:", 2.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "colorWithAlphaComponent:", 0.9)));
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v17, "CGColor"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    objc_msgSend(v19, "setBorderWidth:", 1.0);

    v20 = objc_alloc((Class)UILabel);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
    objc_msgSend(v21, "frame");
    v22 = objc_msgSend(v20, "initWithFrame:", 0.0, 0.0);

    objc_msgSend(v22, "setAutoresizingMask:", 8);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    objc_msgSend(v22, "setBackgroundColor:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    objc_msgSend(v22, "setTextColor:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 8.0, UIFontWeightSemibold));
    objc_msgSend(v22, "setFont:", v25);

    v29.receiver = self;
    v29.super_class = (Class)WFBannerViewController;
    v26 = -[WFBannerViewController description](&v29, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend(v22, "setText:", v27);

    objc_msgSend(v22, "setAlpha:", 0.9);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
    objc_msgSend(v28, "addSubview:", v22);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFBannerViewController;
  -[WFBannerViewController viewIsAppearing:](&v6, "viewIsAppearing:", a3);
  -[WFBannerViewController setViewIsAppearingCalled:](self, "setViewIsAppearingCalled:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController viewIsAppearingHandler](self, "viewIsAppearingHandler"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[WFBannerViewController viewIsAppearingHandler](self, "viewIsAppearingHandler"));
    v5[2]();

  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFBannerViewController;
  -[WFBannerViewController viewDidLoad](&v3, "viewDidLoad");
  -[WFBannerViewController beginObservingKeyboard](self, "beginObservingKeyboard");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  __int128 v9;
  _BOOL4 v10;
  CGAffineTransform v11;
  CGAffineTransform t1;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFBannerViewController;
  -[WFBannerViewController viewWillLayoutSubviews](&v13, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
  objc_msgSend(v3, "frame");
  v6 = v5 == CGPointZero.y && v4 == CGPointZero.x;

  if (v6 == -[WFBannerViewController bannerIsFullScreen](self, "bannerIsFullScreen"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v11.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v11.c = v9;
    *(_OWORD *)&v11.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v10 = CGAffineTransformEqualToTransform(&t1, &v11);

    if (v10)
      -[WFBannerViewController updateContainerViewFrameAnimated:](self, "updateContainerViewFrameAnimated:", 0);
  }
  -[WFBannerViewController bannerSize](self, "bannerSize");
  -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[WFBannerViewController layoutEmbeddedPlatter](self, "layoutEmbeddedPlatter");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController localIdleTimer](self, "localIdleTimer", a3));
  objc_msgSend(v4, "cancel");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerViewController systemIdleTimerOverrideAssertion](self, "systemIdleTimerOverrideAssertion"));
  objc_msgSend(v5, "invalidate");

}

- (NSString)description
{
  unint64_t v3;
  uint64_t v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = -[WFBannerViewController dismissalPhase](self, "dismissalPhase");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = (uint64_t)*(&off_100034B38 + v3);
  v12.receiver = self;
  v12.super_class = (Class)WFBannerViewController;
  v5 = -[WFBannerViewController description](&v12, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentedViewController](self, "presentedViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController queuedStatusPlatter](self, "queuedStatusPlatter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@, embedded platter: %@, presented VC: %@, queuedStatusPlatter: %@, dismissalPhase: %@>"), v6, v7, v8, v9, v4));

  return (NSString *)v10;
}

- (void)setRootModalViewController:(id)a3
{
  id v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_rootModalViewController, a3);
  if (!v5)
  {
    v6 = dispatch_time(0, 300000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012248;
    block[3] = &unk_100034BE8;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setEmbeddedPlatter:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  WFBannerGesture *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  char isKindOfClass;
  double v46;
  _QWORD v47[4];
  _QWORD *v48;
  id v49;
  id location;
  _QWORD v51[5];
  void *v52;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));

  if (v6 != v5)
  {
    -[WFBannerViewController setQueuedStatusPlatter:](self, "setQueuedStatusPlatter:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    objc_storeStrong((id *)&self->_embeddedPlatter, a3);
    objc_msgSend(v5, "setPlatterContentContainer:", self);
    objc_msgSend(v7, "setPlatterContentContainer:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));

    if (v8)
    {
      -[WFBannerViewController updateDimmingLayerVisibility](self, "updateDimmingLayerVisibility");
    }
    else
    {
      v9 = objc_opt_new(UIView);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
      objc_msgSend(v10, "addSubview:", v9);

      -[WFBannerViewController setContainerView:](self, "setContainerView:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterGaussianBlur));
      objc_msgSend(v11, "setName:", CFSTR("gaussianBlur"));
      objc_msgSend(v11, "setValue:forKey:", &off_100036F38, kCAFilterInputRadius);
      objc_msgSend(v11, "setValue:forKey:", &__kCFBooleanFalse, kCAFilterInputNormalizeEdges);
      objc_msgSend(v11, "setValue:forKey:", &__kCFBooleanFalse, kCAFilterInputHardEdges);
      objc_msgSend(v11, "setValue:forKey:", CFSTR("default"), kCAFilterInputQuality);
      objc_msgSend(v11, "setValue:forKey:", CFSTR("default"), kCAFilterInputIntermediateBitDepth);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
      v52 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
      objc_msgSend(v13, "setFilters:", v14);

      v15 = objc_opt_new(UIView);
      -[UIView setAutoresizingMask:](v15, "setAutoresizingMask:", 18);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
      LODWORD(v14) = objc_msgSend(v16, "shadowDebuggingEnabled");

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v15, "layer"));
      v18 = v17;
      if ((_DWORD)v14)
      {
        objc_msgSend(v17, "setShadowRadius:", 2.0);

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v15, "layer"));
        LODWORD(v20) = 1.0;
      }
      else
      {
        objc_msgSend(v17, "setShadowRadius:", 40.0);

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v15, "layer"));
        LODWORD(v20) = 1050253722;
      }
      objc_msgSend(v19, "setShadowOpacity:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v15, "layer"));
      objc_msgSend(v21, "setShadowOffset:", CGSizeZero.width, CGSizeZero.height);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v15, "layer"));
      objc_msgSend(v22, "setPunchoutShadow:", 1);

      -[UIView addSubview:](v9, "addSubview:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTMaterialView materialViewWithRecipe:options:initialWeighting:](MTMaterialView, "materialViewWithRecipe:options:initialWeighting:", 53, 0, 1.0));
      objc_msgSend(v23, "setAutoresizingMask:", 18);
      objc_msgSend(v23, "setUserInteractionEnabled:", 1);
      objc_msgSend(v23, "setClipsToBounds:", 1);
      -[UIView addSubview:](v15, "addSubview:", v23);
      -[WFBannerViewController setMaterialView:](self, "setMaterialView:", v23);
      v24 = -[WFBannerGesture initWithView:]([WFBannerGesture alloc], "initWithView:", v9);
      -[WFBannerViewController setBannerGesture:](self, "setBannerGesture:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController bannerGesture](self, "bannerGesture"));
      objc_msgSend(v25, "setDelegate:", self);

      -[UIView setAlpha:](v9, "setAlpha:", 0.0);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100011D74;
      v51[3] = &unk_100034BE8;
      v51[4] = self;
      v26 = objc_retainBlock(v51);
      if (-[WFBannerViewController viewIsAppearingCalled](self, "viewIsAppearingCalled"))
      {
        ((void (*)(_QWORD *))v26[2])(v26);
        -[WFBannerViewController updateDimmingLayerVisibility](self, "updateDimmingLayerVisibility");
      }
      else
      {
        objc_initWeak(&location, self);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100011FFC;
        v47[3] = &unk_100034960;
        objc_copyWeak(&v49, &location);
        v48 = v26;
        -[WFBannerViewController setViewIsAppearingHandler:](self, "setViewIsAppearingHandler:", v47);

        objc_destroyWeak(&v49);
        objc_destroyWeak(&location);
      }

    }
    -[WFBannerViewController setDismissalPhase:](self, "setDismissalPhase:", 0);
    -[WFBannerViewController layoutEmbeddedPlatter](self, "layoutEmbeddedPlatter");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController bannerGesture](self, "bannerGesture"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scrollView"));
    objc_msgSend(v27, "setEmbeddedScrollView:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v29, "setAutoresizingMask:", 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platterView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "attribution"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "title"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("junior_attribution: %@"), v33));
    objc_msgSend(v30, "setAccessibilityIdentifier:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController materialView](self, "materialView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v35, "addSubview:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platterView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "attribution"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "title"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platterView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "attribution"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "icon"));
    -[WFBannerViewController setAttributionTitle:icon:previouslyHidden:](self, "setAttributionTitle:icon:previouslyHidden:", v39, v42, objc_msgSend(v7, "shouldHideSashView"));

    if (v7)
    {
      -[WFBannerViewController fluidTransitionFromPlatter:toPlatter:](self, "fluidTransitionFromPlatter:toPlatter:", v7, v5);
      -[WFBannerViewController updateDimmingLayerVisibility](self, "updateDimmingLayerVisibility");
      -[WFBannerViewController resetLocalIdleTimer](self, "resetLocalIdleTimer");
    }
    else
    {
      -[WFBannerViewController updateContainerViewFrameAnimated:](self, "updateContainerViewFrameAnimated:", 0);
    }
    v44 = objc_opt_class(WFEntityPickerDialogViewController, v43);
    isKindOfClass = objc_opt_isKindOfClass(v5, v44);
    v46 = 39.0;
    if ((isKindOfClass & 1) != 0)
      v46 = 34.0;
    -[WFBannerViewController setPlatterCornerRadius:](self, "setPlatterCornerRadius:", v46);

  }
}

- (void)fluidTransitionFromPlatter:(id)a3 toPlatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  id v16;
  WFBannerViewController *v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  -[WFBannerViewController setActiveEmbeddedPlatterUpdateCount:](self, "setActiveEmbeddedPlatterUpdateCount:", (char *)-[WFBannerViewController activeEmbeddedPlatterUpdateCount](self, "activeEmbeddedPlatterUpdateCount") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platterView"));
  objc_msgSend(v8, "setAlpha:", 0.0);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100011AEC;
  v18[3] = &unk_100034BE8;
  v19 = v6;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011B20;
  v14[3] = &unk_100034988;
  v9 = v19;
  v15 = v9;
  v10 = v7;
  v16 = v10;
  v17 = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 65538, v18, v14, 0.09, 0.0);
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100011BF4;
    v13[3] = &unk_100034BE8;
    v13[4] = self;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v13, 0, 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    -[WFBannerViewController performBumpAnimation](self, "performBumpAnimation");
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011C28;
  v12[3] = &unk_100034BE8;
  v12[4] = self;
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v12, 0, 1.0, 0.35, 0.0, 0.0, 0.0, 0.0, 0.0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011CB4;
  v11[3] = &unk_100034BE8;
  v11[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v11, 0, 0.2, 0.0);

}

- (void)performBumpAnimation
{
  void *v3;
  __int128 v4;
  dispatch_time_t v5;
  _QWORD block[5];
  CGAffineTransform v7;
  _OWORD v8[3];
  _QWORD v9[5];
  CGAffineTransform v10;
  CGAffineTransform v11;

  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 1.035, 1.035);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011988;
  v9[3] = &unk_1000349B0;
  v9[4] = self;
  v10 = v11;
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v9, 0, 1.0, 0.3, 0.0, 0.0, 0.0, 0.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v3, "setTransform:", v8);

  v5 = dispatch_time(0, 125000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000119D8;
  block[3] = &unk_1000349B0;
  block[4] = self;
  v7 = v11;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateContainerViewFrameAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  unint64_t v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  id v101;
  _QWORD v102[4];
  id v103;
  id v104;
  _QWORD v105[4];
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  uint64_t v114;
  _QWORD v115[4];
  id v116;
  id v117;
  _QWORD v118[4];
  id v119;
  _QWORD v120[4];
  id v121;
  unint64_t v122;
  _QWORD v123[10];
  CGRect v124;
  CGRect v125;

  v3 = a3;
  if (!-[WFBannerViewController shouldFreezePlatterLayout](self, "shouldFreezePlatterLayout"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
    objc_msgSend(v5, "layoutIfNeeded");

    -[WFBannerViewController layoutDimmingLayer](self, "layoutDimmingLayer");
    -[WFBannerViewController platterContentSize](self, "platterContentSize");
    v7 = v6;
    v9 = v8;
    -[WFBannerViewController sashViewHeight](self, "sashViewHeight");
    v11 = v10;
    v12 = 0.0;
    v13 = 0.0;
    if (-[WFBannerViewController bannerIsFullScreen](self, "bannerIsFullScreen"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController layoutDescription](self, "layoutDescription"));
      objc_msgSend(v14, "containerSize");
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController layoutDescription](self, "layoutDescription"));
      objc_msgSend(v17, "presentationSize");
      v13 = (v16 - v18) * 0.5;

    }
    if (-[WFBannerViewController bannerIsFullScreen](self, "bannerIsFullScreen"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController layoutDescription](self, "layoutDescription"));
      objc_msgSend(v19, "offsetFromPresentationEdge");
      v12 = v20;

    }
    v21 = v9 + v11;
    if (!v3)
      goto LABEL_8;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
    objc_msgSend(v22, "bounds");
    v125.origin.x = CGRectZero.origin.x;
    v125.origin.y = CGRectZero.origin.y;
    v125.size.width = CGRectZero.size.width;
    v125.size.height = CGRectZero.size.height;
    v23 = CGRectEqualToRect(v124, v125);

    if (v23)
    {
LABEL_8:
      v100 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
      objc_msgSend(v100, "setFrame:", v13, v12, v7, v21);

      return;
    }
    v123[0] = _NSConcreteStackBlock;
    v123[1] = 3221225472;
    v123[2] = sub_1000115EC;
    v123[3] = &unk_1000349D8;
    v123[4] = self;
    *(double *)&v123[5] = v13;
    *(double *)&v123[6] = v12;
    *(double *)&v123[7] = v7;
    *(double *)&v123[8] = v21;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v123, 0, 1.0, 0.3, 0.0, 0.0, 0.0, 0.0, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterViewAwaitingTransition](self, "platterViewAwaitingTransition"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "actionGroupView"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "platterView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "actionGroupView"));

    if (v25 == v28)
      goto LABEL_21;
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "actions"));
    v30 = objc_msgSend(v29, "count");
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "actions"));
    if (v30 == objc_msgSend(v31, "count"))
    {
      objc_msgSend(v25, "bounds");
      v33 = v32;
      v35 = v34;
      objc_msgSend(v28, "bounds");
      v37 = v36;
      v39 = v38;

      if (v33 != v37 || v35 != v39)
        goto LABEL_21;
      objc_msgSend(v25, "bounds");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
      objc_msgSend(v25, "convertRect:toView:", v48, v41, v43, v45, v47);
      v50 = v49;
      v52 = v51;
      v54 = v53;
      v98 = v55;

      objc_msgSend(v28, "bounds");
      v57 = v56;
      v59 = v58;
      v61 = v60;
      v63 = v62;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController containerView](self, "containerView"));
      v65 = v57;
      v66 = v50;
      objc_msgSend(v28, "convertRect:toView:", v64, v65, v59, v61, v63);
      v68 = v67;
      v70 = v69;
      v72 = v71;
      v99 = v73;

      objc_msgSend(v28, "setHidden:", 1);
      v74 = v50;
      v75 = v98;
      objc_msgSend(v25, "setFrame:", v74, v52, v54);
      objc_msgSend(v25, "setAutoresizingMask:", 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController materialView](self, "materialView"));
      objc_msgSend(v76, "addSubview:", v25);

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterViewAwaitingTransition](self, "platterViewAwaitingTransition"));
      objc_msgSend(v77, "setActionGroupView:", 0);

      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "actions"));
      v79 = objc_msgSend(v78, "count");

      if (v79)
      {
        v80 = 0;
        v101 = v28;
        do
        {
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "arrangedSubviews", v98));
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectAtIndexedSubscript:", v80));

          objc_msgSend(v82, "removeTarget:action:forControlEvents:", 0, 0, 64);
          v120[0] = _NSConcreteStackBlock;
          v120[1] = 3221225472;
          v120[2] = sub_100011784;
          v120[3] = &unk_100034A00;
          v83 = v28;
          v121 = v83;
          v122 = v80;
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v120));
          objc_msgSend(v82, "addAction:forControlEvents:", v84, 64);

          v85 = v25;
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "actions"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectAtIndexedSubscript:", v80));
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "dialogButton"));
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "title"));

          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "actions"));
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectAtIndexedSubscript:", v80));
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "dialogButton"));
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "title"));

          if ((objc_msgSend(v93, "isEqualToString:", v89) & 1) == 0)
          {
            v118[0] = _NSConcreteStackBlock;
            v118[1] = 3221225472;
            v118[2] = sub_1000117D4;
            v118[3] = &unk_100034BE8;
            v119 = v82;
            v115[0] = _NSConcreteStackBlock;
            v115[1] = 3221225472;
            v115[2] = sub_100011808;
            v115[3] = &unk_100034A28;
            v116 = v119;
            v117 = v93;
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v118, v115, 0.125, 0.0);

          }
          ++v80;
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "actions"));
          v95 = objc_msgSend(v94, "count");

          v28 = v101;
          v25 = v85;
        }
        while (v80 < (unint64_t)v95);
      }
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = sub_100011684;
      v105[3] = &unk_100034A50;
      v106 = v25;
      v107 = v68;
      v108 = v70;
      v109 = v72;
      v110 = v99;
      v111 = v66;
      v112 = v52;
      v113 = v54;
      v114 = v75;
      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472;
      v102[2] = sub_100011758;
      v102[3] = &unk_100034A78;
      v103 = v106;
      v104 = v28;
      +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v105, v102, 1.0, 0.3, 0.0, 0.0, 0.0, 0.0, 0.0);

      v29 = v106;
    }
    else
    {

    }
LABEL_21:
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter", v98));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "platterView"));
    -[WFBannerViewController setPlatterViewAwaitingTransition:](self, "setPlatterViewAwaitingTransition:", v97);

  }
}

- (void)layoutEmbeddedPlatter
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));

  if (v3)
  {
    -[WFBannerViewController platterContentSize](self, "platterContentSize");
    v5 = v4;
    v7 = v6;
    -[WFBannerViewController sashViewHeight](self, "sashViewHeight");
    v9 = v8;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v10, "setFrame:", 0.0, v9, v5, v7);

  }
}

- (void)performLayoutUpdate
{
  -[WFBannerViewController bannerSize](self, "bannerSize");
  -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[WFBannerViewController updateContainerViewFrameAnimated:](self, "updateContainerViewFrameAnimated:", 0);
}

- (void)setPlatterCornerRadius:(double)a3
{
  double v5;
  double v6;
  double v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD *v11;
  _QWORD v12[6];

  -[WFBannerViewController platterCornerRadius](self, "platterCornerRadius");
  if (v5 != a3)
  {
    -[WFBannerViewController platterCornerRadius](self, "platterCornerRadius");
    v7 = v6;
    self->_platterCornerRadius = a3;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000115A0;
    v12[3] = &unk_100034AA0;
    v12[4] = self;
    *(double *)&v12[5] = a3;
    v8 = objc_retainBlock(v12);
    v9 = v8;
    if (v7 == 0.0)
    {
      ((void (*)(_QWORD *))v8[2])(v8);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000115E0;
      v10[3] = &unk_100034EE8;
      v11 = v8;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, 0.2);

    }
  }
}

- (void)setAttributionTitle:(id)a3 icon:(id)a4 previouslyHidden:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD v30[4];
  _QWORD *v31;
  _QWORD v32[5];
  _QWORD v33[4];
  _QWORD *v34;
  _QWORD v35[6];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000112A0;
  v35[3] = &unk_100034AC8;
  v35[4] = self;
  v10 = objc_retainBlock(v35);
  if (-[WFBannerViewController shouldDisplaySash](self, "shouldDisplaySash"))
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10001134C;
    v32[3] = &unk_100034BE8;
    v32[4] = self;
    v11 = objc_retainBlock(v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController sashView](self, "sashView"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController sashView](self, "sashView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
      v15 = objc_msgSend(v14, "isEqualToString:", v8);

      if ((v15 & 1) == 0)
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100011498;
        v30[3] = &unk_100034EE8;
        v31 = v10;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000114A8;
        v24[3] = &unk_100034AF0;
        v24[4] = self;
        v25 = v9;
        v26 = v8;
        v27 = v11;
        v29 = 0x3FC0000000000000;
        v28 = v31;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v30, v24, 0.125, 0.0);

      }
      if (!v5)
        goto LABEL_11;
    }
    else
    {
      v16 = objc_msgSend(objc_alloc((Class)WFCompactPlatterSashView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[WFBannerViewController setSashView:](self, "setSashView:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController sashView](self, "sashView"));
      objc_msgSend(v17, "setAutoresizesSubviews:", 1);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController sashView](self, "sashView"));
      objc_msgSend(v18, "setIcon:", v9);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController sashView](self, "sashView"));
      objc_msgSend(v19, "setTitle:", v8);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController materialView](self, "materialView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController sashView](self, "sashView"));
      objc_msgSend(v20, "addSubview:", v21);

      ((void (*)(_QWORD *))v11[2])(v11);
      if (!v5)
      {
LABEL_11:

        goto LABEL_12;
      }
      ((void (*)(_QWORD *, _QWORD))v10[2])(v10, 0);
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100011580;
    v22[3] = &unk_100034EE8;
    v23 = v10;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v22, 0, 0.125, 0.125);

    goto LABEL_11;
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001133C;
  v33[3] = &unk_100034EE8;
  v34 = v10;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v33, 0, 0.125, 0.0);

LABEL_12:
}

- (void)setQueuedStatusPlatter:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  WFBannerViewController *v15;
  id v16;

  v5 = a3;
  objc_storeStrong((id *)&self->_queuedStatusPlatter, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController queuedStatusPlatterTimer](self, "queuedStatusPlatterTimer"));
  objc_msgSend(v6, "cancel");

  -[WFBannerViewController setQueuedStatusPlatterTimer:](self, "setQueuedStatusPlatterTimer:", 0);
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    if (v7)
    {
      v8 = objc_alloc((Class)WFDispatchSourceTimer);
      v11 = _NSConcreteStackBlock;
      v12 = 3221225472;
      v13 = sub_100011298;
      v14 = &unk_100034BC0;
      v15 = self;
      v16 = v5;
      v9 = objc_msgSend(v8, "initWithInterval:queue:handler:", &_dispatch_main_q, &v11, 0.2);
      -[WFBannerViewController setQueuedStatusPlatterTimer:](self, "setQueuedStatusPlatterTimer:", v9, v11, v12, v13, v14, v15);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController queuedStatusPlatterTimer](self, "queuedStatusPlatterTimer"));
      objc_msgSend(v10, "start");

    }
    else
    {
      -[WFBannerViewController setEmbeddedPlatter:](self, "setEmbeddedPlatter:", v5);
    }

  }
}

- (void)setDismissalPhase:(unint64_t)a3
{
  void *v4;
  _QWORD block[5];

  self->_dismissalPhase = a3;
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011264;
    block[3] = &unk_100034BE8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dismissalCompletionTimer](self, "dismissalCompletionTimer"));
    objc_msgSend(v4, "cancel");

    -[WFBannerViewController setDismissalCompletionTimer:](self, "setDismissalCompletionTimer:", 0);
  }
}

- (void)dismissEmbeddedPlatterWithCompletion:(id)a3 interruptible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  id v10;
  id v11;
  _QWORD *v12;
  double v13;
  dispatch_time_t v14;
  double v15;
  dispatch_time_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  WFBannerViewController *v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD *v29;
  _QWORD block[5];
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100010858;
  v34[3] = &unk_100034BC0;
  v34[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitionSettings"));
  v35 = v8;
  v9 = objc_retainBlock(v34);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000108C4;
  v31[3] = &unk_100034C30;
  v31[4] = self;
  v10 = v8;
  v32 = v10;
  v11 = v7;
  v33 = v11;
  v12 = objc_retainBlock(v31);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001096C;
  block[3] = &unk_100034BE8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v4)
  {
    -[WFBannerViewController setDismissalPhase:](self, "setDismissalPhase:", 1);
    ((void (*)(_QWORD *))v9[2])(v9);
    objc_msgSend(v10, "hintDuration");
    v14 = dispatch_time(0, (uint64_t)(v13 / 1000.0 * 1000000000.0));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000109B8;
    v28[3] = &unk_100034C80;
    v28[4] = self;
    v29 = v12;
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v28);

    v15 = 1.0;
  }
  else
  {
    ((void (*)(_QWORD *))v12[2])(v12);
    v15 = 0.3;
  }
  v16 = dispatch_time(0, 200000000);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000109F8;
  v27[3] = &unk_100034BE8;
  v27[4] = self;
  dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, v27);

  v17 = objc_alloc((Class)WFDispatchSourceTimer);
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_100010A00;
  v24 = &unk_100034C80;
  v25 = self;
  v26 = v6;
  v18 = v6;
  v19 = objc_msgSend(v17, "initWithInterval:queue:handler:", &_dispatch_main_q, &v21, v15);
  -[WFBannerViewController setDismissalCompletionTimer:](self, "setDismissalCompletionTimer:", v19, v21, v22, v23, v24, v25);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dismissalCompletionTimer](self, "dismissalCompletionTimer"));
  objc_msgSend(v20, "start");

}

- (void)resetLocalIdleTimer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  uint64_t v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController systemIdleTimerOverrideAssertion](self, "systemIdleTimerOverrideAssertion"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ITIdleTimerState sharedInstance](ITIdleTimerState, "sharedInstance"));
    v14 = 0;
    v5 = objc_msgSend(v4, "newAssertionToDisableIdleTimerForReason:error:", CFSTR("Shortcut is running, overriding lock screen idle timer."), &v14);

    -[WFBannerViewController setSystemIdleTimerOverrideAssertion:](self, "setSystemIdleTimerOverrideAssertion:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController localIdleTimer](self, "localIdleTimer"));
  objc_msgSend(v6, "cancel");

  objc_initWeak(&location, self);
  v7 = objc_alloc((Class)WFDispatchSourceTimer);
  v8 = &_dispatch_main_q;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000107E4;
  v11[3] = &unk_100034938;
  objc_copyWeak(&v12, &location);
  v9 = objc_msgSend(v7, "initWithInterval:queue:handler:", &_dispatch_main_q, v11, 30.0);
  -[WFBannerViewController setLocalIdleTimer:](self, "setLocalIdleTimer:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController localIdleTimer](self, "localIdleTimer"));
  objc_msgSend(v10, "start");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)bannerIsFullScreen
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentedViewController](self, "presentedViewController"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (CGSize)bannerSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (-[WFBannerViewController bannerIsFullScreen](self, "bannerIsFullScreen"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentingScreen](self, "presentingScreen"));
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    -[WFBannerViewController platterContentSize](self, "platterContentSize");
    v5 = v8;
    v7 = 1.0;
  }
  v9 = v5;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)platterContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController layoutDescription](self, "layoutDescription"));
  objc_msgSend(v3, "containerSize");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
  +[WFCompactPlatterPresentationController presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:](WFCompactPlatterPresentationController, "presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:", v9, 1, v10, v5, v7);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)sashViewHeight
{
  void *v3;
  unsigned __int8 v4;
  double result;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
  v4 = objc_msgSend(v3, "shouldHideSashView");

  result = 0.0;
  if ((v4 & 1) == 0)
  {
    v6 = -[WFBannerViewController shouldDisplaySash](self, "shouldDisplaySash", 0.0);
    result = 47.0;
    if (!v6)
      return 14.0;
  }
  return result;
}

- (BOOL)shouldDisplaySash
{
  void *v3;
  void *v4;
  unsigned int v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WFDevice currentDevice](WFDevice, "currentDevice"));
  if ((objc_msgSend(v3, "hasSystemAperture") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
    v5 = objc_msgSend(v4, "testStatusBanners");

    if (!v5)
    {
      isKindOfClass = 0;
      return isKindOfClass & 1;
    }
  }
  else
  {

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
  v9 = objc_opt_class(WFSmartPromptDialogViewController, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    v12 = objc_opt_class(WFSingleStepHomeScreenShortcutCompletionDialogViewController, v11);
    isKindOfClass = objc_opt_isKindOfClass(v10, v12);

  }
  return isKindOfClass & 1;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  objc_super v21;

  height = a3.height;
  width = a3.width;
  if (-[WFBannerViewController viewWillAppearCalled](self, "viewWillAppearCalled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentingScreen](self, "presentingScreen"));
    objc_msgSend(v6, "bounds");
    if (v8 == width && v7 == height)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentingScreen](self, "presentingScreen"));
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v14 = v13;
      -[WFBannerViewController preferredContentSize](self, "preferredContentSize");
      v16 = v15;
      v18 = v17;

      if (v12 != v16 || v14 != v18)
        goto LABEL_10;
    }
    else
    {

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentableContext](self, "presentableContext"));
    objc_msgSend(v19, "setHostNeedsUpdate");

LABEL_10:
    v21.receiver = self;
    v21.super_class = (Class)WFBannerViewController;
    -[WFBannerViewController setPreferredContentSize:](&v21, "setPreferredContentSize:", width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentableContext](self, "presentableContext"));
    objc_msgSend(v20, "setHostNeedsUpdate");

  }
}

- (void)platterPresentationDidInvalidateSize:(id)a3
{
  -[WFBannerViewController updateContainerViewFrameAnimated:](self, "updateContainerViewFrameAnimated:", 1);
  -[WFBannerViewController bannerSize](self, "bannerSize");
  -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (double)maximumExpectedHeightForPlatterPresentation:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
  +[WFCompactPlatterPresentationController presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:](WFCompactPlatterPresentationController, "presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:", v4, 0, v10, v7, v9);
  v12 = v11;

  return v12;
}

- (NSString)requestIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController associatedRunningContext](self, "associatedRunningContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestIdentifierForContext:", v4));

  return (NSString *)v5;
}

- (NSString)requesterIdentifier
{
  return (NSString *)VCBundleIdentifierShortcutsUI;
}

- (BOOL)isDraggingDismissalEnabled
{
  return 0;
}

- (BOOL)isClippingEnabled
{
  return 0;
}

- (id)bannerSizeTransitionAnimationSettings
{
  return +[BSAnimationSettings settingsWithDuration:](BSAnimationSettings, "settingsWithDuration:", 0.0);
}

- (UIEdgeInsets)bannerContentOutsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  UIEdgeInsets result;

  if (-[WFBannerViewController bannerIsFullScreen](self, "bannerIsFullScreen"))
  {
    v26.receiver = self;
    v26.super_class = (Class)WFBannerViewController;
    -[WFBannerViewController bannerContentOutsets](&v26, "bannerContentOutsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController layoutDescription](self, "layoutDescription"));
    objc_msgSend(v10, "containerSize");
    v12 = v11;
    v14 = v13;

    -[WFBannerViewController bannerSize](self, "bannerSize");
    v16 = v15;
    v7 = (v12 - v17) * 0.5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController layoutDescription](self, "layoutDescription"));
    objc_msgSend(v18, "offsetFromPresentationEdge");
    v5 = v19;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "traitCollection"));
    objc_msgSend(v21, "displayScale");
    v9 = v14 - v16 + 6.0 / v22;

    v3 = v7;
  }
  v23 = v5;
  v24 = v7;
  v25 = v9;
  result.right = v3;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (BOOL)providesHostedContent
{
  return 0;
}

- (void)systemDismissedBanner
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    objc_msgSend(v6, "systemDismissedBanner");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController delegate](self, "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "bannerViewControllerActionUserInterfaceNeedsDismissal:");

    if ((v5 & 1) == 0)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerViewController delegate](self, "delegate"));
    objc_msgSend(v6, "bannerViewControllerActionUserInterfaceNeedsDismissal:", self);
  }

}

- (void)presentableWillAppearAsBanner:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter", a3));

  if (v4)
    -[WFBannerViewController beginObservingForPresentation](self, "beginObservingForPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  objc_msgSend(v6, "makeKeyWindow");
  -[WFBannerViewController acquireDismissalPreventionAssertion](self, "acquireDismissalPreventionAssertion");

}

- (void)presentableDidAppearAsBanner:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (v15)
  {
    v5 = objc_opt_class(UIViewController, v4);
    if ((objc_opt_isKindOfClass(v15, v5) & 1) != 0)
      v6 = v15;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "_rootSheetPresentationController"));
  objc_msgSend(v10, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[WFBannerViewController updateHomeGestureOwnership](self, "updateHomeGestureOwnership");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController delegate](self, "delegate"));
  LOBYTE(v9) = objc_opt_respondsToSelector(v11, "bannerViewController:didPresentBanner:");

  if ((v9 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController delegate](self, "delegate"));
    objc_msgSend(v12, "bannerViewController:didPresentBanner:", self, v15);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterAwaitingModalPresentation](self, "platterAwaitingModalPresentation"));

  if (v13)
  {
    -[WFBannerViewController updateDimmingLayerVisibility](self, "updateDimmingLayerVisibility");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterAwaitingModalPresentation](self, "platterAwaitingModalPresentation"));
    -[WFBannerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "bannerViewController:willDismissWithReason:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController delegate](self, "delegate"));
    objc_msgSend(v7, "bannerViewController:willDismissWithReason:", self, v8);

  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  void *v5;

  -[WFBannerViewController releaseDismissalPreventionAssertionIfNecessary](self, "releaseDismissalPreventionAssertionIfNecessary", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentableHomeGestureContext](self, "presentableHomeGestureContext"));
  objc_msgSend(v5, "setWantsHomeGesture:", 0);

  -[WFBannerViewController stopObservingForPresentation](self, "stopObservingForPresentation");
}

- (void)beginObservingKeyboard
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "keyboardDidChange:", UIKeyboardWillShowNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "keyboardDidChange:", UIKeyboardWillHideNotification, 0);

}

- (void)stopObservingKeyboard
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

}

- (void)keyboardDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", UIKeyboardIsLocalUserInfoKey));

  if (!v6 || objc_msgSend(v6, "BOOLValue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      -[WFBannerViewController setKeyboardIsVisible:](self, "setKeyboardIsVisible:", objc_msgSend(v8, "isEqualToString:", UIKeyboardWillShowNotification));

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000107A8;
      block[3] = &unk_100034BE8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

}

- (BOOL)shouldCancelSystemDragGestureWithTouches:(id)a3 event:(id)a4
{
  return 1;
}

- (void)updateHomeGestureOwnership
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  id v15;

  if (-[WFBannerViewController keyboardIsVisible](self, "keyboardIsVisible"))
    goto LABEL_9;
  v3 = objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterAwaitingModalPresentation](self, "platterAwaitingModalPresentation"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterAwaitingModalPresentation](self, "platterAwaitingModalPresentation"));
    v6 = -[WFBannerViewController platterShouldOwnHomeGesture:](self, "platterShouldOwnHomeGesture:", v5);

    if ((v6 & 1) != 0)
      goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
  if (v7)
  {

    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterAwaitingModalPresentation](self, "platterAwaitingModalPresentation"));

  if (!v8)
  {
LABEL_9:
    v14 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
  v11 = objc_opt_class(WFShowContentDialogViewController, v10);
  isKindOfClass = objc_opt_isKindOfClass(v9, v11);

  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    v14 = (uint64_t)objc_msgSend(v13, "hasCustomHomeGestureBehavior");

  }
  else
  {
    v14 = 0;
  }
LABEL_10:
  v15 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentableHomeGestureContext](self, "presentableHomeGestureContext"));
  objc_msgSend(v15, "setWantsHomeGesture:", v14);

}

- (BOOL)homeAffordanceDidCrossThreshold
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  char v18;
  _QWORD v20[5];

  v3 = -[WFBannerViewController keyboardIsVisible](self, "keyboardIsVisible");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v6, "endEditing:", 1);

LABEL_14:
    return 1;
  }
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    if ((objc_opt_respondsToSelector(v7, "hasCustomHomeGestureBehavior") & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
      v9 = objc_opt_respondsToSelector(v8, "homeGestureDidPassThreshold");

      if ((v9 & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
        v11 = objc_msgSend(v10, "hasCustomHomeGestureBehavior");

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
          objc_msgSend(v12, "homeGestureDidPassThreshold");

          return 1;
        }
      }
    }
    else
    {

    }
  }
  v13 = objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterAwaitingModalPresentation](self, "platterAwaitingModalPresentation"));
  if (v13
    && (v14 = (void *)v13,
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterAwaitingModalPresentation](self, "platterAwaitingModalPresentation")), v16 = -[WFBannerViewController platterShouldOwnHomeGesture:](self, "platterShouldOwnHomeGesture:", v15), v15, v14, v16))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100010724;
    v20[3] = &unk_100034BE8;
    v20[4] = self;
    -[WFBannerViewController dismissModalPlatterWithCompletion:](self, "dismissModalPlatterWithCompletion:", v20);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController delegate](self, "delegate"));
    v18 = objc_opt_respondsToSelector(v17, "bannerViewControllerHomeGestureDidPassThreshold:");

    if ((v18 & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController delegate](self, "delegate"));
      objc_msgSend(v5, "bannerViewControllerHomeGestureDidPassThreshold:", self);
      goto LABEL_14;
    }
  }
  return 1;
}

- (void)acquireDismissalPreventionAssertion
{
  void *v3;
  void *v4;
  id v5;

  -[WFBannerViewController releaseDismissalPreventionAssertionIfNecessary](self, "releaseDismissalPreventionAssertionIfNecessary");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentableDismissalPreventionContext](self, "presentableDismissalPreventionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController assertionReason](self, "assertionReason"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "acquireTransitionDismissalPreventionAssertionForReason:", v4));

  -[WFBannerViewController setDismissalPreventionAssertion:](self, "setDismissalPreventionAssertion:", v5);
}

- (void)releaseDismissalPreventionAssertionIfNecessary
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dismissalPreventionAssertion](self, "dismissalPreventionAssertion"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dismissalPreventionAssertion](self, "dismissalPreventionAssertion"));
    objc_msgSend(v4, "invalidate");

    -[WFBannerViewController setDismissalPreventionAssertion:](self, "setDismissalPreventionAssertion:", 0);
  }
}

- (void)beginObservingForPresentation
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "presentationTransitionWillOccur:", UIPresentationControllerPresentationTransitionWillBeginNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "presentationTransitionWillOccur:", UIPresentationControllerDismissalTransitionDidEndNotification, 0);

}

- (void)stopObservingForPresentation
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)presentationTransitionWillOccur:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  Class v11;
  void *v12;
  Class v13;
  char isKindOfClass;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;

  v20 = a3;
  if ((+[NSUserDefaults bannerWorkaroundsDisabled](NSUserDefaults, "bannerWorkaroundsDisabled") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
    v11 = NSClassFromString(CFSTR("_UIDatePickerContainerViewController"));
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      goto LABEL_11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
    v13 = NSClassFromString(CFSTR("_UIContextMenuActionsOnlyViewController"));
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    if ((isKindOfClass & 1) != 0)
      goto LABEL_12;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
  v5 = objc_msgSend(v4, "isEqualToString:", UIPresentationControllerPresentationTransitionWillBeginNotification);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController rootModalViewController](self, "rootModalViewController"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentingScreen](self, "presentingScreen"));
      objc_msgSend(v7, "bounds");
      -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
      -[WFBannerViewController setRootModalViewController:](self, "setRootModalViewController:", v10);
LABEL_11:

    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
    v16 = objc_msgSend(v15, "isEqualToString:", UIPresentationControllerDismissalTransitionDidEndNotification);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController rootModalViewController](self, "rootModalViewController"));
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (v19)
      {
        -[WFBannerViewController setRootModalViewController:](self, "setRootModalViewController:", 0);
        -[WFBannerViewController bannerSize](self, "bannerSize");
        -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController presentableHomeGestureContext](self, "presentableHomeGestureContext"));
        objc_msgSend(v10, "setWantsHomeGesture:", 0);
        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

- (void)dismissModalPlatterWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  _QWORD block[5];
  id v8;
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterAwaitingModalPresentation](self, "platterAwaitingModalPresentation"));
  v6 = v5;
  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010528;
    block[3] = &unk_100034CD0;
    block[4] = self;
    v8 = v5;
    v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v4[2](v4);
  }

}

- (BOOL)shouldShowDimmingLayer
{
  void *v2;
  void *v3;
  unsigned __int8 v5;
  void *v6;
  char v7;
  unsigned int v8;
  void *v9;

  if (!-[WFBannerViewController dismissalPhase](self, "dismissalPhase"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    v7 = objc_opt_respondsToSelector(v6, "shouldInstallBannerDimmingLayer");
    if ((v7 & 1) != 0)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
      if ((objc_msgSend(v2, "shouldInstallBannerDimmingLayer") & 1) != 0)
      {
        v5 = 1;
        goto LABEL_10;
      }
    }
    v8 = -[WFBannerViewController keyboardIsVisible](self, "keyboardIsVisible");
    if (v8
      && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController traitCollection](self, "traitCollection")),
          !objc_msgSend(v3, "userInterfaceIdiom")))
    {
      v5 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController platterAwaitingModalPresentation](self, "platterAwaitingModalPresentation"));
      v5 = objc_msgSend(v9, "shouldInstallBannerDimmingLayer");

      if (!v8)
      {
        if ((v7 & 1) == 0)
        {
LABEL_11:

          return v5;
        }
LABEL_10:

        goto LABEL_11;
      }
    }

    if ((v7 & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  return 0;
}

- (void)updateDimmingLayerVisibility
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];

  v3 = -[WFBannerViewController shouldShowDimmingLayer](self, "shouldShowDimmingLayer");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dimmingView](self, "dimmingView"));

    if (!v4)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100010318;
      v11[3] = &unk_100034BE8;
      v11[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dimmingView](self, "dimmingView"));

  if (v5)
  {
    if (v3)
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dimmingView](self, "dimmingView"));
    else
      v6 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController bannerGesture](self, "bannerGesture"));
    objc_msgSend(v7, "setDimmingView:", v6);

    if (v3)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dimmingView](self, "dimmingView"));
    objc_msgSend(v8, "setCaptureTouches:", v3);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010444;
    v9[3] = &unk_100034B18;
    v9[4] = self;
    v10 = v3;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v9, 0, 1.0, 0.37, 0.0, 0.0, 0.0, 0.0, 0.0);
  }
}

- (void)layoutDimmingLayer
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dimmingView](self, "dimmingView"));

  if (v3)
  {
    -[WFBannerViewController bannerSize](self, "bannerSize");
    v5 = v4;
    -[WFBannerViewController bannerContentOutsets](self, "bannerContentOutsets");
    v7 = v6;
    v9 = -v8;
    v11 = v10 + v5 + v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController layoutDescription](self, "layoutDescription"));
    objc_msgSend(v12, "containerSize");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController layoutDescription](self, "layoutDescription"));
    objc_msgSend(v15, "offsetFromPresentationEdge");
    v17 = v14 + v16;

    v18 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerViewController dimmingView](self, "dimmingView"));
    objc_msgSend(v18, "setFrame:", v9, -100.0 - v7, v11, v17 + 100.0);

  }
}

- (void)handleTapGesture:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  _QWORD v7[5];

  if (-[WFBannerViewController keyboardIsVisible](self, "keyboardIsVisible", a3))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerViewController embeddedPlatter](self, "embeddedPlatter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v4, "endEditing:", 1);

  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001017C;
    v7[3] = &unk_100034BE8;
    v7[4] = self;
    -[WFBannerViewController dismissModalPlatterWithCompletion:](self, "dismissModalPlatterWithCompletion:", v7);
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[WFBannerViewController dismissalHandler](self, "dismissalHandler"));
    ((void (**)(_QWORD, const __CFString *))v5)[2](v5, CFSTR("Disambiguation dimming layer was tapped."));

  }
}

- (void)bannerGestureDidBegin
{
  -[WFBannerViewController setFreezePlatterLayout:](self, "setFreezePlatterLayout:", 1);
}

- (void)bannerGestureDidEndWithDismissal:(BOOL)a3
{
  void (**v4)(_QWORD, _QWORD);
  dispatch_time_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (a3)
  {
    -[WFBannerViewController setDismissalPhase:](self, "setDismissalPhase:", 2);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000100FC;
    v7[3] = &unk_100034BE8;
    v7[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v7, 0, 0.3, 0.0);
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[WFBannerViewController dismissalHandler](self, "dismissalHandler"));
    ((void (**)(_QWORD, const __CFString *))v4)[2](v4, CFSTR("Banner was swiped away."));

    v5 = dispatch_time(0, 100000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100010148;
    v6[3] = &unk_100034BE8;
    v6[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
  else
  {
    -[WFBannerViewController setFreezePlatterLayout:](self, "setFreezePlatterLayout:");
  }
}

- (id)presentingScreen
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_screen"));

  return v3;
}

- (BOOL)platterShouldOwnHomeGesture:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(WFChooseFromListDialogViewController, v3);
    objc_opt_isKindOfClass(v4, v5);
  }

  return 0;
}

- (id)assertionReason
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController associatedRunningContext](self, "associatedRunningContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.shortcuts.WFBannerViewController.cid-%@.uid-%@"), v3, v5));

  return v6;
}

- (id)layoutDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerViewController bannerSource](self, "bannerSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutDescriptionWithError:", 0));

  return v3;
}

- (BNPresentableContext)presentableContext
{
  return (BNPresentableContext *)objc_loadWeakRetained((id *)&self->_presentableContext);
}

- (void)setPresentableContext:(id)a3
{
  objc_storeWeak((id *)&self->_presentableContext, a3);
}

- (WFBannerViewControllerDelegate)delegate
{
  return (WFBannerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (WFWorkflowRunningContext)associatedRunningContext
{
  return self->_associatedRunningContext;
}

- (void)setAssociatedRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_associatedRunningContext, a3);
}

- (WFCompactPlatterViewController)embeddedPlatter
{
  return self->_embeddedPlatter;
}

- (WFCompactStatusViewController)queuedStatusPlatter
{
  return self->_queuedStatusPlatter;
}

- (unint64_t)dismissalPhase
{
  return self->_dismissalPhase;
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (WFCompactPlatterViewController)platterAwaitingModalPresentation
{
  return self->_platterAwaitingModalPresentation;
}

- (void)setPlatterAwaitingModalPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_platterAwaitingModalPresentation, a3);
}

- (UIViewController)rootModalViewController
{
  return self->_rootModalViewController;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (WFPassthroughDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (WFCompactPlatterSashView)sashView
{
  return self->_sashView;
}

- (void)setSashView:(id)a3
{
  objc_storeStrong((id *)&self->_sashView, a3);
}

- (int64_t)activeEmbeddedPlatterUpdateCount
{
  return self->_activeEmbeddedPlatterUpdateCount;
}

- (void)setActiveEmbeddedPlatterUpdateCount:(int64_t)a3
{
  self->_activeEmbeddedPlatterUpdateCount = a3;
}

- (BOOL)shouldFreezePlatterLayout
{
  return self->_freezePlatterLayout;
}

- (void)setFreezePlatterLayout:(BOOL)a3
{
  self->_freezePlatterLayout = a3;
}

- (BOOL)keyboardIsVisible
{
  return self->_keyboardIsVisible;
}

- (void)setKeyboardIsVisible:(BOOL)a3
{
  self->_keyboardIsVisible = a3;
}

- (double)platterCornerRadius
{
  return self->_platterCornerRadius;
}

- (SBUIPresentableDismissalPreventionAssertion)dismissalPreventionAssertion
{
  return self->_dismissalPreventionAssertion;
}

- (void)setDismissalPreventionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalPreventionAssertion, a3);
}

- (BNBannerSource)bannerSource
{
  return self->_bannerSource;
}

- (void)setBannerSource:(id)a3
{
  objc_storeStrong((id *)&self->_bannerSource, a3);
}

- (WFBannerGesture)bannerGesture
{
  return self->_bannerGesture;
}

- (void)setBannerGesture:(id)a3
{
  objc_storeStrong((id *)&self->_bannerGesture, a3);
}

- (WFDispatchSourceTimer)dismissalCompletionTimer
{
  return self->_dismissalCompletionTimer;
}

- (void)setDismissalCompletionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalCompletionTimer, a3);
}

- (WFDispatchSourceTimer)queuedStatusPlatterTimer
{
  return self->_queuedStatusPlatterTimer;
}

- (void)setQueuedStatusPlatterTimer:(id)a3
{
  objc_storeStrong((id *)&self->_queuedStatusPlatterTimer, a3);
}

- (WFCompactPlatterView)platterViewAwaitingTransition
{
  return (WFCompactPlatterView *)objc_loadWeakRetained((id *)&self->_platterViewAwaitingTransition);
}

- (void)setPlatterViewAwaitingTransition:(id)a3
{
  objc_storeWeak((id *)&self->_platterViewAwaitingTransition, a3);
}

- (BOOL)viewWillAppearCalled
{
  return self->_viewWillAppearCalled;
}

- (void)setViewWillAppearCalled:(BOOL)a3
{
  self->_viewWillAppearCalled = a3;
}

- (BOOL)viewIsAppearingCalled
{
  return self->_viewIsAppearingCalled;
}

- (void)setViewIsAppearingCalled:(BOOL)a3
{
  self->_viewIsAppearingCalled = a3;
}

- (id)viewIsAppearingHandler
{
  return self->_viewIsAppearingHandler;
}

- (void)setViewIsAppearingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BSInvalidatable)systemIdleTimerOverrideAssertion
{
  return self->_systemIdleTimerOverrideAssertion;
}

- (void)setSystemIdleTimerOverrideAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_systemIdleTimerOverrideAssertion, a3);
}

- (WFDispatchSourceTimer)localIdleTimer
{
  return self->_localIdleTimer;
}

- (void)setLocalIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_localIdleTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdleTimer, 0);
  objc_storeStrong((id *)&self->_systemIdleTimerOverrideAssertion, 0);
  objc_storeStrong(&self->_viewIsAppearingHandler, 0);
  objc_destroyWeak((id *)&self->_platterViewAwaitingTransition);
  objc_storeStrong((id *)&self->_queuedStatusPlatterTimer, 0);
  objc_storeStrong((id *)&self->_dismissalCompletionTimer, 0);
  objc_storeStrong((id *)&self->_bannerGesture, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_dismissalPreventionAssertion, 0);
  objc_storeStrong((id *)&self->_sashView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_rootModalViewController, 0);
  objc_storeStrong((id *)&self->_platterAwaitingModalPresentation, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_queuedStatusPlatter, 0);
  objc_storeStrong((id *)&self->_embeddedPlatter, 0);
  objc_storeStrong((id *)&self->_associatedRunningContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentableContext);
}

+ (id)requestIdentifierForContext:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR(".WFBannerViewController")));

  return v4;
}

@end
