@implementation AVMobileChromelessTimelineView

- (AVMobileChromelessTimelineView)initWithStyleSheet:(id)a3
{
  id v5;
  AVMobileChromelessTimelineView *v6;
  AVMobileChromelessTimelineView *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVMobileChromelessTimelineView;
  v6 = -[AVView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_overrideFluidSliderPreference = objc_msgSend(v8, "fluidSliderEnabled");

    -[AVMobileChromelessTimelineView _commonInit]((uint64_t)v7);
  }

  return v7;
}

- (AVMobileChromelessTimelineView)initWithUsingFluidSlider:(BOOL)a3
{
  AVMobileChromelessTimelineView *v4;
  AVMobileChromelessTimelineView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessTimelineView;
  v4 = -[AVView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_overrideFluidSliderPreference = a3;
    -[AVMobileChromelessTimelineView _commonInit]((uint64_t)v4);
  }
  return v5;
}

- (void)setLabelPosition:(unint64_t)a3
{
  if (self->_labelPosition != a3)
  {
    self->_labelPosition = a3;
    -[AVMobileChromelessTimelineView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLeadingTimeText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_leadingTimeText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_leadingTimeText, a3);
    -[AVLabel setText:](self->_leadingLabel, "setText:", self->_leadingTimeText);
    -[AVMobileChromelessTimelineView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setEmphasized:(BOOL)a3
{
  double v4;
  double v5;

  if (self->_emphasized != a3)
  {
    self->_emphasized = a3;
    if (-[AVMobileChromelessTimelineView isEmphasized](self, "isEmphasized"))
    {
      if (self->_labelPosition == 1)
        v4 = 0.0;
      else
        v4 = 1.0;
      v5 = 15.0;
    }
    else
    {
      v5 = 7.5;
      v4 = 1.0;
    }
    -[AVMobileChromelessSlider setBarHeight:](self->_slider, "setBarHeight:", v5);
    if (!self->_labelsAutoadjustWithSliderEmphasis)
    {
      -[AVLabel setAlpha:](self->_leadingLabel, "setAlpha:", v4);
      -[AVLabel setAlpha:](self->_trailingLabel, "setAlpha:", v4);
    }
    -[AVMobileChromelessTimelineView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStyleSheet:(id)a3
{
  AVMobileChromelessControlsStyleSheet *v5;
  AVMobileChromelessControlsStyleSheet *v6;

  v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  if (self->_styleSheet != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_styleSheet, a3);
    -[AVMobileChromelessTimelineView _updateFonts]((uint64_t)self);
    v5 = v6;
  }

}

- (void)setTrailingTimeText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_trailingTimeText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_trailingTimeText, a3);
    -[AVLabel setText:](self->_trailingLabel, "setText:", self->_trailingTimeText);
    -[AVMobileChromelessTimelineView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setLabelsExtendedDynamicRangeGain:(double)a3
{
  if (self->_labelsExtendedDynamicRangeGain != a3)
  {
    self->_labelsExtendedDynamicRangeGain = a3;
    -[UIView setAvkit_extendedDynamicRangeGain:](self->_trailingLabel, "setAvkit_extendedDynamicRangeGain:");
    -[UIView setAvkit_extendedDynamicRangeGain:](self->_leadingLabel, "setAvkit_extendedDynamicRangeGain:", self->_labelsExtendedDynamicRangeGain);
  }
}

- (void)setLabelsTextColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  UIColor *labelsTextColor;
  UIColor *v7;

  v4 = (UIColor *)a3;
  if (self->_labelsTextColor != v4)
  {
    v7 = v4;
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    labelsTextColor = self->_labelsTextColor;
    self->_labelsTextColor = v5;

    -[AVLabel setTextColor:](self->_trailingLabel, "setTextColor:", self->_labelsTextColor);
    -[AVLabel setTextColor:](self->_leadingLabel, "setTextColor:", self->_labelsTextColor);
    v4 = v7;
  }

}

- (void)setLabelsFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_labelsFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_labelsFont, a3);
    -[AVMobileChromelessTimelineView _updateFonts]((uint64_t)self);
    v5 = v6;
  }

}

- (void)setSliderExtendedDynamicRangeGain:(double)a3
{
  if (self->_sliderExtendedDynamicRangeGain != a3)
  {
    self->_sliderExtendedDynamicRangeGain = a3;
    -[UIView setAvkit_extendedDynamicRangeGain:](self->_slider, "setAvkit_extendedDynamicRangeGain:");
  }
}

- (void)prepareForDeemphasisIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  AVMobileChromelessTimelineView *v10;

  if (self->_overrideFluidSliderPreference
    || (+[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "fluidSliderEnabled"),
        v3,
        v4))
  {
    if (-[AVMobileChromelessTimelineView isEmphasized](self, "isEmphasized"))
    {
      -[AVMobileChromelessTimelineView fluidSlider](self, "fluidSlider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_removeAllRetargetableAnimations:", 0);
      v6 = (void *)MEMORY[0x1E0DC3F10];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __62__AVMobileChromelessTimelineView_prepareForDeemphasisIfNeeded__block_invoke;
      v8[3] = &unk_1E5BB3D20;
      v9 = v5;
      v10 = self;
      v7 = v5;
      objc_msgSend(v6, "performWithoutAnimation:", v8);

    }
  }
}

