@implementation ContinuityCaptureShieldUIContentView

- (ContinuityCaptureShieldUIContentView)initWithFrame:(CGRect)a3
{
  ContinuityCaptureShieldUIContentView *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIScrollView *v15;
  UIScrollView *accessibilityScrollView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIView *v25;
  UIView *containerView;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIImageView *v38;
  UIImageView *imageView;
  void *v40;
  void *v41;
  UIView *v42;
  UIView *animationViewContainer;
  UILabel *v44;
  UILabel *titleLabel;
  void *v46;
  void *v47;
  UILabel *v48;
  UILabel *subtitleLabel;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  UIStackView *v54;
  UIStackView *descriptionStackView;
  UIStackView *v56;
  UIStackView *v57;
  void *v58;
  uint64_t v59;
  UIButton *pauseButton;
  void *v61;
  void *v62;
  uint64_t v63;
  UIButton *faceTimeButton;
  void *v65;
  void *v66;
  uint64_t v67;
  UIButton *favoritesButton;
  void *v69;
  void *v70;
  uint64_t v71;
  UIButton *disconnectButton;
  void *v73;
  void *v74;
  uint64_t v75;
  UIButton *skipButton;
  void *v77;
  id v78;
  void *v79;
  UIStackView *v80;
  UIStackView *buttonsStackView;
  void *v82;
  void *v83;
  uint64_t v84;
  NSLayoutConstraint *descriptionLeadingAnchor;
  void *v86;
  void *v87;
  uint64_t v88;
  NSLayoutConstraint *descriptionTrailingAnchor;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
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
  void *v125;
  void *v126;
  void *v127;
  void *v128;
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
  void *v147;
  id v148;
  _QWORD v149[4];
  id v150;
  _QWORD v151[4];
  id v152;
  _QWORD v153[4];
  id v154;
  _QWORD v155[4];
  id v156;
  _QWORD v157[4];
  id v158;
  id location;
  objc_super v160;
  _QWORD v161[10];
  _QWORD v162[5];
  _QWORD v163[4];
  _QWORD v164[6];
  _QWORD v165[4];
  _QWORD v166[4];
  _QWORD v167[4];

  v160.receiver = self;
  v160.super_class = (Class)ContinuityCaptureShieldUIContentView;
  v3 = -[ContinuityCaptureShieldUIContentView initWithFrame:](&v160, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v148 = objc_alloc_init((Class)UILayoutGuide);
    -[ContinuityCaptureShieldUIContentView addLayoutGuide:](v3, "addLayoutGuide:", v148);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v5 = objc_msgSend(v4, "userInterfaceIdiom") == (id)1;

    if (v5)
    {
      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "widthAnchor"));
      v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "constraintEqualToConstant:", 620.0));
      v167[0] = v143;
      v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "centerXAnchor"));
      v135 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "centerXAnchor"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:", v132));
      v167[1] = v129;
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "topAnchor"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "topAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v6));
      v167[2] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "bottomAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -35.0));
      v167[3] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v167, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);
    }
    else
    {
      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "leftAnchor"));
      v143 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
      v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "leftAnchor"));
      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "constraintEqualToAnchor:", v139));
      v166[0] = v135;
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "rightAnchor"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "rightAnchor"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:", v126));
      v166[1] = v123;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "topAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
      v166[2] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -15.0));
      v166[3] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v166, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    }
    v15 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    accessibilityScrollView = v3->_accessibilityScrollView;
    v3->_accessibilityScrollView = v15;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v3->_accessibilityScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setBounces:](v3->_accessibilityScrollView, "setBounces:", 0);
    -[UIScrollView setClipsToBounds:](v3->_accessibilityScrollView, "setClipsToBounds:", 0);
    -[ContinuityCaptureShieldUIContentView addSubview:](v3, "addSubview:", v3->_accessibilityScrollView);
    v147 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](v3->_accessibilityScrollView, "topAnchor"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "topAnchor"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:", v144));
    v165[0] = v140;
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](v3->_accessibilityScrollView, "bottomAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToAnchor:", v133));
    v165[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](v3->_accessibilityScrollView, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v165[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](v3->_accessibilityScrollView, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v165[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v165, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    v25 = (UIView *)objc_alloc_init((Class)UIView);
    containerView = v3->_containerView;
    v3->_containerView = v25;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setMaximumContentSizeCategory:](v3->_containerView, "setMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityExtraLarge);
    -[UIScrollView addSubview:](v3->_accessibilityScrollView, "addSubview:", v3->_containerView);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v3->_containerView, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView heightAnchor](v3->_accessibilityScrollView, "heightAnchor"));
    v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));

    LODWORD(v29) = 1132068864;
    objc_msgSend(v145, "setPriority:", v29);
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3->_containerView, "topAnchor"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](v3->_accessibilityScrollView, "contentLayoutGuide"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "topAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToAnchor:", v134));
    v164[0] = v130;
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_containerView, "bottomAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](v3->_accessibilityScrollView, "contentLayoutGuide"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "bottomAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:", v121));
    v164[1] = v119;
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3->_containerView, "leadingAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](v3->_accessibilityScrollView, "contentLayoutGuide"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "leadingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v113));
    v164[2] = v111;
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3->_containerView, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](v3->_accessibilityScrollView, "contentLayoutGuide"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v31));
    v164[3] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_containerView, "widthAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView frameLayoutGuide](v3->_accessibilityScrollView, "frameLayoutGuide"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "widthAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));
    v164[4] = v36;
    v164[5] = v145;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v164, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

    v38 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v38;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultImageTintColor](v3, "_defaultImageTintColor"));
    -[UIImageView setTintColor:](v3->_imageView, "setTintColor:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultImageSymbolConfiguration](v3, "_defaultImageSymbolConfiguration"));
    -[UIImageView setPreferredSymbolConfiguration:](v3->_imageView, "setPreferredSymbolConfiguration:", v41);

    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v3->_imageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    v42 = (UIView *)objc_alloc_init((Class)UIView);
    animationViewContainer = v3->_animationViewContainer;
    v3->_animationViewContainer = v42;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_animationViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setHidden:](v3->_animationViewContainer, "setHidden:", 1);
    v44 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v44;

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultTextFont](v3, "_defaultTextFont"));
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultTextColor](v3, "_defaultTextColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v47);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v48 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultSecondaryTextFont](v3, "_defaultSecondaryTextFont"));
    -[UILabel setFont:](v3->_subtitleLabel, "setFont:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultSecondaryTextColor](v3, "_defaultSecondaryTextColor"));
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v51);

    -[UILabel setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v52 = objc_alloc((Class)UIStackView);
    v163[0] = v3->_animationViewContainer;
    v163[1] = v3->_imageView;
    v163[2] = v3->_titleLabel;
    v163[3] = v3->_subtitleLabel;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v163, 4));
    v54 = (UIStackView *)objc_msgSend(v52, "initWithArrangedSubviews:", v53);
    descriptionStackView = v3->_descriptionStackView;
    v3->_descriptionStackView = v54;

    -[UIStackView setAlignment:](v3->_descriptionStackView, "setAlignment:", 3);
    -[UIStackView setAxis:](v3->_descriptionStackView, "setAxis:", 1);
    v56 = v3->_descriptionStackView;
    -[ContinuityCaptureShieldUIContentView _imageToTextPadding](v3, "_imageToTextPadding");
    -[UIStackView setCustomSpacing:afterView:](v56, "setCustomSpacing:afterView:", v3->_imageView);
    v57 = v3->_descriptionStackView;
    -[ContinuityCaptureShieldUIContentView _defaultDescriptionPadding](v3, "_defaultDescriptionPadding");
    -[UIStackView setCustomSpacing:afterView:](v57, "setCustomSpacing:afterView:", v3->_titleLabel);
    objc_initWeak(&location, v3);
    v157[0] = _NSConcreteStackBlock;
    v157[1] = 3221225472;
    v157[2] = sub_1000096F8;
    v157[3] = &unk_100018830;
    objc_copyWeak(&v158, &location);
    v142 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v157));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _pauseButtonConfiguration](v3, "_pauseButtonConfiguration"));
    v59 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v58, v142));
    pauseButton = v3->_pauseButton;
    v3->_pauseButton = (UIButton *)v59;

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_pauseButton, "titleLabel"));
    objc_msgSend(v61, "setAdjustsFontForContentSizeCategory:", 1);

    -[UIButton setAccessibilityIdentifier:](v3->_pauseButton, "setAccessibilityIdentifier:", CFSTR("ShieldUI.pauseButton"));
    v155[0] = _NSConcreteStackBlock;
    v155[1] = 3221225472;
    v155[2] = sub_1000097D8;
    v155[3] = &unk_100018830;
    objc_copyWeak(&v156, &location);
    v138 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v155));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _facetimeButtonConfiguration](v3, "_facetimeButtonConfiguration"));
    v63 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v62, v138));
    faceTimeButton = v3->_faceTimeButton;
    v3->_faceTimeButton = (UIButton *)v63;

    v3->_inFaceTimeSession = 0;
    -[UIButton setHidden:](v3->_faceTimeButton, "setHidden:", 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_faceTimeButton, "titleLabel"));
    objc_msgSend(v65, "setAdjustsFontForContentSizeCategory:", 1);

    -[UIButton setAccessibilityIdentifier:](v3->_faceTimeButton, "setAccessibilityIdentifier:", CFSTR("ShieldUI.faceTimeButton"));
    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472;
    v153[2] = sub_100009A34;
    v153[3] = &unk_100018830;
    objc_copyWeak(&v154, &location);
    v131 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v153));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _favoritesButtonConfiguration](v3, "_favoritesButtonConfiguration"));
    v67 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v66, v131));
    favoritesButton = v3->_favoritesButton;
    v3->_favoritesButton = (UIButton *)v67;

    v3->_isDedicated = 0;
    -[UIButton setHidden:](v3->_favoritesButton, "setHidden:", -[ContinuityCaptureShieldUIContentView _shouldShowFavoritesButton](v3, "_shouldShowFavoritesButton") ^ 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_favoritesButton, "titleLabel"));
    objc_msgSend(v69, "setAdjustsFontForContentSizeCategory:", 1);

    -[UIButton setAccessibilityIdentifier:](v3->_favoritesButton, "setAccessibilityIdentifier:", CFSTR("ShieldUI.favoritesButton"));
    v151[0] = _NSConcreteStackBlock;
    v151[1] = 3221225472;
    v151[2] = sub_100009B44;
    v151[3] = &unk_100018830;
    objc_copyWeak(&v152, &location);
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v151));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _disconnectButtonConfiguration](v3, "_disconnectButtonConfiguration"));
    v71 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v70, v128));
    disconnectButton = v3->_disconnectButton;
    v3->_disconnectButton = (UIButton *)v71;

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_disconnectButton, "titleLabel"));
    objc_msgSend(v73, "setAdjustsFontForContentSizeCategory:", 1);

    -[UIButton setAccessibilityIdentifier:](v3->_disconnectButton, "setAccessibilityIdentifier:", CFSTR("ShieldUI.disconnectButton"));
    v149[0] = _NSConcreteStackBlock;
    v149[1] = 3221225472;
    v149[2] = sub_100009C24;
    v149[3] = &unk_100018830;
    objc_copyWeak(&v150, &location);
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v149));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _skipButtonConfiguration](v3, "_skipButtonConfiguration"));
    v75 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v74, v125));
    skipButton = v3->_skipButton;
    v3->_skipButton = (UIButton *)v75;

    -[UIButton setHidden:](v3->_skipButton, "setHidden:", 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_skipButton, "titleLabel"));
    objc_msgSend(v77, "setAdjustsFontForContentSizeCategory:", 1);

    -[UIButton setAccessibilityIdentifier:](v3->_skipButton, "setAccessibilityIdentifier:", CFSTR("ShieldUI.skipButton"));
    v78 = objc_alloc((Class)UIStackView);
    v162[0] = v3->_pauseButton;
    v162[1] = v3->_favoritesButton;
    v162[2] = v3->_faceTimeButton;
    v162[3] = v3->_skipButton;
    v162[4] = v3->_disconnectButton;
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v162, 5));
    v80 = (UIStackView *)objc_msgSend(v78, "initWithArrangedSubviews:", v79);
    buttonsStackView = v3->_buttonsStackView;
    v3->_buttonsStackView = v80;

    -[UIStackView setAlignment:](v3->_buttonsStackView, "setAlignment:", 0);
    -[UIStackView setAxis:](v3->_buttonsStackView, "setAxis:", 1);
    -[ContinuityCaptureShieldUIContentView _defaultButtonPadding](v3, "_defaultButtonPadding");
    -[UIStackView setSpacing:](v3->_buttonsStackView, "setSpacing:");
    -[UIStackView setDistribution:](v3->_buttonsStackView, "setDistribution:", 0);
    -[UIStackView setAccessibilityIdentifier:](v3->_buttonsStackView, "setAccessibilityIdentifier:", CFSTR("ShieldUI.buttonsStackView"));
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_descriptionStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_buttonsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_containerView, "addSubview:", v3->_descriptionStackView);
    -[UIView addSubview:](v3->_containerView, "addSubview:", v3->_buttonsStackView);
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_descriptionStackView, "leadingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3->_containerView, "leadingAnchor"));
    v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, 53.0));
    descriptionLeadingAnchor = v3->_descriptionLeadingAnchor;
    v3->_descriptionLeadingAnchor = (NSLayoutConstraint *)v84;

    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_descriptionStackView, "trailingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3->_containerView, "trailingAnchor"));
    v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:constant:", v87, -53.0));
    descriptionTrailingAnchor = v3->_descriptionTrailingAnchor;
    v3->_descriptionTrailingAnchor = (NSLayoutConstraint *)v88;

    v122 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v3->_descriptionStackView, "centerYAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3->_containerView, "centerYAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v120));
    v161[0] = v118;
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v3->_descriptionStackView, "centerXAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_containerView, "centerXAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:", v114));
    v161[1] = v112;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_descriptionStackView, "bottomAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_buttonsStackView, "topAnchor"));
    -[ContinuityCaptureShieldUIContentView _textToButtonsPadding](v3, "_textToButtonsPadding");
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintLessThanOrEqualToAnchor:constant:", v108, -v90));
    v161[2] = v107;
    v161[3] = v3->_descriptionLeadingAnchor;
    v161[4] = v3->_descriptionTrailingAnchor;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_buttonsStackView, "bottomAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_containerView, "bottomAnchor"));
    -[ContinuityCaptureShieldUIContentView _defaultButtonPadding](v3, "_defaultButtonPadding");
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:constant:", v105, -v91));
    v161[5] = v104;
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v3->_buttonsStackView, "centerXAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_containerView, "centerXAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v102));
    v161[6] = v92;
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v3->_buttonsStackView, "widthAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_containerView, "widthAnchor"));
    -[ContinuityCaptureShieldUIContentView _defaultButtonScreenWidth](v3, "_defaultButtonScreenWidth");
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:multiplier:", v94));
    v161[7] = v95;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_animationViewContainer, "widthAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToConstant:", 240.0));
    v161[8] = v97;
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v3->_animationViewContainer, "heightAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToConstant:", 240.0));
    v161[9] = v99;
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v161, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v100);

    objc_destroyWeak(&v150);
    objc_destroyWeak(&v152);

    objc_destroyWeak(&v154);
    objc_destroyWeak(&v156);

    objc_destroyWeak(&v158);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)setInFaceTimeSession:(BOOL)a3
{
  id v4;

  if (self->_inFaceTimeSession != a3)
  {
    self->_inFaceTimeSession = a3;
    -[UIButton setHidden:](self->_faceTimeButton, "setHidden:", -[ContinuityCaptureShieldUIContentView _shouldShowFaceTimeButton](self, "_shouldShowFaceTimeButton") ^ 1);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _disconnectButtonConfiguration](self, "_disconnectButtonConfiguration"));
    -[UIButton setConfiguration:](self->_disconnectButton, "setConfiguration:", v4);

  }
}

