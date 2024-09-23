@implementation SBEChamoisContentViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSBundle *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
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
  id v53;
  NSBundle *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  double v62;
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
  SBCAAutoPlayingPackageView *v75;
  void *v76;
  SBCAAutoPlayingPackageView *v77;
  SBCAAutoPlayingPackageView *videoView;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
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
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  id v108;
  double v109;
  void *v110;
  NSBundle *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  double v126;
  void *v127;
  NSBundle *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  CATransform3D v147;
  objc_super v148;
  NSAttributedStringKey v149;
  void *v150;

  v148.receiver = self;
  v148.super_class = (Class)SBEChamoisContentViewController;
  -[SBEChamoisContentViewController viewDidLoad](&v148, "viewDidLoad");
  -[SBEChamoisContentViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[SBEChamoisContentViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc_init((Class)UIView);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 88.0));
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -88.0));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 56.0));
  objc_msgSend(v18, "setActive:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, -5.0));
  objc_msgSend(v22, "setActive:", 1);

  v23 = objc_alloc_init((Class)UIScrollView);
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController view](self, "view"));
  objc_msgSend(v24, "addSubview:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  objc_msgSend(v27, "setActive:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
  objc_msgSend(v30, "setActive:", 1);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  objc_msgSend(v33, "setActive:", 1);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v34, "setTitleColor:forState:", v35, 0);

  v36 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("STAGE_MANAGER_OPT_OUT_BUTTON"), &stru_10000C328, 0));
  objc_msgSend(v34, "setTitle:forState:", v38, 0);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "titleLabel"));
  +[UIFont buttonFontSize](UIFont, "buttonFontSize");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  objc_msgSend(v39, "setFont:", v40);

  objc_msgSend(v34, "addTarget:action:forControlEvents:", self, "dismissEducationViewController:", 64);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "titleLabel"));
  objc_msgSend(v41, "setTextAlignment:", 1);

  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v42) = 1148846080;
  objc_msgSend(v34, "setContentCompressionResistancePriority:forAxis:", 1, v42);
  objc_msgSend(v5, "addSubview:", v34);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, -10.0));
  objc_msgSend(v45, "setActive:", 1);

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v47));
  objc_msgSend(v48, "setActive:", 1);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
  objc_msgSend(v51, "setActive:", 1);

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  v53 = objc_alloc((Class)NSAttributedString);
  v54 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("STAGE_MANAGER_OPT_IN_BUTTON"), &stru_10000C328, 0));
  v149 = NSFontAttributeName;
  +[UIFont buttonFontSize](UIFont, "buttonFontSize");
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  v150 = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1));
  v59 = objc_msgSend(v53, "initWithString:attributes:", v56, v58);
  objc_msgSend(v52, "setAttributedTitle:", v59);

  objc_msgSend(v52, "setContentInsets:", 17.0, 0.0, 17.0, 0.0);
  objc_msgSend(v52, "setCornerStyle:", 3);
  v146 = v52;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v52, 0));
  objc_msgSend(v60, "addTarget:action:forControlEvents:", self, "enableExternalDisplaySupport:", 64);
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "titleLabel"));
  objc_msgSend(v61, "setTextAlignment:", 1);

  objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v62) = 1148846080;
  objc_msgSend(v60, "setContentCompressionResistancePriority:forAxis:", 1, v62);
  objc_msgSend(v5, "addSubview:", v60);
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64, -15.0));
  objc_msgSend(v65, "setActive:", 1);

  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 80.0));
  objc_msgSend(v68, "setActive:", 1);

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, -80.0));
  objc_msgSend(v71, "setActive:", 1);

  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, 30.0));
  objc_msgSend(v74, "setActive:", 1);

  v75 = [SBCAAutoPlayingPackageView alloc];
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController _tutorialVideoURL](self, "_tutorialVideoURL"));
  v77 = -[SBCAAutoPlayingPackageView initWithURL:startingState:endingState:](v75, "initWithURL:startingState:endingState:", v76, CFSTR("start"), CFSTR("return"));
  videoView = self->_videoView;
  self->_videoView = v77;

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView layer](self->_videoView, "layer"));
  objc_msgSend(v79, "setCornerRadius:", 13.0);

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView layer](self->_videoView, "layer"));
  objc_msgSend(v80, "setGeometryFlipped:", 1);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView layer](self->_videoView, "layer"));
  objc_msgSend(v81, "setMasksToBounds:", 1);

  -[SBCAAutoPlayingPackageView setTranslatesAutoresizingMaskIntoConstraints:](self->_videoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addSubview:", self->_videoView);
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController presentingViewController](self, "presentingViewController"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "view"));
  v84 = objc_msgSend(v83, "effectiveUserInterfaceLayoutDirection");

  if (v84 == (id)1)
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView layer](self->_videoView, "layer"));
    CATransform3DMakeRotation(&v147, 3.14159265, 0.0, 1.0, 0.0);
    objc_msgSend(v85, "setTransform:", &v147);

  }
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView topAnchor](self->_videoView, "topAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentLayoutGuide"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "topAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v88));
  objc_msgSend(v89, "setActive:", 1);

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView leftAnchor](self->_videoView, "leftAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "leftAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintGreaterThanOrEqualToAnchor:constant:", v92, 60.0));
  objc_msgSend(v93, "setActive:", 1);

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView rightAnchor](self->_videoView, "rightAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "rightAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintLessThanOrEqualToAnchor:constant:", v96, -60.0));
  objc_msgSend(v97, "setActive:", 1);

  v98 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView centerXAnchor](self->_videoView, "centerXAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v99));
  objc_msgSend(v100, "setActive:", 1);

  v101 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView heightAnchor](self->_videoView, "heightAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView widthAnchor](self->_videoView, "widthAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:multiplier:", v102, 0.75));
  objc_msgSend(v103, "setActive:", 1);

  v104 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView heightAnchor](self->_videoView, "heightAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintLessThanOrEqualToConstant:", 400.0));
  objc_msgSend(v105, "setActive:", 1);

  LODWORD(v106) = 1148846080;
  -[SBCAAutoPlayingPackageView setContentCompressionResistancePriority:forAxis:](self->_videoView, "setContentCompressionResistancePriority:forAxis:", 0, v106);
  LODWORD(v107) = 1148846080;
  -[SBCAAutoPlayingPackageView setContentCompressionResistancePriority:forAxis:](self->_videoView, "setContentCompressionResistancePriority:forAxis:", 1, v107);
  v108 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v108, "setNumberOfLines:", 0);
  LODWORD(v109) = 1148846080;
  objc_msgSend(v108, "setContentCompressionResistancePriority:forAxis:", 1, v109);
  objc_msgSend(v108, "setTextAlignment:", 1);
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleLargeTitle, UIFontWeightBold));
  objc_msgSend(v108, "setFont:", v110);

  v111 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v112 = (void *)objc_claimAutoreleasedReturnValue(v111);
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "localizedStringForKey:value:table:", CFSTR("STAGE_MANAGER_FIRST_TIME_ONBOARDING_TITLE"), &stru_10000C328, 0));
  objc_msgSend(v108, "setText:", v113);

  objc_msgSend(v108, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addSubview:", v108);
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "leadingAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "leadingAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:constant:", v116, 60.0));
  objc_msgSend(v117, "setActive:", 1);

  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "trailingAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "trailingAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:constant:", v120, -60.0));
  objc_msgSend(v121, "setActive:", 1);

  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "topAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView bottomAnchor](self->_videoView, "bottomAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:constant:", v123, 56.0));
  objc_msgSend(v124, "setActive:", 1);

  v125 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v125, "setNumberOfLines:", 0);
  LODWORD(v126) = 1148846080;
  objc_msgSend(v125, "setContentCompressionResistancePriority:forAxis:", 1, v126);
  objc_msgSend(v125, "setTextAlignment:", 1);
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v125, "setFont:", v127);

  v128 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "localizedStringForKey:value:table:", CFSTR("STAGE_MANAGER_FIRST_TIME_ONBOARDING_BODY"), &stru_10000C328, 0));
  objc_msgSend(v125, "setText:", v130);

  objc_msgSend(v125, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addSubview:", v125);
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "leadingAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "leadingAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:constant:", v133, 60.0));
  objc_msgSend(v134, "setActive:", 1);

  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "trailingAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "trailingAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:constant:", v137, -60.0));
  objc_msgSend(v138, "setActive:", 1);

  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "topAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "bottomAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:constant:", v140, 15.0));
  objc_msgSend(v141, "setActive:", 1);

  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "bottomAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentLayoutGuide"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "bottomAnchor"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "constraintLessThanOrEqualToAnchor:constant:", v144, -30.0));
  objc_msgSend(v145, "setActive:", 1);

}

- (id)_tutorialVideoURL
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SBEChamoisContentViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3 == (id)2)
    v6 = CFSTR("ChamoisTutorial_DK");
  else
    v6 = CFSTR("ChamoisTutorial");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForResource:withExtension:", v6, CFSTR("ca")));

  return v7;
}

- (void)enableExternalDisplaySupport:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006F04;
  v3[3] = &unk_10000C2D8;
  v3[4] = self;
  -[SBEChamoisContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)dismissEducationViewController:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006F74;
  v3[3] = &unk_10000C2D8;
  v3[4] = self;
  -[SBEChamoisContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

@end
