@implementation HUNCCameraScrubberViewController

- (HUNCCameraScrubberViewController)initWithPlaybackEngine:(id)a3 currentClip:(id)a4 startDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUNCCameraScrubberViewController *v11;
  HUNCCameraScrubberViewController *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HUNCCameraScrubberViewController;
  v11 = -[HUNCCameraScrubberViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_playbackEngine, v8);
    objc_storeStrong((id *)&v12->_currentClip, a4);
    v13 = v10;
    if (!v10)
    {
      -[HMCameraClip dateOfOccurrence](v12->_currentClip, "dateOfOccurrence");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v12->_clipStartDate, v13);
    if (!v10)

    objc_msgSend(MEMORY[0x1E0D31258], "clipPositionWithDate:", v12->_clipStartDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&v12->_playbackEngine);
    objc_msgSend(WeakRetained, "setPlaybackPosition:", v14);

  }
  return v12;
}

- (void)viewDidLoad
{
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
  uint64_t v27;
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
  objc_super v84;
  _QWORD v85[16];

  v85[14] = *MEMORY[0x1E0C80C00];
  v84.receiver = self;
  v84.super_class = (Class)HUNCCameraScrubberViewController;
  -[HUNCCameraScrubberViewController viewDidLoad](&v84, sel_viewDidLoad);
  -[HUNCCameraScrubberViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController playPauseBackgroundView](self, "playPauseBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[HUNCCameraScrubberViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController playPauseButton](self, "playPauseButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[HUNCCameraScrubberViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[HUNCCameraScrubberViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController panTrackingView](self, "panTrackingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  v57 = (void *)MEMORY[0x1E0CB3718];
  -[HUNCCameraScrubberViewController playPauseBackgroundView](self, "playPauseBackgroundView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "leftAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController view](self, "view");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "leftAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v79;
  -[HUNCCameraScrubberViewController playPauseBackgroundView](self, "playPauseBackgroundView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "widthAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToConstant:", 45.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v76;
  -[HUNCCameraScrubberViewController playPauseBackgroundView](self, "playPauseBackgroundView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "heightAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToConstant:", 44.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v73;
  -[HUNCCameraScrubberViewController playPauseBackgroundView](self, "playPauseBackgroundView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "centerYAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController view](self, "view");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "centerYAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v68;
  -[HUNCCameraScrubberViewController playPauseButton](self, "playPauseButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leftAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leftAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v63;
  -[HUNCCameraScrubberViewController playPauseButton](self, "playPauseButton");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "widthAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToConstant:", 45.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v60;
  -[HUNCCameraScrubberViewController playPauseButton](self, "playPauseButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "heightAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToConstant:", 44.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v56;
  -[HUNCCameraScrubberViewController playPauseButton](self, "playPauseButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "centerYAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "centerYAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v85[7] = v51;
  -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leftAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController playPauseBackgroundView](self, "playPauseBackgroundView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 12.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v85[8] = v46;
  -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -12.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v85[9] = v41;
  -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v85[10] = v36;
  -[HUNCCameraScrubberViewController panTrackingView](self, "panTrackingView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leftAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController playPauseBackgroundView](self, "playPauseBackgroundView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 12.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v85[11] = v31;
  -[HUNCCameraScrubberViewController panTrackingView](self, "panTrackingView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v12, -12.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v85[12] = v13;
  -[HUNCCameraScrubberViewController panTrackingView](self, "panTrackingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v85[13] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "activateConstraints:", v19);

  -[HUNCCameraScrubberViewController currentClip](self, "currentClip");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0D31258];
    -[HUNCCameraScrubberViewController clipStartDate](self, "clipStartDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clipPositionWithDate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPlaybackPosition:", v23);

    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pause");

    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31250], "defaultOptions");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:withOptions:", self, v27);

    -[HUNCCameraScrubberViewController currentClip](self, "currentClip");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_msgSend(v28, "isComplete");

    if ((v27 & 1) == 0)
      -[HUNCCameraScrubberViewController toggleLive](self, "toggleLive");
  }
  -[HUNCCameraScrubberViewController setIsVisible:](self, "setIsVisible:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUNCCameraScrubberViewController;
  -[HUNCCameraScrubberViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "play");

  -[HUNCCameraScrubberViewController setIsVisible:](self, "setIsVisible:", 1);
  -[HUNCCameraScrubberViewController _createAndStartDisplayLink](self, "_createAndStartDisplayLink");
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUNCCameraScrubberViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUNCCameraScrubberViewController;
  -[HUNCCameraScrubberViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  -[HUNCCameraScrubberViewController setIsVisible:](self, "setIsVisible:", 0);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);

  }
  -[HUNCCameraScrubberViewController _removeDisplayLink](self, "_removeDisplayLink");
  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[HUNCCameraScrubberViewController setPlaybackEngine:](self, "setPlaybackEngine:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUNCCameraScrubberViewController;
  -[HUNCCameraScrubberViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)_createAndStartDisplayLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkUpdated_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController setDisplayLink:](self, "setDisplayLink:", v5);

  -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", 1);

  -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

  -[HUNCCameraScrubberViewController _updateScrubberDisplayLinkState](self, "_updateScrubberDisplayLinkState");
}

- (void)_removeDisplayLink
{
  id v2;

  -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)playPauseButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "setSelected:", objc_msgSend(v4, "isSelected") ^ 1);

  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "contentType");

  if (!v7)
  {
    -[HUNCCameraScrubberViewController toggleLive](self, "toggleLive");
    return;
  }
  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "timeControlStatus");

  if ((unint64_t)(v9 - 1) >= 2)
  {
    if (v9)
      return;
    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "play");
  }
  else
  {
    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pause");
  }

  -[HUNCCameraScrubberViewController _updateScrubberDisplayLinkState](self, "_updateScrubberDisplayLinkState");
}

- (void)userDidPan:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  float v14;
  void *v15;
  double v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  double v21;
  id v22;

  v22 = a3;
  v4 = objc_msgSend(v22, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    -[HUNCCameraScrubberViewController _seekToCurrentScrubberValue](self, "_seekToCurrentScrubberValue");
    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endScrubbing");

    -[HUNCCameraScrubberViewController setIsScrubbing:](self, "setIsScrubbing:", 0);
    goto LABEL_6;
  }
  if (v4 == 2)
  {
    -[HUNCCameraScrubberViewController panTrackingView](self, "panTrackingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "locationInView:", v7);
    v9 = v8;
    -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;

    v13 = 1.0;
    if (v12 >= 1.0)
      v13 = v12;
    v14 = v9 / v13;
    -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v16 = v14;
    objc_msgSend(v15, "setProgress:", v16);

    -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "progress");
    v19 = v18;

    -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = fminf(fmaxf(v19, 0.0), 100.0);
    objc_msgSend(v20, "setProgress:", v21);

    -[HUNCCameraScrubberViewController _seekToCurrentScrubberValue](self, "_seekToCurrentScrubberValue");
  }
  else if (v4 == 1)
  {
    -[HUNCCameraScrubberViewController setIsScrubbing:](self, "setIsScrubbing:", 1);
    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginScrubbing");

LABEL_6:
    -[HUNCCameraScrubberViewController _updateScrubberDisplayLinkState](self, "_updateScrubberDisplayLinkState");
  }

}

- (void)toggleLive
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentType");

  if (v5)
  {
    -[HUNCCameraScrubberViewController playPauseButton](self, "playPauseButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelected:", 0);

    -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPaused:", 1);

    objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaybackPosition:", v8);

    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "play");

    -[HUNCCameraScrubberViewController playPauseButton](self, "playPauseButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[HUNCCameraScrubberViewController playPauseBackgroundView](self, "playPauseBackgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

  }
  else
  {
    -[HUNCCameraScrubberViewController showClipScrubber](self, "showClipScrubber");
  }
}