- (void)setInPlacementStep:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  ContinuityCaptureShieldUICAPackageView *v13;
  uint64_t v14;
  void *v15;
  ContinuityCaptureShieldUICAPackageView *v16;
  ContinuityCaptureShieldUICAPackageView *animationView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[4];
  id v33;
  id location;
  _QWORD v35[4];

  if (self->_inPlacementStep != a3)
  {
    v3 = a3;
    self->_inPlacementStep = a3;
    -[UIButton setHidden:](self->_pauseButton, "setHidden:");
    -[UIButton setHidden:](self->_skipButton, "setHidden:", !self->_inPlacementStep);
    -[UIImageView setHidden:](self->_imageView, "setHidden:", self->_inPlacementStep);
    -[UIButton setHidden:](self->_favoritesButton, "setHidden:", -[ContinuityCaptureShieldUIContentView _shouldShowFavoritesButton](self, "_shouldShowFavoritesButton") ^ 1);
    -[UIView setHidden:](self->_animationViewContainer, "setHidden:", !self->_inPlacementStep);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _disconnectButtonConfiguration](self, "_disconnectButtonConfiguration"));
    -[UIButton setConfiguration:](self->_disconnectButton, "setConfiguration:", v5);

    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultTextColor](self, "_defaultTextColor"));
      v7 = 20.0;
      v8 = -20.0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultSecondaryTextColor](self, "_defaultSecondaryTextColor"));
      v7 = 53.0;
      v8 = -53.0;
    }
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v6);

    -[NSLayoutConstraint setConstant:](self->_descriptionLeadingAnchor, "setConstant:", v7);
    -[NSLayoutConstraint setConstant:](self->_descriptionTrailingAnchor, "setConstant:", v8);
    -[ContinuityCaptureShieldUIContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    if (v3)
    {
      if (!self->_animationView)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v10 = objc_msgSend(v9, "userInterfaceIdiom");

        v11 = CFSTR("iPhone_Rotate");
        if (v10 == (id)1)
          v11 = CFSTR("iPad_Static");
        v12 = v11;
        v13 = [ContinuityCaptureShieldUICAPackageView alloc];
        v14 = kCAPackageTypeArchive;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = -[ContinuityCaptureShieldUICAPackageView initWithPackageName:type:inBundle:](v13, "initWithPackageName:type:inBundle:", v12, v14, v15);

        animationView = self->_animationView;
        self->_animationView = v16;

        -[ContinuityCaptureShieldUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:](self->_animationView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIView addSubview:](self->_animationViewContainer, "addSubview:", self->_animationView);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUICAPackageView leftAnchor](self->_animationView, "leftAnchor"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_animationViewContainer, "leftAnchor"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
        v35[0] = v29;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUICAPackageView rightAnchor](self->_animationView, "rightAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_animationViewContainer, "rightAnchor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
        v35[1] = v26;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUICAPackageView topAnchor](self->_animationView, "topAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_animationViewContainer, "topAnchor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
        v35[2] = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUICAPackageView bottomAnchor](self->_animationView, "bottomAnchor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_animationViewContainer, "bottomAnchor"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
        v35[3] = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

        -[ContinuityCaptureShieldUIContentView layoutIfNeeded](self, "layoutIfNeeded");
        -[ContinuityCaptureShieldUICAPackageView setState:](self->_animationView, "setState:", CFSTR("Static"));
      }
      objc_initWeak(&location, self);
      v25 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A230;
      block[3] = &unk_100018678;
      objc_copyWeak(&v33, &location);
      dispatch_after(v25, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setIsDedicatedSession:(BOOL)a3
{
  if (self->_isDedicated != a3)
  {
    self->_isDedicated = a3;
    -[UIButton setHidden:](self->_favoritesButton, "setHidden:", -[ContinuityCaptureShieldUIContentView _shouldShowFavoritesButton](self, "_shouldShowFavoritesButton") ^ 1);
    -[UIButton setHidden:](self->_faceTimeButton, "setHidden:", -[ContinuityCaptureShieldUIContentView _shouldShowFaceTimeButton](self, "_shouldShowFaceTimeButton") ^ 1);
  }
}

- (void)setPrimaryText:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)setSecondaryText:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
}

