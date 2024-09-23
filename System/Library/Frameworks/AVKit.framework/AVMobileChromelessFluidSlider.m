@implementation AVMobileChromelessFluidSlider

- (AVMobileChromelessFluidSlider)init
{
  AVMobileChromelessFluidSlider *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVMobileChromelessFluidSlider;
  v2 = -[AVMobileChromelessFluidSlider initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = (uint64_t)v2;
  if (v2)
  {
    -[AVMobileChromelessFluidSlider _updateBarVisualEffectsIfNeeded]((uint64_t)v2);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 11);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(v3 + 544);
    *(_QWORD *)(v3 + 544) = v4;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 16);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(v3 + 552);
    *(_QWORD *)(v3 + 552) = v6;

    v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v9 = *(void **)(v3 + 520);
    *(_QWORD *)(v3 + 520) = v8;

    objc_msgSend(*(id *)(v3 + 520), "setAutoresizingMask:", 0);
    objc_msgSend(*(id *)(v3 + 520), "setUserInteractionEnabled:", 0);
    objc_msgSend(*(id *)(v3 + 520), "setClipsToBounds:", 1);
    objc_msgSend((id)v3, "insertSubview:atIndex:", *(_QWORD *)(v3 + 520), 0);
    -[AVMobileChromelessFluidSlider _setUpSliderConfigurationIfNeeded](v3);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    v11 = *(void **)(v3 + 560);
    *(_QWORD *)(v3 + 560) = v10;

    objc_msgSend((id)v3, "addInteraction:", *(_QWORD *)(v3 + 560));
    *(_QWORD *)(v3 + 624) = 0;
    v12 = *(_OWORD *)(MEMORY[0x1E0DC3298] + 16);
    *(_OWORD *)(v3 + 720) = *MEMORY[0x1E0DC3298];
    *(_OWORD *)(v3 + 736) = v12;
    *(_QWORD *)(v3 + 600) = 0x402E000000000000;
    *(_QWORD *)(v3 + 608) = 0xBFF0000000000000;
    *(_DWORD *)(v3 + 592) = 1065353216;
    *(_QWORD *)(v3 + 648) = 0x4031000000000000;
    v13 = *(void **)(v3 + 640);
    *(_QWORD *)(v3 + 640) = MEMORY[0x1E0C9AA60];

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = *(void **)(v3 + 536);
    *(_QWORD *)(v3 + 536) = v14;

    *(_QWORD *)(v3 + 656) = 1;
    *(_BYTE *)(v3 + 584) = 0;
    *(_QWORD *)(v3 + 672) = 0x3FF0000000000000;
    -[AVMobileChromelessFluidSlider _updateSliderStyle](v3);
  }
  return (AVMobileChromelessFluidSlider *)v3;
}

- (void)setSliderIsOverVideo:(BOOL)a3
{
  uint64_t v3;

  if (self->_sliderIsOverVideo != a3)
  {
    self->_sliderIsOverVideo = a3;
    if (a3)
      v3 = 2;
    else
      v3 = 0;
    -[AVMobileChromelessFluidSlider setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v3);
  }
}

- (void)setBarHeight:(double)a3
{
  void *v4;

  if (self->_barHeight != a3)
  {
    self->_barHeight = a3;
    -[AVMobileChromelessFluidSlider invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVMobileChromelessFluidSlider superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

    -[AVMobileChromelessFluidSlider setNeedsLayout](self, "setNeedsLayout");
    -[UIPointerInteraction invalidate](self->_sliderPointerInteraction, "invalidate");
  }
}

- (void)setBarWidth:(double)a3
{
  if (self->_barWidth != a3)
  {
    self->_barWidth = a3;
    -[AVMobileChromelessFluidSlider setNeedsLayout](self, "setNeedsLayout");
    -[UIPointerInteraction invalidate](self->_sliderPointerInteraction, "invalidate");
  }
}

- (void)setFilledBarVisualEffect:(id)a3
{
  UIVisualEffect *v5;
  UIVisualEffect *v6;

  v5 = (UIVisualEffect *)a3;
  self->_hasSetFilledBarVisualEffect = 1;
  if (self->_filledBarVisualEffect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_filledBarVisualEffect, a3);
    -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
    v5 = v6;
  }

}

