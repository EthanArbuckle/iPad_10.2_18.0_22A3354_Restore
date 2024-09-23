@implementation CAMVideoConfigurationStatusIndicator

- (CAMVideoConfigurationStatusIndicator)init
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cam_initialLayoutStyle");

  return -[CAMVideoConfigurationStatusIndicator initWithLayoutStyle:](self, "initWithLayoutStyle:", v4);
}

- (CAMVideoConfigurationStatusIndicator)initWithLayoutStyle:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CAMVideoConfigurationStatusIndicator *v8;
  CAMVideoConfigurationStatusIndicator *v9;
  uint64_t v10;
  UILabel *resolutionLabel;
  void *v12;
  uint64_t v13;
  UILabel *separatorLabel;
  void *v15;
  uint64_t v16;
  UILabel *framerateLabel;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CAMVideoConfigurationStatusIndicator;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[CAMControlStatusIndicator initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_layoutStyle = a3;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
    resolutionLabel = v9->__resolutionLabel;
    v9->__resolutionLabel = (UILabel *)v10;

    -[UILabel setNumberOfLines:](v9->__resolutionLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->__resolutionLabel, "setTextColor:", v12);

    -[UILabel setTextAlignment:](v9->__resolutionLabel, "setTextAlignment:", 1);
    -[CAMVideoConfigurationStatusIndicator addSubview:](v9, "addSubview:", v9->__resolutionLabel);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
    separatorLabel = v9->__separatorLabel;
    v9->__separatorLabel = (UILabel *)v13;

    -[UILabel setNumberOfLines:](v9->__separatorLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->__separatorLabel, "setTextColor:", v15);

    -[UILabel setTextAlignment:](v9->__separatorLabel, "setTextAlignment:", 1);
    -[CAMVideoConfigurationStatusIndicator addSubview:](v9, "addSubview:", v9->__separatorLabel);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
    framerateLabel = v9->__framerateLabel;
    v9->__framerateLabel = (UILabel *)v16;

    -[UILabel setNumberOfLines:](v9->__framerateLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->__framerateLabel, "setTextColor:", v18);

    -[UILabel setTextAlignment:](v9->__framerateLabel, "setTextAlignment:", 1);
    -[CAMVideoConfigurationStatusIndicator addSubview:](v9, "addSubview:", v9->__framerateLabel);
    -[CAMVideoConfigurationStatusIndicator _updateAppearanceAnimated:](v9, "_updateAppearanceAnimated:", 0);
  }
  return v9;
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMVideoConfigurationStatusIndicator _updateAppearanceAnimated:](self, "_updateAppearanceAnimated:", 0);
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v3 = -[CAMVideoConfigurationStatusIndicator layoutStyle](self, "layoutStyle");
  if ((unint64_t)(v3 - 2) >= 3)
  {
    if (v3 == 1)
    {
      v8 = 2.0;
      v5 = 4.0;
      v6 = 8.0;
      v7 = 8.0;
      goto LABEL_7;
    }
    if (v3)
    {
      v8 = *MEMORY[0x1E0DC49E8];
      v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      goto LABEL_7;
    }
  }
  -[CAMVideoConfigurationStatusIndicator intrinsicContentSize](self, "intrinsicContentSize");
  v5 = (42.0 - v4) * 0.5;
  v6 = 6.0;
  v7 = 6.0;
  v8 = v5;
LABEL_7:
  result.right = v6;
  result.bottom = v5;
  result.left = v7;
  result.top = v8;
  return result;
}

