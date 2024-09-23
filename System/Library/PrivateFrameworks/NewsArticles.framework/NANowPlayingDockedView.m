@implementation NANowPlayingDockedView

- (NANowPlayingDockedView)initWithBackground:(id)a3
{
  id v4;
  NANowPlayingDockedView *v5;
  uint64_t v6;
  NANowPlayingDockedView *v7;
  uint64_t v8;
  UIView *contentView;
  uint64_t v10;
  UILabel *publisherLabel;
  NANowPlayingDockedView *v12;
  uint64_t v13;
  MPUMarqueeView *publisherMarqueeContainer;
  uint64_t v15;
  UILabel *titleLabel;
  NANowPlayingDockedView *v17;
  uint64_t v18;
  MPUMarqueeView *titleMarqueeContainer;
  NANowPlayingDockedView *v20;
  uint64_t v21;
  UIButton *rewindButton;
  NANowPlayingDockedView *v23;
  uint64_t v24;
  UIButton *playPauseButton;
  NANowPlayingDockedView *v26;
  uint64_t v27;
  UIButton *closeButton;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];
  NANowPlayingDockedView *v39;
  _QWORD v40[4];
  NANowPlayingDockedView *v41;
  _QWORD v42[4];
  NANowPlayingDockedView *v43;
  _QWORD v44[4];
  NANowPlayingDockedView *v45;
  _QWORD v46[4];
  NANowPlayingDockedView *v47;
  _QWORD v48[4];
  NANowPlayingDockedView *v49;
  objc_super v50;
  _QWORD v51[5];

  v51[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)NANowPlayingDockedView;
  v5 = -[NANowPlayingDockedView initWithFrame:](&v50, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    -[NANowPlayingDockedView addSubview:](v5, "addSubview:", v4);
    v6 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke;
    v48[3] = &unk_1E7194A48;
    v7 = v5;
    v49 = v7;
    __45__NANowPlayingDockedView_initWithBackground___block_invoke((uint64_t)v48);
    v8 = objc_claimAutoreleasedReturnValue();
    contentView = v7->_contentView;
    v7->_contentView = (UIView *)v8;

    __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_3();
    v10 = objc_claimAutoreleasedReturnValue();
    publisherLabel = v7->_publisherLabel;
    v7->_publisherLabel = (UILabel *)v10;

    v46[0] = v6;
    v46[1] = 3221225472;
    v46[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_3;
    v46[3] = &unk_1E71949A8;
    v12 = v7;
    v47 = v12;
    __45__NANowPlayingDockedView_initWithBackground___block_invoke_3((uint64_t)v46);
    v13 = objc_claimAutoreleasedReturnValue();
    publisherMarqueeContainer = v12->_publisherMarqueeContainer;
    v12->_publisherMarqueeContainer = (MPUMarqueeView *)v13;

    __45__NANowPlayingDockedView_initWithBackground___block_invoke_4();
    v15 = objc_claimAutoreleasedReturnValue();
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = (UILabel *)v15;

    v44[0] = v6;
    v44[1] = 3221225472;
    v44[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_5;
    v44[3] = &unk_1E71949A8;
    v17 = v12;
    v45 = v17;
    __45__NANowPlayingDockedView_initWithBackground___block_invoke_5((uint64_t)v44);
    v18 = objc_claimAutoreleasedReturnValue();
    titleMarqueeContainer = v17->_titleMarqueeContainer;
    v17->_titleMarqueeContainer = (MPUMarqueeView *)v18;

    v42[0] = v6;
    v42[1] = 3221225472;
    v42[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_6;
    v42[3] = &unk_1E7194BB0;
    v20 = v17;
    v43 = v20;
    __45__NANowPlayingDockedView_initWithBackground___block_invoke_6((uint64_t)v42);
    v21 = objc_claimAutoreleasedReturnValue();
    rewindButton = v20->_rewindButton;
    v20->_rewindButton = (UIButton *)v21;

    v40[0] = v6;
    v40[1] = 3221225472;
    v40[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_7;
    v40[3] = &unk_1E7194BB0;
    v23 = v20;
    v41 = v23;
    __45__NANowPlayingDockedView_initWithBackground___block_invoke_7((uint64_t)v40);
    v24 = objc_claimAutoreleasedReturnValue();
    playPauseButton = v23->_playPauseButton;
    v23->_playPauseButton = (UIButton *)v24;

    v38[0] = v6;
    v38[1] = 3221225472;
    v38[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_8;
    v38[3] = &unk_1E7194BB0;
    v26 = v23;
    v39 = v26;
    __45__NANowPlayingDockedView_initWithBackground___block_invoke_8((uint64_t)v38);
    v27 = objc_claimAutoreleasedReturnValue();
    closeButton = v26->_closeButton;
    v26->_closeButton = (UIButton *)v27;

    v26->_changesDisplayWhenHighlighted = 0;
    NABundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("mini player"), &stru_1E71B2988, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NANowPlayingDockedView setAccessibilityLabel:](v26, "setAccessibilityLabel:", v30);

    -[NANowPlayingDockedView setAccessibilityContainerType:](v26, "setAccessibilityContainerType:", 4);
    -[NANowPlayingDockedView titleLabel](v26, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v31;
    -[NANowPlayingDockedView rewindButton](v26, "rewindButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v32;
    -[NANowPlayingDockedView playPauseButton](v26, "playPauseButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v33;
    -[NANowPlayingDockedView closeButton](v26, "closeButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NANowPlayingDockedView contentView](v26, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAccessibilityElements:", v35);

    -[NANowPlayingDockedView setIsPlaying:waiting:](v26, "setIsPlaying:waiting:", 0, 0);
  }

  return v5;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setAutoresizingMask:", 16);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);
  return v3;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0D46968]);
  objc_msgSend(v2, "setMarqueeEnabled:", 1);
  objc_msgSend(v2, "setFadeEdgeInsets:", 0.0, 0.0, 0.0, 36.0);
  objc_msgSend(v2, "setContentGap:", 32.0);
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "publisherLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  objc_msgSend(*(id *)(a1 + 32), "publisherLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewForContentSize:", v5);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v2);

  return v2;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_4()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0DC3990]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  NABundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap to expand the mini player"), &stru_1E71B2988, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAccessibilityHint:", v3);

  objc_msgSend(v1, "setAdjustsFontForContentSizeCategory:", 1);
  return v1;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_5(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0D46968]);
  objc_msgSend(v2, "setMarqueeEnabled:", 1);
  objc_msgSend(v2, "setFadeEdgeInsets:", 0.0, 0.0, 0.0, 36.0);
  objc_msgSend(v2, "setContentGap:", 32.0);
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  objc_msgSend(*(id *)(a1 + 32), "publisherMarqueeContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCoordinatedMarqueeView:", v5);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewForContentSize:", v6);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v2);

  return v2;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;

  +[NATouchInsetsButton buttonWithType:](NATouchInsetsButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gobackward.15"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, 20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v5, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v6);

  NABundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("rewind, 15 seconds"), &stru_1E71B2988, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v8);

  objc_msgSend(v2, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_rewindButtonTapped_, 64);
  objc_msgSend(v2, "sizeToFit");
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "setTouchInsets:", NAInsetsToMinimumTapTargetForFrame(v9, v10, v11, v12));
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v2);

  return v2;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;

  +[NATouchInsetsButton buttonWithType:](NATouchInsetsButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pause.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, 26.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v5, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v6);

  NABundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("pause"), &stru_1E71B2988, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v8);

  objc_msgSend(v2, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_pauseButtonTapped_, 64);
  objc_msgSend(v2, "sizeToFit");
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "setTouchInsets:", NAInsetsToMinimumTapTargetForFrame(v9, v10, v11, v12));
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v2);

  return v2;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  +[NATouchInsetsButton buttonWithType:](NATouchInsetsButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 3, 33.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithPaletteColors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle.fill"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithConfiguration:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v11, 0);

  NABundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("close"), &stru_1E71B2988, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v13);

  objc_msgSend(v2, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_closeButtonTapped_, 64);
  objc_msgSend(v2, "sizeToFit");
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "setTouchInsets:", NAInsetsToMinimumTapTargetForFrame(v14, v15, v16, v17));
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v2);

  return v2;
}

