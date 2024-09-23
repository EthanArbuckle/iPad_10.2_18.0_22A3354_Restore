@implementation CEKDiscreteSlider

- (CEKDiscreteSlider)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CEKDiscreteSlider *v7;
  CEKDiscreteSlider *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[CEKDiscreteSlider initWithTickMarkStyle:](self, "initWithTickMarkStyle:", 0);
  v8 = v7;
  if (v7)
    -[CEKDiscreteSlider setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (CEKDiscreteSlider)initWithCoder:(id)a3
{
  return -[CEKDiscreteSlider initWithTickMarkStyle:](self, "initWithTickMarkStyle:", 0);
}

- (CEKDiscreteSlider)initWithTickMarkStyle:(unint64_t)a3
{
  CEKDiscreteSlider *v4;
  void *v5;
  id v6;
  void *v7;
  CEKDynamicTickMarksView *v8;
  CEKDynamicTickMarksView *dynamicTickMarksView;
  CEKSliderTickMarksView *v10;
  CEKTickMarksContainer *tickMarksView;
  UIView *v12;
  UIView *levelIndicatorView;
  UIView *v14;
  CEKSelectionFeedbackGenerator *v15;
  CEKSelectionFeedbackGenerator *feedbackGenerator;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CEKDiscreteSlider;
  v4 = -[CEKDiscreteSlider initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKDiscreteSlider setTintColor:](v4, "setTintColor:", v5);

    v4->_textOrientation = 0;
    v4->_fontStyle = 0;
    v4->_colorHighlight = 1;
    v4->_markedIndex = -1;
    v4->_tickMarksHeight = 10.0;
    v4->_labelVerticalPadding = 10.0;
    v4->_sliderVerticalAlignment = 2;
    v4->_levelIndicatorHeight = 26.0;
    v6 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
    objc_msgSend(v6, "setDelegate:", v4);
    objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v6, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    objc_msgSend(v6, "panGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_wantsGESEvents:", 1);

    objc_storeStrong((id *)&v4->__contentScrollView, v6);
    if (a3)
    {
      if (a3 == 1)
      {
        v8 = objc_alloc_init(CEKDynamicTickMarksView);
        dynamicTickMarksView = v4->__dynamicTickMarksView;
        v4->__dynamicTickMarksView = v8;

        objc_storeStrong((id *)&v4->__tickMarksView, v4->__dynamicTickMarksView);
      }
    }
    else
    {
      v10 = objc_alloc_init(CEKSliderTickMarksView);
      tickMarksView = v4->__tickMarksView;
      v4->__tickMarksView = (CEKTickMarksContainer *)v10;

    }
    -[CEKTickMarksContainer setDelegate:](v4->__tickMarksView, "setDelegate:", v4);
    v4->_ticksStyle = a3;
    objc_msgSend(v6, "addSubview:", v4->__tickMarksView);
    -[CEKDiscreteSlider addSubview:](v4, "addSubview:", v6);
    if (!v4->__dynamicTickMarksView)
    {
      v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      -[UIView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
      levelIndicatorView = v4->__levelIndicatorView;
      v4->__levelIndicatorView = v12;
      v14 = v12;

      -[CEKDiscreteSlider addSubview:](v4, "addSubview:", v14);
    }
    -[CEKDiscreteSlider _updateColorsAnimated:](v4, "_updateColorsAnimated:", 0);
    -[CEKDiscreteSlider updateValueLabel](v4, "updateValueLabel");
    v15 = objc_alloc_init(CEKSelectionFeedbackGenerator);
    feedbackGenerator = v4->__feedbackGenerator;
    v4->__feedbackGenerator = v15;

    v4->_biasScrollingToCurrentSelection = 1;
    v4->_feedbackScope = 2;

  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $72A51D8769CCC17D4AFAC114CECE15A1 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToWillBeginScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidEndScrolling = objc_opt_respondsToSelector() & 1;
  }

}

- (void)layoutSubviews
{
  int64_t v3;
  double v4;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)CEKDiscreteSlider;
  -[CEKDiscreteSlider layoutSubviews](&v6, sel_layoutSubviews);
  -[CEKDiscreteSlider bounds](self, "bounds");
  if (!CGRectIsEmpty(v7))
  {
    v3 = -[CEKDiscreteSlider textOrientation](self, "textOrientation");
    if (v3)
    {
      if (v3 == 2)
      {
        v4 = 1.57079633;
        goto LABEL_8;
      }
      if (v3 == 1)
      {
        v4 = -1.57079633;
LABEL_8:
        -[CEKDiscreteSlider _layoutSubviewsWithLabelRotation:](self, "_layoutSubviewsWithLabelRotation:", v4);
      }
    }
    else
    {
      -[CEKDiscreteSlider _layoutSubviewsWithNoRotation](self, "_layoutSubviewsWithNoRotation");
    }
    -[CEKDiscreteSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKDiscreteSlider bounds](self, "bounds");
    -[CEKDiscreteSlider convertRect:toView:](self, "convertRect:toView:", v5);
    objc_msgSend(v5, "setVisibleBounds:");

  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
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

  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;

  -[CEKDiscreteSlider labelVerticalPadding](self, "labelVerticalPadding");
  v7 = v6;
  if (-[CEKDiscreteSlider textOrientation](self, "textOrientation"))
  {
    v8 = v7 + 40.0 + 5.0 + 10.0;
    -[CEKDiscreteSlider levelIndicatorHeight](self, "levelIndicatorHeight");
    v10 = v9 + 5.0 + v9 + 5.0;
    -[CEKDiscreteSlider tickMarksHeight](self, "tickMarksHeight");
    v12 = v8 + (v10 - v11) * 0.5 + 10.0;
  }
  else
  {
    -[CEKDiscreteSlider levelIndicatorHeight](self, "levelIndicatorHeight");
    v12 = v7 + 18.0 + 5.0 + v13 + 10.0;
  }
  v14 = v5;
  result.height = v12;
  result.width = v14;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CEKDiscreteSlider;
  -[CEKDiscreteSlider setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CEKDiscreteSlider _setNeedsUpdateContentOffset:](self, "_setNeedsUpdateContentOffset:", 1);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CEKDiscreteSlider;
  -[CEKDiscreteSlider setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CEKDiscreteSlider _setNeedsUpdateContentOffset:](self, "_setNeedsUpdateContentOffset:", 1);
}

- (void)setUseTextLegibilityBackgrounds:(BOOL)a3
{
  if (self->_useTextLegibilityBackgrounds != a3)
  {
    self->_useTextLegibilityBackgrounds = a3;
    -[CEKDiscreteSlider _updateTextLegibilityBackground](self, "_updateTextLegibilityBackground");
    -[CEKDiscreteSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);
  }
}

- (void)setUseTextLegibilityShadows:(BOOL)a3
{
  if (self->_useTextLegibilityShadows != a3)
  {
    self->_useTextLegibilityShadows = a3;
    -[CEKDiscreteSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);
  }
}

- (void)setUseTickMarkLegibilityShadows:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CEKDiscreteSlider _dotView](self, "_dotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUseLegibilityShadow:", v3);

  -[CEKDiscreteSlider tickMarksConfiguration](self, "tickMarksConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseTickMarkLegibilityShadows:", v3);

}

- (BOOL)useTickMarkLegibilityShadows
{
  void *v2;
  char v3;

  -[CEKDiscreteSlider tickMarksConfiguration](self, "tickMarksConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useTickMarkLegibilityShadows");

  return v3;
}

- (void)_createGradientIfNeeded
{
  void *v3;
  CEKEdgeGradientView *v4;

  -[CEKDiscreteSlider _edgeGradientView](self, "_edgeGradientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(CEKEdgeGradientView);
    -[CEKDiscreteSlider set_edgeGradientView:](self, "set_edgeGradientView:", v4);

  }
}

- (void)setTransparentGradients
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CEKDiscreteSlider _createGradientIfNeeded](self, "_createGradientIfNeeded");
  -[CEKDiscreteSlider _edgeGradientView](self, "_edgeGradientView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEdgeGradientStyleBlack");
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", v3);

  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, v5);

}

- (void)setOpaqueGradientsWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CEKDiscreteSlider _createGradientIfNeeded](self, "_createGradientIfNeeded");
  -[CEKDiscreteSlider _edgeGradientView](self, "_edgeGradientView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomEdgeGradientStyleWithColor:", v4);

  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", 0);

  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v7, v6);

}