- (void)setPauseButtonState:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  NSAttributedStringKey *v10;
  void *v11;
  id v12;
  NSAttributedStringKey v13;
  void *v14;
  NSAttributedStringKey v15;
  void *v16;

  switch(a3)
  {
    case 2uLL:
      -[UIButton setHidden:](self->_pauseButton, "setHidden:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_pauseButton, "configuration"));
      v5 = objc_alloc((Class)NSAttributedString);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_RESUME"), &stru_100018A18, 0));
      v13 = NSFontAttributeName;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultButtonTextFont](self, "_defaultButtonTextFont"));
      v14 = v8;
      v9 = &v14;
      v10 = &v13;
      goto LABEL_7;
    case 1uLL:
      -[UIButton setHidden:](self->_pauseButton, "setHidden:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_pauseButton, "configuration"));
      v5 = objc_alloc((Class)NSAttributedString);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_PAUSE"), &stru_100018A18, 0));
      v15 = NSFontAttributeName;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultButtonTextFont](self, "_defaultButtonTextFont"));
      v16 = v8;
      v9 = &v16;
      v10 = &v15;
LABEL_7:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v10, 1));
      v12 = objc_msgSend(v5, "initWithString:attributes:", v7, v11);
      objc_msgSend(v4, "setAttributedTitle:", v12);

      -[UIButton setConfiguration:](self->_pauseButton, "setConfiguration:", v4);
      return;
    case 0uLL:
      -[UIButton setHidden:](self->_pauseButton, "setHidden:", 1);
      break;
  }
}

