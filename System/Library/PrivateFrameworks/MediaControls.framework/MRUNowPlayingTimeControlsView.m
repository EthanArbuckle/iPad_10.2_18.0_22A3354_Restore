@implementation MRUNowPlayingTimeControlsView

- (MRUNowPlayingTimeControlsView)initWithFrame:(CGRect)a3
{
  MRUNowPlayingTimeControlsView *v3;
  MRUNowPlayingTimeControlsView *v4;
  MRUSlider *v5;
  MRUSlider *slider;
  UILabel *v7;
  UILabel *elapsedTimeLabel;
  UILabel *v9;
  UILabel *remainingTimeLabel;
  UILabel *v11;
  UILabel *liveLabel;
  CAGradientLayer *v13;
  CAGradientLayer *liveBackgroundMask;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  UIView *v22;
  UIView *liveBackground;
  CAGradientLayer *v24;
  void *v25;
  AVTimeFormatter *v26;
  AVTimeFormatter *elapsedTimeFormatter;
  AVTimeFormatter *v28;
  AVTimeFormatter *remainingTimeFormatter;
  uint64_t v30;
  NSRegularExpression *regexNumberDecimalDigit;
  void *v32;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;
  _QWORD v38[7];

  v38[6] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)MRUNowPlayingTimeControlsView;
  v3 = -[MRUNowPlayingTimeControlsView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_sliderHeight = 7.0;
    v5 = objc_alloc_init(MRUSlider);
    slider = v4->_slider;
    v4->_slider = v5;

    -[MRUSlider setHitRectInset:](v4->_slider, "setHitRectInset:", -24.0, -24.0, -24.0, -24.0);
    -[MRUSlider setExpansionFactor:](v4->_slider, "setExpansionFactor:", 1.71428571);
    -[MRUSlider setStretchLimit:](v4->_slider, "setStretchLimit:", 8.0);
    -[MRUSlider setSemanticContentAttribute:](v4->_slider, "setSemanticContentAttribute:", 3);
    objc_initWeak(&location, v4);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __47__MRUNowPlayingTimeControlsView_initWithFrame___block_invoke;
    v34[3] = &unk_1E58196D8;
    objc_copyWeak(&v35, &location);
    -[MRUSlider setAnimations:](v4->_slider, "setAnimations:", v34);
    -[MRUSlider addTarget:action:forControlEvents:](v4->_slider, "addTarget:action:forControlEvents:", v4, sel_sliderTouchDown_, 1);
    -[MRUSlider addTarget:action:forControlEvents:](v4->_slider, "addTarget:action:forControlEvents:", v4, sel_sliderValueChanged_, 4544);
    -[MRUSlider addTarget:action:forControlEvents:](v4->_slider, "addTarget:action:forControlEvents:", v4, sel_sliderTouchCancel_, 256);
    -[MRUNowPlayingTimeControlsView addSubview:](v4, "addSubview:", v4->_slider);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    elapsedTimeLabel = v4->_elapsedTimeLabel;
    v4->_elapsedTimeLabel = v7;

    -[MRUNowPlayingTimeControlsView addSubview:](v4, "addSubview:", v4->_elapsedTimeLabel);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    remainingTimeLabel = v4->_remainingTimeLabel;
    v4->_remainingTimeLabel = v9;

    -[MRUNowPlayingTimeControlsView addSubview:](v4, "addSubview:", v4->_remainingTimeLabel);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    liveLabel = v4->_liveLabel;
    v4->_liveLabel = v11;

    -[MRUNowPlayingTimeControlsView addSubview:](v4, "addSubview:", v4->_liveLabel);
    v13 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    liveBackgroundMask = v4->_liveBackgroundMask;
    v4->_liveBackgroundMask = v13;

    -[CAGradientLayer setStartPoint:](v4->_liveBackgroundMask, "setStartPoint:", 0.0, 0.0);
    -[CAGradientLayer setEndPoint:](v4->_liveBackgroundMask, "setEndPoint:", 1.0, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38[0] = objc_msgSend(v15, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38[1] = objc_msgSend(v16, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38[2] = objc_msgSend(v17, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38[3] = objc_msgSend(v18, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38[4] = objc_msgSend(v19, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38[5] = objc_msgSend(v20, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v4->_liveBackgroundMask, "setColors:", v21);

    v22 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    liveBackground = v4->_liveBackground;
    v4->_liveBackground = v22;

    v24 = v4->_liveBackgroundMask;
    -[UIView layer](v4->_liveBackground, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMask:", v24);

    -[MRUNowPlayingTimeControlsView addSubview:](v4, "addSubview:", v4->_liveBackground);
    v26 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E0C8B3A8]);
    elapsedTimeFormatter = v4->_elapsedTimeFormatter;
    v4->_elapsedTimeFormatter = v26;

    -[AVTimeFormatter setStyle:](v4->_elapsedTimeFormatter, "setStyle:", 1);
    v28 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E0C8B3A8]);
    remainingTimeFormatter = v4->_remainingTimeFormatter;
    v4->_remainingTimeFormatter = v28;

    -[AVTimeFormatter setStyle:](v4->_remainingTimeFormatter, "setStyle:", 2);
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\d"), 0, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    regexNumberDecimalDigit = v4->_regexNumberDecimalDigit;
    v4->_regexNumberDecimalDigit = (NSRegularExpression *)v30;

    v4->_contentScale = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v4, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUNowPlayingTimeControlsView updateContentSizeCategory](v4, "updateContentSizeCategory");
    -[MRUNowPlayingTimeControlsView updateVisibility](v4, "updateVisibility");
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __47__MRUNowPlayingTimeControlsView_initWithFrame___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateVisualStyling");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "layoutTimeLabels");

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int64_t layout;
  double v13;
  double v14;
  double sliderHeight;
  CGFloat MinY;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *remainingTimeLabel;
  void *v48;
  uint64_t v49;
  double v50;
  double v51;
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
  void *v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  double MaxX;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  double Width;
  double MinX;
  double v91;
  CGFloat v92;
  objc_super v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
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

  v93.receiver = self;
  v93.super_class = (Class)MRUNowPlayingTimeControlsView;
  -[MRUNowPlayingTimeControlsView layoutSubviews](&v93, sel_layoutSubviews);
  if (-[MRUTimeControls isLive](self->_timeControls, "isLive"))
  {
    -[MRUNowPlayingTimeControlsView layoutSubviewsLive](self, "layoutSubviewsLive");
    return;
  }
  -[MRUNowPlayingTimeControlsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUNowPlayingTimeControlsView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  layout = self->_layout;
  if (layout == 4)
  {
    v96.origin.x = v4;
    v96.origin.y = v6;
    v96.size.width = v8;
    v96.size.height = v10;
    MinX = CGRectGetMinX(v96);
    v97.origin.x = v4;
    v97.origin.y = v6;
    v97.size.width = v8;
    v97.size.height = v10;
    MinY = CGRectGetMinY(v97);
    v98.origin.y = v6;
    v17 = MinY;
    v98.origin.x = v4;
    v98.size.width = v8;
    v98.size.height = v10;
    Width = CGRectGetWidth(v98);
    sliderHeight = self->_sliderHeight;
    -[MRUSlider setFrame:](self->_slider, "setFrame:", MinX, v17, Width, sliderHeight);
    v99.origin.x = MinX;
    v92 = v17;
    v99.origin.y = v17;
    v99.size.width = Width;
    v99.size.height = sliderHeight;
    CGRectGetMaxY(v99);
    UIRectInset();
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[UILabel sizeThatFits:](self->_elapsedTimeLabel, "sizeThatFits:", v22, v24);
    MRUSizeCeilToViewScale(self);
    v100.origin.x = v19;
    v100.origin.y = v21;
    v100.size.width = v23;
    v100.size.height = v25;
    CGRectGetMinY(v100);
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_elapsedTimeLabel, "setFrame:");
    -[UILabel sizeThatFits:](self->_remainingTimeLabel, "sizeThatFits:", v23, v25);
    MRUSizeCeilToViewScale(self);
    v26 = v19;
    v14 = Width;
    v101.origin.x = v26;
    v101.origin.y = v21;
    v101.size.width = v23;
    v101.size.height = v25;
    CGRectGetMaxX(v101);
    v102.origin.x = v26;
    v102.origin.y = v21;
    v102.size.width = v23;
    v102.size.height = v25;
    CGRectGetMinY(v102);
    v13 = MinX;
LABEL_9:
    UIRectIntegralWithScale();
    remainingTimeLabel = self->_remainingTimeLabel;
LABEL_15:
    objc_msgSend(remainingTimeLabel, "setFrame:", v43, v44, v45, v46, v85);
    goto LABEL_16;
  }
  if (layout == 3)
  {
    v103.origin.x = v4;
    v103.origin.y = v6;
    v103.size.width = v8;
    v103.size.height = v10;
    CGRectGetMinX(v103);
    v104.origin.x = v4;
    v104.origin.y = v6;
    v104.size.width = v8;
    v104.size.height = v10;
    CGRectGetWidth(v104);
    -[MRUNowPlayingTimeControlsView traitCollection](self, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "displayScale");
    v86 = v28;
    UIRectCenteredYInRectScale();
    v30 = v29;
    v91 = v29;
    v32 = v31;
    v14 = v33;
    sliderHeight = v34;

    -[MRUSlider setFrame:](self->_slider, "setFrame:", v30, v32, v14, sliderHeight, v86);
    v105.origin.x = v30;
    v92 = v32;
    v105.origin.y = v32;
    v105.size.width = v14;
    v105.size.height = sliderHeight;
    CGRectGetMaxY(v105);
    UIRectInset();
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    -[UILabel sizeThatFits:](self->_elapsedTimeLabel, "sizeThatFits:", v39, v41);
    MRUSizeCeilToViewScale(self);
    v106.origin.x = v36;
    v106.origin.y = v38;
    v106.size.width = v40;
    v106.size.height = v42;
    CGRectGetMinY(v106);
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_elapsedTimeLabel, "setFrame:");
    -[UILabel sizeThatFits:](self->_remainingTimeLabel, "sizeThatFits:", v40, v42);
    MRUSizeCeilToViewScale(self);
    v107.origin.x = v36;
    v107.origin.y = v38;
    v107.size.width = v40;
    v107.size.height = v42;
    CGRectGetMaxX(v107);
    v108.origin.x = v36;
    v108.origin.y = v38;
    v108.size.width = v40;
    v108.size.height = v42;
    CGRectGetMinY(v108);
    v13 = v91;
    goto LABEL_9;
  }
  if (layout != 2)
  {
    -[UILabel sizeThatFits:](self->_elapsedTimeLabel, "sizeThatFits:", v8, v10);
    MRUSizeCeilToViewScale(self);
    -[MRUNowPlayingTimeControlsView traitCollection](self, "traitCollection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "displayScale");
    v87 = v49;
    UIRectCenteredYInRectScale();
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;

    -[UILabel setFrame:](self->_elapsedTimeLabel, "setFrame:", v51, v53, v55, v57, v87);
    if ((-[UILabel isHidden](self->_elapsedTimeLabel, "isHidden") & 1) == 0)
    {
      v109.origin.x = v51;
      v109.origin.y = v53;
      v109.size.width = v55;
      v109.size.height = v57;
      CGRectGetWidth(v109);
      UIRectInset();
      v4 = v58;
      v6 = v59;
      v8 = v60;
      v10 = v61;
    }
    -[UILabel sizeThatFits:](self->_remainingTimeLabel, "sizeThatFits:", v8, v10);
    MRUSizeCeilToViewScale(self);
    v110.origin.x = v4;
    v110.origin.y = v6;
    v110.size.width = v8;
    v110.size.height = v10;
    CGRectGetMaxX(v110);
    -[MRUNowPlayingTimeControlsView traitCollection](self, "traitCollection");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "displayScale");
    v88 = v63;
    UIRectCenteredYInRectScale();
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v71 = v70;

    -[UILabel setFrame:](self->_remainingTimeLabel, "setFrame:", v65, v67, v69, v71, v88);
    if ((-[UILabel isHidden](self->_remainingTimeLabel, "isHidden") & 1) == 0)
    {
      v111.origin.x = v65;
      v111.origin.y = v67;
      v111.size.width = v69;
      v111.size.height = v71;
      CGRectGetWidth(v111);
      UIRectInset();
      v4 = v72;
      v6 = v73;
      v8 = v74;
      v10 = v75;
    }
    v112.origin.x = v4;
    v112.origin.y = v6;
    v112.size.width = v8;
    v112.size.height = v10;
    CGRectGetMinX(v112);
    v113.origin.x = v4;
    v113.origin.y = v6;
    v113.size.width = v8;
    v113.size.height = v10;
    CGRectGetWidth(v113);
    -[MRUNowPlayingTimeControlsView traitCollection](self, "traitCollection");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "displayScale");
    v85 = v77;
    UIRectCenteredYInRectScale();
    v13 = v78;
    v80 = v79;
    v14 = v81;
    sliderHeight = v82;

    remainingTimeLabel = self->_slider;
    v43 = v13;
    v92 = v80;
    v44 = v80;
    v45 = v14;
    v46 = sliderHeight;
    goto LABEL_15;
  }
  v94.origin.x = v4;
  v94.origin.y = v6;
  v94.size.width = v8;
  v94.size.height = v10;
  v13 = CGRectGetMinX(v94);
  v95.origin.x = v4;
  v95.origin.y = v6;
  v95.size.width = v8;
  v95.size.height = v10;
  v14 = CGRectGetWidth(v95);
  sliderHeight = self->_sliderHeight;
  v92 = 0.0;
  -[MRUSlider setFrame:](self->_slider, "setFrame:", v13, 0.0, v14, sliderHeight);
  -[MRUNowPlayingTimeControlsView layoutTimeLabels](self, "layoutTimeLabels");
LABEL_16:
  v114.origin.x = v13;
  v114.origin.y = v92;
  v114.size.width = v14;
  v114.size.height = sliderHeight;
  v83 = -CGRectGetMinX(v114);
  v115.origin.x = v13;
  v115.origin.y = v92;
  v115.size.width = v14;
  v115.size.height = sliderHeight;
  MaxX = CGRectGetMaxX(v115);
  -[MRUNowPlayingTimeControlsView bounds](self, "bounds");
  -[MRUSlider setHitRectInset:](self->_slider, "setHitRectInset:", -24.0, v83, -24.0, MaxX - CGRectGetWidth(v116));
}

