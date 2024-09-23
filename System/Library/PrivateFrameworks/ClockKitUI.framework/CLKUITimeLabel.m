@implementation CLKUITimeLabel

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_paused = a3;
  -[CLKTimeFormatter setPaused:forReason:](self->_timeFormatter, "setPaused:forReason:");
  -[CLKUITimeLabel setBlinkingPaused:](self, "setBlinkingPaused:", v3);
}

- (void)setBlinkingPaused:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[_CLKUITimeLabelManager setAnimationsPaused:](self->_labelManager, "setAnimationsPaused:");
  -[_CLKUITimeLabelManager setAnimationsPaused:](self->_fromLabelManager, "setAnimationsPaused:", v3);
}

- (CLKTimeFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)timeFormatterTextDidChange:(id)a3
{
  -[_CLKUITimeLabelManager updateTimeText](self->_labelManager, "updateTimeText", a3);
  -[_CLKUITimeLabelManager updateTimeText](self->_fromLabelManager, "updateTimeText");
  -[CLKUITimeLabel _resizeIfNecessary](self, "_resizeIfNecessary");
}

- (void)_resizeIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  void (**didResizeHandler)(void);

  -[CLKUITimeLabel bounds](self, "bounds");
  -[CLKUITimeLabel sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;
  v6 = v5;
  if ((CLKSizeEqualsSize() & 1) == 0 && v4 >= 0.0 && v6 >= 0.0)
  {
    -[CLKUITimeLabel setBounds:](self, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v4, v6);
    didResizeHandler = (void (**)(void))self->_didResizeHandler;
    if (didResizeHandler)
      didResizeHandler[2]();
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int *v3;
  double v4;
  double v5;
  CGSize result;

  if (self->_styleTransitioning)
    v3 = &OBJC_IVAR___CLKUITimeLabel__fromLabelManager;
  else
    v3 = &OBJC_IVAR___CLKUITimeLabel__labelManager;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v3), "sizeThatFits", a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKUITimeLabel;
  -[CLKUITimeLabel layoutSubviews](&v8, sel_layoutSubviews);
  -[_CLKUITimeLabelManager sizeViewToFit](self->_labelManager, "sizeViewToFit");
  -[_CLKUITimeLabelManager sizeViewToFit](self->_fromLabelManager, "sizeViewToFit");
  v3 = MEMORY[0x1D17A167C](-[CLKUITimeLabel bounds](self, "bounds"));
  v5 = v4;
  -[_CLKUITimeLabelManager view](self->_labelManager, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCenter:", v3, v5);

  -[_CLKUITimeLabelManager view](self->_fromLabelManager, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v3, v5);

}

- (void)setStyle:(id)a3
{
  id v4;
  CLKUITimeLabelStyle *v5;
  CLKUITimeLabelStyle *style;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_styleTransitioning)
  {
    -[CLKUITimeLabel _cancelAnimation](self, "_cancelAnimation");
    v4 = v7;
  }
  if ((objc_msgSend(v4, "isEqual:", self->_style) & 1) == 0)
  {
    v5 = (CLKUITimeLabelStyle *)objc_msgSend(v7, "copy");
    style = self->_style;
    self->_style = v5;

    -[_CLKUITimeLabelManager setStyle:](self->_labelManager, "setStyle:", self->_style);
    -[CLKUITimeLabel _resizeIfNecessary](self, "_resizeIfNecessary");
  }

}

+ (CLKUITimeLabel)labelWithOptions:(unint64_t)a3
{
  return (CLKUITimeLabel *)objc_msgSend(a1, "labelWithOptions:forDevice:", a3, 0);
}

+ (CLKUITimeLabel)labelWithOptions:(unint64_t)a3 forDevice:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimeLabelOptions:forDevice:", a3, v6);

  return (CLKUITimeLabel *)v7;
}

- (CLKUITimeLabel)initWithFrame:(CGRect)a3
{
  return -[CLKUITimeLabel initWithFrame:forDevice:](self, "initWithFrame:forDevice:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CLKUITimeLabel)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  return -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:](self, "initWithTimeLabelOptions:forDevice:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CLKUITimeLabel)initWithTimeLabelOptions:(unint64_t)a3
{
  return -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:](self, "initWithTimeLabelOptions:forDevice:", a3, 0);
}

