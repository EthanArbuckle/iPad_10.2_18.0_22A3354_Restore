@implementation AVMobileChromelessSlider

- (AVMobileChromelessSlider)init
{
  AVMobileChromelessSlider *v2;
  uint64_t v3;
  UIVisualEffect *enabledFilledBarViewEffect;
  uint64_t v5;
  UIVisualEffect *enabledUnfilledBarViewEffect;
  uint64_t v7;
  UIVisualEffect *disabledFilledBarViewEffect;
  uint64_t v9;
  UIVisualEffect *disabledUnfilledBarViewEffect;
  UIView *v11;
  UIView *contentView;
  UIVisualEffectView *v13;
  UIVisualEffectView *filledBarView;
  UIVisualEffectView *v15;
  UIVisualEffectView *unfilledBarView;
  uint64_t v17;
  UIPointerInteraction *sliderPointerInteraction;
  NSArray *sliderMarks;
  NSMutableArray *v20;
  NSMutableArray *sliderMarkViews;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AVMobileChromelessSlider;
  v2 = -[AVMobileChromelessSlider initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 14);
    v3 = objc_claimAutoreleasedReturnValue();
    enabledFilledBarViewEffect = v2->_enabledFilledBarViewEffect;
    v2->_enabledFilledBarViewEffect = (UIVisualEffect *)v3;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 11);
    v5 = objc_claimAutoreleasedReturnValue();
    enabledUnfilledBarViewEffect = v2->_enabledUnfilledBarViewEffect;
    v2->_enabledUnfilledBarViewEffect = (UIVisualEffect *)v5;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 11);
    v7 = objc_claimAutoreleasedReturnValue();
    disabledFilledBarViewEffect = v2->_disabledFilledBarViewEffect;
    v2->_disabledFilledBarViewEffect = (UIVisualEffect *)v7;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 16);
    v9 = objc_claimAutoreleasedReturnValue();
    disabledUnfilledBarViewEffect = v2->_disabledUnfilledBarViewEffect;
    v2->_disabledUnfilledBarViewEffect = (UIVisualEffect *)v9;

    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v2->_contentView;
    v2->_contentView = v11;

    -[UIView setAutoresizingMask:](v2->_contentView, "setAutoresizingMask:", 0);
    -[UIView setUserInteractionEnabled:](v2->_contentView, "setUserInteractionEnabled:", 0);
    -[UIView setClipsToBounds:](v2->_contentView, "setClipsToBounds:", 1);
    -[AVMobileChromelessSlider addSubview:](v2, "addSubview:", v2->_contentView);
    v13 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    filledBarView = v2->_filledBarView;
    v2->_filledBarView = v13;

    -[UIVisualEffectView setAutoresizingMask:](v2->_filledBarView, "setAutoresizingMask:", 0);
    -[UIVisualEffectView setUserInteractionEnabled:](v2->_filledBarView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v2->_contentView, "addSubview:", v2->_filledBarView);
    v15 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    unfilledBarView = v2->_unfilledBarView;
    v2->_unfilledBarView = v15;

    -[UIVisualEffectView setAutoresizingMask:](v2->_unfilledBarView, "setAutoresizingMask:", 0);
    -[UIVisualEffectView setUserInteractionEnabled:](v2->_unfilledBarView, "setUserInteractionEnabled:", 0);
    -[UIView insertSubview:belowSubview:](v2->_contentView, "insertSubview:belowSubview:", v2->_unfilledBarView, v2->_filledBarView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v2);
    sliderPointerInteraction = v2->_sliderPointerInteraction;
    v2->_sliderPointerInteraction = (UIPointerInteraction *)v17;

    -[AVMobileChromelessSlider addInteraction:](v2, "addInteraction:", v2->_sliderPointerInteraction);
    v2->_barHeight = 10.0;
    v2->_value = 0.0;
    v2->_minimumValue = 0.0;
    v2->_maximumValue = 1.0;
    v2->_totalValue = 1.0;
    sliderMarks = v2->_sliderMarks;
    v2->_sliderMarks = (NSArray *)MEMORY[0x1E0C9AA60];

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sliderMarkViews = v2->_sliderMarkViews;
    v2->_sliderMarkViews = v20;

    v2->_tintState = 1;
    -[AVMobileChromelessSlider setIsAccessibilityElement:](v2, "setIsAccessibilityElement:", 1);
    -[AVMobileChromelessSlider setAccessibilityTraits:](v2, "setAccessibilityTraits:", *MEMORY[0x1E0DC4650]);
    -[AVMobileChromelessSlider _updateAccessibilityValue](v2, "_updateAccessibilityValue");
  }
  return v2;
}

