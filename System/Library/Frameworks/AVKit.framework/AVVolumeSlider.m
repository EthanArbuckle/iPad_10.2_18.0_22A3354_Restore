@implementation AVVolumeSlider

- (BOOL)isIncluded
{
  return self->_included;
}

- (void)layoutAttributesDidChange
{
  id v3;

  -[AVVolumeSlider layoutAttributes](self, "layoutAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVVolumeSlider setCollapsed:](self, "setCollapsed:", objc_msgSend(v3, "isCollapsed"));

}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[AVVolumeSlider _updateLayoutItem](self, "_updateLayoutItem");
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    -[AVVolumeSlider _updateLayoutItem](self, "_updateLayoutItem");
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVVolumeSlider invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    -[AVVolumeSlider invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVVolumeSlider _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (void)_updateLayoutItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[AVVolumeSlider layoutAttributes](self, "layoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVVolumeSlider intrinsicContentSize](self, "intrinsicContentSize");
  objc_msgSend(v3, "setMinimumSize:");

  -[AVVolumeSlider layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVVolumeSlider isIncluded](self, "isIncluded"))
    v5 = -[AVVolumeSlider isRemoved](self, "isRemoved") ^ 1;
  else
    v5 = 0;
  objc_msgSend(v4, "setIncluded:", v5);

  -[AVVolumeSlider layoutAttributes](self, "layoutAttributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollapsed:", -[AVVolumeSlider isCollapsed](self, "isCollapsed"));

}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (CGSize)intrinsicContentSize
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGSize result;

  v3 = -[AVVolumeSlider isIncluded](self, "isIncluded");
  -[AVVolumeSlider extrinsicContentSize](self, "extrinsicContentSize");
  if (!v3)
    v4 = 0.0;
  result.height = v5;
  result.width = v4;
  return result;
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

- (BOOL)isCollapsedOrExcluded
{
  return -[AVVolumeSlider isCollapsed](self, "isCollapsed")
      || !-[AVVolumeSlider isIncluded](self, "isIncluded")
      || -[AVVolumeSlider isRemoved](self, "isRemoved");
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  float v13;
  id location;

  if (a4)
  {
    -[AVVolumeSlider setAnimatingVolumeChange:](self, "setAnimatingVolumeChange:", 1);
    objc_initWeak(&location, self);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithDampingRatio:", 0.75);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v6, 0.35);
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__AVVolumeSlider_setValue_animated___block_invoke;
    v11[3] = &unk_1E5BB0D08;
    objc_copyWeak(&v12, &location);
    v13 = a3;
    objc_msgSend(v7, "addAnimations:", v11);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __36__AVVolumeSlider_setValue_animated___block_invoke_2;
    v10[3] = &unk_1E5BB3318;
    v10[4] = self;
    objc_msgSend(v7, "addCompletion:", v10);
    objc_msgSend(v7, "startAnimation");
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVVolumeSlider;
    -[AVVolumeSlider setValue:animated:](&v9, sel_setValue_animated_, *(double *)&a3);
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

- (id)createThumbView
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVVolumeSlider;
  v3 = -[AVVolumeSlider createThumbView](&v7, sel_createThumbView);
  -[AVVolumeSlider setThumbView:](self, "setThumbView:", v3);

  -[AVVolumeSlider thumbView](self, "thumbView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[AVVolumeSlider thumbView](self, "thumbView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setThumbView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbView, a3);
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat rect;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v20 = a3.size.width;
  rect = a3.size.height;
  v19 = a3.origin.y;
  v9 = a3.origin.x;
  if (-[AVVolumeSlider isEnabled](self, "isEnabled"))
  {
    -[AVVolumeSlider thumbSize](self, "thumbSize");
  }
  else
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v11 = CGRectGetHeight(v22);
  }
  v12 = v11;
  v13 = v11;
  if (-[AVVolumeSlider isTracking](self, "isTracking"))
  {
    v23.origin.x = v9;
    v23.origin.y = v19;
    v23.size.width = v20;
    v23.size.height = rect;
    v14 = CGRectGetHeight(v23);
    if (v12 >= v14)
      v13 = v14;
    else
      v13 = v12;
  }
  -[AVVolumeSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  CGRectGetWidth(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  CGRectGetMinX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  CGRectGetMidY(v26);
  UIPointRoundToViewScale();
  v17 = v13;
  v18 = v13;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)thumbSize
{
  return self->_thumbSize;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;

  v47.receiver = self;
  v47.super_class = (Class)AVVolumeSlider;
  -[AVVolumeSlider layoutSubviews](&v47, sel_layoutSubviews);
  -[AVVolumeSlider _minTrackView](self, "_minTrackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerRadius");
  if (v5 == 0.0)
  {

  }
  else
  {
    -[AVVolumeSlider thumbView](self, "thumbView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cornerRadius");
    v9 = v8;

    if (v9 != 0.0)
    {
      v10 = *MEMORY[0x1E0CD2A60];
      -[AVVolumeSlider thumbView](self, "thumbView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCornerCurve:", v10);

      -[AVVolumeSlider thumbView](self, "thumbView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      CGRectGetHeight(v48);
      UIFloorToViewScale();
      v15 = v14;
      -[AVVolumeSlider thumbView](self, "thumbView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCornerRadius:", v15);

      goto LABEL_9;
    }
  }
  -[AVVolumeSlider _minTrackView](self, "_minTrackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CD2A60];
  objc_msgSend(v19, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);

  -[AVVolumeSlider _minTrackView](self, "_minTrackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", 2.5);

  -[AVVolumeSlider _maxTrackView](self, "_maxTrackView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerCurve:", v20);

  -[AVVolumeSlider _maxTrackView](self, "_maxTrackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCornerRadius:", 2.5);

  v27 = -[AVVolumeSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[AVVolumeSlider _minTrackView](self, "_minTrackView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v27)
  {
    objc_msgSend(v29, "setMaskedCorners:", 10);

    -[AVVolumeSlider _maxTrackView](self, "_maxTrackView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = 5;
  }
  else
  {
    objc_msgSend(v29, "setMaskedCorners:", 5);

    -[AVVolumeSlider _maxTrackView](self, "_maxTrackView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = 10;
  }
  objc_msgSend(v32, "setMaskedCorners:", v34);

  -[AVVolumeSlider thumbView](self, "thumbView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCornerCurve:", v20);

  -[AVVolumeSlider thumbView](self, "thumbView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");
  CGRectGetHeight(v49);
  UIFloorToViewScale();
  v39 = v38;
  -[AVVolumeSlider thumbView](self, "thumbView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setCornerRadius:", v39);

  -[AVVolumeSlider thumbView](self, "thumbView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVBackdropView configureSlider:thumbView:loadedTrackView:](AVBackdropView, "configureSlider:thumbView:loadedTrackView:", self, v42, 0);

  -[UIView avkit_makeSubtreeDisallowGroupBlending](self, "avkit_makeSubtreeDisallowGroupBlending");
LABEL_9:
  if (-[AVVolumeSlider isEnabled](self, "isEnabled"))
    v43 = 1.0;
  else
    v43 = 0.5;
  if (-[AVVolumeSlider isCollapsedOrExcluded](self, "isCollapsedOrExcluded"))
    v44 = 0.0;
  else
    v44 = v43;
  -[AVVolumeSlider setAlpha:](self, "setAlpha:", v44);
  -[AVVolumeSlider thumbView](self, "thumbView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVVolumeSlider isEnabled](self, "isEnabled"))
    v46 = 1.0;
  else
    v46 = 0.0;
  objc_msgSend(v45, "setAlpha:", v46);

}

- (UIImageView)thumbView
{
  return self->_thumbView;
}

- (AVVolumeSlider)initWithFrame:(CGRect)a3
{
  AVVolumeSlider *v3;
  AVVolumeSlider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVVolumeSlider;
  v3 = -[AVVolumeSlider initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_thumbSize = 9.0;
    -[AVVolumeSlider _commonInit](v3, "_commonInit");
  }
  return v4;
}

- (void)_commonInit
{
  AVLayoutItemAttributes *v3;
  AVLayoutItemAttributes *layoutAttributes;
  AVLayoutItemAttributes *v5;
  AVLayoutItemAttributes *v6;
  void *v7;
  id v8;
  id v9;

  self->_included = 1;
  self->_scrubsWhenTappedAnywhere = 0;
  v3 = objc_alloc_init(AVLayoutItemAttributes);
  layoutAttributes = self->_layoutAttributes;
  self->_layoutAttributes = v3;

  v5 = self->_layoutAttributes;
  -[AVVolumeSlider intrinsicContentSize](self, "intrinsicContentSize");
  -[AVLayoutItemAttributes setMinimumSize:](v5, "setMinimumSize:");
  -[AVLayoutItemAttributes setCollapsed:](self->_layoutAttributes, "setCollapsed:", -[AVVolumeSlider isCollapsed](self, "isCollapsed"));
  -[AVLayoutItemAttributes setIncluded:](self->_layoutAttributes, "setIncluded:", -[AVVolumeSlider isIncluded](self, "isIncluded"));
  -[AVLayoutItemAttributes setHasFlexibleContentSize:](self->_layoutAttributes, "setHasFlexibleContentSize:", 0);
  v6 = self->_layoutAttributes;
  -[AVVolumeSlider accessibilityIdentifier](self, "accessibilityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVLayoutItemAttributes setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v7);

  objc_msgSend(MEMORY[0x1E0DC3870], "avkit_flatWhiteResizableTemplateImage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AVVolumeSlider minimumTrackImageForState:](self, "minimumTrackImageForState:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    -[AVVolumeSlider setMinimumTrackImage:forState:](self, "setMinimumTrackImage:forState:", v9, 0);
    -[AVVolumeSlider setMaximumTrackImage:forState:](self, "setMaximumTrackImage:forState:", v9, 0);
    -[AVVolumeSlider setThumbImage:forState:](self, "setThumbImage:forState:", v9, 0);
    -[AVVolumeSlider setSemanticContentAttribute:](self, "setSemanticContentAttribute:", 0);
  }

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVVolumeSlider;
  -[AVVolumeSlider didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVVolumeSlider setNeedsLayout](self, "setNeedsLayout");
}

- (AVVolumeSlider)initWithFrame:(CGRect)a3 thumbSize:(double)a4
{
  AVVolumeSlider *v5;
  AVVolumeSlider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVVolumeSlider;
  v5 = -[AVVolumeSlider initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_thumbSize = a4;
    -[AVVolumeSlider _commonInit](v5, "_commonInit");
  }
  return v6;
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVVolumeSlider _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (BOOL)avkit_shouldPreventExternalGestureRecognizerAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  return (-[AVVolumeSlider isTracking](self, "isTracking") & 1) != 0
      || -[AVVolumeSlider _shouldTrackTouchAtPoint:](self, "_shouldTrackTouchAtPoint:", x, y);
}

- (id)accessibilityLabel
{
  return AVLocalizedString(CFSTR("Volume"));
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
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect result;

  v15.receiver = self;
  v15.super_class = (Class)AVVolumeSlider;
  -[AVVolumeSlider hitRect](&v15, sel_hitRect);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AVVolumeSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v11 = v4 + -16.0;
  v12 = v6 + -16.0;
  v13 = v8 + 32.0;
  v14 = v10 + 32.0;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
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
  -[AVVolumeSlider hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  CGPoint v16;
  CGRect v17;
  CGRect v18;

  v5 = a3;
  -[AVVolumeSlider setHasChangedLocationAtLeastOnce:](self, "setHasChangedLocationAtLeastOnce:", 0);
  objc_msgSend(v5, "locationInView:", self);
  v7 = v6;
  v9 = v8;
  if ((objc_msgSend(v5, "_isPointerTouch") & 1) != 0)
  {
    -[AVVolumeSlider thumbView](self, "thumbView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v16.x = v7;
    v16.y = v9;
    -[AVVolumeSlider setScrubsWhenTappedAnywhere:](self, "setScrubsWhenTappedAnywhere:", !CGRectContainsPoint(v17, v16));

  }
  else
  {
    -[AVVolumeSlider setScrubsWhenTappedAnywhere:](self, "setScrubsWhenTappedAnywhere:", 0);
  }
  objc_msgSend(v5, "locationInView:", self);
  v11 = -[AVVolumeSlider _shouldTrackTouchAtPoint:](self, "_shouldTrackTouchAtPoint:");
  if (v11)
  {
    -[AVVolumeSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userInteractionStarted");

    -[AVVolumeSlider _modulationFeedbackGenerator](self, "_modulationFeedbackGenerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateWithCompletionBlock:", 0);

    if (-[AVVolumeSlider scrubsWhenTappedAnywhere](self, "scrubsWhenTappedAnywhere"))
    {
      -[AVVolumeSlider bounds](self, "bounds");
      -[AVVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
      v14 = fmin(fmax(v7 / CGRectGetWidth(v18), 0.0), 1.0);
      *(float *)&v14 = v14;
      -[AVVolumeSlider setValue:animated:](self, "setValue:animated:", 0, v14);
      -[AVVolumeSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    }
  }

  return v11;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  double Width;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MaxX;
  float v21;
  float v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v5 = a3;
  -[AVVolumeSlider bounds](self, "bounds");
  -[AVVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
  Width = CGRectGetWidth(v29);
  objc_msgSend(v5, "locationInView:", self);
  v8 = v7;
  objc_msgSend(v5, "previousLocationInView:", self);
  v10 = v8 - v9;
  if (-[AVVolumeSlider hasChangedLocationAtLeastOnce](self, "hasChangedLocationAtLeastOnce"))
  {
    v11 = -[AVVolumeSlider effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v12 = Width > 0.0;
    if (Width > 0.0 && v10 != 0.0)
    {
      if (v11 == 1)
        v13 = -(v10 / Width);
      else
        v13 = v10 / Width;
      objc_msgSend(v5, "locationInView:", self);
      v15 = v14;
      -[AVVolumeSlider bounds](self, "bounds");
      -[AVVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
      if (v15 >= CGRectGetMinX(v30) || (v16 = 0.0, v13 <= 0.0))
      {
        objc_msgSend(v5, "locationInView:", self);
        v18 = v17;
        -[AVVolumeSlider bounds](self, "bounds");
        -[AVVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
        MaxX = CGRectGetMaxX(v31);
        if (v13 >= 0.0 || v18 <= MaxX)
          v16 = 1.0;
        else
          v16 = 0.0;
      }
      -[AVVolumeSlider value](self, "value");
      v22 = fmin(fmax(v21 + v13 * v16, 0.0), 1.0);
      -[AVVolumeSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVVolumeSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "distance");
      objc_msgSend(v23, "positionUpdated:", v25 * v22);

      -[AVVolumeSlider _modulationFeedbackGenerator](self, "_modulationFeedbackGenerator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "valueUpdated:", v22);

      *(float *)&v27 = v22;
      -[AVVolumeSlider setValue:animated:](self, "setValue:animated:", 0, v27);
      -[AVVolumeSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
      v12 = 1;
      -[AVVolumeSlider setHighlighted:](self, "setHighlighted:", 1);
    }
  }
  else
  {
    -[AVVolumeSlider setHasChangedLocationAtLeastOnce:](self, "setHasChangedLocationAtLeastOnce:", v10 != 0.0);
    v12 = 1;
  }

  return v12;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVVolumeSlider;
  -[AVVolumeSlider cancelTrackingWithEvent:](&v4, sel_cancelTrackingWithEvent_, a3);
  -[AVVolumeSlider _endTracking](self, "_endTracking");
}

- (void)_endTracking
{
  void *v3;
  void *v4;

  -[AVVolumeSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInteractionEnded");

  -[AVVolumeSlider _modulationFeedbackGenerator](self, "_modulationFeedbackGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivate");

  -[AVVolumeSlider setTracking:](self, "setTracking:", 0);
  -[AVVolumeSlider setHighlighted:](self, "setHighlighted:", 0);
}

- (BOOL)_shouldTrackTouchAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  if (-[AVVolumeSlider scrubsWhenTappedAnywhere](self, "scrubsWhenTappedAnywhere"))
    return 1;
  -[AVVolumeSlider thumbView](self, "thumbView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[AVVolumeSlider thumbView](self, "thumbView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVVolumeSlider convertRect:fromView:](self, "convertRect:fromView:", v16, v9, v11, v13, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v26.origin.x = v18;
  v26.origin.y = v20;
  v26.size.width = v22;
  v26.size.height = v24;
  v27 = CGRectInset(v26, -16.0, -16.0);
  v25.x = x;
  v25.y = y;
  return CGRectContainsPoint(v27, v25);
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

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)isAnimatingVolumeChange
{
  return self->_animatingVolumeChange;
}

- (void)setAnimatingVolumeChange:(BOOL)a3
{
  self->_animatingVolumeChange = a3;
}

- (void)setThumbSize:(double)a3
{
  self->_thumbSize = a3;
}

- (BOOL)hasChangedLocationAtLeastOnce
{
  return self->_hasChangedLocationAtLeastOnce;
}

- (void)setHasChangedLocationAtLeastOnce:(BOOL)a3
{
  self->_hasChangedLocationAtLeastOnce = a3;
}

- (BOOL)scrubsWhenTappedAnywhere
{
  return self->_scrubsWhenTappedAnywhere;
}

- (void)setScrubsWhenTappedAnywhere:(BOOL)a3
{
  self->_scrubsWhenTappedAnywhere = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
}

void __36__AVVolumeSlider_setValue_animated___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  double v4;
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LODWORD(v4) = *(_DWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "setValue:", v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "layoutIfNeeded");

}

uint64_t __36__AVVolumeSlider_setValue_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnimatingVolumeChange:", 0);
}

@end
