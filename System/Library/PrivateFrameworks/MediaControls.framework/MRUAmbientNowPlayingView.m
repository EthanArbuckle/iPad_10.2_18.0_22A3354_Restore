@implementation MRUAmbientNowPlayingView

- (MRUAmbientNowPlayingView)initWithFrame:(CGRect)a3
{
  MRUAmbientNowPlayingView *v3;
  void *v4;
  UILayoutGuide *v5;
  UILayoutGuide *boundsLayoutGuide;
  UILayoutGuide *v7;
  UILayoutGuide *transportControlsLayoutGuide;
  UILayoutGuide *v9;
  UILayoutGuide *leftButtonLayoutGuide;
  UILayoutGuide *v11;
  UILayoutGuide *rightButtonLayoutGuide;
  UILayoutGuide *v13;
  UILayoutGuide *labelViewLayoutGuide;
  MRUFlippingArtworkView *v15;
  MRUFlippingArtworkView *artworkView;
  MRUNowPlayingLabelView *v17;
  MRUNowPlayingLabelView *labelView;
  MRUNowPlayingTimeControlsView *v19;
  MRUNowPlayingTimeControlsView *timeControlsView;
  double v21;
  uint64_t v22;
  MRUTransportButton *centerButton;
  uint64_t v24;
  MRUTransportButton *leftButton;
  uint64_t v26;
  MRUTransportButton *rightButton;
  uint64_t v28;
  UIImageSymbolConfiguration *leftRightTransportButtonsSymbolConfiguration;
  uint64_t v30;
  MRUTransportButton *routingButton;
  void *v32;
  uint64_t v33;
  UIImageSymbolConfiguration *routingButtonSymbolConfiguration;
  uint64_t v35;
  UIImageSymbolConfiguration *routingButtonSymbolConfigurationSmall;
  MRUAmbientNowPlayingVolumeControlsView *v37;
  MRUAmbientNowPlayingVolumeControlsView *volumeControlsView;
  void *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)MRUAmbientNowPlayingView;
  v3 = -[MRUAmbientNowPlayingView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUAmbientNowPlayingView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    boundsLayoutGuide = v3->_boundsLayoutGuide;
    v3->_boundsLayoutGuide = v5;

    -[MRUAmbientNowPlayingView addLayoutGuide:](v3, "addLayoutGuide:", v3->_boundsLayoutGuide);
    v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    transportControlsLayoutGuide = v3->_transportControlsLayoutGuide;
    v3->_transportControlsLayoutGuide = v7;

    -[MRUAmbientNowPlayingView addLayoutGuide:](v3, "addLayoutGuide:", v3->_transportControlsLayoutGuide);
    v9 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    leftButtonLayoutGuide = v3->_leftButtonLayoutGuide;
    v3->_leftButtonLayoutGuide = v9;

    -[MRUAmbientNowPlayingView addLayoutGuide:](v3, "addLayoutGuide:", v3->_leftButtonLayoutGuide);
    v11 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    rightButtonLayoutGuide = v3->_rightButtonLayoutGuide;
    v3->_rightButtonLayoutGuide = v11;

    -[MRUAmbientNowPlayingView addLayoutGuide:](v3, "addLayoutGuide:", v3->_rightButtonLayoutGuide);
    v13 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    labelViewLayoutGuide = v3->_labelViewLayoutGuide;
    v3->_labelViewLayoutGuide = v13;

    -[MRUAmbientNowPlayingView addLayoutGuide:](v3, "addLayoutGuide:", v3->_labelViewLayoutGuide);
    v15 = objc_alloc_init(MRUFlippingArtworkView);
    artworkView = v3->_artworkView;
    v3->_artworkView = v15;

    -[MRUFlippingArtworkView setStyle:](v3->_artworkView, "setStyle:", 10);
    -[MRUAmbientNowPlayingView addSubview:](v3, "addSubview:", v3->_artworkView);
    v17 = objc_alloc_init(MRUNowPlayingLabelView);
    labelView = v3->_labelView;
    v3->_labelView = v17;

    -[MRUNowPlayingLabelView setLayout:](v3->_labelView, "setLayout:", 3);
    -[MRUNowPlayingLabelView setTextAlignment:](v3->_labelView, "setTextAlignment:", 1);
    -[MRUNowPlayingLabelView setMarqueeFadeEdgeInsets:](v3->_labelView, "setMarqueeFadeEdgeInsets:", 0.0, 48.0, 0.0, 48.0);
    -[MRUNowPlayingLabelView setMarqueeContentGap:](v3->_labelView, "setMarqueeContentGap:", 96.0);
    -[MRUNowPlayingLabelView setShowRoute:](v3->_labelView, "setShowRoute:", 0);
    -[MRUAmbientNowPlayingView addSubview:](v3, "addSubview:", v3->_labelView);
    v19 = objc_alloc_init(MRUNowPlayingTimeControlsView);
    timeControlsView = v3->_timeControlsView;
    v3->_timeControlsView = v19;

    -[MRUNowPlayingTimeControlsView setLayout:](v3->_timeControlsView, "setLayout:", 2);
    -[MRUNowPlayingTimeControlsView setSliderHeight:](v3->_timeControlsView, "setSliderHeight:", 14.0);
    -[MRUNowPlayingTimeControlsView setSliderExpansionFactor:](v3->_timeControlsView, "setSliderExpansionFactor:", 1.78571429);
    -[MRUAmbientNowPlayingView addSubview:](v3, "addSubview:", v3->_timeControlsView);
    if (MRUIsSmallScreen())
      v21 = 1.5;
    else
      v21 = 2.0;
    +[MPButton easyTouchButtonWithType:](MRUTransportButton, "easyTouchButtonWithType:", 0);
    v22 = objc_claimAutoreleasedReturnValue();
    centerButton = v3->_centerButton;
    v3->_centerButton = (MRUTransportButton *)v22;

    -[MRUTransportButton setPackageScale:](v3->_centerButton, "setPackageScale:", v21);
    -[MRUAmbientNowPlayingView addSubview:](v3, "addSubview:", v3->_centerButton);
    +[MPButton easyTouchButtonWithType:](MRUHoldTransportButton, "easyTouchButtonWithType:", 0);
    v24 = objc_claimAutoreleasedReturnValue();
    leftButton = v3->_leftButton;
    v3->_leftButton = (MRUTransportButton *)v24;

    -[MRUTransportButton setPackageScale:](v3->_leftButton, "setPackageScale:", v21);
    -[MRUAmbientNowPlayingView addSubview:](v3, "addSubview:", v3->_leftButton);
    +[MPButton easyTouchButtonWithType:](MRUHoldTransportButton, "easyTouchButtonWithType:", 0);
    v26 = objc_claimAutoreleasedReturnValue();
    rightButton = v3->_rightButton;
    v3->_rightButton = (MRUTransportButton *)v26;

    -[MRUTransportButton setPackageScale:](v3->_rightButton, "setPackageScale:", v21);
    -[MRUAmbientNowPlayingView addSubview:](v3, "addSubview:", v3->_rightButton);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 3, 32.0);
    v28 = objc_claimAutoreleasedReturnValue();
    leftRightTransportButtonsSymbolConfiguration = v3->_leftRightTransportButtonsSymbolConfiguration;
    v3->_leftRightTransportButtonsSymbolConfiguration = (UIImageSymbolConfiguration *)v28;

    +[MPButton easyTouchButtonWithType:](MRUTransportButton, "easyTouchButtonWithType:", 0);
    v30 = objc_claimAutoreleasedReturnValue();
    routingButton = v3->_routingButton;
    v3->_routingButton = (MRUTransportButton *)v30;

    -[MRUTransportButton imageView](v3->_routingButton, "imageView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setClipsToBounds:", 0);

    -[MRUAmbientNowPlayingView addSubview:](v3, "addSubview:", v3->_routingButton);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, -1, 28.0);
    v33 = objc_claimAutoreleasedReturnValue();
    routingButtonSymbolConfiguration = v3->_routingButtonSymbolConfiguration;
    v3->_routingButtonSymbolConfiguration = (UIImageSymbolConfiguration *)v33;

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, -1, 24.0);
    v35 = objc_claimAutoreleasedReturnValue();
    routingButtonSymbolConfigurationSmall = v3->_routingButtonSymbolConfigurationSmall;
    v3->_routingButtonSymbolConfigurationSmall = (UIImageSymbolConfiguration *)v35;

    v37 = objc_alloc_init(MRUAmbientNowPlayingVolumeControlsView);
    volumeControlsView = v3->_volumeControlsView;
    v3->_volumeControlsView = v37;

    -[MRUAmbientNowPlayingVolumeControlsView setSliderExpansionFactor:](v3->_volumeControlsView, "setSliderExpansionFactor:", 1.78571429);
    -[MRUAmbientNowPlayingVolumeControlsView slider](v3->_volumeControlsView, "slider");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:", v3);

    -[MRUAmbientNowPlayingView addSubview:](v3, "addSubview:", v3->_volumeControlsView);
    -[MRUAmbientNowPlayingView createConstraints](v3, "createConstraints");
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MRUAmbientNowPlayingView;
  -[MRUAmbientNowPlayingView layoutSubviews](&v15, sel_layoutSubviews);
  -[MRUAmbientNowPlayingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUAmbientNowPlayingView backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[MRUNowPlayingLabelView estimatedHeight](self->_labelView, "estimatedHeight");
  v13 = v12;
  -[NSLayoutConstraint setConstant:](self->_transportControlsLayoutGuideTopConstraint, "setConstant:");
  -[MRUNowPlayingTimeControlsView intrinsicContentSize](self->_timeControlsView, "intrinsicContentSize");
  -[NSLayoutConstraint setConstant:](self->_transportControlsLayoutGuideBottomConstraint, "setConstant:", -v14);
  -[NSLayoutConstraint setConstant:](self->_labelViewLayoutGuideHeightConstraint, "setConstant:", v13);
}