- (CLKUITimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  CLKUITimeLabel *v9;

  v6 = (void *)MEMORY[0x1E0C94130];
  v7 = a4;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:clockTimer:](self, "initWithTimeLabelOptions:forDevice:clockTimer:", a3, v7, v8);

  return v9;
}

- (CLKUITimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4 clockTimer:(id)a5
{
  void *v5;
  id v9;
  id v10;
  CLKUITimeLabel *v11;
  void *v12;
  uint64_t v13;
  CLKTimeFormatter *timeFormatter;
  uint64_t v15;
  _CLKUITimeLabelManager *labelManager;
  void *v17;
  objc_super v19;

  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CLKUITimeLabel;
  v11 = -[CLKUITimeLabel initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v11)
  {
    v12 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_device, v12);
    if (!v9)
    {

    }
    v11->_options = a3;
    v11->_showsDesignator = (a3 & 2) != 0;
    -[CLKUITimeLabel setTimer:](v11, "setTimer:", v10);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94550]), "initWithForcesLatinNumbers:clockTimer:", 0, v10);
    timeFormatter = v11->_timeFormatter;
    v11->_timeFormatter = (CLKTimeFormatter *)v13;

    -[CLKTimeFormatter addObserver:](v11->_timeFormatter, "addObserver:", v11);
    -[CLKTimeFormatter setDelegate:](v11->_timeFormatter, "setDelegate:", v11);
    v11->_ignoresWindowPauseReason = (a3 & 0x1000) != 0;
    if ((a3 & 0x1000) == 0)
      -[CLKTimeFormatter setPaused:forReason:](v11->_timeFormatter, "setPaused:forReason:", 1, CFSTR("PausedBecauseNotInWindow"));
    v15 = -[CLKUITimeLabel _newLabelManager](v11, "_newLabelManager");
    labelManager = v11->_labelManager;
    v11->_labelManager = (_CLKUITimeLabelManager *)v15;

    -[_CLKUITimeLabelManager setAnimationsPaused:](v11->_labelManager, "setAnimationsPaused:", 0);
    -[_CLKUITimeLabelManager updateTimeText](v11->_labelManager, "updateTimeText");
    -[_CLKUITimeLabelManager view](v11->_labelManager, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabel addSubview:](v11, "addSubview:", v17);

    v11->_showSeconds = 0;
    -[CLKTimeFormatter setShowSeconds:](v11->_timeFormatter, "setShowSeconds:", 0);
    v11->_forcedNumberSystem = -1;
  }

  return v11;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CLKUITimeLabel isHidden](self, "isHidden") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CLKUITimeLabel;
    -[CLKUITimeLabel setHidden:](&v5, sel_setHidden_, v3);
    -[CLKTimeFormatter setPaused:forReason:](self->_timeFormatter, "setPaused:forReason:", -[CLKUITimeLabel isHidden](self, "isHidden"), CFSTR("PausedBecauseHidden"));
  }
}

- (void)setShowSeconds:(BOOL)a3
{
  if (self->_showSeconds != a3)
  {
    self->_showSeconds = a3;
    -[CLKTimeFormatter setShowSeconds:](self->_timeFormatter, "setShowSeconds:");
    -[_CLKUITimeLabelManager setShowSeconds:](self->_labelManager, "setShowSeconds:", self->_showSeconds);
  }
}

- (void)setMaxWidth:(double)a3
{
  -[_CLKUITimeLabelManager setMaxWidth:](self->_labelManager, "setMaxWidth:");
  -[_CLKUITimeLabelManager setMaxWidth:](self->_fromLabelManager, "setMaxWidth:", a3);
  -[CLKUITimeLabel _resizeIfNecessary](self, "_resizeIfNecessary");
}

- (BOOL)blinkingSeparatorEnabled
{
  return self->_options & 1;
}