- (void)removeGradients
{
  void *v3;

  -[CEKDiscreteSlider _edgeGradientView](self, "_edgeGradientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CEKDiscreteSlider set_edgeGradientView:](self, "set_edgeGradientView:", 0);
}

- (void)setGradientInsets:(id)a3
{
  double var1;
  double var0;
  $EA4D17EC7EF19748977D62946CF719EB *p_gradientInsets;

  var1 = a3.var1;
  var0 = a3.var0;
  p_gradientInsets = &self->_gradientInsets;
  if (!CEKEdgeInsetsEqualToInsets(a3.var0, a3.var1, self->_gradientInsets.startInset, self->_gradientInsets.endInset))
  {
    p_gradientInsets->startInset = var0;
    p_gradientInsets->endInset = var1;
    -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitleAlignment:(int64_t)a3
{
  id v4;

  self->_titleAlignment = a3;
  -[CEKDiscreteSlider _titleLabel](self, "_titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", a3);

}

- (void)setSliderVerticalOffset:(double)a3
{
  if (self->_sliderVerticalOffset != a3)
  {
    self->_sliderVerticalOffset = a3;
    -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLabelVerticalPadding:(double)a3
{
  if (self->_labelVerticalPadding != a3)
  {
    self->_labelVerticalPadding = a3;
    -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSliderVerticalAlignment:(int64_t)a3
{
  if (self->_sliderVerticalAlignment != a3)
  {
    self->_sliderVerticalAlignment = a3;
    -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLevelIndicatorHeight:(double)a3
{
  if (self->_levelIndicatorHeight != a3)
  {
    self->_levelIndicatorHeight = a3;
    -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  double v7;
  _QWORD v8[6];
  objc_super v9;

  v3 = a3;
  v5 = -[CEKDiscreteSlider isEnabled](self, "isEnabled");
  v9.receiver = self;
  v9.super_class = (Class)CEKDiscreteSlider;
  -[CEKDiscreteSlider setEnabled:](&v9, sel_setEnabled_, v3);
  if (v5 != v3)
  {
    -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", v3);

    v7 = 0.3;
    if (v3)
      v7 = 1.0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__CEKDiscreteSlider_setEnabled___block_invoke;
    v8[3] = &unk_1E70A4E38;
    v8[4] = self;
    *(double *)&v8[5] = v7;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.25);
  }
}

void __32__CEKDiscreteSlider_setEnabled___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  v4 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  v6 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_valueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  v8 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_levelIndicatorView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

}

- (BOOL)highlightSelectedIndex
{
  void *v2;
  char v3;

  -[CEKDiscreteSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "highlightSelectedIndex");

  return v3;
}

- (void)setHighlightSelectedIndex:(BOOL)a3
{
  -[CEKDiscreteSlider setHighlightSelectedIndex:animated:](self, "setHighlightSelectedIndex:animated:", a3, 0);
}

- (void)setHighlightSelectedIndex:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[CEKDiscreteSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightSelectedIndex:animated:", v5, v4);

}

- (void)setMagneticIndexes:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  v6 = v5;
  if (self->_magneticIndexes != v5 && !-[NSArray isEqualToArray:](v5, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_magneticIndexes, a3);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "unsignedLongValue", (_QWORD)v14));
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    -[CEKDiscreteSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMagneticTickMarkIndexes:", v7);

  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
  -[CEKDiscreteSlider setSelectedIndex:animatedDuration:animatedCurve:completion:](self, "setSelectedIndex:animatedDuration:animatedCurve:completion:", a3, 0, 0, 0.0);
}

- (void)setSelectedIndex:(unint64_t)a3 animatedDuration:(double)a4 animatedCurve:(id)a5 completion:(id)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;

  v14 = a5;
  v10 = a6;
  v11 = -[CEKDiscreteSlider indexCount](self, "indexCount");
  if (!a3 || v11)
  {
    v12 = -[CEKDiscreteSlider indexCount](self, "indexCount");
    if (v12 - 1 >= a3)
      v13 = a3;
    else
      v13 = v12 - 1;
    -[CEKDiscreteSlider _setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:](self, "_setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:", v13, 0, 0, 1, v14, v10, a4);
  }

}

- (void)setIndexCount:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;

  if (self->_indexCount != a3)
  {
    self->_indexCount = a3;
    if (a3)
    {
      v5 = -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
      v6 = a3 - 1;
      if (v5 <= a3 - 1)
        goto LABEL_7;
    }
    else
    {
      v6 = 0;
    }
    -[CEKDiscreteSlider setSelectedIndex:](self, "setSelectedIndex:", v6);
LABEL_7:
    -[CEKDiscreteSlider _setNeedsUpdateContentOffset:](self, "_setNeedsUpdateContentOffset:", 1);
    -[CEKDiscreteSlider _updateTickMarkCount](self, "_updateTickMarkCount");
    -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMarkedIndex:(unint64_t)a3
{
  -[CEKDiscreteSlider setMarkedIndex:animated:](self, "setMarkedIndex:animated:", a3, 0);
}

- (void)setMarkedIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_markedIndex != a3)
  {
    self->_markedIndex = a3;
    -[CEKDiscreteSlider _updateMarkedIndexViewAnimated:](self, "_updateMarkedIndexViewAnimated:", a4);
    -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)removeMarkedIndex
{
  -[CEKDiscreteSlider setMarkedIndex:](self, "setMarkedIndex:", -1);
}

- (void)setTitleText:(id)a3
{
  char v4;
  void *v5;
  NSString *v6;
  NSString *titleText;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "isEqualToString:", self->_titleText);
  v5 = v11;
  if ((v4 & 1) == 0)
  {
    v6 = (NSString *)objc_msgSend(v11, "copy");
    titleText = self->_titleText;
    self->_titleText = v6;

    -[CEKDiscreteSlider _titleLabel](self, "_titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (-[NSString length](self->_titleText, "length"))
      {
        v9 = objc_alloc(MEMORY[0x1E0DC3990]);
        v8 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBackgroundColor:", v10);

        objc_msgSend(v8, "setTextAlignment:", -[CEKDiscreteSlider titleAlignment](self, "titleAlignment"));
        objc_msgSend(v8, "setNumberOfLines:", 0);
        objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[CEKDiscreteSlider addSubview:](self, "addSubview:", v8);
        -[CEKDiscreteSlider set_titleLabel:](self, "set_titleLabel:", v8);
        -[CEKDiscreteSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);
        -[CEKDiscreteSlider _updateFonts](self, "_updateFonts");
      }
      else
      {
        v8 = 0;
      }
    }
    objc_msgSend(v8, "setText:", self->_titleText);

    v5 = v11;
  }

}

- (id)valueText
{
  return 0;
}

- (void)updateValueLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[CEKDiscreteSlider _valueLabel](self, "_valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider valueText](self, "valueText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (v3 || !v5)
  {
    if (!v5)
    {
      objc_msgSend(v3, "setAttributedText:", 0);
      goto LABEL_9;
    }
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v3 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v7);

    objc_msgSend(v3, "setTextAlignment:", 1);
    -[CEKDiscreteSlider addSubview:](self, "addSubview:", v3);
    -[CEKDiscreteSlider set_valueLabel:](self, "set_valueLabel:", v3);
    -[CEKDiscreteSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);
    -[CEKDiscreteSlider _updateFonts](self, "_updateFonts");
  }
  CEKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredLocalizations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pointSize");
  v14 = v13;

  if (CEKIsCustomKerningSupportedForLocale(v11))
  {
    v18 = *MEMORY[0x1E0DC32B0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 * 100.0 / 1000.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v16);
  objc_msgSend(v3, "setAttributedText:", v17);

LABEL_9:
}

- (CEKTickMarksConfiguration)tickMarksConfiguration
{
  void *v2;
  void *v3;

  -[CEKDiscreteSlider _tickMarksView](self, "_tickMarksView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tickMarksModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CEKTickMarksConfiguration *)v3;
}

- (void)setTickMarkCountBetweenIndexes:(unint64_t)a3
{
  if (self->_tickMarkCountBetweenIndexes != a3)
  {
    self->_tickMarkCountBetweenIndexes = a3;
    -[CEKDiscreteSlider _updateTickMarkCount](self, "_updateTickMarkCount");
  }
}

- (void)_updateTickMarkCount
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v3 = -[CEKDiscreteSlider indexCount](self, "indexCount");
  v4 = -[CEKDiscreteSlider tickMarkCountBetweenIndexes](self, "tickMarkCountBetweenIndexes");
  if (v3)
    v5 = v3 + (v3 - 1) * v4;
  else
    v5 = 0;
  -[CEKDiscreteSlider _tickMarksView](self, "_tickMarksView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tickMarksModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTickMarksCount:", v5);

}

- (void)setFontStyle:(unint64_t)a3
{
  if (self->_fontStyle != a3)
  {
    self->_fontStyle = a3;
    -[CEKDiscreteSlider _updateFonts](self, "_updateFonts");
  }
}

- (void)setSelectionFeedbackProfile:(int64_t)a3
{
  id v4;

  -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProfile:", a3);

}

- (int64_t)selectionFeedbackProfile
{
  void *v2;
  int64_t v3;

  -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "profile");

  return v3;
}

- (void)setTickMarksHeight:(double)a3
{
  -[CEKDiscreteSlider setTickMarksHeight:animated:](self, "setTickMarksHeight:animated:", 0, a3);
}

- (void)setTickMarksHeight:(double)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_tickMarksHeight != a3)
  {
    if (a4)
    {
      -[CEKDiscreteSlider layoutIfNeeded](self, "layoutIfNeeded");
      self->_tickMarksHeight = a3;
      -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __49__CEKDiscreteSlider_setTickMarksHeight_animated___block_invoke;
      v6[3] = &unk_1E70A4B18;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v6, 0, 0.5, 0.0, 1.0, 1.0);
    }
    else
    {
      self->_tickMarksHeight = a3;
      -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __49__CEKDiscreteSlider_setTickMarksHeight_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setColorHighlight:(unint64_t)a3
{
  -[CEKDiscreteSlider setColorHighlight:animated:](self, "setColorHighlight:animated:", a3, 0);
}

- (void)setColorHighlight:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_colorHighlight != a3)
  {
    self->_colorHighlight = a3;
    -[CEKDiscreteSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", a4);
  }
}

- (void)_layoutSubviewsWithNoRotation
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double MaxY;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[3];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[3];
  _OWORD v42[2];
  __int128 v43;
  CGRect v44;

  -[CEKDiscreteSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CEKDiscreteSlider sliderVerticalAlignment](self, "sliderVerticalAlignment");
  if (v11 == 2)
  {
    -[CEKDiscreteSlider sliderVerticalOffset](self, "sliderVerticalOffset");
    v12 = v14 + 33.0;
  }
  else if (v11 == 1)
  {
    v44.origin.x = v4;
    v44.origin.y = v6;
    v44.size.width = v8;
    v44.size.height = v10;
    MaxY = CGRectGetMaxY(v44);
    -[CEKDiscreteSlider levelIndicatorHeight](self, "levelIndicatorHeight");
    v17 = MaxY - v16;
    -[CEKDiscreteSlider sliderVerticalOffset](self, "sliderVerticalOffset");
    v12 = v17 - v18;
  }
  else
  {
    v12 = 0.0;
    if (!v11)
    {
      -[CEKDiscreteSlider levelIndicatorHeight](self, "levelIndicatorHeight", 0.0);
      v33 = 0;
      UIRectCenteredYInRectScale();
      v12 = v13;
    }
  }
  -[CEKDiscreteSlider _layoutSliderContentAtY:withHorizontalPadding:](self, "_layoutSliderContentAtY:withHorizontalPadding:", v12, 0.0, v33);
  -[CEKDiscreteSlider _valueLabel](self, "_valueLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _titleLabel](self, "_titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v42[0] = *MEMORY[0x1E0C9BAA8];
  v35 = v42[0];
  v42[1] = v36;
  v43 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v34 = v43;
  objc_msgSend(v19, "setTransform:", v42);
  v41[0] = v35;
  v41[1] = v36;
  v41[2] = v34;
  objc_msgSend(v20, "setTransform:", v41);
  -[CEKDiscreteSlider labelVerticalPadding](self, "labelVerticalPadding");
  v22 = v21;
  -[CEKDiscreteSlider horizontalValueLabelOffset](self, "horizontalValueLabelOffset");
  v24 = v23;
  objc_msgSend(v20, "setFrame:", 10.0, v22, v8 + -20.0, 18.0);
  objc_msgSend(v19, "setFrame:", v24, v22, v8, 18.0);
  objc_msgSend(v19, "setTextAlignment:", 1);
  if (-[CEKDiscreteSlider useTextLegibilityBackgrounds](self, "useTextLegibilityBackgrounds"))
  {
    -[CEKDiscreteSlider _valueBackground](self, "_valueBackground");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0C9D648];
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    objc_msgSend(v25, "image");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "size");
    v30 = v29;

    objc_msgSend(v25, "setBounds:", v26, v27, 52.0, v30);
    objc_msgSend(v19, "center");
    objc_msgSend(v25, "setCenter:", v8 * 0.5);
    if (v19)
    {
      objc_msgSend(v19, "transform");
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v38 = 0u;
    }
    v37[0] = v38;
    v37[1] = v39;
    v37[2] = v40;
    objc_msgSend(v25, "setTransform:", v37);
    -[CEKDiscreteSlider _valueBackground](self, "_valueBackground");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAlpha:", 1.0);

    -[CEKDiscreteSlider _titleBackground](self, "_titleBackground");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAlpha:", 0.0);

  }
}

- (void)_layoutSubviewsWithLabelRotation:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[3];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;

  v5 = 18.0;
  if (-[CEKDiscreteSlider useTextLegibilityBackgrounds](self, "useTextLegibilityBackgrounds"))
  {
    -[CEKDiscreteSlider _titleBackground](self, "_titleBackground");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v5 = v8 * 0.5 + 10.0;

  }
  -[CEKDiscreteSlider _layoutSliderContentAtY:withHorizontalPadding:](self, "_layoutSliderContentAtY:withHorizontalPadding:", 55.0, v5);
  -[CEKDiscreteSlider _valueLabel](self, "_valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _titleLabel](self, "_titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intrinsicContentSize");
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v11, 18.0);
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, 40.0, 18.0);
  -[CEKDiscreteSlider _levelIndicatorView](self, "_levelIndicatorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _tickMarksView](self, "_tickMarksView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 0.0)
  {
    v16 = 0;
    v15 = 10.0;
  }
  else
  {
    -[CEKDiscreteSlider bounds](self, "bounds");
    v15 = v14 + -10.0;
    v16 = 2;
  }
  objc_msgSend(v13, "center");
  objc_msgSend(v10, "setCenter:", v15);
  objc_msgSend(v12, "center");
  objc_msgSend(v9, "setCenter:");
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeRotation(&v41, a3);
  v39 = v41;
  UIIntegralTransform();
  v41 = v40;
  objc_msgSend(v9, "setTransform:", &v40);
  v40 = v41;
  objc_msgSend(v10, "setTransform:", &v40);
  objc_msgSend(v9, "setTextAlignment:", v16);
  -[CEKDiscreteSlider _valueBackground](self, "_valueBackground");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _titleBackground](self, "_titleBackground");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CEKDiscreteSlider useTextLegibilityBackgrounds](self, "useTextLegibilityBackgrounds"))
  {
    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    objc_msgSend(v18, "image");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v23 = v22;

    objc_msgSend(v10, "bounds");
    objc_msgSend(v18, "setBounds:", v19, v20, v24 + 20.0, v23);
    objc_msgSend(v10, "center");
    objc_msgSend(v18, "setCenter:");
    if (v10)
    {
      objc_msgSend(v10, "transform");
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
      v36 = 0u;
    }
    v35[0] = v36;
    v35[1] = v37;
    v35[2] = v38;
    objc_msgSend(v18, "setTransform:", v35);
    objc_msgSend(v17, "image");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "size");
    v27 = v26;

    objc_msgSend(v9, "bounds");
    objc_msgSend(v17, "setBounds:", v19, v20, v28 + 12.0, v27);
    objc_msgSend(v9, "center");
    objc_msgSend(v17, "setCenter:");
    if (v9)
    {
      objc_msgSend(v9, "transform");
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
    }
    v31[0] = v32;
    v31[1] = v33;
    v31[2] = v34;
    objc_msgSend(v17, "setTransform:", v31);
    objc_msgSend(v9, "setTextAlignment:", 1);
    -[CEKDiscreteSlider _valueBackground](self, "_valueBackground");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAlpha:", 1.0);

    -[CEKDiscreteSlider _titleBackground](self, "_titleBackground");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAlpha:", 1.0);

  }
}