- (void)setFineScrubbingStyle:(unint64_t)a3
{
  UISelectionFeedbackGenerator *v4;
  UISelectionFeedbackGenerator *speedChangeFeedbackGenerator;

  if (self->_fineScrubbingStyle != a3)
  {
    self->_fineScrubbingStyle = a3;
    if (-[AVMobileChromelessFluidSlider fineScrubbingStyle](self, "fineScrubbingStyle"))
    {
      if (!self->_speedChangeFeedbackGenerator)
      {
        v4 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
        speedChangeFeedbackGenerator = self->_speedChangeFeedbackGenerator;
        self->_speedChangeFeedbackGenerator = v4;

      }
    }
  }
}

- (void)setPrefersSliderTrackHidden:(BOOL)a3
{
  if (self->_prefersSliderTrackHidden != a3)
  {
    self->_prefersSliderTrackHidden = a3;
    -[AVMobileChromelessFluidSlider _setFluidTrackHidden:](self, "_setFluidTrackHidden:");
    -[AVMobileChromelessFluidSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSnappingValues:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_snappingValues != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_snappingValues, a3);
    -[AVMobileChromelessFluidSlider _setUpSliderConfigurationIfNeeded]((uint64_t)self);
    v5 = v6;
  }

}

- (void)setSliderMarks:(id)a3
{
  NSArray *v5;
  NSArray **p_sliderMarks;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSMutableArray *sliderMarkViews;
  AVMobileFluidSliderMarkView *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *v23;

  v5 = (NSArray *)a3;
  p_sliderMarks = &self->_sliderMarks;
  if (self->_sliderMarks != v5)
  {
    v23 = v5;
    objc_storeStrong((id *)&self->_sliderMarks, a3);
    v7 = -[NSMutableArray count](self->_sliderMarkViews, "count");
    if (v7 != -[NSArray count](*p_sliderMarks, "count"))
    {
      v8 = *MEMORY[0x1E0CD2A68];
      do
      {
        v9 = -[NSMutableArray count](self->_sliderMarkViews, "count");
        v10 = -[NSArray count](*p_sliderMarks, "count");
        sliderMarkViews = self->_sliderMarkViews;
        if (v9 <= v10)
        {
          v13 = -[NSMutableArray count](sliderMarkViews, "count");
          if (v13 >= -[NSArray count](*p_sliderMarks, "count"))
            break;
          v12 = objc_alloc_init(AVMobileFluidSliderMarkView);
          -[NSArray objectAtIndex:](*p_sliderMarks, "objectAtIndex:", -[NSMutableArray count](self->_sliderMarkViews, "count"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "markType");

          v16 = self->_barHeight + -1.0;
          if (v16 >= 1.0)
            v17 = v16 * 0.5;
          else
            v17 = 0.5;
          if (v15 == 1)
            v18 = 1.75;
          else
            v18 = v17;
          -[AVMobileFluidSliderMarkView setAutoresizingMask:](v12, "setAutoresizingMask:", 0, v17);
          -[AVMobileFluidSliderMarkView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
          -[AVMobileFluidSliderMarkView layer](v12, "layer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setMasksToBounds:", 1);

          -[AVMobileFluidSliderMarkView layer](v12, "layer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setCornerRadius:", v18);

          -[AVMobileFluidSliderMarkView layer](v12, "layer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setCornerCurve:", v8);

          -[AVMobileChromelessFluidSlider addSubview:](self, "addSubview:", v12);
          -[NSMutableArray addObject:](self->_sliderMarkViews, "addObject:", v12);
        }
        else
        {
          -[NSMutableArray lastObject](sliderMarkViews, "lastObject");
          v12 = (AVMobileFluidSliderMarkView *)objc_claimAutoreleasedReturnValue();
          -[AVMobileFluidSliderMarkView removeFromSuperview](v12, "removeFromSuperview");
          -[NSMutableArray removeLastObject](self->_sliderMarkViews, "removeLastObject");
        }

        v22 = -[NSMutableArray count](self->_sliderMarkViews, "count");
      }
      while (v22 != -[NSArray count](*p_sliderMarks, "count"));
    }
    -[AVMobileChromelessFluidSlider _updateSliderMarkViewColors]((id *)&self->super.super.super.super.super.isa);
    -[AVMobileChromelessFluidSlider setNeedsLayout](self, "setNeedsLayout");
    v5 = v23;
  }

}

- (void)setStretchLimit:(double)a3
{
  if (self->_stretchLimit != a3)
  {
    self->_stretchLimit = a3;
    -[_UISliderFluidTickConfiguration setStretchLimit:](self->_fluidSliderConfiguration, "setStretchLimit:");
    -[AVMobileChromelessFluidSlider _setSliderConfiguration:](self, "_setSliderConfiguration:", self->_fluidSliderConfiguration);
  }
}

- (void)setTintState:(unint64_t)a3
{
  if (self->_tintState != a3)
  {
    self->_tintState = a3;
    -[AVMobileChromelessFluidSlider _updateBarTintStateAlpha](self);
  }
}

- (void)setTotalValue:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v18 = v9;
  v19 = v8;
  v20 = v7;
  v21 = v3;
  if (vabds_f32(self->_totalValue, a3) >= 0.00000011921)
  {
    self->_totalValue = a3;
    -[AVMobileChromelessFluidSlider maximumValue](self, "maximumValue");
    v14 = v13;
    -[AVMobileChromelessFluidSlider maximumValue](self, "maximumValue");
    v16 = v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      *(float *)&v17 = v16 - (float)(a3 - v14);
      -[AVMobileChromelessFluidSlider _setMaximumEnabledValue:](self, "_setMaximumEnabledValue:", v17);
    }
    -[AVMobileChromelessFluidSlider setNeedsLayout](self, "setNeedsLayout", v10, v18, v19, v20, v4, v21, v5, v6);
    self->_totalValueSet = 1;
  }
}