- (void)setHighlighted:(BOOL)a3
{
  int v4;
  double v5;
  _BOOL4 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NANowPlayingDockedView;
  -[NANowPlayingDockedView setHighlighted:](&v7, sel_setHighlighted_, a3);
  v4 = -[NANowPlayingDockedView isHighlighted](self, "isHighlighted");
  v5 = 1.0;
  if (v4)
  {
    v6 = -[NANowPlayingDockedView changesDisplayWhenHighlighted](self, "changesDisplayWhenHighlighted", 1.0);
    v5 = 0.8;
    if (!v6)
      v5 = 1.0;
  }
  -[NANowPlayingDockedView setAlpha:](self, "setAlpha:", v5);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  NANowPlayingDockedView *v5;
  NANowPlayingDockedView *v6;
  NANowPlayingDockedView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NANowPlayingDockedView;
  -[NANowPlayingDockedView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (NANowPlayingDockedView *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = self;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
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
  void *v12;
  double Width;
  void *v14;
  double Height;
  void *v16;
  void *v17;
  CGFloat v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double MaxY;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  CGFloat v64;
  void *v65;
  double MinX;
  void *v67;
  double MinY;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  void *v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat x;
  CGFloat y;
  CGFloat v95;
  CGFloat v96;
  UIView *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  objc_super v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;

  v103.receiver = self;
  v103.super_class = (Class)NANowPlayingDockedView;
  -[NANowPlayingDockedView layoutSubviews](&v103, sel_layoutSubviews);
  -[NANowPlayingDockedView bounds](self, "bounds");
  v4 = v3 + 14.0;
  v6 = v5 + 16.0;
  v8 = v7 + -25.0;
  v10 = v9 + -34.0;
  -[NANowPlayingDockedView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[NANowPlayingDockedView publisherLabel](self, "publisherLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  Width = CGRectGetWidth(v104);
  -[NANowPlayingDockedView publisherLabel](self, "publisherLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  Height = CGRectGetHeight(v105);
  -[NANowPlayingDockedView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, Width, Height);

  -[NANowPlayingDockedView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v18 = CGRectGetMaxY(v106) + 4.5;
  -[NANowPlayingDockedView titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v20 = CGRectGetWidth(v107);
  -[NANowPlayingDockedView titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v22 = CGRectGetHeight(v108);
  -[NANowPlayingDockedView titleMarqueeContainer](self, "titleMarqueeContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", 0.0, v18, v20, v22);

  -[NANowPlayingDockedView titleMarqueeContainer](self, "titleMarqueeContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  MaxY = CGRectGetMaxY(v109);
  -[NANowPlayingDockedView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v27 = (MaxY - CGRectGetMinY(v110)) * 0.5;

  -[NANowPlayingDockedView contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v29 = CGRectGetWidth(v111);
  -[NANowPlayingDockedView closeButton](self, "closeButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v31 = v29 - CGRectGetWidth(v112);
  -[NANowPlayingDockedView closeButton](self, "closeButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v33 = v27 - CGRectGetHeight(v113) * 0.5;
  -[NANowPlayingDockedView closeButton](self, "closeButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v35 = CGRectGetWidth(v114);
  -[NANowPlayingDockedView closeButton](self, "closeButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v37 = CGRectGetHeight(v115);
  -[NANowPlayingDockedView closeButton](self, "closeButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  -[NANowPlayingDockedView closeButton](self, "closeButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "frame");
  v41 = v40;
  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  v43 = v41 - (CGRectGetWidth(v116) + 21.0);
  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bounds");
  v45 = v27 - CGRectGetHeight(v117) * 0.5;
  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bounds");
  v47 = CGRectGetWidth(v118);
  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bounds");
  v49 = CGRectGetHeight(v119);
  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "frame");
  v53 = v52;
  -[NANowPlayingDockedView rewindButton](self, "rewindButton");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bounds");
  v55 = v53 - (CGRectGetWidth(v120) + 23.0);
  -[NANowPlayingDockedView rewindButton](self, "rewindButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bounds");
  v57 = v27 - CGRectGetHeight(v121) * 0.5;
  -[NANowPlayingDockedView rewindButton](self, "rewindButton");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bounds");
  v59 = CGRectGetWidth(v122);
  -[NANowPlayingDockedView rewindButton](self, "rewindButton");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bounds");
  v61 = CGRectGetHeight(v123);
  -[NANowPlayingDockedView rewindButton](self, "rewindButton");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", v55, v57, v59, v61);

  -[NANowPlayingDockedView rewindButton](self, "rewindButton");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "frame");
  v64 = CGRectGetMinX(v124) + -20.0;

  -[NANowPlayingDockedView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "frame");
  MinX = CGRectGetMinX(v125);
  -[NANowPlayingDockedView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "frame");
  MinY = CGRectGetMinY(v126);
  -[NANowPlayingDockedView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "frame");
  v70 = CGRectGetHeight(v127);
  -[NANowPlayingDockedView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setFrame:", MinX, MinY, v64, v70);

  -[NANowPlayingDockedView titleMarqueeContainer](self, "titleMarqueeContainer");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "frame");
  v73 = CGRectGetMinX(v128);
  -[NANowPlayingDockedView titleMarqueeContainer](self, "titleMarqueeContainer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "frame");
  v75 = CGRectGetMinY(v129);
  -[NANowPlayingDockedView titleMarqueeContainer](self, "titleMarqueeContainer");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "frame");
  v77 = CGRectGetHeight(v130);
  -[NANowPlayingDockedView titleMarqueeContainer](self, "titleMarqueeContainer");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setFrame:", v73, v75, v64, v77);

  -[NANowPlayingDockedView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "frame");
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v87 = v86;
  -[NANowPlayingDockedView titleMarqueeContainer](self, "titleMarqueeContainer");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "frame");
  v135.origin.x = v89;
  v135.origin.y = v90;
  v135.size.width = v91;
  v135.size.height = v92;
  v131.origin.x = v81;
  v131.origin.y = v83;
  v131.size.width = v85;
  v131.size.height = v87;
  v132 = CGRectUnion(v131, v135);
  x = v132.origin.x;
  y = v132.origin.y;
  v95 = v132.size.width;
  v96 = v132.size.height;

  -[NANowPlayingDockedView contentView](self, "contentView");
  v97 = (UIView *)objc_claimAutoreleasedReturnValue();
  v133.origin.x = x;
  v133.origin.y = y;
  v133.size.width = v95;
  v133.size.height = v96;
  v134 = UIAccessibilityConvertFrameToScreenCoordinates(v133, v97);
  v98 = v134.origin.x;
  v99 = v134.origin.y;
  v100 = v134.size.width;
  v101 = v134.size.height;
  -[NANowPlayingDockedView titleLabel](self, "titleLabel");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setAccessibilityFrame:", v98, v99, v100, v101);

}

- (void)setPublisher:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  NANowPlayingDockedView *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NANowPlayingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    _os_log_impl(&dword_1B9E0F000, v5, OS_LOG_TYPE_DEFAULT, "Docked View setting publisher to %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1420]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledFontForFont:maximumPointSize:", v6, 17.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3F10];
  -[NANowPlayingDockedView publisherLabel](self, "publisherLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__NANowPlayingDockedView_setPublisher___block_invoke;
  v13[3] = &unk_1E71949D0;
  v14 = v4;
  v15 = v8;
  v16 = self;
  v11 = v8;
  v12 = v4;
  objc_msgSend(v9, "transitionWithView:duration:options:animations:completion:", v10, 5242880, v13, 0, 0.25);

  -[NANowPlayingDockedView _updateTitleAccessibilityLabel](self, "_updateTitleAccessibilityLabel");
}

uint64_t __39__NANowPlayingDockedView_setPublisher___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *MEMORY[0x1E0CA85F8];
    v13[0] = *MEMORY[0x1E0DC1138];
    v13[1] = v3;
    v14[0] = v2;
    v14[1] = &unk_1E71E1A48;
    v13[2] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.76, 0.76, 0.78, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(*(id *)(a1 + 32), "uppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v5);
    objc_msgSend(*(id *)(a1 + 48), "publisherLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedText:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "publisherLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", 0);

  }
  objc_msgSend(*(id *)(a1 + 48), "publisherLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeToFit");

  return objc_msgSend(*(id *)(a1 + 48), "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NANowPlayingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v4;
    _os_log_impl(&dword_1B9E0F000, v5, OS_LOG_TYPE_DEFAULT, "Docked View setting title to %{public}@", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.5, *MEMORY[0x1E0DC1448]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 64);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scaledFontForFont:maximumPointSize:", v10, 21.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0CA85F8];
  v23[0] = *MEMORY[0x1E0DC1138];
  v23[1] = v13;
  v24[0] = v12;
  v24[1] = &unk_1E71E1A58;
  v23[2] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0DC3F10];
  -[NANowPlayingDockedView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __35__NANowPlayingDockedView_setTitle___block_invoke;
  v20[3] = &unk_1E71949D0;
  v20[4] = self;
  v21 = v4;
  v22 = v15;
  v18 = v15;
  v19 = v4;
  objc_msgSend(v16, "transitionWithView:duration:options:animations:completion:", v17, 5242880, v20, 0, 0.25);

  -[NANowPlayingDockedView _updateTitleAccessibilityLabel](self, "_updateTitleAccessibilityLabel");
}

uint64_t __35__NANowPlayingDockedView_setTitle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v2);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)setMarqueeRunning:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[NANowPlayingDockedView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMarqueeEnabled:", v3);

  -[NANowPlayingDockedView titleMarqueeContainer](self, "titleMarqueeContainer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMarqueeEnabled:", v3);

}

- (void)setIsPlaying:(BOOL)a3 waiting:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char **v23;
  _QWORD block[5];

  v4 = a4;
  v5 = a3;
  -[NANowPlayingDockedView setWaiting:](self, "setWaiting:", a4);
  if (v4)
  {
    v7 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__NANowPlayingDockedView_setIsPlaying_waiting___block_invoke;
    block[3] = &unk_1E7194BD8;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[NANowPlayingDockedView rewindButton](self, "rewindButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 1);

  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pause.fill"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, 26.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithConfiguration:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    NABundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("pause");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("play.fill"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 1, 2, 24.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithConfiguration:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    NABundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("play");
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E71B2988, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImage:forState:", v11, 0);

  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityLabel:", v17);

  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeTarget:action:forControlEvents:", self, 0, 64);

  -[NANowPlayingDockedView playPauseButton](self, "playPauseButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = &selRef_pauseButtonTapped_;
  if (!v5)
    v23 = &selRef_playButtonTapped_;
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, *v23, 64);

  -[NANowPlayingDockedView setNeedsLayout](self, "setNeedsLayout");
}

void __47__NANowPlayingDockedView_setIsPlaying_waiting___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "waiting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "rewindButton");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEnabled:", 0);

  }
}

- (void)_updateTitleAccessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  -[NANowPlayingDockedView publisherLabel](self, "publisherLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NANowPlayingDockedView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    objc_msgSend(v9, "addObject:", v4);
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v9, "addObject:", v6);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NANowPlayingDockedView titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v7);

  }
  else
  {
    -[NANowPlayingDockedView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", 0);
  }

}

- (void)closeButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "Docked View Close button tapped", v6, 2u);
  }

  -[NANowPlayingDockedView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingDockedViewDidTapClose:", self);

}

- (void)pauseButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "Docked View Pause button tapped", v6, 2u);
  }

  -[NANowPlayingDockedView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingDockedViewDidTapPause:", self);

}

- (void)playButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "Docked View Play button tapped", v6, 2u);
  }

  -[NANowPlayingDockedView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingDockedViewDidTapPlay:", self);

}

- (void)rewindButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "Docked View Rewind tapped", v6, 2u);
  }

  -[NANowPlayingDockedView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingDockedViewDidTapRewind:", self);

}