- (void)_layoutSliderContentAtY:(double)a3 withHorizontalPadding:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double x;
  double y;
  double width;
  double height;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  unint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double MinX;
  double v53;
  double MaxX;
  uint64_t v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double dxa;
  CGFloat v65;
  CGFloat v66;
  id v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  -[CEKDiscreteSlider bounds](self, "bounds");
  v61 = v7;
  v62 = v6;
  v9 = v8;
  v59 = v10;
  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v67 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _levelIndicatorView](self, "_levelIndicatorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _tickMarksView](self, "_tickMarksView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider levelIndicatorHeight](self, "levelIndicatorHeight");
  v14 = v13;
  v60 = v9;
  UIRoundToViewScale();
  v16 = v15;
  objc_msgSend(v11, "setFrame:", v15, a3, 1.0, v14);
  v17 = -CEKPixelWidthForView(self);
  v68.size.width = 1.0;
  v66 = v16;
  v68.origin.x = v16;
  v68.origin.y = a3;
  v68.size.height = v14;
  v69 = CGRectInset(v68, v17, v17);
  x = v69.origin.x;
  y = v69.origin.y;
  width = v69.size.width;
  height = v69.size.height;
  -[CEKDiscreteSlider _indicatorBackground](self, "_indicatorBackground");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", x, y, width, height);

  v65 = v14;
  if (v11)
  {
    -[CEKDiscreteSlider tickMarksHeight](self, "tickMarksHeight");
    v24 = v23;
  }
  else
  {
    v24 = v14;
  }
  objc_msgSend(v12, "tickMarksModel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "requiredWidth");
  v56 = v26;

  v27 = *MEMORY[0x1E0C9D648];
  v58 = *MEMORY[0x1E0C9D648];
  -[CEKDiscreteSlider levelIndicatorHeight](self, "levelIndicatorHeight");
  v57 = v28 - v24 + a3;
  objc_msgSend(v12, "frameForAlignmentRect:", v27);
  objc_msgSend(v12, "setFrame:");
  objc_msgSend(v12, "frameForTickMarkAtIndex:", -[CEKDiscreteSlider markedIndex](self, "markedIndex"));
  objc_msgSend(v12, "convertRect:toView:", v67);
  -[CEKDiscreteSlider traitCollection](self, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "displayScale");
  v55 = v30;
  UIRectCenteredXInRectScale();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  -[CEKDiscreteSlider _dotView](self, "_dotView", v55);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  v70.origin.y = v61;
  v70.origin.x = v62;
  v70.size.height = v59;
  v70.size.width = v60;
  v71 = CGRectInset(v70, a4, 0.0);
  v40 = v71.origin.x;
  v41 = v71.origin.y;
  v42 = v71.size.width;
  dxa = v71.size.height;
  -[CEKDiscreteSlider _edgeGradientView](self, "_edgeGradientView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[CEKDiscreteSlider ticksStyle](self, "ticksStyle");
  if (v44 == 1)
    v45 = 0.0;
  else
    v45 = v41;
  if (v44)
    v46 = v45;
  else
    v46 = a3;
  v72.origin.y = v57;
  v72.origin.x = v58;
  v72.size.width = v56;
  v72.size.height = v24;
  objc_msgSend(v43, "setFrame:", v40, v46, v42, CGRectGetMaxY(v72) - v46);
  -[CEKDiscreteSlider gradientInsets](self, "gradientInsets");
  v48 = v47;
  -[CEKDiscreteSlider gradientInsets](self, "gradientInsets");
  objc_msgSend(v43, "setGradientDimensions:", v48, v42 * 0.1, v42 * 0.1, v49);
  UIRoundToViewScale();
  v51 = v50;
  objc_msgSend(v67, "setFrame:", v40, v41, v42, dxa);
  objc_msgSend(v67, "setContentSize:", v56 + v51 * -2.0, dxa);
  v73.size.width = 1.0;
  v73.origin.y = a3;
  v73.origin.x = v66;
  v73.size.height = v65;
  MinX = CGRectGetMinX(v73);
  v74.origin.x = v40;
  v74.origin.y = v41;
  v74.size.width = v42;
  v74.size.height = dxa;
  v53 = MinX - CGRectGetMinX(v74) - v51;
  v75.origin.x = v40;
  v75.origin.y = v41;
  v75.size.width = v42;
  v75.size.height = dxa;
  MaxX = CGRectGetMaxX(v75);
  v76.size.width = 1.0;
  v76.origin.x = v66;
  v76.origin.y = a3;
  v76.size.height = v65;
  objc_msgSend(v67, "setContentInset:", 0.0, v53, 0.0, v51 + MaxX - CGRectGetMaxX(v76));
  if (-[CEKDiscreteSlider _needsUpdateContentOffset](self, "_needsUpdateContentOffset"))
  {
    -[CEKDiscreteSlider _setNeedsUpdateContentOffset:](self, "_setNeedsUpdateContentOffset:", 0);
    -[CEKDiscreteSlider _updateScrollViewContentOffset](self, "_updateScrollViewContentOffset");
  }

}

- (double)horizontalValueLabelOffset
{
  return 0.0;
}

- (void)_updateAppearanceForActiveScrolling
{
  -[CEKDiscreteSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", 1);
  -[CEKDiscreteSlider _updateMarkedIndexViewAnimated:](self, "_updateMarkedIndexViewAnimated:", 1);
}

- (BOOL)_isScrollActive
{
  void *v3;
  BOOL v4;

  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isTracking") & 1) != 0
    || (objc_msgSend(v3, "isDecelerating") & 1) != 0
    || -[CEKDiscreteSlider _isExternallyScrolling](self, "_isExternallyScrolling")
    || -[CEKDiscreteSlider _isScrollExternallyAnimating](self, "_isScrollExternallyAnimating");

  return v4;
}

- (BOOL)_shouldUseHighlightColor
{
  unint64_t v3;
  void *v5;
  char v6;

  v3 = -[CEKDiscreteSlider colorHighlight](self, "colorHighlight");
  if (v3 != 1)
    return v3 == 2;
  if (-[CEKDiscreteSlider _isScrollActive](self, "_isScrollActive"))
    return 1;
  -[CEKDiscreteSlider _animationGenerator](self, "_animationGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAnimatingForIdentifier:", CFSTR("CEKSelectionScrollingAnimationKey"));

  return v6;
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v3 = a3;
  -[CEKDiscreteSlider _levelIndicatorView](self, "_levelIndicatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _valueLabel](self, "_valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _titleLabel](self, "_titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CEKDiscreteSlider useTextLegibilityShadows](self, "useTextLegibilityShadows");
  v9 = -[CEKDiscreteSlider _shouldUseHighlightColor](self, "_shouldUseHighlightColor");
  if (v9)
    -[CEKDiscreteSlider tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CEKDiscreteSlider useTextLegibilityBackgrounds](self, "useTextLegibilityBackgrounds") || v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v11, "colorWithAlphaComponent:", 0.6);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  if (v9)
  {
    -[CEKDiscreteSlider tintColor](self, "tintColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v12;
  }
  objc_msgSend(v7, "setTextColor:", v12, v14);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = CEKPixelWidthForView(self);
    v18 = 0.0;
  }
  else
  {
    v16 = 0;
    v18 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(v7, "setShadowColor:", v16);
  objc_msgSend(v6, "setShadowColor:", v16);
  objc_msgSend(v7, "setShadowOffset:", v18, v17);
  objc_msgSend(v6, "setShadowOffset:", v18, v17);
  if (v3)
  {
    v19 = (void *)MEMORY[0x1E0DC3F10];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __43__CEKDiscreteSlider__updateColorsAnimated___block_invoke;
    v29[3] = &unk_1E70A4E60;
    v30 = v5;
    v20 = v25;
    v31 = v25;
    objc_msgSend(v19, "animateWithDuration:animations:", v29, 0.15);
    v21 = (void *)MEMORY[0x1E0DC3F10];
    -[CEKDiscreteSlider _valueLabel](self, "_valueLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __43__CEKDiscreteSlider__updateColorsAnimated___block_invoke_2;
    v26[3] = &unk_1E70A4E60;
    v27 = v6;
    v23 = v24;
    v28 = v24;
    objc_msgSend(v21, "transitionWithView:duration:options:animations:completion:", v22, 5242880, v26, 0, 0.15);

  }
  else
  {
    v20 = v25;
    objc_msgSend(v5, "setBackgroundColor:", v25);
    v23 = v24;
    objc_msgSend(v6, "setTextColor:", v24);
  }

}

uint64_t __43__CEKDiscreteSlider__updateColorsAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__CEKDiscreteSlider__updateColorsAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTextColor:", *(_QWORD *)(a1 + 40));
}

- (void)_updateScrollViewContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", -[CEKDiscreteSlider selectedIndex](self, "selectedIndex"));
  v4 = v3;
  v6 = v5;
  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:animated:", 0, v4, v6);

}

- (void)_updateMarkedIndexViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  CEKSliderDotView *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v15[4];
  CEKSliderDotView *v16;
  double v17;

  v3 = a3;
  -[CEKDiscreteSlider _dotView](self, "_dotView");
  v5 = (CEKSliderDotView *)objc_claimAutoreleasedReturnValue();
  v6 = -[CEKDiscreteSlider markedIndex](self, "markedIndex");
  v7 = -[CEKDiscreteSlider markedIndex](self, "markedIndex");
  if (v7 >= -[CEKDiscreteSlider indexCount](self, "indexCount"))
  {
    v9 = 0;
  }
  else
  {
    if (-[CEKDiscreteSlider _isScrollActive](self, "_isScrollActive"))
    {
      v8 = v5 != 0;
      v9 = 1;
      goto LABEL_8;
    }
    v9 = v6 != -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
  }
  v8 = v5 != 0;
  if (v9 || v5)
  {
LABEL_8:
    if (!v9 || v8)
    {
      if (v9)
        v12 = 1.0;
      else
        v12 = 0.0;
      if (!v3)
        goto LABEL_19;
    }
    else
    {
      v5 = objc_alloc_init(CEKSliderDotView);
      -[CEKDiscreteSlider tickMarksConfiguration](self, "tickMarksConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKSliderDotView setUseLegibilityShadow:](v5, "setUseLegibilityShadow:", objc_msgSend(v10, "useTickMarkLegibilityShadows"));

      -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v5);

      -[CEKDiscreteSlider set_dotView:](self, "set_dotView:", v5);
      -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
      if (!v3)
      {
        v12 = 1.0;
        goto LABEL_19;
      }
      -[CEKSliderDotView setAlpha:](v5, "setAlpha:", 0.0);
      v12 = 1.0;
    }
    -[CEKSliderDotView alpha](v5, "alpha");
    if (v13 != v12)
    {
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __52__CEKDiscreteSlider__updateMarkedIndexViewAnimated___block_invoke;
      v15[3] = &unk_1E70A4E38;
      v16 = v5;
      v17 = v12;
      v5 = v5;
      objc_msgSend(v14, "animateWithDuration:animations:completion:", v15, 0, 0.25);

LABEL_20:
      return;
    }
LABEL_19:
    -[CEKSliderDotView setAlpha:](v5, "setAlpha:", v12);
    goto LABEL_20;
  }
}

uint64_t __52__CEKDiscreteSlider__updateMarkedIndexViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_setOverscrolling:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  void *v6;
  id v7;

  if (self->__overscrolling != a3)
  {
    v3 = a3;
    self->__overscrolling = a3;
    v5 = -[CEKDiscreteSlider feedbackScope](self, "feedbackScope");
    if (v3)
    {
      if (v5)
      {
        -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "playOverscrollTickSound");

        -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "performFeedback");

      }
    }
  }
}

