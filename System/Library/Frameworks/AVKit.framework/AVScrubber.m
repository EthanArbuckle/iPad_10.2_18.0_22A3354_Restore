@implementation AVScrubber

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)isTracking
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVScrubber;
  return -[AVScrubber isTracking](&v4, sel_isTracking) || -[AVScrubber isScrollScrubbing](self, "isScrollScrubbing");
}

- (BOOL)isScrollScrubbing
{
  return self->_scrollScrubbing;
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    -[AVScrubber _updateLayoutItem](self, "_updateLayoutItem");
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (void)setShowsTimelineMarkers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  if (self->_showsTimelineMarkers != a3)
  {
    v3 = a3;
    self->_showsTimelineMarkers = a3;
    -[AVScrubber interstitialOverlayViews](self, "interstitialOverlayViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      v8 = !v3;
      do
      {
        -[AVScrubber interstitialOverlayViews](self, "interstitialOverlayViews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndex:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setHidden:", v8);
        ++v7;
        -[AVScrubber interstitialOverlayViews](self, "interstitialOverlayViews");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

      }
      while (v12 > v7);
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)createThumbView
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVScrubber;
  v3 = -[AVScrubber createThumbView](&v5, sel_createThumbView);
  -[AVScrubber setCurrentThumbView:](self, "setCurrentThumbView:", v3);
  return v3;
}

- (void)setCurrentThumbView:(id)a3
{
  UIImageView **p_currentThumbView;
  id WeakRetained;
  id v6;
  void *v7;
  id obj;

  obj = a3;
  p_currentThumbView = &self->_currentThumbView;
  WeakRetained = objc_loadWeakRetained((id *)p_currentThumbView);

  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)p_currentThumbView, obj);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setBackgroundColor:", v7);

  }
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVScrubber;
  -[AVScrubber setEnabled:](&v5, sel_setEnabled_);
  if (-[AVScrubber isTracking](self, "isTracking") && !a3)
  {
    -[AVScrubber setTracking:](self, "setTracking:", 0);
    -[AVScrubber setHighlighted:](self, "setHighlighted:", 0);
    -[AVScrubber sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 256);
  }
  -[AVScrubber setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
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
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MaxX;
  double MinY;
  double Height;
  double v23;
  void *v24;
  int v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  unint64_t v32;
  float v33;
  void *v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  CGFloat v66;
  objc_super v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v67.receiver = self;
  v67.super_class = (Class)AVScrubber;
  -[AVScrubber layoutSubviews](&v67, sel_layoutSubviews);
  -[AVScrubber _minTrackView](self, "_minTrackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AVScrubber _minTrackView](self, "_minTrackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVScrubber convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v66 = v13;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  MaxX = *MEMORY[0x1E0C9D648];
  MinY = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  Height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[AVScrubber loadedTimeRanges](self, "loadedTimeRanges");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVScrubber maximumValue](self, "maximumValue");
  LODWORD(v5) = v25;
  -[AVScrubber minimumValue](self, "minimumValue");
  v27 = *(float *)&v5 - v26;
  if (v27 <= 0.0 || !objc_msgSend(v24, "count"))
    goto LABEL_12;
  -[AVScrubber value](self, "value");
  v29 = v28;
  -[AVScrubber minimumValue](self, "minimumValue");
  v31 = v30;
  if ((unint64_t)objc_msgSend(v24, "count") < 2)
    goto LABEL_11;
  v32 = 0;
  v33 = (float)(v29 - v31) / v27;
  while (1)
  {
    objc_msgSend(v24, "objectAtIndexedSubscript:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "floatValue");
    if (v35 <= v33)
      break;

    ++v32;
LABEL_8:
    if (v32 >= (unint64_t)objc_msgSend(v24, "count") >> 1)
      goto LABEL_11;
  }
  objc_msgSend(v24, "objectAtIndexedSubscript:", ++v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  v38 = v37;

  if (v38 <= v33)
    goto LABEL_8;
  objc_msgSend(v24, "objectAtIndexedSubscript:", v32);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "floatValue");

LABEL_11:
  -[AVScrubber bounds](self, "bounds");
  -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
  CGRectGetWidth(v68);
  v69.origin.x = v66;
  v69.origin.y = v15;
  v69.size.width = v17;
  v69.size.height = v19;
  MaxX = CGRectGetMaxX(v69);
  v70.origin.x = v66;
  v70.origin.y = v15;
  v70.size.width = v17;
  v70.size.height = v19;
  MinY = CGRectGetMinY(v70);
  UIRoundToViewScale();
  v41 = v40;
  v71.origin.x = v66;
  v71.origin.y = v15;
  v71.size.width = v17;
  v71.size.height = v19;
  v23 = fmax(v41 - CGRectGetWidth(v71), 0.0);
  v72.origin.x = v66;
  v72.origin.y = v15;
  v72.size.width = v17;
  v72.size.height = v19;
  Height = CGRectGetHeight(v72);
LABEL_12:
  -[AVScrubber loadedTrackOverlayView](self, "loadedTrackOverlayView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", MaxX, MinY, v23, Height);

  *(float *)&v43 = v27;
  -[AVScrubber _layoutTimeLineMarkerViews:](self, "_layoutTimeLineMarkerViews:", v43);
  *(float *)&v44 = v27;
  -[AVScrubber _layoutPhotosensitiveRegions:](self, "_layoutPhotosensitiveRegions:", v44);
  -[AVScrubber currentThumbView](self, "currentThumbView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setHidden:", -[AVScrubber isEnabled](self, "isEnabled") ^ 1);

  -[AVScrubber _maxTrackView](self, "_maxTrackView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_cornerRadius");
  v48 = v47;

  if (v48 == 0.0)
  {
    -[AVScrubber _minTrackView](self, "_minTrackView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *MEMORY[0x1E0CD2A60];
    objc_msgSend(v50, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);

    -[AVScrubber _minTrackView](self, "_minTrackView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setCornerRadius:", 2.5);

    -[AVScrubber _minTrackView](self, "_minTrackView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setMaskedCorners:", 5);

    -[AVScrubber _maxTrackView](self, "_maxTrackView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setCornerCurve:", v51);

    -[AVScrubber _maxTrackView](self, "_maxTrackView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setCornerRadius:", 2.5);

    -[AVScrubber _maxTrackView](self, "_maxTrackView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setMaskedCorners:", 10);

    -[AVScrubber currentThumbView](self, "currentThumbView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVScrubber loadedTrackOverlayView](self, "loadedTrackOverlayView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVScrubber interstitialOverlayViews](self, "interstitialOverlayViews");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVBackdropView configureSlider:thumbView:loadedTrackView:withTimelineMarkers:](AVBackdropView, "configureSlider:thumbView:loadedTrackView:withTimelineMarkers:", self, v62, v63, v64);

    -[UIView avkit_makeSubtreeDisallowGroupBlending](self, "avkit_makeSubtreeDisallowGroupBlending");
  }
  if ((-[AVScrubber isEnabled](self, "isEnabled") & 1) == 0)
    -[AVScrubber setAlpha:](self, "setAlpha:", 1.0);
  if (!-[AVScrubber isScrollScrubbing](self, "isScrollScrubbing"))
  {
    -[AVScrubber updateScrollViewContentSizeAndOffsetIfNeeded](self, "updateScrollViewContentSizeAndOffsetIfNeeded");
    -[AVScrubber scrollView](self, "scrollView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVScrubber contentOffsetFromValue](self, "contentOffsetFromValue");
    objc_msgSend(v65, "setContentOffset:");

  }
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGRectGetHeight(a3);
  UIRoundToViewScale();
  v8 = v7;
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectInset(v9, 0.0, v8);
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = 9.0;
  if ((-[AVScrubber isEnabled](self, "isEnabled", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height) & 1) == 0)
  {
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v10 = CGRectGetHeight(v26);
  }
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  CGRectGetWidth(v27);
  -[AVScrubber minimumValue](self, "minimumValue");
  -[AVScrubber maximumValue](self, "maximumValue");
  -[AVScrubber minimumValue](self, "minimumValue");
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  CGRectGetMinX(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGRectGetMidY(v29);
  UIPointRoundToViewScale();
  v12 = v11;
  v14 = v13;
  v15 = *MEMORY[0x1E0CD2A60];
  -[AVScrubber currentThumbView](self, "currentThumbView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerCurve:", v15);

  v30.origin.x = v12;
  v30.origin.y = v14;
  v30.size.width = v10;
  v30.size.height = v10;
  CGRectGetHeight(v30);
  UIFloorToViewScale();
  v19 = v18;
  -[AVScrubber currentThumbView](self, "currentThumbView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCornerRadius:", v19);

  v22 = v12;
  v23 = v14;
  v24 = v10;
  v25 = v10;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (UIImageView)currentThumbView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_currentThumbView);
}

- (UIView)loadedTrackOverlayView
{
  UIView *loadedTrackOverlayView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;

  loadedTrackOverlayView = self->_loadedTrackOverlayView;
  if (!loadedTrackOverlayView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v5 = self->_loadedTrackOverlayView;
    self->_loadedTrackOverlayView = v4;

    v6 = self->_loadedTrackOverlayView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIView setUserInteractionEnabled:](self->_loadedTrackOverlayView, "setUserInteractionEnabled:", 0);
    loadedTrackOverlayView = self->_loadedTrackOverlayView;
  }
  return loadedTrackOverlayView;
}

- (NSArray)loadedTimeRanges
{
  return self->_loadedTimeRanges;
}

- (CGPoint)contentOffsetFromValue
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  CGPoint result;

  -[AVScrubber scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  -[AVScrubber scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v5 - v7;

  -[AVScrubber normalizedPosition](self, "normalizedPosition");
  v10 = v8 * v9;
  v11 = 0.0;
  result.y = v11;
  result.x = v10;
  return result;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (float)normalizedPosition
{
  float v3;
  double v4;
  float v5;
  float v6;
  float v7;
  float v8;

  -[AVScrubber duration](self, "duration");
  v3 = *(float *)&v4;
  LODWORD(v4) = 0;
  if (v3 > 0.0)
  {
    -[AVScrubber value](self, "value", v4);
    v6 = v5;
    -[AVScrubber minimumValue](self, "minimumValue");
    v8 = v6 - v7;
    -[AVScrubber duration](self, "duration");
    *(float *)&v4 = 1.0 - (float)(v8 / *(float *)&v4);
  }
  return *(float *)&v4;
}

- (float)duration
{
  float v3;
  float v4;
  float v5;

  -[AVScrubber maximumValue](self, "maximumValue");
  v4 = v3;
  -[AVScrubber minimumValue](self, "minimumValue");
  return v4 - v5;
}

- (void)_layoutTimeLineMarkerViews:(float)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  float v40;
  float v41;
  float v42;
  float v43;
  CGFloat v44;
  double MinY;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CMTime time;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AVScrubber _minTrackView](self, "_minTrackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[AVScrubber _minTrackView](self, "_minTrackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVScrubber convertRect:fromView:](self, "convertRect:fromView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[AVScrubber interstitialDisplayTimes](self, "interstitialDisplayTimes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v56;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v56 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v28);
        v30 = (void *)MEMORY[0x1E0CB37E8];
        if (v29)
        {
          objc_msgSend(v29, "timeRange");
        }
        else
        {
          v52 = 0u;
          v53 = 0u;
          v51 = 0u;
        }
        *(_OWORD *)&time.value = v51;
        time.epoch = v52;
        objc_msgSend(v30, "numberWithDouble:", CMTimeGetSeconds(&time));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v31);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v26);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[AVScrubber interstitialOverlayViews](self, "interstitialOverlayViews", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = *(_QWORD *)v48;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v37);
        objc_msgSend(v5, "objectAtIndexedSubscript:", v35 + v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "floatValue");
        v41 = v40;
        -[AVScrubber minimumValue](self, "minimumValue");
        v43 = (float)(v41 - v42) / a3;

        -[AVScrubber bounds](self, "bounds");
        -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
        v44 = CGRectGetWidth(v62) * v43;
        v63.origin.x = v17;
        v63.origin.y = v19;
        v63.size.width = v21;
        v63.size.height = v23;
        MinY = CGRectGetMinY(v63);
        objc_msgSend(v38, "layer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setCornerRadius:", 2.5);

        objc_msgSend(v38, "setFrame:", v44, MinY, 5.0, 5.0);
        -[AVScrubber insertSubview:atIndex:](self, "insertSubview:atIndex:", v38, 0);
        ++v37;
      }
      while (v34 != v37);
      v35 += v37;
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    }
    while (v34);
  }

}