- (CGSize)intrinsicContentSize
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
  CGSize result;

  -[CAMVideoConfigurationStatusIndicator _resolutionSize](self, "_resolutionSize");
  v4 = v3;
  v6 = v5;
  -[CAMVideoConfigurationStatusIndicator _separatorSize](self, "_separatorSize");
  v8 = v7;
  v10 = v9;
  -[CAMVideoConfigurationStatusIndicator _framerateSize](self, "_framerateSize");
  v13 = v4 + v8 + v12;
  if (v6 >= v10)
    v14 = v6;
  else
    v14 = v10;
  if (v14 >= v11)
    v11 = v14;
  result.height = v11;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
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
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)CAMVideoConfigurationStatusIndicator;
  -[CAMControlStatusIndicator layoutSubviews](&v52, sel_layoutSubviews);
  -[CAMVideoConfigurationStatusIndicator bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMVideoConfigurationStatusIndicator intrinsicContentSize](self, "intrinsicContentSize");
  UIRoundToViewScale();
  UIRoundToViewScale();
  if ((unint64_t)(-[CAMControlStatusIndicator orientation](self, "orientation") - 3) <= 1)
  {
    v11 = v10;
    v12 = v8;
    v13 = v6;
    v14 = v4;
    -[CAMVideoConfigurationStatusIndicator _resolutionSize](self, "_resolutionSize");
    v16 = v15;
    -[CAMVideoConfigurationStatusIndicator _minTextWidth](self, "_minTextWidth");
    v18 = v17;
    -[CAMVideoConfigurationStatusIndicator _minTextWidth](self, "_minTextWidth");
    if (v16 - v19 <= 0.0)
    {
      v4 = v14;
      v6 = v13;
      v8 = v12;
      v10 = v11;
    }
    else
    {
      v20 = v18 <= 0.0;
      v4 = v14;
      v6 = v13;
      v8 = v12;
      v10 = v11;
      if (!v20)
        UIRoundToViewScale();
    }
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[CAMVideoConfigurationStatusIndicator _resolutionSize](self, "_resolutionSize");
  -[CAMVideoConfigurationStatusIndicator _labelGeometryForSize:originX:originY:](self, "_labelGeometryForSize:originX:originY:");
  -[CAMVideoConfigurationStatusIndicator _resolutionLabel](self, "_resolutionLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v48;
  v43 = v49;
  v44 = v50;
  v45 = v51;
  v40 = v46;
  v41 = v47;
  CAMViewSetGeometry(v21, (uint64_t)&v40);

  -[CAMVideoConfigurationStatusIndicator _resolutionLabelSnapshot](self, "_resolutionLabelSnapshot");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v48;
  v43 = v49;
  v44 = v50;
  v45 = v51;
  v40 = v46;
  v41 = v47;
  CAMViewSetGeometry(v22, (uint64_t)&v40);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[CAMVideoConfigurationStatusIndicator _separatorSize](self, "_separatorSize");
  -[CAMVideoConfigurationStatusIndicator _labelGeometryForSize:originX:originY:](self, "_labelGeometryForSize:originX:originY:");
  -[CAMVideoConfigurationStatusIndicator _separatorLabel](self, "_separatorLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v42;
  v37 = v43;
  v38 = v44;
  v39 = v45;
  v34 = v40;
  v35 = v41;
  CAMViewSetGeometry(v23, (uint64_t)&v34);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[CAMVideoConfigurationStatusIndicator _framerateSize](self, "_framerateSize");
  -[CAMVideoConfigurationStatusIndicator _labelGeometryForSize:originX:originY:](self, "_labelGeometryForSize:originX:originY:");
  -[CAMVideoConfigurationStatusIndicator _framerateLabel](self, "_framerateLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v36;
  v31 = v37;
  v32 = v38;
  v33 = v39;
  v28 = v34;
  v29 = v35;
  CAMViewSetGeometry(v24, (uint64_t)&v28);

  -[CAMVideoConfigurationStatusIndicator _framerateLabelSnapshot](self, "_framerateLabelSnapshot");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v36;
  v31 = v37;
  v32 = v38;
  v33 = v39;
  v28 = v34;
  v29 = v35;
  CAMViewSetGeometry(v25, (uint64_t)&v28);

  -[CAMVideoConfigurationStatusIndicator _borderImageView](self, "_borderImageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CAMVideoConfigurationStatusIndicator _borderImageView](self, "_borderImageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", v4, v6, v8, v10);

  }
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;

  objc_msgSend(a3, "anyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  -[CAMVideoConfigurationStatusIndicator _handleTouchAtLocation:](self, "_handleTouchAtLocation:");

}

- (void)setResolution:(int64_t)a3 framerate:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  int64_t resolution;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  if (self->_framerate != a4)
  {
    if (a5)
    {
      -[CAMVideoConfigurationStatusIndicator _framerateLabelSnapshot](self, "_framerateLabelSnapshot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      -[CAMVideoConfigurationStatusIndicator _framerateLabel](self, "_framerateLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMFrameworkUtilities snapshotForCrossFadingView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:embedSnapshot:](CAMFrameworkUtilities, "snapshotForCrossFadingView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:embedSnapshot:", v11, 1, 0.15, 0.0, 0.125, 0.1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMVideoConfigurationStatusIndicator set_framerateLabelSnapshot:](self, "set_framerateLabelSnapshot:", v12);

      resolution = self->_resolution;
      goto LABEL_7;
    }
LABEL_9:
    -[CAMVideoConfigurationStatusIndicator setResolution:](self, "setResolution:", a3);
    -[CAMVideoConfigurationStatusIndicator setFramerate:](self, "setFramerate:", a4);
    -[CAMVideoConfigurationStatusIndicator _updateAppearanceAnimated:](self, "_updateAppearanceAnimated:", v5);
    return;
  }
  resolution = self->_resolution;
  if (resolution != a3)
  {
    if (a5)
    {
LABEL_7:
      if (resolution != a3)
      {
        -[CAMVideoConfigurationStatusIndicator _resolutionLabelSnapshot](self, "_resolutionLabelSnapshot");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeFromSuperview");

        -[CAMVideoConfigurationStatusIndicator _resolutionLabel](self, "_resolutionLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAMFrameworkUtilities snapshotForCrossFadingView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:embedSnapshot:](CAMFrameworkUtilities, "snapshotForCrossFadingView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:embedSnapshot:", v14, 1, 0.15, 0.0, 0.125, 0.1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMVideoConfigurationStatusIndicator set_resolutionLabelSnapshot:](self, "set_resolutionLabelSnapshot:", v15);

      }
      goto LABEL_9;
    }
    goto LABEL_9;
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v6[5];
  objc_super v7;

  if (a4)
  {
    -[CAMVideoConfigurationStatusIndicator layoutIfNeeded](self, "layoutIfNeeded");
    v7.receiver = self;
    v7.super_class = (Class)CAMVideoConfigurationStatusIndicator;
    -[CAMControlStatusIndicator setOrientation:animated:](&v7, sel_setOrientation_animated_, a3, 0);
    -[CAMVideoConfigurationStatusIndicator setNeedsLayout](self, "setNeedsLayout");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__CAMVideoConfigurationStatusIndicator_setOrientation_animated___block_invoke;
    v6[3] = &unk_1EA328868;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.3, 0.0);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMVideoConfigurationStatusIndicator;
    -[CAMControlStatusIndicator setOrientation:animated:](&v7, sel_setOrientation_animated_, a3);
    -[CAMVideoConfigurationStatusIndicator setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __64__CAMVideoConfigurationStatusIndicator_setOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)_resolutionString
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[CAMVideoConfigurationStatusIndicator resolution](self, "resolution") - 1;
  if (v2 > 3)
  {
    v3 = &stru_1EA3325A0;
  }
  else
  {
    CAMLocalizedFrameworkString(off_1EA3294D8[v2], 0);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_separatorString
{
  return CFSTR("·");
}

- (id)_framerateString
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = -[CAMVideoConfigurationStatusIndicator framerate](self, "framerate") - 1;
  if (v2 > 6)
    v3 = 0;
  else
    v3 = qword_1DB9A4CE0[v2];
  objc_msgSend((id)objc_opt_class(), "integerFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_labelGeometryForSize:(SEL)a3 originX:(CGSize)a4 originY:(double)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  height = a4.height;
  width = a4.width;
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  UIRectGetCenter();
  v13 = v12;
  v15 = v14;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  CAMOrientationTransform(-[CAMControlStatusIndicator orientation](self, "orientation"), (uint64_t)&v18);
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  CAMViewGeometryMake((uint64_t)v17, (uint64_t)retstr, v13, v15, v10, v11, width, height);
  return result;
}

- (CGSize)_sizingForLabel:(id)a3 minWidth:(double)a4 spacing:(double)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a3, "intrinsicContentSize");
  UICeilToViewScale();
  v6 = v5;
  UICeilToViewScale();
  v8 = v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (double)_minTextWidth
{
  int64_t v2;
  double result;

  v2 = -[CAMVideoConfigurationStatusIndicator layoutStyle](self, "layoutStyle");
  result = 30.0;
  if (v2 == 1)
    return 0.0;
  return result;
}

- (void)_updateAppearanceAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  UIImageView *v34;
  UIImageView *borderImageView;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v3 = a3;
  v38[2] = *MEMORY[0x1E0C80C00];
  +[CAMFont cameraMonospacedFontOfSize:](CAMFont, "cameraMonospacedFontOfSize:", 14.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMFont cameraKerningForFont:](CAMFont, "cameraKerningForFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1150];
  v37[0] = *MEMORY[0x1E0DC1138];
  v37[1] = v7;
  v38[0] = v5;
  v38[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMVideoConfigurationStatusIndicator resolution](self, "resolution"))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CAMVideoConfigurationStatusIndicator _resolutionString](self, "_resolutionString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v8);
    -[CAMVideoConfigurationStatusIndicator _resolutionLabel](self, "_resolutionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", v11);

  }
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[CAMVideoConfigurationStatusIndicator _separatorString](self, "_separatorString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v8);
  -[CAMVideoConfigurationStatusIndicator _separatorLabel](self, "_separatorLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAttributedText:", v15);

  if (-[CAMVideoConfigurationStatusIndicator framerate](self, "framerate"))
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CAMVideoConfigurationStatusIndicator _framerateString](self, "_framerateString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v18, v8);
    -[CAMVideoConfigurationStatusIndicator _framerateLabel](self, "_framerateLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAttributedText:", v19);

  }
  v21 = -[CAMVideoConfigurationStatusIndicator layoutStyle](self, "layoutStyle");
  -[CAMVideoConfigurationStatusIndicator _minTextWidth](self, "_minTextWidth");
  v23 = v22;
  -[CAMVideoConfigurationStatusIndicator _resolutionLabel](self, "_resolutionLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMVideoConfigurationStatusIndicator _sizingForLabel:minWidth:spacing:](self, "_sizingForLabel:minWidth:spacing:", v24, v23, 13.0 - CAMPixelWidthForView(self));
  -[CAMVideoConfigurationStatusIndicator set_resolutionSize:](self, "set_resolutionSize:");

  -[CAMVideoConfigurationStatusIndicator _separatorLabel](self, "_separatorLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMVideoConfigurationStatusIndicator _sizingForLabel:minWidth:spacing:](self, "_sizingForLabel:minWidth:spacing:", v25, 16.0, 0.0);
  -[CAMVideoConfigurationStatusIndicator set_separatorSize:](self, "set_separatorSize:");

  -[CAMVideoConfigurationStatusIndicator _framerateLabel](self, "_framerateLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMVideoConfigurationStatusIndicator _sizingForLabel:minWidth:spacing:](self, "_sizingForLabel:minWidth:spacing:", v26, v23, 13.0 - CAMPixelWidthForView(self));
  -[CAMVideoConfigurationStatusIndicator set_framerateSize:](self, "set_framerateSize:");

  -[CAMVideoConfigurationStatusIndicator _borderImageView](self, "_borderImageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 == 1)
  {
    if (!v27)
    {
      v28 = (void *)MEMORY[0x1E0DC3870];
      CAMCameraUIFrameworkBundle();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "imageNamed:inBundle:", CFSTR("CAMFramerateIndicatorBorder"), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "size");
      objc_msgSend(v30, "resizableImageWithCapInsets:resizingMode:", 1, v31 * 0.5, v32 * 0.5, v31 * 0.5, v32 * 0.5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v33);
      borderImageView = self->__borderImageView;
      self->__borderImageView = v34;

      -[CAMVideoConfigurationStatusIndicator addSubview:](self, "addSubview:", self->__borderImageView);
LABEL_10:

    }
  }
  else if (v27)
  {
    -[UIImageView removeFromSuperview](self->__borderImageView, "removeFromSuperview");
    v30 = self->__borderImageView;
    self->__borderImageView = 0;
    goto LABEL_10;
  }
  -[CAMVideoConfigurationStatusIndicator setNeedsLayout](self, "setNeedsLayout");
  -[CAMControlStatusIndicator delegate](self, "delegate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "controlStatusIndicatorDidChangeIntrinsicContentSize:animated:", self, v3);

}

- (BOOL)_togglesResolutionOrFramerateForTouchAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[CAMVideoConfigurationStatusIndicator bounds](self, "bounds");
  v8 = CGRectInset(v7, -15.0, -15.0);
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v8, v6);
}

- (BOOL)_togglesResolutionForTouchAtLocation:(CGPoint)a3
{
  double x;
  BOOL v5;
  void *v6;
  double v7;
  double v8;

  x = a3.x;
  v5 = -[CAMVideoConfigurationStatusIndicator _togglesResolutionOrFramerateForTouchAtLocation:](self, "_togglesResolutionOrFramerateForTouchAtLocation:", a3.x, a3.y);
  -[CAMVideoConfigurationStatusIndicator _separatorLabel](self, "_separatorLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v8 = v7;

  return x < v8 && v5;
}

- (BOOL)_togglesFramerateForTouchAtLocation:(CGPoint)a3
{
  double x;
  BOOL v5;
  void *v6;
  double v7;
  double v8;

  x = a3.x;
  v5 = -[CAMVideoConfigurationStatusIndicator _togglesResolutionOrFramerateForTouchAtLocation:](self, "_togglesResolutionOrFramerateForTouchAtLocation:", a3.x, a3.y);
  -[CAMVideoConfigurationStatusIndicator _separatorLabel](self, "_separatorLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v8 = v7;

  return x > v8 && v5;
}

- (void)_handleTouchAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[CAMVideoConfigurationStatusIndicator touchDelegate](self, "touchDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "videoConfigurationStatusIndicatorShouldRespondToTap:", self);

  if (v7)
  {
    if (-[CAMVideoConfigurationStatusIndicator _togglesResolutionForTouchAtLocation:](self, "_togglesResolutionForTouchAtLocation:", x, y))
    {
      -[CAMVideoConfigurationStatusIndicator touchDelegate](self, "touchDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoConfigurationStatusIndicatorDidTapResolution:", self);
    }
    else
    {
      if (!-[CAMVideoConfigurationStatusIndicator _togglesFramerateForTouchAtLocation:](self, "_togglesFramerateForTouchAtLocation:", x, y))return;
      -[CAMVideoConfigurationStatusIndicator touchDelegate](self, "touchDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoConfigurationStatusIndicatorDidTapFramerate:", self);
    }

  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(a3, "locationOfAccessibilityGestureInView:", self);
  v5 = v4;
  v7 = v6;
  if (-[CAMVideoConfigurationStatusIndicator _togglesResolutionForTouchAtLocation:](self, "_togglesResolutionForTouchAtLocation:"))
  {
    -[CAMVideoConfigurationStatusIndicator _resolutionString](self, "_resolutionString");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[CAMVideoConfigurationStatusIndicator _togglesFramerateForTouchAtLocation:](self, "_togglesFramerateForTouchAtLocation:", v5, v7))
    {
      v9 = 0;
      goto LABEL_8;
    }
    -[CAMVideoConfigurationStatusIndicator _framerateString](self, "_framerateString");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  if (!v8)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v10 = objc_alloc(MEMORY[0x1E0DC3418]);
  v11 = (void *)objc_msgSend(v10, "initWithTitle:image:imageInsets:scaleImage:", v9, 0, 0, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
LABEL_9:

  return v11;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  objc_msgSend(a3, "locationOfAccessibilityGestureInView:", self);
  -[CAMVideoConfigurationStatusIndicator _handleTouchAtLocation:](self, "_handleTouchAtLocation:");
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CAMVideoConfigurationStatusIndicatorDelegate)touchDelegate
{
  return (CAMVideoConfigurationStatusIndicatorDelegate *)objc_loadWeakRetained((id *)&self->_touchDelegate);
}

- (void)setTouchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_touchDelegate, a3);
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (int64_t)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(int64_t)a3
{
  self->_framerate = a3;
}

- (UILabel)_resolutionLabel
{
  return self->__resolutionLabel;
}

- (UIView)_resolutionLabelSnapshot
{
  return (UIView *)objc_loadWeakRetained((id *)&self->__resolutionLabelSnapshot);
}

- (void)set_resolutionLabelSnapshot:(id)a3
{
  objc_storeWeak((id *)&self->__resolutionLabelSnapshot, a3);
}

- (UILabel)_separatorLabel
{
  return self->__separatorLabel;
}

- (UILabel)_framerateLabel
{
  return self->__framerateLabel;
}

- (UIView)_framerateLabelSnapshot
{
  return (UIView *)objc_loadWeakRetained((id *)&self->__framerateLabelSnapshot);
}

- (void)set_framerateLabelSnapshot:(id)a3
{
  objc_storeWeak((id *)&self->__framerateLabelSnapshot, a3);
}

- (CGSize)_resolutionSize
{
  double width;
  double height;
  CGSize result;

  width = self->__resolutionSize.width;
  height = self->__resolutionSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_resolutionSize:(CGSize)a3
{
  self->__resolutionSize = a3;
}

- (CGSize)_separatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->__separatorSize.width;
  height = self->__separatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_separatorSize:(CGSize)a3
{
  self->__separatorSize = a3;
}

- (CGSize)_framerateSize
{
  double width;
  double height;
  CGSize result;

  width = self->__framerateSize.width;
  height = self->__framerateSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_framerateSize:(CGSize)a3
{
  self->__framerateSize = a3;
}

- (UIImageView)_borderImageView
{
  return self->__borderImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__borderImageView, 0);
  objc_destroyWeak((id *)&self->__framerateLabelSnapshot);
  objc_storeStrong((id *)&self->__framerateLabel, 0);
  objc_storeStrong((id *)&self->__separatorLabel, 0);
  objc_destroyWeak((id *)&self->__resolutionLabelSnapshot);
  objc_storeStrong((id *)&self->__resolutionLabel, 0);
  objc_destroyWeak((id *)&self->_touchDelegate);
}

@end