- (void)setUnfilledBarVisualEffect:(id)a3
{
  UIVisualEffect *v5;
  UIVisualEffect *v6;

  v5 = (UIVisualEffect *)a3;
  self->_hasSetUnFilledBarVisualEffect = 1;
  if (self->_unfilledBarVisualEffect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_unfilledBarVisualEffect, a3);
    -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
    v5 = v6;
  }

}

- (void)setUsesVolumeStyle:(BOOL)a3
{
  if (self->_usesVolumeStyle != a3)
  {
    self->_usesVolumeStyle = a3;
    -[AVMobileChromelessFluidSlider _updateSliderStyle]((uint64_t)self);
  }
}

- (CGRect)frameForSliderMark:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[AVMobileChromelessFluidSlider _frameForSliderMark:](self, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setMaximumValueView:(id)a3
{
  -[_UISliderFluidTickConfiguration setMaximumValueView:](self->_fluidSliderConfiguration, "setMaximumValueView:", a3);
  -[AVMobileChromelessFluidSlider _setSliderConfiguration:](self, "_setSliderConfiguration:", self->_fluidSliderConfiguration);
}

- (void)setVariableSpeedScrubbingOffsetMultiplier:(double)a3
{
  if (self->_variableSpeedScrubbingOffsetMultiplier != a3)
    self->_variableSpeedScrubbingOffsetMultiplier = a3;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double barWidth;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double barHeight;
  AVMobileChromelessFluidSlider *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
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
  CGRect result;

  barWidth = self->_barWidth;
  if (barWidth == -1.0)
  {
    -[AVMobileChromelessFluidSlider bounds](self, "bounds");
    barWidth = v5;
  }
  -[AVMobileChromelessFluidSlider bounds](self, "bounds");
  v7 = v6;
  -[AVMobileChromelessFluidSlider bounds](self, "bounds");
  v9 = v8;
  barHeight = self->_barHeight;
  if (-[AVMobileChromelessFluidSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    v11 = self;
    -[AVMobileChromelessFluidSlider superview](v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;

    -[AVMobileChromelessFluidSlider superview](v11, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;
      objc_msgSend(v16, "contentInset");
      v18 = v17;
      v20 = v19;
      objc_msgSend(v16, "bounds");
      v22 = v21 - (v18 + v20);
      objc_msgSend(v16, "contentSize");
      v24 = v23;

      v14 = v22 + fmax(v24 - v22, 0.0);
    }
    v7 = v14 - v7 - barWidth;

  }
  v25 = v7;
  v26 = v9;
  v27 = barWidth;
  v28 = barHeight;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessFluidSlider;
  -[AVMobileChromelessFluidSlider didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVMobileChromelessFluidSlider _updateBarTintStateAlpha](self);
  -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessFluidSlider _updateSliderMarkViewColors]((id *)&self->super.super.super.super.super.isa);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isDescendantOfView:", self);

  return (char)self;
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
  double top;
  double leading;
  double bottom;
  double trailing;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  v23.receiver = self;
  v23.super_class = (Class)AVMobileChromelessFluidSlider;
  -[AVMobileChromelessFluidSlider hitRect](&v23, sel_hitRect);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  top = self->_directionalHitRectInsets.top;
  leading = self->_directionalHitRectInsets.leading;
  bottom = self->_directionalHitRectInsets.bottom;
  trailing = self->_directionalHitRectInsets.trailing;
  v15 = -[AVMobileChromelessFluidSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v15 == 1)
    v16 = trailing;
  else
    v16 = leading;
  if (v15 == 1)
    v17 = leading;
  else
    v17 = trailing;
  v18 = v8 - (v16 + v17);
  v19 = v4 + v16 + -20.0;
  v20 = v6 + top + -20.0;
  v21 = v18 + 40.0;
  v22 = v10 - (top + bottom) + 40.0;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double barHeight;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  barHeight = self->_barHeight;
  result.height = barHeight;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  UIView *contentView;
  NSUInteger v5;
  NSObject *v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  char v22;
  void *v23;
  objc_super v24;
  uint8_t buf[16];

  v24.receiver = self;
  v24.super_class = (Class)AVMobileChromelessFluidSlider;
  -[AVMobileChromelessFluidSlider layoutSubviews](&v24, sel_layoutSubviews);
  v3 = -[AVMobileChromelessFluidSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  contentView = self->_contentView;
  -[AVMobileChromelessFluidSlider bounds](self, "bounds");
  -[UIView avkit_setFrame:inLayoutDirection:](contentView, "avkit_setFrame:inLayoutDirection:", v3);
  if (-[NSArray count](self->_sliderMarks, "count"))
  {
    v5 = -[NSArray count](self->_sliderMarks, "count");
    if (v5 != -[NSMutableArray count](self->_sliderMarkViews, "count"))
    {
      _AVLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_ERROR, "Error: Slider mark count does not match slider mark view count", buf, 2u);
      }

    }
    v7 = -[NSArray count](self->_sliderMarks, "count");
    v8 = -[NSMutableArray count](self->_sliderMarkViews, "count");
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    if (v9 >= 1)
    {
      for (i = 0; i != v9; ++i)
      {
        -[NSArray objectAtIndex:](self->_sliderMarks, "objectAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_sliderMarkViews, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMobileChromelessFluidSlider _frameForSliderMark:](self, v11);
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(v12, "setFrame:");
        -[AVMobileChromelessFluidSlider delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) != 0)
        {
          -[AVMobileChromelessFluidSlider delegate](self, "delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "slider:didUpdateFrame:forSliderMark:", self, v11, v14, v16, v18, v20);

        }
      }
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[AVMobileChromelessFluidSlider hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessFluidSlider;
  v4 = a3;
  -[AVMobileChromelessFluidSlider traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[AVMobileChromelessFluidSlider traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[AVMobileChromelessFluidSlider _updateBarVisualEffectsIfNeeded]((uint64_t)self);
    -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0DC3D90];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithView:", v7);
  objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredTintMode:", 0);
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  -[UIView frame](self->_contentView, "frame", a3, a4, a5);
  return (id)objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0);
}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;
  UISelectionFeedbackGenerator *speedChangeFeedbackGenerator;
  BOOL v10;

  -[AVMobileChromelessFluidSlider delegate](self, "delegate", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVMobileChromelessFluidSlider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sliderDidBeginTracking:", self);

  }
  if (self)
    -[UIPointerInteraction invalidate](self->_sliderPointerInteraction, "invalidate");
  v8 = -[AVMobileChromelessFluidSlider fineScrubbingStyle](self, "fineScrubbingStyle");
  speedChangeFeedbackGenerator = self->_speedChangeFeedbackGenerator;
  if (speedChangeFeedbackGenerator)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
    -[UISelectionFeedbackGenerator prepare](speedChangeFeedbackGenerator, "prepare");
}

- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4
{
  double y;
  double v6;
  double v7;
  char v8;
  char v9;
  float v10;
  double variableSpeedScrubbingOffsetMultiplier;
  float v12;
  float v13;
  float v15;
  float v16;
  float v18;
  _BOOL4 v19;
  _BOOL4 v20;
  float v21;
  uint64_t v22;
  double v23;

  y = a4.y;
  if (-[AVMobileChromelessFluidSlider fineScrubbingStyle](self, "fineScrubbingStyle", a3, a4.x))
  {
    -[AVMobileChromelessFluidSlider center](self, "center");
    v7 = y - v6;
    v8 = -[AVMobileChromelessFluidSlider fineScrubbingStyle](self, "fineScrubbingStyle");
    v9 = -[AVMobileChromelessFluidSlider fineScrubbingStyle](self, "fineScrubbingStyle");
    if (((v8 & 2) != 0 || v7 <= 0.0) && ((v9 & 1) != 0 || v7 >= 0.0))
    {
      v10 = fabs(v7);
      variableSpeedScrubbingOffsetMultiplier = self->_variableSpeedScrubbingOffsetMultiplier;
      v12 = variableSpeedScrubbingOffsetMultiplier * 196.0;
      v13 = vabds_f32(v10, v12);
      if (v10 <= v12 || v13 < 0.00000011921)
      {
        v15 = variableSpeedScrubbingOffsetMultiplier * 140.0;
        v16 = vabds_f32(v10, v15);
        if (v10 <= v15 || v16 < 0.00000011921)
        {
          v18 = variableSpeedScrubbingOffsetMultiplier * 84.0;
          v19 = v10 > v18;
          v20 = vabds_f32(v10, v18) >= 0.00000011921;
          if (v19 && v20)
            v21 = 0.5;
          else
            v21 = 1.0;
          if (v19 && v20)
            v22 = 2;
          else
            v22 = 0;
        }
        else
        {
          v21 = 0.25;
          v22 = 1;
        }
      }
      else
      {
        v21 = 0.125;
        v22 = 3;
      }
      -[AVMobileChromelessFluidSlider _sliderSpeedMultiplier](self, "_sliderSpeedMultiplier");
      if (*(float *)&v23 != v21)
      {
        *(float *)&v23 = v21;
        -[AVMobileChromelessFluidSlider _setSliderSpeedMultiplier:](self, "_setSliderSpeedMultiplier:", v23);
        -[UISelectionFeedbackGenerator selectionChanged](self->_speedChangeFeedbackGenerator, "selectionChanged");
        -[AVMobileChromelessFluidSlider _notifyDelegateAboutSpeedRateChangeToRate:](self, v22);
      }
    }
  }
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[AVMobileChromelessFluidSlider delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVMobileChromelessFluidSlider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sliderWillEndTracking:", self);

  }
  if (self)
    -[UIPointerInteraction invalidate](self->_sliderPointerInteraction, "invalidate");
}

- (void)_sliderFluidInteractionDidEnd:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;

  -[AVMobileChromelessFluidSlider delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVMobileChromelessFluidSlider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sliderDidEndTracking:", self);

  }
  -[AVMobileChromelessFluidSlider _sliderSpeedMultiplier](self, "_sliderSpeedMultiplier");
  if (*(float *)&v7 != 1.0)
  {
    LODWORD(v7) = 1.0;
    -[AVMobileChromelessFluidSlider _setSliderSpeedMultiplier:](self, "_setSliderSpeedMultiplier:", v7);
    -[AVMobileChromelessFluidSlider _notifyDelegateAboutSpeedRateChangeToRate:](self, 0);
  }
}

- (void)_sliderFluidInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v9;
  char v10;
  id v11;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  -[AVMobileChromelessFluidSlider delegate](self, "delegate", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[AVMobileChromelessFluidSlider delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "slider:didExtendWithInsets:", self, top, left, bottom, right);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[AVMobileChromelessFluidSlider isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessFluidSlider;
    -[AVMobileChromelessFluidSlider setEnabled:](&v5, sel_setEnabled_, v3);
    -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
  }
}

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentIntersection;
  double v9;
  _BOOL8 v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.x = x;
    p_contentIntersection->origin.y = y;
    p_contentIntersection->size.width = width;
    p_contentIntersection->size.height = height;
    -[AVMobileChromelessFluidSlider bounds](self, "bounds");
    v12 = (v9 >= 0.0 && ((*(_QWORD *)&v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
        || (unint64_t)(*(_QWORD *)&v9 - 1) <= 0xFFFFFFFFFFFFELL)
       && p_contentIntersection->size.width / v9 > 0.8;
    -[AVMobileChromelessFluidSlider setSliderIsOverVideo:](self, "setSliderIsOverVideo:", v12);
  }
}

- (BOOL)sliderIsOverVideo
{
  return self->_sliderIsOverVideo;
}

- (double)barHeight
{
  return self->_barHeight;
}

- (double)barWidth
{
  return self->_barWidth;
}

- (UIVisualEffect)filledBarVisualEffect
{
  return self->_filledBarVisualEffect;
}

- (unint64_t)fineScrubbingStyle
{
  return self->_fineScrubbingStyle;
}

- (BOOL)prefersSliderTrackHidden
{
  return self->_prefersSliderTrackHidden;
}

- (NSArray)snappingValues
{
  return self->_snappingValues;
}

- (NSArray)sliderMarks
{
  return self->_sliderMarks;
}

- (double)stretchLimit
{
  return self->_stretchLimit;
}

- (unint64_t)tintState
{
  return self->_tintState;
}

- (float)totalValue
{
  return self->_totalValue;
}

- (UIVisualEffect)unfilledBarVisualEffect
{
  return self->_unfilledBarVisualEffect;
}

- (double)variableSpeedScrubbingOffsetMultiplier
{
  return self->_variableSpeedScrubbingOffsetMultiplier;
}

- (CGRect)contentIntersection
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentIntersection.origin.x;
  y = self->_contentIntersection.origin.y;
  width = self->_contentIntersection.size.width;
  height = self->_contentIntersection.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (AVMobileChromelessFluidSliderDelegate)delegate
{
  return (AVMobileChromelessFluidSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)usesVolumeStyle
{
  return self->_usesVolumeStyle;
}

- (NSDirectionalEdgeInsets)directionalHitRectInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_directionalHitRectInsets.top;
  leading = self->_directionalHitRectInsets.leading;
  bottom = self->_directionalHitRectInsets.bottom;
  trailing = self->_directionalHitRectInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setDirectionalHitRectInsets:(NSDirectionalEdgeInsets)a3
{
  self->_directionalHitRectInsets = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unfilledBarVisualEffect, 0);
  objc_storeStrong((id *)&self->_sliderMarks, 0);
  objc_storeStrong((id *)&self->_snappingValues, 0);
  objc_storeStrong((id *)&self->_filledBarVisualEffect, 0);
  objc_storeStrong((id *)&self->_fluidSliderConfiguration, 0);
  objc_storeStrong((id *)&self->_speedChangeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_sliderPointerInteraction, 0);
  objc_storeStrong((id *)&self->_disabledUnfilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_disabledFilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_sliderMarkViews, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_updateSliderBarMaterials
{
  id v2;
  id v3;
  id v4;
  id v5;

  if (a1)
  {
    v5 = a1[68];
    v2 = a1[69];
    if (objc_msgSend(a1, "isEnabled"))
    {
      v3 = a1[77];

      v4 = a1[83];
      v5 = v3;
      v2 = v4;
    }
    objc_msgSend(a1[72], "setMaximumTrackEffect:", v2);
    objc_msgSend(a1[72], "setMinimumTrackEffect:", v5);
    objc_msgSend(a1, "_setSliderConfiguration:", a1[72]);

  }
}

- (void)_notifyDelegateAboutSpeedRateChangeToRate:(void *)a1
{
  void *v4;
  char v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(a1, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "slider:didChangeScrubbingRate:", a1, a2);

    }
  }
}

- (void)_updateBarVisualEffectsIfNeeded
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceStyle");

    if (v3 == 1)
    {
      if (!*(_BYTE *)(a1 + 585))
      {
        v4 = (void *)MEMORY[0x1E0DC3F50];
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "effectCompositingColor:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v6;
        objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "effectCombiningEffects:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 616);
        *(_QWORD *)(a1 + 616) = v9;

      }
      if (!*(_BYTE *)(a1 + 586))
      {
        v11 = (void *)MEMORY[0x1E0DC3F50];
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "effectCompositingColor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v13;
        objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "effectCombiningEffects:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 664);
        *(_QWORD *)(a1 + 664) = v16;

      }
    }
    else
    {
      if (!*(_BYTE *)(a1 + 585))
      {
        objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 14);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 616);
        *(_QWORD *)(a1 + 616) = v18;

      }
      if (!*(_BYTE *)(a1 + 586))
      {
        objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 11);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(a1 + 664);
        *(_QWORD *)(a1 + 664) = v20;

      }
    }
  }
}