- (void)_updateTextLegibilityBackground
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  id v16;
  id v17;

  v3 = -[CEKDiscreteSlider useTextLegibilityBackgrounds](self, "useTextLegibilityBackgrounds");
  -[CEKDiscreteSlider _valueBackground](self, "_valueBackground");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _titleBackground](self, "_titleBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _indicatorBackground](self, "_indicatorBackground");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v15;
    if (!v15 && !v4)
    {
      -[CEKDiscreteSlider _createLegibilityImage](self, "_createLegibilityImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
      v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "colorWithAlphaComponent:", 0.15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v10);

      -[CEKDiscreteSlider _valueLabel](self, "_valueLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKDiscreteSlider insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v16, v11);

      -[CEKDiscreteSlider _titleLabel](self, "_titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKDiscreteSlider insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v4, v12);

      -[CEKDiscreteSlider _levelIndicatorView](self, "_levelIndicatorView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKDiscreteSlider insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v8, v13);

      -[CEKDiscreteSlider set_valueBackground:](self, "set_valueBackground:", v16);
      -[CEKDiscreteSlider set_titleBackground:](self, "set_titleBackground:", v4);
      -[CEKDiscreteSlider set_indicatorBackground:](self, "set_indicatorBackground:", v8);

      v6 = v16;
      v5 = v8;
    }
  }
  else
  {
    v6 = v15;
  }
  if (v3)
    v14 = 1.0;
  else
    v14 = 0.0;
  v17 = v6;
  objc_msgSend(v6, "setAlpha:", v14);
  objc_msgSend(v4, "setAlpha:", v14);
  objc_msgSend(v5, "setAlpha:", v14);
  -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");

}

- (id)_createLegibilityImage
{
  CGFloat v2;
  CGFloat v3;
  void *v4;
  double v5;
  CGFloat v6;
  CGContext *CurrentContext;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CEKDiscreteSlider traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;
  v13.width = 25.0;
  v13.height = 25.0;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v6);

  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.3);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v9, "CGColor"));

  v14.size.width = 25.0;
  v14.size.height = 25.0;
  v14.origin.x = v2;
  v14.origin.y = v3;
  CGContextFillEllipseInRect(CurrentContext, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v10, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x1E0DC49E8], 12.5, *(double *)(MEMORY[0x1E0DC49E8] + 16), 12.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_updateFonts
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[CEKDiscreteSlider fontStyle](self, "fontStyle");
  CEKFontOfSizeAndStyle(v3, 14.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _titleLabel](self, "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  CEKMonospacedStylisticNumeralFontOfSizeAndStyle(v3, 14.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider _valueLabel](self, "_valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

}

