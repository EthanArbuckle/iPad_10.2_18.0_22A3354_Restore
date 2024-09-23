@implementation NANowPlayingBottomControls

- (NANowPlayingBottomControls)initWithFrame:(CGRect)a3
{
  NANowPlayingBottomControls *v3;
  NANowPlayingBottomControls *v4;
  uint64_t v5;
  NANowPlayingBottomControls *v6;
  uint64_t v7;
  NATouchInsetsButton *playbackSpeedButton;
  NANowPlayingBottomControls *v9;
  uint64_t v10;
  NATouchInsetsButton *sizingPlaybackSpeedButton;
  NANowPlayingBottomControls *v12;
  uint64_t v13;
  MPRouteButton *routeButton;
  MPMediaControls *v15;
  MPMediaControls *mediaControls;
  _QWORD v18[4];
  NANowPlayingBottomControls *v19;
  _QWORD v20[4];
  NANowPlayingBottomControls *v21;
  _QWORD v22[4];
  NANowPlayingBottomControls *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NANowPlayingBottomControls;
  v3 = -[NANowPlayingBottomControls initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __44__NANowPlayingBottomControls_initWithFrame___block_invoke;
    v22[3] = &unk_1E7194930;
    v6 = v3;
    v23 = v6;
    __44__NANowPlayingBottomControls_initWithFrame___block_invoke((uint64_t)v22);
    v7 = objc_claimAutoreleasedReturnValue();
    playbackSpeedButton = v6->_playbackSpeedButton;
    v6->_playbackSpeedButton = (NATouchInsetsButton *)v7;

    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __44__NANowPlayingBottomControls_initWithFrame___block_invoke_2;
    v20[3] = &unk_1E7194930;
    v9 = v6;
    v21 = v9;
    __44__NANowPlayingBottomControls_initWithFrame___block_invoke_2((uint64_t)v20);
    v10 = objc_claimAutoreleasedReturnValue();
    sizingPlaybackSpeedButton = v9->_sizingPlaybackSpeedButton;
    v9->_sizingPlaybackSpeedButton = (NATouchInsetsButton *)v10;

    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __44__NANowPlayingBottomControls_initWithFrame___block_invoke_3;
    v18[3] = &unk_1E7194958;
    v12 = v9;
    v19 = v12;
    __44__NANowPlayingBottomControls_initWithFrame___block_invoke_3((uint64_t)v18);
    v13 = objc_claimAutoreleasedReturnValue();
    routeButton = v12->_routeButton;
    v12->_routeButton = (MPRouteButton *)v13;

    v15 = (MPMediaControls *)objc_alloc_init(MEMORY[0x1E0CC23D0]);
    mediaControls = v12->_mediaControls;
    v12->_mediaControls = v15;

    -[MPMediaControls setSourceView:](v12->_mediaControls, "setSourceView:", v12->_routeButton);
  }
  return v4;
}

id __44__NANowPlayingBottomControls_initWithFrame___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[NATouchInsetsButton buttonWithType:](NATouchInsetsButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMenu:", v5);

  objc_msgSend(v2, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(v2, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_playbackSpeedButtonTapped_, 0x4000);
  NABundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("playback speed"), &stru_1E71B2988, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v2);
  return v2;
}

id __44__NANowPlayingBottomControls_initWithFrame___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  +[NATouchInsetsButton buttonWithType:](NATouchInsetsButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playbackSpeedButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "adjustsFontForContentSizeCategory");
  objc_msgSend(v2, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", v5);

  objc_msgSend(v2, "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v2);
  return v2;
}

id __44__NANowPlayingBottomControls_initWithFrame___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x1E0CC24F0]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setExclusiveTouch:", 1);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("airplayaudio"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 5, 22.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessoryImage:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1448]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v8);

  objc_msgSend(v3, "setRouteLabelAxis:", 1);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_routeButtonTouchDown_, 1);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_routeButtonTouchUpOutside_, 128);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_routeButtonTapped_, 64);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NANowPlayingBottomControls;
  -[NANowPlayingBottomControls layoutSubviews](&v3, sel_layoutSubviews);
  -[NANowPlayingBottomControls layoutPlaybackSpeedButton](self, "layoutPlaybackSpeedButton");
  -[NANowPlayingBottomControls layoutRouteButton](self, "layoutRouteButton");
}