- (void)setBarHeight:(double)a3
{
  void *v4;

  if (self->_barHeight != a3)
  {
    self->_barHeight = a3;
    -[AVMobileChromelessSlider invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVMobileChromelessSlider superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

    -[AVMobileChromelessSlider setNeedsLayout](self, "setNeedsLayout");
    -[UIPointerInteraction invalidate](self->_sliderPointerInteraction, "invalidate");
  }
}

- (void)setMinimumValue:(float)a3
{
  if (self->_minimumValue != a3 && self->_maximumValue > a3)
  {
    self->_minimumValue = a3;
    if (self->_value > a3)
      -[AVMobileChromelessSlider setValue:](self, "setValue:");
  }
}

- (void)setMaximumValue:(float)a3
{
  if (self->_maximumValue != a3 && self->_minimumValue < a3)
  {
    self->_maximumValue = a3;
    if (self->_value > a3)
      -[AVMobileChromelessSlider setValue:](self, "setValue:");
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
  AVMobileSliderMarkView *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;

  v5 = (NSArray *)a3;
  p_sliderMarks = &self->_sliderMarks;
  if (self->_sliderMarks != v5)
  {
    v25 = v5;
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
          v12 = objc_alloc_init(AVMobileSliderMarkView);
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
          -[AVMobileSliderMarkView setAutoresizingMask:](v12, "setAutoresizingMask:", 0, v17);
          -[AVMobileSliderMarkView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
          -[AVMobileSliderMarkView layer](v12, "layer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setMasksToBounds:", 1);

          -[AVMobileSliderMarkView layer](v12, "layer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setCornerRadius:", v18);

          -[AVMobileSliderMarkView layer](v12, "layer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setCornerCurve:", v8);

          -[NSArray objectAtIndexedSubscript:](*p_sliderMarks, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_sliderMarkViews, "count"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "markType");

          if (v23 == 2)
            -[UIView insertSubview:belowSubview:](self->_contentView, "insertSubview:belowSubview:", v12, self->_filledBarView);
          else
            -[AVMobileChromelessSlider addSubview:](self, "addSubview:", v12);
          -[NSMutableArray addObject:](self->_sliderMarkViews, "addObject:", v12);
        }
        else
        {
          -[NSMutableArray lastObject](sliderMarkViews, "lastObject");
          v12 = (AVMobileSliderMarkView *)objc_claimAutoreleasedReturnValue();
          -[AVMobileSliderMarkView removeFromSuperview](v12, "removeFromSuperview");
          -[NSMutableArray removeLastObject](self->_sliderMarkViews, "removeLastObject");
        }

        v24 = -[NSMutableArray count](self->_sliderMarkViews, "count");
      }
      while (v24 != -[NSArray count](*p_sliderMarks, "count"));
    }
    -[AVMobileChromelessSlider _updateSliderMarkViewColors]((uint64_t)self);
    -[AVMobileChromelessSlider setNeedsLayout](self, "setNeedsLayout");
    v5 = v25;
  }

}

- (void)setTintState:(unint64_t)a3
{
  if (self->_tintState != a3)
  {
    self->_tintState = a3;
    -[AVMobileChromelessSlider _updateBarTintStateAlpha](self, "_updateBarTintStateAlpha");
  }
}

- (void)setTotalValue:(float)a3
{
  if (vabds_f32(self->_totalValue, a3) >= 0.00000011921)
  {
    self->_totalValue = a3;
    -[AVMobileChromelessSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateBarTintStateAlpha
{
  unint64_t v3;
  double v4;
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[AVMobileChromelessSlider tintState](self, "tintState");
  objc_opt_self();
  if (v3 >= 3)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 134217984;
      v7 = v3;
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "Error: Unrecognized slider tint state %ld", (uint8_t *)&v6, 0xCu);
    }

    v4 = 1.0;
  }
  else
  {
    v4 = dbl_1AC5F80C8[v3];
  }
  -[UIVisualEffectView setAlpha:](self->_filledBarView, "setAlpha:", v4);
  -[UIVisualEffectView setAlpha:](self->_unfilledBarView, "setAlpha:", v4);
}