- (void)_setPullFaceTimeButtonLoading:(BOOL)a3
{
  UIButton *faceTimeButton;
  void *v5;

  self->_pullFaceTimeButtonLoading = a3;
  faceTimeButton = self->_faceTimeButton;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _facetimeButtonConfiguration](self, "_facetimeButtonConfiguration"));
  -[UIButton setConfiguration:](faceTimeButton, "setConfiguration:", v5);

  -[UIButton setHidden:](self->_faceTimeButton, "setHidden:", -[ContinuityCaptureShieldUIContentView _shouldShowFaceTimeButton](self, "_shouldShowFaceTimeButton") ^ 1);
}

- (BOOL)_shouldShowFaceTimeButton
{
  if (self->_isDedicated)
    return 0;
  if (self->_inFaceTimeSession)
    return 1;
  return self->_pullFaceTimeButtonLoading;
}

- (BOOL)_shouldShowFavoritesButton
{
  return self->_isDedicated && !self->_inPlacementStep;
}

- (id)_defaultTextFont
{
  return +[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleTitle2, 1024);
}

- (id)_defaultTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)_defaultSecondaryTextFont
{
  return +[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleBody, 0);
}

- (id)_defaultButtonTextFont
{
  return +[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleBody, 1024);
}

- (id)_defaultSecondaryTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (double)_defaultButtonPadding
{
  return 5.0;
}