- (void)_frameForSliderMark:(void *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  float v6;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "bounds");
    v4 = v3;
    objc_msgSend(a1, "bounds");
    v5 = objc_msgSend(v4, "markType");
    if (v5 == 2 || !v5)
    {
      objc_msgSend(v4, "endValue");
      objc_msgSend(v4, "startValue");
      objc_msgSend(a1, "maximumValue");
      objc_msgSend(a1, "minimumValue");
    }

    objc_msgSend(v4, "startValue");
    -[AVMobileChromelessFluidSlider _normalizeSliderMarkValue:]((uint64_t)a1, v6);
    objc_msgSend(v4, "markType");

  }
}

- (float)_normalizeSliderMarkValue:(uint64_t)a1
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;

  if (*(_BYTE *)(a1 + 584))
  {
    v4 = *(float *)(a1 + 592);
  }
  else
  {
    objc_msgSend((id)a1, "maximumValue");
    v4 = v5;
  }
  objc_msgSend((id)a1, "minimumValue");
  v7 = v6;
  objc_msgSend((id)a1, "minimumValue");
  return (float)(a2 - v7) / (float)(v4 - v8);
}

- (void)_updateBarTintStateAlpha
{
  void *v1;
  unint64_t v2;
  double v3;
  NSObject *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, "tintState");
    objc_opt_self();
    if (v2 >= 3)
    {
      _AVLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 134217984;
        v6 = v2;
        _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Error: Unrecognized slider tint state %ld", (uint8_t *)&v5, 0xCu);
      }

      v3 = 1.0;
    }
    else
    {
      v3 = dbl_1AC5F80C8[v2];
    }
    return (void *)objc_msgSend(v1, "setAlpha:", v3);
  }
  return result;
}

