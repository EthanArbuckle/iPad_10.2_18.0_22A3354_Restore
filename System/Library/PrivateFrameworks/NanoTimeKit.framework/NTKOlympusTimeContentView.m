@implementation NTKOlympusTimeContentView

- (NTKOlympusTimeContentView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6
{
  return -[NTKOlympusTimeContentView initWithDevice:dial:style:colorPalette:useSmallFont:circularLogoImage:](self, "initWithDevice:dial:style:colorPalette:useSmallFont:circularLogoImage:", a3, a4, a5, a6, 0, 0);
}

- (NTKOlympusTimeContentView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 useSmallFont:(BOOL)a7 circularLogoImage:(id)a8
{
  id v14;
  id v15;
  id v16;
  NTKOlympusTimeContentView *v17;
  NTKOlympusTimeContentView *v18;
  uint64_t v19;
  CLKTimeFormatter *timeFormatter;
  id v21;
  uint64_t v22;
  UIView *contentView;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  v33.receiver = self;
  v33.super_class = (Class)NTKOlympusTimeContentView;
  v17 = -[NTKOlympusTimeContentView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v18 = v17;
  if (v17)
  {
    -[NTKOlympusTimeContentView setDevice:](v17, "setDevice:", v14);
    v18->_style = a5;
    v18->_dial = a4;
    objc_storeStrong((id *)&v18->_colorPalette, a6);
    v18->_useSmallFont = a7;
    objc_storeStrong((id *)&v18->_circularLogoImage, a8);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94550]), "initWithForcesLatinNumbers:", 1);
    timeFormatter = v18->_timeFormatter;
    v18->_timeFormatter = (CLKTimeFormatter *)v19;

    -[CLKTimeFormatter addObserver:](v18->_timeFormatter, "addObserver:", v18);
    v21 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKOlympusTimeContentView bounds](v18, "bounds");
    v22 = objc_msgSend(v21, "initWithFrame:");
    contentView = v18->_contentView;
    v18->_contentView = (UIView *)v22;

    -[NTKOlympusTimeContentView addSubview:](v18, "addSubview:", v18->_contentView);
    v24 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKOlympusTimeContentView bounds](v18, "bounds");
    v25 = (void *)objc_msgSend(v24, "initWithFrame:");
    -[NTKOlympusTimeContentView setFullscreenDigitsContainerView:](v18, "setFullscreenDigitsContainerView:", v25);

    -[NTKOlympusTimeContentView contentView](v18, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKOlympusTimeContentView fullscreenDigitsContainerView](v18, "fullscreenDigitsContainerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v27);

    v28 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKOlympusTimeContentView bounds](v18, "bounds");
    v29 = (void *)objc_msgSend(v28, "initWithFrame:");
    -[NTKOlympusTimeContentView setCircularDigitsContainerView:](v18, "setCircularDigitsContainerView:", v29);

    -[NTKOlympusTimeContentView contentView](v18, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKOlympusTimeContentView circularDigitsContainerView](v18, "circularDigitsContainerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v31);

    -[NTKOlympusTimeContentView createAndRemoveViewsForCurrentStateIfNeeded](v18, "createAndRemoveViewsForCurrentStateIfNeeded");
    -[NTKOlympusTimeContentView updateColors](v18, "updateColors");
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[CLKTimeFormatter removeObserver:](self->_timeFormatter, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)NTKOlympusTimeContentView;
  -[NTKOlympusTimeContentView dealloc](&v3, sel_dealloc);
}

- (void)createAndRemoveViewsForCurrentStateIfNeeded
{
  unint64_t dial;
  unint64_t style;

  dial = self->_dial;
  if (dial == 1)
  {
    -[NTKOlympusTimeContentView removeCircularViews](self, "removeCircularViews");
    -[NTKOlympusTimeContentView createFullscreenLogoIfNeeded](self, "createFullscreenLogoIfNeeded");
    style = self->_style;
    if (!style)
    {
      -[NTKOlympusTimeContentView createFullscreenDigitalViewsIfNeeded](self, "createFullscreenDigitalViewsIfNeeded");
      style = self->_style;
    }
    if (style == 1)
      -[NTKOlympusTimeContentView createFullscreenHybridViewsIfNeeded](self, "createFullscreenHybridViewsIfNeeded");
  }
  else if (!dial)
  {
    -[NTKOlympusTimeContentView createCircularViewsIfNeeded](self, "createCircularViewsIfNeeded");
    -[NTKOlympusTimeContentView removeFullscreenViews](self, "removeFullscreenViews");
  }
  -[NTKOlympusTimeContentView timeFormatterTextDidChange:](self, "timeFormatterTextDidChange:", self->_timeFormatter);
  -[NTKOlympusTimeContentView setDial:](self, "setDial:", self->_dial);
  -[NTKOlympusTimeContentView setStyle:](self, "setStyle:", self->_style);
  -[NTKOlympusTimeContentView setColorPalette:](self, "setColorPalette:", self->_colorPalette);
}

- (void)configureViewsForEditing
{
  -[NTKOlympusTimeContentView createCircularViewsIfNeeded](self, "createCircularViewsIfNeeded");
  -[NTKOlympusTimeContentView createFullscreenLogoIfNeeded](self, "createFullscreenLogoIfNeeded");
  -[NTKOlympusTimeContentView createFullscreenDigitalViewsIfNeeded](self, "createFullscreenDigitalViewsIfNeeded");
  -[NTKOlympusTimeContentView createFullscreenHybridViewsIfNeeded](self, "createFullscreenHybridViewsIfNeeded");
  -[NTKOlympusTimeContentView timeFormatterTextDidChange:](self, "timeFormatterTextDidChange:", self->_timeFormatter);
  -[NTKOlympusTimeContentView setDial:](self, "setDial:", self->_dial);
  -[NTKOlympusTimeContentView setStyle:](self, "setStyle:", self->_style);
  -[NTKOlympusTimeContentView setColorPalette:](self, "setColorPalette:", self->_colorPalette);
}

