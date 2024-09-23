@implementation CAMUtilityBar

- (void)setFilterScrubberView:(id)a3
{
  CEKWheelScrubberView *v5;
  CEKWheelScrubberView *filterScrubberView;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  CEKWheelScrubberView *v12;

  v5 = (CEKWheelScrubberView *)a3;
  filterScrubberView = self->_filterScrubberView;
  v12 = v5;
  if (filterScrubberView != v5)
  {
    -[CEKWheelScrubberView removeFromSuperview](filterScrubberView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_filterScrubberView, a3);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v9 = CAMIsSmallPhone();
    v10 = 14.0;
    if (v9)
      v10 = 12.5;
    v11 = 15.0;
    if (v9)
      v11 = 12.5;
    -[CEKWheelScrubberView setThumbnailEdgeInsets:](self->_filterScrubberView, "setThumbnailEdgeInsets:", v10, v7, v11, v8);
    -[CAMUtilityBar addSubview:](self, "addSubview:", v12);
    -[CAMUtilityBar _updateVisibilityForUpdatedContent:contentView:](self, "_updateVisibilityForUpdatedContent:contentView:", 1, v12);
  }

}

- (void)setApertureSlider:(id)a3
{
  CEKApertureSlider *v5;
  CEKApertureSlider *apertureSlider;
  CAMUtilityBar *v7;
  CEKApertureSlider *v8;

  v5 = (CEKApertureSlider *)a3;
  apertureSlider = self->_apertureSlider;
  if (apertureSlider != v5)
  {
    v8 = v5;
    -[CEKApertureSlider superview](apertureSlider, "superview");
    v7 = (CAMUtilityBar *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[CEKApertureSlider removeFromSuperview](self->_apertureSlider, "removeFromSuperview");
    objc_storeStrong((id *)&self->_apertureSlider, a3);
    -[CAMUtilityBar addSubview:](self, "addSubview:", v8);
    -[CAMUtilityBar _updateVisibilityForUpdatedContent:contentView:](self, "_updateVisibilityForUpdatedContent:contentView:", 2, v8);
    v5 = v8;
  }

}

- (void)setIntensitySlider:(id)a3
{
  CEKSlider *v5;
  CEKSlider *intensitySlider;
  CAMUtilityBar *v7;
  CEKSlider *v8;

  v5 = (CEKSlider *)a3;
  intensitySlider = self->_intensitySlider;
  if (intensitySlider != v5)
  {
    v8 = v5;
    -[CEKSlider superview](intensitySlider, "superview");
    v7 = (CAMUtilityBar *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[CEKSlider removeFromSuperview](self->_intensitySlider, "removeFromSuperview");
    objc_storeStrong((id *)&self->_intensitySlider, a3);
    -[CAMUtilityBar addSubview:](self, "addSubview:", v8);
    -[CAMUtilityBar _updateVisibilityForUpdatedContent:contentView:](self, "_updateVisibilityForUpdatedContent:contentView:", 3, v8);
    v5 = v8;
  }

}

- (void)_updateVisibilityForUpdatedContent:(unint64_t)a3 contentView:(id)a4
{
  unint64_t v7;
  CAMUtilityBar *v8;
  unint64_t v9;

  v7 = -[CAMUtilityBar visibleContent](self, "visibleContent");
  if (a4)
  {
    if (v7)
    {
      -[CAMUtilityBar _updateVisibleViewAnimated:](self, "_updateVisibleViewAnimated:", 0);
      return;
    }
    v8 = self;
    v9 = a3;
  }
  else
  {
    v8 = self;
    v9 = 0;
  }
  -[CAMUtilityBar setVisibleContent:](v8, "setVisibleContent:", v9);
}

- (void)setVisibleContent:(unint64_t)a3
{
  -[CAMUtilityBar setVisibleContent:animated:](self, "setVisibleContent:animated:", a3, 0);
}

- (void)setVisibleContent:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_visibleContent != a3)
  {
    self->_visibleContent = a3;
    -[CAMUtilityBar _updateVisibleViewAnimated:](self, "_updateVisibleViewAnimated:", a4);
  }
}

- (void)_updateVisibleViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  void *v6;
  double v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  v5 = -[CAMUtilityBar visibleContent](self, "visibleContent");
  switch(v5)
  {
    case 1uLL:
      -[CAMUtilityBar filterScrubberView](self, "filterScrubberView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      -[CAMUtilityBar intensitySlider](self, "intensitySlider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[CAMUtilityBar apertureSlider](self, "apertureSlider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  if (v3)
    v7 = 0.25;
  else
    v7 = 0.0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__CAMUtilityBar__updateVisibleViewAnimated___block_invoke;
  v9[3] = &unk_1EA328A40;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v9, v7);

}

void __44__CAMUtilityBar__updateVisibleViewAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (v7 == *(void **)(a1 + 40))
          v8 = 1.0;
        else
          v8 = 0.0;
        objc_msgSend(v7, "setAlpha:", v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMUtilityBar;
  -[CAMUtilityBar layoutSubviews](&v4, sel_layoutSubviews);
  -[CAMUtilityBar _layoutFilterScrubberView](self, "_layoutFilterScrubberView");
  -[CAMUtilityBar _layoutPortraitApertureSlider](self, "_layoutPortraitApertureSlider");
  -[CAMUtilityBar intensitySlider](self, "intensitySlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUtilityBar _layoutSliderView:](self, "_layoutSliderView:", v3);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CAMUtilityBar *v5;
  CAMUtilityBar *v6;
  CAMUtilityBar *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMUtilityBar;
  -[CAMUtilityBar hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CAMUtilityBar *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)_layoutFilterScrubberView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;

  -[CAMUtilityBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMUtilityBar filterScrubberView](self, "filterScrubberView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "thumbnailSize");
  v12 = v11;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  CGRectGetMaxY(v15);
  UIRoundToViewScale();
  objc_msgSend(v14, "frameForAlignmentRect:", 0.0, v13, v8, v12);
  objc_msgSend(v14, "setFrame:");
  objc_msgSend(v14, "selectedThumbnailBorderWidth");
  UIFloorToViewScale();
  objc_msgSend(v14, "setSelectionDotCenterTopSpacing:");

}

- (void)_layoutPortraitApertureSlider
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;

  -[CAMUtilityBar apertureSlider](self, "apertureSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUtilityBar _layoutSliderView:](self, "_layoutSliderView:", v3);

  -[CAMUtilityBar bounds](self, "bounds");
  v6 = 2 * (v4 < v5);
  -[CAMUtilityBar apertureSlider](self, "apertureSlider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextOrientation:", v6);

}

- (void)_layoutSliderView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v4 = a3;
  -[CAMUtilityBar bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v16.c = v11;
  *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v13 = v12;
  v14 = v9;
  if (v9 < v12)
  {
    CGAffineTransformMakeRotation(&v16, -1.57079633);
    v14 = 360.0;
    v13 = v10;
  }
  UIRectGetCenter();
  objc_msgSend(v4, "setCenter:");
  objc_msgSend(v4, "setBounds:", v6, v8, v14, v13);
  v15 = v16;
  objc_msgSend(v4, "setTransform:", &v15);

}

- (CEKWheelScrubberView)filterScrubberView
{
  return self->_filterScrubberView;
}

- (CEKApertureSlider)apertureSlider
{
  return self->_apertureSlider;
}

- (CEKSlider)intensitySlider
{
  return self->_intensitySlider;
}

- (unint64_t)visibleContent
{
  return self->_visibleContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intensitySlider, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_filterScrubberView, 0);
}

@end
