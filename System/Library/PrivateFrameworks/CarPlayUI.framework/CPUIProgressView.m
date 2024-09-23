@implementation CPUIProgressView

- (CPUIProgressView)initWithFrame:(CGRect)a3
{
  return -[CPUIProgressView initWithFrame:progressBarHeight:labelHeight:labelStyle:](self, "initWithFrame:progressBarHeight:labelHeight:labelStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 6.0, 12.0);
}

- (CPUIProgressView)initWithFrame:(CGRect)a3 progressBarHeight:(double)a4 labelHeight:(double)a5 labelStyle:(unint64_t)a6
{
  CPUIProgressView *v9;
  CPUIProgressView *v10;
  CPUIProgressBarView *v11;
  uint64_t v12;
  CPUIProgressBarView *progressBarView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CPUIProgressView;
  v9 = -[CPUIProgressView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_labelStyle = a6;
    v9->_progressBarViewHeight = a4;
    v9->_progressLabelHeight = a5;
    v11 = [CPUIProgressBarView alloc];
    v12 = -[CPUIProgressBarView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    progressBarView = v10->_progressBarView;
    v10->_progressBarView = (CPUIProgressBarView *)v12;

    -[CPUIProgressBarView setTranslatesAutoresizingMaskIntoConstraints:](v10->_progressBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIProgressBarView setHidden:](v10->_progressBarView, "setHidden:", 1);
    -[CPUIProgressView addSubview:](v10, "addSubview:", v10->_progressBarView);
    -[CPUIProgressView layer](v10, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCreatesCompositingGroup:", 1);

    -[CPUIProgressView layer](v10, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupBlending:", 1);

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView layer](v10, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCompositingFilter:", v16);

    -[CPUIProgressView setShowsProgressLabels:](v10, "setShowsProgressLabels:", 1);
  }
  return v10;
}

- (UIColor)trackColor
{
  return -[CPUIProgressBarView trackColor](self->_progressBarView, "trackColor");
}

- (void)setTrackColor:(id)a3
{
  -[CPUIProgressBarView setTrackColor:](self->_progressBarView, "setTrackColor:", a3);
}

- (UIColor)barColor
{
  return -[CPUIProgressBarView barColor](self->_progressBarView, "barColor");
}

- (void)setBarColor:(id)a3
{
  -[CPUIProgressBarView setBarColor:](self->_progressBarView, "setBarColor:", a3);
}

- (void)setShowsProgressLabels:(BOOL)a3
{
  unint64_t labelStyle;
  void *v5;
  id v6;
  UILabel *v7;
  UILabel *timeLabel;
  UILabel *v9;
  void *v10;
  id v11;
  UILabel *v12;
  UILabel *timeRemainingLabel;
  UILabel *v14;
  void *v15;
  id v16;
  UILabel *v17;
  UILabel *liveLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  _CPUILiveTrackView *v23;
  _CPUILiveTrackView *v24;
  _CPUILiveTrackView *liveTrackView;

  if (self->_showsProgressLabels != a3)
  {
    self->_showsProgressLabels = a3;
    if (a3)
    {
      labelStyle = self->_labelStyle;
      objc_msgSend(MEMORY[0x24BDF6A70], "monospacedDigitSystemFontOfSize:weight:", self->_progressLabelHeight, *MEMORY[0x24BDF7888]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_timeLabel)
      {
        v6 = objc_alloc(MEMORY[0x24BDF6B68]);
        -[CPUIProgressView bounds](self, "bounds");
        v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:");
        timeLabel = self->_timeLabel;
        self->_timeLabel = v7;

        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_timeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UILabel setFont:](self->_timeLabel, "setFont:", v5);
        v9 = self->_timeLabel;
        if (labelStyle == 1)
          objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
        else
          objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v9, "setTextColor:", v10);

        -[UILabel setTextAlignment:](self->_timeLabel, "setTextAlignment:", 1);
        -[UILabel setAccessibilityIdentifier:](self->_timeLabel, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingProgressBarTime"));
      }
      if (!self->_timeRemainingLabel)
      {
        v11 = objc_alloc(MEMORY[0x24BDF6B68]);
        -[CPUIProgressView bounds](self, "bounds");
        v12 = (UILabel *)objc_msgSend(v11, "initWithFrame:");
        timeRemainingLabel = self->_timeRemainingLabel;
        self->_timeRemainingLabel = v12;

        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_timeRemainingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UILabel setFont:](self->_timeRemainingLabel, "setFont:", v5);
        -[UILabel setTextAlignment:](self->_timeRemainingLabel, "setTextAlignment:", 1);
        v14 = self->_timeRemainingLabel;
        if (labelStyle == 1)
          objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
        else
          objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v14, "setTextColor:", v15);

        -[UILabel setAccessibilityIdentifier:](self->_timeRemainingLabel, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingProgressBarTimeRemaining"));
      }
      if (!self->_liveLabel)
      {
        v16 = objc_alloc(MEMORY[0x24BDF6B68]);
        v17 = (UILabel *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        liveLabel = self->_liveLabel;
        self->_liveLabel = v17;

        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_liveLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v19 = self->_liveLabel;
        if (labelStyle == 1)
          objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
        else
          objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v19, "setFont:", v20);

        -[UILabel setTextAlignment:](self->_liveLabel, "setTextAlignment:", 1);
        v21 = self->_liveLabel;
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v21, "setTextColor:", v22);

        -[UILabel setHidden:](self->_liveLabel, "setHidden:", 1);
        -[UILabel setAccessibilityIdentifier:](self->_liveLabel, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingProgressBarLive"));
      }
      if (!self->_liveTrackView)
      {
        v23 = [_CPUILiveTrackView alloc];
        v24 = -[_CPUILiveTrackView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        liveTrackView = self->_liveTrackView;
        self->_liveTrackView = v24;

        -[_CPUILiveTrackView setTranslatesAutoresizingMaskIntoConstraints:](self->_liveTrackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[_CPUILiveTrackView setHidden:](self->_liveTrackView, "setHidden:", 1);
        -[_CPUILiveTrackView setAccessibilityIdentifier:](self->_liveTrackView, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingProgressBarLiveTrackView"));
      }
      -[CPUIProgressView addSubview:](self, "addSubview:", self->_timeLabel);
      -[CPUIProgressView addSubview:](self, "addSubview:", self->_timeRemainingLabel);
      -[CPUIProgressView addSubview:](self, "addSubview:", self->_liveLabel);
      -[CPUIProgressView addSubview:](self, "addSubview:", self->_liveTrackView);

    }
    else
    {
      -[UILabel removeFromSuperview](self->_timeLabel, "removeFromSuperview");
      -[UILabel removeFromSuperview](self->_timeRemainingLabel, "removeFromSuperview");
      -[UILabel removeFromSuperview](self->_liveLabel, "removeFromSuperview");
      -[_CPUILiveTrackView removeFromSuperview](self->_liveTrackView, "removeFromSuperview");
    }
    -[CPUIProgressView setupConstraints](self, "setupConstraints");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double progressBarViewHeight;
  CGSize result;

  v2 = *MEMORY[0x24BDF7FB8];
  progressBarViewHeight = self->_progressBarViewHeight;
  result.height = progressBarViewHeight;
  result.width = v2;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  CADisplayLink *v6;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  void *v9;
  CADisplayLink *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CPUIProgressView;
  -[CPUIProgressView didMoveToWindow](&v11, sel_didMoveToWindow);
  -[CPUIProgressView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CPUIProgressView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayLinkWithTarget:selector:", self, sel__displayLinkTick_);
    v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v6;

    v8 = self->_displayLink;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x24BDBCB80]);

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 15);
  }
  else
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v10 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
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
  double v23;
  void *v24;
  void *v25;
  UILabel *timeLabel;
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
  NSArray *v46;
  NSArray *constraints;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
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
  _QWORD v73[3];
  _QWORD v74[6];
  _QWORD v75[5];
  _QWORD v76[4];
  _QWORD v77[6];

  v77[4] = *MEMORY[0x24BDAC8D0];
  if (self->_constraints)
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:");
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[CPUIProgressBarView heightAnchor](self->_progressBarView, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", self->_progressBarViewHeight);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0x24BDBC000uLL;
  if (-[CPUIProgressView showsProgressLabels](self, "showsProgressLabels"))
  {
    -[UILabel centerYAnchor](self->_liveLabel, "centerYAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView centerYAnchor](self, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v67);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v64;
    -[UILabel centerXAnchor](self->_liveLabel, "centerXAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView centerXAnchor](self, "centerXAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v59);
    v58 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v8;
    -[UILabel leftAnchor](self->_timeLabel, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView leftAnchor](self, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v11;
    -[UILabel rightAnchor](self->_timeRemainingLabel, "rightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView rightAnchor](self, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v15);

    -[_CPUILiveTrackView leadingAnchor](self->_liveTrackView, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView leadingAnchor](self, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v68);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v65;
    -[_CPUILiveTrackView trailingAnchor](self->_liveTrackView, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView trailingAnchor](self, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v17;
    -[_CPUILiveTrackView centerYAnchor](self->_liveTrackView, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView centerYAnchor](self, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v20;
    -[_CPUILiveTrackView heightAnchor](self->_liveTrackView, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = 6.0;
    if (self->_labelStyle == 1)
      v23 = 11.0;
    objc_msgSend(v21, "constraintEqualToConstant:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addObjectsFromArray:", v25);

    timeLabel = self->_timeLabel;
    if (self->_labelStyle)
    {
      -[UILabel topAnchor](timeLabel, "topAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressBarView bottomAnchor](self->_progressBarView, "bottomAnchor");
      v53 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:constant:", v53, 6.0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v72;
      -[UILabel leftAnchor](self->_timeLabel, "leftAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView leftAnchor](self, "leftAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v27;
      objc_msgSend(v27, "constraintEqualToAnchor:");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v63;
      -[UILabel topAnchor](self->_timeRemainingLabel, "topAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressBarView bottomAnchor](self->_progressBarView, "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", 6.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v74[2] = v28;
      -[CPUIProgressBarView topAnchor](self->_progressBarView, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView topAnchor](self, "topAnchor");
      v57 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v57);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v55;
      -[CPUIProgressBarView leftAnchor](self->_progressBarView, "leftAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView leftAnchor](self, "leftAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v74[4] = v31;
      -[CPUIProgressBarView rightAnchor](self->_progressBarView, "rightAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView rightAnchor](self, "rightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v74[5] = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v58;
      objc_msgSend(v58, "addObjectsFromArray:", v35);

      v36 = v49;
      v7 = 0x24BDBC000;

      v37 = (void *)v53;
      v38 = v51;

      v39 = (void *)v57;
    }
    else
    {
      -[UILabel centerYAnchor](timeLabel, "centerYAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIProgressView centerYAnchor](self, "centerYAnchor");
      v54 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v54);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v72;
      -[UILabel centerYAnchor](self->_timeRemainingLabel, "centerYAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel centerYAnchor](self->_timeLabel, "centerYAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v41;
      objc_msgSend(v41, "constraintEqualToAnchor:");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v63;
      -[CPUIProgressBarView centerYAnchor](self->_progressBarView, "centerYAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel centerYAnchor](self->_timeLabel, "centerYAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:constant:", 0.5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v28;
      -[CPUIProgressBarView leftAnchor](self->_progressBarView, "leftAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel rightAnchor](self->_timeLabel, "rightAnchor");
      v56 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v56, 4.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v75[3] = v50;
      -[CPUIProgressBarView rightAnchor](self->_progressBarView, "rightAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel leftAnchor](self->_timeRemainingLabel, "leftAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, -4.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v75[4] = v44;
      v7 = 0x24BDBC000uLL;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 5);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v58;
      objc_msgSend(v58, "addObjectsFromArray:", v45);

      v37 = (void *)v54;
      v38 = v52;

      v39 = (void *)v56;
    }

  }
  else
  {
    -[CPUIProgressBarView leadingAnchor](self->_progressBarView, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView leadingAnchor](self, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v72;
    -[CPUIProgressBarView trailingAnchor](self->_progressBarView, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView trailingAnchor](self, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v40;
    objc_msgSend(v40, "constraintEqualToAnchor:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v63;
    -[CPUIProgressBarView centerYAnchor](self->_progressBarView, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressView centerYAnchor](self, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v29);
  }

  objc_msgSend(*(id *)(v7 + 3632), "arrayWithArray:", v6);
  v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v46;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v6);
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  double v5;
  double Width;
  objc_super v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  v7.receiver = self;
  v7.super_class = (Class)CPUIProgressView;
  -[CPUIProgressView layoutSubviews](&v7, sel_layoutSubviews);
  -[UILabel invalidateIntrinsicContentSize](self->_timeLabel, "invalidateIntrinsicContentSize");
  -[UILabel invalidateIntrinsicContentSize](self->_timeRemainingLabel, "invalidateIntrinsicContentSize");
  -[UILabel invalidateIntrinsicContentSize](self->_liveLabel, "invalidateIntrinsicContentSize");
  -[_CPUILiveTrackView bounds](self->_liveTrackView, "bounds");
  v3 = CGRectGetHeight(v8) * 0.5;
  -[_CPUILiveTrackView layer](self->_liveTrackView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

  -[UILabel bounds](self->_liveLabel, "bounds");
  v5 = CGRectGetWidth(v9) + 8.0;
  -[_CPUILiveTrackView bounds](self->_liveTrackView, "bounds");
  Width = CGRectGetWidth(v10);
  if (Width < 1.0)
    Width = 1.0;
  -[_CPUILiveTrackView setErasedPercentage:](self->_liveTrackView, "setErasedPercentage:", v5 / Width);
}

- (void)updateLocalizedDurationString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  UILabel *liveLabel;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    CPUILocalizedStringForKey(CFSTR("LIVE_STREAMING"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  liveLabel = self->_liveLabel;
  objc_msgSend(v5, "localizedUppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](liveLabel, "setText:", v8);

}

- (void)setDurationSnapshot:(id *)a3
{
  NSObject *v5;
  double var3;
  double var4;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BOOL4 var7;
  double v12;
  double duration;
  double v14;
  _BOOL4 v15;
  BOOL v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  CarPlayUIGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    var3 = a3->var3;
    var4 = a3->var4;
    v20 = 134218240;
    v21 = var3;
    v22 = 2048;
    v23 = var4;
    _os_log_impl(&dword_21B6EC000, v5, OS_LOG_TYPE_DEFAULT, "Progress view set duration: %f, with elapsed duration: %f", (uint8_t *)&v20, 0x16u);
  }

  v9 = *(_OWORD *)&a3->var2;
  v8 = *(_OWORD *)&a3->var4;
  v10 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_durationSnapshot.isLiveContent = *(_QWORD *)&a3->var7;
  *(_OWORD *)&self->_durationSnapshot.endTime = v9;
  *(_OWORD *)&self->_durationSnapshot.elapsedDuration = v8;
  *(_OWORD *)&self->_durationSnapshot.snapshotTime = v10;
  var7 = a3->var7;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  duration = self->_durationSnapshot.elapsedDuration
           + (v12 - self->_durationSnapshot.snapshotTime) * self->_durationSnapshot.rate;
  if (duration >= self->_durationSnapshot.duration)
    duration = self->_durationSnapshot.duration;
  v14 = fmax(duration, 0.0);
  if (-[CPUIProgressView showsProgressLabels](self, "showsProgressLabels"))
    -[CPUIProgressView _updateLabelsForElapsedTime:duration:](self, "_updateLabelsForElapsedTime:duration:", v14, self->_durationSnapshot.duration);
  -[CPUIProgressView _updateProgressForElapsedTime:duration:](self, "_updateProgressForElapsedTime:duration:", v14, self->_durationSnapshot.duration);
  v15 = -[CPUIProgressView showsProgressLabels](self, "showsProgressLabels");
  v16 = !var7;
  v17 = !var7;
  v18 = !v16;
  v19 = !v16 || !v15;
  -[UILabel setHidden:](self->_timeLabel, "setHidden:", v19);
  -[UILabel setHidden:](self->_timeRemainingLabel, "setHidden:", v19);
  -[CPUIProgressBarView setHidden:](self->_progressBarView, "setHidden:", v18);
  -[UILabel setHidden:](self->_liveLabel, "setHidden:", v17);
  -[_CPUILiveTrackView setHidden:](self->_liveTrackView, "setHidden:", v17);
  -[CPUIProgressView setNeedsDisplay](self, "setNeedsDisplay");
  -[CPUIProgressView runUntilNextDisplayLinkEvent](self, "runUntilNextDisplayLinkEvent");
}

- (void)_displayLinkTick:(id)a3
{
  double v4;
  double v5;
  double duration;
  double v7;
  double v8;
  float rate;
  double v10;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate", a3);
  v5 = v4;
  duration = self->_durationSnapshot.elapsedDuration
           + (v4 - self->_durationSnapshot.snapshotTime) * self->_durationSnapshot.rate;
  if (duration >= self->_durationSnapshot.duration)
    duration = self->_durationSnapshot.duration;
  v7 = fmax(duration, 0.0);
  if (-[CPUIProgressView showsProgressLabels](self, "showsProgressLabels"))
  {
    v8 = v5 - self->_lastTargetTimestamp;
    if (v8 < 0.0)
      v8 = -v8;
    rate = self->_durationSnapshot.rate;
    if (rate < 0.0)
      rate = -rate;
    if (rate <= 1.0)
      v10 = 1.0;
    else
      v10 = 1.0 / rate;
    if (v8 >= v10)
    {
      self->_lastTargetTimestamp = v5;
      -[CPUIProgressView _updateLabelsForElapsedTime:duration:](self, "_updateLabelsForElapsedTime:duration:", v7, self->_durationSnapshot.duration);
    }
  }
  -[CPUIProgressView _updateProgressForElapsedTime:duration:](self, "_updateProgressForElapsedTime:duration:", v7, self->_durationSnapshot.duration);
  -[CPUIProgressView setNeedsLayout](self, "setNeedsLayout");
  -[CPUIProgressView pauseDisplayLinkIfNeeded](self, "pauseDisplayLinkIfNeeded");
}

- (void)_updateLabelsForElapsedTime:(double)a3 duration:(double)a4
{
  __CFString *v6;
  float v8;
  double v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  __CFString *v14;

  if (a4 <= 1.17549435e-38)
  {
    v6 = &stru_24DF24E68;
    v14 = &stru_24DF24E68;
    -[UILabel setText:](self->_timeLabel, "setText:", &stru_24DF24E68);
  }
  else
  {
    v8 = a3;
    CPUITimeDurationForSeconds(v8);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (a4 - a3 >= 0.0)
      v9 = a4 - a3;
    else
      v9 = 0.0;
    v10 = (void *)MEMORY[0x24BDD17C8];
    CPUILocalizedStringForKey(CFSTR("PROGRESS_TIME_WITH_NEGATIVE_PREFIX_%@"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    CPUITimeDurationForSeconds(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v13);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](self->_timeLabel, "setText:", v14);
  }
  -[UILabel setText:](self->_timeRemainingLabel, "setText:", v6);

}

- (void)_updateProgressForElapsedTime:(double)a3 duration:(double)a4
{
  double v4;
  CPUIProgressBarView *progressBarView;
  double v6;

  if (fabs(a4) <= 0.00000011920929)
  {
    progressBarView = self->_progressBarView;
    v6 = 0.0;
  }
  else
  {
    v4 = a3 / a4;
    progressBarView = self->_progressBarView;
    if (v4 < 0.0)
      v4 = 0.0;
    v6 = fmin(v4, 1.0);
  }
  -[CPUIProgressBarView setProgress:](progressBarView, "setProgress:", v6);
}

- (void)runUntilNextDisplayLinkEvent
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[CADisplayLink isPaused](self->_displayLink, "isPaused"))
  {
    CarPlayUIGeneralLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21B6EC000, v3, OS_LOG_TYPE_DEFAULT, "Progress view animation resumed", v4, 2u);
    }

    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
  }
}

- (void)pauseDisplayLinkIfNeeded
{
  $C569515C0D300436D1407EA97F52B47A *p_durationSnapshot;
  NSObject *v4;
  _BOOL8 v5;
  uint8_t v6[16];

  p_durationSnapshot = &self->_durationSnapshot;
  if ((fabsf(self->_durationSnapshot.rate) <= 0.00000011921 || self->_durationSnapshot.isLiveContent)
    && !-[CADisplayLink isPaused](self->_displayLink, "isPaused"))
  {
    CarPlayUIGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B6EC000, v4, OS_LOG_TYPE_DEFAULT, "Progress view animation paused", v6, 2u);
    }

    v5 = fabsf(p_durationSnapshot->rate) <= 0.00000011921 || p_durationSnapshot->isLiveContent;
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v5);
  }
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  __int128 v3;

  v3 = *(_OWORD *)&self[9].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[9].var1;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[9].var5;
  *(double *)&retstr->var7 = self[10].var0;
  return self;
}

- (BOOL)showsProgressLabels
{
  return self->_showsProgressLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_liveTrackView, 0);
  objc_storeStrong((id *)&self->_progressBarView, 0);
  objc_storeStrong((id *)&self->_liveLabel, 0);
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end