- (void)createFullscreenLogoIfNeeded
{
  void *v3;
  UIButton *v4;
  UIButton *fullscreenLogoButton;
  id v6;

  if (!self->_fullscreenLogoButton)
  {
    NTKImageNamed(CFSTR("victoryNTK-fullscreen-logo"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKOlympusTimeContentView createLogoButtonWithBackgroundImage:](self, "createLogoButtonWithBackgroundImage:", v3);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    fullscreenLogoButton = self->_fullscreenLogoButton;
    self->_fullscreenLogoButton = v4;

    -[NTKOlympusTimeContentView contentView](self, "contentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_fullscreenLogoButton);

  }
}

- (void)createCircularViewsIfNeeded
{
  void *v3;
  UIButton *v4;
  UIButton *circularLogoButton;
  void *v6;
  NTKVictoryLabel *v7;
  NTKVictoryLabel *circularUpperTimeLabel;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NTKVictoryLabel *v13;
  NTKVictoryLabel *circularLowerTimeLabel;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _OWORD v19[14];
  double v20;
  double v21[30];
  _OWORD v22[14];
  double v23;
  double v24[30];

  if (!self->_circularLogoButton)
  {
    -[NTKOlympusTimeContentView circularLogoImage](self, "circularLogoImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKOlympusTimeContentView createLogoButtonWithBackgroundImage:](self, "createLogoButtonWithBackgroundImage:", v3);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    circularLogoButton = self->_circularLogoButton;
    self->_circularLogoButton = v4;

    -[NTKOlympusTimeContentView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_circularLogoButton);

  }
  if (!self->_circularUpperTimeLabel)
  {
    v7 = objc_alloc_init(NTKVictoryLabel);
    circularUpperTimeLabel = self->_circularUpperTimeLabel;
    self->_circularUpperTimeLabel = v7;

    -[NTKOlympusTimeContentView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_9(v9, v24);
    -[NTKVictoryLabel setAdditionalPaddingInsets:](self->_circularUpperTimeLabel, "setAdditionalPaddingInsets:", v24[0]);

    -[NTKOlympusTimeContentView device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_9(v10, v22);
    -[NTKVictoryLabel setDrawingRectOffset:](self->_circularUpperTimeLabel, "setDrawingRectOffset:", v23, 0.0);

    -[NTKOlympusTimeContentView fontForCircularDial](self, "fontForCircularDial");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](self->_circularUpperTimeLabel, "setFont:", v11);

    -[NTKVictoryLabel setTextAlignment:](self->_circularUpperTimeLabel, "setTextAlignment:", 2);
    -[NTKOlympusTimeContentView circularDigitsContainerView](self, "circularDigitsContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_circularUpperTimeLabel);

  }
  if (!self->_circularLowerTimeLabel)
  {
    v13 = objc_alloc_init(NTKVictoryLabel);
    circularLowerTimeLabel = self->_circularLowerTimeLabel;
    self->_circularLowerTimeLabel = v13;

    -[NTKOlympusTimeContentView device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_9(v15, v21);
    -[NTKVictoryLabel setAdditionalPaddingInsets:](self->_circularLowerTimeLabel, "setAdditionalPaddingInsets:", v21[0]);

    -[NTKOlympusTimeContentView device](self, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_9(v16, v19);
    -[NTKVictoryLabel setDrawingRectOffset:](self->_circularLowerTimeLabel, "setDrawingRectOffset:", v20, 0.0);

    -[NTKOlympusTimeContentView fontForCircularDial](self, "fontForCircularDial");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](self->_circularLowerTimeLabel, "setFont:", v17);

    -[NTKVictoryLabel setTextAlignment:](self->_circularLowerTimeLabel, "setTextAlignment:", 2);
    -[NTKOlympusTimeContentView circularDigitsContainerView](self, "circularDigitsContainerView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", self->_circularLowerTimeLabel);

  }
}

- (id)createLogoButtonWithBackgroundImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  +[NTKVictoryLogoButton buttonWithType:](NTKVictoryLogoButton, "buttonWithType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundImage:forState:", v4, 0);

  objc_msgSend(v5, "setUserInteractionEnabled:", 1);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_handleLogoButtonHighlighted_, 1);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_handleLogoButtonResetHighlight_, 256);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_handleLogoButtonTouchUpInside_, 64);
  objc_msgSend(v5, "sizeToFit");
  return v5;
}

- (void)createFullscreenDigitalViewsIfNeeded
{
  NTKVictoryLabel *v3;
  NTKVictoryLabel *fullscreenDigitalUpperTimeLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NTKVictoryLabel *v9;
  NTKVictoryLabel *fullscreenDigitalLowerTimeLabel;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _OWORD v15[14];
  double v16;
  double v17[30];
  _OWORD v18[14];
  double v19;
  double v20[30];

  if (!self->_fullscreenDigitalUpperTimeLabel)
  {
    v3 = objc_alloc_init(NTKVictoryLabel);
    fullscreenDigitalUpperTimeLabel = self->_fullscreenDigitalUpperTimeLabel;
    self->_fullscreenDigitalUpperTimeLabel = v3;

    -[NTKOlympusTimeContentView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_9(v5, v20);
    -[NTKVictoryLabel setAdditionalPaddingInsets:](self->_fullscreenDigitalUpperTimeLabel, "setAdditionalPaddingInsets:", v20[0]);

    -[NTKOlympusTimeContentView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_9(v6, v18);
    -[NTKVictoryLabel setDrawingRectOffset:](self->_fullscreenDigitalUpperTimeLabel, "setDrawingRectOffset:", v19, 0.0);

    -[NTKOlympusTimeContentView fontForDigitalFullscreen](self, "fontForDigitalFullscreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](self->_fullscreenDigitalUpperTimeLabel, "setFont:", v7);

    -[NTKVictoryLabel setTextAlignment:](self->_fullscreenDigitalUpperTimeLabel, "setTextAlignment:", 2);
    -[NTKOlympusTimeContentView fullscreenDigitsContainerView](self, "fullscreenDigitsContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_fullscreenDigitalUpperTimeLabel);

  }
  if (!self->_fullscreenDigitalLowerTimeLabel)
  {
    v9 = objc_alloc_init(NTKVictoryLabel);
    fullscreenDigitalLowerTimeLabel = self->_fullscreenDigitalLowerTimeLabel;
    self->_fullscreenDigitalLowerTimeLabel = v9;

    -[NTKOlympusTimeContentView device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_9(v11, v17);
    -[NTKVictoryLabel setAdditionalPaddingInsets:](self->_fullscreenDigitalLowerTimeLabel, "setAdditionalPaddingInsets:", v17[0]);

    -[NTKOlympusTimeContentView device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_9(v12, v15);
    -[NTKVictoryLabel setDrawingRectOffset:](self->_fullscreenDigitalLowerTimeLabel, "setDrawingRectOffset:", v16, 0.0);

    -[NTKOlympusTimeContentView fontForDigitalFullscreen](self, "fontForDigitalFullscreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](self->_fullscreenDigitalLowerTimeLabel, "setFont:", v13);

    -[NTKVictoryLabel setTextAlignment:](self->_fullscreenDigitalLowerTimeLabel, "setTextAlignment:", 2);
    -[NTKOlympusTimeContentView fullscreenDigitsContainerView](self, "fullscreenDigitsContainerView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", self->_fullscreenDigitalLowerTimeLabel);

  }
}

- (void)createFullscreenHybridViewsIfNeeded
{
  void *v3;
  NTKVictoryTimeLabel *v4;
  NTKVictoryTimeLabel *fullscreenHybridUpperTimeLabel;
  void *v6;
  NTKVictoryLabel *v7;
  NTKVictoryLabel *fullscreenHybridLowerTimeLabel;
  void *v9;
  void *v10;
  id v11;
  double v12[30];

  if (!self->_fullscreenHybridUpperTimeLabel)
  {
    -[NTKOlympusTimeContentView fontForHybridFullscreen](self, "fontForHybridFullscreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKOlympusTimeContentView createTimeLabelWithFont:option:](self, "createTimeLabelWithFont:option:", v3, 1024);
    v4 = (NTKVictoryTimeLabel *)objc_claimAutoreleasedReturnValue();
    fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
    self->_fullscreenHybridUpperTimeLabel = v4;

    -[NTKOlympusTimeContentView fullscreenDigitsContainerView](self, "fullscreenDigitsContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_fullscreenHybridUpperTimeLabel);

  }
  if (!self->_fullscreenHybridLowerTimeLabel)
  {
    v7 = objc_alloc_init(NTKVictoryLabel);
    fullscreenHybridLowerTimeLabel = self->_fullscreenHybridLowerTimeLabel;
    self->_fullscreenHybridLowerTimeLabel = v7;

    -[NTKOlympusTimeContentView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_9(v9, v12);
    -[NTKVictoryLabel setAdditionalPaddingInsets:](self->_fullscreenHybridLowerTimeLabel, "setAdditionalPaddingInsets:", v12[0]);

    -[NTKOlympusTimeContentView fontForHybridFullscreen](self, "fontForHybridFullscreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](self->_fullscreenHybridLowerTimeLabel, "setFont:", v10);

    -[NTKVictoryLabel setTextAlignment:](self->_fullscreenHybridLowerTimeLabel, "setTextAlignment:", 1);
    -[NTKOlympusTimeContentView fullscreenDigitsContainerView](self, "fullscreenDigitsContainerView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_fullscreenHybridLowerTimeLabel);

  }
}

- (void)removeFullscreenViews
{
  UIButton *fullscreenLogoButton;
  NTKVictoryTimeLabel *fullscreenHybridUpperTimeLabel;
  NTKVictoryLabel *fullscreenHybridLowerTimeLabel;
  NTKVictoryLabel *fullscreenDigitalUpperTimeLabel;
  NTKVictoryLabel *fullscreenDigitalLowerTimeLabel;

  -[UIButton removeFromSuperview](self->_fullscreenLogoButton, "removeFromSuperview");
  fullscreenLogoButton = self->_fullscreenLogoButton;
  self->_fullscreenLogoButton = 0;

  -[NTKVictoryTimeLabel removeFromSuperview](self->_fullscreenHybridUpperTimeLabel, "removeFromSuperview");
  fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
  self->_fullscreenHybridUpperTimeLabel = 0;

  -[NTKVictoryLabel removeFromSuperview](self->_fullscreenHybridLowerTimeLabel, "removeFromSuperview");
  fullscreenHybridLowerTimeLabel = self->_fullscreenHybridLowerTimeLabel;
  self->_fullscreenHybridLowerTimeLabel = 0;

  -[NTKVictoryLabel removeFromSuperview](self->_fullscreenDigitalUpperTimeLabel, "removeFromSuperview");
  fullscreenDigitalUpperTimeLabel = self->_fullscreenDigitalUpperTimeLabel;
  self->_fullscreenDigitalUpperTimeLabel = 0;

  -[NTKVictoryLabel removeFromSuperview](self->_fullscreenDigitalLowerTimeLabel, "removeFromSuperview");
  fullscreenDigitalLowerTimeLabel = self->_fullscreenDigitalLowerTimeLabel;
  self->_fullscreenDigitalLowerTimeLabel = 0;

}

- (void)removeCircularViews
{
  NTKVictoryLabel *circularUpperTimeLabel;
  NTKVictoryLabel *circularLowerTimeLabel;
  UIButton *circularLogoButton;

  -[NTKVictoryLabel removeFromSuperview](self->_circularUpperTimeLabel, "removeFromSuperview");
  circularUpperTimeLabel = self->_circularUpperTimeLabel;
  self->_circularUpperTimeLabel = 0;

  -[NTKVictoryLabel removeFromSuperview](self->_circularLowerTimeLabel, "removeFromSuperview");
  circularLowerTimeLabel = self->_circularLowerTimeLabel;
  self->_circularLowerTimeLabel = 0;

  -[UIButton removeFromSuperview](self->_circularLogoButton, "removeFromSuperview");
  circularLogoButton = self->_circularLogoButton;
  self->_circularLogoButton = 0;

}

- (id)fontForCircularDial
{
  void *v3;
  double *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  -[NTKOlympusTimeContentView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_9(v3, &v6);

  if (self->_useSmallFont)
    v4 = (double *)&v8;
  else
    v4 = (double *)&v7 + 1;
  return +[NTKVictoryLabel victoryFontWithSize:style:monospacedNumbers:](NTKVictoryLabel, "victoryFontWithSize:style:monospacedNumbers:", 0, 0, *v4);
}

- (id)monospacedFontForCircularDial
{
  void *v3;
  double *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  -[NTKOlympusTimeContentView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_9(v3, &v6);

  if (self->_useSmallFont)
    v4 = (double *)&v8;
  else
    v4 = (double *)&v7 + 1;
  return +[NTKVictoryLabel victoryFontWithSize:style:monospacedNumbers:](NTKVictoryLabel, "victoryFontWithSize:style:monospacedNumbers:", 0, 1, *v4);
}

- (id)fontForHybridFullscreen
{
  void *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  -[NTKOlympusTimeContentView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_9(v2, &v4);

  return +[NTKVictoryLabel victoryFontWithSize:style:](NTKVictoryLabel, "victoryFontWithSize:style:", 0, *((double *)&v5 + 1));
}

- (id)fontForDigitalFullscreen
{
  void *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  -[NTKOlympusTimeContentView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_9(v2, &v4);

  return +[NTKVictoryLabel victoryFontWithSize:style:](NTKVictoryLabel, "victoryFontWithSize:style:", 0, *(double *)&v5);
}

- (id)victoryFontWithSize:(double)a3
{
  return +[NTKVictoryLabel victoryFontWithSize:style:](NTKVictoryLabel, "victoryFontWithSize:style:", 0, a3);
}

- (id)createTimeLabelWithFont:(id)a3 option:(unint64_t)a4
{
  void *v6;
  NTKVictoryTimeLabel *v7;
  CLKDevice *device;
  void *v9;
  NTKVictoryTimeLabel *v10;
  double v12[30];

  -[NTKOlympusTimeContentView styleWithFont:](self, "styleWithFont:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [NTKVictoryTimeLabel alloc];
  device = self->_device;
  -[NTKOlympusTimeContentView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_9(v9, v12);
  v10 = -[NTKVictoryTimeLabel initWithTimeLabelOptions:forDevice:additionalPaddingInsets:](v7, "initWithTimeLabelOptions:forDevice:additionalPaddingInsets:", a4, device, v12[0]);

  -[NTKDigitalTimeLabel setStyle:](v10, "setStyle:", v6);
  return v10;
}

- (id)styleWithFont:(id)a3
{
  return +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, a3, self->_device, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 0.0, 0.0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKOlympusTimeContentView;
  -[NTKOlympusTimeContentView layoutSubviews](&v8, sel_layoutSubviews);
  -[NTKOlympusTimeContentView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKOlympusTimeContentView bounds](self, "bounds");
  objc_msgSend(v3, "ntk_setBoundsAndPositionFromFrame:");

  -[NTKOlympusTimeContentView fullscreenDigitsContainerView](self, "fullscreenDigitsContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKOlympusTimeContentView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "ntk_setBoundsAndPositionFromFrame:");

  -[NTKOlympusTimeContentView circularDigitsContainerView](self, "circularDigitsContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKOlympusTimeContentView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "ntk_setBoundsAndPositionFromFrame:");

  -[NTKOlympusTimeContentView updateLogosFrame](self, "updateLogosFrame");
  -[NTKOlympusTimeContentView updateTimeLabelsFrame](self, "updateTimeLabelsFrame");
}

- (void)updateLogosFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double dialFraction;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  UIButton *fullscreenLogoButton;
  CGAffineTransform *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  _OWORD v23[15];
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  memset(v23, 0, sizeof(v23));
  -[NTKOlympusTimeContentView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_9(v3, v23);

  -[UIButton bounds](self->_fullscreenLogoButton, "bounds");
  CGRectGetWidth(v24);
  -[UIButton bounds](self->_fullscreenLogoButton, "bounds");
  CGRectGetHeight(v25);
  -[UIButton bounds](self->_fullscreenLogoButton, "bounds");
  CGRectGetWidth(v26);
  -[UIButton bounds](self->_fullscreenLogoButton, "bounds");
  CGRectGetHeight(v27);
  CLKInterpolateBetweenFloatsClipped();
  v5 = v4;
  CLKInterpolateBetweenFloatsClipped();
  -[UIButton setCenter:](self->_fullscreenLogoButton, "setCenter:", v5, v6);
  -[UIButton bounds](self->_circularLogoButton, "bounds");
  CGRectGetWidth(v28);
  -[UIButton bounds](self->_circularLogoButton, "bounds");
  CGRectGetHeight(v29);
  -[NTKOlympusTimeContentView bounds](self, "bounds");
  CGRectGetMidX(v30);
  -[UIButton bounds](self->_circularLogoButton, "bounds");
  CGRectGetHeight(v31);
  CLKInterpolateBetweenFloatsClipped();
  v8 = v7;
  CLKInterpolateBetweenFloatsClipped();
  -[UIButton setCenter:](self->_circularLogoButton, "setCenter:", v8, v9);
  dialFraction = self->_dialFraction;
  if (dialFraction <= 0.0 || dialFraction >= 1.0)
  {
    fullscreenLogoButton = self->_fullscreenLogoButton;
    v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v18 = *MEMORY[0x1E0C9BAA8];
    v19 = v17;
    v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v16 = (CGAffineTransform *)&v18;
  }
  else
  {
    CLKCompressFraction();
    -[UIButton center](self->_fullscreenLogoButton, "center");
    -[UIButton center](self->_circularLogoButton, "center");
    CLKInterpolateBetweenFloatsClipped();
    v12 = v11;
    -[UIButton center](self->_fullscreenLogoButton, "center");
    -[UIButton center](self->_circularLogoButton, "center");
    CLKInterpolateBetweenFloatsClipped();
    -[UIButton setCenter:](self->_fullscreenLogoButton, "setCenter:", v12, v13);
    -[UIButton bounds](self->_circularLogoButton, "bounds");
    -[UIButton bounds](self->_fullscreenLogoButton, "bounds");
    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v22, v14, v14);
    fullscreenLogoButton = self->_fullscreenLogoButton;
    v21 = v22;
    v16 = &v21;
  }
  -[UIButton setTransform:](fullscreenLogoButton, "setTransform:", v16, v18, v19, v20, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
}

- (void)updateTimeLabelsFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat MaxY;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double olympusDigitalLabelsPositionFraction;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  NTKVictoryTimeLabel *fullscreenHybridUpperTimeLabel;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  NTKVictoryLabel *fullscreenHybridLowerTimeLabel;
  double digitalStyleFraction;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  NTKVictoryLabel *fullscreenDigitalUpperTimeLabel;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  NTKVictoryLabel *fullscreenDigitalLowerTimeLabel;
  double v85;
  CGAffineTransform v86;
  CGAffineTransform v87;
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  _OWORD v94[7];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  memset(v94, 0, sizeof(v94));
  -[NTKOlympusTimeContentView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_9(v3, v94);

  if (self->_useSmallFont)
  {
    v4 = *((double *)&v100 + 1);
    v5 = *(double *)&v101;
    -[NTKVictoryLabel bounds](self->_circularUpperTimeLabel, "bounds");
    v6 = v5 + CGRectGetHeight(v103) * -0.5;
    -[NTKVictoryLabel _baselineOffsetFromBottom](self->_circularUpperTimeLabel, "_baselineOffsetFromBottom");
    v8 = v6 + v7;
  }
  else
  {
    -[UIView bounds](self->_circularDigitsContainerView, "bounds");
    Width = CGRectGetWidth(v104);
    -[NTKVictoryLabel bounds](self->_circularUpperTimeLabel, "bounds");
    v4 = Width - v10 * 0.5 - *(double *)&v99;
    -[NTKVictoryLabel bounds](self->_circularUpperTimeLabel, "bounds");
    v8 = *((double *)&v98 + 1) + v11 * 0.5;
  }
  -[NTKVictoryLabel setCenter:](self->_circularUpperTimeLabel, "setCenter:", v4, v8);
  if (self->_useSmallFont)
  {
    v12 = *((double *)&v101 + 1);
    v13 = *(double *)&v102;
    -[NTKVictoryLabel bounds](self->_circularLowerTimeLabel, "bounds");
    v14 = v13 + CGRectGetHeight(v105) * -0.5;
    -[NTKVictoryLabel _baselineOffsetFromBottom](self->_circularLowerTimeLabel, "_baselineOffsetFromBottom");
    v16 = v14 + v15;
  }
  else
  {
    -[NTKVictoryLabel bounds](self->_circularLowerTimeLabel, "bounds");
    v12 = *(double *)&v100 + v17 * 0.5;
    -[NTKVictoryLabel bounds](self->_circularLowerTimeLabel, "bounds");
    v16 = *((double *)&v99 + 1) + v18 * 0.5;
  }
  -[NTKVictoryLabel setCenter:](self->_circularLowerTimeLabel, "setCenter:", v12, v16);
  -[NTKVictoryTimeLabel bounds](self->_fullscreenHybridUpperTimeLabel, "bounds");
  v20 = v19;
  v22 = v21;
  -[NTKOlympusTimeContentView bounds](self, "bounds");
  v23 = CGRectGetWidth(v106);
  v24 = *(double *)&v96;
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_fullscreenHybridUpperTimeLabel, "ntk_setBoundsAndPositionFromFrame:", v23 - v20 - *(double *)&v96, *((double *)&v95 + 1), v20, v22);
  -[NTKVictoryLabel bounds](self->_fullscreenDigitalUpperTimeLabel, "bounds");
  v26 = v25;
  v28 = v27;
  -[NTKOlympusTimeContentView bounds](self, "bounds");
  v29 = CGRectGetWidth(v107);
  v30 = *((double *)&v97 + 1);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_fullscreenDigitalUpperTimeLabel, "ntk_setBoundsAndPositionFromFrame:", v29 - v26 - *((double *)&v97 + 1), *(double *)&v97, v26, v28);
  -[NTKVictoryLabel bounds](self->_fullscreenHybridLowerTimeLabel, "bounds");
  v32 = v31;
  v34 = v33;
  -[NTKOlympusTimeContentView bounds](self, "bounds");
  v35 = CGRectGetWidth(v108) - v32 - v24;
  -[NTKVictoryTimeLabel frame](self->_fullscreenHybridUpperTimeLabel, "frame");
  MaxY = CGRectGetMaxY(v109);
  v37 = *((double *)&v96 + 1);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_fullscreenHybridLowerTimeLabel, "ntk_setBoundsAndPositionFromFrame:", v35, MaxY + *((double *)&v96 + 1), v32, v34);
  -[NTKVictoryLabel bounds](self->_fullscreenDigitalLowerTimeLabel, "bounds");
  v39 = v38;
  v41 = v40;
  -[NTKOlympusTimeContentView bounds](self, "bounds");
  v42 = CGRectGetWidth(v110) - v39 - v30;
  -[NTKVictoryLabel frame](self->_fullscreenDigitalUpperTimeLabel, "frame");
  v43 = CGRectGetMaxY(v111);
  v44 = *(double *)&v98;
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_fullscreenDigitalLowerTimeLabel, "ntk_setBoundsAndPositionFromFrame:", v42, v43 + *(double *)&v98, v39, v41);
  -[NTKVictoryTimeLabel center](self->_fullscreenHybridUpperTimeLabel, "center");
  -[NTKVictoryLabel center](self->_fullscreenDigitalUpperTimeLabel, "center");
  olympusDigitalLabelsPositionFraction = self->_olympusDigitalLabelsPositionFraction;
  if (olympusDigitalLabelsPositionFraction > 0.0 && olympusDigitalLabelsPositionFraction < 1.0)
  {
    CLKInterpolateBetweenFloatsClipped();
    v85 = v44;
    v47 = v46;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryTimeLabel setCenter:](self->_fullscreenHybridUpperTimeLabel, "setCenter:", v47, v48);
    CLKInterpolateBetweenFloatsClipped();
    v50 = v49;
    CGAffineTransformMakeScale(&v93, v49, v49);
    fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
    v92 = v93;
    -[NTKVictoryTimeLabel setTransform:](fullscreenHybridUpperTimeLabel, "setTransform:", &v92);
    -[NTKVictoryTimeLabel center](self->_fullscreenHybridUpperTimeLabel, "center");
    v53 = v52;
    -[NTKVictoryTimeLabel frame](self->_fullscreenHybridUpperTimeLabel, "frame");
    v55 = v53 + v54 * 0.5;
    -[NTKVictoryLabel frame](self->_fullscreenHybridLowerTimeLabel, "frame");
    v57 = v55 - v56 * 0.5;
    -[NTKVictoryTimeLabel center](self->_fullscreenHybridUpperTimeLabel, "center");
    v59 = v58;
    -[NTKVictoryTimeLabel frame](self->_fullscreenHybridUpperTimeLabel, "frame");
    v61 = v37 + v59 + v60 * 0.5;
    -[NTKVictoryLabel frame](self->_fullscreenHybridLowerTimeLabel, "frame");
    -[NTKVictoryLabel setCenter:](self->_fullscreenHybridLowerTimeLabel, "setCenter:", v57, v61 + v62 * 0.5);
    v63 = v50;
    v64 = v50;
    v44 = v85;
    CGAffineTransformMakeScale(&v91, v63, v64);
    fullscreenHybridLowerTimeLabel = self->_fullscreenHybridLowerTimeLabel;
    v90 = v91;
    -[NTKVictoryLabel setTransform:](fullscreenHybridLowerTimeLabel, "setTransform:", &v90);
  }
  digitalStyleFraction = self->_digitalStyleFraction;
  if (digitalStyleFraction > 0.0 && digitalStyleFraction < 1.0)
  {
    CLKInterpolateBetweenFloatsClipped();
    v68 = v67;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLabel setCenter:](self->_fullscreenDigitalUpperTimeLabel, "setCenter:", v68, v69);
    CLKInterpolateBetweenFloatsClipped();
    v71 = v70;
    CGAffineTransformMakeScale(&v89, v70, v70);
    fullscreenDigitalUpperTimeLabel = self->_fullscreenDigitalUpperTimeLabel;
    v88 = v89;
    -[NTKVictoryLabel setTransform:](fullscreenDigitalUpperTimeLabel, "setTransform:", &v88);
    -[NTKVictoryLabel center](self->_fullscreenDigitalUpperTimeLabel, "center");
    v74 = v73;
    -[NTKVictoryLabel frame](self->_fullscreenDigitalUpperTimeLabel, "frame");
    v76 = v74 + v75 * 0.5;
    -[NTKVictoryLabel frame](self->_fullscreenDigitalLowerTimeLabel, "frame");
    v78 = v76 - v77 * 0.5;
    -[NTKVictoryLabel center](self->_fullscreenDigitalUpperTimeLabel, "center");
    v80 = v79;
    -[NTKVictoryLabel frame](self->_fullscreenDigitalUpperTimeLabel, "frame");
    v82 = v44 + v80 + v81 * 0.5;
    -[NTKVictoryLabel frame](self->_fullscreenDigitalLowerTimeLabel, "frame");
    -[NTKVictoryLabel setCenter:](self->_fullscreenDigitalLowerTimeLabel, "setCenter:", v78, v82 + v83 * 0.5);
    CGAffineTransformMakeScale(&v87, v71, v71);
    fullscreenDigitalLowerTimeLabel = self->_fullscreenDigitalLowerTimeLabel;
    v86 = v87;
    -[NTKVictoryLabel setTransform:](fullscreenDigitalLowerTimeLabel, "setTransform:", &v86);
  }
}

- (void)setInvertedColors:(BOOL)a3
{
  if (self->_invertedColors != a3)
  {
    self->_invertedColors = a3;
    -[NTKOlympusTimeContentView updateColors](self, "updateColors");
  }
}

- (void)setDial:(unint64_t)a3
{
  double v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[3];
  _OWORD v11[2];
  __int128 v12;

  self->_dial = a3;
  v4 = 0.0;
  if (!a3)
    v4 = 1.0;
  self->_dialFraction = v4;
  -[NTKOlympusTimeContentView setViewsVisibilityForDial:style:](self, "setViewsVisibilityForDial:style:", self->_dial, self->_style);
  -[NTKOlympusTimeContentView fullscreenDigitsContainerView](self, "fullscreenDigitsContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v11[0] = *MEMORY[0x1E0C9BAA8];
  v8 = v11[0];
  v11[1] = v9;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v7 = v12;
  objc_msgSend(v5, "setTransform:", v11);

  -[NTKOlympusTimeContentView circularDigitsContainerView](self, "circularDigitsContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  v10[1] = v9;
  v10[2] = v7;
  objc_msgSend(v6, "setTransform:", v10);

  -[NTKOlympusTimeContentView updateLogosFrame](self, "updateLogosFrame");
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  -[NTKOlympusTimeContentView updateStylesFraction:fromStyle:toStyle:](self, "updateStylesFraction:fromStyle:toStyle:", a3, a3, 1.0);
  -[NTKOlympusTimeContentView setViewsVisibilityForDial:style:](self, "setViewsVisibilityForDial:style:", self->_dial, self->_style);
  -[NTKOlympusTimeContentView updateLogosFrame](self, "updateLogosFrame");
  -[NTKOlympusTimeContentView updateTimeLabelsFrame](self, "updateTimeLabelsFrame");
}

- (void)setColorPalette:(id)a3
{
  NTKOlympusColorPalette **p_colorPalette;
  id v6;

  p_colorPalette = &self->_colorPalette;
  objc_storeStrong((id *)&self->_colorPalette, a3);
  v6 = a3;
  objc_storeStrong((id *)&self->_palette, *p_colorPalette);

  -[NTKOlympusTimeContentView updateColors](self, "updateColors");
}

- (UIImage)circularLogoImage
{
  UIImage *circularLogoImage;

  circularLogoImage = self->_circularLogoImage;
  if (circularLogoImage)
    return circularLogoImage;
  NTKImageNamed(CFSTR("VictoryNTK-circular-logo"));
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)logoImageSizeForCircularDial
{
  CGSize *p_logoImageSizeForCircularDial;
  double width;
  double height;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGSize result;

  p_logoImageSizeForCircularDial = &self->_logoImageSizeForCircularDial;
  width = self->_logoImageSizeForCircularDial.width;
  height = self->_logoImageSizeForCircularDial.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[NTKOlympusTimeContentView circularLogoImage](self, "circularLogoImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    p_logoImageSizeForCircularDial->width = v7;
    p_logoImageSizeForCircularDial->height = v8;

    width = p_logoImageSizeForCircularDial->width;
    height = p_logoImageSizeForCircularDial->height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)updateColors
{
  UIColor *v3;
  UIColor *v4;
  UIColor *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  UIColor *currentForegroundColor;
  UIColor *v10;
  UIColor *currentBackgroundColor;
  UIColor *v12;
  UIColor *currentLogoColor;
  UIColor *v14;
  NTKOlympusColorPalette *v15;

  v15 = self->_palette;
  -[NTKOlympusColorPalette primaryTextColor](v15, "primaryTextColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  -[NTKOlympusColorPalette primaryBackgroundColor](v15, "primaryBackgroundColor");
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  -[NTKOlympusColorPalette primaryLogoColor](v15, "primaryLogoColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  if (self->_invertedColors)
  {
    -[NTKOlympusColorPalette secondaryTextColor](v15, "secondaryTextColor");
    v6 = objc_claimAutoreleasedReturnValue();

    -[NTKOlympusColorPalette secondaryBackgroundColor](v15, "secondaryBackgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NTKOlympusColorPalette secondaryLogoColor](v15, "secondaryLogoColor");
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (UIColor *)v6;
    v4 = (UIColor *)v7;
    v5 = (UIColor *)v8;
  }
  currentForegroundColor = self->_currentForegroundColor;
  self->_currentForegroundColor = v3;
  v10 = v3;

  currentBackgroundColor = self->_currentBackgroundColor;
  self->_currentBackgroundColor = v4;
  v12 = v4;

  currentLogoColor = self->_currentLogoColor;
  self->_currentLogoColor = v5;
  v14 = v5;

  -[NTKOlympusTimeContentView setBackgroundColor:](self, "setBackgroundColor:", v12);
  -[CLKUIColoringLabel setColor:](self->_circularUpperTimeLabel, "setColor:", v10);
  -[CLKUIColoringLabel setColor:](self->_circularLowerTimeLabel, "setColor:", v10);
  -[UIButton setTintColor:](self->_circularLogoButton, "setTintColor:", v14);
  -[UIButton setTintColor:](self->_fullscreenLogoButton, "setTintColor:", v14);
  -[NTKDigitalTimeLabel setColor:](self->_fullscreenHybridUpperTimeLabel, "setColor:", v10);
  -[NTKVictoryLabel setFillColor:](self->_fullscreenHybridLowerTimeLabel, "setFillColor:", v10);
  -[CLKUIColoringLabel setColor:](self->_fullscreenDigitalUpperTimeLabel, "setColor:", v10);
  -[CLKUIColoringLabel setColor:](self->_fullscreenDigitalLowerTimeLabel, "setColor:", v10);

}

- (void)applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  if (a4 == a5)
  {
    -[NTKOlympusTimeContentView setDial:](self, "setDial:", a3);
  }
  else
  {
    if (a5 == 1 && a4 == 0)
      v7 = 1.0 - a3;
    else
      v7 = a3;
    self->_dialFraction = v7;
    -[NTKOlympusTimeContentView setViewsVisibleForDialTransition](self, "setViewsVisibleForDialTransition");
    CLKCompressFraction();
    v9 = v8;
    CLKCompressFraction();
    v11 = v10;
    -[NTKVictoryLabel setAlpha:](self->_circularUpperTimeLabel, "setAlpha:");
    -[NTKVictoryLabel setAlpha:](self->_circularLowerTimeLabel, "setAlpha:", v11);
    -[NTKVictoryTimeLabel setAlpha:](self->_fullscreenHybridUpperTimeLabel, "setAlpha:", 1.0 - v9);
    -[NTKVictoryLabel setAlpha:](self->_fullscreenHybridLowerTimeLabel, "setAlpha:", 1.0 - v9);
    -[NTKVictoryLabel setAlpha:](self->_fullscreenDigitalUpperTimeLabel, "setAlpha:", 1.0 - v9);
    -[NTKVictoryLabel setAlpha:](self->_fullscreenDigitalLowerTimeLabel, "setAlpha:", 1.0 - v9);
    CLKInterpolateBetweenFloatsClipped();
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, v12, v12);
    v22 = v23;
    -[NTKOlympusTimeContentView fullscreenDigitsContainerView](self, "fullscreenDigitsContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22;
    objc_msgSend(v13, "setTransform:", &v21);

    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v20, v14, v14);
    v23 = v20;
    v19 = v20;
    -[NTKOlympusTimeContentView circularDigitsContainerView](self, "circularDigitsContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;
    objc_msgSend(v15, "setTransform:", &v18);

    if (v7 >= 1.0)
      v16 = 0.0;
    else
      v16 = 1.0;
    if (v7 >= 1.0)
      v17 = 1.0;
    else
      v17 = 0.0;
    -[UIButton setAlpha:](self->_fullscreenLogoButton, "setAlpha:", v16);
    -[UIButton setAlpha:](self->_circularLogoButton, "setAlpha:", v17);
    -[NTKOlympusTimeContentView updateLogosFrame](self, "updateLogosFrame");
  }
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  double digitalStyleFraction;
  double olympusDigitalStyleFraction;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  if (a4 == a5)
  {
    -[NTKOlympusTimeContentView setStyle:](self, "setStyle:", a4, a3);
  }
  else
  {
    -[NTKOlympusTimeContentView setViewsVisibleForStyleTransition](self, "setViewsVisibleForStyleTransition");
    -[NTKOlympusTimeContentView updateStylesFraction:fromStyle:toStyle:](self, "updateStylesFraction:fromStyle:toStyle:", a4, a5, a3);
    -[NTKOlympusTimeContentView updateTimeLabelsFrame](self, "updateTimeLabelsFrame");
    -[NTKOlympusTimeContentView updateLogosFrame](self, "updateLogosFrame");
    -[NTKVictoryTimeLabel setAlpha:](self->_fullscreenHybridUpperTimeLabel, "setAlpha:", self->_olympusDigitalStyleFraction);
    -[NTKVictoryLabel setAlpha:](self->_fullscreenHybridLowerTimeLabel, "setAlpha:", self->_olympusDigitalStyleFraction);
    -[NTKVictoryLabel setAlpha:](self->_fullscreenDigitalUpperTimeLabel, "setAlpha:", self->_digitalStyleFraction);
    -[NTKVictoryLabel setAlpha:](self->_fullscreenDigitalLowerTimeLabel, "setAlpha:", self->_digitalStyleFraction);
    digitalStyleFraction = self->_digitalStyleFraction;
    if (digitalStyleFraction < self->_olympusDigitalStyleFraction)
      digitalStyleFraction = self->_olympusDigitalStyleFraction;
    -[NTKVictoryLabel setAlpha:](self->_circularUpperTimeLabel, "setAlpha:", digitalStyleFraction);
    olympusDigitalStyleFraction = self->_digitalStyleFraction;
    if (olympusDigitalStyleFraction < self->_olympusDigitalStyleFraction)
      olympusDigitalStyleFraction = self->_olympusDigitalStyleFraction;
    -[NTKVictoryLabel setAlpha:](self->_circularLowerTimeLabel, "setAlpha:", olympusDigitalStyleFraction);
    -[UIButton setAlpha:](self->_fullscreenLogoButton, "setAlpha:", 1.0 - self->_analogStyleFraction);
    -[UIButton alpha](self->_fullscreenLogoButton, "alpha");
    -[UIButton setAlpha:](self->_circularLogoButton, "setAlpha:");
    if ((a4 == 1 || a5 == 1) && (a4 == 2 || a5 == 2) && self->_olympusDigitalLabelsPositionFraction == 1.0)
    {
      CLKCompressFraction();
      CLKInterpolateBetweenFloatsClipped();
      memset(&v20, 0, sizeof(v20));
      CGAffineTransformMakeScale(&v20, v11, v11);
      v19 = v20;
      -[NTKOlympusTimeContentView fullscreenDigitsContainerView](self, "fullscreenDigitsContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v19;
      objc_msgSend(v12, "setTransform:", &v18);

      v17 = v20;
      -[NTKOlympusTimeContentView circularDigitsContainerView](self, "circularDigitsContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v17;
      objc_msgSend(v13, "setTransform:", &v16);

      CLKInterpolateBetweenFloatsClipped();
      v15 = v14;
      -[NTKVictoryTimeLabel setAlpha:](self->_fullscreenHybridUpperTimeLabel, "setAlpha:");
      -[NTKVictoryLabel setAlpha:](self->_fullscreenHybridLowerTimeLabel, "setAlpha:", v15);
      -[NTKVictoryLabel setAlpha:](self->_circularUpperTimeLabel, "setAlpha:", v15);
      -[NTKVictoryLabel setAlpha:](self->_circularLowerTimeLabel, "setAlpha:", v15);
    }
  }
}

- (void)updateStylesFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;

  self->_digitalStyleFraction = 0.0;
  self->_olympusDigitalStyleFraction = 0.0;
  self->_olympusAnalogStyleFraction = 0.0;
  self->_analogStyleFraction = 0.0;
  self->_olympusDigitalLabelsPositionFraction = 0.0;
  if (!a4 || !a5)
  {
    v5 = 1.0 - a3;
    if (!a5)
      v5 = a3;
    self->_digitalStyleFraction = v5;
  }
  if (a4 == 1 || a5 == 1)
  {
    v6 = 1.0 - a3;
    if (a5 == 1)
      v6 = a3;
    self->_olympusDigitalStyleFraction = v6;
    self->_olympusDigitalLabelsPositionFraction = v6;
  }
  if (a4 != 2)
  {
    v7 = 0.0;
    if (a5 != 2)
      goto LABEL_17;
  }
  v7 = 1.0;
  v8 = 1.0 - a3;
  if (a5 == 2)
    v8 = a3;
  self->_olympusAnalogStyleFraction = v8;
  self->_analogStyleSwooshPositionFraction = v8;
  self->_olympusDigitalLabelsPositionFraction = 1.0;
  if (a4 == 3 || a5 == 3)
LABEL_17:
    self->_analogStyleSwooshPositionFraction = v7;
  if (a4 == 3 || a5 == 3)
  {
    if (a5 != 3)
      a3 = 1.0 - a3;
    self->_analogStyleFraction = a3;
  }
}

- (void)setViewsVisibilityForDial:(unint64_t)a3 style:(unint64_t)a4
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  NTKVictoryTimeLabel *fullscreenHybridUpperTimeLabel;
  _BOOL8 v10;
  uint64_t v11;

  v6 = a3 == 0;
  v7 = a4 != 1 || a3 == 0;
  v8 = a3 != 0;
  fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
  if (a3)
    v10 = 1;
  else
    v10 = a4 > 1;
  -[CLKUITimeLabel setHidden:](fullscreenHybridUpperTimeLabel, "setHidden:", v7);
  -[NTKVictoryLabel setHidden:](self->_fullscreenHybridLowerTimeLabel, "setHidden:", v7);
  -[NTKOlympusTimeContentView ensureVisibleIfNeeded:](self, "ensureVisibleIfNeeded:", self->_fullscreenHybridUpperTimeLabel);
  -[NTKOlympusTimeContentView ensureVisibleIfNeeded:](self, "ensureVisibleIfNeeded:", self->_fullscreenHybridLowerTimeLabel);
  if (a4)
    v11 = 1;
  else
    v11 = v6;
  -[NTKVictoryLabel setHidden:](self->_fullscreenDigitalUpperTimeLabel, "setHidden:", v11);
  -[NTKVictoryLabel setHidden:](self->_fullscreenDigitalLowerTimeLabel, "setHidden:", v11);
  -[NTKOlympusTimeContentView ensureVisibleIfNeeded:](self, "ensureVisibleIfNeeded:", self->_fullscreenDigitalUpperTimeLabel);
  -[NTKOlympusTimeContentView ensureVisibleIfNeeded:](self, "ensureVisibleIfNeeded:", self->_fullscreenDigitalLowerTimeLabel);
  -[NTKVictoryLabel setHidden:](self->_circularUpperTimeLabel, "setHidden:", v10);
  -[NTKVictoryLabel setHidden:](self->_circularLowerTimeLabel, "setHidden:", v10);
  -[NTKOlympusTimeContentView ensureVisibleIfNeeded:](self, "ensureVisibleIfNeeded:", self->_circularUpperTimeLabel);
  -[NTKOlympusTimeContentView ensureVisibleIfNeeded:](self, "ensureVisibleIfNeeded:", self->_circularLowerTimeLabel);
  -[UIButton setHidden:](self->_fullscreenLogoButton, "setHidden:", v6);
  -[UIButton setHidden:](self->_circularLogoButton, "setHidden:", v8);
  -[NTKOlympusTimeContentView ensureVisibleIfNeeded:](self, "ensureVisibleIfNeeded:", self->_fullscreenLogoButton);
  -[NTKOlympusTimeContentView ensureVisibleIfNeeded:](self, "ensureVisibleIfNeeded:", self->_circularLogoButton);
}

- (void)setViewsVisibleForDialTransition
{
  unint64_t style;
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v6;

  style = self->_style;
  v4 = style != 0;
  v5 = style != 1;
  v6 = style > 1;
  -[CLKUITimeLabel setHidden:](self->_fullscreenHybridUpperTimeLabel, "setHidden:", v5);
  -[NTKVictoryLabel setHidden:](self->_fullscreenHybridLowerTimeLabel, "setHidden:", v5);
  -[NTKVictoryLabel setHidden:](self->_fullscreenDigitalUpperTimeLabel, "setHidden:", v4);
  -[NTKVictoryLabel setHidden:](self->_fullscreenDigitalLowerTimeLabel, "setHidden:", v4);
  -[NTKVictoryLabel setHidden:](self->_circularUpperTimeLabel, "setHidden:", v6);
  -[NTKVictoryLabel setHidden:](self->_circularLowerTimeLabel, "setHidden:", v6);
  -[UIButton setHidden:](self->_fullscreenLogoButton, "setHidden:", 0);
  -[UIButton setHidden:](self->_circularLogoButton, "setHidden:", 0);
}

- (void)setViewsVisibleForStyleTransition
{
  unint64_t dial;
  _BOOL8 v4;
  _BOOL8 v5;

  dial = self->_dial;
  v4 = dial != 0;
  v5 = dial == 0;
  -[CLKUITimeLabel setHidden:](self->_fullscreenHybridUpperTimeLabel, "setHidden:", v5);
  -[NTKVictoryLabel setHidden:](self->_fullscreenHybridLowerTimeLabel, "setHidden:", v5);
  -[NTKVictoryLabel setHidden:](self->_fullscreenDigitalUpperTimeLabel, "setHidden:", v5);
  -[NTKVictoryLabel setHidden:](self->_fullscreenDigitalLowerTimeLabel, "setHidden:", v5);
  -[NTKVictoryLabel setHidden:](self->_circularUpperTimeLabel, "setHidden:", v4);
  -[NTKVictoryLabel setHidden:](self->_circularLowerTimeLabel, "setHidden:", v4);
  -[UIButton setHidden:](self->_circularLogoButton, "setHidden:", v4);
  -[UIButton setHidden:](self->_fullscreenLogoButton, "setHidden:", v5);
  -[NTKOlympusTimeContentView ensureVisibleIfNeeded:](self, "ensureVisibleIfNeeded:", self->_fullscreenDigitalUpperTimeLabel);
}

- (void)ensureVisibleIfNeeded:(id)a3
{
  int v3;
  double v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "isHidden");
  v4 = 1.0;
  if (v3)
    v4 = 0.0;
  objc_msgSend(v5, "setAlpha:", v4);

}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v6 = a6;
  v23 = a4;
  v10 = a5;
  if (objc_msgSend(v23, "isEqual:", v10))
  {
    -[NTKOlympusTimeContentView setPalette:](self, "setPalette:", v10);
  }
  else
  {
    objc_msgSend(v23, "primaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "primaryBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryLogoColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "primaryLogoColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_invertedColors)
    {
      objc_msgSend(v23, "secondaryTextColor");
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "secondaryTextColor");
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "secondaryBackgroundColor");
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "secondaryBackgroundColor");
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "secondaryLogoColor");
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "secondaryLogoColor");
      v18 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v21;
      v11 = (void *)v22;
      v14 = (void *)v19;
      v13 = (void *)v20;
      v15 = (void *)v18;
      v16 = (void *)v17;
    }
    -[NTKOlympusTimeContentView _applyTransitionFraction:fromColor:toColor:fromBackgroundColor:toBackgroundColor:fromLogoColor:toLogoColor:](self, "_applyTransitionFraction:fromColor:toColor:fromBackgroundColor:toBackgroundColor:fromLogoColor:toLogoColor:", v11, v12, v13, v14, v16, v15, a3);
    if (v6)
      -[NTKOlympusTimeContentView _applyAnimationPopTransitionWithFraction:](self, "_applyAnimationPopTransitionWithFraction:", a3);

  }
}

- (void)setLabelOutlineAlpha:(double)a3
{
  -[NTKVictoryLabel setOutlineAlpha:](self->_fullscreenHybridLowerTimeLabel, "setOutlineAlpha:");
  -[NTKVictoryTimeLabel setOutlineAlpha:](self->_fullscreenHybridUpperTimeLabel, "setOutlineAlpha:", a3);
  -[NTKVictoryLabel setOutlineAlpha:](self->_fullscreenDigitalUpperTimeLabel, "setOutlineAlpha:", a3);
  -[NTKVictoryLabel setOutlineAlpha:](self->_fullscreenDigitalLowerTimeLabel, "setOutlineAlpha:", a3);
  -[NTKVictoryLabel setOutlineAlpha:](self->_circularUpperTimeLabel, "setOutlineAlpha:", a3);
  -[NTKVictoryLabel setOutlineAlpha:](self->_circularLowerTimeLabel, "setOutlineAlpha:", a3);
}

- (void)setLabelOutlineColor:(id)a3
{
  NTKVictoryLabel *fullscreenHybridLowerTimeLabel;
  id v5;

  fullscreenHybridLowerTimeLabel = self->_fullscreenHybridLowerTimeLabel;
  v5 = a3;
  -[NTKVictoryLabel setOutlineColor:](fullscreenHybridLowerTimeLabel, "setOutlineColor:", v5);
  -[NTKVictoryTimeLabel setOutlineColor:](self->_fullscreenHybridUpperTimeLabel, "setOutlineColor:", v5);
  -[NTKVictoryLabel setOutlineColor:](self->_fullscreenDigitalUpperTimeLabel, "setOutlineColor:", v5);
  -[NTKVictoryLabel setOutlineColor:](self->_fullscreenDigitalLowerTimeLabel, "setOutlineColor:", v5);
  -[NTKVictoryLabel setOutlineColor:](self->_circularUpperTimeLabel, "setOutlineColor:", v5);
  -[NTKVictoryLabel setOutlineColor:](self->_circularLowerTimeLabel, "setOutlineColor:", v5);

}

- (void)_applyAnimationPopTransitionWithFraction:(double)a3
{
  CGFloat v4;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  objc_msgSend((id)objc_opt_class(), "scaleForViewDuringColorChangeTransitionWithFraction:", a3);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, v4, v4);
  v12 = v13;
  -[NTKVictoryLabel setTransform:](self->_circularUpperTimeLabel, "setTransform:", &v12);
  v11 = v13;
  -[NTKVictoryLabel setTransform:](self->_circularLowerTimeLabel, "setTransform:", &v11);
  v10 = v13;
  -[UIButton setTransform:](self->_fullscreenLogoButton, "setTransform:", &v10);
  v9 = v13;
  -[UIButton setTransform:](self->_circularLogoButton, "setTransform:", &v9);
  v8 = v13;
  -[NTKVictoryTimeLabel setTransform:](self->_fullscreenHybridUpperTimeLabel, "setTransform:", &v8);
  v7 = v13;
  -[NTKVictoryLabel setTransform:](self->_fullscreenHybridLowerTimeLabel, "setTransform:", &v7);
  v6 = v13;
  -[NTKVictoryLabel setTransform:](self->_fullscreenDigitalUpperTimeLabel, "setTransform:", &v6);
  v5 = v13;
  -[NTKVictoryLabel setTransform:](self->_fullscreenDigitalLowerTimeLabel, "setTransform:", &v5);
}

- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5 fromBackgroundColor:(id)a6 toBackgroundColor:(id)a7 fromLogoColor:(id)a8 toLogoColor:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void (**v21)(float);
  void *v22;
  _QWORD aBlock[5];

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  -[NTKOlympusTimeContentView _applyTransitionFraction:fromTextColor:toTextColor:](self, "_applyTransitionFraction:fromTextColor:toTextColor:", a4, a5, a3);
  NTKInterpolateBetweenColors(v17, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setTintColor:](self->_circularLogoButton, "setTintColor:", v20);
  -[UIButton setTintColor:](self->_fullscreenLogoButton, "setTintColor:", v20);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__NTKOlympusTimeContentView__applyTransitionFraction_fromColor_toColor_fromBackgroundColor_toBackgroundColor_fromLogoColor_toLogoColor___block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_f12__0f8l;
  *(double *)&aBlock[4] = a3;
  v21 = (void (**)(float))_Block_copy(aBlock);
  v21[2](0.0);
  NTKInterpolateBetweenColors(v19, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKOlympusTimeContentView setBackgroundColor:](self, "setBackgroundColor:", v22);
}

float __136__NTKOlympusTimeContentView__applyTransitionFraction_fromColor_toColor_fromBackgroundColor_toBackgroundColor_fromLogoColor_toLogoColor___block_invoke(uint64_t a1, float a2)
{
  double v2;

  v2 = (*(double *)(a1 + 32) - (float)((float)(a2 + 0.4) + -0.1)) / 0.200000003;
  if (v2 > 1.0)
    v2 = 1.0;
  return fmax(v2, 0.0);
}

- (void)_applyTransitionFraction:(double)a3 fromTextColor:(id)a4 toTextColor:(id)a5
{
  id v6;

  NTKInterpolateBetweenColors(a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setColor:](self->_fullscreenHybridUpperTimeLabel, "setColor:", v6);
  -[NTKVictoryLabel setFillColor:](self->_fullscreenHybridLowerTimeLabel, "setFillColor:", v6);
  -[CLKUIColoringLabel setColor:](self->_fullscreenDigitalUpperTimeLabel, "setColor:", v6);
  -[CLKUIColoringLabel setColor:](self->_fullscreenDigitalLowerTimeLabel, "setColor:", v6);
  -[CLKUIColoringLabel setColor:](self->_circularUpperTimeLabel, "setColor:", v6);
  -[CLKUIColoringLabel setColor:](self->_circularLowerTimeLabel, "setColor:", v6);

}

+ (double)scaleForViewDuringColorChangeTransitionWithFraction:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  float v7;
  double v8;

  NTKVictoryTransitionTimingFunction();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  *(float *)&v6 = a3;
  *(float *)&v6 = fabsf((float)(*(float *)&v6 + -0.4) / 0.4);
  if (*(float *)&v6 > 1.0)
    *(float *)&v6 = 1.0;
  objc_msgSend(v4, "_solveForInput:", v6);
  v8 = v7 * 0.075 + 0.925;

  return v8;
}

- (void)setLogoButtonHighlighted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIButton setHighlighted:](self->_fullscreenLogoButton, "setHighlighted:");
  -[UIButton setHighlighted:](self->_circularLogoButton, "setHighlighted:", v3);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  -[CLKTimeFormatter setOverrideDate:](self->_timeFormatter, "setOverrideDate:", a3, a4);
}

- (void)setTimeOffset:(double)a3
{
  -[CLKTimeFormatter setTimeOffset:](self->_timeFormatter, "setTimeOffset:", a3);
}

- (void)handleLogoButtonHighlighted:(id)a3
{
  id v4;

  -[NTKOlympusTimeContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "olympusContentViewDidHandleLogoHighlighted:", self);

}

- (void)handleLogoButtonResetHighlight:(id)a3
{
  id v4;

  -[NTKOlympusTimeContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "olympusContentViewDidHandleLogoResetHighlight:", self);

}

- (void)handleLogoButtonTouchUpInside:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "convertRect:toView:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[NTKOlympusTimeContentView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "olympusContentView:didHandleLogoTouchUpInsideFromRect:", self, v6, v8, v10, v12);

  -[NTKOlympusTimeContentView delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "olympusContentViewDidHandleLogoResetHighlight:", self);

}

- (BOOL)containsSubview:(id)a3
{
  id v4;
  NTKOlympusTimeContentView *v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v4, "superview");
  v5 = (NTKOlympusTimeContentView *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self;

  v16 = v6;
  if (*((_BYTE *)v14 + 24))
  {
    v7 = 1;
  }
  else
  {
    -[NTKOlympusTimeContentView subviews](self, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__NTKOlympusTimeContentView_containsSubview___block_invoke;
    v10[3] = &unk_1E6BD08C0;
    v12 = &v13;
    v11 = v4;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

    v7 = *((_BYTE *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

uint64_t __45__NTKOlympusTimeContentView_containsSubview___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(result + 32) == a2;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  const CGPath *v10;
  BOOL v11;
  BOOL v12;
  objc_super v14;
  CGPoint v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[NTKOlympusTimeContentView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const CGPath *)objc_msgSend(v9, "path");

  if (v10)
  {
    v15.x = x;
    v15.y = y;
    v11 = CGPathContainsPoint(v10, 0, v15, 0);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NTKOlympusTimeContentView;
    v11 = -[NTKOlympusTimeContentView pointInside:withEvent:](&v14, sel_pointInside_withEvent_, v7, x, y);
  }
  v12 = v11;

  return v12;
}

- (void)timeFormatterTextDidChange:(id)a3
{
  NTKVictoryTimeLabel *fullscreenHybridUpperTimeLabel;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
  objc_msgSend(a3, "overrideDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setOverrideDate:duration:](fullscreenHybridUpperTimeLabel, "setOverrideDate:duration:", v5, 0.0);

  -[CLKTimeFormatter timeSubstringToSeparatorText](self->_timeFormatter, "timeSubstringToSeparatorText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02ld"), objc_msgSend(v6, "integerValue"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v17);
  v8 = objc_msgSend(v17, "hasSuffix:", CFSTR("1"));
  -[NTKOlympusTimeContentView monospacedFontForCircularDial](self, "monospacedFontForCircularDial");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (_QWORD *)MEMORY[0x1E0DC1138];
  if (!v8 && v9)
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v9, objc_msgSend(v17, "length") - 1, 1);
  -[CLKUIColoringLabel color](self->_circularUpperTimeLabel, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_QWORD *)MEMORY[0x1E0DC1140];
  if (v12)
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v12, 0, objc_msgSend(v17, "length"));
  -[NTKVictoryLabel setAttributedText:](self->_circularUpperTimeLabel, "setAttributedText:", v7);
  -[NTKVictoryLabel sizeToFit](self->_circularUpperTimeLabel, "sizeToFit");
  -[NTKVictoryLabel setText:](self->_fullscreenDigitalUpperTimeLabel, "setText:", v17);
  -[NTKVictoryLabel sizeToFit](self->_fullscreenDigitalUpperTimeLabel, "sizeToFit");
  -[CLKTimeFormatter setIncludeSeparatorInTimeSubstringFromSeparatorText:](self->_timeFormatter, "setIncludeSeparatorInTimeSubstringFromSeparatorText:", 0);
  -[CLKTimeFormatter timeSubstringFromSeparatorText](self->_timeFormatter, "timeSubstringFromSeparatorText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKVictoryLabel setText:](self->_fullscreenHybridLowerTimeLabel, "setText:", v14);
  -[NTKVictoryLabel sizeToFit](self->_fullscreenHybridLowerTimeLabel, "sizeToFit");
  -[NTKVictoryLabel setText:](self->_fullscreenDigitalLowerTimeLabel, "setText:", v14);
  -[NTKVictoryLabel sizeToFit](self->_fullscreenDigitalLowerTimeLabel, "sizeToFit");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
  if (!objc_msgSend(v14, "hasPrefix:", CFSTR("1")) && v10)
    objc_msgSend(v15, "addAttribute:value:range:", *v11, v10, 0, 1);
  -[CLKUIColoringLabel color](self->_circularLowerTimeLabel, "color");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v15, "addAttribute:value:range:", *v13, v16, 0, objc_msgSend(v14, "length"));
  -[NTKVictoryLabel setAttributedText:](self->_circularLowerTimeLabel, "setAttributedText:", v15);
  -[NTKVictoryLabel sizeToFit](self->_circularLowerTimeLabel, "sizeToFit");
  -[NTKOlympusTimeContentView updateTimeLabelsFrame](self, "updateTimeLabelsFrame");

}

- (BOOL)isFrozen
{
  return self->frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->frozen = a3;
}

- (NTKOlympusContentViewDelegate)delegate
{
  return (NTKOlympusContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)invertedColors
{
  return self->_invertedColors;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (UIButton)fullscreenLogoButton
{
  return self->_fullscreenLogoButton;
}

- (void)setFullscreenLogoButton:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenLogoButton, a3);
}

- (UIButton)circularLogoButton
{
  return self->_circularLogoButton;
}

- (void)setCircularLogoButton:(id)a3
{
  objc_storeStrong((id *)&self->_circularLogoButton, a3);
}

- (void)setCircularLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_circularLogoImage, a3);
}

- (NTKVictoryTimeLabel)fullscreenHybridUpperTimeLabel
{
  return self->_fullscreenHybridUpperTimeLabel;
}

- (void)setFullscreenHybridUpperTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenHybridUpperTimeLabel, a3);
}

- (NTKVictoryLabel)fullscreenHybridLowerTimeLabel
{
  return self->_fullscreenHybridLowerTimeLabel;
}

- (void)setFullscreenHybridLowerTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenHybridLowerTimeLabel, a3);
}

- (NTKVictoryLabel)fullscreenDigitalUpperTimeLabel
{
  return self->_fullscreenDigitalUpperTimeLabel;
}

- (void)setFullscreenDigitalUpperTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenDigitalUpperTimeLabel, a3);
}

- (NTKVictoryLabel)fullscreenDigitalLowerTimeLabel
{
  return self->_fullscreenDigitalLowerTimeLabel;
}

- (void)setFullscreenDigitalLowerTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenDigitalLowerTimeLabel, a3);
}

- (NTKVictoryLabel)circularUpperTimeLabel
{
  return self->_circularUpperTimeLabel;
}

- (void)setCircularUpperTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_circularUpperTimeLabel, a3);
}

