@implementation PHScreenSharingContainerViewController

- (PHScreenSharingContainerViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v5;
  PHScreenSharingContainerViewController *v6;
  PHScreenSharingContainerViewController *v7;
  CNKParticipantScreenShareInfoViewFactory *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHScreenSharingContainerViewController *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHScreenSharingContainerViewController;
  v6 = -[PHScreenSharingContainerViewController init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v8 = objc_opt_new(CNKParticipantScreenShareInfoViewFactory);
    -[PHScreenSharingContainerViewController setInfoViewFactory:](v7, "setInfoViewFactory:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController makeScreenShareViewController](v7, "makeScreenShareViewController"));
    -[PHScreenSharingContainerViewController setSharedContentViewController:](v7, "setSharedContentViewController:", v9);

    -[PHScreenSharingContainerViewController setShowingOverlay:](v7, "setShowingOverlay:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController view](v7, "view"));
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, "pipStateDidChangeNotification:", CFSTR("PHPIPControllerStateDidChangeNotification"), 0);

    v13 = v7;
  }

  return v7;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return (NSSet *)sub_1000A33EC(1uLL);
}

- (void)handlePIPViewControllerRestoredAfterPIPStopped:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  v17 = (id)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));

  objc_msgSend(v17, "sendSubviewToBack:", v16);
}

- (void)setShowingOverlay:(BOOL)a3
{
  -[PHScreenSharingContainerViewController setShowingOverlay:animated:](self, "setShowingOverlay:animated:", a3, 0);
}

- (void)setShowingOverlay:(BOOL)a3 animated:(BOOL)a4
{
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  void (**v10)(_QWORD);
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  PHScreenSharingContainerViewController *v16;
  BOOL v17;

  if (self->_showingOverlay != a3)
  {
    self->_showingOverlay = a3;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000C33F4;
    v14[3] = &unk_100286220;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController overlayView](self, "overlayView"));
    v17 = a3;
    v15 = v7;
    v16 = self;
    v8 = objc_retainBlock(v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000C344C;
    v13[3] = &unk_100284898;
    v13[4] = self;
    v9 = objc_retainBlock(v13);
    v10 = (void (**)(_QWORD))v9;
    if (a4)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000C3454;
      v11[3] = &unk_100285AC8;
      v12 = v9;
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v8, v11, 0.2);

    }
    else
    {
      ((void (*)(_QWORD *))v8[2])(v8);
      v10[2](v10);
    }

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
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
  PHScreenSharingContainerViewController *v95;
  void *v96;
  id v97;
  void *v98;
  objc_super v99;
  _QWORD v100[19];

  v99.receiver = self;
  v99.super_class = (Class)PHScreenSharingContainerViewController;
  -[PHScreenSharingContainerViewController viewDidLoad](&v99, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController sharedContentViewController](self, "sharedContentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  v14 = v3;
  v98 = v3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  objc_msgSend(v3, "willMoveToParentViewController:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v16, "addSubview:", v17);

  -[PHScreenSharingContainerViewController addChildViewController:](self, "addChildViewController:", v14);
  objc_msgSend(v14, "didMoveToParentViewController:", self);
  objc_msgSend(v16, "setAutoresizingMask:", 18);
  v97 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "overlayViewTapped:");
  objc_msgSend(v16, "addGestureRecognizer:", v97);
  v18 = objc_alloc_init((Class)UIView);
  -[PHScreenSharingContainerViewController setOverlayView:](self, "setOverlayView:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v18, "setBackgroundColor:", v19);

  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "setUserInteractionEnabled:", 0);
  objc_msgSend(v18, "setHidden:", -[PHScreenSharingContainerViewController showingOverlay](self, "showingOverlay") ^ 1);
  objc_msgSend(v16, "addSubview:", v18);
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 17));
  v20 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v96);
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "addSubview:", v20);
  v21 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v96);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "addSubview:", v21);
  objc_msgSend(v20, "_setGroupName:", CFSTR("PHScreenSharingContainerViewController.blurGroupName"));
  objc_msgSend(v21, "_setGroupName:", CFSTR("PHScreenSharingContainerViewController.blurGroupName"));
  v95 = self;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CNKParticipantScreenShareInfoViewFactory makeParticipantView](self->_infoViewFactory, "makeParticipantView"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v22, "preferredHeight");
  objc_msgSend(v22, "setCustomCornerRadius:", v23 * 0.5);
  -[PHScreenSharingContainerViewController setInfoView:](self, "setInfoView:", v22);
  objc_msgSend(v18, "addSubview:", v22);
  -[PHScreenSharingContainerViewController updatePresenterNameAndAvatar](self, "updatePresenterNameAndAvatar");
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
  v100[0] = v92;
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v89));
  v100[1] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
  v100[2] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v83));
  v100[3] = v82;
  v91 = v18;
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "widthAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v100[4] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "heightAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "heightAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
  v100[5] = v76;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v72, 1.0));
  v100[6] = v71;
  v73 = v22;
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintLessThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v68, 1.0));
  v100[7] = v67;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:", v63));
  v100[8] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v60, 1.0));
  v100[9] = v59;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "widthAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintLessThanOrEqualToAnchor:", v56));
  v100[10] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "heightAnchor"));
  objc_msgSend(v22, "preferredHeight");
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintGreaterThanOrEqualToConstant:"));
  v100[11] = v53;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));

  LODWORD(v28) = 1144750080;
  v52 = v27;
  objc_msgSend(v27, "setPriority:", v28);
  v100[12] = v27;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v100[13] = v49;
  v66 = v20;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "widthAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v100[14] = v46;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v100[15] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v100[16] = v29;
  v58 = v21;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "widthAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  v100[17] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v35));
  v100[18] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 19));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController pipController](v95, "pipController"));
  objc_msgSend(v38, "updatePIPSize");

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController pipController](v95, "pipController"));
  objc_msgSend(v39, "updatePIPFrame");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHScreenSharingContainerViewController;
  -[PHScreenSharingContainerViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController pipController](self, "pipController"));
  objc_msgSend(v4, "updatePIPSize");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController pipController](self, "pipController"));
  objc_msgSend(v5, "updatePIPFrame");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double Height;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)PHScreenSharingContainerViewController;
  -[PHScreenSharingContainerViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController infoView](self, "infoView"));
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController infoView](self, "infoView"));
  objc_msgSend(v5, "setCustomCornerRadius:", Height * 0.5);

}