- (void)_setSelectedIndex:(unint64_t)a3 shouldDelegate:(BOOL)a4 wantsFeedbackEmitted:(BOOL)a5 shouldScroll:(BOOL)a6 scrollDuration:(double)a7 scrollCurve:(id)a8 scrollCompletion:(id)a9
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL8 v13;
  id v16;
  id v17;
  void *v18;
  int64_t v19;
  int64_t v20;
  _BOOL4 v21;
  unint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CEKAnimationGenerator *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void *v48;
  id v49;
  CEKDiscreteSlider *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v16 = a8;
  v17 = a9;
  if (self->_selectedIndex == a3)
    goto LABEL_24;
  self->_selectedIndex = a3;
  -[CEKDiscreteSlider updateValueLabel](self, "updateValueLabel");
  -[CEKDiscreteSlider _updateMarkedIndexViewAnimated:](self, "_updateMarkedIndexViewAnimated:", 1);
  -[CEKDiscreteSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSelectedTickMarkIndex:animated:", a3, v13);

  if (v13)
    -[CEKDiscreteSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  if (v12)
  {
    v19 = -[CEKDiscreteSlider feedbackScope](self, "feedbackScope");
    if ((unint64_t)(v19 - 1) <= 1)
    {
      v20 = v19;
      if (a3)
        v21 = -[CEKDiscreteSlider indexCount](self, "indexCount") - 1 == a3;
      else
        v21 = 1;
      v22 = -[CEKDiscreteSlider _tickMarkIndexForIndex:](self, "_tickMarkIndexForIndex:", a3);
      -[CEKDiscreteSlider _tickMarksView](self, "_tickMarksView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "tickMarksModel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isMainTickMarkAtIndex:", v22);

      if (v21)
      {
        -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "performFeedback");

        -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "playEndTickSound");
LABEL_15:

        goto LABEL_16;
      }
      if (v25)
      {
        -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "performFeedback");

        -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "playMajorTickSound");
        goto LABEL_15;
      }
      if (v20 == 2)
      {
        -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "performFeedback");

        -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "playMinorTickSound");
        goto LABEL_15;
      }
    }
  }
LABEL_16:
  if (a7 > 0.0 && v11)
  {
    -[CEKDiscreteSlider _animationGenerator](self, "_animationGenerator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v31 = objc_alloc_init(CEKAnimationGenerator);
      -[CEKDiscreteSlider _setAnimationGenerator:](self, "_setAnimationGenerator:", v31);

    }
    -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "contentOffset");
    v34 = v33;
    v36 = v35;
    -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", a3);
    v38 = v37;
    v40 = v39;
    -[CEKDiscreteSlider _animationGenerator](self, "_animationGenerator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __132__CEKDiscreteSlider__setSelectedIndex_shouldDelegate_wantsFeedbackEmitted_shouldScroll_scrollDuration_scrollCurve_scrollCompletion___block_invoke;
    v52[3] = &unk_1E70A4E88;
    v53 = v16;
    v55 = v34;
    v56 = v36;
    v57 = v38;
    v58 = v40;
    v54 = v32;
    v45 = v42;
    v46 = 3221225472;
    v47 = __132__CEKDiscreteSlider__setSelectedIndex_shouldDelegate_wantsFeedbackEmitted_shouldScroll_scrollDuration_scrollCurve_scrollCompletion___block_invoke_2;
    v48 = &unk_1E70A4EB0;
    v49 = v54;
    v50 = self;
    v51 = v17;
    v43 = v54;
    objc_msgSend(v41, "startAnimationForIdentifier:duration:updateHandler:completionHandler:", CFSTR("CEKSelectionScrollingAnimationKey"), v52, &v45, a7);

    objc_msgSend(v43, "setScrollEnabled:", 0, v45, v46, v47, v48);
    -[CEKDiscreteSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", 1);

  }
  else if (v11)
  {
    -[CEKDiscreteSlider _animationGenerator](self, "_animationGenerator");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stopAnimationForIdentifier:", CFSTR("CEKSelectionScrollingAnimationKey"));

    -[CEKDiscreteSlider _updateScrollViewContentOffset](self, "_updateScrollViewContentOffset");
    if (v17)
      (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
  }
LABEL_24:

}

uint64_t __132__CEKDiscreteSlider__setSelectedIndex_shouldDelegate_wantsFeedbackEmitted_shouldScroll_scrollDuration_scrollCurve_scrollCompletion___block_invoke(uint64_t a1, double a2)
{
  double v2;
  void *v4;
  float v5;

  v2 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    *(float *)&a2 = a2;
    objc_msgSend(v4, "_solveForInput:", a2);
    v2 = v5;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", CEKInterpolate(*(double *)(a1 + 48), *(double *)(a1 + 64), v2), *(double *)(a1 + 56));
}

uint64_t __132__CEKDiscreteSlider__setSelectedIndex_shouldDelegate_wantsFeedbackEmitted_shouldScroll_scrollDuration_scrollCurve_scrollCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "setScrollEnabled:", 1);
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  return objc_msgSend(*(id *)(a1 + 40), "_updateColorsAnimated:", 1);
}

- (double)_interpolatedIndexForContentOffset:(CGPoint)a3
{
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;

  x = a3.x;
  if (!-[CEKDiscreteSlider indexCount](self, "indexCount", a3.x, a3.y))
    return 0.0;
  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = (x + v6) / CEKScrollableDistanceInScrollView(v5);
  v8 = v7 * (double)(-[CEKDiscreteSlider indexCount](self, "indexCount") - 1);

  return v8;
}

- (unint64_t)_biasedIndexForContentOffset:(CGPoint)a3
{
  double y;
  double x;
  unint64_t result;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;

  y = a3.y;
  x = a3.x;
  result = -[CEKDiscreteSlider indexCount](self, "indexCount");
  if (result)
  {
    -[CEKDiscreteSlider _interpolatedIndexForContentOffset:](self, "_interpolatedIndexForContentOffset:", x, y);
    v8 = v7;
    v9 = -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
    v10 = floor(v8);
    v11 = ceil(v8);
    if (v8 <= (double)v9)
      v12 = v11;
    else
      v12 = v10;
    v13 = (unint64_t)v12;
    if (v9 == (unint64_t)v12)
    {
      v14 = v9;
      v15 = vcvtad_u64_f64(v8);
      -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", v15);
      if (vabdd_f64(v16, x) <= 1.0)
        v13 = v15;
      else
        v13 = v14;
    }
    return (unint64_t)CEKClamp((double)v13, 0.0, (double)(-[CEKDiscreteSlider indexCount](self, "indexCount") - 1));
  }
  return result;
}

