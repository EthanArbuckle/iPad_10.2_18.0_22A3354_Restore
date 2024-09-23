@implementation CAMExposureBiasStatusIndicator

- (CAMExposureBiasStatusIndicator)init
{
  double v2;
  double v3;
  double v4;
  double v5;
  CAMExposureBiasStatusIndicator *v6;
  uint64_t v7;
  UILabel *exposureLabel;
  void *v9;
  void *v10;
  void *v11;
  CAMExposureBiasStatusIndicatorTickMarksView *v12;
  CAMExposureBiasStatusIndicatorTickMarksView *ticksView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CAMExposureBiasStatusIndicator;
  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v6 = -[CAMControlStatusIndicator initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v3, v4, v5);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v2, v3, v4, v5);
    exposureLabel = v6->__exposureLabel;
    v6->__exposureLabel = (UILabel *)v7;

    -[UILabel setNumberOfLines:](v6->__exposureLabel, "setNumberOfLines:", 1);
    CAMYellowColor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->__exposureLabel, "setTextColor:", v9);

    -[UILabel setTextAlignment:](v6->__exposureLabel, "setTextAlignment:", 1);
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sfCameraFontSupported");

    CEKMonospacedStylisticNumeralFontOfSizeAndStyle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->__exposureLabel, "setFont:", v11);

    -[CAMExposureBiasStatusIndicator addSubview:](v6, "addSubview:", v6->__exposureLabel);
    v12 = objc_alloc_init(CAMExposureBiasStatusIndicatorTickMarksView);
    ticksView = v6->__ticksView;
    v6->__ticksView = v12;

    -[CAMExposureBiasStatusIndicator addSubview:](v6, "addSubview:", v6->__ticksView);
    -[CAMExposureBiasStatusIndicator _updateExposureLabel](v6, "_updateExposureLabel");
    -[CAMExposureBiasStatusIndicator _updateTicks](v6, "_updateTicks");
  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[CAMExposureBiasStatusIndicator _exposureLabel](self, "_exposureLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  -[CAMExposureBiasStatusIndicator _ticksView](self, "_ticksView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;

  v11 = v5 + 4.0 + v10;
  v12 = v8;
  result.height = v11;
  result.width = v12;
  return result;
}

