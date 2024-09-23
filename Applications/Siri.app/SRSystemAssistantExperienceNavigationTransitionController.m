@implementation SRSystemAssistantExperienceNavigationTransitionController

- (SRSystemAssistantExperienceNavigationTransitionController)initWithDismissalBlock:(id)a3
{
  id v4;
  SRSystemAssistantExperienceNavigationTransitionController *v5;
  id v6;
  id dismissalBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRSystemAssistantExperienceNavigationTransitionController;
  v5 = -[SRSystemAssistantExperienceNavigationTransitionController init](&v9, "init");
  if (v5)
  {
    v6 = objc_retainBlock(v4);
    dismissalBlock = v5->_dismissalBlock;
    v5->_dismissalBlock = v6;

  }
  return v5;
}

- (void)configureWithNavigationController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  objc_opt_class(SiriUINavigationController, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    -[SRSystemAssistantExperienceNavigationTransitionController _setNavigationController:](self, "_setNavigationController:", v4);
  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009E1C8(v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));
  objc_msgSend(v8, "setAlpha:", 0.0);

}

- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3
{
  id v4;
  id inited;
  char IsPhone;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;
  id location;

  v4 = a3;
  inited = objc_initWeak(&location, self);
  IsPhone = SiriUIDeviceIsPhone(inited);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035C04;
  v9[3] = &unk_100122FE8;
  objc_copyWeak(&v10, &location);
  v11 = IsPhone;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035D28;
  v7[3] = &unk_100122C18;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v9, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (UIViewControllerAnimatedTransitioning)animationController
{
  void *v3;
  unsigned int v4;
  SRSystemAssistantExperienceNavigationTransitionController *v5;

  if (-[SRSystemAssistantExperienceNavigationTransitionController _isDrillIn](self, "_isDrillIn")
    && (id)-[SRSystemAssistantExperienceNavigationTransitionController operation](self, "operation") == (id)1
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceNavigationTransitionController _navigationController](self, "_navigationController")), v4 = objc_msgSend(v3, "popToRootViewController"), v3, v4))
  {
    v5 = self;
  }
  else
  {
    v5 = 0;
  }
  return (UIViewControllerAnimatedTransitioning *)v5;
}