- (unint64_t)_nearestIndexForContentOffset:(CGPoint)a3
{
  double y;
  double x;
  unint64_t result;
  double v7;

  y = a3.y;
  x = a3.x;
  result = -[CEKDiscreteSlider indexCount](self, "indexCount");
  if (result)
  {
    -[CEKDiscreteSlider _interpolatedIndexForContentOffset:](self, "_interpolatedIndexForContentOffset:", x, y);
    return (unint64_t)CEKClamp((double)(unint64_t)round(v7), 0.0, (double)(-[CEKDiscreteSlider indexCount](self, "indexCount") - 1));
  }
  return result;
}

- (unint64_t)_indexForContentOffset:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[CEKDiscreteSlider biasScrollingToCurrentSelection](self, "biasScrollingToCurrentSelection"))
    return -[CEKDiscreteSlider _biasedIndexForContentOffset:](self, "_biasedIndexForContentOffset:", x, y);
  else
    return -[CEKDiscreteSlider _nearestIndexForContentOffset:](self, "_nearestIndexForContentOffset:", x, y);
}

- (CGPoint)_contentOffsetForIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  if (-[CEKDiscreteSlider indexCount](self, "indexCount"))
  {
    CEKProgress((double)a3, 0.0, (double)(-[CEKDiscreteSlider indexCount](self, "indexCount") - 1));
    -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    CEKScrollableDistanceInScrollView(v5);
    objc_msgSend(v5, "contentInset");
    UIRoundToViewScale();
    v9 = v8;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v10 = v9;
  v11 = v7;
  result.y = v11;
  result.x = v10;
  return result;
}

- (unint64_t)_tickMarkIndexForIndex:(unint64_t)a3
{
  return a3 + a3 * -[CEKDiscreteSlider tickMarkCountBetweenIndexes](self, "tickMarkCountBetweenIndexes");
}

- (unint64_t)indexForTickMarkAtPoint:(CGPoint)a3 in:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
  v10 = v9;

  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInset");
  v13 = v10 - v12;
  -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentOffset");
  v16 = v15;

  return -[CEKDiscreteSlider _nearestIndexForContentOffset:](self, "_nearestIndexForContentOffset:", v13, v16);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  id v5;

  -[CEKDiscreteSlider _feedbackGenerator](self, "_feedbackGenerator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareFeedback");

  -[CEKDiscreteSlider _updateAppearanceForActiveScrolling](self, "_updateAppearanceForActiveScrolling");
  if (self->_delegateFlags.respondsToWillBeginScrolling)
  {
    -[CEKDiscreteSlider delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sliderWillBeginScrolling:", self);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  -[CEKDiscreteSlider _updateAppearanceForActiveScrolling](self, "_updateAppearanceForActiveScrolling", a3);
  if (!a4)
    -[CEKDiscreteSlider _sliderDidEndScrolling](self, "_sliderDidEndScrolling");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[CEKDiscreteSlider _updateAppearanceForActiveScrolling](self, "_updateAppearanceForActiveScrolling", a3);
  -[CEKDiscreteSlider _sliderDidEndScrolling](self, "_sliderDidEndScrolling");
}

- (void)_sliderDidEndScrolling
{
  id v3;

  if (self->_delegateFlags.respondsToDidEndScrolling)
  {
    -[CEKDiscreteSlider delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sliderDidEndScrolling:", self);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CEKDiscreteSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider bounds](self, "bounds");
  -[CEKDiscreteSlider convertRect:toView:](self, "convertRect:toView:", v4);
  objc_msgSend(v4, "setVisibleBounds:");
  if (-[CEKDiscreteSlider _isScrollActive](self, "_isScrollActive"))
  {
    -[CEKDiscreteSlider _animationGenerator](self, "_animationGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAnimatingForIdentifier:", CFSTR("CEKSelectionScrollingAnimationKey"));

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v13, "contentOffset");
      -[CEKDiscreteSlider _setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:](self, "_setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:", -[CEKDiscreteSlider _indexForContentOffset:](self, "_indexForContentOffset:"), 1, 1, 0, 0, 0, 0.0);
      objc_msgSend(v13, "contentOffset");
      v8 = v7;
      objc_msgSend(v13, "contentInset");
      v10 = v9;
      v11 = v8 > CEKScrollableDistanceInScrollView(v13) - v9 + 20.0 || v8 < -20.0 - v10;
      -[CEKDiscreteSlider _setOverscrolling:](self, "_setOverscrolling:", v11);
    }
  }
  if ((objc_msgSend(v13, "isTracking") & 1) != 0 || objc_msgSend(v13, "isDecelerating"))
  {
    -[CEKDiscreteSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[CEKDiscreteSlider _setExternalScrollOffsetAnimator:](self, "_setExternalScrollOffsetAnimator:", 0);
    -[CEKDiscreteSlider contactEndedWithAction:](self, "contactEndedWithAction:", 0);
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v6;
  CGFloat v7;

  -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", -[CEKDiscreteSlider _nearestIndexForContentOffset:](self, "_nearestIndexForContentOffset:", a3, a5->x, a5->y));
  a5->x = v6;
  a5->y = v7;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[CEKDiscreteSlider _sliderDidEndScrolling](self, "_sliderDidEndScrolling");
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;

  -[CEKDiscreteSlider _setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:](self, "_setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:", -[CEKDiscreteSlider _nearestIndexForContentOffset:](self, "_nearestIndexForContentOffset:", v6, v8), 1, 1, 0, 0, 0, 0.0);
}

- (CEKSliderPositionDriver)_sliderDriver
{
  CEKSliderPositionDriver *sliderDriver;
  CEKSliderPositionDriver *v4;
  CEKSliderPositionDriver *v5;

  sliderDriver = self->__sliderDriver;
  if (!sliderDriver)
  {
    CEKDefaultSliderPositionDriver();
    v4 = (CEKSliderPositionDriver *)objc_claimAutoreleasedReturnValue();
    v5 = self->__sliderDriver;
    self->__sliderDriver = v4;

    sliderDriver = self->__sliderDriver;
  }
  return sliderDriver;
}

- (void)contactBeganWithAction:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  if (!-[CEKDiscreteSlider _isExternalScrollingAllowed](self, "_isExternalScrollingAllowed"))
  {
    -[CEKDiscreteSlider _setExternalScrollingAllowed:](self, "_setExternalScrollingAllowed:", 1);
    -[CEKDiscreteSlider _setExternalOverScroll:](self, "_setExternalOverScroll:", 0.0);
    -[CEKDiscreteSlider _sliderDriver](self, "_sliderDriver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactBeganWithAction:", v8);

    -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    objc_msgSend(v5, "setContentOffset:animated:", 0);
    -[CEKDiscreteSlider _applyExternalTarget:mode:](self, "_applyExternalTarget:mode:", 2, v7);

  }
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;

  v4 = a3;
  if (-[CEKDiscreteSlider _isExternalScrollingAllowed](self, "_isExternalScrollingAllowed"))
  {
    -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CEKDiscreteSlider _isExternallyScrolling](self, "_isExternallyScrolling"))
    {
      -[CEKDiscreteSlider _setExternallyScrolling:](self, "_setExternallyScrolling:", 1);
      -[CEKDiscreteSlider scrollViewWillBeginDragging:](self, "scrollViewWillBeginDragging:", v5);
    }
    -[CEKDiscreteSlider _createExternalScrollAnimatorIfNeeded](self, "_createExternalScrollAnimatorIfNeeded");
    -[CEKDiscreteSlider _sliderDriver](self, "_sliderDriver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "distanceTraveled");
    v8 = v7;
    objc_msgSend(v6, "contactUpdatedWithAction:", v4);
    objc_msgSend(v6, "distanceTraveled");
    v10 = v9 - v8;
    -[CEKDiscreteSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v13 = v12;

    v14 = v10 + v13;
    v15 = -[CEKDiscreteSlider indexCount](self, "indexCount");
    if (!v15)
      goto LABEL_15;
    v16 = v15;
    -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", 0);
    v18 = v17;
    -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", v16 - 1);
    v20 = v19;
    -[CEKDiscreteSlider _externalOverScroll](self, "_externalOverScroll");
    if (v14 <= v20)
    {
      v22 = 0.0;
      if (v14 >= v18)
      {
LABEL_14:
        -[CEKDiscreteSlider _setExternalOverScroll:](self, "_setExternalOverScroll:", v22, *(_QWORD *)&v24, v25, *(_QWORD *)&v26, v27);
LABEL_15:
        -[CEKDiscreteSlider _applyExternalTarget:mode:](self, "_applyExternalTarget:mode:", 5, v14);

        goto LABEL_16;
      }
      if (v21 == 0.0)
        v22 = v14 - v18;
      else
        v22 = v10 + v21;
    }
    else if (v21 == 0.0)
    {
      v22 = v14 - v20;
    }
    else
    {
      v22 = v10 + v21;
    }
    -[CEKDiscreteSlider bounds](self, "bounds");
    v24 = v18;
    LOBYTE(v25) = 1;
    *(_DWORD *)((char *)&v25 + 1) = 0;
    HIDWORD(v25) = 0;
    v26 = v20;
    LOBYTE(v27) = 1;
    *(_DWORD *)((char *)&v27 + 1) = 0;
    HIDWORD(v27) = 0;
    BSUIConstrainValueToIntervalWithRubberBand();
    v14 = v23;
    goto LABEL_14;
  }
LABEL_16:

}

- (void)contactEndedWithAction:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  NSObject *v36;
  unint64_t v37;
  void *v38;
  double v39;
  double v40;
  _BOOL4 v41;
  unint64_t v42;
  unint64_t v43;
  int64_t v44;
  double v45;
  int64_t v46;
  unint64_t v47;
  double v51;
  os_log_t v52;
  double v54;
  void *v55;
  unint64_t v56;
  void *v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  unint64_t v64;
  __int16 v65;
  int64_t v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CEKDiscreteSlider _isExternalScrollingAllowed](self, "_isExternalScrollingAllowed"))
    goto LABEL_59;
  -[CEKDiscreteSlider _setExternalScrollingAllowed:](self, "_setExternalScrollingAllowed:", 0);
  -[CEKDiscreteSlider _setExternallyScrolling:](self, "_setExternallyScrolling:", 0);
  -[CEKDiscreteSlider _sliderDriver](self, "_sliderDriver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactEndedWithAction:", v4);
  objc_msgSend(v5, "velocity");
  v7 = v6;
  -[CEKDiscreteSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = v9;

  objc_msgSend(v5, "distanceToDecelerate");
  v12 = v10 + v11;
  v13 = -[CEKDiscreteSlider _indexForContentOffset:](self, "_indexForContentOffset:", v10 + v11, 0.0);
  -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", v13);
  v15 = v14;
  -[CEKDiscreteSlider magneticIndexes](self, "magneticIndexes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", 0);
    v18 = v17;
    -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", -[CEKDiscreteSlider indexCount](self, "indexCount") - 1);
    v20 = v19;
    -[CEKDiscreteSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "value");
    v23 = v22;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = v16;
    v24 = v16;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v60;
      v28 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_5:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v60 != v27)
          objc_enumerationMutation(v24);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v29), "unsignedIntegerValue", v57);
        -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", v30);
        if (v31 >= v23)
        {
          if (v31 > v23)
          {

            if (v7 <= 20.0 || v30 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_22;
            -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", v30);
            -[CEKDiscreteSlider traitCollection](self, "traitCollection");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "displayScale");
            UIRoundToScale();
            v35 = v34;

            v32 = fmax(v18, fmin(v20, v35));
            v36 = os_log_create("com.apple.camera", "CameraEditKit");
            if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              goto LABEL_25;
            v37 = -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
            *(_DWORD *)buf = 134218496;
            v64 = v37;
            v65 = 2048;
            v66 = v30;
            v67 = 2048;
            v68 = v7;
LABEL_61:
            _os_log_debug_impl(&dword_1B9835000, v36, OS_LOG_TYPE_DEBUG, "ScrollDiagnostic: Decelerating from %lu to magnetic index %lu with velocity %.3f", buf, 0x20u);
            goto LABEL_25;
          }
        }
        else
        {
          v28 = v30;
        }
        if (v26 == ++v29)
        {
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
          if (v26)
            goto LABEL_5;
          goto LABEL_21;
        }
      }
    }
    v28 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:

LABEL_22:
    if (v7 >= -20.0 || v28 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v36 = os_log_create("com.apple.camera", "CameraEditKit");
      v41 = os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG);
      if (v15 == v10)
      {
        v16 = v57;
        if (v41)
          -[CEKDiscreteSlider contactEndedWithAction:].cold.1(v36, v7);
      }
      else
      {
        v16 = v57;
        if (v41)
        {
          v42 = -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
          *(_DWORD *)buf = 134218496;
          v64 = v42;
          v65 = 2048;
          v66 = v13;
          v67 = 2048;
          v68 = v7;
          _os_log_debug_impl(&dword_1B9835000, v36, OS_LOG_TYPE_DEBUG, "ScrollDiagnostic: Decelerating without magnet from %lu to index %lu (velocity %.3f)", buf, 0x20u);
        }
      }
      v32 = v15;
    }
    else
    {
      -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", v28);
      -[CEKDiscreteSlider traitCollection](self, "traitCollection");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "displayScale");
      UIRoundToScale();
      v40 = v39;

      v32 = fmax(v18, fmin(v20, v40));
      v36 = os_log_create("com.apple.camera", "CameraEditKit");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v56 = -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
        *(_DWORD *)buf = 134218496;
        v64 = v56;
        v65 = 2048;
        v66 = v28;
        v67 = 2048;
        v68 = v7;
        goto LABEL_61;
      }
LABEL_25:
      v16 = v57;
    }

  }
  else
  {
    v32 = v15;
  }
  v43 = -[CEKDiscreteSlider indexCount](self, "indexCount", v57);
  v44 = -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
  -[CEKDiscreteSlider _interpolatedIndexForContentOffset:](self, "_interpolatedIndexForContentOffset:", v12, 0.0);
  v46 = llround(v45);
  v47 = v44 - v46;
  if (v44 - v46 < 0)
    v47 = v46 - v44;
  if (v32 == v15 && v47 >= 2 && v43 >= 3 && v47 <= 2)
  {
    if (v44 && v44 > v46)
    {
      -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", v44 - 1);
      v32 = v51;
      v52 = os_log_create("com.apple.camera", "CameraEditKit");
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
LABEL_54:

        goto LABEL_55;
      }
      *(_DWORD *)buf = 134218752;
      v64 = v44;
      v65 = 2048;
      v66 = v44 - 1;
      v67 = 2048;
      v68 = *(double *)&v46;
      v69 = 2048;
      v70 = v7;
    }
    else
    {
      if (v44 >= v46 || v44 >= v43 - 1)
        goto LABEL_55;
      -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", v44 + 1);
      v32 = v54;
      v52 = os_log_create("com.apple.camera", "CameraEditKit");
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        goto LABEL_54;
      *(_DWORD *)buf = 134218752;
      v64 = v44;
      v65 = 2048;
      v66 = v44 + 1;
      v67 = 2048;
      v68 = *(double *)&v46;
      v69 = 2048;
      v70 = v7;
    }
    _os_log_debug_impl(&dword_1B9835000, v52, OS_LOG_TYPE_DEBUG, "ScrollDiagnostic: Decelerating from %lu to %lu (limited from %ld) (velocity %.3f)", buf, 0x2Au);
    goto LABEL_54;
  }
LABEL_55:
  if (v32 == v10)
  {
    -[CEKDiscreteSlider _sliderDidEndScrolling](self, "_sliderDidEndScrolling");
  }
  else
  {
    -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKDiscreteSlider scrollViewDidEndDragging:willDecelerate:](self, "scrollViewDidEndDragging:willDecelerate:", v55, 1);

    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __44__CEKDiscreteSlider_contactEndedWithAction___block_invoke;
    v58[3] = &unk_1E70A4ED8;
    v58[4] = self;
    -[CEKDiscreteSlider _applyExternalTarget:mode:completion:](self, "_applyExternalTarget:mode:completion:", 3, v58, v32);
  }

LABEL_59:
}

uint64_t __44__CEKDiscreteSlider_contactEndedWithAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isScrollExternallyAnimating");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_isExternalScrollingAllowed");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "_sliderDidEndScrolling");
  }
  return result;
}

- (CEKFluidBehaviorSettings)_externalScrollSettings
{
  CEKFluidBehaviorSettings *externalScrollSettings;
  CEKFluidBehaviorSettings *v4;
  CEKFluidBehaviorSettings *v5;

  externalScrollSettings = self->__externalScrollSettings;
  if (!externalScrollSettings)
  {
    v4 = objc_alloc_init(CEKFluidBehaviorSettings);
    v5 = self->__externalScrollSettings;
    self->__externalScrollSettings = v4;

    -[CEKFluidBehaviorSettings setDefaultCriticallyDampedValues](self->__externalScrollSettings, "setDefaultCriticallyDampedValues");
    -[CEKFluidBehaviorSettings setDampingRatio:](self->__externalScrollSettings, "setDampingRatio:", 1.0);
    -[CEKFluidBehaviorSettings setResponse:](self->__externalScrollSettings, "setResponse:", 0.4);
    externalScrollSettings = self->__externalScrollSettings;
  }
  return externalScrollSettings;
}