- (double)_defaultDescriptionPadding
{
  return 9.0;
}

- (double)_defaultButtonScreenWidth
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)1)
    v3 = 0.5;
  else
    v3 = 0.666666667;

  return v3;
}

- (double)_defaultDescriptionScreenWidth
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)1)
    v3 = 0.5;
  else
    v3 = 0.8;

  return v3;
}

- (double)_imageToTextPadding
{
  return 18.0;
}

- (double)_textToButtonsPadding
{
  return 20.0;
}

- (id)_defaultImageSymbolConfiguration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v4, 96.0);
  v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v6);
}

- (id)_pauseButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSAttributedStringKey v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  objc_msgSend(v3, "setButtonSize:", 3);
  objc_msgSend(v3, "setCornerStyle:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
  objc_msgSend(v3, "setBaseForegroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_PAUSE"), &stru_100018A18, 0));

  v7 = objc_alloc((Class)NSAttributedString);
  v13 = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultButtonTextFont](self, "_defaultButtonTextFont"));
  v14 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = objc_msgSend(v7, "initWithString:attributes:", v6, v9);
  objc_msgSend(v3, "setAttributedTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  objc_msgSend(v3, "setBaseBackgroundColor:", v11);

  return v3;
}

- (id)_facetimeButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSAttributedStringKey v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  objc_msgSend(v3, "setButtonSize:", 3);
  objc_msgSend(v3, "setCornerStyle:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  objc_msgSend(v3, "setBaseForegroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  objc_msgSend(v3, "setBaseBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_SWITCH_%@"), &stru_100018A18, 0));
  v10 = CFSTR("iPhone");
  if (v6 == (id)1)
  {
    v10 = CFSTR("iPad");
    v11 = CFSTR("ipad.and.arrow.forward");
  }
  else
  {
    v11 = CFSTR("iphone.and.arrow.forward");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10));

  v13 = objc_alloc((Class)NSAttributedString);
  v19 = NSFontAttributeName;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultButtonTextFont](self, "_defaultButtonTextFont"));
  v20 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v16 = objc_msgSend(v13, "initWithString:attributes:", v12, v15);
  objc_msgSend(v3, "setAttributedTitle:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v11));
  objc_msgSend(v3, "setImage:", v17);

  objc_msgSend(v3, "setImagePadding:", 6.0);
  objc_msgSend(v3, "setShowsActivityIndicator:", self->_pullFaceTimeButtonLoading);

  return v3;
}