- (void)didMoveToWindow
{
  objc_class *v3;
  AVMobileChromelessSlider *v4;
  AVMobileChromelessSlider *slider;
  AVLabel *v6;
  AVLabel *trailingLabel;
  AVLabel *v8;
  void *v9;
  AVLabel *v10;
  void *v11;
  AVLabel *v12;
  AVLabel *leadingLabel;
  AVLabel *v14;
  void *v15;
  AVLabel *v16;
  void *v17;
  UIView *v18;
  UIView *labelShadowView;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AVMobileChromelessTimelineView;
  -[AVMobileChromelessTimelineView didMoveToWindow](&v20, sel_didMoveToWindow);
  if (self)
  {
    if (self->_slider)
      goto LABEL_17;
    v3 = (objc_class *)(self->_overrideFluidSliderPreference
                      ? AVMobileChromelessFluidSlider
                      : AVMobileChromelessSlider);
    v4 = (AVMobileChromelessSlider *)objc_alloc_init(v3);
    slider = self->_slider;
    self->_slider = v4;

    -[AVMobileChromelessSlider setAutoresizingMask:](self->_slider, "setAutoresizingMask:", 0);
    -[AVMobileChromelessSlider setBarHeight:](self->_slider, "setBarHeight:", 7.5);
    -[AVMobileChromelessSlider setSemanticContentAttribute:](self->_slider, "setSemanticContentAttribute:", 3);
    -[UIView setAvkit_extendedDynamicRangeGain:](self->_slider, "setAvkit_extendedDynamicRangeGain:", self->_sliderExtendedDynamicRangeGain);
    -[AVMobileChromelessTimelineView addSubview:](self, "addSubview:", self->_slider);
    if (self->_slider)
    {
LABEL_17:
      if (!self->_trailingLabel)
      {
        v6 = objc_alloc_init(AVLabel);
        trailingLabel = self->_trailingLabel;
        self->_trailingLabel = v6;

        -[AVLabel setAccessibilityIdentifier:](self->_trailingLabel, "setAccessibilityIdentifier:", CFSTR("Remaining Time"));
        v8 = self->_trailingLabel;
        AVLocalizedString(CFSTR("Remaining Time"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVLabel setAccessibilityLabel:](v8, "setAccessibilityLabel:", v9);

        -[AVLabel setIsAccessibilityElement:](self->_trailingLabel, "setIsAccessibilityElement:", 1);
        -[AVLabel setAutoresizingMask:](self->_trailingLabel, "setAutoresizingMask:", 0);
        -[AVLabel setUserInteractionEnabled:](self->_trailingLabel, "setUserInteractionEnabled:", 0);
        v10 = self->_trailingLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVLabel setTextColor:](v10, "setTextColor:", v11);

        -[UIView setAvkit_extendedDynamicRangeGain:](self->_trailingLabel, "setAvkit_extendedDynamicRangeGain:", self->_labelsExtendedDynamicRangeGain);
        -[AVMobileChromelessTimelineView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_trailingLabel, self->_slider);
      }
      if (!self->_leadingLabel)
      {
        v12 = objc_alloc_init(AVLabel);
        leadingLabel = self->_leadingLabel;
        self->_leadingLabel = v12;

        -[AVLabel setAccessibilityIdentifier:](self->_leadingLabel, "setAccessibilityIdentifier:", CFSTR("Elapsed Time"));
        v14 = self->_leadingLabel;
        AVLocalizedString(CFSTR("Elapsed Time"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVLabel setAccessibilityLabel:](v14, "setAccessibilityLabel:", v15);

        -[AVLabel setIsAccessibilityElement:](self->_leadingLabel, "setIsAccessibilityElement:", 1);
        -[AVLabel setAutoresizingMask:](self->_leadingLabel, "setAutoresizingMask:", 0);
        -[AVLabel setUserInteractionEnabled:](self->_leadingLabel, "setUserInteractionEnabled:", 0);
        v16 = self->_leadingLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVLabel setTextColor:](v16, "setTextColor:", v17);

        -[UIView setAvkit_extendedDynamicRangeGain:](self->_leadingLabel, "setAvkit_extendedDynamicRangeGain:", self->_labelsExtendedDynamicRangeGain);
        -[AVMobileChromelessTimelineView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_leadingLabel, self->_trailingLabel);
      }
    }
    if (self->_slider && !self->_labelShadowView)
    {
      v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      labelShadowView = self->_labelShadowView;
      self->_labelShadowView = v18;

      -[UIView setIsAccessibilityElement:](self->_labelShadowView, "setIsAccessibilityElement:", 0);
      -[UIView setAutoresizingMask:](self->_labelShadowView, "setAutoresizingMask:", 0);
      -[UIView setUserInteractionEnabled:](self->_labelShadowView, "setUserInteractionEnabled:", 0);
      -[AVMobileChromelessTimelineView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_labelShadowView, self->_slider);
    }
  }
  -[AVMobileChromelessTimelineView _setUpShadowAppearance](self, "_setUpShadowAppearance");
  -[AVMobileChromelessTimelineView _updateFonts]((uint64_t)self);
}