- (NTKVictoryLabel)circularLowerTimeLabel
{
  return self->_circularLowerTimeLabel;
}

- (void)setCircularLowerTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_circularLowerTimeLabel, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)fullscreenDigitsContainerView
{
  return self->_fullscreenDigitsContainerView;
}

- (void)setFullscreenDigitsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenDigitsContainerView, a3);
}

- (UIView)circularDigitsContainerView
{
  return self->_circularDigitsContainerView;
}

- (void)setCircularDigitsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_circularDigitsContainerView, a3);
}

- (CLKTimeFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)setTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_timeFormatter, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)dial
{
  return self->_dial;
}

- (NTKOlympusColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (NTKOlympusColorPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
}

- (UIColor)currentForegroundColor
{
  return self->_currentForegroundColor;
}

- (void)setCurrentForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentForegroundColor, a3);
}

- (UIColor)currentBackgroundColor
{
  return self->_currentBackgroundColor;
}

- (void)setCurrentBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentBackgroundColor, a3);
}

- (UIColor)currentLogoColor
{
  return self->_currentLogoColor;
}

- (void)setCurrentLogoColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentLogoColor, a3);
}

- (double)dialFraction
{
  return self->_dialFraction;
}

- (void)setDialFraction:(double)a3
{
  self->_dialFraction = a3;
}