- (void)_updateSliderMarkViewColors
{
  uint64_t v2;
  NSObject *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t v18[8];
  double v19;

  if (a1)
  {
    v2 = objc_msgSend(a1[80], "count");
    if (v2 != objc_msgSend(a1[67], "count"))
    {
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Error: Slider mark count does not match slider mark view count", v18, 2u);
      }

    }
    v4 = objc_msgSend(a1[80], "count");
    v5 = objc_msgSend(a1[67], "count");
    if (v4 >= v5)
      v6 = v5;
    else
      v6 = v4;
    if (v6 >= 1)
    {
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(a1[80], "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[67], "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unfilledColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "value");
        v12 = v11;
        objc_msgSend(v8, "startValue");
        if (v12 >= v13)
        {
          objc_msgSend(v8, "filledColor");
          v14 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v14;
        }
        v15 = v10;
        objc_opt_self();
        objc_opt_self();
        v19 = 0.0;
        objc_msgSend(v15, "getRed:green:blue:alpha:", 0, 0, 0, &v19);
        objc_msgSend(v15, "colorWithAlphaComponent:", v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "backgroundColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 != v16)
          objc_msgSend(v9, "setMarkColor:", v16);

      }
    }
  }
}

- (uint64_t)_updateSliderStyle
{
  _BYTE *v1;
  uint64_t v2;

  if (result)
  {
    v1 = (_BYTE *)result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      if (v1[589])
        v2 = 111;
      else
        v2 = 110;
      return objc_msgSend(v1, "_setSliderStyle:", v2);
    }
  }
  return result;
}