- (void)_seekToCurrentScrubberValue
{
  void *v3;
  float v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progress");
  v5 = v4;
  -[HUNCCameraScrubberViewController _playbackLength](self, "_playbackLength");
  v7 = v6 * v5;

  -[HUNCCameraScrubberViewController clipStartDate](self, "clipStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController _playbackLength](self, "_playbackLength");
  objc_msgSend(v8, "dateByAddingTimeInterval:", v9 + -0.1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUNCCameraScrubberViewController clipStartDate](self, "clipStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingTimeInterval:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__HUNCCameraScrubberViewController__seekToCurrentScrubberValue__block_invoke;
  v16[3] = &unk_1E6F4E020;
  v16[4] = self;
  v17 = v10;
  v18 = v12;
  v14 = v12;
  v15 = v10;
  objc_msgSend(v13, "modifyPlaybackFromSender:usingBlock:", self, v16);

}

void __63__HUNCCameraScrubberViewController__seekToCurrentScrubberValue__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0D31258];
  objc_msgSend(*(id *)(a1 + 40), "earlierDate:", *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clipPositionWithDate:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackPosition:", v3);

}

- (void)_updateSliderPosition
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  id v14;

  if (!-[HUNCCameraScrubberViewController isScrubbing](self, "isScrubbing"))
  {
    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "timeControlStatus") == 2;
    -[HUNCCameraScrubberViewController playPauseButton](self, "playPauseButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelected:", v4);

    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackPosition");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "clipPlaybackDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraScrubberViewController clipStartDate](self, "clipStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;
    -[HUNCCameraScrubberViewController _playbackLength](self, "_playbackLength");
    *(float *)&v10 = v10 / v11;
    -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = LODWORD(v10);
    objc_msgSend(v12, "setProgress:", v13);

  }
}

