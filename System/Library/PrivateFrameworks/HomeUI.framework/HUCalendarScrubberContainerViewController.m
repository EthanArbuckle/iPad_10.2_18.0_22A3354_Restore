@implementation HUCalendarScrubberContainerViewController

- (HUCalendarScrubberContainerViewController)initWithPlaybackEngine:(id)a3 calendarScrubberDataSource:(id)a4
{
  id v6;
  id v7;
  HUCalendarScrubberContainerViewController *v8;
  HUCalendarScrubberContainerViewController *v9;
  id v10;
  id WeakRetained;
  HUCalendarScrubberViewController *v12;
  HUCalendarScrubberViewController *calendarScrubber;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  UIButton *prevWeekButton;
  uint64_t v21;
  UIButton *nextWeekButton;
  uint64_t v23;
  AVBackgroundView *backgroundView;
  uint64_t v25;
  UIView *hairlineViewLeft;
  void *v27;
  uint64_t v28;
  UIView *hairlineViewRight;
  void *v30;
  NSDate *lastSelectedDate;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HUCalendarScrubberContainerViewController;
  v8 = -[HUCalendarScrubberContainerViewController initWithNibName:bundle:](&v33, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->_isEditing = 0;
    objc_storeWeak((id *)&v8->_playbackEngine, v6);
    v10 = objc_alloc_init(MEMORY[0x1E0D31250]);
    objc_msgSend(v10, "setPeriodicTimeUpdateInterval:", &unk_1E7043498);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_playbackEngine);
    objc_msgSend(WeakRetained, "addObserver:withOptions:", v9, v10);

    v12 = -[HUCalendarScrubberViewController initWithDataSource:]([HUCalendarScrubberViewController alloc], "initWithDataSource:", v7);
    calendarScrubber = v9->_calendarScrubber;
    v9->_calendarScrubber = v12;

    -[HUCalendarScrubberViewController setScrubberDelegate:](v9->_calendarScrubber, "setScrubberDelegate:", v9);
    v14 = objc_alloc(MEMORY[0x1E0CEA3A0]);
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v19 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], v16, v17, v18);
    prevWeekButton = v9->_prevWeekButton;
    v9->_prevWeekButton = (UIButton *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA3A0]), "initWithFrame:", v15, v16, v17, v18);
    nextWeekButton = v9->_nextWeekButton;
    v9->_nextWeekButton = (UIButton *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3F8]), "initWithFrame:", v15, v16, v17, v18);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = (AVBackgroundView *)v23;

    -[AVBackgroundView setClipsToBounds:](v9->_backgroundView, "setClipsToBounds:", 1);
    -[AVBackgroundView _setContinuousCornerRadius:](v9->_backgroundView, "_setContinuousCornerRadius:", 16.0);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v15, v16, v17, v18);
    hairlineViewLeft = v9->_hairlineViewLeft;
    v9->_hairlineViewLeft = (UIView *)v25;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.2, 1.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_hairlineViewLeft, "setBackgroundColor:", v27);

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v15, v16, v17, v18);
    hairlineViewRight = v9->_hairlineViewRight;
    v9->_hairlineViewRight = (UIView *)v28;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.2, 1.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_hairlineViewRight, "setBackgroundColor:", v30);

    lastSelectedDate = v9->_lastSelectedDate;
    v9->_lastSelectedDate = 0;

  }
  return v9;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char **v19;
  char **v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)HUCalendarScrubberContainerViewController;
  -[HUCalendarScrubberContainerViewController viewDidLoad](&v40, sel_viewDidLoad);
  -[HUCalendarScrubberContainerViewController view](self, "view");
  v28 = objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberContainerViewController backgroundView](self, "backgroundView");
  v3 = objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = objc_claimAutoreleasedReturnValue();

  -[HUCalendarScrubberContainerViewController prevWeekButton](self, "prevWeekButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberContainerViewController nextWeekButton](self, "nextWeekButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberContainerViewController hairlineViewLeft](self, "hairlineViewLeft");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberContainerViewController hairlineViewRight](self, "hairlineViewRight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA638], "kitImageNamed:", CFSTR("UINavigationBarBackIndicatorDefault"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithRenderingMode:", 2);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = v6;
  objc_msgSend(v6, "setImage:forState:", v11, 0);
  v30 = (void *)v11;
  objc_msgSend(v7, "setImage:forState:", v11, 0);
  v13 = (void *)v3;
  v14 = (void *)v5;
  if (v7)
    objc_msgSend(v7, "transform");
  else
    memset(&v38, 0, sizeof(v38));
  CGAffineTransformRotate(&v39, &v38, 3.14159265);
  v37 = v39;
  objc_msgSend(v7, "setTransform:", &v37);
  -[HUCalendarScrubberContainerViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "layoutDirection");

  if (v16)
  {
    if (v12)
      objc_msgSend(v12, "transform");
    else
      memset(&v35, 0, sizeof(v35));
    v17 = v8;
    CGAffineTransformRotate(&v36, &v35, 3.14159265);
    v34 = v36;
    objc_msgSend(v12, "setTransform:", &v34);
    v18 = (void *)v28;
    if (v7)
      objc_msgSend(v7, "transform");
    else
      memset(&v32, 0, sizeof(v32));
    CGAffineTransformRotate(&v33, &v32, 3.14159265);
    v31 = v33;
    objc_msgSend(v7, "setTransform:", &v31);
    v19 = &selRef_handlePreviousButton_;
    v20 = &selRef_handleNextButton_;
  }
  else
  {
    v17 = v8;
    v18 = (void *)v28;
    v19 = &selRef_handleNextButton_;
    v20 = &selRef_handlePreviousButton_;
  }
  v29 = v12;
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, *v20, 64);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, *v19, 64);
  objc_msgSend(v18, "naui_addAutoLayoutSubview:", v13);
  objc_msgSend(v13, "addSubview:applyingMaterialStyle:tintEffectStyle:", v12, 0, 0);
  objc_msgSend(v13, "addSubview:applyingMaterialStyle:tintEffectStyle:", v7, 0, 0);
  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberContainerViewController addChildViewController:](self, "addChildViewController:", v21);

  objc_msgSend(v13, "naui_addAutoLayoutSubview:", v14);
  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "didMoveToParentViewController:", self);

  objc_msgSend(v13, "addSubview:applyingMaterialStyle:tintEffectStyle:", v9, 1, 1);
  v23 = v17;
  objc_msgSend(v13, "addSubview:applyingMaterialStyle:tintEffectStyle:", v17, 1, 1);
  objc_msgSend(v18, "setNeedsUpdateConstraints");
  -[HUCalendarScrubberContainerViewController _updateNextPreviousButtonState](self, "_updateNextPreviousButtonState");
  -[HUCalendarScrubberContainerViewController playbackEngine](self, "playbackEngine");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "playbackPosition");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "contentType") == 0;
  -[HUCalendarScrubberContainerViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", v26);

}

