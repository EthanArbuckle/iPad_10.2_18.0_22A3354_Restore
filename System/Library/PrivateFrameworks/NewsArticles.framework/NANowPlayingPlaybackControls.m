@implementation NANowPlayingPlaybackControls

- (NANowPlayingPlaybackControls)initWithFrame:(CGRect)a3 inset:(double)a4 layoutSpecProvider:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  NANowPlayingPlaybackControls *v12;
  NANowPlayingPlaybackControls *v13;
  uint64_t v14;
  NANowPlayingPlaybackControls *v15;
  uint64_t v16;
  UIView *contentView;
  NANowPlayingPlaybackControls *v18;
  uint64_t v19;
  UIButton *rewindButton;
  NANowPlayingPlaybackControls *v21;
  uint64_t v22;
  UIButton *playPauseButton;
  id *v24;
  uint64_t v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  id (*v30)(uint64_t);
  void *v31;
  id *v32;
  _QWORD v33[4];
  NANowPlayingPlaybackControls *v34;
  _QWORD v35[4];
  NANowPlayingPlaybackControls *v36;
  _QWORD v37[4];
  NANowPlayingPlaybackControls *v38;
  objc_super v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v39.receiver = self;
  v39.super_class = (Class)NANowPlayingPlaybackControls;
  v12 = -[NANowPlayingPlaybackControls initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v14 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke;
    v37[3] = &unk_1E7194A48;
    v15 = v12;
    v38 = v15;
    __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke((uint64_t)v37);
    v16 = objc_claimAutoreleasedReturnValue();
    contentView = v15->_contentView;
    v15->_contentView = (UIView *)v16;

    v35[0] = v14;
    v35[1] = 3221225472;
    v35[2] = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_2;
    v35[3] = &unk_1E7194BB0;
    v18 = v15;
    v36 = v18;
    __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_2((uint64_t)v35);
    v19 = objc_claimAutoreleasedReturnValue();
    rewindButton = v18->_rewindButton;
    v18->_rewindButton = (UIButton *)v19;

    v33[0] = v14;
    v33[1] = 3221225472;
    v33[2] = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_3;
    v33[3] = &unk_1E7194930;
    v21 = v18;
    v34 = v21;
    __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_3((uint64_t)v33);
    v22 = objc_claimAutoreleasedReturnValue();
    playPauseButton = v21->_playPauseButton;
    v21->_playPauseButton = (UIButton *)v22;

    v28 = v14;
    v29 = 3221225472;
    v30 = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_4;
    v31 = &unk_1E7194BB0;
    v24 = v21;
    v32 = v24;
    __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_4((uint64_t)&v28);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v24[57];
    v24[57] = (id)v25;

    objc_storeWeak(v24 + 59, v11);
    *((double *)v24 + 58) = a4;
    objc_msgSend(v24, "setIsPlaying:", 0, v28, v29, v30, v31);

  }
  return v13;
}

id __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setAutoresizingMask:", 16);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);
  return v3;
}

id __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buttonColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

  objc_msgSend(v2, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_rewindButtonTapped_, 64);
  NABundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("rewind, 15 seconds"), &stru_1E71B2988, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v5);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v2);

  return v2;
}

id __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[NATouchInsetsButton buttonWithType:](NATouchInsetsButton, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buttonColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

  objc_msgSend(v2, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  NABundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("pause"), &stru_1E71B2988, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v5);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v2);

  return v2;
}