- (void)_loopPlaybackIfNeeded
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  id v15;

  -[HUNCCameraScrubberViewController clipStartDate](self, "clipStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController _playbackLength](self, "_playbackLength");
  objc_msgSend(v3, "dateByAddingTimeInterval:", v4 + -0.1);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clipPlaybackDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "earlierDate:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToDate:", v15) & 1) != 0)
  {

LABEL_4:
    -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 0;
    objc_msgSend(v13, "setProgress:", v14);

    -[HUNCCameraScrubberViewController _seekToCurrentScrubberValue](self, "_seekToCurrentScrubberValue");
    goto LABEL_5;
  }
  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playbackPosition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clipPlaybackDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToDate:", v15);

  if ((v12 & 1) != 0)
    goto LABEL_4;
LABEL_5:

}

- (double)_playbackLength
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[HUNCCameraScrubberViewController currentClip](self, "currentClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_duration");
  v4 = v3;

  result = 300.0;
  if (v4 <= 300.0)
    return v4;
  return result;
}

- (void)_updateScrubberDisplayLinkState
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "timeControlStatus") != 2
    || !-[HUNCCameraScrubberViewController isVisible](self, "isVisible")
    || -[HUNCCameraScrubberViewController isScrubbing](self, "isScrubbing");
  -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", v3);

}

- (void)_displayLinkUpdated:(id)a3
{
  -[HUNCCameraScrubberViewController _loopPlaybackIfNeeded](self, "_loopPlaybackIfNeeded", a3);
  -[HUNCCameraScrubberViewController _updateSliderPosition](self, "_updateSliderPosition");
}

- (double)currentScrubberResolution
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentScaleFactor");
  v8 = v5 * v7;

  return v8;
}

- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD block[5];

  if (!-[HUNCCameraScrubberViewController isScrubbing](self, "isScrubbing", a3, a4))
  {
    -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackPosition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "contentType");

    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__HUNCCameraScrubberViewController_playbackEngine_didUpdateTimeControlStatus___block_invoke;
      block[3] = &unk_1E6F4D988;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __78__HUNCCameraScrubberViewController_playbackEngine_didUpdateTimeControlStatus___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeControlStatus") == 2;
  objc_msgSend(*(id *)(a1 + 32), "playPauseButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_updateScrubberDisplayLinkState");
}

- (void)showClipScrubber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaused:", 0);

  v4 = (void *)MEMORY[0x1E0D31258];
  -[HUNCCameraScrubberViewController clipStartDate](self, "clipStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clipPositionWithDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraScrubberViewController playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaybackPosition:", v6);

  -[HUNCCameraScrubberViewController playPauseButton](self, "playPauseButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  -[HUNCCameraScrubberViewController playPauseBackgroundView](self, "playPauseBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  -[HUNCCameraScrubberViewController progressSlider](self, "progressSlider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 0);

}

- (void)didMoveToParentViewController:(id)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  HUNCCameraScrubberViewController *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)HUNCCameraScrubberViewController;
  -[HUNCCameraScrubberViewController didMoveToParentViewController:](&v9, sel_didMoveToParentViewController_);
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);

  }
  if (!a3)
  {
    -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[HUNCCameraScrubberViewController setDisplayLink:](self, "setDisplayLink:", 0);
  }
}