- (void)animateTransition:(id)a3
{
  id v4;
  int64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v4 = a3;
  v5 = -[SRSystemAssistantExperienceNavigationTransitionController operation](self, "operation");
  switch(v5)
  {
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceNavigationTransitionController _navigationController](self, "_navigationController"));
      v8 = objc_msgSend(v7, "popToRootViewController");

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceNavigationTransitionController _navigationController](self, "_navigationController"));
        objc_msgSend(v9, "setPopToRootViewController:", 0);

        -[SRSystemAssistantExperienceNavigationTransitionController animatePopToRootViewControllerWithContext:](self, "animatePopToRootViewControllerWithContext:", v4);
      }
      break;
    case 1:
      -[SRSystemAssistantExperienceNavigationTransitionController animateDrillInTransitionWithContext:](self, "animateDrillInTransitionWithContext:", v4);
      break;
    case 0:
      v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
        sub_10009E248((uint64_t)self, v6);
      break;
  }

}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateDrillInTransitionWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id WeakRetained;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
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
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double MinY;
  double MidX;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  SRSystemAssistantExperienceNavigationTransitionController *v126;
  _QWORD v127[4];
  id v128;
  id v129;
  id v130;
  id v131;
  SRSystemAssistantExperienceNavigationTransitionController *v132;
  id v133;
  id v134;
  _QWORD v135[4];
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  uint64_t v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  _QWORD v147[4];
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[4];
  CGRect v151;
  CGRect v152;
  CGRect v153;

  v4 = a3;
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextFromViewKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextToViewKey));
  v120 = v4;
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "navigationController"));
  objc_msgSend(v7, "setNavigationBarHidden:", SiriUIDeviceIsPhone(v7));

  v123 = v6;
  objc_msgSend(v6, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v122 = (void *)v5;
  v126 = self;
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceNavigationTransitionController _fromPlatterViewOfViewController:](self, "_fromPlatterViewOfViewController:", v5));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceNavigationTransitionController _fromSnippetContainerViewOfView:](self, "_fromSnippetContainerViewOfView:"));
  v17 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  v19 = SiriSharedUICompactPlatterCornerRadius;
  objc_msgSend(v18, "setCornerRadius:", SiriSharedUICompactPlatterCornerRadius);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  objc_msgSend(v20, "setMasksToBounds:", 1);

  objc_msgSend(v16, "bounds");
  objc_msgSend(v17, "setFrame:");
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setClipsToBounds:", 1);
  objc_msgSend(v16, "addSubview:", v17);
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:", v112));
  v150[0] = v110;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v150[1] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v150[2] = v26;
  v116 = v17;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v117 = v16;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v150[3] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v150, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  v33 = 0;
  if (SiriUIDeviceIsPad(v31, v32))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceNavigationTransitionController _closeButton](v126, "_closeButton"));
    objc_msgSend(v123, "addSubview:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 10.5));
    v149[0] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, -12.0));
    v149[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v149, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceNavigationTransitionController _closeButton](v126, "_closeButton"));
    -[SRSystemAssistantExperienceNavigationTransitionController _setRealCloseButton:](v126, "_setRealCloseButton:", v41);

    -[UIButton setHidden:](v126->_realCloseButton, "setHidden:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&v126->_navigationController);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));

    v44 = objc_loadWeakRetained((id *)&v126->_navigationController);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "view"));
    objc_msgSend(v45, "addSubview:", v126->_realCloseButton);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v126->_realCloseButton, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 10.5));
    v148[0] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v126->_realCloseButton, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, -12.0));
    v148[1] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v148, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v52);

  }
  v115 = v33;
  v53 = objc_alloc((Class)UIVisualEffectView);
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 4));
  v55 = objc_msgSend(v53, "initWithEffect:", v54);

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "layer"));
  objc_msgSend(v56, "setCornerRadius:", v19);

  objc_msgSend(v123, "bounds");
  objc_msgSend(v55, "setFrame:");
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "layer"));
  objc_msgSend(v57, "setMasksToBounds:", 1);

  objc_msgSend(v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v55, "setUserInteractionEnabled:", 0);
  objc_msgSend(v123, "addSubview:", v55);
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "leadingAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:", v109));
  v147[0] = v108;
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v58));
  v147[1] = v59;
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
  v147[2] = v62;
  v113 = v55;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "bottomAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v64));
  v147[3] = v65;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v147, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[PLPlatterView platterViewWithBlurEffectStyle:](PLPlatterView, "platterViewWithBlurEffectStyle:", 9));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "layer"));
  objc_msgSend(v68, "setMasksToBounds:", 1);

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "layer"));
  objc_msgSend(v69, "setCornerRadius:", v19);

  objc_msgSend(v125, "insertSubview:belowSubview:", v67, v119);
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceNavigationTransitionController _navigationController](v126, "_navigationController"));
  objc_msgSend(v70, "setAnimatingBackgroundView:", v67);

  objc_msgSend(v121, "frame");
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v78 = v77;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "superview"));
  objc_msgSend(v125, "convertRect:fromView:", v79, v72, v74, v76, v78);
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v87 = v86;

  objc_msgSend(v67, "setFrame:", v81, v83, v85, v87);
  objc_msgSend(v117, "frame");
  MinY = CGRectGetMinY(v151);
  objc_msgSend(v123, "setClipsToBounds:", 1);
  objc_msgSend(v123, "setAlpha:", 0.0);
  objc_msgSend(v123, "setFrame:", v9, v11, v13, v15);
  objc_msgSend(v67, "addSubview:", v123);
  v152.origin.x = v9;
  v152.origin.y = v11;
  v152.size.width = v13;
  v152.size.height = v15;
  MidX = CGRectGetMidX(v152);
  v153.origin.x = v9;
  v153.origin.y = v11;
  v153.size.width = v13;
  v153.size.height = v15;
  objc_msgSend(v123, "setCenter:", MidX, MinY + CGRectGetMidY(v153));
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "traitCollection"));
  objc_msgSend(v91, "displayCornerRadius");
  v93 = v92;

  objc_opt_class(SiriUINavigationContentViewController, v94);
  if ((objc_opt_isKindOfClass(v124, v95) & 1) != 0)
    v97 = v124;
  else
    v97 = 0;
  objc_opt_class(SiriSharedUISmartDialogView, v96);
  if ((objc_opt_isKindOfClass(v121, v98) & 1) != 0)
    objc_msgSend(v121, "prepareForDrillInAnimation");
  objc_msgSend(v97, "prepareForDrillInAnimation");
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.75, 0.628318531));
  v135[0] = _NSConcreteStackBlock;
  v135[1] = 3221225472;
  v135[2] = sub_100036B7C;
  v135[3] = &unk_100123010;
  v136 = v67;
  v141 = v93;
  v142 = v9;
  v143 = v11;
  v144 = v13;
  v145 = v15;
  v137 = v116;
  v118 = v117;
  v138 = v118;
  v146 = MinY;
  v139 = v113;
  v100 = v123;
  v140 = v100;
  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_100036C7C;
  v127[3] = &unk_100123038;
  v101 = v136;
  v128 = v101;
  v102 = v119;
  v129 = v102;
  v103 = v137;
  v130 = v103;
  v104 = v139;
  v131 = v104;
  v132 = v126;
  v105 = v115;
  v133 = v105;
  v106 = v120;
  v134 = v106;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v99, 0, v135, v127);
  if ((objc_opt_respondsToSelector(v121, "animateForDrillIn") & 1) != 0)
    objc_msgSend(v121, "performSelector:", "animateForDrillIn");

}