- (id)buttonTitleFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 20.0, *MEMORY[0x1E0DC1448]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledFontForFont:maximumPointSize:", v2, 26.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  width = a3.width;
  -[NANowPlayingBottomControls routeButton](self, "routeButton", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;

  if (v7 >= 48.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NANowPlayingBottomControls sizeThatFits:].cold.1();
  -[NANowPlayingBottomControls routeButton](self, "routeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10 * -0.5;

  -[NANowPlayingBottomControls iconCenterY](self, "iconCenterY");
  v13 = v12 + v11;
  -[NANowPlayingBottomControls routeButton](self, "routeButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessoryImageSpacing");
  v16 = v15;

  v17 = v13 + 48.0 + v16;
  v18 = width;
  result.height = v17;
  result.width = v18;
  return result;
}

- (double)iconCenterY
{
  return 22.0;
}

- (double)spacingBetweenButtonCenters
{
  CGRect v3;

  -[NANowPlayingBottomControls bounds](self, "bounds");
  return CGRectGetWidth(v3) / 3.0;
}

- (void)layoutPlaybackSpeedButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Height;
  double MidX;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[NANowPlayingBottomControls buttonTitleFont](self, "buttonTitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v3);

  -[NANowPlayingBottomControls buttonTitleFont](self, "buttonTitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingBottomControls sizingPlaybackSpeedButton](self, "sizingPlaybackSpeedButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v6);

  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  Height = CGRectGetHeight(v36);

  -[NANowPlayingBottomControls bounds](self, "bounds");
  MidX = CGRectGetMidX(v37);
  -[NANowPlayingBottomControls spacingBetweenButtonCenters](self, "spacingBetweenButtonCenters");
  v14 = MidX - v13 * 0.5;
  -[NANowPlayingBottomControls widestPlaybackSpeedLabelWidth](self, "widestPlaybackSpeedLabelWidth");
  v16 = v15;
  v17 = v14 - v15 * 0.5;
  -[NANowPlayingBottomControls iconCenterY](self, "iconCenterY");
  v19 = v18 - Height * 0.5;
  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21 = CGRectGetHeight(v38);
  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v17, v19, v16, v21);

  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v27 = NAInsetsToMinimumTapTargetForFrame(v23, v24, v25, v26);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTouchInsets:", v27, v29, v31, v33);

}

- (void)layoutRouteButton
{
  double MidX;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[NANowPlayingBottomControls bounds](self, "bounds");
  MidX = CGRectGetMidX(v37);
  -[NANowPlayingBottomControls spacingBetweenButtonCenters](self, "spacingBetweenButtonCenters");
  v5 = MidX + v4 * 0.5;
  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v7 = CGRectGetMidX(v38);
  -[NANowPlayingBottomControls widestPlaybackSpeedLabelWidth](self, "widestPlaybackSpeedLabelWidth");
  v9 = v7 + v8 * 0.5;

  -[NANowPlayingBottomControls bounds](self, "bounds");
  v10 = CGRectGetMaxX(v39) - v5 + -4.0;
  if (v5 - v9 + -4.0 < v10)
    v10 = v5 - v9 + -4.0;
  v11 = v10 + v10;
  -[NANowPlayingBottomControls routeButton](self, "routeButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingBottomControls bounds](self, "bounds");
  objc_msgSend(v12, "sizeThatFits:", v11, CGRectGetHeight(v40));
  v14 = v13;
  v16 = v15;

  if (v11 >= v14)
    v11 = v14;
  -[NANowPlayingBottomControls routeButton](self, "routeButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accessoryImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "size");
  v20 = v19 * 0.5;

  -[NANowPlayingBottomControls iconCenterY](self, "iconCenterY");
  v22 = v21 - v20;
  -[NANowPlayingBottomControls routeButton](self, "routeButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v5 - v11 * 0.5, v22, v11, v16);

  -[NANowPlayingBottomControls routeButton](self, "routeButton");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v28 = NAInsetsToMinimumTapTargetForFrame(v24, v25, v26, v27);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[NANowPlayingBottomControls routeButton](self, "routeButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHitRectInsets:", v28, v30, v32, v34);

}

- (double)widestPlaybackSpeedLabelWidth
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(&unk_1E71E1AC0, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v3)
    return 0.0;
  v4 = v3;
  v5 = *(_QWORD *)v17;
  v6 = 0.0;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v17 != v5)
        objc_enumerationMutation(&unk_1E71E1AC0);
      v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      v9 = (void *)objc_opt_class();
      objc_msgSend(v8, "doubleValue");
      objc_msgSend(v9, "_labelForRate:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NANowPlayingBottomControls sizingPlaybackSpeedButton](self, "sizingPlaybackSpeedButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:forState:", v10, 0);

      -[NANowPlayingBottomControls sizingPlaybackSpeedButton](self, "sizingPlaybackSpeedButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "intrinsicContentSize");
      v14 = v13;

      if (v14 >= v6)
        v6 = v14;

    }
    v4 = objc_msgSend(&unk_1E71E1AC0, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v4);
  return v6;
}

- (void)setRate:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_labelForRate:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);

  objc_msgSend((id)objc_opt_class(), "_accessibilityValueForRate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityValue:", v7);

  -[NANowPlayingBottomControls setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)_accessibilityValueForRate:(double)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  if (a3 >= 1.0)
  {
    if (a3 >= 1.25)
    {
      if (a3 >= 1.5)
      {
        if (a3 >= 1.75)
        {
          NABundle();
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          if (a3 >= 2.0)
            v6 = CFSTR("double speed");
          else
            v6 = CFSTR("one and three quarters speed");
        }
        else
        {
          NABundle();
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("one and a half speed");
        }
      }
      else
      {
        NABundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("one and a quarter speed");
      }
    }
    else
    {
      NABundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("normal speed");
    }
  }
  else
  {
    NABundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("three quarters speed");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E71B2988, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_labelForRate:(double)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3 >= 1.0)
  {
    if (a3 >= 1.25)
    {
      if (a3 >= 1.5)
      {
        if (a3 >= 1.75)
        {
          NABundle();
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          if (a3 >= 2.0)
            v6 = CFSTR("2");
          else
            v6 = CFSTR("1.75");
        }
        else
        {
          NABundle();
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("1.5");
        }
      }
      else
      {
        NABundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("1.25");
      }
    }
    else
    {
      NABundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("1");
    }
  }
  else
  {
    NABundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("0.75");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E71B2988, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NABundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("×"), &stru_1E71B2988, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)playbackSpeedButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "playbackSpeedButtonMenuAction:", v8, 2u);
  }

  -[NANowPlayingBottomControls delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingBottomControlsProvidePlaybackRateMenu:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NANowPlayingBottomControls playbackSpeedButton](self, "playbackSpeedButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMenu:", v6);

}