- (UIProgressView)progressSlider
{
  UIProgressView *progressSlider;
  UIProgressView *v4;
  void *v5;
  void *v6;
  UIProgressView *v7;

  progressSlider = self->_progressSlider;
  if (!progressSlider)
  {
    v4 = (UIProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8E8]), "initWithProgressViewStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIProgressView setProgressTintColor:](v4, "setProgressTintColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIProgressView setTrackTintColor:](v4, "setTrackTintColor:", v6);

    -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = self->_progressSlider;
    self->_progressSlider = v4;

    progressSlider = self->_progressSlider;
  }
  return progressSlider;
}

- (UIView)panTrackingView
{
  UIView *panTrackingView;
  id v4;
  UIView *v5;
  void *v6;
  UIView *v7;

  panTrackingView = self->_panTrackingView;
  if (!panTrackingView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel_userDidPan_);
    -[UIView addGestureRecognizer:](v5, "addGestureRecognizer:", v6);
    v7 = self->_panTrackingView;
    self->_panTrackingView = v5;

    panTrackingView = self->_panTrackingView;
  }
  return panTrackingView;
}

- (UIButton)playPauseButton
{
  UIButton *playPauseButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;

  playPauseButton = self->_playPauseButton;
  if (!playPauseButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

    HUImageNamed(CFSTR("Play"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    HUImageNamed(CFSTR("Pause"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](v4, "setImage:forState:", v7, 0);
    -[UIButton setImage:forState:](v4, "setImage:forState:", v9, 4);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4, "setTintColor:", v10);

    -[UIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel_playPauseButtonPressed_, 64);
    v11 = self->_playPauseButton;
    self->_playPauseButton = v4;

    playPauseButton = self->_playPauseButton;
  }
  return playPauseButton;
}

- (UIView)playPauseBackgroundView
{
  UIView *playPauseBackgroundView;
  UIView *v4;
  UIView *v5;

  playPauseBackgroundView = self->_playPauseBackgroundView;
  if (!playPauseBackgroundView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0C8B3F8]);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 16.0);
    v5 = self->_playPauseBackgroundView;
    self->_playPauseBackgroundView = v4;

    playPauseBackgroundView = self->_playPauseBackgroundView;
  }
  return playPauseBackgroundView;
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  HUNCCameraScrubberViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);

  }
  -[HUNCCameraScrubberViewController displayLink](self, "displayLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  v7.receiver = self;
  v7.super_class = (Class)HUNCCameraScrubberViewController;
  -[HUNCCameraScrubberViewController dealloc](&v7, sel_dealloc);
}

- (UIButton)liveButton
{
  return self->_liveButton;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (void)setIsScrubbing:(BOOL)a3
{
  self->_isScrubbing = a3;
}

- (void)setPlayPauseButton:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseButton, a3);
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return (HFCameraPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeWeak((id *)&self->_playbackEngine, a3);
}

- (HMCameraClip)currentClip
{
  return self->_currentClip;
}

- (void)setCurrentClip:(id)a3
{
  objc_storeStrong((id *)&self->_currentClip, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (NSDate)clipStartDate
{
  return self->_clipStartDate;
}

- (void)setClipStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_clipStartDate, a3);
}

- (void)setProgressSlider:(id)a3
{
  objc_storeStrong((id *)&self->_progressSlider, a3);
}

- (void)setPanTrackingView:(id)a3
{
  objc_storeStrong((id *)&self->_panTrackingView, a3);
}

- (void)setPlayPauseBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playPauseBackgroundView, 0);
  objc_storeStrong((id *)&self->_panTrackingView, 0);
  objc_storeStrong((id *)&self->_progressSlider, 0);
  objc_storeStrong((id *)&self->_clipStartDate, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_currentClip, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_liveButton, 0);
}

@end