- (id)_favoritesButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSAttributedStringKey v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  objc_msgSend(v3, "setButtonSize:", 3);
  objc_msgSend(v3, "setCornerStyle:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
  objc_msgSend(v3, "setBaseForegroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  objc_msgSend(v3, "setBaseBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_FAVORITES"), &stru_100018A18, 0));

  v8 = objc_alloc((Class)NSAttributedString);
  v14 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultButtonTextFont](self, "_defaultButtonTextFont"));
  v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v11 = objc_msgSend(v8, "initWithString:attributes:", v7, v10);
  objc_msgSend(v3, "setAttributedTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("star.circle.badge.person.crop")));
  objc_msgSend(v3, "setImage:", v12);

  objc_msgSend(v3, "setImagePadding:", 6.0);
  return v3;
}

- (id)_disconnectButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSAttributedStringKey v22;
  void *v23;

  if (self->_inPlacementStep)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  v4 = v3;
  objc_msgSend(v3, "setButtonSize:", 3);
  objc_msgSend(v4, "setCornerStyle:", 3);
  if (self->_inPlacementStep)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    objc_msgSend(v4, "setBaseForegroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_DISCONNECT"), &stru_100018A18, 0));

    v8 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v7, &__NSDictionary0__struct);
    objc_msgSend(v4, "setAttributedTitle:", v8);

    objc_msgSend(v4, "setImage:", 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    objc_msgSend(v4, "setBaseForegroundColor:", v9);

    objc_msgSend(v4, "setImagePadding:", 6.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    objc_msgSend(v4, "setBaseBackgroundColor:", v10);

    LODWORD(v10) = self->_inFaceTimeSession;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    if ((_DWORD)v10)
      v13 = CFSTR("BUTTON_TITLE_END_CALL_AND_DISCONNECT");
    else
      v13 = CFSTR("BUTTON_TITLE_DISCONNECT");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_100018A18, 0));

    v14 = objc_alloc((Class)NSAttributedString);
    v22 = NSFontAttributeName;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIContentView _defaultButtonTextFont](self, "_defaultButtonTextFont"));
    v23 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v17 = objc_msgSend(v14, "initWithString:attributes:", v7, v16);
    objc_msgSend(v4, "setAttributedTitle:", v17);

    objc_msgSend(v4, "setTitleLineBreakMode:", 0);
    if (self->_inFaceTimeSession)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("phone.down.fill")));
      objc_msgSend(v4, "setImage:", v18);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleSubheadline));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageByApplyingSymbolConfiguration:", v19));
      objc_msgSend(v4, "setImage:", v20);

    }
  }

  objc_msgSend(v4, "contentInsets");
  objc_msgSend(v4, "setContentInsets:");
  return v4;
}