- (void)pipStateDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController pipController](self, "pipController"));

  if (v4 == v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController pipController](self, "pipController"));
    v7 = objc_msgSend(v6, "isPipped");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController sharedContentViewController](self, "sharedContentViewController"));
    objc_msgSend(v8, "setIsPipped:", v7);

    if ((_DWORD)v7)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController overlayDismissTimer](self, "overlayDismissTimer"));
      objc_msgSend(v9, "invalidate");

    }
    else
    {
      -[PHScreenSharingContainerViewController setupOverlayDismissTimerIfNeeded](self, "setupOverlayDismissTimerIfNeeded");
    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  return !-[PHScreenSharingContainerViewController showingOverlay](self, "showingOverlay");
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return !-[PHScreenSharingContainerViewController showingOverlay](self, "showingOverlay");
}

- (void)overlayViewTapped:(id)a3
{
  -[PHScreenSharingContainerViewController setShowingOverlay:animated:](self, "setShowingOverlay:animated:", -[PHScreenSharingContainerViewController showingOverlay](self, "showingOverlay", a3) ^ 1, 1);
}

- (void)updatePresenterNameAndAvatar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController sharedContentViewController](self, "sharedContentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedContentSourceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController infoView](self, "infoView"));
  objc_msgSend(v5, "configureWith:isFullScreenMode:", v4, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController pipController](self, "pipController"));
  objc_msgSend(v6, "setScreenSharingTitle:andAvatarIfNeeded:", v4, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController sharedContentViewController](self, "sharedContentViewController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C4234;
  v9[3] = &unk_100287748;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "getSharedContentSourceAvatarWithImageHandler:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setupOverlayDismissTimerIfNeeded
{
  void *v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenSharingContainerViewController overlayDismissTimer](self, "overlayDismissTimer"));
  objc_msgSend(v3, "invalidate");

  if (-[PHScreenSharingContainerViewController showingOverlay](self, "showingOverlay"))
  {
    objc_initWeak(&location, self);
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_1000C44A4;
    v8 = &unk_100284DC8;
    objc_copyWeak(&v9, &location);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v5, 3.0));
    -[PHScreenSharingContainerViewController setOverlayDismissTimer:](self, "setOverlayDismissTimer:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (PHPIPController)pipController
{
  return (PHPIPController *)objc_loadWeakRetained((id *)&self->_pipController);
}

- (void)setPipController:(id)a3
{
  objc_storeWeak((id *)&self->_pipController, a3);
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (CNKFaceTimePiPSourceProviding)sharedContentViewController
{
  return self->_sharedContentViewController;
}

- (void)setSharedContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sharedContentViewController, a3);
}

- (CNKParticipantScreenShareInfoViewProtocol)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_infoView, a3);
}

- (CNKParticipantScreenShareInfoViewFactory)infoViewFactory
{
  return self->_infoViewFactory;
}

- (void)setInfoViewFactory:(id)a3
{
  objc_storeStrong((id *)&self->_infoViewFactory, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (BOOL)showingOverlay
{
  return self->_showingOverlay;
}

- (NSTimer)overlayDismissTimer
{
  return self->_overlayDismissTimer;
}

- (void)setOverlayDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_overlayDismissTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayDismissTimer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_infoViewFactory, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_sharedContentViewController, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_destroyWeak((id *)&self->_pipController);
}

- (id)makeScreenShareViewController
{
  PHScreenSharingContainerViewController *v2;
  id v3;

  v2 = self;
  v3 = PHScreenSharingContainerViewController.makeScreenShareViewController()();

  return v3;
}

@end