- (void)routeButtonTouchDown:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "routeButtonTouchDown:", v6, 2u);
  }

  -[NANowPlayingBottomControls mediaControls](self, "mediaControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startPrewarming");

}

- (void)routeButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "routeButtonTapped:", v6, 2u);
  }

  -[NANowPlayingBottomControls mediaControls](self, "mediaControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "present");

}

- (void)routeButtonTouchUpOutside:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "routeButtonTouchUpOutside:", v6, 2u);
  }

  -[NANowPlayingBottomControls mediaControls](self, "mediaControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopPrewarming");

}

- (void)startAirplayStatusUpdates
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_routeDidChange_, *MEMORY[0x1E0CC1CD0], 0);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__NANowPlayingBottomControls_startAirplayStatusUpdates__block_invoke;
  v4[3] = &unk_1E7194980;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CC2318], "getActiveRouteWithTimeout:completion:", v4, 1.0);
}

void __55__NANowPlayingBottomControls_startAirplayStatusUpdates__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateRouteButtonWithRoute:", a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC2318], "systemRoute");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateRouteButtonWithRoute:", v3);

  }
}

- (void)dismissAirplayPicker
{
  id v2;

  -[NANowPlayingBottomControls mediaControls](self, "mediaControls");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismiss");

}

- (void)routeDidChange:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__NANowPlayingBottomControls_routeDidChange___block_invoke;
    v9[3] = &unk_1E7194908;
    v9[4] = self;
    v10 = v7;
    v8 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

uint64_t __45__NANowPlayingBottomControls_routeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRouteButtonWithRoute:", *(_QWORD *)(a1 + 40));
}

- (void)updateRouteButtonWithRoute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[NANowPlayingBottomControls routeButton](self, "routeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRoute:", v4);

  LODWORD(v5) = objc_msgSend(v4, "isRoutingToWirelessDevice");
  v6 = v5 ^ 1;
  -[NANowPlayingBottomControls routeButton](self, "routeButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRouteLabelHidden:", v6);

  -[NANowPlayingBottomControls setNeedsLayout](self, "setNeedsLayout");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NANowPlayingBottomControls;
  -[NANowPlayingBottomControls dealloc](&v4, sel_dealloc);
}

- (NATouchInsetsButton)playbackSpeedButton
{
  return self->_playbackSpeedButton;
}

- (void)setPlaybackSpeedButton:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSpeedButton, a3);
}

- (NATouchInsetsButton)sizingPlaybackSpeedButton
{
  return self->_sizingPlaybackSpeedButton;
}

- (void)setSizingPlaybackSpeedButton:(id)a3
{
  objc_storeStrong((id *)&self->_sizingPlaybackSpeedButton, a3);
}

- (MPRouteButton)routeButton
{
  return self->_routeButton;
}

- (void)setRouteButton:(id)a3
{
  objc_storeStrong((id *)&self->_routeButton, a3);
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControls, a3);
}

- (NANowPlayingBottomControlsDelegate)delegate
{
  return (NANowPlayingBottomControlsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_routeButton, 0);
  objc_storeStrong((id *)&self->_sizingPlaybackSpeedButton, 0);
  objc_storeStrong((id *)&self->_playbackSpeedButton, 0);
}

- (void)sizeThatFits:.cold.1()
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MPRouteButton needs to be remeasured to find out its max height"));
  v1 = 136315906;
  v2 = "-[NANowPlayingBottomControls sizeThatFits:]";
  v3 = 2080;
  v4 = "NANowPlayingBottomControls.m";
  v5 = 1024;
  v6 = 111;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1B9E0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