- (void)layoutSubviewsLive
{
  CGFloat width;
  CGFloat height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGFloat x;
  CGFloat y;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[MRUNowPlayingTimeControlsView bounds](self, "bounds");
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v28 = CGRectInset(v27, 20.0, 0.0);
  -[UILabel sizeThatFits:](self->_liveLabel, "sizeThatFits:", v28.size.width, v28.size.height);
  UIRectGetCenter();
  -[MRUNowPlayingTimeControlsView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  UIRectCenteredAboutPointScale();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[UILabel setFrame:](self->_liveLabel, "setFrame:", v7, v9, v11, v13);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGRectGetWidth(v29);
  -[MRUNowPlayingTimeControlsView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  v24 = v15;
  UIRectCenteredYInRectScale();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[UIView setFrame:](self->_liveBackground, "setFrame:", v17, v19, v21, v23, v24);
  v30.origin.x = v17;
  v30.origin.y = v19;
  v30.size.width = v21;
  v30.size.height = v23;
  -[UIView _setContinuousCornerRadius:](self->_liveBackground, "_setContinuousCornerRadius:", CGRectGetHeight(v30) * 0.5);
  -[MRUNowPlayingTimeControlsView updateBackgroundMask](self, "updateBackgroundMask");
}

- (void)layoutTimeLabels
{
  double v3;
  double sliderHeight;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
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
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  if (self->_layout == 2)
  {
    v3 = 0.0;
    if (-[MRUSlider isTracking](self->_slider, "isTracking"))
    {
      sliderHeight = self->_sliderHeight;
      -[MRUSlider expansionFactor](self->_slider, "expansionFactor");
      v3 = -(self->_sliderHeight - sliderHeight * v5) * 0.5;
    }
    -[MRUNowPlayingTimeControlsView bounds](self, "bounds");
    -[MRUSlider frame](self->_slider, "frame");
    UIRectInset();
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UILabel sizeThatFits:](self->_elapsedTimeLabel, "sizeThatFits:", v10, v12);
    v32 = MRUSizeCeilToViewScale(self);
    v33 = v14;
    v15 = v14;
    v36.origin.x = v7;
    v36.origin.y = v9;
    v36.size.width = v11;
    v36.size.height = v13;
    v16 = v3;
    v17 = v3 + CGRectGetMinY(v36);
    -[UILabel bounds](self->_elapsedTimeLabel, "bounds");
    v34 = v18;
    v35 = v19;
    -[UILabel setFrame:](self->_elapsedTimeLabel, "setFrame:", 0.0, v17, v32, v15);
    -[UILabel sizeThatFits:](self->_remainingTimeLabel, "sizeThatFits:", v11, v13);
    v20 = MRUSizeCeilToViewScale(self);
    v22 = v21;
    v37.origin.x = v7;
    v37.origin.y = v9;
    v37.size.width = v11;
    v37.size.height = v13;
    v23 = CGRectGetMaxX(v37) - v20;
    v38.origin.x = v7;
    v38.origin.y = v9;
    v38.size.width = v11;
    v38.size.height = v13;
    v24 = v16 + CGRectGetMinY(v38);
    -[UILabel bounds](self->_remainingTimeLabel, "bounds");
    v26 = v25;
    v28 = v27;
    -[UILabel setFrame:](self->_remainingTimeLabel, "setFrame:", v23, v24, v20, v22);
    if (v34 != v32 || v35 != v33 || v26 != v20 || v28 != v22)
      -[MRUNowPlayingTimeControlsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", v35);
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  if (self->_layout == 2)
  {
    -[UILabel intrinsicContentSize](self->_elapsedTimeLabel, "intrinsicContentSize");
    MRUSizeCeilToViewScale(self);
    v4 = v3 + self->_sliderHeight + 6.0;
    v5 = 0.0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MRUNowPlayingTimeControlsView;
    -[MRUNowPlayingTimeControlsView intrinsicContentSize](&v6, sel_intrinsicContentSize);
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  int64_t layout;
  double contentScale;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  layout = self->_layout;
  if (layout == 4)
  {
    contentScale = self->_contentScale;
    v6 = 28.0;
LABEL_9:
    v7 = contentScale * v6;
    goto LABEL_10;
  }
  if (layout != 2)
  {
    if (layout == 1)
      contentScale = 24.0;
    else
      contentScale = 44.0;
    v6 = self->_contentScale;
    goto LABEL_9;
  }
  -[MRUNowPlayingTimeControlsView intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
LABEL_10:
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (id)viewForLastBaselineLayout
{
  objc_super v3;

  if (self->_layout == 2)
    return self->_elapsedTimeLabel;
  v3.receiver = self;
  v3.super_class = (Class)MRUNowPlayingTimeControlsView;
  -[MRUNowPlayingTimeControlsView viewForLastBaselineLayout](&v3, sel_viewForLastBaselineLayout);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTimeControls:(id)a3 forPresentationInterval:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_storeStrong((id *)&self->_timeControls, a3);
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "startTime");
  *(float *)&v9 = v9;
  -[MRUSlider setMinimumValue:](self->_slider, "setMinimumValue:", v9);
  objc_msgSend(v7, "duration");
  *(float *)&v10 = v10;
  -[MRUSlider setMaximumValue:](self->_slider, "setMaximumValue:", v10);
  v11 = objc_msgSend(v7, "scrubbable");
  -[MRUNowPlayingTimeControlsView slider](self, "slider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", v11);

  v13 = objc_msgSend(v7, "isEnabled");
  -[MRUNowPlayingTimeControlsView slider](self, "slider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMinimumTrackVisible:", v13);

  objc_msgSend(v7, "liveText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingTimeControlsView liveLabel](self, "liveLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(v8, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingTimeControlsView updateElapsedTimeForDate:](self, "updateElapsedTimeForDate:", v17);
  -[MRUNowPlayingTimeControlsView updateDisplayLinkPaused](self, "updateDisplayLinkPaused");
  -[MRUNowPlayingTimeControlsView updateVisibility](self, "updateVisibility");
  -[MRUNowPlayingTimeControlsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTimeControls:(id)a3
{
  -[MRUNowPlayingTimeControlsView setTimeControls:forPresentationInterval:](self, "setTimeControls:forPresentationInterval:", a3, 0);
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  v7 = v5;
  if (stylingProvider != v5)
  {
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUSlider setStylingProvider:](self->_slider, "setStylingProvider:", v7);
    -[MRUNowPlayingTimeControlsView updateVisualStyling](self, "updateVisualStyling");
  }

}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRUNowPlayingTimeControlsView updateDisplayLink](self, "updateDisplayLink");
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUSlider setDimmed:](self->_slider, "setDimmed:");
    -[MRUNowPlayingTimeControlsView updateVisualStyling](self, "updateVisualStyling");
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUNowPlayingTimeControlsView updateContentSizeCategory](self, "updateContentSizeCategory");
    -[MRUSlider setStretchLimit:](self->_slider, "setStretchLimit:", MRUNowPlayingTimeControlsStretchLimit(a3));
    -[MRUNowPlayingTimeControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLeftAlignLive:(BOOL)a3
{
  if (self->_leftAlignLive != a3)
  {
    self->_leftAlignLive = a3;
    -[MRUNowPlayingTimeControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSliderHeight:(double)a3
{
  if (self->_sliderHeight != a3)
  {
    self->_sliderHeight = a3;
    -[MRUNowPlayingTimeControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSliderExpansionFactor:(double)a3
{
  if (self->_sliderExpansionFactor != a3)
  {
    self->_sliderExpansionFactor = a3;
    -[MRUSlider setExpansionFactor:](self->_slider, "setExpansionFactor:");
    -[MRUNowPlayingTimeControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUNowPlayingTimeControlsView updateContentSizeCategory](self, "updateContentSizeCategory");
  }
}

- (void)sliderValueChanged:(id)a3
{
  float v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "value");
  -[MRUNowPlayingTimeControlsView updateElapsedTimeWithElapsedTime:](self, "updateElapsedTimeWithElapsedTime:", v4);
  if (self->_layout != 2)
    -[MRUNowPlayingTimeControlsView layoutIfNeeded](self, "layoutIfNeeded");
  if ((objc_msgSend(v5, "isTracking") & 1) == 0)
    -[MRUNowPlayingTimeControlsView updateElapsedTimeWithThrottle](self, "updateElapsedTimeWithThrottle");

}

- (void)sliderTouchCancel:(id)a3
{
  -[MRUNowPlayingTimeControlsView updateDisplayLinkPaused](self, "updateDisplayLinkPaused", a3);
  -[MRUNowPlayingTimeControlsView updateElapsedTime](self, "updateElapsedTime");
}

- (CGRect)hitRect
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
  double v19;
  double v20;
  double v21;
  objc_super v22;
  objc_super v23;
  CGRect result;

  if (self->_layout == 2)
  {
    v23.receiver = self;
    v23.super_class = (Class)MRUNowPlayingTimeControlsView;
    -[MRUNowPlayingTimeControlsView hitRect](&v23, sel_hitRect);
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[MRUSlider hitRectInset](self->_slider, "hitRectInset");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = v4 + v13;
    v18 = v6 + v12;
    v20 = v8 - (v14 + v19);
    v21 = v10 - (v12 + v16);
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)MRUNowPlayingTimeControlsView;
    -[MRUNowPlayingTimeControlsView hitRect](&v22, sel_hitRect);
  }
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[MRUNowPlayingTimeControlsView hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (double)accessibilityTotalDuration
{
  double result;

  -[MRUTimeControls duration](self->_timeControls, "duration");
  return result;
}

- (double)accessibilityElapsedDuration
{
  double result;

  -[MRUTimeControls elapsedTime](self->_timeControls, "elapsedTime");
  return result;
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (void)updateVisualStyling
{
  int64_t v3;
  void *v4;
  void *v5;

  -[MRUVisualStylingProvider applyBlendModeToView:](self->_stylingProvider, "applyBlendModeToView:", self->_elapsedTimeLabel);
  -[MRUVisualStylingProvider applyBlendModeToView:](self->_stylingProvider, "applyBlendModeToView:", self->_remainingTimeLabel);
  v3 = -[MRUNowPlayingTimeControlsView labelStyle](self, "labelStyle");
  -[MRUVisualStylingProvider blendColorForStyle:](self->_stylingProvider, "blendColorForStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_elapsedTimeLabel, "setTextColor:", v4);

  -[MRUVisualStylingProvider blendColorForStyle:](self->_stylingProvider, "blendColorForStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_remainingTimeLabel, "setTextColor:", v5);

  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", v3, self->_liveLabel);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 3, self->_liveBackground);
}

- (int64_t)labelStyle
{
  if ((-[MRUSlider isTracking](self->_slider, "isTracking") & 1) != 0)
    return 0;
  if (self->_dimmed)
    return 2;
  return 1;
}

- (double)timeLabelsAlpha
{
  char v3;
  double result;

  v3 = -[MRUSlider isTracking](self->_slider, "isTracking");
  result = 1.0;
  if ((v3 & 1) == 0 && !self->_dimmed && self->_layout == 2)
    return 0.5;
  return result;
}

- (void)updateDisplayLink
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  CADisplayLink *v5;
  CADisplayLink *v6;
  void *v7;
  void *v8;
  CADisplayLink *v9;

  displayLink = self->_displayLink;
  if (self->_onScreen)
  {
    if (!displayLink)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_updateElapsedTimeOnDisplayLinkTick_);
      v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v5 = self->_displayLink;
      self->_displayLink = v4;

      -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 30);
      v6 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

      -[MRUNowPlayingTimeControlsView updateDisplayLinkPaused](self, "updateDisplayLinkPaused");
    }
  }
  else if (displayLink)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink removeFromRunLoop:forMode:](displayLink, "removeFromRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v9 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)updateDisplayLinkPaused
{
  float v3;
  _BOOL8 v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  MRUTimeControls *timeControls;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  MRUTimeControls *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (-[MRUSlider isTracking](self->_slider, "isTracking") & 1) != 0
    || (-[MRUTimeControls rate](self->_timeControls, "rate"), v3 == 0.0)
    || !-[MRUTimeControls isEnabled](self->_timeControls, "isEnabled")
    || self->_timeControls == 0;
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v4);
  if (self->_debugPreviousDisplayLinkPaused != v4)
  {
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      v7 = -[MRUSlider isTracking](self->_slider, "isTracking");
      timeControls = self->_timeControls;
      v9 = 138543874;
      v10 = v6;
      v11 = 1024;
      v12 = v7;
      v13 = 2114;
      v14 = timeControls;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updateDisplayLinkPaused tracking: %{BOOL}u | time controls: %{public}@", (uint8_t *)&v9, 0x1Cu);
    }

    self->_debugPreviousDisplayLinkPaused = v4;
  }
}

- (void)updateElapsedTimeOnDisplayLinkTick:(id)a3
{
  -[MRUNowPlayingTimeControlsView updateElapsedTime](self, "updateElapsedTime", a3);
  -[MRUNowPlayingTimeControlsView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)updateElapsedTime
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingTimeControlsView updateElapsedTimeForDate:](self, "updateElapsedTimeForDate:", v3);

}

- (void)updateElapsedTimeForDate:(id)a3
{
  double v4;
  double v5;
  id v6;

  v6 = a3;
  if ((-[MRUSlider isTracking](self->_slider, "isTracking") & 1) == 0)
  {
    -[MRUTimeControls elapsedTimeForDate:](self->_timeControls, "elapsedTimeForDate:", v6);
    v5 = v4;
    *(float *)&v4 = v4;
    -[MRUSlider setValue:](self->_slider, "setValue:", v4);
    -[MRUNowPlayingTimeControlsView updateElapsedTimeWithElapsedTime:](self, "updateElapsedTimeWithElapsedTime:", v5);
  }

}

- (void)updateElapsedTimeWithElapsedTime:(double)a3
{
  double v5;
  AVTimeFormatter *remainingTimeFormatter;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[MRUTimeControls duration](self->_timeControls, "duration");
  if (v5 <= a3)
    a3 = v5;
  -[AVTimeFormatter stringFromSeconds:](self->_elapsedTimeFormatter, "stringFromSeconds:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  remainingTimeFormatter = self->_remainingTimeFormatter;
  -[MRUTimeControls duration](self->_timeControls, "duration");
  -[AVTimeFormatter stringFromSeconds:](remainingTimeFormatter, "stringFromSeconds:", v7 - a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dimmed || !-[MRUTimeControls isEnabled](self->_timeControls, "isEnabled"))
  {
    -[NSRegularExpression stringByReplacingMatchesInString:options:range:withTemplate:](self->_regexNumberDecimalDigit, "stringByReplacingMatchesInString:options:range:withTemplate:", v11, 0, 0, objc_msgSend(v11, "length"), CFSTR("–"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_elapsedTimeLabel, "setText:", v9);

    -[NSRegularExpression stringByReplacingMatchesInString:options:range:withTemplate:](self->_regexNumberDecimalDigit, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 0, 0, objc_msgSend(v8, "length"), CFSTR("–"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_remainingTimeLabel, "setText:", v10);

  }
  else
  {
    -[UILabel setText:](self->_elapsedTimeLabel, "setText:", v11);
    -[UILabel setText:](self->_remainingTimeLabel, "setText:", v8);
  }
  -[MRUNowPlayingTimeControlsView setNeedsLayout](self, "setNeedsLayout");

}

- (void)updateElapsedTimeWithThrottle
{
  MSVTimer *v3;
  MSVTimer *updateElapsedTimeThrottleTimer;
  _QWORD v5[5];

  -[MSVTimer invalidate](self->_updateElapsedTimeThrottleTimer, "invalidate");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__MRUNowPlayingTimeControlsView_updateElapsedTimeWithThrottle__block_invoke;
  v5[3] = &unk_1E5818C88;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D4D110], "timerWithInterval:repeats:block:", 0, v5, 0.05);
  v3 = (MSVTimer *)objc_claimAutoreleasedReturnValue();
  updateElapsedTimeThrottleTimer = self->_updateElapsedTimeThrottleTimer;
  self->_updateElapsedTimeThrottleTimer = v3;

}

uint64_t __62__MRUNowPlayingTimeControlsView_updateElapsedTimeWithThrottle__block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  double v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "updateDisplayLinkPaused");
  objc_msgSend(*(id *)(a1 + 32), "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "timeControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setElapsedTime:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "setUpdateElapsedTimeThrottleTimer:", 0);
}

- (void)updateBackgroundMask
{
  double v3;
  double MinX;
  double v5;
  double MaxX;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v13[5] = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self->_liveBackground, "bounds");
  -[CAGradientLayer setFrame:](self->_liveBackgroundMask, "setFrame:");
  -[UIView frame](self->_liveBackground, "frame");
  v3 = 20.0 / CGRectGetWidth(v14);
  -[UILabel frame](self->_liveLabel, "frame");
  MinX = CGRectGetMinX(v15);
  -[UIView frame](self->_liveBackground, "frame");
  v5 = MinX / CGRectGetWidth(v16);
  -[UILabel frame](self->_liveLabel, "frame");
  MaxX = CGRectGetMaxX(v17);
  -[UIView frame](self->_liveBackground, "frame");
  v7 = MaxX / CGRectGetWidth(v18);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 - v3, &unk_1E5878298);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3 + v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setLocations:](self->_liveBackgroundMask, "setLocations:", v12);

}

- (void)updateContentSizeCategory
{
  id v3;

  if (self->_layout == 2)
    objc_msgSend(MEMORY[0x1E0DC1350], "mru_ambientTimeFont");
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "mru_timeFontWithScale:", self->_contentScale);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_elapsedTimeLabel, "setFont:", v3);
  -[UILabel setFont:](self->_remainingTimeLabel, "setFont:", v3);
  -[UILabel setFont:](self->_liveLabel, "setFont:", v3);

}

- (void)updateVisibility
{
  _BOOL8 v3;
  uint64_t v4;

  v3 = -[MRUTimeControls isLive](self->_timeControls, "isLive");
  -[UILabel setHidden:](self->_elapsedTimeLabel, "setHidden:", v3);
  -[UILabel setHidden:](self->_remainingTimeLabel, "setHidden:", v3);
  -[MRUSlider setHidden:](self->_slider, "setHidden:", v3);
  v4 = v3 ^ 1;
  -[UILabel setHidden:](self->_liveLabel, "setHidden:", v4);
  -[UIView setHidden:](self->_liveBackground, "setHidden:", v4);
}

- (MRUTimeControls)timeControls
{
  return self->_timeControls;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)leftAlignLive
{
  return self->_leftAlignLive;
}

- (double)sliderHeight
{
  return self->_sliderHeight;
}

- (double)sliderExpansionFactor
{
  return self->_sliderExpansionFactor;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (UILabel)elapsedTimeLabel
{
  return self->_elapsedTimeLabel;
}

- (void)setElapsedTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeLabel, a3);
}

