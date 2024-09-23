@implementation SBEExternalDisplayContentViewController

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
  UIStackView *v34;
  UIStackView *actionsStackView;
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
  id v49;
  NSBundle *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  UIImageView *v56;
  UIImageView *externalHardwareImageView;
  UIImageView *v58;
  void *v59;
  UILabel *v60;
  UILabel *externalHardwareRecLabel;
  UILabel *v62;
  NSBundle *v63;
  void *v64;
  void *v65;
  UILabel *v66;
  void *v67;
  UILabel *v68;
  void *v69;
  UIButton *v70;
  UIButton *optInButton;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  NSBundle *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  SBCAAutoPlayingPackageView *v83;
  void *v84;
  SBCAAutoPlayingPackageView *v85;
  SBCAAutoPlayingPackageView *videoView;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
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
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  id v116;
  double v117;
  void *v118;
  NSBundle *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  double v134;
  void *v135;
  NSBundle *v136;
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
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  CATransform3D v156;
  objc_super v157;
  NSAttributedStringKey v158;
  void *v159;

  v157.receiver = self;
  v157.super_class = (Class)SBEExternalDisplayContentViewController;
  -[SBEExternalDisplayContentViewController viewDidLoad](&v157, "viewDidLoad");
  -[SBEExternalDisplayContentViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[SBEExternalDisplayContentViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc_init((Class)UIView);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 88.0));
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -88.0));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 56.0));
  objc_msgSend(v18, "setActive:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, -5.0));
  objc_msgSend(v22, "setActive:", 1);

  v23 = objc_alloc_init((Class)UIScrollView);
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController view](self, "view"));
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

  v34 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  actionsStackView = self->_actionsStackView;
  self->_actionsStackView = v34;

  -[UIStackView setAxis:](self->_actionsStackView, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", self->_actionsStackView);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_actionsStackView, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 15.0));
  objc_msgSend(v38, "setActive:", 1);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_actionsStackView, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 80.0));
  objc_msgSend(v41, "setActive:", 1);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_actionsStackView, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, -80.0));
  objc_msgSend(v44, "setActive:", 1);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_actionsStackView, "bottomAnchor"));
  v155 = v5;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -10.0));
  objc_msgSend(v47, "setActive:", 1);

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  v49 = objc_alloc((Class)NSAttributedString);
  v50 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("EXTERNAL_DISPLAY_OPT_IN_BUTTON"), &stru_10000C328, 0));
  v158 = NSFontAttributeName;
  +[UIFont buttonFontSize](UIFont, "buttonFontSize");
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  v159 = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1));
  v55 = objc_msgSend(v49, "initWithString:attributes:", v52, v54);
  objc_msgSend(v48, "setAttributedTitle:", v55);

  objc_msgSend(v48, "setContentInsets:", 17.0, 0.0, 17.0, 0.0);
  objc_msgSend(v48, "setCornerStyle:", 3);
  v56 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  externalHardwareImageView = self->_externalHardwareImageView;
  self->_externalHardwareImageView = v56;

  -[UIImageView setContentMode:](self->_externalHardwareImageView, "setContentMode:", 1);
  v58 = self->_externalHardwareImageView;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("display.trianglebadge.exclamationmark")));
  -[UIImageView setImage:](v58, "setImage:", v59);

  -[UIStackView addArrangedSubview:](self->_actionsStackView, "addArrangedSubview:", self->_externalHardwareImageView);
  v60 = (UILabel *)objc_alloc_init((Class)UILabel);
  externalHardwareRecLabel = self->_externalHardwareRecLabel;
  self->_externalHardwareRecLabel = v60;

  -[UILabel setNumberOfLines:](self->_externalHardwareRecLabel, "setNumberOfLines:", 0);
  v62 = self->_externalHardwareRecLabel;
  v63 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("EXTERNAL_DISPLAY_KEYBOARD_MOUSE_RECOMMENDATION"), &stru_10000C328, 0));
  -[UILabel setText:](v62, "setText:", v65);

  v66 = self->_externalHardwareRecLabel;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  -[UILabel setFont:](v66, "setFont:", v67);

  v68 = self->_externalHardwareRecLabel;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](v68, "setTextColor:", v69);

  -[UILabel setTextAlignment:](self->_externalHardwareRecLabel, "setTextAlignment:", 1);
  -[UIStackView addArrangedSubview:](self->_actionsStackView, "addArrangedSubview:", self->_externalHardwareRecLabel);
  v154 = v48;
  v70 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v48, 0));
  optInButton = self->_optInButton;
  self->_optInButton = v70;

  -[UIButton addTarget:action:forControlEvents:](self->_optInButton, "addTarget:action:forControlEvents:", self, "enableExternalDisplaySupport:", 64);
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_optInButton, "titleLabel"));
  objc_msgSend(v72, "setTextAlignment:", 1);

  LODWORD(v73) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_optInButton, "setContentCompressionResistancePriority:forAxis:", 1, v73);
  -[UIStackView addArrangedSubview:](self->_actionsStackView, "addArrangedSubview:", self->_optInButton);
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v74, "setTitleColor:forState:", v75, 0);

  v76 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("EXTERNAL_DISPLAY_OPT_OUT_BUTTON"), &stru_10000C328, 0));
  objc_msgSend(v74, "setTitle:forState:", v78, 0);

  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "titleLabel"));
  +[UIFont buttonFontSize](UIFont, "buttonFontSize");
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  objc_msgSend(v79, "setFont:", v80);

  objc_msgSend(v74, "addTarget:action:forControlEvents:", self, "dismissEducationViewController:", 64);
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "titleLabel"));
  objc_msgSend(v81, "setTextAlignment:", 1);

  LODWORD(v82) = 1148846080;
  objc_msgSend(v74, "setContentCompressionResistancePriority:forAxis:", 1, v82);
  -[UIStackView addArrangedSubview:](self->_actionsStackView, "addArrangedSubview:", v74);
  v83 = [SBCAAutoPlayingPackageView alloc];
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController _tutorialVideoURL](self, "_tutorialVideoURL"));
  v85 = -[SBCAAutoPlayingPackageView initWithURL:startingState:endingState:](v83, "initWithURL:startingState:endingState:", v84, CFSTR("start"), CFSTR("return"));
  videoView = self->_videoView;
  self->_videoView = v85;

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView layer](self->_videoView, "layer"));
  objc_msgSend(v87, "setCornerRadius:", 13.0);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView layer](self->_videoView, "layer"));
  objc_msgSend(v88, "setGeometryFlipped:", 1);

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView layer](self->_videoView, "layer"));
  objc_msgSend(v89, "setMasksToBounds:", 1);

  -[SBCAAutoPlayingPackageView setTranslatesAutoresizingMaskIntoConstraints:](self->_videoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addSubview:", self->_videoView);
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController presentingViewController](self, "presentingViewController"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "view"));
  v92 = objc_msgSend(v91, "effectiveUserInterfaceLayoutDirection");

  if (v92 == (id)1)
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView layer](self->_videoView, "layer"));
    CATransform3DMakeRotation(&v156, 3.14159265, 0.0, 1.0, 0.0);
    objc_msgSend(v93, "setTransform:", &v156);

  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView topAnchor](self->_videoView, "topAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentLayoutGuide"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "topAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v96));
  objc_msgSend(v97, "setActive:", 1);

  v98 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView leftAnchor](self->_videoView, "leftAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "leftAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintGreaterThanOrEqualToAnchor:constant:", v100, 60.0));
  objc_msgSend(v101, "setActive:", 1);

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView rightAnchor](self->_videoView, "rightAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "rightAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintLessThanOrEqualToAnchor:constant:", v104, -60.0));
  objc_msgSend(v105, "setActive:", 1);

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView centerXAnchor](self->_videoView, "centerXAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "centerXAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v107));
  objc_msgSend(v108, "setActive:", 1);

  v109 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView heightAnchor](self->_videoView, "heightAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView widthAnchor](self->_videoView, "widthAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:multiplier:", v110, 0.75));
  objc_msgSend(v111, "setActive:", 1);

  v112 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView heightAnchor](self->_videoView, "heightAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintLessThanOrEqualToConstant:", 400.0));
  objc_msgSend(v113, "setActive:", 1);

  LODWORD(v114) = 1148846080;
  -[SBCAAutoPlayingPackageView setContentCompressionResistancePriority:forAxis:](self->_videoView, "setContentCompressionResistancePriority:forAxis:", 0, v114);
  LODWORD(v115) = 1148846080;
  -[SBCAAutoPlayingPackageView setContentCompressionResistancePriority:forAxis:](self->_videoView, "setContentCompressionResistancePriority:forAxis:", 1, v115);
  v116 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v116, "setNumberOfLines:", 0);
  LODWORD(v117) = 1148846080;
  objc_msgSend(v116, "setContentCompressionResistancePriority:forAxis:", 1, v117);
  objc_msgSend(v116, "setTextAlignment:", 1);
  v118 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleLargeTitle, UIFontWeightBold));
  objc_msgSend(v116, "setFont:", v118);

  v119 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "localizedStringForKey:value:table:", CFSTR("EXTERNAL_DISPLAY_FIRST_TIME_ONBOARDING_TITLE"), &stru_10000C328, 0));
  objc_msgSend(v116, "setText:", v121);

  objc_msgSend(v116, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addSubview:", v116);
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "leadingAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "leadingAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:constant:", v124, 60.0));
  objc_msgSend(v125, "setActive:", 1);

  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "trailingAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "trailingAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:constant:", v128, -60.0));
  objc_msgSend(v129, "setActive:", 1);

  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "topAnchor"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView bottomAnchor](self->_videoView, "bottomAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:constant:", v131, 56.0));
  objc_msgSend(v132, "setActive:", 1);

  v133 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v133, "setNumberOfLines:", 0);
  LODWORD(v134) = 1148846080;
  objc_msgSend(v133, "setContentCompressionResistancePriority:forAxis:", 1, v134);
  objc_msgSend(v133, "setTextAlignment:", 1);
  v135 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v133, "setFont:", v135);

  v136 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "localizedStringForKey:value:table:", CFSTR("EXTERNAL_DISPLAY_FIRST_TIME_ONBOARDING_BODY"), &stru_10000C328, 0));
  objc_msgSend(v133, "setText:", v138);

  objc_msgSend(v133, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addSubview:", v133);
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "leadingAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "leadingAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:constant:", v141, 60.0));
  objc_msgSend(v142, "setActive:", 1);

  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "trailingAnchor"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "frameLayoutGuide"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "trailingAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "constraintEqualToAnchor:constant:", v145, -60.0));
  objc_msgSend(v146, "setActive:", 1);

  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "topAnchor"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "bottomAnchor"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:constant:", v148, 15.0));
  objc_msgSend(v149, "setActive:", 1);

  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "bottomAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentLayoutGuide"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "bottomAnchor"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintLessThanOrEqualToAnchor:constant:", v152, -30.0));
  objc_msgSend(v153, "setActive:", 1);

  -[UIStackView setCustomSpacing:afterView:](self->_actionsStackView, "setCustomSpacing:afterView:", self->_externalHardwareImageView, 5.0);
  -[UIStackView setCustomSpacing:afterView:](self->_actionsStackView, "setCustomSpacing:afterView:", self->_externalHardwareRecLabel, 15.0);
  -[UIStackView setCustomSpacing:afterView:](self->_actionsStackView, "setCustomSpacing:afterView:", self->_optInButton, 15.0);
  -[SBEExternalDisplayContentViewController _updateHardwareRequirementsAppearance](self, "_updateHardwareRequirementsAppearance");

}