- (void)setShowsDesignator:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_showsDesignator != a3)
  {
    v3 = a3;
    self->_showsDesignator = a3;
    -[_CLKUITimeLabelManager setShowsDesignator:](self->_labelManager, "setShowsDesignator:");
    -[_CLKUITimeLabelManager setShowsDesignator:](self->_fromLabelManager, "setShowsDesignator:", v3);
  }
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void)setFont:(id)a3
{
  -[CLKUITimeLabel setTimeFont:designatorFont:](self, "setTimeFont:designatorFont:", a3, a3);
}

- (void)setTimeFont:(id)a3 designatorFont:(id)a4
{
  -[CLKUITimeLabel setThreeDigitFont:fourDigitFont:designatorFont:](self, "setThreeDigitFont:fourDigitFont:designatorFont:", a3, a3, a4);
}

- (void)setStringAttributes:(id)a3
{
  id v4;
  CLKUITimeLabelStyle *style;
  void *v6;
  void *v7;
  void *v8;
  CLKUITimeLabelStyle *v9;

  v4 = a3;
  v9 = objc_alloc_init(CLKUITimeLabelStyle);
  -[CLKUITimeLabelStyle setStringAttributes:](v9, "setStringAttributes:", v4);

  style = self->_style;
  if (style)
  {
    -[CLKUITimeLabelStyle threeDigitFont](style, "threeDigitFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabelStyle setThreeDigitFont:](v9, "setThreeDigitFont:", v6);

    -[CLKUITimeLabelStyle fourDigitFont](self->_style, "fourDigitFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabelStyle setFourDigitFont:](v9, "setFourDigitFont:", v7);

    -[CLKUITimeLabelStyle designatorFont](self->_style, "designatorFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabelStyle setDesignatorFont:](v9, "setDesignatorFont:", v8);

  }
  -[CLKUITimeLabel setStyle:](self, "setStyle:", v9);

}

- (void)setThreeDigitFont:(id)a3 fourDigitFont:(id)a4 designatorFont:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CLKUITimeLabelStyle *style;
  void *v15;
  CLKUITimeLabelStyle *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v16 = objc_alloc_init(CLKUITimeLabelStyle);
  _FontWithCenteredColons(v10, -[CLKTimeFormatter forcedNumberSystem](self->_timeFormatter, "forcedNumberSystem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKUITimeLabelStyle setThreeDigitFont:](v16, "setThreeDigitFont:", v11);
  _FontWithCenteredColons(v9, -[CLKTimeFormatter forcedNumberSystem](self->_timeFormatter, "forcedNumberSystem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKUITimeLabelStyle setFourDigitFont:](v16, "setFourDigitFont:", v12);
  _FontWithCenteredColons(v8, -[CLKTimeFormatter forcedNumberSystem](self->_timeFormatter, "forcedNumberSystem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKUITimeLabelStyle setDesignatorFont:](v16, "setDesignatorFont:", v13);
  style = self->_style;
  if (style)
  {
    -[CLKUITimeLabelStyle stringAttributes](style, "stringAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabelStyle setStringAttributes:](v16, "setStringAttributes:", v15);

  }
  -[CLKUITimeLabel setStyle:](self, "setStyle:", v16);

}

- (void)setForcedNumberSystem:(unint64_t)a3
{
  id v4;

  self->_forcedNumberSystem = a3;
  -[CLKUITimeLabel timeFormatter](self, "timeFormatter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForcedNumberSystem:", a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKUITimeLabel;
  v4 = a3;
  -[CLKUITimeLabel traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);
  -[_CLKUITimeLabelManager traitCollectionDidChange:](self->_labelManager, "traitCollectionDidChange:", v4, v5.receiver, v5.super_class);
  -[_CLKUITimeLabelManager traitCollectionDidChange:](self->_fromLabelManager, "traitCollectionDidChange:", v4);

  -[CLKUITimeLabel _resizeIfNecessary](self, "_resizeIfNecessary");
}

- (id)labelManagerContentView
{
  return (id)-[_CLKUITimeLabelManager view](self->_labelManager, "view");
}

- (void)prepareToTransitionToStyle:(id)a3
{
  CLKUITimeLabelStyle *v4;
  CLKUITimeLabelStyle *style;
  CLKUITimeLabelStyle *v6;
  _CLKUITimeLabelManager *v7;
  _CLKUITimeLabelManager *labelManager;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  int *v15;
  int *v16;
  objc_class *v17;
  CGSize v18;
  id v19;

  v4 = (CLKUITimeLabelStyle *)a3;
  if (self->_styleTransitioning)
    -[CLKUITimeLabel cleanupAfterStyleTransition](self, "cleanupAfterStyleTransition");
  -[_CLKUITimeLabelManager textColor](self->_labelManager, "textColor");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_fromStyle, self->_style);
  objc_storeStrong((id *)&self->_fromLabelManager, self->_labelManager);
  style = self->_style;
  self->_style = v4;
  v6 = v4;

  v7 = -[CLKUITimeLabel _newLabelManager](self, "_newLabelManager");
  labelManager = self->_labelManager;
  self->_labelManager = v7;

  -[_CLKUITimeLabelManager setStyle:](self->_labelManager, "setStyle:", self->_style);
  -[_CLKUITimeLabelManager setTextColor:](self->_labelManager, "setTextColor:", v19);
  -[_CLKUITimeLabelManager updateTimeText](self->_labelManager, "updateTimeText");
  -[_CLKUITimeLabelManager sizeViewToFit](self->_labelManager, "sizeViewToFit");
  -[_CLKUITimeLabelManager view](self->_labelManager, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUITimeLabel addSubview:](self, "addSubview:", v9);

  -[_CLKUITimeLabelManager setAnimationsPaused:](self->_labelManager, "setAnimationsPaused:", 1);
  -[_CLKUITimeLabelManager setAnimationsPaused:](self->_fromLabelManager, "setAnimationsPaused:", 1);
  -[_CLKUITimeLabelManager effectiveFont](self->_fromLabelManager, "effectiveFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CLKUITimeLabelManager effectiveFont](self->_labelManager, "effectiveFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pointSize");
  v13 = v12;
  objc_msgSend(v11, "pointSize");
  v15 = &OBJC_IVAR___CLKUITimeLabel__fadeEnd;
  if (v13 >= v14)
    v16 = &OBJC_IVAR___CLKUITimeLabel__fadeEnd;
  else
    v16 = &OBJC_IVAR___CLKUITimeLabel__fadeStart;
  if (v13 >= v14)
    v15 = &OBJC_IVAR___CLKUITimeLabel__fadeStart;
  v17 = (objc_class *)qword_1CB9E2930[v13 < v14];
  *(Class *)((char *)&self->super.super.super.isa + *v16) = (Class)qword_1CB9E2920[v13 < v14];
  *(Class *)((char *)&self->super.super.super.isa + *v15) = v17;
  v18 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_styleTransitionEndFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_styleTransitionEndFrame.size = v18;
  self->_styleTransitioning = 1;
  -[CLKUITimeLabel setStyleTransitionFraction:](self, "setStyleTransitionFraction:", 0.0);

}

- (void)setStyleTransitionFraction:(double)a3
{
  self->_styleTransitionFraction = a3;
  -[CLKUITimeLabel _scaleTransitionLabels](self, "_scaleTransitionLabels");
  -[CLKUITimeLabel _fadeTransitionLabels](self, "_fadeTransitionLabels");
}

- (void)cleanupAfterStyleTransition
{
  void *v3;
  _CLKUITimeLabelManager *fromLabelManager;
  void *v5;
  void *v6;
  __int128 v7;
  _OWORD v8[3];

  -[_CLKUITimeLabelManager view](self->_fromLabelManager, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  fromLabelManager = self->_fromLabelManager;
  self->_fromLabelManager = 0;

  self->_styleTransitioning = 0;
  -[CLKUITimeLabel _resizeIfNecessary](self, "_resizeIfNecessary");
  -[_CLKUITimeLabelManager setAnimationsPaused:](self->_labelManager, "setAnimationsPaused:", 0);
  -[_CLKUITimeLabelManager view](self->_labelManager, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  -[_CLKUITimeLabelManager view](self->_labelManager, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v7;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v6, "setTransform:", v8);

  if (!CGRectIsNull(self->_styleTransitionEndFrame))
    -[CLKUITimeLabel setFrame:](self, "setFrame:", self->_styleTransitionEndFrame.origin.x, self->_styleTransitionEndFrame.origin.y, self->_styleTransitionEndFrame.size.width, self->_styleTransitionEndFrame.size.height);
}

- (CGSize)styleTransitionEndSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_CLKUITimeLabelManager view](self->_labelManager, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)styleTransitionCurrentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_CLKUITimeLabelManager view](self->_labelManager, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_newUnderlyingLabel:(BOOL)a3
{
  return objc_alloc_init(MEMORY[0x1E0DC3990]);
}

- (void)_enumerateUnderlyingLabelsWithBlock:(id)a3
{
  _CLKUITimeLabelManager *labelManager;
  id v5;

  labelManager = self->_labelManager;
  v5 = a3;
  -[_CLKUITimeLabelManager enumerateUnderlyingLabelsWithBlock:](labelManager, "enumerateUnderlyingLabelsWithBlock:", v5);
  -[_CLKUITimeLabelManager enumerateUnderlyingLabelsWithBlock:](self->_fromLabelManager, "enumerateUnderlyingLabelsWithBlock:", v5);

}

- (void)sizeToFit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUITimeLabel;
  -[CLKUITimeLabel sizeToFit](&v3, sel_sizeToFit);
  -[CLKUITimeLabel layoutIfNeeded](self, "layoutIfNeeded");
}

- (CGSize)intrinsicSize
{
  int *v2;
  double v3;
  double v4;
  CGSize result;

  if (self->_styleTransitioning)
    v2 = &OBJC_IVAR___CLKUITimeLabel__fromLabelManager;
  else
    v2 = &OBJC_IVAR___CLKUITimeLabel__labelManager;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v2), "intrinsicSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKUITimeLabel;
  -[CLKUITimeLabel didMoveToWindow](&v4, sel_didMoveToWindow);
  if (!self->_ignoresWindowPauseReason)
  {
    -[CLKUITimeLabel window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTimeFormatter setPaused:forReason:](self->_timeFormatter, "setPaused:forReason:", v3 == 0, CFSTR("PausedBecauseNotInWindow"));
    if (!v3)
      -[CLKUITimeLabel _cancelAnimation](self, "_cancelAnimation");

  }
}

- (UIFont)font
{
  return (UIFont *)-[CLKUITimeLabelStyle threeDigitFont](self->_style, "threeDigitFont");
}

- (void)setText:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("You can't set the text of a digital time label."));
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[_CLKUITimeLabelManager effectiveAttributedText](self->_labelManager, "effectiveAttributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAttributedText:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("You can't set the attributed text of a digital time label."));
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)-[_CLKUITimeLabelManager effectiveAttributedText](self->_labelManager, "effectiveAttributedText");
}

- (void)setTextColor:(id)a3
{
  _CLKUITimeLabelManager *labelManager;
  id v5;

  labelManager = self->_labelManager;
  v5 = a3;
  -[_CLKUITimeLabelManager setTextColor:](labelManager, "setTextColor:", v5);
  -[_CLKUITimeLabelManager setTextColor:](self->_fromLabelManager, "setTextColor:", v5);

}

- (UIColor)textColor
{
  return (UIColor *)-[_CLKUITimeLabelManager textColor](self->_labelManager, "textColor");
}

- (void)setTextAlignment:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("You can't set the text alignment of a digital time label (they size to fit)."));
}

- (int64_t)textAlignment
{
  return 1;
}

- (double)_capOffsetFromBoundsTop
{
  double result;

  -[_CLKUITimeLabelManager _capOffsetFromBoundsTop](self->_labelManager, "_capOffsetFromBoundsTop");
  return result;
}

- (double)_lastLineBaseline
{
  double result;

  -[_CLKUITimeLabelManager _lastLineBaseline](self->_labelManager, "_lastLineBaseline");
  return result;
}

- (UIEdgeInsets)opticalInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_CLKUITimeLabelManager opticalInsets](self->_labelManager, "opticalInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  void *v3;
  void *v4;
  id v5;

  -[_CLKUITimeLabelManager viewForLastBaselineLayout](self->_labelManager, "viewForLastBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (void)transitionToTritiumOverrideDate:(id)a3
{
  -[CLKUITimeLabel setOverrideDate:duration:](self, "setOverrideDate:duration:", a3, 0.0);
  -[CLKUITimeLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[CLKUITimeLabel timeFormatter](self, "timeFormatter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverrideDate:", v5);

}

- (void)setTimeOffset:(double)a3
{
  id v4;

  -[CLKUITimeLabel timeFormatter](self, "timeFormatter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeOffset:", a3);

}

- (id)_newLabelManager
{
  id v3;
  CLKDevice *device;
  CLKTimeFormatter *timeFormatter;
  unint64_t options;
  CLKClockTimer *timer;
  void *v8;
  _QWORD v10[5];

  -[CLKUITimeLabel blinkingSeparatorEnabled](self, "blinkingSeparatorEnabled");
  v3 = objc_alloc((Class)objc_opt_class());
  device = self->_device;
  timeFormatter = self->_timeFormatter;
  options = self->_options;
  timer = self->_timer;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__CLKUITimeLabel__newLabelManager__block_invoke;
  v10[3] = &unk_1E86E0590;
  v10[4] = self;
  v8 = (void *)objc_msgSend(v3, "initWithForDevice:timeFormatter:options:timer:labelFactory:", device, timeFormatter, options, timer, v10);
  objc_msgSend(v8, "setShowsDesignator:", self->_showsDesignator);
  return v8;
}

id __34__CLKUITimeLabel__newLabelManager__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_newUnderlyingLabel:", a2);
}

- (void)_scaleTransitionLabels
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double styleTransitionFraction;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  -[_CLKUITimeLabelManager view](self->_fromLabelManager, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CLKUITimeLabelManager view](self->_labelManager, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "bounds");
  styleTransitionFraction = self->_styleTransitionFraction;
  v12 = (v9 / v6 + -1.0) * styleTransitionFraction + 1.0;
  v13 = (v10 / v8 + -1.0) * styleTransitionFraction + 1.0;
  v14 = v6 / v9 + (1.0 - v6 / v9) * styleTransitionFraction;
  v15 = v8 / v10 + (1.0 - v8 / v10) * styleTransitionFraction;
  CGAffineTransformMakeScale(&v20, v12, v13);
  objc_msgSend(v3, "setTransform:", &v20);
  CGAffineTransformMakeScale(&v19, v14, v15);
  objc_msgSend(v4, "setTransform:", &v19);
  v16 = MEMORY[0x1D17A167C](-[CLKUITimeLabel bounds](self, "bounds"));
  v18 = v17;
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v4, "setCenter:", v16, v18);

}

- (void)_fadeTransitionLabels
{
  double v3;
  void *v4;
  id v5;

  v3 = fmin(fmax((self->_styleTransitionFraction - self->_fadeStart) / (self->_fadeEnd - self->_fadeStart), 0.0), 1.0);
  -[_CLKUITimeLabelManager view](self->_fromLabelManager, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0 - v3);

  -[_CLKUITimeLabelManager view](self->_labelManager, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

- (unint64_t)options
{
  return self->_options;
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)showsDesignator
{
  return self->_showsDesignator;
}

- (BOOL)paused
{
  return self->_paused;
}

- (unint64_t)forcedNumberSystem
{
  return self->_forcedNumberSystem;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (id)didResizeHandler
{
  return self->_didResizeHandler;
}

- (void)setDidResizeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (BOOL)showSeconds
{
  return self->_showSeconds;
}

- (CLKUITimeLabelStyle)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong(&self->_didResizeHandler, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_timeText, 0);
  objc_storeStrong((id *)&self->_fromLabelManager, 0);
  objc_storeStrong((id *)&self->_fromStyle, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_labelManager, 0);
}

@end