- (NSMutableArray)interstitialOverlayViews
{
  return self->_interstitialOverlayViews;
}

- (NSArray)interstitialDisplayTimes
{
  return self->_interstitialDisplayTimes;
}

- (void)_layoutPhotosensitiveRegions:(float)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double Width;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  double Seconds;
  Float64 v26;
  double v27;
  float v28;
  float v29;
  double v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double MinY;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  id obj;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  uint64_t v58;
  uint64_t v59;
  CMTime v60;
  CMTime v61;
  __int128 v62;
  _OWORD v63[2];
  CMTime time;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;

  v70 = *MEMORY[0x1E0C80C00];
  -[AVScrubber photosensitiveDisplayTimes](self, "photosensitiveDisplayTimes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[AVScrubber _minTrackView](self, "_minTrackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[AVScrubber _minTrackView](self, "_minTrackView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVScrubber convertRect:fromView:](self, "convertRect:fromView:", v15, v8, v10, v12, v14);
    v56 = v17;
    v57 = v16;
    v54 = v19;
    v55 = v18;

    -[AVScrubber bounds](self, "bounds");
    -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
    Width = CGRectGetWidth(v71);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    -[AVScrubber photosensitiveOverlayViews](self, "photosensitiveOverlayViews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v58)
    {
      v59 = 0;
      v53 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v66 != v53)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          -[AVScrubber photosensitiveDisplayTimes](self, "photosensitiveDisplayTimes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndex:", v59 + i);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v24, "timeRange");
            time = *(CMTime *)((char *)v63 + 8);
            Seconds = CMTimeGetSeconds(&time);
            objc_msgSend(v24, "timeRange");
          }
          else
          {
            memset(v63, 0, sizeof(v63));
            v62 = 0u;
            *(_OWORD *)&time.value = *(_OWORD *)((char *)v63 + 8);
            time.epoch = 0;
            Seconds = CMTimeGetSeconds(&time);
            memset(&v60, 0, sizeof(v60));
          }
          v61 = v60;
          v26 = CMTimeGetSeconds(&v61);
          v27 = v26;
          *(float *)&v26 = v26;
          -[AVScrubber _normalizeSliderValue:](self, "_normalizeSliderValue:", v26);
          v29 = v28;
          v30 = Seconds + v27;
          *(float *)&v30 = Seconds + v27;
          -[AVScrubber _normalizeSliderValue:](self, "_normalizeSliderValue:", v30);
          v32 = 10.0;
          if (v29 < 0.0)
            v32 = 0.0;
          v33 = Width * (float)(v31 - fmaxf(v29, 0.0));
          if (v32 >= v33)
            v34 = v32;
          else
            v34 = v33;
          v35 = fmax(Width * v29, 0.0);
          v72.origin.y = v56;
          v72.origin.x = v57;
          v72.size.height = v54;
          v72.size.width = v55;
          MinY = CGRectGetMinY(v72);
          objc_msgSend(v22, "layer");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setCornerRadius:", 2.5);

          objc_msgSend(v24, "colors");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)MEMORY[0x1E0DC3658];
          objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "doubleValue");
          v42 = v41;
          objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "doubleValue");
          v45 = v44;
          objc_msgSend(v38, "objectAtIndexedSubscript:", 2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "doubleValue");
          v48 = v47;
          objc_msgSend(v38, "objectAtIndexedSubscript:", 3);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "doubleValue");
          objc_msgSend(v39, "colorWithRed:green:blue:alpha:", v42, v45, v48, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setBackgroundColor:", v51);

          objc_msgSend(v22, "setFrame:", v35, MinY, v34, 5.0);
          -[AVScrubber insertSubview:atIndex:](self, "insertSubview:atIndex:", v22, 0);

        }
        v59 += i;
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v58);
    }

  }
}