- (void)_setUpSliderConfigurationIfNeeded
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  id v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend((id)a1, "snappingValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "floatValue");
          v9 = -[AVMobileChromelessFluidSlider _normalizeSliderMarkValue:](a1, v8);
          v10 = objc_alloc(MEMORY[0x1E0DC4358]);
          *(float *)&v11 = v9;
          v12 = (void *)objc_msgSend(v10, "initWithPosition:title:image:", 0, 0, v11);
          objc_msgSend(v2, "addObject:", v12);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4350]), "initWithTicks:behavior:", v2, 2);
    v14 = *(void **)(a1 + 576);
    *(_QWORD *)(a1 + 576) = v13;

    objc_msgSend(*(id *)(a1 + 576), "setTickStyle:", 0x7FFFFFFFFFFFFFFFLL);
    LODWORD(v15) = 1008981770;
    objc_msgSend(*(id *)(a1 + 576), "setSnappingDistance:", v15);
    objc_msgSend(*(id *)(a1 + 576), "setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 576), "setExpansionFactor:", 1.0);
    objc_msgSend(*(id *)(a1 + 576), "setStretchLimit:", 17.0);
    objc_msgSend(*(id *)(a1 + 576), "setMaximumTrackEffect:", *(_QWORD *)(a1 + 664));
    objc_msgSend(*(id *)(a1 + 576), "setMinimumTrackEffect:", *(_QWORD *)(a1 + 616));
    objc_msgSend((id)a1, "_setSliderConfiguration:", *(_QWORD *)(a1 + 576));

  }
}

+ (double)variableSpeedScrubbingMultiplierForDistanceToEdge:(double)a3
{
  return fmin(a3 / 196.0, 1.0);
}

@end
