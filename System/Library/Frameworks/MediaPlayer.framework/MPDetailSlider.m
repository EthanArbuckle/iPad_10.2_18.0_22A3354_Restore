@implementation MPDetailSlider

- (MPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 maxTrackWidth:(double)a5
{
  MPDetailSlider *v9;
  MPDetailScrubController *v10;
  MPDetailScrubController *scrubController;
  uint64_t v12;
  AVTimeFormatter *formatter;
  objc_super v15;

  if (a3.size.height < 34.0 && a4 == 3 || a3.size.height == 0.0)
    a3.size.height = 34.0;
  v15.receiver = self;
  v15.super_class = (Class)MPDetailSlider;
  v9 = -[MPDetailSlider initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v9)
  {
    v10 = -[MPDetailScrubController initWithScrubbingControl:]([MPDetailScrubController alloc], "initWithScrubbingControl:", v9);
    scrubController = v9->_scrubController;
    v9->_scrubController = v10;

    -[MPDetailScrubController setDelegate:](v9->_scrubController, "setDelegate:", v9);
    -[MPDetailScrubController setDetailedScrubbingEnabled:](v9->_scrubController, "setDetailedScrubbingEnabled:", 1);
    v9->_allowsScrubbing = 1;
    v9->_maxTrackWidth = a5;
    v9->_style = a4;
    if ((unint64_t)(a4 - 3) >= 2)
      v9->_minTimeLabelWidth = 41.0;
    -[MPDetailSlider _setupControlsForStyle](v9, "_setupControlsForStyle");
    -[MPDetailSlider setDeliversTouchesForGesturesToSuperview:](v9, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[MPDetailSlider setSemanticContentAttribute:](v9, "setSemanticContentAttribute:", 1);
    v12 = objc_opt_new();
    formatter = v9->_formatter;
    v9->_formatter = (AVTimeFormatter *)v12;

  }
  return v9;
}

- (MPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return -[MPDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (MPDetailSlider)initWithFrame:(CGRect)a3
{
  return -[MPDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MPDetailSlider;
  -[MPDetailSlider dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  UILabel *currentTimeLabel;
  void *currentTimeInverseLabel;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  UILabel *v27;
  UILabel *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  -[MPDetailSlider bounds](self, "bounds");
  -[MPDetailSlider traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  if (v5 < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v5 = v7;

  }
  if (self->_timeLabelStyle == 1)
  {
    -[UILabel removeFromSuperview](self->_currentTimeLabel, "removeFromSuperview");
    currentTimeLabel = self->_currentTimeLabel;
    self->_currentTimeLabel = 0;

    -[UILabel removeFromSuperview](self->_currentTimeInverseLabel, "removeFromSuperview");
    currentTimeInverseLabel = self->_currentTimeInverseLabel;
    self->_currentTimeInverseLabel = 0;
  }
  else
  {
    -[MPDetailSlider bounds](self, "bounds");
    -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
    v34 = v11;
    v35 = v10;
    v32 = v13;
    v33 = v12;
    -[MPDetailSlider timeLabelFontForStyle:](self, "timeLabelFontForStyle:", self->_style);
    currentTimeInverseLabel = (void *)objc_claimAutoreleasedReturnValue();
    -[MPDetailSlider timeLabelTextColorForStyle:](self, "timeLabelTextColorForStyle:", self->_style);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_currentTimeLabel;
    if (!v15)
    {
      v16 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "labelClass")), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v17 = self->_currentTimeLabel;
      self->_currentTimeLabel = v16;

      -[UILabel setBackgroundColor:](self->_currentTimeLabel, "setBackgroundColor:", 0);
      -[UILabel setFont:](self->_currentTimeLabel, "setFont:", currentTimeInverseLabel);
      -[UILabel setLineBreakMode:](self->_currentTimeLabel, "setLineBreakMode:", 2);
      -[UILabel setOpaque:](self->_currentTimeLabel, "setOpaque:", 0);
      -[MPDetailSlider _stringForCurrentTime:](self, "_stringForCurrentTime:", NAN);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_currentTimeLabel, "setText:", v18);

      -[UILabel setTextAlignment:](self->_currentTimeLabel, "setTextAlignment:", 2);
      -[UILabel setTextColor:](self->_currentTimeLabel, "setTextColor:", v14);
      -[MPDetailSlider addSubview:](self, "addSubview:", self->_currentTimeLabel);
      v15 = self->_currentTimeLabel;
    }
    -[UILabel sizeToFit](v15, "sizeToFit");
    -[UILabel frame](self->_currentTimeLabel, "frame");
    UIRectCenteredYInRectScale();
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v37.origin.y = v34;
    v37.origin.x = v35;
    v37.size.height = v32;
    v37.size.width = v33;
    CGRectGetMinX(v37);
    v38.origin.x = v20;
    v38.origin.y = v22;
    v38.size.width = v24;
    v38.size.height = v26;
    CGRectGetWidth(v38);
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_currentTimeLabel, "setFrame:", *(_QWORD *)&v5);
    v27 = self->_currentTimeInverseLabel;
    if (!v27)
    {
      v28 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "labelClass")), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v29 = self->_currentTimeInverseLabel;
      self->_currentTimeInverseLabel = v28;

      -[UILabel setBackgroundColor:](self->_currentTimeInverseLabel, "setBackgroundColor:", 0);
      -[UILabel setFont:](self->_currentTimeInverseLabel, "setFont:", currentTimeInverseLabel);
      -[UILabel setLineBreakMode:](self->_currentTimeInverseLabel, "setLineBreakMode:", 2);
      -[UILabel setOpaque:](self->_currentTimeInverseLabel, "setOpaque:", 0);
      -[MPDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:", NAN);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_currentTimeInverseLabel, "setText:", v30);

      -[UILabel setTextAlignment:](self->_currentTimeInverseLabel, "setTextAlignment:", 0);
      -[UILabel setTextColor:](self->_currentTimeInverseLabel, "setTextColor:", v14);
      -[MPDetailSlider addSubview:](self, "addSubview:", self->_currentTimeInverseLabel);
      v27 = self->_currentTimeInverseLabel;
    }
    -[UILabel sizeToFit](v27, "sizeToFit");
    -[UILabel frame](self->_currentTimeInverseLabel, "frame");
    UIRectCenteredYInRectScale();
    v39.origin.y = v34;
    v39.origin.x = v35;
    v39.size.height = v32;
    v39.size.width = v33;
    CGRectGetMaxX(v39);
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_currentTimeInverseLabel, "setFrame:", *(_QWORD *)&v5);

  }
  -[MPDetailSlider _updateTrackInset](self, "_updateTrackInset");
  v36.receiver = self;
  v36.super_class = (Class)MPDetailSlider;
  -[MPDetailSlider layoutSubviews](&v36, sel_layoutSubviews);
  if ((unint64_t)(self->_style - 3) <= 1)
  {
    -[MPDetailSlider _maxTrackView](self, "_maxTrackView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);

    -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](self->_currentTimeLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
    -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](self->_currentTimeInverseLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double currentTime;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MPDetailSlider bounds](self, "bounds");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    v9.receiver = self;
    v9.super_class = (Class)MPDetailSlider;
    -[MPDetailSlider setBounds:](&v9, sel_setBounds_, x, y, width, height);
    currentTime = self->_currentTime;
    *(float *)&currentTime = currentTime;
    -[MPDetailSlider setValue:](self, "setValue:", currentTime);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double currentTime;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MPDetailSlider frame](self, "frame");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    v9.receiver = self;
    v9.super_class = (Class)MPDetailSlider;
    -[MPDetailSlider setFrame:](&v9, sel_setFrame_, x, y, width, height);
    currentTime = self->_currentTime;
    *(float *)&currentTime = currentTime;
    -[MPDetailSlider setValue:](self, "setValue:", currentTime);
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPDetailSlider;
  -[MPDetailSlider tintColorDidChange](&v3, sel_tintColorDidChange);
  if (self->_style == 5)
    -[MPDetailSlider _setupControlsForStyle](self, "_setupControlsForStyle");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t style;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPDetailSlider;
  v4 = a3;
  -[MPDetailSlider traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[MPDetailSlider traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 == v7)
  {

  }
  else
  {
    style = self->_style;

    if (style == 5)
      -[MPDetailSlider _setupControlsForStyle](self, "_setupControlsForStyle");
  }
}

- (id)viewForFirstBaselineLayout
{
  return self->_currentTimeLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_currentTimeLabel;
}

- (id)createThumbView
{
  UIImageView *v3;
  UIImageView *thumbImageView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPDetailSlider;
  v3 = -[MPDetailSlider createThumbView](&v6, sel_createThumbView);
  thumbImageView = self->_thumbImageView;
  self->_thumbImageView = v3;

  return self->_thumbImageView;
}

- (id)currentThumbImage
{
  UIImageView *glowDetailScrubImageView;
  UIImageView *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *v12;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  if ((unint64_t)(self->_style - 1) >= 5)
  {
    if (self->_isTracking
      && -[MPDetailScrubController detailedScrubbingEnabled](self->_scrubController, "detailedScrubbingEnabled")
      && -[MPDetailScrubController durationAllowsForDetailedScrubbing](self->_scrubController, "durationAllowsForDetailedScrubbing"))
    {
      glowDetailScrubImageView = self->_glowDetailScrubImageView;
      if (!glowDetailScrubImageView)
      {
        v6 = objc_alloc(MEMORY[0x1E0DC3890]);
        v7 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("scrubberglow"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v9);
        v11 = self->_glowDetailScrubImageView;
        self->_glowDetailScrubImageView = v10;

        v12 = self->_glowDetailScrubImageView;
        -[UIImageView bounds](v12, "bounds");
        -[UIImageView bounds](self->_thumbImageView, "bounds");
        UIRectCenteredIntegralRect();
        v16 = CGRectOffset(v15, 0.0, -1.0);
        -[UIImageView setFrame:](v12, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
        glowDetailScrubImageView = self->_glowDetailScrubImageView;
      }
      -[UIImageView addSubview:](self->_thumbImageView, "addSubview:", glowDetailScrubImageView);
    }
    else
    {
      v4 = self->_glowDetailScrubImageView;
      if (v4)
      {
        -[UIImageView layer](v4, "layer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeAllAnimations");

        -[UIImageView removeFromSuperview](self->_glowDetailScrubImageView, "removeFromSuperview");
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)MPDetailSlider;
  -[MPDetailSlider currentThumbImage](&v14, sel_currentThumbImage);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double trackInset;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MPDetailSlider _updateTrackInset](self, "_updateTrackInset");
  v14.receiver = self;
  v14.super_class = (Class)MPDetailSlider;
  -[MPDetailSlider trackRectForBounds:](&v14, sel_trackRectForBounds_, x, y, width, height);
  v8 = v15.origin.x;
  v9 = v15.origin.y;
  v10 = v15.size.width;
  v11 = v15.size.height;
  v12 = CGRectGetWidth(v15);
  trackInset = self->_trackInset;
  if (v12 <= trackInset + trackInset)
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D648];
  }
  else
  {
    v16.origin.x = v8;
    v16.origin.y = v9;
    v16.size.width = v10;
    v16.size.height = v11;
    return CGRectInset(v16, trackInset, 0.0);
  }
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  void *v5;
  uint64_t v7;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v29;
  CGRect v30;
  CGRect result;

  v29.receiver = self;
  v29.super_class = (Class)MPDetailSlider;
  -[MPDetailSlider thumbRectForBounds:trackRect:value:](&v29, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  if ((unint64_t)(self->_style - 3) > 1)
  {
    v15 = 1.0;
    if (a5 < 0.5)
      v15 = -1.0;
    v30 = CGRectOffset(*(CGRect *)&v7, v15, 0.0);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
  }
  else
  {
    v11 = 0.0;
    if (a5 < 0.5)
      v11 = -1.0;
    CGRectOffset(*(CGRect *)&v7, v11, 0.5);
    -[MPDetailSlider traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayScale");
    v14 = v13;
    if (v13 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scale");
    }
    UIRectIntegralWithScale();
    x = v20;
    y = v21;
    width = v22;
    height = v23;
    if (v14 == 0.0)

  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)setValue:(float)a3
{
  -[MPDetailSlider setValue:animated:](self, "setValue:animated:", 0);
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  -[MPDetailSlider setValue:duration:](self, "setValue:duration:", a4);
}

- (void)setValue:(float)a3 duration:(double)a4
{
  if (!self->_isTracking)
    -[MPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:");
}

- (void)_setValueWhileTracking:(float)a3 duration:(double)a4
{
  double duration;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  float v17;

  duration = self->_duration;
  if (duration > 0.0)
  {
    v7 = fmax(a3, 0.0);
    if (duration < v7)
      v7 = self->_duration;
    v8 = v7;
    v9 = v8;
    v10 = v8 / duration;
    -[MPDetailSlider bounds](self, "bounds");
    if (vabdd_f64(1.0, v10) < 1.0 / v11)
      v10 = 1.0;
    -[MPDetailSlider layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "animationKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
      v15 = 196640;
    else
      v15 = 196644;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__MPDetailSlider__setValueWhileTracking_duration___block_invoke;
    v16[3] = &unk_1E31632A0;
    v17 = v10;
    v16[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v15, v16, 0, a4, 0.0);
    -[MPDetailSlider _updateForAvailableDuraton](self, "_updateForAvailableDuraton");
    -[MPDetailSlider _updateTimeDisplayForTime:](self, "_updateTimeDisplayForTime:", v9);
    if (self->_isTracking && self->_canCommit)
      -[MPDetailSlider _commitValue](self, "_commitValue");
  }
}

- (UIEdgeInsets)_thumbHitEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -19.0;
  v3 = -19.0;
  v4 = -19.0;
  v5 = -19.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)thumbHitRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  uint64_t v20;
  CGRect v21;

  -[MPDetailSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MPDetailSlider bounds](self, "bounds");
  -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[MPDetailSlider value](self, "value");
  LODWORD(v20) = v19;
  -[MPDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v16, v18, v20);
  return CGRectInset(v21, -19.0, -19.0);
}

- (void)detailScrubController:(id)a3 didChangeScrubSpeed:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "detailSlider:didChangeScrubSpeed:", self, a4);

}

- (void)detailScrubController:(id)a3 didChangeValue:(float)a4
{
  -[MPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:", a3);
  -[MPDetailSlider _commitValue](self, "_commitValue");
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  MPDetailScrubController *scrubController;
  id v7;
  BOOL v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id WeakRetained;
  CGPoint v15;
  CGRect v16;

  scrubController = self->_scrubController;
  v7 = a3;
  v8 = -[MPDetailScrubController beginTrackingWithTouch:withEvent:](scrubController, "beginTrackingWithTouch:withEvent:", v7, a4);
  objc_msgSend(v7, "locationInView:", self);
  v10 = v9;
  v12 = v11;

  -[MPDetailSlider thumbHitRect](self, "thumbHitRect");
  v15.x = v10;
  v15.y = v12;
  if (CGRectContainsPoint(v16, v15))
  {
    self->_isTracking = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "detailSliderTrackingDidBegin:", self);

  }
  return v8;
}

- (void)_autoscrubTick:(id)a3
{
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  CGRect v25;
  CGRect v26;

  -[MPDetailSlider maximumValue](self, "maximumValue", a3);
  v5 = v4;
  -[MPDetailSlider minimumValue](self, "minimumValue");
  v7 = (float)(v5 - v6);
  -[MPDetailSlider bounds](self, "bounds");
  -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  v8 = v7 / CGRectGetWidth(v25);
  -[MPDetailScrubController scaleForVerticalPosition:](self->_scrubController, "scaleForVerticalPosition:", self->_previousLocationInView.y);
  v10 = v9;
  v11 = v8 * v9;
  -[MPDetailSlider window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v12, self->_previousLocationInView.x, self->_previousLocationInView.y);
  v14 = v13;
  -[MPDetailSlider window](self, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  if (v14 >= CGRectGetMidX(v26))
    v16 = v11;
  else
    v16 = -(v8 * v10);
  v17 = v16;

  self->_canCommit = 1;
  -[MPDetailSlider minimumValue](self, "minimumValue");
  v19 = v18;
  -[MPDetailSlider maximumValue](self, "maximumValue");
  v21 = v20;
  -[MPDetailSlider value](self, "value");
  v23 = v22 + v17;
  if (v21 < v23)
    v23 = v21;
  if (v19 >= v23)
    v23 = v19;
  v24 = self->_duration * v23;
  *(float *)&v24 = v24;
  -[MPDetailSlider setValue:animated:](self, "setValue:animated:", 0, v24);
  if (-[MPDetailSlider isContinuous](self, "isContinuous"))
    -[MPDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 autoscrubActive;
  unint64_t v18;
  uint64_t v19;
  double Width;
  _BOOL4 v24;
  UIImageView *thumbImageView;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  float v32;
  double v33;
  NSTimer *v34;
  NSTimer *autoscrubTimer;
  BOOL v36;
  void *v37;
  NSTimer *v38;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  if (-[MPDetailScrubController detailedScrubbingEnabled](self->_scrubController, "detailedScrubbingEnabled")
    && -[MPDetailScrubController durationAllowsForDetailedScrubbing](self->_scrubController, "durationAllowsForDetailedScrubbing"))
  {
    -[MPDetailSlider window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v12, v9, v11);
    v14 = v13;
    v16 = v15;
    autoscrubActive = self->_autoscrubActive;
    v18 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "statusBarOrientation") - 3;
    if (v18 < 2)
      v14 = v16;
    objc_msgSend(v12, "bounds");
    if (v18 > 1)
    {
      Width = CGRectGetWidth(*(CGRect *)&v19);
      if (v12)
      {
LABEL_7:
        v24 = v14 < 20.0;
        Width = Width + -20.0;
        if (v14 > Width)
          v24 = 1;
        self->_autoscrubActive = v24;
        if (v24)
        {
          thumbImageView = self->_thumbImageView;
          -[MPDetailSlider currentThumbImage](self, "currentThumbImage");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](thumbImageView, "setImage:", v26);

          if (!autoscrubActive)
          {
            objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v28) = 0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setToValue:", v29);

            objc_msgSend(v27, "setDuration:", 0.25);
            LODWORD(v30) = 2139095039;
            objc_msgSend(v27, "setRepeatCount:", v30);
            objc_msgSend(v27, "setAutoreverses:", 1);
            -[UIImageView layer](self->_glowDetailScrubImageView, "layer");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addAnimation:forKey:", v27, CFSTR("pulseAnimation"));

          }
          -[MPDetailSlider value](self, "value");
          v33 = self->_duration * v32;
          *(float *)&v33 = v33;
          -[MPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:", v33, 0.0);
          if (-[MPDetailSlider isContinuous](self, "isContinuous"))
            -[MPDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
          if (!self->_autoscrubTimer)
          {
            objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__autoscrubTick_, 0, 1, 0.1);
            v34 = (NSTimer *)objc_claimAutoreleasedReturnValue();
            autoscrubTimer = self->_autoscrubTimer;
            self->_autoscrubTimer = v34;

          }
          self->_previousLocationInView.x = v9;
          self->_previousLocationInView.y = v11;

          v36 = 1;
          goto LABEL_25;
        }
        goto LABEL_19;
      }
    }
    else
    {
      Width = CGRectGetHeight(*(CGRect *)&v19);
      if (v12)
        goto LABEL_7;
    }
    self->_autoscrubActive = 0;
LABEL_19:
    if (self->_autoscrubTimer)
    {
      -[UIImageView layer](self->_glowDetailScrubImageView, "layer", Width);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "removeAnimationForKey:", CFSTR("pulseAnimation"));

      -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");
      v38 = self->_autoscrubTimer;
      self->_autoscrubTimer = 0;

    }
  }
  if (-[MPDetailSlider isContinuous](self, "isContinuous"))
    -[MPDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  v36 = -[MPDetailScrubController continueTrackingWithTouch:withEvent:](self->_scrubController, "continueTrackingWithTouch:withEvent:", v6, v7);
LABEL_25:

  return v36;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  NSTimer *autoscrubTimer;
  id v7;
  id v8;
  NSTimer *v9;
  id WeakRetained;

  autoscrubTimer = self->_autoscrubTimer;
  v7 = a4;
  v8 = a3;
  -[NSTimer invalidate](autoscrubTimer, "invalidate");
  v9 = self->_autoscrubTimer;
  self->_autoscrubTimer = 0;

  self->_autoscrubActive = 0;
  self->_isTracking = 0;
  -[MPDetailSlider _resetScrubInfo](self, "_resetScrubInfo");
  -[MPDetailScrubController endTrackingWithTouch:withEvent:](self->_scrubController, "endTrackingWithTouch:withEvent:", v8, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "detailSliderTrackingDidEnd:", self);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  -[MPDetailScrubController cancelTrackingWithEvent:](self->_scrubController, "cancelTrackingWithEvent:", a3);
  -[MPDetailSlider cancelTracking](self, "cancelTracking");
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (BOOL)allowsDetailScrubbing
{
  return -[MPDetailScrubController detailedScrubbingEnabled](self->_scrubController, "detailedScrubbingEnabled");
}

- (BOOL)detailScrubbingAvailableForCurrentDuration
{
  return -[MPDetailScrubController durationAllowsForDetailedScrubbing](self->_scrubController, "durationAllowsForDetailedScrubbing");
}

- (void)cancelTracking
{
  NSTimer *autoscrubTimer;
  _BOOL4 isTracking;
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;

  -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");
  autoscrubTimer = self->_autoscrubTimer;
  self->_autoscrubTimer = 0;

  self->_autoscrubActive = 0;
  isTracking = self->_isTracking;
  self->_isTracking = 0;
  -[MPDetailSlider _resetScrubInfo](self, "_resetScrubInfo");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (isTracking)
  {
    v8 = WeakRetained;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "detailSliderTrackingDidCancel:", self);
      v6 = v8;
    }
  }

}

- (NSString)localizedScrubSpeedText
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  switch(-[MPDetailScrubController currentScrubSpeed](self->_scrubController, "currentScrubSpeed"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("HI_SPEED_SCRUBBING");
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("HALF_SPEED_SCRUBBING");
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("QUARTER_SPEED_SCRUBBING");
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FINE_SCRUBBING");
LABEL_7:
      objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E3163D10, CFSTR("MediaPlayer"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v5 = 0;
      break;
  }
  return (NSString *)v5;
}

- (void)setAllowsScrubbing:(BOOL)a3
{
  if (self->_allowsScrubbing != a3)
  {
    self->_allowsScrubbing = a3;
    if (self->_style == 5)
    {
      -[MPDetailSlider _setupControlsForStyle](self, "_setupControlsForStyle");
      *(_QWORD *)&a3 = self->_allowsScrubbing;
    }
    -[MPDetailSlider setUserInteractionEnabled:](self, "setUserInteractionEnabled:", a3);
  }
}

- (void)setAllowsDetailScrubbing:(BOOL)a3
{
  -[MPDetailScrubController setDetailedScrubbingEnabled:](self->_scrubController, "setDetailedScrubbingEnabled:", a3);
}

- (void)setAvailableDuration:(double)duration
{
  if (self->_duration <= duration)
    duration = self->_duration;
  if (vabdd_f64(duration, self->_availableDuration) > 2.22044605e-16)
  {
    self->_availableDuration = duration;
    -[MPDetailSlider _updateForAvailableDuraton](self, "_updateForAvailableDuraton");
  }
}

- (void)setDuration:(double)a3
{
  double currentTime;
  double v5;
  CGRect v6;

  if (vabdd_f64(self->_duration, a3) > 2.22044605e-16)
  {
    self->_duration = a3;
    -[MPDetailScrubController setDuration:](self->_scrubController, "setDuration:");
    currentTime = self->_currentTime;
    if (currentTime >= self->_duration)
      currentTime = self->_duration;
    self->_currentTime = fmax(currentTime, 0.0);
    -[MPDetailSlider frame](self, "frame");
    if (!CGRectIsEmpty(v6))
      -[MPDetailSlider layoutSubviews](self, "layoutSubviews");
    v5 = self->_currentTime;
    *(float *)&v5 = v5;
    -[MPDetailSlider setValue:animated:](self, "setValue:animated:", 0, v5);
    -[MPDetailSlider setAvailableDuration:](self, "setAvailableDuration:", self->_duration);
    -[MPDetailSlider _updateTimeDisplayForTime:force:](self, "_updateTimeDisplayForTime:force:", 1, self->_currentTime);
  }
}

- (void)setMinTimeLabelWidth:(double)a3
{
  if (self->_minTimeLabelWidth != a3)
  {
    self->_minTimeLabelWidth = a3;
    -[MPDetailSlider _updateTrackInset](self, "_updateTrackInset");
    -[MPDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTimeLabelStyle:(int64_t)a3
{
  if (self->_timeLabelStyle != a3)
  {
    self->_timeLabelStyle = a3;
    -[MPDetailSlider _setupControlsForStyle](self, "_setupControlsForStyle");
    -[MPDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)timeLabelFontForStyle:(int64_t)a3
{
  int64_t style;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  style = self->_style;
  if ((unint64_t)(style - 1) < 2)
  {
    v6 = (void *)MEMORY[0x1E0DC37E8];
    v7 = 12.0;
  }
  else
  {
    if ((unint64_t)(style - 3) < 2)
    {
      v4 = (void *)MEMORY[0x1E0DC37E8];
      v5 = 13.0;
LABEL_9:
      objc_msgSend(v4, "boldSystemFontOfSize:", a3, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (style != 5)
    {
      v4 = (void *)MEMORY[0x1E0DC37E8];
      v5 = 14.0;
      goto LABEL_9;
    }
    v6 = (void *)MEMORY[0x1E0DC37E8];
    v7 = 10.0;
  }
  objc_msgSend(v6, "systemFontOfSize:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = v8;
  objc_msgSend(v8, "fontDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0DC4A28];
  v12 = *MEMORY[0x1E0DC4A48];
  v22[0] = *MEMORY[0x1E0DC4A58];
  v11 = v22[0];
  v22[1] = v12;
  v23[0] = &unk_1E31E49F0;
  v23[1] = &unk_1E31E4A08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v20[0] = v11;
  v20[1] = v12;
  v21[0] = &unk_1E31E4A20;
  v21[1] = &unk_1E31E4A38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptorByAddingAttributes:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v17, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)timeLabelTextColorForStyle:(int64_t)a3
{
  if ((unint64_t)(self->_style - 3) > 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor", a3);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", a3, 1.0, 0.45);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_modernThumbImageWithColor:(id)a3 height:(double)a4 includeShadow:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGContext *CurrentContext;
  id v16;
  CGColor *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  CGSize v26;
  CGSize v27;

  v5 = a5;
  v8 = a3;
  -[MPDetailSlider traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  if (v10 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;
    v26.width = 6.0;
    v26.height = a4 + 4.0;
    UIGraphicsBeginImageContextWithOptions(v26, 0, v13);

  }
  else
  {
    v14 = v10;
    v27.width = 6.0;
    v27.height = a4 + 4.0;
    UIGraphicsBeginImageContextWithOptions(v27, 0, v14);
  }

  if (v5)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (CGColor *)objc_msgSend(v16, "CGColor");
    CGContextSetShadowWithColor(CurrentContext, *MEMORY[0x1E0C9D820], 2.0, v17);

  }
  objc_msgSend(v8, "setFill");
  -[MPDetailSlider traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayScale");
  v20 = 1.0 / v19;
  if (1.0 / v19 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scale");
    v20 = v22;

  }
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 2.0, 2.0, v20 + 1.0, a4, 3.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fill");

  UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v24;
}

- (id)_colorSliceImageWithColor:(id)a3 height:(double)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  CGSize v17;
  CGSize v18;
  CGRect v19;

  v6 = a3;
  objc_msgSend(v6, "alphaComponent");
  v8 = 1.0 - v7;
  -[MPDetailSlider traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  if (v10 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", 0.00000011920929);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;
    v17.width = 1.0;
    v17.height = a4;
    UIGraphicsBeginImageContextWithOptions(v17, v8 <= 0.00000011920929, v13);

  }
  else
  {
    v14 = v10;
    v18.width = 1.0;
    v18.height = a4;
    UIGraphicsBeginImageContextWithOptions(v18, v8 <= 0.00000011920929, v14);
  }

  objc_msgSend(v6, "setFill");
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = 1.0;
  v19.size.height = a4;
  UIRectFillUsingBlendMode(v19, kCGBlendModeCopy);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v15;
}

- (void)_setupControlsForStyle
{
  void *v3;
  char v4;
  int64_t style;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD block[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  CGSize v33;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_timeLabelStyle == 3)
  {
    v33.width = 1.0;
    v33.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v33, 0, 0.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[MPDetailSlider setThumbImage:forState:](self, "setThumbImage:forState:", v3, 0);

    v4 = 1;
  }
  else
  {
    if (self->_style == 5)
      -[MPDetailSlider duration](self, "duration");
    v4 = 0;
  }
  style = self->_style;
  if ((unint64_t)(style - 1) < 2)
  {
    v11 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__MPDetailSlider__setupControlsForStyle__block_invoke_3;
    block[3] = &unk_1E3163508;
    v12 = v24;
    v28 = v12;
    if (_setupControlsForStyle___trackImageOnce_78 == -1)
    {
      if ((v4 & 1) == 0)
      {
LABEL_16:
        v25[0] = v11;
        v25[1] = 3221225472;
        v25[2] = __40__MPDetailSlider__setupControlsForStyle__block_invoke_4;
        v25[3] = &unk_1E3163508;
        v13 = v12;
        v26 = v13;
        if (_setupControlsForStyle___thumbImageOnce_80 == -1)
        {
          v14 = v13;
        }
        else
        {
          dispatch_once(&_setupControlsForStyle___thumbImageOnce_80, v25);
          v14 = v26;
        }
        -[MPDetailSlider setThumbImage:forState:](self, "setThumbImage:forState:", _setupControlsForStyle___thumbImage_79, 0);

      }
    }
    else
    {
      dispatch_once(&_setupControlsForStyle___trackImageOnce_78, block);
      if ((v4 & 1) == 0)
        goto LABEL_16;
    }
    -[MPDetailSlider setMinimumTrackImage:forState:](self, "setMinimumTrackImage:forState:", _setupControlsForStyle___minTrackImage_76, 0);
    -[MPDetailSlider setMaximumTrackImage:forState:](self, "setMaximumTrackImage:forState:", _setupControlsForStyle___maxTrackImage_77, 0);
    v10 = v28;
    goto LABEL_30;
  }
  if ((unint64_t)(style - 3) < 2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __40__MPDetailSlider__setupControlsForStyle__block_invoke;
    v31[3] = &unk_1E3163508;
    v7 = v24;
    v32 = v7;
    if (_setupControlsForStyle___trackImageOnce == -1)
    {
      if ((v4 & 1) == 0)
      {
LABEL_10:
        v29[0] = v6;
        v29[1] = 3221225472;
        v29[2] = __40__MPDetailSlider__setupControlsForStyle__block_invoke_2;
        v29[3] = &unk_1E3163508;
        v8 = v7;
        v30 = v8;
        if (_setupControlsForStyle___thumbImageOnce == -1)
        {
          v9 = v8;
        }
        else
        {
          dispatch_once(&_setupControlsForStyle___thumbImageOnce, v29);
          v9 = v30;
        }
        -[MPDetailSlider setThumbImage:forState:](self, "setThumbImage:forState:", _setupControlsForStyle___thumbImage, 0);

      }
    }
    else
    {
      dispatch_once(&_setupControlsForStyle___trackImageOnce, v31);
      if ((v4 & 1) == 0)
        goto LABEL_10;
    }
    -[MPDetailSlider setMinimumTrackImage:forState:](self, "setMinimumTrackImage:forState:", _setupControlsForStyle___minTrackImage, 0);
    -[MPDetailSlider setMaximumTrackImage:forState:](self, "setMaximumTrackImage:forState:", _setupControlsForStyle___maxTrackImage, 0);
    v10 = v32;
LABEL_30:

    goto LABEL_31;
  }
  if (style == 5)
  {
    if ((v4 & 1) == 0)
    {
      v15 = -[MPDetailSlider allowsScrubbing](self, "allowsScrubbing");
      if (v15)
      {
        -[MPDetailSlider tintColor](self, "tintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 15.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 7.0;
      }
      -[MPDetailSlider _modernThumbImageWithColor:height:includeShadow:](self, "_modernThumbImageWithColor:height:includeShadow:", v16, v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPDetailSlider setThumbImage:forState:](self, "setThumbImage:forState:", v18, 0);

    }
    -[MPDetailSlider traitCollection](self, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "userInterfaceStyle") == 2)
    {
      v20 = 0.93;
      v21 = 1.0;
    }
    else
    {
      v20 = 0.07;
      v21 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v21, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPDetailSlider _colorSliceImageWithColor:height:](self, "_colorSliceImageWithColor:height:", v10, 7.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPDetailSlider _colorSliceImageWithColor:height:](self, "_colorSliceImageWithColor:height:", v10, 7.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPDetailSlider setMinimumTrackImage:forState:](self, "setMinimumTrackImage:forState:", v22, 0);
    -[MPDetailSlider setMaximumTrackImage:forState:](self, "setMaximumTrackImage:forState:", v23, 0);

    goto LABEL_30;
  }
LABEL_31:

}

- (void)_updateTrackInset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  int64_t timeLabelStyle;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double minTimeLabelWidth;
  double Width;
  double maxTrackWidth;
  float v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  -[MPDetailSlider duration](self, "duration");
  -[MPDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_currentTimeInverseLabel, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_legacy_sizeWithFont:", v4);
  v6 = v5;

  timeLabelStyle = self->_timeLabelStyle;
  if ((timeLabelStyle & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LIVE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_currentTimeInverseLabel, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_legacy_sizeWithFont:", v10);
    v12 = v11;

    if (v6 < v12)
      v6 = v12;
    timeLabelStyle = self->_timeLabelStyle;
  }
  v13 = 0.0;
  if (timeLabelStyle != 1)
  {
    minTimeLabelWidth = self->_minTimeLabelWidth;
    if (minTimeLabelWidth < v6)
      minTimeLabelWidth = v6;
    v13 = minTimeLabelWidth + 4.0;
  }
  self->_trackInset = v13;
  if (self->_maxTrackWidth > 0.0)
  {
    -[MPDetailSlider bounds](self, "bounds");
    v18.receiver = self;
    v18.super_class = (Class)MPDetailSlider;
    -[MPDetailSlider trackRectForBounds:](&v18, sel_trackRectForBounds_);
    v20 = CGRectInset(v19, self->_trackInset, 0.0);
    Width = CGRectGetWidth(v20);
    maxTrackWidth = self->_maxTrackWidth;
    if (Width > maxTrackWidth)
    {
      v17 = (Width - maxTrackWidth) * 0.5;
      self->_trackInset = self->_trackInset + ceilf(v17);
    }
  }
}

- (void)_updateTimeDisplayForTime:(double)a3
{
  -[MPDetailSlider _updateTimeDisplayForTime:force:](self, "_updateTimeDisplayForTime:force:", 0, a3);
}

- (void)_updateTimeDisplayForTime:(double)a3 force:(BOOL)a4
{
  double v5;
  UILabel *currentTimeLabel;
  void *v7;
  UILabel *currentTimeInverseLabel;
  void *v9;

  v5 = floor(a3);
  if (a4 || vabdd_f64(self->_currentTime, v5) > 2.22044605e-16)
  {
    if (self->_timeLabelStyle != 1)
    {
      currentTimeLabel = self->_currentTimeLabel;
      -[MPDetailSlider _stringForCurrentTime:](self, "_stringForCurrentTime:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](currentTimeLabel, "setText:", v7);

      currentTimeInverseLabel = self->_currentTimeInverseLabel;
      -[MPDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:", self->_duration - v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](currentTimeInverseLabel, "setText:", v9);

      -[MPDetailSlider setNeedsLayout](self, "setNeedsLayout");
    }
    self->_currentTime = v5;
  }
}

- (id)_stringForTime:(double)a3 elapsed:(BOOL)a4
{
  AVTimeFormatter *formatter;
  uint64_t v7;

  formatter = self->_formatter;
  if (a4)
    v7 = 1;
  else
    v7 = 2;
  -[AVTimeFormatter setStyle:](formatter, "setStyle:", v7);
  return (id)-[AVTimeFormatter stringFromSeconds:](self->_formatter, "stringFromSeconds:", a3);
}

- (id)_stringForCurrentTime:(double)a3
{
  int64_t timeLabelStyle;
  void *v4;
  void *v5;

  timeLabelStyle = self->_timeLabelStyle;
  if (timeLabelStyle == 3 || timeLabelStyle == 2 && vabdd_f64(self->_duration, a3) < 30.0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_DURATION"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MPDetailSlider _stringForTime:elapsed:](self, "_stringForTime:elapsed:", 1, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_stringForInverseCurrentTime:(double)a3
{
  int64_t timeLabelStyle;
  void *v4;
  void *v5;

  timeLabelStyle = self->_timeLabelStyle;
  if (timeLabelStyle == 3 || timeLabelStyle == 2 && fabs(a3) < 30.0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LIVE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MPDetailSlider _stringForTime:elapsed:](self, "_stringForTime:elapsed:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_resetScrubInfo
{
  UIImageView *thumbImageView;
  void *v4;
  id v5;

  thumbImageView = self->_thumbImageView;
  -[MPDetailSlider currentThumbImage](self, "currentThumbImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](thumbImageView, "setImage:", v4);

  -[UIImageView layer](self->_glowDetailScrubImageView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("pulseAnimation"));

}

- (void)_commitValue
{
  float v3;
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPDetailSlider value](self, "value");
    v4 = self->_duration * v3;
    *(float *)&v4 = v4;
    objc_msgSend(WeakRetained, "detailSlider:didChangeValue:", self, v4);
  }

}

- (void)_updateForAvailableDuraton
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t style;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double MidX;
  double v31;
  CGFloat v32;
  CGFloat MinX;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIView *downloadingTrackOverlay;
  id v39;
  UIView *v40;
  UIView *v41;
  UIView *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  int v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  UIView *v78;
  UIView *v79;
  UIView *v80;
  void *v81;
  UIView *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  -[MPDetailSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!self->_thumbImageView)
  {
    -[MPDetailSlider setNeedsLayout](self, "setNeedsLayout");
    -[MPDetailSlider layoutIfNeeded](self, "layoutIfNeeded");
  }
  v88.origin.x = v4;
  v88.origin.y = v6;
  v88.size.width = v8;
  v88.size.height = v10;
  if (CGRectGetWidth(v88) <= 0.0)
    return;
  style = self->_style;
  if ((unint64_t)(style - 1) >= 2)
  {
    if ((unint64_t)(style - 3) > 1)
      return;
    if (self->_availableDuration < self->_duration)
    {
      -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[MPDetailSlider value](self, "value");
      LODWORD(v87) = v20;
      -[MPDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v13, v15, v17, v19, v87);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v89.origin.x = v13;
      v89.origin.y = v15;
      v89.size.width = v17;
      v89.size.height = v19;
      v29 = -CGRectGetMinX(v89);
      v90.origin.x = v22;
      v90.origin.y = v24;
      v90.size.width = v26;
      v90.size.height = v28;
      v91 = CGRectOffset(v90, v29, 0.0);
      MidX = CGRectGetMidX(v91);
      v31 = self->_availableDuration / self->_duration;
      v92.origin.x = v13;
      v92.origin.y = v15;
      v92.size.width = v17;
      v92.size.height = v19;
      v32 = -(MidX - v31 * CGRectGetWidth(v92));
      v93.origin.x = v13;
      v93.origin.y = v15;
      v93.size.width = v17;
      v93.size.height = v19;
      MinX = CGRectGetMinX(v93);
      v94.origin.x = MidX;
      v94.origin.y = v15;
      v94.size.width = v32;
      v94.size.height = v19;
      v95 = CGRectOffset(v94, MinX, 0.0);
      x = v95.origin.x;
      if (v95.size.width >= 0.00000011920929)
      {
        y = v95.origin.y;
        width = v95.size.width;
        height = v95.size.height;
        downloadingTrackOverlay = self->_downloadingTrackOverlay;
        if (!downloadingTrackOverlay)
        {
          if (self->_thumbImageView)
          {
            v39 = objc_alloc(MEMORY[0x1E0DC3F10]);
            v40 = (UIView *)objc_msgSend(v39, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
            v41 = self->_downloadingTrackOverlay;
            self->_downloadingTrackOverlay = v40;

            -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](self->_downloadingTrackOverlay, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
            v42 = self->_downloadingTrackOverlay;
            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.05);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setBackgroundColor:](v42, "setBackgroundColor:", v43);

            -[MPDetailSlider insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_downloadingTrackOverlay, self->_thumbImageView);
            downloadingTrackOverlay = self->_downloadingTrackOverlay;
          }
          else
          {
            downloadingTrackOverlay = 0;
          }
        }
        v83 = x;
        v84 = y;
        v85 = width;
        v86 = height;
LABEL_22:
        -[UIView setFrame:](downloadingTrackOverlay, "setFrame:", v83, v84, v85, v86);
        return;
      }
      return;
    }
LABEL_17:
    -[MPDetailSlider _setupControlsForStyle](self, "_setupControlsForStyle");
    -[UIView removeFromSuperview](self->_downloadingTrackOverlay, "removeFromSuperview");
    v82 = self->_downloadingTrackOverlay;
    self->_downloadingTrackOverlay = 0;

    return;
  }
  if (self->_availableDuration >= self->_duration)
    goto LABEL_17;
  -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[MPDetailSlider value](self, "value");
  LODWORD(v87) = v52;
  -[MPDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v45, v47, v49, v51, v87);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v96.origin.x = v45;
  v96.origin.y = v47;
  v96.size.width = v49;
  v96.size.height = v51;
  v61 = -CGRectGetMinX(v96);
  v97.origin.x = v54;
  v97.origin.y = v56;
  v97.size.width = v58;
  v97.size.height = v60;
  v98 = CGRectOffset(v97, v61, 0.0);
  v62 = CGRectGetMidX(v98);
  v63 = self->_availableDuration / self->_duration;
  v99.origin.x = v45;
  v99.origin.y = v47;
  v99.size.width = v49;
  v99.size.height = v51;
  v64 = -(v62 - v63 * CGRectGetWidth(v99));
  v100.origin.x = v45;
  v100.origin.y = v47;
  v100.size.width = v49;
  v100.size.height = v51;
  v65 = CGRectGetMinX(v100);
  v101.size.height = 1.0;
  v101.origin.x = v62;
  v101.origin.y = v47 + 1.0;
  v101.size.width = v64;
  v102 = CGRectOffset(v101, v65, 0.0);
  v66 = v102.origin.x;
  if (v102.size.width >= 0.00000011920929)
  {
    v67 = v102.origin.y;
    v68 = v102.size.width;
    v69 = v102.size.height;
    downloadingTrackOverlay = self->_downloadingTrackOverlay;
    if (!downloadingTrackOverlay)
    {
      if (self->_thumbImageView)
      {
        v70 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "imageNamed:inBundle:", CFSTR("VideoPlayer_Slider_Track_Hollow"), v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "_flatImageWithColor:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPDetailSlider setMaximumTrackImage:forState:](self, "setMaximumTrackImage:forState:", v74, 0);
        -[MPDetailSlider _maxTrackView](self, "_maxTrackView");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "_setDrawsAsBackdropOverlay:", 1);

        -[MPDetailSlider _maxTrackView](self, "_maxTrackView");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setAlpha:", 0.4);

        v77 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v78 = (UIView *)objc_msgSend(v77, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v79 = self->_downloadingTrackOverlay;
        self->_downloadingTrackOverlay = v78;

        -[UIView _setDrawsAsBackdropOverlay:](self->_downloadingTrackOverlay, "_setDrawsAsBackdropOverlay:", 1);
        v80 = self->_downloadingTrackOverlay;
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v80, "setBackgroundColor:", v81);

        -[UIView setAlpha:](self->_downloadingTrackOverlay, "setAlpha:", 0.4);
        -[MPDetailSlider insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_downloadingTrackOverlay, self->_thumbImageView);

        downloadingTrackOverlay = self->_downloadingTrackOverlay;
      }
      else
      {
        downloadingTrackOverlay = 0;
      }
    }
    v83 = v66;
    v84 = v67;
    v85 = v68;
    v86 = v69;
    goto LABEL_22;
  }
}

- (MPDetailSliderDelegate)delegate
{
  return (MPDetailSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsScrubbing
{
  return self->_allowsScrubbing;
}

- (double)detailScrubbingVerticalRange
{
  return self->_detailScrubbingVerticalRange;
}

- (void)setDetailScrubbingVerticalRange:(double)a3
{
  self->_detailScrubbingVerticalRange = a3;
}

- (double)duration
{
  return self->_duration;
}

- (double)availableDuration
{
  return self->_availableDuration;
}

- (int64_t)timeLabelStyle
{
  return self->_timeLabelStyle;
}

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_thumbImageView, 0);
  objc_storeStrong((id *)&self->_glowDetailScrubImageView, 0);
  objc_storeStrong((id *)&self->_downloadingTrackOverlay, 0);
  objc_storeStrong((id *)&self->_autoscrubTimer, 0);
  objc_storeStrong((id *)&self->_scrubController, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);
  objc_storeStrong((id *)&self->_currentTimeInverseLabel, 0);
}

void __40__MPDetailSlider__setupControlsForStyle__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("VideoPlayer_Slider_Track"), *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.35);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_flatImageWithColor:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_setupControlsForStyle___minTrackImage;
  _setupControlsForStyle___minTrackImage = v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.05);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_flatImageWithColor:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_setupControlsForStyle___maxTrackImage;
  _setupControlsForStyle___maxTrackImage = v5;

}

void __40__MPDetailSlider__setupControlsForStyle__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("VideoPlayer_Slider_Thumb_Small"), *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_setupControlsForStyle___thumbImage;
  _setupControlsForStyle___thumbImage = v1;

  v3 = (void *)_setupControlsForStyle___thumbImage;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_flatImageWithColor:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_setupControlsForStyle___thumbImage;
  _setupControlsForStyle___thumbImage = v5;

  v7 = (void *)_setupControlsForStyle___thumbImage;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithEtchedBorderOfColor:radius:", v8, 0.5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_setupControlsForStyle___thumbImage;
  _setupControlsForStyle___thumbImage = v9;

  v14 = objc_alloc_init(MEMORY[0x1E0DC33C0]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowColor:", v11);

  objc_msgSend(v14, "setShadowBlurRadius:", 2.0);
  objc_msgSend(v14, "setShadowOffset:", 0.0, 2.0);
  objc_msgSend((id)_setupControlsForStyle___thumbImage, "imageWithShadow:", v14);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_setupControlsForStyle___thumbImage;
  _setupControlsForStyle___thumbImage = v12;

}

void __40__MPDetailSlider__setupControlsForStyle__block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("VideoPlayer_Slider_Track"), *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_flatImageWithColor:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_setupControlsForStyle___minTrackImage_76;
  _setupControlsForStyle___minTrackImage_76 = v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_flatImageWithColor:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_setupControlsForStyle___maxTrackImage_77;
  _setupControlsForStyle___maxTrackImage_77 = v5;

}

void __40__MPDetailSlider__setupControlsForStyle__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("VideoPlayer_Slider_Thumb"), *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_setupControlsForStyle___thumbImage_79;
  _setupControlsForStyle___thumbImage_79 = v1;

  v3 = (void *)_setupControlsForStyle___thumbImage_79;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_flatImageWithColor:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_setupControlsForStyle___thumbImage_79;
  _setupControlsForStyle___thumbImage_79 = v5;

  v7 = (void *)_setupControlsForStyle___thumbImage_79;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithEtchedBorderOfColor:radius:", v8, 0.5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_setupControlsForStyle___thumbImage_79;
  _setupControlsForStyle___thumbImage_79 = v9;

  v14 = objc_alloc_init(MEMORY[0x1E0DC33C0]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowColor:", v11);

  objc_msgSend(v14, "setShadowBlurRadius:", 2.0);
  objc_msgSend(v14, "setShadowOffset:", 0.0, 2.0);
  objc_msgSend((id)_setupControlsForStyle___thumbImage_79, "imageWithShadow:", v14);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_setupControlsForStyle___thumbImage_79;
  _setupControlsForStyle___thumbImage_79 = v12;

}

uint64_t __50__MPDetailSlider__setValueWhileTracking_duration___block_invoke(uint64_t a1, double a2)
{
  objc_super v4;

  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)MPDetailSlider;
  objc_msgSendSuper2(&v4, sel_setValue_animated_, 0, a2);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

+ (Class)labelClass
{
  return (Class)objc_opt_class();
}

@end