- (void)animatePopToRootViewControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextFromViewKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextToViewKey));
  v8 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
  objc_msgSend(v11, "displayCornerRadius");
  objc_msgSend(v9, "setCornerRadius:");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v12, "setMasksToBounds:", 1);

  objc_msgSend(v5, "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", v8);
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceNavigationTransitionController _navigationController](self, "_navigationController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "animatingBackgroundView"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  objc_msgSend(v15, "insertSubview:belowSubview:", v7, v14);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100036FAC;
  v25[3] = &unk_1001228D0;
  v16 = v8;
  v26 = v16;
  v17 = v6;
  v27 = v17;
  v18 = v14;
  v28 = v18;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100037010;
  v21[3] = &unk_100123060;
  objc_copyWeak(&v24, &location);
  v19 = v17;
  v22 = v19;
  v20 = v18;
  v23 = v20;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v25, v21, 0.3);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (id)_closeButton
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[6];

  v2 = objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, 30.0, 30.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayTintColor](UIColor, "systemLightGrayTintColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.1));
  objc_msgSend(v2, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v5, "setCornerRadius:", 15.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v6, "setMasksToBounds:", 1);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 2, 15.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("xmark"), v32));
  objc_msgSend(v2, "setImage:forState:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v2, "setTintColor:", v8);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 11));
  v9 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v10, "setCornerRadius:", 15.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v11, "setMasksToBounds:", 1);

  objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageView"));
  objc_msgSend(v2, "insertSubview:belowSubview:", v9, v12);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "heightAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:", 30.0));
  v34[0] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "widthAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:", 30.0));
  v34[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v34[2] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v34[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v34[4] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  v34[5] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  objc_msgSend(v2, "addTarget:action:forControlEvents:", self, "_dismiss", 64);
  return v2;
}

- (BOOL)_isDrillIn
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewControllers"));
  v4 = objc_msgSend(v3, "count") == (id)2;

  return v4;
}

- (id)_fromPlatterViewOfViewController:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;

  v3 = a3;
  objc_opt_class(SRSystemAssistantExperienceRootViewController, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerView"));
  objc_msgSend(v6, "prepareForDrillinAnimation");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resultContentView"));
  objc_opt_class(SiriSharedUISmartDialogView, v8);
  isKindOfClass = objc_opt_isKindOfClass(v7, v9);

  if ((isKindOfClass & 1) == 0)
  {

LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resultContentView"));

LABEL_6:
  return v11;
}

- (id)_fromSnippetContainerViewOfView:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class(SiriSharedUISmartDialogView, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentContainerView"));
  else
    v6 = v3;
  v7 = v6;

  return v7;
}

- (void)_dismiss
{
  (*((void (**)(void))self->_dismissalBlock + 2))();
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (SiriUINavigationController)_navigationController
{
  return (SiriUINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)_setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (id)_dismissalBlock
{
  return self->_dismissalBlock;
}

- (UIButton)_realCloseButton
{
  return self->_realCloseButton;
}

- (void)_setRealCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_realCloseButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realCloseButton, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_destroyWeak((id *)&self->_navigationController);
}

@end