- (void)safeAreaInsetsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUAmbientNowPlayingView;
  -[MRUAmbientNowPlayingView safeAreaInsetsDidChange](&v8, sel_safeAreaInsetsDidChange);
  -[MRUAmbientNowPlayingView safeAreaInsets](self, "safeAreaInsets");
  if (v3 < v5)
    v3 = v5;
  if (v3 < v4)
    v3 = v4;
  if (v3 < v6)
    v3 = v6;
  if (v3 > 0.0)
  {
    v7 = v3 + 8.0;
    -[NSLayoutConstraint setConstant:](self->_boundsLayoutGuideLeadingConstraint, "setConstant:", v3 + 8.0);
    -[NSLayoutConstraint setConstant:](self->_boundsLayoutGuideTrailingConstraint, "setConstant:", v7);
  }
}

- (void)createConstraints
{
  double v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *boundsLayoutGuideLeadingConstraint;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *boundsLayoutGuideTrailingConstraint;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *transportControlsLayoutGuideTopConstraint;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *transportControlsLayoutGuideBottomConstraint;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *labelViewLayoutGuideHeightConstraint;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  _QWORD v126[43];

  v126[41] = *MEMORY[0x1E0C80C00];
  -[MRUFlippingArtworkView setTranslatesAutoresizingMaskIntoConstraints:](self->_artworkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MRUNowPlayingTimeControlsView setTranslatesAutoresizingMaskIntoConstraints:](self->_timeControlsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MRUTransportButton setTranslatesAutoresizingMaskIntoConstraints:](self->_routingButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MRUAmbientNowPlayingVolumeControlsView setTranslatesAutoresizingMaskIntoConstraints:](self->_volumeControlsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MRUNowPlayingLabelView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MRUTransportButton setTranslatesAutoresizingMaskIntoConstraints:](self->_centerButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MRUTransportButton setTranslatesAutoresizingMaskIntoConstraints:](self->_leftButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MRUTransportButton setTranslatesAutoresizingMaskIntoConstraints:](self->_rightButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = 70.0;
  if (MRUIsSmallScreen())
    v3 = 70.0 * 0.0;
  v92 = (void *)MEMORY[0x1E0CB3718];
  -[UILayoutGuide leadingAnchor](self->_boundsLayoutGuide, "leadingAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingView leadingAnchor](self, "leadingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:constant:", v124, 55.0);
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  boundsLayoutGuideLeadingConstraint = self->_boundsLayoutGuideLeadingConstraint;
  self->_boundsLayoutGuideLeadingConstraint = v4;

  v126[0] = v4;
  -[MRUAmbientNowPlayingView trailingAnchor](self, "trailingAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_boundsLayoutGuide, "trailingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:constant:", v122, 55.0);
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  boundsLayoutGuideTrailingConstraint = self->_boundsLayoutGuideTrailingConstraint;
  self->_boundsLayoutGuideTrailingConstraint = v6;

  v126[1] = v6;
  -[UILayoutGuide topAnchor](self->_boundsLayoutGuide, "topAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingView topAnchor](self, "topAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:constant:", v120, 46.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v126[2] = v119;
  -[MRUAmbientNowPlayingView bottomAnchor](self, "bottomAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_boundsLayoutGuide, "bottomAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:constant:", v117, 46.0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v126[3] = v116;
  -[UILayoutGuide topAnchor](self->_transportControlsLayoutGuide, "topAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_labelViewLayoutGuide, "topAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:", v114);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  transportControlsLayoutGuideTopConstraint = self->_transportControlsLayoutGuideTopConstraint;
  self->_transportControlsLayoutGuideTopConstraint = v8;

  v126[4] = v8;
  -[UILayoutGuide bottomAnchor](self->_transportControlsLayoutGuide, "bottomAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_boundsLayoutGuide, "bottomAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v112);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  transportControlsLayoutGuideBottomConstraint = self->_transportControlsLayoutGuideBottomConstraint;
  self->_transportControlsLayoutGuideBottomConstraint = v10;

  v126[5] = v10;
  -[UILayoutGuide leftAnchor](self->_leftButtonLayoutGuide, "leftAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingTimeControlsView leftAnchor](self->_timeControlsView, "leftAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v110);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v126[6] = v109;
  -[UILayoutGuide rightAnchor](self->_leftButtonLayoutGuide, "rightAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton leftAnchor](self->_centerButton, "leftAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v126[7] = v106;
  -[UILayoutGuide leftAnchor](self->_rightButtonLayoutGuide, "leftAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton rightAnchor](self->_centerButton, "rightAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v104);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v126[8] = v103;
  -[UILayoutGuide rightAnchor](self->_rightButtonLayoutGuide, "rightAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingTimeControlsView rightAnchor](self->_timeControlsView, "rightAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v101);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v126[9] = v100;
  -[UILayoutGuide topAnchor](self->_labelViewLayoutGuide, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton bottomAnchor](self->_routingButton, "bottomAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v98, 12.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v126[10] = v97;
  -[UILayoutGuide heightAnchor](self->_labelViewLayoutGuide, "heightAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToConstant:", 0.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelViewLayoutGuideHeightConstraint = self->_labelViewLayoutGuideHeightConstraint;
  self->_labelViewLayoutGuideHeightConstraint = v12;

  v126[11] = v12;
  -[MRUFlippingArtworkView leadingAnchor](self->_artworkView, "leadingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_boundsLayoutGuide, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v126[12] = v93;
  -[MRUFlippingArtworkView topAnchor](self->_artworkView, "topAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_boundsLayoutGuide, "topAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v90);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v126[13] = v89;
  -[MRUFlippingArtworkView bottomAnchor](self->_artworkView, "bottomAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_boundsLayoutGuide, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v126[14] = v86;
  -[MRUFlippingArtworkView widthAnchor](self->_artworkView, "widthAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUFlippingArtworkView heightAnchor](self->_artworkView, "heightAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v126[15] = v83;
  -[MRUNowPlayingTimeControlsView leadingAnchor](self->_timeControlsView, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUFlippingArtworkView trailingAnchor](self->_artworkView, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, 56.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v126[16] = v80;
  -[MRUNowPlayingTimeControlsView trailingAnchor](self->_timeControlsView, "trailingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_boundsLayoutGuide, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v126[17] = v77;
  -[MRUNowPlayingTimeControlsView bottomAnchor](self->_timeControlsView, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_boundsLayoutGuide, "bottomAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, 4.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v126[18] = v74;
  -[MRUTransportButton topAnchor](self->_routingButton, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_boundsLayoutGuide, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v126[19] = v71;
  -[MRUTransportButton trailingAnchor](self->_routingButton, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingTimeControlsView trailingAnchor](self->_timeControlsView, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v126[20] = v67;
  -[MRUTransportButton widthAnchor](self->_routingButton, "widthAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToConstant:", 32.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v126[21] = v64;
  -[MRUTransportButton heightAnchor](self->_routingButton, "heightAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToConstant:", 32.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v126[22] = v62;
  -[MRUTransportButton leadingAnchor](self->_routingButton, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingVolumeControlsView trailingAnchor](self->_volumeControlsView, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 20.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v126[23] = v58;
  -[MRUAmbientNowPlayingVolumeControlsView leadingAnchor](self->_volumeControlsView, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingTimeControlsView leadingAnchor](self->_timeControlsView, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v126[24] = v54;
  -[MRUAmbientNowPlayingVolumeControlsView centerYAnchor](self->_volumeControlsView, "centerYAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton centerYAnchor](self->_routingButton, "centerYAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v126[25] = v51;
  -[MRUNowPlayingLabelView centerYAnchor](self->_labelView, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_labelViewLayoutGuide, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v126[26] = v48;
  -[MRUNowPlayingLabelView leadingAnchor](self->_labelView, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingTimeControlsView leadingAnchor](self->_timeControlsView, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 48.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v126[27] = v45;
  -[MRUNowPlayingLabelView trailingAnchor](self->_labelView, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingTimeControlsView trailingAnchor](self->_timeControlsView, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v44, -48.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v126[28] = v43;
  -[MRUTransportButton centerYAnchor](self->_centerButton, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_transportControlsLayoutGuide, "centerYAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1144750080;
  objc_msgSend(v42, "mru_constraintEqualToAnchor:priority:", v57, v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v126[29] = v41;
  -[MRUTransportButton centerXAnchor](self->_centerButton, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingTimeControlsView centerXAnchor](self->_timeControlsView, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v126[30] = v38;
  -[MRUTransportButton widthAnchor](self->_centerButton, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToConstant:", v3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v126[31] = v36;
  -[MRUTransportButton heightAnchor](self->_centerButton, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", v3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v126[32] = v34;
  -[MRUTransportButton centerYAnchor](self->_leftButton, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton centerYAnchor](self->_centerButton, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v126[33] = v31;
  -[MRUTransportButton centerXAnchor](self->_leftButton, "centerXAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerXAnchor](self->_leftButtonLayoutGuide, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v61);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v126[34] = v29;
  -[MRUTransportButton widthAnchor](self->_leftButton, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v126[35] = v27;
  -[MRUTransportButton heightAnchor](self->_leftButton, "heightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToConstant:", v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v126[36] = v26;
  -[MRUTransportButton centerYAnchor](self->_rightButton, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton centerYAnchor](self->_centerButton, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v126[37] = v16;
  -[MRUTransportButton centerXAnchor](self->_rightButton, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerXAnchor](self->_rightButtonLayoutGuide, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v126[38] = v19;
  -[MRUTransportButton widthAnchor](self->_rightButton, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v126[39] = v21;
  -[MRUTransportButton heightAnchor](self->_rightButton, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v126[40] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 41);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "activateConstraints:", v24);

}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  v7 = v5;
  if (stylingProvider != v5)
  {
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUNowPlayingLabelView setStylingProvider:](self->_labelView, "setStylingProvider:", v7);
    -[MRUNowPlayingTimeControlsView setStylingProvider:](self->_timeControlsView, "setStylingProvider:", v7);
    -[MRUTransportButton setStylingProvider:](self->_leftButton, "setStylingProvider:", v7);
    -[MRUTransportButton setStylingProvider:](self->_centerButton, "setStylingProvider:", v7);
    -[MRUTransportButton setStylingProvider:](self->_rightButton, "setStylingProvider:", v7);
    -[MRUAmbientNowPlayingVolumeControlsView setStylingProvider:](self->_volumeControlsView, "setStylingProvider:", v7);
    -[MRUFlippingArtworkView setStylingProvider:](self->_artworkView, "setStylingProvider:", v7);
    -[MRUAmbientNowPlayingView updateVisualStyling](self, "updateVisualStyling");
  }

}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_onScreen != a3)
  {
    v3 = a3;
    self->_onScreen = a3;
    -[MRUNowPlayingTimeControlsView setOnScreen:](self->_timeControlsView, "setOnScreen:");
    -[MRUAmbientNowPlayingVolumeControlsView setOnScreen:](self->_volumeControlsView, "setOnScreen:", v3);
    -[MRUFlippingArtworkView setOnScreen:](self->_artworkView, "setOnScreen:", v3);
  }
}

- (void)setNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "placeholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingLabelView setPlaceholder:](self->_labelView, "setPlaceholder:", v5);

  -[MRUNowPlayingLabelView setShowPlaceholder:](self->_labelView, "setShowPlaceholder:", objc_msgSend(v4, "showPlaceholder"));
  objc_msgSend(v4, "stringForComponents:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingLabelView setTitle:](self->_labelView, "setTitle:", v6);

  objc_msgSend(v4, "stringForComponents:", 58);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingLabelView setSubtitle:](self->_labelView, "setSubtitle:", v7);

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUFlippingArtworkView setItemIdentifier:](self->_artworkView, "setItemIdentifier:", v8);

  v9 = objc_msgSend(v4, "isPlaying");
  -[MRUFlippingArtworkView setPlaying:](self->_artworkView, "setPlaying:", v9);
}

- (void)setTransportControls:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "leftItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton setTransportControlItem:](self->_leftButton, "setTransportControlItem:", v5);

  objc_msgSend(v4, "centerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton setTransportControlItem:](self->_centerButton, "setTransportControlItem:", v6);

  objc_msgSend(v4, "rightItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUTransportButton setTransportControlItem:](self->_rightButton, "setTransportControlItem:", v7);
  -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](self->_leftButton, "setPreferredSymbolConfiguration:forImageInState:", self->_leftRightTransportButtonsSymbolConfiguration, 0);
  -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](self->_rightButton, "setPreferredSymbolConfiguration:forImageInState:", self->_leftRightTransportButtonsSymbolConfiguration, 0);
}

- (void)setRoutingButtonImage:(id)a3
{
  id v4;
  int *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  MRUTransportButton *routingButton;
  void *v12;
  id v13;

  v4 = a3;
  v5 = &OBJC_IVAR___MRUAmbientNowPlayingView__routingButtonSymbolConfiguration;
  v13 = v4;
  if (v4)
  {
    objc_msgSend(v4, "size");
    v7 = v6;
    objc_msgSend(v13, "size");
    if (v7 / v8 > 1.1)
      v5 = &OBJC_IVAR___MRUAmbientNowPlayingView__routingButtonSymbolConfigurationSmall;
  }
  v9 = *(id *)((char *)&self->super.super.super.isa + *v5);
  objc_msgSend(v13, "imageByApplyingSymbolConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  routingButton = self->_routingButton;
  +[MRUAsset image:](MRUAsset, "image:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton setAsset:animated:](routingButton, "setAsset:animated:", v12, self->_onScreen);

}

- (void)setBackgroundView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);

  if (WeakRetained != v4)
  {
    v6 = objc_loadWeakRetained((id *)&self->_backgroundView);
    objc_msgSend(v6, "removeFromSuperview");

    objc_storeWeak((id *)&self->_backgroundView, v4);
    if (v4)
    {
      if (self->_onScreen)
      {
        objc_msgSend(v4, "setAlpha:", 0.0);
        -[MRUAmbientNowPlayingView insertSubview:atIndex:](self, "insertSubview:atIndex:", v4, 0);
        v7 = (void *)MEMORY[0x1E0DC3F10];
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __46__MRUAmbientNowPlayingView_setBackgroundView___block_invoke;
        v8[3] = &unk_1E5818C88;
        v9 = v4;
        objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 327680, v8, 0, 0.5, 0.0);

      }
      else
      {
        -[MRUAmbientNowPlayingView insertSubview:atIndex:](self, "insertSubview:atIndex:", v4, 0);
      }
    }
  }

}

uint64_t __46__MRUAmbientNowPlayingView_setBackgroundView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)sliderInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4
{
  double right;
  double left;
  MRUAmbientNowPlayingVolumeControlsView *volumeControlsView;
  id v8;
  id v9;
  void *v10;
  MRUTransportButton *routingButton;
  CGAffineTransform v12;
  CGAffineTransform v13;

  right = a4.right;
  left = a4.left;
  volumeControlsView = self->_volumeControlsView;
  v8 = a3;
  -[MRUAmbientNowPlayingVolumeControlsView slider](volumeControlsView, "slider");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    -[MRUAmbientNowPlayingView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "layoutDirection") == 1)
      right = left;

    CGAffineTransformMakeTranslation(&v13, right, 0.0);
    routingButton = self->_routingButton;
    v12 = v13;
    -[MRUTransportButton setTransform:](routingButton, "setTransform:", &v12);
  }
}

- (void)updateVisualStyling
{
  void *v3;
  void *v4;
  id v5;

  -[MRUAmbientNowPlayingView stylingProvider](self, "stylingProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyBlendModeToView:", self->_routingButton);

  -[MRUVisualStylingProvider blendColorForStyle:](self->_stylingProvider, "blendColorForStyle:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton imageView](self->_routingButton, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIView)backgroundView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (MRUFlippingArtworkView)artworkView
{
  return self->_artworkView;
}

- (MRUNowPlayingLabelView)labelView
{
  return self->_labelView;
}

- (MRUNowPlayingTimeControlsView)timeControlsView
{
  return self->_timeControlsView;
}

- (MRUTransportButton)leftButton
{
  return self->_leftButton;
}

- (MRUTransportButton)centerButton
{
  return self->_centerButton;
}

- (MRUTransportButton)rightButton
{
  return self->_rightButton;
}

- (MRUTransportButton)routingButton
{
  return self->_routingButton;
}

- (MRUAmbientNowPlayingVolumeControlsView)volumeControlsView
{
  return self->_volumeControlsView;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (NSLayoutConstraint)artworkViewTopConstraint
{
  return self->_artworkViewTopConstraint;
}

- (void)setArtworkViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_artworkViewTopConstraint, a3);
}

- (NSLayoutConstraint)artworkViewBottomConstraint
{
  return self->_artworkViewBottomConstraint;
}

- (void)setArtworkViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_artworkViewBottomConstraint, a3);
}

- (NSLayoutConstraint)boundsLayoutGuideLeadingConstraint
{
  return self->_boundsLayoutGuideLeadingConstraint;
}

- (void)setBoundsLayoutGuideLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_boundsLayoutGuideLeadingConstraint, a3);
}

- (NSLayoutConstraint)boundsLayoutGuideTrailingConstraint
{
  return self->_boundsLayoutGuideTrailingConstraint;
}

- (void)setBoundsLayoutGuideTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_boundsLayoutGuideTrailingConstraint, a3);
}

- (NSLayoutConstraint)transportControlsLayoutGuideTopConstraint
{
  return self->_transportControlsLayoutGuideTopConstraint;
}

- (void)setTransportControlsLayoutGuideTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_transportControlsLayoutGuideTopConstraint, a3);
}

- (NSLayoutConstraint)transportControlsLayoutGuideBottomConstraint
{
  return self->_transportControlsLayoutGuideBottomConstraint;
}

- (void)setTransportControlsLayoutGuideBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_transportControlsLayoutGuideBottomConstraint, a3);
}

- (NSLayoutConstraint)labelViewLayoutGuideHeightConstraint
{
  return self->_labelViewLayoutGuideHeightConstraint;
}

- (void)setLabelViewLayoutGuideHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelViewLayoutGuideHeightConstraint, a3);
}

- (UILayoutGuide)boundsLayoutGuide
{
  return self->_boundsLayoutGuide;
}

- (void)setBoundsLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_boundsLayoutGuide, a3);
}

- (UILayoutGuide)transportControlsLayoutGuide
{
  return self->_transportControlsLayoutGuide;
}

- (void)setTransportControlsLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_transportControlsLayoutGuide, a3);
}

- (UILayoutGuide)leftButtonLayoutGuide
{
  return self->_leftButtonLayoutGuide;
}

- (void)setLeftButtonLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_leftButtonLayoutGuide, a3);
}

- (UILayoutGuide)rightButtonLayoutGuide
{
  return self->_rightButtonLayoutGuide;
}

- (void)setRightButtonLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_rightButtonLayoutGuide, a3);
}

- (UILayoutGuide)labelViewLayoutGuide
{
  return self->_labelViewLayoutGuide;
}

- (void)setLabelViewLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_labelViewLayoutGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_rightButtonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_leftButtonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_transportControlsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_boundsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_labelViewLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_transportControlsLayoutGuideBottomConstraint, 0);
  objc_storeStrong((id *)&self->_transportControlsLayoutGuideTopConstraint, 0);
  objc_storeStrong((id *)&self->_boundsLayoutGuideTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_boundsLayoutGuideLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_artworkViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_artworkViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_volumeControlsView, 0);
  objc_storeStrong((id *)&self->_routingButton, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_centerButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_timeControlsView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_routingButtonSymbolConfigurationSmall, 0);
  objc_storeStrong((id *)&self->_routingButtonSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_leftRightTransportButtonsSymbolConfiguration, 0);
}

@end