- (double)digitalStyleFraction
{
  return self->_digitalStyleFraction;
}

- (void)setDigitalStyleFraction:(double)a3
{
  self->_digitalStyleFraction = a3;
}

- (double)olympusDigitalStyleFraction
{
  return self->_olympusDigitalStyleFraction;
}

- (void)setOlympusDigitalStyleFraction:(double)a3
{
  self->_olympusDigitalStyleFraction = a3;
}

- (double)olympusAnalogStyleFraction
{
  return self->_olympusAnalogStyleFraction;
}

- (void)setOlympusAnalogStyleFraction:(double)a3
{
  self->_olympusAnalogStyleFraction = a3;
}

- (double)analogStyleFraction
{
  return self->_analogStyleFraction;
}

- (void)setAnalogStyleFraction:(double)a3
{
  self->_analogStyleFraction = a3;
}

- (double)olympusDigitalLabelsPositionFraction
{
  return self->_olympusDigitalLabelsPositionFraction;
}

- (void)setOlympusDigitalLabelsPositionFraction:(double)a3
{
  self->_olympusDigitalLabelsPositionFraction = a3;
}

- (double)analogStyleSwooshPositionFraction
{
  return self->_analogStyleSwooshPositionFraction;
}

- (void)setAnalogStyleSwooshPositionFraction:(double)a3
{
  self->_analogStyleSwooshPositionFraction = a3;
}

- (void)setLogoImageSizeForCircularDial:(CGSize)a3
{
  self->_logoImageSizeForCircularDial = a3;
}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLogoColor, 0);
  objc_storeStrong((id *)&self->_currentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_currentForegroundColor, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_circularDigitsContainerView, 0);
  objc_storeStrong((id *)&self->_fullscreenDigitsContainerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_circularLowerTimeLabel, 0);
  objc_storeStrong((id *)&self->_circularUpperTimeLabel, 0);
  objc_storeStrong((id *)&self->_fullscreenDigitalLowerTimeLabel, 0);
  objc_storeStrong((id *)&self->_fullscreenDigitalUpperTimeLabel, 0);
  objc_storeStrong((id *)&self->_fullscreenHybridLowerTimeLabel, 0);
  objc_storeStrong((id *)&self->_fullscreenHybridUpperTimeLabel, 0);
  objc_storeStrong((id *)&self->_circularLogoImage, 0);
  objc_storeStrong((id *)&self->_circularLogoButton, 0);
  objc_storeStrong((id *)&self->_fullscreenLogoButton, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