- (void)setMenu:(id)a3
{
  objc_storeStrong((id *)&self->_menu, a3);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[NANowPlayingDockedView menu](self, "menu", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__NANowPlayingDockedView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v8[3] = &unk_1E7194C00;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

uint64_t __80__NANowPlayingDockedView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "menu");
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  v12.receiver = self;
  v12.super_class = (Class)NANowPlayingDockedView;
  -[NANowPlayingDockedView menuAttachmentPointForConfiguration:](&v12, sel_menuAttachmentPointForConfiguration_, a3);
  v5 = v4;
  v7 = v6;
  -[NANowPlayingDockedView safeAreaInsets](self, "safeAreaInsets");
  if (v8 == 0.0)
    v9 = 10.0;
  else
    -[NANowPlayingDockedView safeAreaInsets](self, "safeAreaInsets");
  v10 = v7 + v9 + -4.0;
  v11 = v5;
  result.y = v10;
  result.x = v11;
  return result;
}

- (BOOL)changesDisplayWhenHighlighted
{
  return self->_changesDisplayWhenHighlighted;
}

- (void)setChangesDisplayWhenHighlighted:(BOOL)a3
{
  self->_changesDisplayWhenHighlighted = a3;
}

- (NANowPlayingDockedViewDelegate)delegate
{
  return (NANowPlayingDockedViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UILabel)publisherLabel
{
  return self->_publisherLabel;
}

- (MPUMarqueeView)publisherMarqueeContainer
{
  return self->_publisherMarqueeContainer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (MPUMarqueeView)titleMarqueeContainer
{
  return self->_titleMarqueeContainer;
}

- (UIButton)rewindButton
{
  return self->_rewindButton;
}

- (UIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)waiting
{
  return self->_waiting;
}

- (void)setWaiting:(BOOL)a3
{
  self->_waiting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_rewindButton, 0);
  objc_storeStrong((id *)&self->_titleMarqueeContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_publisherMarqueeContainer, 0);
  objc_storeStrong((id *)&self->_publisherLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