- (CGSize)intrinsicContentSize
{
  NSString *leadingTimeText;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  leadingTimeText = self->_leadingTimeText;
  if (self->_labelPosition)
  {
    if (leadingTimeText)
    {
      -[AVLabel intrinsicContentSize](self->_leadingLabel, "intrinsicContentSize");
      v5 = v4;
    }
    else
    {
      v5 = 0.0;
    }
    if (self->_trailingTimeText)
    {
      -[AVLabel intrinsicContentSize](self->_trailingLabel, "intrinsicContentSize");
      if (v5 < v8)
        v5 = v8;
    }
    if (v5 <= 0.0)
      v7 = 15.0;
    else
      v7 = v5 + 6.0 + 15.0;
  }
  else
  {
    if (leadingTimeText)
    {
      -[AVLabel intrinsicContentSize](self->_leadingLabel, "intrinsicContentSize");
      v7 = fmax(v6, 15.0);
    }
    else
    {
      v7 = 15.0;
    }
    if (self->_trailingTimeText)
    {
      -[AVLabel intrinsicContentSize](self->_trailingLabel, "intrinsicContentSize");
      if (v7 < v9)
        v7 = v9;
    }
  }
  v10 = *MEMORY[0x1E0DC55F0];
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  unint64_t labelPosition;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  _BOOL4 v35;
  _BOOL4 v36;
  double v37;
  float v38;
  float v39;
  _BOOL4 v40;
  float v41;
  BOOL v42;
  float v43;
  int v44;
  int v45;
  _BOOL4 v46;
  float v47;
  _BOOL8 v48;
  unint64_t v49;
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
  float v61;
  float v62;
  BOOL v63;
  NSString *leadingTimeText;
  double v65;
  double v66;
  double v67;
  float v68;
  float v69;
  float v70;
  BOOL v71;
  NSString *trailingTimeText;
  int v73;
  double v74;
  double v75;
  __int128 v76;
  AVLabel *leadingLabel;
  AVLabel *trailingLabel;
  AVMobileChromelessSlider *slider;
  void *v80;
  char v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  objc_super v92;
  CGAffineTransform v93;
  CGAffineTransform v94;
  CGRect v95;

  v92.receiver = self;
  v92.super_class = (Class)AVMobileChromelessTimelineView;
  -[AVView layoutSubviews](&v92, sel_layoutSubviews);
  labelPosition = self->_labelPosition;
  -[AVMobileChromelessTimelineView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AVMobileChromelessSlider intrinsicContentSize](self->_slider, "intrinsicContentSize");
  v13 = v12;
  v90 = v7;
  v91 = v5;
  if (labelPosition)
  {
    -[AVMobileChromelessTimelineView _labelIntrinsicContentSize]((id *)&self->super.super.super.super.isa);
    v15 = v14;
    v16 = v13;
    v17 = v11;
    v19 = v18;
    -[AVMobileChromelessTimelineView _labelIntrinsicContentSize]((id *)&self->super.super.super.super.isa);
    v21 = v20;
    v23 = v22;
    -[AVMobileChromelessTimelineView _timelineScaleFactor](self);
    v86 = (15.0 - v16) * 0.5;
    v25 = 7.5;
    v26 = v9;
    v27 = v16;
    if (self->_labelsAutoadjustWithSliderEmphasis)
      v25 = v16;
    v28 = v86 + 6.0 + v25;
    v29 = 1.0;
    if (self->_emphasized)
      v29 = v24;
    v83 = v29;
    v85 = v19;
    v30 = v26 * v29;
    v31 = -(v26 - v26 * v24) * 0.5;
    if (!self->_emphasized)
      v31 = 0.0;
    v87 = v31;
    v88 = v26;
    v32 = v19 + v28;
    v11 = v17;
    v33 = v30 >= v15;
    v35 = v30 >= v32 && self->_leadingTimeText != 0;
    LOBYTE(v36) = v35 && v33;
    v37 = v15 + 3.0;
    v38 = v30;
    v39 = v23 + v28;
    if (!v35 || !v33)
      v37 = 0.0;
    v40 = v38 > v39;
    v41 = v21 + v37;
    if (vabds_f32(v38, v39) < 0.00000011921)
      v40 = 1;
    v42 = v38 <= v41;
    v43 = vabds_f32(v38, v41);
    v44 = !v42;
    if (v43 < 0.00000011921)
      v45 = 1;
    else
      v45 = v44;
    if (self->_trailingTimeText)
      v46 = v40;
    else
      v46 = 0;
    v47 = v17;
    v48 = fabsf(v47 + -15.0) >= 0.00000011921 && v47 <= 15.0;
    v49 = self->_labelPosition;
    -[AVMobileChromelessTimelineView _timelineScaleFactor](self);
    memset(&v94, 0, sizeof(v94));
    if (self->_emphasized)
    {
      if (!v49)
        v50 = 1.0;
      CGAffineTransformMakeScale(&v94, v50, v50);
    }
    else
    {
      v76 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v94.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v94.c = v76;
      *(_OWORD *)&v94.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    v73 = v46 & v45;
    leadingLabel = self->_leadingLabel;
    v93 = v94;
    -[AVLabel setTransform:](leadingLabel, "setTransform:", &v93, *(_QWORD *)&v83);
    trailingLabel = self->_trailingLabel;
    v93 = v94;
    -[AVLabel setTransform:](trailingLabel, "setTransform:", &v93);
    if (v36)
    {
      -[AVLabel setFrame:](self->_leadingLabel, "setFrame:", -v87, v28, v15, v85);
      if (!v73)
      {
LABEL_67:
        if (v48)
        {
LABEL_69:
          v75 = v90;
          v74 = v91;
          v9 = v88;
          goto LABEL_70;
        }
LABEL_68:
        -[AVMobileChromelessSlider setFrame:](self->_slider, "setFrame:", 0.0, v86, v30, v27 * v84);
        slider = self->_slider;
        -[AVMobileChromelessTimelineView bounds](self, "bounds");
        -[AVMobileChromelessSlider setCenter:](slider, "setCenter:", CGRectGetMidX(v95), v86);
        v48 = 0;
        goto LABEL_69;
      }
    }
    else if (!v73)
    {
      goto LABEL_67;
    }
    -[AVLabel setFrame:](self->_trailingLabel, "setFrame:", v88 - v21 + v87, v28, v21, v23);
    if (v48)
      goto LABEL_69;
    goto LABEL_68;
  }
  -[AVLabel intrinsicContentSize](self->_leadingLabel, "intrinsicContentSize");
  v52 = v51;
  v54 = v53;
  -[AVLabel intrinsicContentSize](self->_trailingLabel, "intrinsicContentSize");
  v57 = v55;
  v59 = v58;
  v60 = v9 - v52 + -12.0;
  v89 = 0.0;
  if (v60 >= 60.0
    && ((v61 = v54, v62 = v11, *(float *)&v56 = vabds_f32(v61, v62), v61 >= v62)
      ? (v63 = *(float *)&v56 < 0.00000011921)
      : (v63 = 1),
        v63))
  {
    leadingTimeText = self->_leadingTimeText;
    v65 = 0.0;
    v36 = leadingTimeText != 0;
    if (leadingTimeText)
      v66 = v9 - v52 + -12.0;
    else
      v66 = v9;
    if (leadingTimeText)
      v65 = v52 + 12.0;
    v89 = v65;
  }
  else
  {
    v36 = 0;
    v66 = v9;
  }
  v67 = v60 - v55 + -12.0;
  if (v67 >= 60.0
    && ((v68 = v59, v69 = v11, v70 = vabds_f32(v68, v69), v68 >= v69) ? (v71 = v70 < 0.00000011921) : (v71 = 1), v71))
  {
    trailingTimeText = self->_trailingTimeText;
    v73 = trailingTimeText != 0;
    if (trailingTimeText)
      v66 = v67;
  }
  else
  {
    v73 = 0;
  }
  v48 = v13 > v11;
  if (v36)
    -[AVLabel setFrame:](self->_leadingLabel, "setFrame:", 0.0, (v11 - v54) * 0.5, v52, v54, v56);
  if (v73)
    -[AVLabel setFrame:](self->_trailingLabel, "setFrame:", v9 - v57, (v11 - v59) * 0.5, v57, v59, v56);
  if (v13 <= v11)
  {
    -[AVMobileChromelessSlider setFrame:](self->_slider, "setFrame:", v89, (v11 - v13) * 0.5, v66, v13, v56);
    v48 = 0;
  }
  v75 = v90;
  v74 = v91;
LABEL_70:
  -[UIView setFrame:](self->_labelShadowView, "setFrame:", v74, v75, v9, v11);
  -[AVLabel setHidden:](self->_leadingLabel, "setHidden:", !v36);
  -[AVLabel setHidden:](self->_trailingLabel, "setHidden:", v73 ^ 1u);
  -[AVMobileChromelessSlider setHidden:](self->_slider, "setHidden:", v48);
  -[AVMobileChromelessTimelineView _updateShadowPathIfNeeded]((uint64_t)self);
  -[AVMobileChromelessTimelineView delegate](self, "delegate");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_opt_respondsToSelector();

  if ((v81 & 1) != 0)
  {
    -[AVMobileChromelessTimelineView delegate](self, "delegate");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "timelineViewDidLayoutSubviews:", self);

  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  AVMobileChromelessTimelineView *v6;
  id v7;
  unsigned __int8 v8;
  AVMobileChromelessSlider *slider;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v6 = self;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessTimelineView;
  v7 = a4;
  v8 = -[AVMobileChromelessTimelineView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  slider = v6->_slider;
  -[AVMobileChromelessSlider convertPoint:fromView:](slider, "convertPoint:fromView:", v6, x, y, v11.receiver, v11.super_class);
  LOBYTE(v6) = -[AVMobileChromelessSlider pointInside:withEvent:](slider, "pointInside:withEvent:", v7);

  return v8 | v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessTimelineView;
  v4 = a3;
  -[AVMobileChromelessTimelineView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[AVMobileChromelessTimelineView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[AVMobileChromelessTimelineView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  id v4;
  void *v5;

  if (self->_slider == a3)
  {
    v4 = a3;
    -[AVMobileChromelessTimelineView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVMobileChromelessTimelineView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v4);

    -[AVMobileChromelessTimelineView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDrawsShadow:(BOOL)a3
{
  if (self->_drawsShadow != a3)
  {
    self->_drawsShadow = a3;
    -[AVMobileChromelessTimelineView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);
  }
}

- (void)_setUpShadowAppearance
{
  void *v3;
  id v4;

  -[AVMobileChromelessSlider layer](self->_slider, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_labelShadowView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowOffset:", 0.0, 6.0);
  objc_msgSend(v4, "setShadowRadius:", 10.0);
  objc_msgSend(v3, "setShadowOffset:", 0.0, 6.0);
  objc_msgSend(v3, "setShadowRadius:", 10.0);
  -[AVMobileChromelessTimelineView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);

}

- (unint64_t)labelPosition
{
  return self->_labelPosition;
}

- (BOOL)labelsAutoadjustWithSliderEmphasis
{
  return self->_labelsAutoadjustWithSliderEmphasis;
}

- (void)setLabelsAutoadjustWithSliderEmphasis:(BOOL)a3
{
  self->_labelsAutoadjustWithSliderEmphasis = a3;
}

- (NSString)leadingTimeText
{
  return self->_leadingTimeText;
}

- (BOOL)isEmphasized
{
  return self->_emphasized;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (NSString)trailingTimeText
{
  return self->_trailingTimeText;
}

- (BOOL)drawsShadow
{
  return self->_drawsShadow;
}

- (AVMobileChromelessTimelineViewDelegate)delegate
{
  return (AVMobileChromelessTimelineViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)labelsExtendedDynamicRangeGain
{
  return self->_labelsExtendedDynamicRangeGain;
}

- (UIFont)labelsFont
{
  return self->_labelsFont;
}

- (UIColor)labelsTextColor
{
  return self->_labelsTextColor;
}

- (AVMobileChromelessSlider)slider
{
  return self->_slider;
}

- (double)sliderExtendedDynamicRangeGain
{
  return self->_sliderExtendedDynamicRangeGain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_labelsTextColor, 0);
  objc_storeStrong((id *)&self->_labelsFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingTimeText, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_leadingTimeText, 0);
  objc_storeStrong((id *)&self->_labelShadowView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_leadingLabel, 0);
}

- (void)_updateShadowAppearanceState
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  double v13;
  id v14;
  double v15;
  id v16;

  if (a1)
  {
    objc_msgSend(a1[74], "layer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[60], "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    if (objc_msgSend(a1, "drawsShadow"))
    {
      objc_msgSend(a1[74], "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceStyle");

      if (v5 == 1)
      {
        v6 = 0;
        v7 = 0.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0.8;
      }
      objc_msgSend(a1[58], "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "userInterfaceStyle") == 1)
      {
        objc_msgSend(a1[59], "traitCollection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "userInterfaceStyle");

        if (v11 == 1)
        {
          v8 = 0;
          goto LABEL_12;
        }
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = 1058642330;
      goto LABEL_12;
    }
    v6 = 0;
    v8 = 0;
    v7 = 0.0;
LABEL_12:
    v12 = objc_retainAutorelease(v6);
    objc_msgSend(v16, "setShadowColor:", objc_msgSend(v12, "CGColor"));
    *(float *)&v13 = v7;
    objc_msgSend(v16, "setShadowOpacity:", v13);
    v14 = objc_retainAutorelease(v8);
    objc_msgSend(v2, "setShadowColor:", objc_msgSend(v14, "CGColor"));
    LODWORD(v15) = v3;
    objc_msgSend(v2, "setShadowOpacity:", v15);
    -[AVMobileChromelessTimelineView _updateShadowPathIfNeeded]((uint64_t)a1);

  }
}

- (void)_updateShadowPathIfNeeded
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  CGRect v28;

  if (a1 && objc_msgSend((id)a1, "drawsShadow"))
  {
    objc_msgSend(*(id *)(a1 + 592), "layer");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    if (CGRectIsNull(*(CGRect *)(a1 + 488))
      || (v28.origin.x = v3,
          v28.origin.y = v5,
          v28.size.width = v7,
          v28.size.height = v9,
          !CGRectEqualToRect(*(CGRect *)(a1 + 488), v28)))
    {
      *(double *)(a1 + 488) = v3;
      *(double *)(a1 + 496) = v5;
      *(double *)(a1 + 504) = v7;
      *(double *)(a1 + 512) = v9;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v3, v5, v7, v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v27, "setShadowPath:", objc_msgSend(v10, "CGPath"));

    }
    objc_msgSend(*(id *)(a1 + 480), "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 464), "isHidden") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 464), "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userInterfaceStyle");

      if (v14 != 1)
      {
        objc_msgSend(*(id *)(a1 + 464), "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0DC3508];
        objc_msgSend(v15, "frame");
        objc_msgSend(v16, "bezierPathWithRect:");
        v17 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v17;
      }
    }
    if ((objc_msgSend(*(id *)(a1 + 472), "isHidden") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 472), "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "userInterfaceStyle");

      if (v19 != 1)
      {
        objc_msgSend(*(id *)(a1 + 472), "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v12, "isEmpty");
        v22 = (void *)MEMORY[0x1E0DC3508];
        objc_msgSend(v20, "frame");
        objc_msgSend(v22, "bezierPathWithRect:");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if ((v21 & 1) != 0)
        {
          v25 = v12;
          v12 = (void *)v23;
        }
        else
        {
          objc_msgSend(v12, "appendPath:", v23);
          v25 = v24;
        }

      }
    }
    v26 = objc_retainAutorelease(v12);
    objc_msgSend(v11, "setShadowPath:", objc_msgSend(v26, "CGPath"));

  }
}

- (uint64_t)_labelIntrinsicContentSize
{
  objc_msgSend(a1[58], "intrinsicContentSize");
  objc_msgSend(a1[59], "intrinsicContentSize");
  return -[AVMobileChromelessTimelineView _timelineScaleFactor](a1);
}

- (uint64_t)_timelineScaleFactor
{
  void *v2;

  objc_msgSend(a1, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");

  return objc_msgSend(a1, "bounds");
}

- (void)_updateFonts
{
  void *v2;
  id v3;
  id v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 576);
    if (v2)
    {
      v3 = v2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 544), "timeLabelFont");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 464), "setFont:", v3);
    objc_msgSend(*(id *)(a1 + 472), "setFont:", v4);
    objc_msgSend((id)a1, "setNeedsLayout");

  }
}

uint64_t __62__AVMobileChromelessTimelineView_prepareForDeemphasisIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBarHeight:", 11.25);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

- (uint64_t)_commonInit
{
  void *v2;
  void *v3;
  __int128 v4;

  v2 = *(void **)(a1 + 536);
  *(_QWORD *)(a1 + 536) = 0;

  v3 = *(void **)(a1 + 552);
  *(_QWORD *)(a1 + 552) = 0;

  *(_QWORD *)(a1 + 528) = 0;
  *(_BYTE *)(a1 + 522) = 1;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(a1 + 488) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(a1 + 504) = v4;
  *(_BYTE *)(a1 + 523) = 0;
  return objc_msgSend((id)a1, "setIgnoresTouches:", 1);
}

@end