- (NSArray)photosensitiveDisplayTimes
{
  return self->_photosensitiveDisplayTimes;
}

- (void)layoutAttributesDidChange
{
  id v3;

  -[AVScrubber layoutAttributes](self, "layoutAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVScrubber setCollapsed:](self, "setCollapsed:", objc_msgSend(v3, "isCollapsed"));

}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[AVScrubber _updateLayoutItem](self, "_updateLayoutItem");
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (AVScrubber)initWithFrame:(CGRect)a3
{
  AVScrubber *v3;
  AVScrubber *v4;
  NSMutableArray *v5;
  NSMutableArray *interstitialOverlayViews;
  NSMutableArray *v7;
  NSMutableArray *photosensitiveOverlayViews;
  AVLayoutItemAttributes *v9;
  AVLayoutItemAttributes *layoutAttributes;
  AVLayoutItemAttributes *v11;
  AVLayoutItemAttributes *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVScrubber;
  v3 = -[AVScrubber initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AVScrubber setSemanticContentAttribute:](v3, "setSemanticContentAttribute:", 1);
    v4->_included = 1;
    *(_OWORD *)&v4->_hitRectInsets.top = AVDefaultHitRectInsets_19471;
    *(_OWORD *)&v4->_hitRectInsets.bottom = unk_1AC5F8160;
    v4->_canChangeScrubbingSpeed = 1;
    v4->_scrubsWhenTappedAnywhere = 0;
    v4->_currentScrubberParentHeight = 22.0;
    v4->_scrubberEnabledStatus = 0;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    interstitialOverlayViews = v4->_interstitialOverlayViews;
    v4->_interstitialOverlayViews = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    photosensitiveOverlayViews = v4->_photosensitiveOverlayViews;
    v4->_photosensitiveOverlayViews = v7;

    v9 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v4->_layoutAttributes;
    v4->_layoutAttributes = v9;

    v11 = v4->_layoutAttributes;
    -[AVScrubber intrinsicContentSize](v4, "intrinsicContentSize");
    -[AVLayoutItemAttributes setMinimumSize:](v11, "setMinimumSize:");
    -[AVLayoutItemAttributes setCollapsed:](v4->_layoutAttributes, "setCollapsed:", -[AVScrubber isCollapsed](v4, "isCollapsed"));
    -[AVLayoutItemAttributes setIncluded:](v4->_layoutAttributes, "setIncluded:", -[AVScrubber isIncluded](v4, "isIncluded"));
    -[AVLayoutItemAttributes setHasFlexibleContentSize:](v4->_layoutAttributes, "setHasFlexibleContentSize:", 1);
    v12 = v4->_layoutAttributes;
    -[AVScrubber accessibilityIdentifier](v4, "accessibilityIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutItemAttributes setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", v13);

    objc_msgSend(MEMORY[0x1E0DC3870], "avkit_flatWhiteResizableTemplateImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVScrubber minimumTrackImageForState:](v4, "minimumTrackImageForState:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 != v14)
    {
      LODWORD(v16) = 1.0;
      -[AVScrubber setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v16);
      LODWORD(v17) = 1148846080;
      -[AVScrubber setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v17);
      LODWORD(v18) = 1112014848;
      -[AVScrubber setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v18);
      LODWORD(v19) = 1144750080;
      -[AVScrubber setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v19);
      -[AVScrubber setMinimumTrackImage:forState:](v4, "setMinimumTrackImage:forState:", v14, 0);
      -[AVScrubber setMaximumTrackImage:forState:](v4, "setMaximumTrackImage:forState:", v14, 0);
      -[AVScrubber setThumbImage:forState:](v4, "setThumbImage:forState:", v14, 0);
    }

  }
  return v4;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (void)_updateLayoutItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[AVScrubber layoutAttributes](self, "layoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVScrubber intrinsicContentSize](self, "intrinsicContentSize");
  objc_msgSend(v3, "setMinimumSize:");

  -[AVScrubber layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVScrubber isIncluded](self, "isIncluded"))
    v5 = -[AVScrubber isRemoved](self, "isRemoved") ^ 1;
  else
    v5 = 0;
  objc_msgSend(v4, "setIncluded:", v5);

  -[AVScrubber layoutAttributes](self, "layoutAttributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollapsed:", -[AVScrubber isCollapsed](self, "isCollapsed"));

}