- (void)_updateHardwareRequirementsAppearance
{
  UIStackView *actionsStackView;
  _QWORD v4[5];

  -[UIImageView setHidden:](self->_externalHardwareImageView, "setHidden:", self->_hardwareRequirementsSatisfied);
  -[UILabel setHidden:](self->_externalHardwareRecLabel, "setHidden:", self->_hardwareRequirementsSatisfied);
  -[UIButton setHidden:](self->_optInButton, "setHidden:", !self->_hardwareRequirementsSatisfied);
  actionsStackView = self->_actionsStackView;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005B64;
  v4[3] = &unk_10000C2D8;
  v4[4] = self;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", actionsStackView, 5242880, v4, 0, 0.2);
}

- (id)_tutorialVideoURL
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SBEExternalDisplayContentViewController traitCollection](self, "traitCollection"));
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
  v3[2] = sub_100005C44;
  v3[3] = &unk_10000C2D8;
  v3[4] = self;
  -[SBEExternalDisplayContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)dismissEducationViewController:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005CB4;
  v3[3] = &unk_10000C2D8;
  v3[4] = self;
  -[SBEExternalDisplayContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)externalDisplayHardwareRequirementsSatisfiedChanged:(BOOL)a3
{
  if (self->_hardwareRequirementsSatisfied != a3)
  {
    self->_hardwareRequirementsSatisfied = a3;
    -[SBEExternalDisplayContentViewController _updateHardwareRequirementsAppearance](self, "_updateHardwareRequirementsAppearance");
  }
}

- (void)dismissAnimated:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005D48;
  v3[3] = &unk_10000C2D8;
  v3[4] = self;
  -[SBEExternalDisplayContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, v3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hardwareRequirementsSatisfied
{
  return self->_hardwareRequirementsSatisfied;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_optInButton, 0);
  objc_storeStrong((id *)&self->_externalHardwareImageView, 0);
  objc_storeStrong((id *)&self->_actionsStackView, 0);
  objc_storeStrong((id *)&self->_externalHardwareRecLabel, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

@end