- (void)setValue:(float)maximumValue
{
  if (maximumValue >= self->_maximumValue)
    maximumValue = self->_maximumValue;
  if (self->_minimumValue >= maximumValue)
    maximumValue = self->_minimumValue;
  if (self->_value != maximumValue)
  {
    self->_value = maximumValue;
    -[AVMobileChromelessSlider _updateBarViewFrames](self);
    -[AVMobileChromelessSlider _updateSliderMarkViewColors]((uint64_t)self);
    -[AVMobileChromelessSlider _updateAccessibilityValue](self, "_updateAccessibilityValue");
  }
}

- (CGRect)frameForSliderMark:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[AVMobileChromelessSlider _frameForSliderMark:](self, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessSlider;
  -[AVMobileChromelessSlider didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVMobileChromelessSlider _updateBarTintStateAlpha](self, "_updateBarTintStateAlpha");
  -[AVMobileChromelessSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.isa);
  -[AVMobileChromelessSlider _updateSliderMarkViewColors]((uint64_t)self);
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
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect result;

  v10.receiver = self;
  v10.super_class = (Class)AVMobileChromelessSlider;
  -[AVMobileChromelessSlider hitRect](&v10, sel_hitRect);
  v3 = v2 + -20.0;
  v5 = v4 + -20.0;
  v7 = v6 + 40.0;
  v9 = v8 + 40.0;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v5;
  result.origin.x = v3;
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
  void *v5;
  NSUInteger v6;
  NSObject *v7;
  NSUInteger v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  char v23;
  void *v24;
  objc_super v25;
  uint8_t buf[16];

  v25.receiver = self;
  v25.super_class = (Class)AVMobileChromelessSlider;
  -[AVMobileChromelessSlider layoutSubviews](&v25, sel_layoutSubviews);
  v3 = -[AVMobileChromelessSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  contentView = self->_contentView;
  -[AVMobileChromelessSlider bounds](self, "bounds");
  -[UIView avkit_setFrame:inLayoutDirection:](contentView, "avkit_setFrame:inLayoutDirection:", v3);
  -[AVMobileChromelessSlider _updateBarViewFrames](self);
  -[UIView layer](self->_contentView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", self->_barHeight * 0.5);

  if (-[NSArray count](self->_sliderMarks, "count"))
  {
    v6 = -[NSArray count](self->_sliderMarks, "count");
    if (v6 != -[NSMutableArray count](self->_sliderMarkViews, "count"))
    {
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Error: Slider mark count does not match slider mark view count", buf, 2u);
      }

    }
    v8 = -[NSArray count](self->_sliderMarks, "count");
    v9 = -[NSMutableArray count](self->_sliderMarkViews, "count");
    if (v8 >= v9)
      v10 = v9;
    else
      v10 = v8;
    if (v10 >= 1)
    {
      for (i = 0; i != v10; ++i)
      {
        -[NSArray objectAtIndex:](self->_sliderMarks, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_sliderMarkViews, "objectAtIndex:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMobileChromelessSlider _frameForSliderMark:](self, v12);
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v13, "setFrame:");
        -[AVMobileChromelessSlider delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_opt_respondsToSelector();

        if ((v23 & 1) != 0)
        {
          -[AVMobileChromelessSlider delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "slider:didUpdateFrame:forSliderMark:", self, v12, v15, v17, v19, v21);

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
  -[AVMobileChromelessSlider hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
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
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  -[UIView frame](self->_contentView, "frame", a3, a4, a5);
  return (id)objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  void *v11;
  char v12;
  void *v13;

  v5 = a3;
  -[AVMobileChromelessSlider bounds](self, "bounds");
  v7 = fmax(v6, 1.0);
  objc_msgSend(v5, "locationInView:", self);
  v9 = v8;

  v10 = v9 / v7;
  self->_trackingTouchStartNormalizedX = v10;
  self->_trackingStartNormalizedValue = (float)(self->_value - self->_minimumValue)
                                      / (float)(self->_maximumValue - self->_minimumValue);
  -[AVMobileChromelessSlider delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AVMobileChromelessSlider delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sliderDidBeginTracking:", self);

  }
  -[UIPointerInteraction invalidate](self->_sliderPointerInteraction, "invalidate");
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  uint64_t v13;
  double v14;
  BOOL v15;
  objc_super v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  -[AVMobileChromelessSlider bounds](self, "bounds");
  v11 = v9 / fmax(v10, 1.0);
  v12 = v11 - self->_trackingTouchStartNormalizedX;
  v13 = -[AVMobileChromelessSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  *(float *)&v14 = -v12;
  if (v13 != 1)
    *(float *)&v14 = v12;
  *(float *)&v14 = self->_minimumValue
                 + (float)((float)(self->_trackingStartNormalizedValue + *(float *)&v14)
                         * (float)(self->_maximumValue - self->_minimumValue));
  -[AVMobileChromelessSlider setValue:](self, "setValue:", v14);
  -[AVMobileChromelessSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  v17.receiver = self;
  v17.super_class = (Class)AVMobileChromelessSlider;
  v15 = -[AVMobileChromelessSlider continueTrackingWithTouch:withEvent:](&v17, sel_continueTrackingWithTouch_withEvent_, v7, v6);

  return v15;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  uint64_t v13;
  double v14;
  void *v15;
  char v16;
  void *v17;
  objc_super v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  -[AVMobileChromelessSlider bounds](self, "bounds");
  v11 = v9 / fmax(v10, 1.0);
  v12 = v11 - self->_trackingTouchStartNormalizedX;
  v13 = -[AVMobileChromelessSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  *(float *)&v14 = -v12;
  if (v13 != 1)
    *(float *)&v14 = v12;
  *(float *)&v14 = self->_minimumValue
                 + (float)((float)(self->_trackingStartNormalizedValue + *(float *)&v14)
                         * (float)(self->_maximumValue - self->_minimumValue));
  -[AVMobileChromelessSlider setValue:](self, "setValue:", v14);
  -[AVMobileChromelessSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  -[AVMobileChromelessSlider delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[AVMobileChromelessSlider delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sliderWillEndTracking:", self);

  }
  -[UIPointerInteraction invalidate](self->_sliderPointerInteraction, "invalidate");
  v18.receiver = self;
  v18.super_class = (Class)AVMobileChromelessSlider;
  -[AVMobileChromelessSlider endTrackingWithTouch:withEvent:](&v18, sel_endTrackingWithTouch_withEvent_, v7, v6);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessSlider;
  -[AVMobileChromelessSlider cancelTrackingWithEvent:](&v7, sel_cancelTrackingWithEvent_, a3);
  -[AVMobileChromelessSlider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVMobileChromelessSlider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sliderDidEndTracking:", self);

  }
  if (self)
    -[UIPointerInteraction invalidate](self->_sliderPointerInteraction, "invalidate");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[AVMobileChromelessSlider isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessSlider;
    -[AVMobileChromelessSlider setEnabled:](&v5, sel_setEnabled_, v3);
    -[AVMobileChromelessSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.isa);
  }
}

- (void)accessibilityIncrement
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;

  -[AVMobileChromelessSlider value](self, "value");
  v4 = v3;
  v5 = self->_maximumValue - self->_minimumValue;
  -[AVMobileChromelessSlider value](self, "value");
  v7 = v6 + v5 * 0.05;
  if (v4 != v7)
  {
    -[AVMobileChromelessSlider setValue:](self, "setValue:");
    -[AVMobileChromelessSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (void)accessibilityDecrement
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;

  -[AVMobileChromelessSlider value](self, "value");
  v4 = v3;
  v5 = self->_maximumValue - self->_minimumValue;
  -[AVMobileChromelessSlider value](self, "value");
  v7 = v6 + v5 * -0.05;
  if (v4 != v7)
  {
    -[AVMobileChromelessSlider setValue:](self, "setValue:");
    -[AVMobileChromelessSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (void)_updateAccessibilityValue
{
  double v2;
  void *v4;
  void *v5;
  id v6;

  *(float *)&v2 = (float)(self->_value - self->_minimumValue) / (float)(self->_maximumValue - self->_minimumValue);
  v4 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[AVMobileChromelessSlider setAccessibilityValue:](self, "setAccessibilityValue:", v6);
}

- (void)interruptActiveInteractions
{
  -[AVMobileChromelessSlider cancelTrackingWithEvent:](self, "cancelTrackingWithEvent:", 0);
}

- (double)barHeight
{
  return self->_barHeight;
}

- (float)minimumValue
{
  return self->_minimumValue;
}

- (float)maximumValue
{
  return self->_maximumValue;
}

- (NSArray)sliderMarks
{
  return self->_sliderMarks;
}

- (unint64_t)tintState
{
  return self->_tintState;
}

- (float)totalValue
{
  return self->_totalValue;
}

- (float)value
{
  return self->_value;
}

- (AVMobileChromelessSliderDelegate)delegate
{
  return (AVMobileChromelessSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sliderMarks, 0);
  objc_storeStrong((id *)&self->_sliderPointerInteraction, 0);
  objc_storeStrong((id *)&self->_disabledUnfilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_disabledFilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_enabledUnfilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_enabledFilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_sliderMarkViews, 0);
  objc_storeStrong((id *)&self->_unfilledBarView, 0);
  objc_storeStrong((id *)&self->_filledBarView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_updateSliderBarMaterials
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  if (a1)
  {
    v6 = a1[65];
    v2 = a1[66];
    if (objc_msgSend(a1, "isEnabled"))
    {
      v3 = a1[63];

      v4 = a1[64];
      v5 = v3;
      v2 = v4;
    }
    else
    {
      v5 = v6;
    }
    v7 = v5;
    objc_msgSend(a1[59], "setEffect:", v5);
    objc_msgSend(a1[60], "setEffect:", v2);

  }
}

- (void)_updateBarViewFrames
{
  void *v1;
  double v2;
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
  uint64_t v13;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "bounds");
    v3 = v2
       * (float)((float)(*((float *)v1 + 139) - *((float *)v1 + 136))
               / (float)(*((float *)v1 + 137) - *((float *)v1 + 136)));
    v4 = v2 - v3;
    v5 = *((double *)v1 + 70);
    v7 = (v6 - v5) * 0.5;
    v8 = 5.0 - v3;
    if (5.0 - v3 < 0.0)
      v8 = 0.0;
    v9 = 5.0 - v4;
    if (5.0 - v4 < 0.0)
      v9 = 0.0;
    v10 = -v8;
    v11 = v3 + v8;
    v12 = v4 + v9;
    v13 = objc_msgSend(v1, "effectiveUserInterfaceLayoutDirection");
    objc_msgSend(*((id *)v1 + 59), "avkit_setFrame:inLayoutDirection:", v13, v10, v7, v11, v5);
    return (void *)objc_msgSend(*((id *)v1 + 60), "avkit_setFrame:inLayoutDirection:", v13, v3, v7, v12, v5);
  }
  return result;
}

- (void)_frameForSliderMark:(void *)a1
{
  id v3;
  id v4;
  uint64_t v5;

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
    }

    objc_msgSend(v4, "startValue");
    objc_msgSend(v4, "markType");

  }
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
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint8_t v17[8];
  double v18;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 568), "count");
    if (v2 != objc_msgSend(*(id *)(a1 + 496), "count"))
    {
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Error: Slider mark count does not match slider mark view count", v17, 2u);
      }

    }
    v4 = objc_msgSend(*(id *)(a1 + 568), "count");
    v5 = objc_msgSend(*(id *)(a1 + 496), "count");
    if (v4 >= v5)
      v6 = v5;
    else
      v6 = v4;
    if (v6 >= 1)
    {
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(*(id *)(a1 + 568), "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 496), "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unfilledColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(float *)(a1 + 556);
        objc_msgSend(v8, "startValue");
        if (v11 >= v12)
        {
          objc_msgSend(v8, "filledColor");
          v13 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v13;
        }
        v14 = v10;
        objc_opt_self();
        objc_opt_self();
        v18 = 0.0;
        objc_msgSend(v14, "getRed:green:blue:alpha:", 0, 0, 0, &v18);
        objc_msgSend(v14, "colorWithAlphaComponent:", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "backgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 != v15)
          objc_msgSend(v9, "setMarkColor:", v15);

      }
    }
  }
}

@end