- (CGSize)intrinsicContentSize
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGSize result;

  v3 = -[AVScrubber isCollapsedOrExcluded](self, "isCollapsedOrExcluded");
  -[AVScrubber extrinsicContentSize](self, "extrinsicContentSize");
  if (v3)
    v4 = 0.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)isCollapsedOrExcluded
{
  return -[AVScrubber isCollapsed](self, "isCollapsed")
      || !-[AVScrubber isIncluded](self, "isIncluded")
      || -[AVScrubber isRemoved](self, "isRemoved");
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (CGSize)extrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extrinsicContentSize.width;
  height = self->_extrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (void)setLoadedTimeRanges:(id)a3
{
  NSArray *v4;
  NSArray *loadedTimeRanges;

  if (self->_loadedTimeRanges != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    loadedTimeRanges = self->_loadedTimeRanges;
    self->_loadedTimeRanges = v4;

    -[AVScrubber setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setScrubberParentHeight:(double)a3
{
  double v5;

  -[AVScrubber newScrubberParentHeight](self, "newScrubberParentHeight");
  if (v5 != a3)
    -[AVScrubber setNewScrubberParentHeight:](self, "setNewScrubberParentHeight:", a3);
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  UISelectionFeedbackGenerator *feedbackGenerator;
  UISelectionFeedbackGenerator *v4;
  UISelectionFeedbackGenerator *v5;

  feedbackGenerator = self->_feedbackGenerator;
  if (!feedbackGenerator)
  {
    v4 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
    v5 = self->_feedbackGenerator;
    self->_feedbackGenerator = v4;

    feedbackGenerator = self->_feedbackGenerator;
  }
  return feedbackGenerator;
}

- (NSMutableArray)previousScrubberVelocities
{
  NSMutableArray *previousScrubberVelocities;
  NSMutableArray *v4;
  NSMutableArray *v5;

  previousScrubberVelocities = self->_previousScrubberVelocities;
  if (!previousScrubberVelocities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_previousScrubberVelocities;
    self->_previousScrubberVelocities = v4;

    previousScrubberVelocities = self->_previousScrubberVelocities;
  }
  return previousScrubberVelocities;
}

- (float)clampedEstimatedFrameRate
{
  float v3;
  float v4;

  -[AVScrubber estimatedFrameRate](self, "estimatedFrameRate");
  v3 = 30.0;
  -[AVScrubber estimatedFrameRate](self, "estimatedFrameRate");
  if (v4 > 0.0)
    return fminf(fmaxf(self->_estimatedFrameRate, 10.0), 480.0);
  return v3;
}

- (NSString)localizedScrubbingSpeedName
{
  unint64_t v2;
  void *v3;

  v2 = -[AVScrubber scrubbingSpeed](self, "scrubbingSpeed");
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    AVLocalizedString(*(&off_1E5BB4E18 + v2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (double)timeIntervalSinceTrackingEnded
{
  double Current;
  double v4;

  Current = CFAbsoluteTimeGetCurrent();
  -[AVScrubber timestampWhenTrackingEnded](self, "timestampWhenTrackingEnded");
  return Current - v4;
}

- (void)setPhotosensitiveDisplayTimes:(id)a3
{
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_photosensitiveDisplayTimes != v5)
  {
    objc_storeStrong((id *)&self->_photosensitiveDisplayTimes, a3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[AVScrubber photosensitiveOverlayViews](self, "photosensitiveOverlayViews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "removeFromSuperview");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    -[AVScrubber photosensitiveOverlayViews](self, "photosensitiveOverlayViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    if (-[NSArray count](v5, "count"))
    {
      v12 = 0;
      do
      {
        -[NSArray objectAtIndex:](v5, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "risk");
        v15 = v14;

        if (v15 >= 0.1)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0DC3890]);
          objc_msgSend(v16, "setUserInteractionEnabled:", 0);
          -[AVScrubber photosensitiveOverlayViews](self, "photosensitiveOverlayViews");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v16);

        }
        ++v12;
      }
      while (-[NSArray count](v5, "count") > v12);
    }
  }

}

- (void)setInterstitialDisplayTimes:(id)a3
{
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *v10;

  v10 = (NSArray *)a3;
  if (self->_interstitialDisplayTimes != v10)
  {
    objc_storeStrong((id *)&self->_interstitialDisplayTimes, a3);
    -[AVScrubber interstitialOverlayViews](self, "interstitialOverlayViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    if (-[NSArray count](v10, "count"))
    {
      v6 = 0;
      do
      {
        v7 = objc_alloc_init(MEMORY[0x1E0DC3890]);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setBackgroundColor:", v8);

        objc_msgSend(v7, "setUserInteractionEnabled:", 0);
        -[AVScrubber interstitialOverlayViews](self, "interstitialOverlayViews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v7);

        ++v6;
      }
      while (-[NSArray count](v10, "count") > v6);
    }
  }

}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVScrubber _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    -[AVScrubber invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVScrubber _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (BOOL)avkit_shouldPreventExternalGestureRecognizerAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  return -[AVScrubber isTracking](self, "isTracking")
      || -[AVScrubber _shouldTrackTouchAtPoint:](self, "_shouldTrackTouchAtPoint:", x, y);
}

- (void)setValue:(float)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVScrubber;
  -[AVScrubber setValue:](&v5, sel_setValue_);
  if (!-[AVScrubber isScrollScrubbing](self, "isScrollScrubbing"))
  {
    -[AVScrubber updateScrollViewContentSizeAndOffsetIfNeeded](self, "updateScrollViewContentSizeAndOffsetIfNeeded");
    -[AVScrubber scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVScrubber contentOffsetFromValue](self, "contentOffsetFromValue");
    objc_msgSend(v4, "setContentOffset:");

  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  _QWORD v24[4];
  id v25[2];
  _QWORD v26[4];
  id v27;
  id location;
  CGPoint v29;
  CGRect v30;
  CGRect v31;

  v6 = a3;
  v7 = a4;
  -[AVScrubber setHasChangedLocationAtLeastOnce:](self, "setHasChangedLocationAtLeastOnce:", 0);
  -[AVScrubber setShouldRecoverFromPrecisionScrubbingIfNeeded:](self, "setShouldRecoverFromPrecisionScrubbingIfNeeded:", 0);
  -[AVScrubber setScrubbingSpeed:](self, "setScrubbingSpeed:", 0);
  objc_msgSend(v6, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  if ((objc_msgSend(v6, "_isPointerTouch") & 1) != 0)
  {
    -[AVScrubber currentThumbView](self, "currentThumbView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v29.x = v9;
    v29.y = v11;
    -[AVScrubber setScrubsWhenTappedAnywhere:](self, "setScrubsWhenTappedAnywhere:", !CGRectContainsPoint(v30, v29));

  }
  else
  {
    -[AVScrubber setScrubsWhenTappedAnywhere:](self, "setScrubsWhenTappedAnywhere:", 0);
  }
  v13 = -[AVScrubber _shouldTrackTouchAtPoint:](self, "_shouldTrackTouchAtPoint:", v9, v11);
  if (v13)
  {
    -[AVScrubber feedbackGenerator](self, "feedbackGenerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "prepare");

    self->_trackingStartTime = CFAbsoluteTimeGetCurrent();
    self->_didHaveLessThanFullScrubbingSpeedSinceTrackingBegin = 0;
    objc_initWeak(&location, self);
    v15 = (void *)MEMORY[0x1E0C99E88];
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __47__AVScrubber_beginTrackingWithTouch_withEvent___block_invoke;
    v26[3] = &unk_1E5BB49A8;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v15, "scheduledTimerWithTimeInterval:repeats:block:", 1, v26, 0.25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVScrubber setUpdateSlowKnobMovementDetectedTimer:](self, "setUpdateSlowKnobMovementDetectedTimer:", v17);

    if (-[AVScrubber scrubsWhenTappedAnywhere](self, "scrubsWhenTappedAnywhere"))
    {
      -[AVScrubber maximumValue](self, "maximumValue");
      v19 = v18;
      -[AVScrubber minimumValue](self, "minimumValue");
      v21 = v20;
      -[AVScrubber bounds](self, "bounds");
      -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
      v22 = v9 / CGRectGetWidth(v31) * (float)(v19 - v21);
      v24[0] = v16;
      v24[1] = 3221225472;
      v24[2] = __47__AVScrubber_beginTrackingWithTouch_withEvent___block_invoke_2;
      v24[3] = &unk_1E5BB4638;
      objc_copyWeak(v25, &location);
      v25[1] = *(id *)&v22;
      dispatch_async(MEMORY[0x1E0C80D38], v24);
      objc_destroyWeak(v25);
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  _BOOL4 v28;
  double v29;
  double v30;
  float v31;
  float v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  char v39;
  void *v40;
  double v41;
  float v42;
  float v43;
  float v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  float v53;
  double v54;
  double v55;
  float v56;
  float v57;
  float v58;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v5 = a3;
  if (!-[AVScrubber hasChangedLocationAtLeastOnce](self, "hasChangedLocationAtLeastOnce"))
  {
    objc_msgSend(v5, "locationInView:", self);
    v37 = v36;
    objc_msgSend(v5, "previousLocationInView:", self);
    -[AVScrubber setHasChangedLocationAtLeastOnce:](self, "setHasChangedLocationAtLeastOnce:", v37 - v38 != 0.0);
    goto LABEL_31;
  }
  -[AVScrubber maximumValue](self, "maximumValue");
  v7 = v6;
  -[AVScrubber minimumValue](self, "minimumValue");
  v9 = v7 - v8;
  -[AVScrubber bounds](self, "bounds");
  -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
  v10 = CGRectGetWidth(v66) + -9.0;
  objc_msgSend(v5, "locationInView:", self);
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "previousLocationInView:", self);
  v65 = v12;
  v16 = v12 - v15;
  -[AVScrubber center](self, "center");
  v18 = v14 - v17;
  -[AVScrubber traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayScale");
  v21 = v20;

  -[AVScrubber value](self, "value");
  v23 = v22;
  -[AVScrubber minimumValue](self, "minimumValue");
  v25 = v9;
  v26 = (float)(v23 - v24) / v9;
  v28 = -[AVScrubber canChangeScrubbingSpeed](self, "canChangeScrubbingSpeed");
  v29 = 1.0;
  v64 = v18;
  if (v28)
  {
    v30 = fabs(v18);
    if (v30 <= 196.0)
    {
      if (v30 <= 140.0)
      {
        v31 = v25;
        if (v30 <= 84.0)
        {
          v39 = 0;
          v35 = 0;
          v34 = 1.0;
          goto LABEL_15;
        }
        v34 = 0.5;
        v35 = 1;
      }
      else
      {
        v34 = 0.25;
        v35 = 2;
        v31 = v25;
      }
    }
    else
    {
      -[AVScrubber clampedEstimatedFrameRate](self, "clampedEstimatedFrameRate", *(_QWORD *)&v18);
      v31 = v25;
      v33 = v10 / (float)(v25 * v32);
      if (v33 <= 0.125)
        v34 = v33;
      else
        v34 = 0.125;
      v35 = 3;
    }
    v39 = 1;
    -[AVScrubber setShouldRecoverFromPrecisionScrubbingIfNeeded:](self, "setShouldRecoverFromPrecisionScrubbingIfNeeded:", 1, *(_QWORD *)&v64);
LABEL_15:
    if (-[AVScrubber scrubbingSpeed](self, "scrubbingSpeed", *(_QWORD *)&v64) != v35)
    {
      -[AVScrubber setScrubbingSpeed:](self, "setScrubbingSpeed:", v35);
      -[AVScrubber feedbackGenerator](self, "feedbackGenerator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "selectionChanged");

      self->_didHaveLessThanFullScrubbingSpeedSinceTrackingBegin |= v39;
    }
    v29 = 1.0;
    goto LABEL_18;
  }
  v35 = 0;
  v34 = 1.0;
  v31 = v25;
LABEL_18:
  v41 = v10 * v21;
  v27 = v16 / v10;
  v42 = fmin(fmax(v26 + v34 * v27, 0.0), v29);
  if (!v35)
  {
    if (-[AVScrubber shouldRecoverFromPrecisionScrubbingIfNeeded](self, "shouldRecoverFromPrecisionScrubbingIfNeeded"))
    {
      v53 = (v65 + -4.5) / v10;
      if (1.0 / v10 >= vabds_f32(v53, v42))
      {
        -[AVScrubber setShouldRecoverFromPrecisionScrubbingIfNeeded:](self, "setShouldRecoverFromPrecisionScrubbingIfNeeded:", 0, 1.0, 1.0 / v10);
      }
      else
      {
        v54 = fmax(fabs(v64) / 84.0, 0.0);
        if (v54 >= 1.0)
          v55 = 0.0;
        else
          v55 = 1.0 - v54;
        v56 = v55;
        v57 = powf(v56, 3.0);
        v58 = v57 + v57;
        if (v58 > 1.0)
          v58 = 1.0;
        v42 = fminf(fmaxf(v26 + (float)((float)(v53 - v26) * v58), 0.0), 1.0);
      }
    }
    else
    {
      objc_msgSend(v5, "locationInView:", self);
      v61 = v60;
      -[AVScrubber bounds](self, "bounds");
      -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
      if (v61 <= CGRectGetMinX(v67)
        || (objc_msgSend(v5, "locationInView:", self),
            v63 = v62,
            -[AVScrubber bounds](self, "bounds"),
            -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:"),
            v63 >= CGRectGetMaxX(v68)))
      {
        v42 = round(v26);
      }
    }
  }
  -[AVScrubber minimumValue](self, "minimumValue", *(_QWORD *)&v64);
  v44 = v43 + (float)(v42 * v31);
  *(float *)&v45 = v44;
  -[AVScrubber _updateSlowKnobMovementDetectedForTargetValue:](self, "_updateSlowKnobMovementDetectedForTargetValue:", v45);
  -[AVScrubber setResolution:](self, "setResolution:", v41 / v34);
  -[AVScrubber window](self, "window");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "windowScene");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[AVScrubber window](self, "window");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "windowScene");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "activationState");

    if (!v51)
    {
      *(float *)&v52 = v44;
      -[AVScrubber setValue:](self, "setValue:", v52);
      -[AVScrubber sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    }
  }
  else
  {

  }
LABEL_31:

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[AVScrubber setTracking:](self, "setTracking:", 0, a4);
  -[AVScrubber setHighlighted:](self, "setHighlighted:", 0);
  -[AVScrubber endOrCancelTracking](self, "endOrCancelTracking");
}

- (void)cancelTrackingWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVScrubber;
  -[AVScrubber cancelTrackingWithEvent:](&v4, sel_cancelTrackingWithEvent_, a3);
  -[AVScrubber endOrCancelTracking](self, "endOrCancelTracking");
}

- (void)endOrCancelTracking
{
  void *v3;
  void *v4;

  -[AVScrubber setTimestampWhenTrackingEnded:](self, "setTimestampWhenTrackingEnded:", CFAbsoluteTimeGetCurrent());
  -[AVScrubber setScrubbingSpeed:](self, "setScrubbingSpeed:", 0);
  -[AVScrubber setSlowKnobMovementDetected:](self, "setSlowKnobMovementDetected:", 0);
  -[AVScrubber previousScrubberVelocities](self, "previousScrubberVelocities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[AVScrubber updateSlowKnobMovementDetectedTimer](self, "updateSlowKnobMovementDetectedTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[AVScrubber setUpdateSlowKnobMovementDetectedTimer:](self, "setUpdateSlowKnobMovementDetectedTimer:", 0);
  self->_trackingStartTime = NAN;
  self->_previousValue = NAN;
  self->_previousValueChangeTime = NAN;
  self->_currentValueChangedTime = NAN;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
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
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  v26.receiver = self;
  v26.super_class = (Class)AVScrubber;
  -[AVScrubber hitRect](&v26, sel_hitRect);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AVScrubber hitRectInsets](self, "hitRectInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[AVScrubber effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v19 == 1)
    v20 = v18;
  else
    v20 = v14;
  if (v19 == 1)
    v21 = v14;
  else
    v21 = v18;
  v22 = v4 + v20;
  v23 = v6 + v12;
  v24 = v8 - (v20 + v21);
  v25 = v10 - (v12 + v16);
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
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
  -[AVScrubber hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (double)normalizedScrollOffset
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  -[AVScrubber scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  -[AVScrubber scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v5 - v7;

  v9 = 0.0;
  if (v8 > 0.0)
  {
    -[AVScrubber scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOffset");
    v9 = 1.0 - v11 / v8;

  }
  return v9;
}

- (float)valueFromScrollView
{
  double v3;
  double v4;
  float v5;
  double v6;
  float v7;

  -[AVScrubber normalizedScrollOffset](self, "normalizedScrollOffset");
  v4 = v3;
  -[AVScrubber duration](self, "duration");
  v6 = v5;
  -[AVScrubber minimumValue](self, "minimumValue");
  return v7 + v4 * v6;
}

- (BOOL)_shouldTrackTouchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  BOOL v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  int v29;
  float v30;
  float v31;
  float v32;
  CGPoint v34;
  CGPoint v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  if (-[AVScrubber scrubsWhenTappedAnywhere](self, "scrubsWhenTappedAnywhere"))
  {
    -[AVScrubber hitRect](self, "hitRect");
    v34.x = x;
    v34.y = y;
    v6 = CGRectContainsPoint(v36, v34);
  }
  else
  {
    v6 = 0;
  }
  -[AVScrubber currentThumbView](self, "currentThumbView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVScrubber convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[AVScrubber currentThumbView](self, "currentThumbView");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[AVScrubber _thumbHitEdgeInsets](self, "_thumbHitEdgeInsets");
  v22 = v14 + v21;
  v24 = v16 + v23;
  v26 = v18 - (v21 + v25);
  v28 = v20 - (v23 + v27);

  v37.origin.x = v22;
  v37.origin.y = v24;
  v37.size.width = v26;
  v37.size.height = v28;
  v35.x = v9;
  v35.y = v11;
  LOBYTE(v12) = CGRectContainsPoint(v37, v35);
  v29 = -[AVScrubber _trackEnabled](self, "_trackEnabled");
  if ((v12 & 1) != 0 || v29)
  {
    -[AVScrubber maximumValue](self, "maximumValue");
    v31 = v30;
    -[AVScrubber minimumValue](self, "minimumValue");
    if ((float)(v31 - v32) <= 0.0)
    {
      return 0;
    }
    else
    {
      -[AVScrubber bounds](self, "bounds");
      -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
      return CGRectGetWidth(v38) > 0.0;
    }
  }
  return v6;
}

- (void)_updateSlowKnobMovementDetected
{
  -[AVScrubber value](self, "value");
  -[AVScrubber _updateSlowKnobMovementDetectedForTargetValue:](self, "_updateSlowKnobMovementDetectedForTargetValue:");
}

- (void)_updateSlowKnobMovementDetectedForTargetValue:(float)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  double Width;
  void *v10;
  void *v11;
  void *v12;
  CFAbsoluteTime Current;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  void *v21;
  float previousValue;
  double previousValueChangeTime;
  double currentValueChangedTime;
  float v25;
  AVScrubberVelocity *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  id location;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;

  v66 = *MEMORY[0x1E0C80C00];
  if (!-[AVScrubber slowKnobMovementDetected](self, "slowKnobMovementDetected")
    && !self->_didHaveLessThanFullScrubbingSpeedSinceTrackingBegin)
  {
    -[AVScrubber maximumValue](self, "maximumValue");
    v6 = v5;
    -[AVScrubber minimumValue](self, "minimumValue");
    v8 = v7;
    -[AVScrubber bounds](self, "bounds");
    -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
    Width = CGRectGetWidth(v67);
    objc_initWeak(&location, self);
    -[AVScrubber updateSlowKnobMovementDetectedTimer](self, "updateSlowKnobMovementDetectedTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    v11 = (void *)MEMORY[0x1E0C99E88];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __60__AVScrubber__updateSlowKnobMovementDetectedForTargetValue___block_invoke;
    v61[3] = &unk_1E5BB49A8;
    objc_copyWeak(&v62, &location);
    objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 1, v61, 0.25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVScrubber setUpdateSlowKnobMovementDetectedTimer:](self, "setUpdateSlowKnobMovementDetectedTimer:", v12);

    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[AVScrubber previousScrubberVelocities](self, "previousScrubberVelocities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v58 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v19, "timestamp");
          if (Current - v20 > 1.5)
            objc_msgSend(v14, "addObject:", v19);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v16);
    }

    -[AVScrubber previousScrubberVelocities](self, "previousScrubberVelocities");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObjectsInArray:", v14);

    previousValue = self->_previousValue;
    previousValueChangeTime = self->_previousValueChangeTime;
    currentValueChangedTime = self->_currentValueChangedTime;
    v25 = v6 - v8;
    if (((LODWORD(v25) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E)
    {
      v26 = objc_alloc_init(AVScrubberVelocity);
      -[AVScrubberVelocity setTimestamp:](v26, "setTimestamp:", Current);
      -[AVScrubberVelocity setVelocity:](v26, "setVelocity:", (Width + -9.0) * ((float)(a3 - previousValue) / v25) / (currentValueChangedTime - previousValueChangeTime));
      -[AVScrubber previousScrubberVelocities](self, "previousScrubberVelocities");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v26);

    }
    self->_previousValueChangeTime = self->_currentValueChangedTime;
    self->_currentValueChangedTime = Current;
    self->_previousValue = a3;
    if (Current - self->_trackingStartTime <= 1.0)
      goto LABEL_40;
    -[AVScrubber previousScrubberVelocities](self, "previousScrubberVelocities");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count") == 0;

    if (v29)
      goto LABEL_40;
    -[AVScrubber previousScrubberVelocities](self, "previousScrubberVelocities");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "velocity");
    v33 = v32;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[AVScrubber previousScrubberVelocities](self, "previousScrubberVelocities", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    if (v35)
    {
      v36 = 0;
      v37 = Current + -1.5;
      v38 = *(_QWORD *)v54;
      v39 = 0.0;
      do
      {
        v40 = 0;
        v41 = v33;
        v42 = v37;
        do
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(v34);
          v43 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v40);
          objc_msgSend(v43, "timestamp");
          v45 = v44;
          objc_msgSend(v43, "velocity");
          v47 = v46;
          objc_msgSend(v43, "timestamp");
          v37 = v48;
          v33 = (v45 - v42) / 1.5 * v47;
          v49 = fabs(v33);
          if (*(_QWORD *)&v33 >> 63 != *(_QWORD *)&v41 >> 63 && fabs(v41) + v49 > 0.1)
            ++v36;
          v39 = v39 + v49;
          ++v40;
          v41 = v33;
          v42 = v37;
        }
        while (v35 != v40);
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      }
      while (v35);

      if (v39 >= 3.0 && (v39 >= 12.0 || v36 <= 0) && (v39 >= 20.0 || v36 < 2))
        goto LABEL_40;
    }
    else
    {

    }
    -[AVScrubber setSlowKnobMovementDetected:](self, "setSlowKnobMovementDetected:", 1);
    -[AVScrubber delegate](self, "delegate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "scrubberSlowKnobMovementDetected:", self);

LABEL_40:
    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
  }
}

- (float)_normalizeSliderValue:(float)a3
{
  float v5;
  float v6;
  float v7;
  double v8;

  -[AVScrubber maximumValue](self, "maximumValue");
  v6 = v5;
  -[AVScrubber minimumValue](self, "minimumValue");
  v7 = v6 - *(float *)&v8;
  LODWORD(v8) = 0;
  if (v7 > 0.0)
  {
    -[AVScrubber minimumValue](self, "minimumValue", v8);
    *(float *)&v8 = (float)(a3 - *(float *)&v8) / v7;
  }
  return *(float *)&v8;
}

- (void)setPreviousScrubberVelocities:(id)a3
{
  objc_storeStrong((id *)&self->_previousScrubberVelocities, a3);
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
}

- (AVScrubberDelegate)delegate
{
  return (AVScrubberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)showsTimelineMarkers
{
  return self->_showsTimelineMarkers;
}

- (int64_t)scrubbingSpeed
{
  return self->_scrubbingSpeed;
}

- (void)setScrubbingSpeed:(int64_t)a3
{
  self->_scrubbingSpeed = a3;
}

- (float)estimatedFrameRate
{
  return self->_estimatedFrameRate;
}

- (void)setEstimatedFrameRate:(float)a3
{
  self->_estimatedFrameRate = a3;
}

- (double)resolution
{
  return self->_resolution;
}

- (void)setResolution:(double)a3
{
  self->_resolution = a3;
}

- (NSDirectionalEdgeInsets)hitRectInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_hitRectInsets.top;
  leading = self->_hitRectInsets.leading;
  bottom = self->_hitRectInsets.bottom;
  trailing = self->_hitRectInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setHitRectInsets:(NSDirectionalEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (double)scrubberParentHeight
{
  return self->_scrubberParentHeight;
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (void)setScrollScrubbing:(BOOL)a3
{
  self->_scrollScrubbing = a3;
}

- (BOOL)slowKnobMovementDetected
{
  return self->_slowKnobMovementDetected;
}

- (void)setSlowKnobMovementDetected:(BOOL)a3
{
  self->_slowKnobMovementDetected = a3;
}

- (BOOL)shouldRecoverFromPrecisionScrubbingIfNeeded
{
  return self->_shouldRecoverFromPrecisionScrubbingIfNeeded;
}

- (void)setShouldRecoverFromPrecisionScrubbingIfNeeded:(BOOL)a3
{
  self->_shouldRecoverFromPrecisionScrubbingIfNeeded = a3;
}

- (NSTimer)updateSlowKnobMovementDetectedTimer
{
  return self->_updateSlowKnobMovementDetectedTimer;
}

- (void)setUpdateSlowKnobMovementDetectedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateSlowKnobMovementDetectedTimer, a3);
}

- (double)timestampWhenTrackingEnded
{
  return self->_timestampWhenTrackingEnded;
}

- (void)setTimestampWhenTrackingEnded:(double)a3
{
  self->_timestampWhenTrackingEnded = a3;
}

- (BOOL)scrubsWhenTappedAnywhere
{
  return self->_scrubsWhenTappedAnywhere;
}

- (void)setScrubsWhenTappedAnywhere:(BOOL)a3
{
  self->_scrubsWhenTappedAnywhere = a3;
}

- (BOOL)canChangeScrubbingSpeed
{
  return self->_canChangeScrubbingSpeed;
}

- (void)setCanChangeScrubbingSpeed:(BOOL)a3
{
  self->_canChangeScrubbingSpeed = a3;
}

- (BOOL)hasChangedLocationAtLeastOnce
{
  return self->_hasChangedLocationAtLeastOnce;
}

- (void)setHasChangedLocationAtLeastOnce:(BOOL)a3
{
  self->_hasChangedLocationAtLeastOnce = a3;
}

- (BOOL)scrubberEnabledStatus
{
  return self->_scrubberEnabledStatus;
}

- (void)setScrubberEnabledStatus:(BOOL)a3
{
  self->_scrubberEnabledStatus = a3;
}

- (void)setInterstitialOverlayViews:(id)a3
{
  objc_storeStrong((id *)&self->_interstitialOverlayViews, a3);
}

- (NSMutableArray)photosensitiveOverlayViews
{
  return self->_photosensitiveOverlayViews;
}

- (void)setPhotosensitiveOverlayViews:(id)a3
{
  objc_storeStrong((id *)&self->_photosensitiveOverlayViews, a3);
}

- (double)currentScrubberParentHeight
{
  return self->_currentScrubberParentHeight;
}

- (void)setCurrentScrubberParentHeight:(double)a3
{
  self->_currentScrubberParentHeight = a3;
}

- (double)newScrubberParentHeight
{
  return self->_newScrubberParentHeight;
}

- (void)setNewScrubberParentHeight:(double)a3
{
  self->_newScrubberParentHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosensitiveOverlayViews, 0);
  objc_storeStrong((id *)&self->_interstitialOverlayViews, 0);
  objc_storeStrong((id *)&self->_updateSlowKnobMovementDetectedTimer, 0);
  objc_destroyWeak((id *)&self->_currentThumbView);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_photosensitiveDisplayTimes, 0);
  objc_storeStrong((id *)&self->_interstitialDisplayTimes, 0);
  objc_storeStrong((id *)&self->_loadedTimeRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_previousScrubberVelocities, 0);
  objc_storeStrong((id *)&self->_loadedTrackOverlayView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

void __60__AVScrubber__updateSlowKnobMovementDetectedForTargetValue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSlowKnobMovementDetected");

}

void __47__AVScrubber_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSlowKnobMovementDetected");

}

void __47__AVScrubber_beginTrackingWithTouch_withEvent___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  double v4;
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *(double *)(a1 + 40);
  *(float *)&v4 = v4;
  objc_msgSend(WeakRetained, "setValue:", v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "sendActionsForControlEvents:", 4096);

}

+ (id)keyPathsForValuesAffectingLocalizedScrubbingSpeedName
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("scrubbingSpeed"));
}

@end