- (void)updateViewConstraints
{
  HUCalendarScrubberContainerViewController *v2;
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
  void *v14;
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
  HUCalendarScrubberContainerViewController *v108;
  objc_super v109;
  _QWORD v110[32];

  v2 = self;
  v110[30] = *MEMORY[0x1E0C80C00];
  -[HUCalendarScrubberContainerViewController constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUCalendarScrubberContainerViewController backgroundView](v2, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController calendarScrubber](v2, "calendarScrubber");
    v108 = v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCalendarScrubberContainerViewController prevWeekButton](v108, "prevWeekButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController nextWeekButton](v108, "nextWeekButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController hairlineViewLeft](v108, "hairlineViewLeft");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController hairlineViewRight](v108, "hairlineViewRight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController view](v108, "view");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "centerXAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v105);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v104;
    objc_msgSend(v4, "centerYAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController view](v108, "view");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "centerYAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:", v101);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v110[1] = v100;
    objc_msgSend(v4, "widthAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController view](v108, "view");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "widthAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v97);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v110[2] = v96;
    objc_msgSend(v4, "heightAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToConstant:", 47.0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v110[3] = v94;
    objc_msgSend(v6, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v110[4] = v91;
    objc_msgSend(v6, "trailingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v89);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v110[5] = v88;
    objc_msgSend(v6, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v86);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v110[6] = v85;
    objc_msgSend(v6, "bottomAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v110[7] = v81;
    objc_msgSend(v6, "centerXAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v110[8] = v78;
    objc_msgSend(v6, "widthAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintLessThanOrEqualToConstant:", 400.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v110[9] = v76;
    objc_msgSend(v7, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v110[10] = v71;
    objc_msgSend(v7, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v110[11] = v68;
    objc_msgSend(v7, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v110[12] = v65;
    objc_msgSend(v7, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v63);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v110[13] = v61;
    v83 = v7;
    objc_msgSend(v7, "widthAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToConstant:", 60.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v110[14] = v59;
    objc_msgSend(v9, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v110[15] = v54;
    objc_msgSend(v9, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v6;
    objc_msgSend(v6, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v110[16] = v51;
    objc_msgSend(v9, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToConstant:", 1.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v110[17] = v49;
    v75 = v9;
    objc_msgSend(v9, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v110[18] = v46;
    objc_msgSend(v9, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v110[19] = v43;
    objc_msgSend(v10, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v110[20] = v40;
    objc_msgSend(v10, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v55 = v8;
    objc_msgSend(v8, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v110[21] = v37;
    objc_msgSend(v10, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", 1.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v110[22] = v35;
    objc_msgSend(v10, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v110[23] = v32;
    v62 = v10;
    objc_msgSend(v10, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v4;
    objc_msgSend(v4, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v110[24] = v29;
    objc_msgSend(v8, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v110[25] = v26;
    objc_msgSend(v8, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v110[26] = v12;
    objc_msgSend(v8, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v110[27] = v15;
    objc_msgSend(v11, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v110[28] = v18;
    objc_msgSend(v11, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 60.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v110[29] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController setConstraints:](v108, "setConstraints:", v21);

    v2 = v108;
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[HUCalendarScrubberContainerViewController constraints](v108, "constraints");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v23);

  }
  v109.receiver = v2;
  v109.super_class = (Class)HUCalendarScrubberContainerViewController;
  -[HUCalendarScrubberContainerViewController updateViewConstraints](&v109, sel_updateViewConstraints);
}

- (void)handleNextButton:(id)a3
{
  void *v4;
  id v5;

  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jumpToSection:animated:completion:", objc_msgSend(v4, "nextSection"), 1, 0);

  -[HUCalendarScrubberContainerViewController _updateNextPreviousButtonState](self, "_updateNextPreviousButtonState");
}

- (void)handlePreviousButton:(id)a3
{
  void *v4;
  id v5;

  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jumpToSection:animated:completion:", objc_msgSend(v4, "previousSection"), 1, 0);

  -[HUCalendarScrubberContainerViewController _updateNextPreviousButtonState](self, "_updateNextPreviousButtonState");
}

- (void)_jumpToDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v4 = a4;
  v6 = a3;
  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "section");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HUCalendarScrubberContainerViewController__jumpToDate_animated___block_invoke;
  v14[3] = &unk_1E6F4F360;
  objc_copyWeak(&v17, &location);
  v12 = v7;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v10, "jumpToSection:animated:completion:", v11, v4, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __66__HUCalendarScrubberContainerViewController__jumpToDate_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);

  objc_msgSend(WeakRetained, "_updateNextPreviousButtonState");
}

- (void)_updateNextPreviousButtonState
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberContainerViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  if (v4)
  {
    v5 = objc_msgSend(v12, "nextSection") != 0x7FFFFFFFFFFFFFFFLL;
    -[HUCalendarScrubberContainerViewController prevWeekButton](self, "prevWeekButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v5);

    v7 = objc_msgSend(v12, "previousSection");
  }
  else
  {
    v8 = objc_msgSend(v12, "previousSection") != 0x7FFFFFFFFFFFFFFFLL;
    -[HUCalendarScrubberContainerViewController prevWeekButton](self, "prevWeekButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", v8);

    v7 = objc_msgSend(v12, "nextSection");
  }
  v10 = v7 != 0x7FFFFFFFFFFFFFFFLL;
  -[HUCalendarScrubberContainerViewController nextWeekButton](self, "nextWeekButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v10);

}

- (void)scrubberViewController:(id)a3 didSelectItemAtIndex:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateAtIndexPath:", v6);
  v8 = objc_claimAutoreleasedReturnValue();

  -[HUCalendarScrubberContainerViewController playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstOfTheDayClipForDate:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "uniqueIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Calendar moving to first clip:%@ for date:%@", (uint8_t *)&v18, 0x16u);

    }
    -[HUCalendarScrubberContainerViewController playbackEngine](self, "playbackEngine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimelineState:", 2);

    objc_msgSend(v10, "dateOfOccurrence");
    v12 = v8;
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v18 = 138412290;
    v19 = v8;
    _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "Calendar unable to find first clip for date:%@", (uint8_t *)&v18, 0xCu);
  }

  v15 = -[HUCalendarScrubberContainerViewController isEditing](self, "isEditing");
  -[HUCalendarScrubberContainerViewController playbackEngine](self, "playbackEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "updatePlaybackPositionToDate:usingClip:", v8, v10);
  else
    objc_msgSend(v16, "startPlaybackAtDate:withClip:", v8, v10);

}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "contentType") == 0;
  -[HUCalendarScrubberContainerViewController view](self, "view");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "setHidden:", v6);

  -[HUCalendarScrubberContainerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v8, "isHidden");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "clipPlaybackDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController lastSelectedDate](self, "lastSelectedDate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_8;
    v11 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberContainerViewController lastSelectedDate](self, "lastSelectedDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isDate:inSameDayAsDate:", v9, v13);

    if ((v14 & 1) != 0)
    {
      -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "indexPathsForSelectedItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
LABEL_12:

        goto LABEL_13;
      }
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v9;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "Update calendar to selected date:%@ because there was no selected index path.", (uint8_t *)&v22, 0xCu);
      }
      v20 = 0;
    }
    else
    {
LABEL_8:
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[HUCalendarScrubberContainerViewController lastSelectedDate](self, "lastSelectedDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v9;
        v24 = 2112;
        v25 = v21;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "Update calendar to selected date:%@ from date:%@.", (uint8_t *)&v22, 0x16u);

      }
      v20 = 1;
    }

    -[HUCalendarScrubberContainerViewController setLastSelectedDate:](self, "setLastSelectedDate:", v9);
    -[HUCalendarScrubberContainerViewController _jumpToDate:animated:](self, "_jumpToDate:animated:", v9, v20);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a3;
  -[HUCalendarScrubberContainerViewController calendarScrubber](self, "calendarScrubber");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "daysWithClips");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updateDatesWithClips:", v9);
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (HUCalendarScrubberViewController)calendarScrubber
{
  return self->_calendarScrubber;
}

- (void)setCalendarScrubber:(id)a3
{
  objc_storeStrong((id *)&self->_calendarScrubber, a3);
}

- (UIButton)prevWeekButton
{
  return self->_prevWeekButton;
}

- (void)setPrevWeekButton:(id)a3
{
  objc_storeStrong((id *)&self->_prevWeekButton, a3);
}

- (UIButton)nextWeekButton
{
  return self->_nextWeekButton;
}

- (void)setNextWeekButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextWeekButton, a3);
}

- (AVBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)hairlineViewLeft
{
  return self->_hairlineViewLeft;
}

- (void)setHairlineViewLeft:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineViewLeft, a3);
}

- (UIView)hairlineViewRight
{
  return self->_hairlineViewRight;
}

- (void)setHairlineViewRight:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineViewRight, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return (HFCameraPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeWeak((id *)&self->_playbackEngine, a3);
}

- (NSDate)lastSelectedDate
{
  return self->_lastSelectedDate;
}

- (void)setLastSelectedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedDate, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_hairlineViewRight, 0);
  objc_storeStrong((id *)&self->_hairlineViewLeft, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_nextWeekButton, 0);
  objc_storeStrong((id *)&self->_prevWeekButton, 0);
  objc_storeStrong((id *)&self->_calendarScrubber, 0);
}

@end