- (BOOL)_isScrollExternallyAnimating
{
  CEKDiscreteSlider *v2;
  void *v3;

  v2 = self;
  -[CEKDiscreteSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationValue");
  objc_msgSend(v3, "value");
  CEKPixelWidthForView(v2);
  LOBYTE(v2) = BSFloatApproximatelyEqualToFloat() ^ 1;

  return (char)v2;
}

- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4
{
  -[CEKDiscreteSlider _applyExternalTarget:mode:completion:](self, "_applyExternalTarget:mode:completion:", a4, 0, a3);
}

- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v7 = a5;
  -[CEKDiscreteSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v10 = v9;
  if (!v8 || (objc_msgSend(v8, "value"), v10 != v11))
  {
    -[CEKDiscreteSlider _createExternalScrollAnimatorIfNeeded](self, "_createExternalScrollAnimatorIfNeeded");
    v12 = (void *)MEMORY[0x1E0DC3F10];
    -[CEKDiscreteSlider _externalScrollSettings](self, "_externalScrollSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__CEKDiscreteSlider__applyExternalTarget_mode_completion___block_invoke;
    v14[3] = &unk_1E70A4E38;
    v14[4] = self;
    *(double *)&v14[5] = v10;
    objc_msgSend(v12, "cek_animateWithSettings:mode:animations:completion:", v13, a4, v14, v7);

  }
}

void __58__CEKDiscreteSlider__applyExternalTarget_mode_completion___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_externalScrollOffsetAnimator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:", v1);

}

- (void)_createExternalScrollAnimatorIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[CEKDiscreteSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
    -[CEKDiscreteSlider _setExternalScrollOffsetAnimator:](self, "_setExternalScrollOffsetAnimator:", v4);
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v16[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __58__CEKDiscreteSlider__createExternalScrollAnimatorIfNeeded__block_invoke;
    v13 = &unk_1E70A4F00;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v6, &v10);

    -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView", v10, v11, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentOffset");
    v9 = v8;

    objc_msgSend(v4, "setValue:", v9);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __58__CEKDiscreteSlider__createExternalScrollAnimatorIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleExternalScrollAnimated");

}

- (void)_handleExternalScrollAnimated
{
  void *v3;
  id v4;

  -[CEKDiscreteSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CEKDiscreteSlider _contentScrollView](self, "_contentScrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentOffset");
    objc_msgSend(v4, "presentationValue");
    objc_msgSend(v3, "setContentOffset:");

  }
}

- (void)tickMarksViewDidChangeWidthForTickMarkCount:(id)a3
{
  -[CEKDiscreteSlider _setNeedsUpdateContentOffset:](self, "_setNeedsUpdateContentOffset:", 1);
  -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextOrientation:(int64_t)a3
{
  -[CEKDiscreteSlider setTextOrientation:animated:](self, "setTextOrientation:animated:", a3, 0);
}

- (void)setTextOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_textOrientation != a3)
  {
    if (a4)
    {
      -[CEKDiscreteSlider layoutIfNeeded](self, "layoutIfNeeded");
      self->_textOrientation = a3;
      -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __49__CEKDiscreteSlider_setTextOrientation_animated___block_invoke;
      v6[3] = &unk_1E70A4B18;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v6, 0, 0.25, 0.0);
    }
    else
    {
      self->_textOrientation = a3;
      -[CEKDiscreteSlider setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __49__CEKDiscreteSlider_setTextOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (double)labelVerticalPadding
{
  return self->_labelVerticalPadding;
}

- (BOOL)interactiveWhenHidden
{
  return self->_interactiveWhenHidden;
}

- (void)setInteractiveWhenHidden:(BOOL)a3
{
  self->_interactiveWhenHidden = a3;
}

- (int64_t)sliderVerticalAlignment
{
  return self->_sliderVerticalAlignment;
}

- (double)sliderVerticalOffset
{
  return self->_sliderVerticalOffset;
}

- (double)levelIndicatorHeight
{
  return self->_levelIndicatorHeight;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets
{
  double startInset;
  double endInset;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  startInset = self->_gradientInsets.startInset;
  endInset = self->_gradientInsets.endInset;
  result.var1 = endInset;
  result.var0 = startInset;
  return result;
}

- (int64_t)textOrientation
{
  return self->_textOrientation;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (unint64_t)fontStyle
{
  return self->_fontStyle;
}

- (int64_t)feedbackScope
{
  return self->_feedbackScope;
}

- (void)setFeedbackScope:(int64_t)a3
{
  self->_feedbackScope = a3;
}

- (CEKDiscreteSliderDelegate)delegate
{
  return (CEKDiscreteSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)useTextLegibilityBackgrounds
{
  return self->_useTextLegibilityBackgrounds;
}

- (BOOL)useTextLegibilityShadows
{
  return self->_useTextLegibilityShadows;
}

- (unint64_t)ticksStyle
{
  return self->_ticksStyle;
}

- (UIScrollView)_contentScrollView
{
  return self->__contentScrollView;
}

- (UIView)_levelIndicatorView
{
  return self->__levelIndicatorView;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)set_titleLabel:(id)a3
{
  objc_storeStrong((id *)&self->__titleLabel, a3);
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (void)set_valueLabel:(id)a3
{
  objc_storeStrong((id *)&self->__valueLabel, a3);
}

- (CEKEdgeGradientView)_edgeGradientView
{
  return self->__edgeGradientView;
}

- (void)set_edgeGradientView:(id)a3
{
  objc_storeStrong((id *)&self->__edgeGradientView, a3);
}

- (UIImageView)_valueBackground
{
  return self->__valueBackground;
}

- (void)set_valueBackground:(id)a3
{
  objc_storeStrong((id *)&self->__valueBackground, a3);
}

- (UIImageView)_titleBackground
{
  return self->__titleBackground;
}

- (void)set_titleBackground:(id)a3
{
  objc_storeStrong((id *)&self->__titleBackground, a3);
}

- (UIView)_indicatorBackground
{
  return self->__indicatorBackground;
}

- (void)set_indicatorBackground:(id)a3
{
  objc_storeStrong((id *)&self->__indicatorBackground, a3);
}

- (CEKTickMarksContainer)_tickMarksView
{
  return self->__tickMarksView;
}

- (CEKDynamicTickMarksView)_dynamicTickMarksView
{
  return self->__dynamicTickMarksView;
}

- (CEKSliderDotView)_dotView
{
  return self->__dotView;
}

- (void)set_dotView:(id)a3
{
  objc_storeStrong((id *)&self->__dotView, a3);
}

- (CEKSelectionFeedbackGenerator)_feedbackGenerator
{
  return self->__feedbackGenerator;
}

- (CEKAnimationGenerator)_animationGenerator
{
  return self->__animationGenerator;
}

- (void)_setAnimationGenerator:(id)a3
{
  objc_storeStrong((id *)&self->__animationGenerator, a3);
}

- (BOOL)_needsUpdateContentOffset
{
  return self->__needsUpdateContentOffset;
}

- (void)_setNeedsUpdateContentOffset:(BOOL)a3
{
  self->__needsUpdateContentOffset = a3;
}

- (BOOL)_isOverscrolling
{
  return self->__overscrolling;
}

- (BOOL)_isExternalScrollingAllowed
{
  return self->__externalScrollingAllowed;
}

- (void)_setExternalScrollingAllowed:(BOOL)a3
{
  self->__externalScrollingAllowed = a3;
}

- (BOOL)_isExternallyScrolling
{
  return self->__externallyScrolling;
}

- (void)_setExternallyScrolling:(BOOL)a3
{
  self->__externallyScrolling = a3;
}

- (double)_externalOverScroll
{
  return self->__externalOverScroll;
}

- (void)_setExternalOverScroll:(double)a3
{
  self->__externalOverScroll = a3;
}

- (UIViewFloatAnimatableProperty)_externalScrollOffsetAnimator
{
  return self->__externalScrollOffsetAnimator;
}

- (void)_setExternalScrollOffsetAnimator:(id)a3
{
  objc_storeStrong((id *)&self->__externalScrollOffsetAnimator, a3);
}

- (unint64_t)indexCount
{
  return self->_indexCount;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (BOOL)biasScrollingToCurrentSelection
{
  return self->_biasScrollingToCurrentSelection;
}

- (void)setBiasScrollingToCurrentSelection:(BOOL)a3
{
  self->_biasScrollingToCurrentSelection = a3;
}

- (unint64_t)markedIndex
{
  return self->_markedIndex;
}

- (unint64_t)tickMarkCountBetweenIndexes
{
  return self->_tickMarkCountBetweenIndexes;
}

- (double)tickMarksHeight
{
  return self->_tickMarksHeight;
}

- (unint64_t)colorHighlight
{
  return self->_colorHighlight;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSArray)magneticIndexes
{
  return self->_magneticIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magneticIndexes, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->__externalScrollOffsetAnimator, 0);
  objc_storeStrong((id *)&self->__animationGenerator, 0);
  objc_storeStrong((id *)&self->__feedbackGenerator, 0);
  objc_storeStrong((id *)&self->__dotView, 0);
  objc_storeStrong((id *)&self->__dynamicTickMarksView, 0);
  objc_storeStrong((id *)&self->__tickMarksView, 0);
  objc_storeStrong((id *)&self->__indicatorBackground, 0);
  objc_storeStrong((id *)&self->__titleBackground, 0);
  objc_storeStrong((id *)&self->__valueBackground, 0);
  objc_storeStrong((id *)&self->__edgeGradientView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__levelIndicatorView, 0);
  objc_storeStrong((id *)&self->__contentScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__externalScrollSettings, 0);
  objc_storeStrong((id *)&self->__sliderDriver, 0);
}

- (void)contactEndedWithAction:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_1B9835000, log, OS_LOG_TYPE_DEBUG, "ScrollDiagnostic: Not decelerating to magnetic value (velocity %.3f)", (uint8_t *)&v2, 0xCu);
}

@end
