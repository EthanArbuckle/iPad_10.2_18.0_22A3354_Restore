@implementation NANowPlayingViewController

- (NANowPlayingViewController)initWithBackground:(id)a3
{
  id v4;
  NANowPlayingViewController *v5;
  NANowPlayingViewController *v6;
  uint64_t v7;
  NANowPlayingViewController *v8;
  uint64_t v9;
  UIView *contentView;
  NANowPlayingViewController *v11;
  uint64_t v12;
  NANowPlayingTitleView *titleView;
  NANowPlayingViewController *v14;
  uint64_t v15;
  NANowPlayingTimeControl *timeControl;
  NANowPlayingViewController *v17;
  uint64_t v18;
  NANowPlayingPlaybackControls *playbackControls;
  NANowPlayingViewController *v20;
  uint64_t v21;
  NANowPlayingVolumeSlider *volumeControl;
  NANowPlayingViewController *v23;
  uint64_t v24;
  NANowPlayingBottomControls *bottomControls;
  NANowPlayingViewController *v26;
  uint64_t v27;
  NANowPlayingArtworkView *artworkView;
  NANowPlayingViewController *v29;
  uint64_t v30;
  _UIGrabber *grabberView;
  NANowPlayingViewController *v32;
  uint64_t v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  NANowPlayingViewController *v39;
  _QWORD v40[4];
  NANowPlayingViewController *v41;
  _QWORD v42[4];
  NANowPlayingViewController *v43;
  _QWORD v44[4];
  NANowPlayingViewController *v45;
  _QWORD v46[4];
  NANowPlayingViewController *v47;
  _QWORD v48[4];
  NANowPlayingViewController *v49;
  _QWORD v50[4];
  NANowPlayingViewController *v51;
  _QWORD v52[4];
  NANowPlayingViewController *v53;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)NANowPlayingViewController;
  v5 = -[NANowPlayingViewController initWithNibName:bundle:](&v54, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[NANowPlayingViewController setView:](v5, "setView:", v4);
    v7 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke;
    v52[3] = &unk_1E7194A48;
    v8 = v6;
    v53 = v8;
    __49__NANowPlayingViewController_initWithBackground___block_invoke((uint64_t)v52);
    v9 = objc_claimAutoreleasedReturnValue();
    contentView = v8->_contentView;
    v8->_contentView = (UIView *)v9;

    v50[0] = v7;
    v50[1] = 3221225472;
    v50[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_2;
    v50[3] = &unk_1E7194A70;
    v11 = v8;
    v51 = v11;
    __49__NANowPlayingViewController_initWithBackground___block_invoke_2((uint64_t)v50);
    v12 = objc_claimAutoreleasedReturnValue();
    titleView = v11->_titleView;
    v11->_titleView = (NANowPlayingTitleView *)v12;

    v48[0] = v7;
    v48[1] = 3221225472;
    v48[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_3;
    v48[3] = &unk_1E7194AC0;
    v14 = v11;
    v49 = v14;
    __49__NANowPlayingViewController_initWithBackground___block_invoke_3((uint64_t)v48);
    v15 = objc_claimAutoreleasedReturnValue();
    timeControl = v14->_timeControl;
    v14->_timeControl = (NANowPlayingTimeControl *)v15;

    v46[0] = v7;
    v46[1] = 3221225472;
    v46[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_5;
    v46[3] = &unk_1E7194AE8;
    v17 = v14;
    v47 = v17;
    __49__NANowPlayingViewController_initWithBackground___block_invoke_5((uint64_t)v46);
    v18 = objc_claimAutoreleasedReturnValue();
    playbackControls = v17->_playbackControls;
    v17->_playbackControls = (NANowPlayingPlaybackControls *)v18;

    v44[0] = v7;
    v44[1] = 3221225472;
    v44[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_6;
    v44[3] = &unk_1E7194B10;
    v20 = v17;
    v45 = v20;
    __49__NANowPlayingViewController_initWithBackground___block_invoke_6((uint64_t)v44);
    v21 = objc_claimAutoreleasedReturnValue();
    volumeControl = v20->_volumeControl;
    v20->_volumeControl = (NANowPlayingVolumeSlider *)v21;

    v42[0] = v7;
    v42[1] = 3221225472;
    v42[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_7;
    v42[3] = &unk_1E7194B38;
    v23 = v20;
    v43 = v23;
    __49__NANowPlayingViewController_initWithBackground___block_invoke_7((uint64_t)v42);
    v24 = objc_claimAutoreleasedReturnValue();
    bottomControls = v23->_bottomControls;
    v23->_bottomControls = (NANowPlayingBottomControls *)v24;

    v40[0] = v7;
    v40[1] = 3221225472;
    v40[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_8;
    v40[3] = &unk_1E7194B60;
    v26 = v23;
    v41 = v26;
    __49__NANowPlayingViewController_initWithBackground___block_invoke_8((uint64_t)v40);
    v27 = objc_claimAutoreleasedReturnValue();
    artworkView = v26->_artworkView;
    v26->_artworkView = (NANowPlayingArtworkView *)v27;

    v38[0] = v7;
    v38[1] = 3221225472;
    v38[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_9;
    v38[3] = &unk_1E7194B88;
    v29 = v26;
    v39 = v29;
    __49__NANowPlayingViewController_initWithBackground___block_invoke_9((uint64_t)v38);
    v30 = objc_claimAutoreleasedReturnValue();
    grabberView = v29->_grabberView;
    v29->_grabberView = (_UIGrabber *)v30;

    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_10;
    v36[3] = &unk_1E7194BB0;
    v32 = v29;
    v37 = v32;
    __49__NANowPlayingViewController_initWithBackground___block_invoke_10((uint64_t)v36);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v32[129];
    v32[129] = v33;

  }
  return v6;
}

id __49__NANowPlayingViewController_initWithBackground___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setAutoresizingMask:", 16);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  return v3;
}

NANowPlayingTitleView *__49__NANowPlayingViewController_initWithBackground___block_invoke_2(uint64_t a1)
{
  NANowPlayingTitleView *v2;
  NANowPlayingTitleView *v3;
  void *v4;
  void *v5;

  v2 = [NANowPlayingTitleView alloc];
  v3 = -[NANowPlayingTitleView initWithFrame:layoutSpecProvider:](v2, "initWithFrame:layoutSpecProvider:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NANowPlayingTitleView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
  -[NANowPlayingTitleView setMarqueeRunning:](v3, "setMarqueeRunning:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel_titleViewTapped_);
  -[NANowPlayingTitleView addGestureRecognizer:](v3, "addGestureRecognizer:", v4);

  -[NANowPlayingTitleView setDelegate:](v3, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v3);

  return v3;
}

NANowPlayingTimeControl *__49__NANowPlayingViewController_initWithBackground___block_invoke_3(uint64_t a1)
{
  NANowPlayingTimeControl *v2;
  NANowPlayingTimeControl *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v2 = [NANowPlayingTimeControl alloc];
  v3 = -[NANowPlayingTimeControl initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NANowPlayingTimeControl setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_4;
  v8[3] = &unk_1E7194A98;
  objc_copyWeak(&v10, &location);
  v9 = *(id *)(a1 + 32);
  -[NANowPlayingTimeControl setTimeDidChangeHandler:](v3, "setTimeDidChangeHandler:", v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingTimeControl setTintColor:](v3, "setTintColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingTimeControl setTimeLabelTextColor:](v3, "setTimeLabelTextColor:", v5);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v3);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v3;
}

void __49__NANowPlayingViewController_initWithBackground___block_invoke_4(uint64_t a1, char a2, double a3)
{
  void *v5;
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nowPlayingViewController:seekToPosition:", *(_QWORD *)(a1 + 32), a3);

  }
}

NANowPlayingPlaybackControls *__49__NANowPlayingViewController_initWithBackground___block_invoke_5(uint64_t a1)
{
  NANowPlayingPlaybackControls *v2;
  void *v3;
  void *v4;
  double v5;
  NANowPlayingPlaybackControls *v6;
  void *v7;

  v2 = [NANowPlayingPlaybackControls alloc];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NANowPlayingLayoutSpec playbackControlsHorizontalInsetInView:](NANowPlayingLayoutSpec, "playbackControlsHorizontalInsetInView:", v4);
  v6 = -[NANowPlayingPlaybackControls initWithFrame:inset:layoutSpecProvider:](v2, "initWithFrame:inset:layoutSpecProvider:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v5);

  -[NANowPlayingPlaybackControls setAutoresizingMask:](v6, "setAutoresizingMask:", 2);
  -[NANowPlayingPlaybackControls setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  return v6;
}

NANowPlayingVolumeSlider *__49__NANowPlayingViewController_initWithBackground___block_invoke_6(uint64_t a1)
{
  NANowPlayingVolumeSlider *v2;
  NANowPlayingVolumeSlider *v3;
  void *v4;
  void *v5;

  v2 = [NANowPlayingVolumeSlider alloc];
  v3 = -[NANowPlayingVolumeSlider initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NANowPlayingVolumeSlider setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingVolumeSlider setTintColor:](v3, "setTintColor:", v4);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v3);

  return v3;
}

NANowPlayingBottomControls *__49__NANowPlayingViewController_initWithBackground___block_invoke_7(uint64_t a1)
{
  NANowPlayingBottomControls *v2;
  NANowPlayingBottomControls *v3;
  void *v4;

  v2 = [NANowPlayingBottomControls alloc];
  v3 = -[NANowPlayingBottomControls initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NANowPlayingBottomControls setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
  -[NANowPlayingBottomControls setDelegate:](v3, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[NANowPlayingBottomControls startAirplayStatusUpdates](v3, "startAirplayStatusUpdates");
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  return v3;
}

NANowPlayingArtworkView *__49__NANowPlayingViewController_initWithBackground___block_invoke_8(uint64_t a1)
{
  NANowPlayingArtworkView *v2;
  NANowPlayingArtworkView *v3;
  void *v4;
  void *v5;

  v2 = [NANowPlayingArtworkView alloc];
  v3 = -[NANowPlayingArtworkView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NANowPlayingArtworkView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel_artworkTapped_);
  -[NANowPlayingArtworkView addGestureRecognizer:](v3, "addGestureRecognizer:", v4);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v3);

  return v3;
}

id __49__NANowPlayingViewController_initWithBackground___block_invoke_9(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC4190]);
  objc_msgSend(v2, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(v2, "sizeToFit");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v2);

  return v2;
}

id __49__NANowPlayingViewController_initWithBackground___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_dismissButtonTapped_, 64);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v2);

  NABundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Collapse to mini-player"), &stru_1E71B2988, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v5);

  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NANowPlayingViewController;
  -[NANowPlayingViewController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground, *MEMORY[0x1E0DC4860], 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double Width;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double Height;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double MaxY;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  CGFloat v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  CGFloat v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double MinY;
  void *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  void *v97;
  void *v98;
  CGFloat v99;
  void *v100;
  double v101;
  void *v102;
  double v103;
  void *v104;
  double v105;
  void *v106;
  objc_super v107;
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

  v107.receiver = self;
  v107.super_class = (Class)NANowPlayingViewController;
  -[NANowPlayingViewController viewWillLayoutSubviews](&v107, sel_viewWillLayoutSubviews);
  -[NANowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  v6 = fmax(v5, 12.0);
  -[NANowPlayingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v108);
  -[NANowPlayingViewController grabberView](self, "grabberView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = (Width - CGRectGetWidth(v109)) * 0.5;
  -[NANowPlayingViewController grabberView](self, "grabberView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = CGRectGetWidth(v110);
  -[NANowPlayingViewController grabberView](self, "grabberView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  Height = CGRectGetHeight(v111);
  -[NANowPlayingViewController grabberView](self, "grabberView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v10, v6 + 7.0, v12, Height);

  -[NANowPlayingViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v17 = CGRectGetWidth(v112);
  -[NANowPlayingViewController dismissButton](self, "dismissButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v17, v6 + 32.0);

  -[NANowPlayingViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  -[NANowPlayingViewController artworkSizeForViewWidth:](self, "artworkSizeForViewWidth:", CGRectGetWidth(v113));
  v21 = v20;
  v23 = v22;

  -[NANowPlayingViewController artworkView](self, "artworkView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", 24.0, v6 + 44.0, v21, v23);

  -[NANowPlayingViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[NANowPlayingViewController artworkView](self, "artworkView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  MaxY = CGRectGetMaxY(v114);
  -[NANowPlayingViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "window");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[NANowPlayingLayoutSpec artworkBottomMarginInView:](NANowPlayingLayoutSpec, "artworkBottomMarginInView:", v37);
  v39 = MaxY + v38;
  -[NANowPlayingViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safeAreaInsets");
  v42 = v33 - (v39 + v41 + 15.0);
  -[NANowPlayingViewController contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFrame:", v27 + 32.0, v29 + v39, v31 + -64.0, v42);

  -[NANowPlayingViewController titleView](self, "titleView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sizeToFit");

  -[NANowPlayingViewController titleView](self, "titleView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  v46 = CGRectGetWidth(v115);
  -[NANowPlayingViewController titleView](self, "titleView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  v48 = CGRectGetHeight(v116);
  -[NANowPlayingViewController titleView](self, "titleView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", 0.0, 0.0, v46, v48);

  -[NANowPlayingViewController timeControl](self, "timeControl");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingViewController contentView](self, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bounds");
  objc_msgSend(v50, "systemLayoutSizeFittingSize:", v52, v53);
  v55 = v54;
  v57 = v56;

  -[NANowPlayingViewController titleView](self, "titleView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "frame");
  v59 = CGRectGetMaxY(v117);
  -[NANowPlayingViewController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "window");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[NANowPlayingLayoutSpec titleViewBottomMarginInView:](NANowPlayingLayoutSpec, "titleViewBottomMarginInView:", v61);
  v63 = v59 + v62;
  -[NANowPlayingViewController timeControl](self, "timeControl");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setFrame:", 0.0, v63, v55, v57);

  -[NANowPlayingViewController bottomControls](self, "bottomControls");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "sizeToFit");

  -[NANowPlayingViewController bottomControls](self, "bottomControls");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "bounds");
  v67 = CGRectGetHeight(v118) + -44.0;

  -[NANowPlayingViewController view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bounds");
  v69 = CGRectGetHeight(v119);
  -[NANowPlayingViewController contentView](self, "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "frame");
  v71 = CGRectGetMaxY(v120);

  v72 = v67 + v71 - v69;
  if (v72 <= 0.0)
    v73 = 44.0;
  else
    v73 = v72 + 44.0;
  -[NANowPlayingViewController contentView](self, "contentView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "bounds");
  v75 = CGRectGetHeight(v121) - v73;
  -[NANowPlayingViewController bottomControls](self, "bottomControls");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bounds");
  v77 = CGRectGetWidth(v122);
  -[NANowPlayingViewController bottomControls](self, "bottomControls");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "bounds");
  v79 = CGRectGetHeight(v123);
  -[NANowPlayingViewController bottomControls](self, "bottomControls");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setFrame:", 0.0, v75, v77, v79);

  -[NANowPlayingViewController volumeControl](self, "volumeControl");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingViewController contentView](self, "contentView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "bounds");
  objc_msgSend(v81, "systemLayoutSizeFittingSize:", v83, v84);
  v86 = v85;
  v88 = v87;

  -[NANowPlayingViewController bottomControls](self, "bottomControls");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "frame");
  MinY = CGRectGetMinY(v124);
  -[NANowPlayingViewController view](self, "view");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "window");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  +[NANowPlayingLayoutSpec bottomControlsTopMarginInView:](NANowPlayingLayoutSpec, "bottomControlsTopMarginInView:", v92);
  v94 = MinY - v93;
  -[NANowPlayingViewController volumeControl](self, "volumeControl");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "bounds");
  v96 = v94 - CGRectGetHeight(v125);
  -[NANowPlayingViewController volumeControl](self, "volumeControl");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setFrame:", 0.0, v96, v86, v88);

  -[NANowPlayingViewController timeControl](self, "timeControl");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "frame");
  v99 = CGRectGetMaxY(v126) + 2.0;
  -[NANowPlayingViewController playbackControls](self, "playbackControls");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "bounds");
  v101 = CGRectGetWidth(v127);
  -[NANowPlayingViewController volumeControl](self, "volumeControl");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "frame");
  v103 = CGRectGetMinY(v128);
  -[NANowPlayingViewController timeControl](self, "timeControl");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "frame");
  v105 = v103 - CGRectGetMaxY(v129);
  -[NANowPlayingViewController playbackControls](self, "playbackControls");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setFrame:", 0.0, v99, v101, v105);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NANowPlayingViewController;
  -[NANowPlayingViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("NANowPlayingViewControllerWillDisappearNotification"), self);

  -[NANowPlayingViewController bottomControls](self, "bottomControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissAirplayPicker");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NANowPlayingViewController;
  -[NANowPlayingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("NANowPlayingViewControllerDidDisappearNotification"), self);

}

- (void)setCurrentTime:(double)a3 duration:(double)a4 rate:(double)a5 isWaiting:(BOOL)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;

  v7 = a7;
  v8 = a6;
  -[NANowPlayingViewController timeControl](self, "timeControl");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentTime:duration:rate:isWaiting:animated:", v8, v7, a3, a4, a5);

}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NANowPlayingViewController titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  -[NANowPlayingViewController artworkView](self, "artworkView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v4);

}

- (void)setPublisherImage:(id)a3 fallbackName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NANowPlayingViewController titleView](self, "titleView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPublisherImage:fallbackName:", v7, v6);

}

- (void)setArtwork:(id)a3
{
  -[NANowPlayingViewController setArtwork:animated:](self, "setArtwork:animated:", a3, 1);
}

- (void)setArtwork:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[NANowPlayingViewController artworkView](self, "artworkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTrackImage:animated:", v6, v4);

  -[NANowPlayingViewController artworkView](self, "artworkView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setIsPlaying:(BOOL)a3 waiting:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  -[NANowPlayingViewController playbackControls](self, "playbackControls", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsPlaying:", v4);

}

- (void)setRate:(double)a3
{
  id v4;

  -[NANowPlayingViewController bottomControls](self, "bottomControls");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRate:", a3);

}

- (UIButton)ellipsisButton
{
  void *v2;
  void *v3;

  -[NANowPlayingViewController titleView](self, "titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ellipsisButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (void)setSkipForwardButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NANowPlayingViewController playbackControls](self, "playbackControls");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSkipForwardButtonEnabled:", v3);

}

- (void)setNextTrackButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NANowPlayingViewController playbackControls](self, "playbackControls");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNextTrackButtonEnabled:", v3);

}

- (double)publisherLogoHeight
{
  void *v2;
  double v3;
  double v4;

  -[NANowPlayingViewController titleView](self, "titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publisherLogoHeight");
  v4 = v3;

  return v4;
}

- (CGSize)artworkSizeForViewWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[NANowPlayingViewController artworkView](self, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkSizeForTitleViewWidth:", a3 + -48.0);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)dismissButtonTapped:(id)a3
{
  id v4;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerDidTapDismissButton:", self);

}

- (void)artworkTapped:(id)a3
{
  id v4;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerDidRequestNavigateToArticle:", self);

}

- (void)titleViewTapped:(id)a3
{
  id v4;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerDidRequestNavigateToArticle:", self);

}

- (void)nowPlayingTitleViewDidTapEllipsis:(id)a3
{
  id v4;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerDidTapEllipsis:", self);

}

- (void)nowPlayingPlaybackControlsDidTapRewind:(id)a3
{
  id v4;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerDidTapRewind:", self);

}

- (void)nowPlayingPlaybackControlsDidTapSkipForward:(id)a3
{
  id v4;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerDidTapSkipForward:", self);

}

- (void)nowPlayingPlaybackControlsDidTapPause:(id)a3
{
  id v4;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerDidTapPause:", self);

}

- (void)nowPlayingPlaybackControlsDidTapPlay:(id)a3
{
  id v4;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerDidTapPlay:", self);

}

- (void)nowPlayingPlaybackControlsDidTapNextTrack:(id)a3
{
  id v4;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerDidTapNextTrack:", self);

}

- (void)seekToPosition:(double)a3
{
  id v5;

  -[NANowPlayingViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingViewController:seekToPosition:", self, a3);

}

- (id)nowPlayingBottomControlsProvidePlaybackRateMenu:(id)a3
{
  void *v4;
  void *v5;

  -[NANowPlayingViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingViewControllerProvidePlaybackRateMenu:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)applicationWillEnterForeground
{
  id v2;

  -[NANowPlayingViewController titleView](self, "titleView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMarqueeRunning:", 1);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (NANowPlayingArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (NANowPlayingTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (NANowPlayingTimeControl)timeControl
{
  return self->_timeControl;
}

- (void)setTimeControl:(id)a3
{
  objc_storeStrong((id *)&self->_timeControl, a3);
}

- (NANowPlayingPlaybackControls)playbackControls
{
  return self->_playbackControls;
}

- (void)setPlaybackControls:(id)a3
{
  objc_storeStrong((id *)&self->_playbackControls, a3);
}

- (NANowPlayingVolumeSlider)volumeControl
{
  return self->_volumeControl;
}

- (void)setVolumeControl:(id)a3
{
  objc_storeStrong((id *)&self->_volumeControl, a3);
}

- (NANowPlayingBottomControls)bottomControls
{
  return self->_bottomControls;
}

- (void)setBottomControls:(id)a3
{
  objc_storeStrong((id *)&self->_bottomControls, a3);
}

- (_UIGrabber)grabberView
{
  return self->_grabberView;
}

- (void)setGrabberView:(id)a3
{
  objc_storeStrong((id *)&self->_grabberView, a3);
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (NANowPlayingViewControllerDelegate)delegate
{
  return (NANowPlayingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_bottomControls, 0);
  objc_storeStrong((id *)&self->_volumeControl, 0);
  objc_storeStrong((id *)&self->_playbackControls, 0);
  objc_storeStrong((id *)&self->_timeControl, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (double)playPausePointSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NANowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NANowPlayingLayoutSpec playPausePointSizeInView:](NANowPlayingLayoutSpec, "playPausePointSizeInView:", v3);
  v5 = v4;

  return v5;
}

- (double)nextTrackAndRewindButtonPointSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NANowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NANowPlayingLayoutSpec nextTrackAndRewindButtonPointSizeInView:](NANowPlayingLayoutSpec, "nextTrackAndRewindButtonPointSizeInView:", v3);
  v5 = v4;

  return v5;
}

- (double)titleLabelFontSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NANowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NANowPlayingLayoutSpec titleLabelFontSizeInView:](NANowPlayingLayoutSpec, "titleLabelFontSizeInView:", v3);
  v5 = v4;

  return v5;
}

- (double)publisherLogoBottomMargin
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NANowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NANowPlayingLayoutSpec publisherLogoBottomMarginInView:](NANowPlayingLayoutSpec, "publisherLogoBottomMarginInView:", v3);
  v5 = v4;

  return v5;
}

@end