- (double)_horizontalExposureLabelOffset
{
  double v3;
  double v4;
  _BOOL4 v5;
  double result;

  -[CAMExposureBiasStatusIndicator exposureBiasValue](self, "exposureBiasValue");
  v4 = v3;
  v5 = -[CAMExposureBiasStatusIndicator isExposureValueVisible](self, "isExposureValueVisible");
  result = 0.0;
  if (v5)
  {
    result = -4.0;
    if (v4 <= 0.0)
    {
      result = 0.0;
      if (v4 < 0.0)
        return CAMPixelWidthForView(self) + -3.0;
    }
  }
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  objc_super v35;
  CGRect v36;

  v35.receiver = self;
  v35.super_class = (Class)CAMExposureBiasStatusIndicator;
  -[CAMControlStatusIndicator layoutSubviews](&v35, sel_layoutSubviews);
  -[CAMExposureBiasStatusIndicator bounds](self, "bounds");
  -[CAMExposureBiasStatusIndicator _exposureLabel](self, "_exposureLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");

  -[CAMExposureBiasStatusIndicator _ticksView](self, "_ticksView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v5;
  v8 = v7;

  -[CAMExposureBiasStatusIndicator _exposureLabel](self, "_exposureLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ascender");

  -[CAMExposureBiasStatusIndicator _exposureLabel](self, "_exposureLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "capHeight");

  UIRectCenteredRect();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[CAMExposureBiasStatusIndicator _horizontalExposureLabelOffset](self, "_horizontalExposureLabelOffset");
  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v18;
  v36.size.height = v20;
  CGRectGetMaxY(v36);
  UIPointRoundToViewScale();
  v22 = v21;
  v24 = v23;
  -[CAMExposureBiasStatusIndicator _ticksView](self, "_ticksView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v22, v24, v6, v8);

  UIRectIntegralWithScale();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[CAMExposureBiasStatusIndicator _exposureLabel](self, "_exposureLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  -[CAMExposureBiasStatusIndicator _layoutShadowClippingTick](self, "_layoutShadowClippingTick");
  -[CAMExposureBiasStatusIndicator _layoutHighlightClippingTick](self, "_layoutHighlightClippingTick");
}

- (void)_layoutShadowClippingTick
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[CAMExposureBiasStatusIndicator shadowClipping](self, "shadowClipping");
  -[CAMExposureBiasStatusIndicator _clippingTickFrameForClipping:leftAligned:](self, "_clippingTickFrameForClipping:leftAligned:", 1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMExposureBiasStatusIndicator _shadowClippingTick](self, "_shadowClippingTick");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)_layoutHighlightClippingTick
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[CAMExposureBiasStatusIndicator highlightClipping](self, "highlightClipping");
  -[CAMExposureBiasStatusIndicator _clippingTickFrameForClipping:leftAligned:](self, "_clippingTickFrameForClipping:leftAligned:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMExposureBiasStatusIndicator _highlightClippingTick](self, "_highlightClippingTick");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return 0;
}

- (BOOL)supportsOrientations
{
  return 0;
}

- (void)_updateExposureLabel
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CAMExposureBiasStatusIndicator exposureBiasValue](self, "exposureBiasValue");
  v4 = v3;
  if (-[CAMExposureBiasStatusIndicator isExposureValueVisible](self, "isExposureValueVisible"))
  {
    +[CAMExposureSlider decimalFormatter](CAMExposureSlider, "decimalFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromNumber:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("."));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CAMExposureBiasStatusIndicator _exposureLabel](self, "_exposureLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  -[CAMExposureBiasStatusIndicator setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTicks
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[CAMExposureBiasStatusIndicator exposureBiasValue](self, "exposureBiasValue");
  CEKProgressClamped();
  v4 = llround(v3 * 12.0);
  if (v4 >= 6)
    v5 = 6;
  else
    v5 = v4;
  if (v4 <= 6)
    v4 = 6;
  v6 = v4 - v5 + 1;
  -[CAMExposureBiasStatusIndicator _ticksView](self, "_ticksView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectedRange:", v5, v6);

}

- (CGRect)_clippingTickFrameForClipping:(double)a3 leftAligned:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  CEKProgressClamped();
  CEKInterpolate();
  -[CAMExposureBiasStatusIndicator _ticksView](self, "_ticksView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  if (a4)
    CGRectGetMinX(*(CGRect *)&v7);
  else
    CGRectGetMaxX(*(CGRect *)&v7);

  -[CAMExposureBiasStatusIndicator _ticksView](self, "_ticksView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  CGRectGetMaxY(v16);

  UIRectIntegralWithScale();
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)_clippingTickAlphaForClipping:(double)a3
{
  double result;

  CEKProgressClamped();
  return result;
}

- (void)_updateShadowClippingTickAlpha
{
  double v3;
  double v4;
  id v5;

  -[CAMExposureBiasStatusIndicator shadowClipping](self, "shadowClipping");
  -[CAMExposureBiasStatusIndicator _clippingTickAlphaForClipping:](self, "_clippingTickAlphaForClipping:");
  v4 = v3;
  -[CAMExposureBiasStatusIndicator _shadowClippingTick](self, "_shadowClippingTick");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (void)_updateHighlightClippingTickAlpha
{
  double v3;
  double v4;
  id v5;

  -[CAMExposureBiasStatusIndicator highlightClipping](self, "highlightClipping");
  -[CAMExposureBiasStatusIndicator _clippingTickAlphaForClipping:](self, "_clippingTickAlphaForClipping:");
  v4 = v3;
  -[CAMExposureBiasStatusIndicator _highlightClippingTick](self, "_highlightClippingTick");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (void)setExposureBiasValue:(double)a3
{
  if (self->_exposureBiasValue != a3)
  {
    self->_exposureBiasValue = a3;
    -[CAMExposureBiasStatusIndicator _updateTicks](self, "_updateTicks");
    -[CAMExposureBiasStatusIndicator _updateExposureLabel](self, "_updateExposureLabel");
  }
}

- (void)setExposureValueVisible:(BOOL)a3
{
  if (self->_exposureValueVisible != a3)
  {
    self->_exposureValueVisible = a3;
    -[CAMExposureBiasStatusIndicator _updateExposureLabel](self, "_updateExposureLabel");
  }
}

- (void)setShadowClipping:(double)a3
{
  double v4;
  void *v5;
  UIView *v6;
  UIView *shadowClippingTick;
  void *v8;

  CEKClamp();
  if (v4 != self->_shadowClipping)
  {
    self->_shadowClipping = sqrt(v4);
    -[CAMExposureBiasStatusIndicator _shadowClippingTick](self, "_shadowClippingTick");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      shadowClippingTick = self->__shadowClippingTick;
      self->__shadowClippingTick = v6;

      CAMRedColor();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->__shadowClippingTick, "setBackgroundColor:", v8);

      -[CAMExposureBiasStatusIndicator addSubview:](self, "addSubview:", self->__shadowClippingTick);
    }
    -[CAMExposureBiasStatusIndicator _layoutShadowClippingTick](self, "_layoutShadowClippingTick");
    -[CAMExposureBiasStatusIndicator _updateShadowClippingTickAlpha](self, "_updateShadowClippingTickAlpha");
  }
}

- (void)setHighlightClipping:(double)a3
{
  double v4;
  void *v5;
  UIView *v6;
  UIView *highlightClippingTick;
  void *v8;

  CEKClamp();
  if (v4 != self->_highlightClipping)
  {
    self->_highlightClipping = sqrt(v4);
    -[CAMExposureBiasStatusIndicator _highlightClippingTick](self, "_highlightClippingTick");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      highlightClippingTick = self->__highlightClippingTick;
      self->__highlightClippingTick = v6;

      CAMRedColor();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->__highlightClippingTick, "setBackgroundColor:", v8);

      -[CAMExposureBiasStatusIndicator addSubview:](self, "addSubview:", self->__highlightClippingTick);
    }
    -[CAMExposureBiasStatusIndicator _layoutHighlightClippingTick](self, "_layoutHighlightClippingTick");
    -[CAMExposureBiasStatusIndicator _updateHighlightClippingTickAlpha](self, "_updateHighlightClippingTickAlpha");
  }
}

- (id)accessibilityIdentifier
{
  return CFSTR("StatusBarExposureButton");
}

- (id)imageNameForAXHUD
{
  return CFSTR("plusminus.circle");
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMExposureBiasStatusIndicator;
  -[CAMControlStatusIndicator hudItemForAccessibilityHUDManager:](&v10, sel_hudItemForAccessibilityHUDManager_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMExposureSlider decimalFormatter](CAMExposureSlider, "decimalFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMExposureBiasStatusIndicator exposureBiasValue](self, "exposureBiasValue");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v8);

  return v4;
}

- (double)exposureBiasValue
{
  return self->_exposureBiasValue;
}

- (BOOL)isExposureValueVisible
{
  return self->_exposureValueVisible;
}

- (double)shadowClipping
{
  return self->_shadowClipping;
}

- (double)highlightClipping
{
  return self->_highlightClipping;
}

- (UILabel)_exposureLabel
{
  return self->__exposureLabel;
}

- (CAMExposureBiasStatusIndicatorTickMarksView)_ticksView
{
  return self->__ticksView;
}

- (UIView)_shadowClippingTick
{
  return self->__shadowClippingTick;
}

- (UIView)_highlightClippingTick
{
  return self->__highlightClippingTick;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__highlightClippingTick, 0);
  objc_storeStrong((id *)&self->__shadowClippingTick, 0);
  objc_storeStrong((id *)&self->__ticksView, 0);
  objc_storeStrong((id *)&self->__exposureLabel, 0);
}

@end