- (UILabel)remainingTimeLabel
{
  return self->_remainingTimeLabel;
}

- (void)setRemainingTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTimeLabel, a3);
}

- (UILabel)liveLabel
{
  return self->_liveLabel;
}

- (void)setLiveLabel:(id)a3
{
  objc_storeStrong((id *)&self->_liveLabel, a3);
}

- (UIView)liveBackground
{
  return self->_liveBackground;
}

- (void)setLiveBackground:(id)a3
{
  objc_storeStrong((id *)&self->_liveBackground, a3);
}

- (CAGradientLayer)liveBackgroundMask
{
  return self->_liveBackgroundMask;
}

- (void)setLiveBackgroundMask:(id)a3
{
  objc_storeStrong((id *)&self->_liveBackgroundMask, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (AVTimeFormatter)elapsedTimeFormatter
{
  return self->_elapsedTimeFormatter;
}

- (void)setElapsedTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeFormatter, a3);
}

- (AVTimeFormatter)remainingTimeFormatter
{
  return self->_remainingTimeFormatter;
}

- (void)setRemainingTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTimeFormatter, a3);
}

- (NSRegularExpression)regexNumberDecimalDigit
{
  return self->_regexNumberDecimalDigit;
}

- (void)setRegexNumberDecimalDigit:(id)a3
{
  objc_storeStrong((id *)&self->_regexNumberDecimalDigit, a3);
}

- (BOOL)debugPreviousDisplayLinkPaused
{
  return self->_debugPreviousDisplayLinkPaused;
}

- (void)setDebugPreviousDisplayLinkPaused:(BOOL)a3
{
  self->_debugPreviousDisplayLinkPaused = a3;
}

- (MSVTimer)updateElapsedTimeThrottleTimer
{
  return self->_updateElapsedTimeThrottleTimer;
}

- (void)setUpdateElapsedTimeThrottleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateElapsedTimeThrottleTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateElapsedTimeThrottleTimer, 0);
  objc_storeStrong((id *)&self->_regexNumberDecimalDigit, 0);
  objc_storeStrong((id *)&self->_remainingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedTimeFormatter, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_liveBackgroundMask, 0);
  objc_storeStrong((id *)&self->_liveBackground, 0);
  objc_storeStrong((id *)&self->_liveLabel, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabel, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_timeControls, 0);
}

@end