id __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buttonColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

  objc_msgSend(v2, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_nextTrackButtonTapped_, 64);
  NABundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("next track"), &stru_1E71B2988, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v5);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v2);

  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double x;
  double y;
  double width;
  double height;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double MidX;
  void *v45;
  double MidY;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  objc_super v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v61.receiver = self;
  v61.super_class = (Class)NANowPlayingPlaybackControls;
  -[NANowPlayingPlaybackControls layoutSubviews](&v61, sel_layoutSubviews);
  -[NANowPlayingPlaybackControls rewindButton](self, "rewindButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gobackward.15"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3888];
  -[NANowPlayingPlaybackControls layoutSpecProvider](self, "layoutSpecProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextTrackAndRewindButtonPointSize");
  objc_msgSend(v5, "configurationWithPointSize:weight:scale:", 4, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundImage:forState:", v8, 0);

  -[NANowPlayingPlaybackControls rewindButton](self, "rewindButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

  -[NANowPlayingPlaybackControls playPauseButton](self, "playPauseButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NANowPlayingPlaybackControls isPlaying](self, "isPlaying"))
    v11 = CFSTR("pause.fill");
  else
    v11 = CFSTR("play.fill");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3888];
  -[NANowPlayingPlaybackControls layoutSpecProvider](self, "layoutSpecProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playPausePointSize");
  objc_msgSend(v13, "configurationWithPointSize:weight:scale:", 8, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundImage:forState:", v16, 0);

  -[NANowPlayingPlaybackControls playPauseButton](self, "playPauseButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeToFit");

  -[NANowPlayingPlaybackControls updateForwardButton](self, "updateForwardButton");
  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeToFit");

  -[NANowPlayingPlaybackControls bounds](self, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[NANowPlayingPlaybackControls inset](self, "inset");
  v28 = v27;
  v62.origin.x = v20;
  v62.origin.y = v22;
  v62.size.width = v24;
  v62.size.height = v26;
  v63 = CGRectInset(v62, v28, 0.0);
  x = v63.origin.x;
  y = v63.origin.y;
  width = v63.size.width;
  height = v63.size.height;
  -[NANowPlayingPlaybackControls contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", x, y, width, height);

  -[NANowPlayingPlaybackControls contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v35 = CGRectGetHeight(v64);
  -[NANowPlayingPlaybackControls rewindButton](self, "rewindButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v37 = (v35 - CGRectGetHeight(v65)) * 0.5;
  -[NANowPlayingPlaybackControls rewindButton](self, "rewindButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  v39 = CGRectGetWidth(v66);
  -[NANowPlayingPlaybackControls rewindButton](self, "rewindButton");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  v41 = CGRectGetHeight(v67);
  -[NANowPlayingPlaybackControls rewindButton](self, "rewindButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", 0.0, v37, v39, v41);

  -[NANowPlayingPlaybackControls contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bounds");
  MidX = CGRectGetMidX(v68);
  -[NANowPlayingPlaybackControls contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  MidY = CGRectGetMidY(v69);
  -[NANowPlayingPlaybackControls playPauseButton](self, "playPauseButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setCenter:", MidX, MidY);

  -[NANowPlayingPlaybackControls contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bounds");
  v49 = CGRectGetWidth(v70);
  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bounds");
  v51 = v49 - CGRectGetWidth(v71);
  -[NANowPlayingPlaybackControls contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  v53 = CGRectGetHeight(v72);
  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bounds");
  v55 = (v53 - CGRectGetHeight(v73)) * 0.5;
  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bounds");
  v57 = CGRectGetWidth(v74);
  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bounds");
  v59 = CGRectGetHeight(v75);
  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFrame:", v51, v55, v57, v59);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  -[NANowPlayingPlaybackControls rewindButton](self, "rewindButton", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[NANowPlayingPlaybackControls playPauseButton](self, "playPauseButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;

  if (v10 >= v13)
    v14 = v10;
  else
    v14 = v13;
  if (v7 >= v14)
    v15 = v7;
  else
    v15 = v14;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (id)buttonColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (id)disabledButtonColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
}

- (void)setIsPlaying:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char **v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = a3;
  self->_isPlaying = a3;
  -[NANowPlayingPlaybackControls playPauseButton](self, "playPauseButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("pause.fill");
  else
    v6 = CFSTR("play.fill");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3888];
  -[NANowPlayingPlaybackControls layoutSpecProvider](self, "layoutSpecProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playPausePointSize");
  objc_msgSend(v8, "configurationWithPointSize:weight:scale:", 8, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundImage:forState:", v11, 0);

  -[NANowPlayingPlaybackControls playPauseButton](self, "playPauseButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeTarget:action:forControlEvents:", self, 0, 64);

  -[NANowPlayingPlaybackControls playPauseButton](self, "playPauseButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = &selRef_pauseButtonTapped_;
  if (!v3)
    v15 = &selRef_playButtonTapped_;
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, *v15, 64);

  NABundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16;
  if (v3)
    v17 = CFSTR("pause");
  else
    v17 = CFSTR("play");
  objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_1E71B2988, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingPlaybackControls playPauseButton](self, "playPauseButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityLabel:", v18);

}

- (void)setNextTrackButtonEnabled:(BOOL)a3
{
  self->_nextTrackButtonEnabled = a3;
  -[NANowPlayingPlaybackControls updateForwardButton](self, "updateForwardButton");
}

- (void)setSkipForwardButtonEnabled:(BOOL)a3
{
  self->_skipForwardButtonEnabled = a3;
  -[NANowPlayingPlaybackControls updateForwardButton](self, "updateForwardButton");
}

- (void)updateForwardButton
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v23;
  _BOOL8 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;

  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 64);

  v4 = -[NANowPlayingPlaybackControls skipForwardButtonEnabled](self, "skipForwardButtonEnabled");
  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("goforward.15"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3888];
    -[NANowPlayingPlaybackControls layoutSpecProvider](self, "layoutSpecProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextTrackAndRewindButtonPointSize");
    objc_msgSend(v7, "configurationWithPointSize:weight:scale:", 4, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundImage:forState:", v10, 0);

    -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_skipForwardButtonTapped_, 64);

    NABundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("skip forward");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("forward.fill"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3888];
    -[NANowPlayingPlaybackControls layoutSpecProvider](self, "layoutSpecProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nextTrackAndRewindButtonPointSize");
    objc_msgSend(v16, "configurationWithPointSize:weight:scale:", 4, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithConfiguration:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundImage:forState:", v19, 0);

    -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel_nextTrackButtonTapped_, 64);

    NABundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("next track");
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E71B2988, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityLabel:", v21);

  if (-[NANowPlayingPlaybackControls nextTrackButtonEnabled](self, "nextTrackButtonEnabled"))
  {
    -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setEnabled:", 1);

  }
  else
  {
    v24 = -[NANowPlayingPlaybackControls skipForwardButtonEnabled](self, "skipForwardButtonEnabled");
    -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setEnabled:", v24);

    if (!v24)
    {
      -[NANowPlayingPlaybackControls disabledButtonColor](self, "disabledButtonColor");
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  -[NANowPlayingPlaybackControls buttonColor](self, "buttonColor");
  v26 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v28 = (id)v26;
  -[NANowPlayingPlaybackControls forwardButton](self, "forwardButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTintColor:", v28);

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
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "Rewind tapped", v6, 2u);
  }

  -[NANowPlayingPlaybackControls delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingPlaybackControlsDidTapRewind:", self);

}

- (void)skipForwardButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "Skip forward tapped", v6, 2u);
  }

  -[NANowPlayingPlaybackControls delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingPlaybackControlsDidTapSkipForward:", self);

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
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "Pause button tapped", v6, 2u);
  }

  -[NANowPlayingPlaybackControls delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingPlaybackControlsDidTapPause:", self);

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
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "Play button tapped", v6, 2u);
  }

  -[NANowPlayingPlaybackControls delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingPlaybackControlsDidTapPlay:", self);

}

- (void)nextTrackButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "Next track button tapped", v6, 2u);
  }

  -[NANowPlayingPlaybackControls delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingPlaybackControlsDidTapNextTrack:", self);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)nextTrackButtonEnabled
{
  return self->_nextTrackButtonEnabled;
}

- (BOOL)skipForwardButtonEnabled
{
  return self->_skipForwardButtonEnabled;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (NANowPlayingPlaybackControlsDelegate)delegate
{
  return (NANowPlayingPlaybackControlsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIButton)rewindButton
{
  return self->_rewindButton;
}

- (void)setRewindButton:(id)a3
{
  objc_storeStrong((id *)&self->_rewindButton, a3);
}

- (UIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseButton, a3);
}

- (UIButton)forwardButton
{
  return self->_forwardButton;
}

- (void)setForwardButton:(id)a3
{
  objc_storeStrong((id *)&self->_forwardButton, a3);
}

- (double)inset
{
  return self->_inset;
}

- (void)setInset:(double)a3
{
  self->_inset = a3;
}

- (NANowPlayingPlaybackControlsLayoutSpecProvider)layoutSpecProvider
{
  return (NANowPlayingPlaybackControlsLayoutSpecProvider *)objc_loadWeakRetained((id *)&self->_layoutSpecProvider);
}

- (void)setLayoutSpecProvider:(id)a3
{
  objc_storeWeak((id *)&self->_layoutSpecProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutSpecProvider);
  objc_storeStrong((id *)&self->_forwardButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_rewindButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