- (id)_skipButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration"));
  objc_msgSend(v2, "setButtonSize:", 3);
  objc_msgSend(v2, "setCornerStyle:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v2, "setBaseForegroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_SKIP_THIS_STEP"), &stru_100018A18, 0));
  objc_msgSend(v2, "setTitle:", v5);

  return v2;
}

- (ContinuityCaptureShieldUIContentViewDelegate)delegate
{
  return (ContinuityCaptureShieldUIContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (ContinuityCaptureShieldUICAPackageView)animationView
{
  return self->_animationView;
}

- (UIView)animationViewContainer
{
  return self->_animationViewContainer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (NSLayoutConstraint)descriptionLeadingAnchor
{
  return self->_descriptionLeadingAnchor;
}

- (NSLayoutConstraint)descriptionTrailingAnchor
{
  return self->_descriptionTrailingAnchor;
}

- (UIButton)pauseButton
{
  return self->_pauseButton;
}

- (UIButton)faceTimeButton
{
  return self->_faceTimeButton;
}

- (UIButton)disconnectButton
{
  return self->_disconnectButton;
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (UIButton)favoritesButton
{
  return self->_favoritesButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_disconnectButton, 0);
  objc_storeStrong((id *)&self->_faceTimeButton, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);
  objc_storeStrong((id *)&self->_descriptionTrailingAnchor, 0);
  objc_storeStrong((id *)&self->_descriptionLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_animationViewContainer, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_descriptionStackView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_accessibilityScrollView, 0);
}

@end
