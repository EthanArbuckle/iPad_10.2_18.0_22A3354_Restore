@implementation CEKLightingControl

- (CEKLightingControl)initWithFrame:(CGRect)a3
{
  CEKLightingControl *v3;
  void *v4;
  NSArray *effectTypes;
  uint64_t v6;
  NSSet *enabledEffectTypes;
  void *v8;
  void *v9;
  void *v10;
  CEKAnimationGenerator *v11;
  CEKAnimationGenerator *animationGenerator;
  CEKLightingFrameCache *v13;
  CEKLightingFrameCache *frameCache;
  CEKSelectionFeedbackGenerator *v15;
  CEKSelectionFeedbackGenerator *selectionFeedbackGenerator;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CEKLightingControl;
  v3 = -[CEKLightingControl initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl setTintColor:](v3, "setTintColor:", v4);

    v3->_selectedLightingType = -[CEKLightingControl defaultLightingType](v3, "defaultLightingType");
    v3->_collapsedItemFading.leftRate = 0;
    v3->_collapsedItemFading.rightRate = 0;
    -[CEKLightingControl _createBackgroundViewIfNeeded](v3, "_createBackgroundViewIfNeeded");
    -[CEKLightingControl _createSelectionViewsIfNeeded](v3, "_createSelectionViewsIfNeeded");
    -[CEKLightingControl _createNameBadgeIfNeeded](v3, "_createNameBadgeIfNeeded");
    -[CEKLightingControl _createItemContainerIfNeeded](v3, "_createItemContainerIfNeeded");
    effectTypes = v3->__effectTypes;
    v3->__effectTypes = (NSArray *)&unk_1E70B46C8;

    v3->_lightingEffectSet = 2;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E70B46B0);
    v6 = objc_claimAutoreleasedReturnValue();
    enabledEffectTypes = v3->__enabledEffectTypes;
    v3->__enabledEffectTypes = (NSSet *)v6;

    -[CEKLightingControl _loadItemsIfNeeded](v3, "_loadItemsIfNeeded");
    -[CEKLightingControl _createItemViewsIfNeeded](v3, "_createItemViewsIfNeeded");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v3, sel__handlePanGesture_);
    -[CEKLightingControl addGestureRecognizer:](v3, "addGestureRecognizer:", v8);
    objc_msgSend(v8, "setMaximumNumberOfTouches:", 1);
    objc_msgSend(v8, "setAllowedScrollTypesMask:", 3);
    objc_msgSend(v8, "setDelegate:", v3);
    objc_storeStrong((id *)&v3->__panGesture, v8);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v3, sel__handlePressGesture_);
    -[CEKLightingControl addGestureRecognizer:](v3, "addGestureRecognizer:", v9);
    objc_msgSend(v9, "setMinimumPressDuration:", 0.0);
    objc_msgSend(v9, "setDelegate:", v3);
    objc_storeStrong((id *)&v3->__pressGesture, v9);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__handleTapGesture_);
    -[CEKLightingControl addGestureRecognizer:](v3, "addGestureRecognizer:", v10);
    objc_msgSend(v10, "setDelegate:", v3);
    objc_storeStrong((id *)&v3->__tapGesture, v10);
    v11 = objc_alloc_init(CEKAnimationGenerator);
    animationGenerator = v3->__animationGenerator;
    v3->__animationGenerator = v11;

    v13 = objc_alloc_init(CEKLightingFrameCache);
    frameCache = v3->__frameCache;
    v3->__frameCache = v13;

    if (CEKHapticsAllowed())
    {
      v15 = objc_alloc_init(CEKSelectionFeedbackGenerator);
      selectionFeedbackGenerator = v3->__selectionFeedbackGenerator;
      v3->__selectionFeedbackGenerator = v15;

    }
    v3->_maxContentWidth = 414.0;
    v3->_collapsedSelectionCenterPointEdgeInset = 44.0;

  }
  return v3;
}

- (UIEdgeInsets)alignmentRectInsets
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
  UIEdgeInsets result;

  -[CEKLightingControl _nameBadge](self, "_nameBadge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  -[CEKLightingControl _dialBadgePaddingExpanded:](self, "_dialBadgePaddingExpanded:", 1);
  v7 = v6 + v5;

  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v11;
  return result;
}

- (void)setCollapsedControlLocation:(unint64_t)a3
{
  -[CEKLightingControl setCollapsedControlLocation:animated:](self, "setCollapsedControlLocation:animated:", a3, 0);
}

- (void)setCollapsedControlLocation:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->_collapsedControlLocation != a3)
  {
    v4 = a4;
    self->_collapsedControlLocation = a3;
    -[CEKLightingControl _createCollapsedControlViewsIfNeeded](self, "_createCollapsedControlViewsIfNeeded");
    -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __59__CEKLightingControl_setCollapsedControlLocation_animated___block_invoke;
      v6[3] = &unk_1E70A4B18;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.25);
    }
  }
}

uint64_t __59__CEKLightingControl_setCollapsedControlLocation_animated___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_selectionAngularOffset");
  return objc_msgSend(v1, "_updateItemViewsWithSelectionOffsetAngle:");
}

- (void)setCollapsedSelectionCenterPointEdgeInset:(double)a3
{
  if (self->_collapsedSelectionCenterPointEdgeInset != a3)
  {
    self->_collapsedSelectionCenterPointEdgeInset = a3;
    -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  _BOOL8 v3;
  double v4;
  double v5;
  char v6;
  id v7;

  v3 = -[CEKLightingControl isExpanded](self, "isExpanded");
  -[CEKLightingControl _selectionAngularOffset](self, "_selectionAngularOffset");
  -[CEKLightingControl _rubberBandOffsetAngleForOffsetAngle:](self, "_rubberBandOffsetAngleForOffsetAngle:");
  v5 = v4;
  -[CEKLightingControl _animationGenerator](self, "_animationGenerator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isAnimatingForIdentifier:", CFSTR("cubeSettling"));
  if (v3)
  {
    if ((objc_msgSend(v7, "isAnimatingForIdentifier:", CFSTR("rotation")) & 1) != 0)
      goto LABEL_7;
    -[CEKLightingControl _layoutItemViewsRadialWithSelectionOffsetAngle:](self, "_layoutItemViewsRadialWithSelectionOffsetAngle:", v5);
  }
  else
  {
    -[CEKLightingControl _layoutItemViewsLinear](self, "_layoutItemViewsLinear");
  }
  -[CEKLightingControl _updateItemViewsWithSelectionOffsetAngle:](self, "_updateItemViewsWithSelectionOffsetAngle:", v5);
  if ((v6 & 1) == 0)
    -[CEKLightingControl _updateSelectionViewsWithSelectionOffsetAngle:](self, "_updateSelectionViewsWithSelectionOffsetAngle:", v5);
LABEL_7:
  -[CEKLightingControl _layoutBackgroundExpanded:](self, "_layoutBackgroundExpanded:", v3);
  -[CEKLightingControl _layoutSelectionViewsExpanded:](self, "_layoutSelectionViewsExpanded:", v3);
  -[CEKLightingControl _layoutNameBadgeExpanded:](self, "_layoutNameBadgeExpanded:", v3);
  -[CEKLightingControl _layoutItemContainer](self, "_layoutItemContainer");
  -[CEKLightingControl _layoutCollapsedControlViews](self, "_layoutCollapsedControlViews");

}

- (void)setAdditionalBottomPadding:(double)a3
{
  if (self->_additionalBottomPadding != a3)
  {
    self->_additionalBottomPadding = a3;
    -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaxContentWidth:(double)a3
{
  if (self->_maxContentWidth != a3)
  {
    self->_maxContentWidth = a3;
    -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CEKLightingControl _safeWidthForWidth:](self, "_safeWidthForWidth:", a3.width, a3.height);
  v5 = v4;
  -[CEKLightingControl contentHeightForWidth:](self, "contentHeightForWidth:");
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)contentHeightForWidth:(double)a3
{
  double v4;
  double v5;
  double result;

  -[CEKLightingControl _safeWidthForWidth:](self, "_safeWidthForWidth:", a3);
  v5 = v4;
  -[CEKLightingControl _dialCenterDistanceBelowBoundsForWidth:](self, "_dialCenterDistanceBelowBoundsForWidth:");
  -[CEKLightingControl _dialRadiusForWidth:](self, "_dialRadiusForWidth:", v5);
  UIRoundToViewScale();
  return result;
}

- (double)_safeWidthForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[CEKLightingControl maxContentWidth](self, "maxContentWidth");
  v6 = v5;
  v7 = 320.0;
  if (v6 >= 320.0)
    -[CEKLightingControl maxContentWidth](self, "maxContentWidth");
  return fmin(v7, fmax(a3, 320.0));
}

- (void)_layoutItemViewsRadialWithSelectionOffsetAngle:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  unint64_t v11;
  double v12;
  double v13;
  CGFloat tx;
  CGFloat ty;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int64x2_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  CGAffineTransform v36;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;

  -[CEKLightingControl _selectionPointForExpanded:](self, "_selectionPointForExpanded:", 1);
  v34 = v5;
  -[CEKLightingControl _itemViewsForType](self, "_itemViewsForType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _itemShadowViewsForType](self, "_itemShadowViewsForType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _itemOutlineViewsForType](self, "_itemOutlineViewsForType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _dialCenter](self, "_dialCenter");
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeTranslation(&v41, v9, v10);
  memset(&v40, 0, sizeof(v40));
  v39 = v41;
  CGAffineTransformInvert(&v40, &v39);
  if (-[CEKLightingControl _itemCount](self, "_itemCount"))
  {
    v11 = 0;
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v32 = vdupq_lane_s64(v34, 0);
    do
    {
      -[CEKLightingControl _offsetAngleForItemAtIndex:withSelectionOffset:](self, "_offsetAngleForItemAtIndex:withSelectionOffset:", v11, a3, *(_OWORD *)&v32);
      v33 = *(_OWORD *)&v40.c;
      v35 = *(_OWORD *)&v40.a;
      tx = v40.tx;
      ty = v40.ty;
      CGAffineTransformMakeRotation(&t2, v16);
      *(_OWORD *)&t1.a = v35;
      *(_OWORD *)&t1.c = v33;
      t1.tx = tx;
      t1.ty = ty;
      CGAffineTransformConcat(&v39, &t1, &t2);
      t1 = v39;
      v36 = v41;
      CGAffineTransformConcat(&v39, &t1, &v36);
      UIPointRoundToViewScale();
      v18 = v17;
      v20 = v19;
      -[CEKLightingControl _effectTypes](self, "_effectTypes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setCenter:", v18, v20);
      objc_msgSend(v24, "setCenter:", v18, v20);
      objc_msgSend(v25, "setCenter:", v18, v20);
      objc_msgSend(v23, "intrinsicContentSize");
      objc_msgSend(v23, "setBounds:", v12, v13, v26, v27);
      objc_msgSend(v24, "intrinsicContentSize");
      objc_msgSend(v24, "setBounds:", v12, v13, v28, v29);
      objc_msgSend(v25, "intrinsicContentSize");
      objc_msgSend(v25, "setBounds:", v12, v13, v30, v31);

      ++v11;
    }
    while (v11 < -[CEKLightingControl _itemCount](self, "_itemCount"));
  }

}

- (void)_layoutItemViewsLinear
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  -[CEKLightingControl _selectionPointForExpanded:](self, "_selectionPointForExpanded:", 0);
  v4 = v3;
  v6 = v5;
  -[CEKLightingControl _itemViewsForType](self, "_itemViewsForType");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _itemShadowViewsForType](self, "_itemShadowViewsForType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _itemOutlineViewsForType](self, "_itemOutlineViewsForType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CEKLightingControl _itemCount](self, "_itemCount"))
  {
    v9 = 0;
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      -[CEKLightingControl _offsetXForItemAtIndex:](self, "_offsetXForItemAtIndex:", v9);
      v13 = v4 + v12;
      -[CEKLightingControl _effectTypes](self, "_effectTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCenter:", v13, v6);
      objc_msgSend(v18, "setCenter:", v13, v6);
      objc_msgSend(v17, "setCenter:", v13, v6);
      objc_msgSend(v16, "intrinsicContentSize");
      objc_msgSend(v16, "setBounds:", v10, v11, v19, v20);
      objc_msgSend(v18, "intrinsicContentSize");
      objc_msgSend(v18, "setBounds:", v10, v11, v21, v22);
      objc_msgSend(v17, "intrinsicContentSize");
      objc_msgSend(v17, "setBounds:", v10, v11, v23, v24);

      ++v9;
    }
    while (v9 < -[CEKLightingControl _itemCount](self, "_itemCount"));
  }

}

- (void)_layoutCollapsedControlViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  -[CEKLightingControl _selectionPointForExpanded:](self, "_selectionPointForExpanded:", 0);
  v4 = v3;
  v6 = v5;
  v7 = -[CEKLightingControl collapsedControlLocation](self, "collapsedControlLocation");
  if (v7)
  {
    if (v7 == 2)
    {
      -[CEKLightingControl bounds](self, "bounds");
      v10 = v9;
      -[CEKLightingControl collapsedSelectionCenterPointEdgeInset](self, "collapsedSelectionCenterPointEdgeInset");
      v4 = v10 - v11;
    }
    else if (v7 == 1)
    {
      -[CEKLightingControl collapsedSelectionCenterPointEdgeInset](self, "collapsedSelectionCenterPointEdgeInset");
      v4 = v8;
    }
    -[CEKLightingControl _collapsedControlItemView](self, "_collapsedControlItemView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl _collapsedControlShadowView](self, "_collapsedControlShadowView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl _collapsedControlSelectionOverlay](self, "_collapsedControlSelectionOverlay");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl _collapsedControlSelectionUnderlay](self, "_collapsedControlSelectionUnderlay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCenter:", v4, v6);
    objc_msgSend(v13, "setCenter:", v4, v6);
    objc_msgSend(v14, "setCenter:", v4, v6);
    objc_msgSend(v15, "setCenter:", v4, v6);
    objc_msgSend(v12, "intrinsicContentSize");
    objc_msgSend(v12, "setBounds:", CEKRectWithSize());
    objc_msgSend(v13, "intrinsicContentSize");
    objc_msgSend(v13, "setBounds:", CEKRectWithSize());
    objc_msgSend(v14, "intrinsicContentSize");
    objc_msgSend(v14, "setBounds:", CEKRectWithSize());
    objc_msgSend(v14, "bounds");
    objc_msgSend(v15, "setBounds:");
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformMakeScale(&v20, 0.8, 0.8);
    v19 = v20;
    objc_msgSend(v12, "setTransform:", &v19);
    v18 = v20;
    objc_msgSend(v13, "setTransform:", &v18);
    v17 = v20;
    objc_msgSend(v14, "setTransform:", &v17);
    v16 = v20;
    objc_msgSend(v15, "setTransform:", &v16);

  }
}

- (void)_layoutBackgroundExpanded:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double Width;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  CGRect v22;
  CGRect v23;

  v3 = a3;
  -[CEKLightingControl bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CEKLightingControl _backgroundView](self, "_backgroundView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _dialRadius](self, "_dialRadius");
  objc_msgSend(v21, "setRadius:");
  -[CEKLightingControl _dialVisibleHeightExpanded:](self, "_dialVisibleHeightExpanded:", 1);
  v14 = v13;
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  Width = CGRectGetWidth(v22);
  -[CEKLightingControl additionalBottomPadding](self, "additionalBottomPadding");
  v17 = v14 + 3.0 + v16;
  -[CEKLightingControl _dialVisibleHeightExpanded:](self, "_dialVisibleHeightExpanded:", v3);
  v19 = v18;
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  objc_msgSend(v21, "setFrame:", 0.0, CGRectGetMaxY(v23) - v19, Width, v17);
  v20 = 1.0;
  if (!v3)
    v20 = 0.0;
  objc_msgSend(v21, "setAlpha:", v20);

}

- (void)_layoutSelectionViewsExpanded:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  -[CEKLightingControl _selectionPointForExpanded:](self, "_selectionPointForExpanded:", a3);
  v5 = v4;
  v7 = v6;
  -[CEKLightingControl _selectionOverlay](self, "_selectionOverlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _selectionUnderlay](self, "_selectionUnderlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCenter:", v5, v7);
  objc_msgSend(v9, "setCenter:", v5, v7);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v8, "intrinsicContentSize");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v8, "setBounds:", v10, v11, v12, v14);
  objc_msgSend(v9, "setBounds:", v10, v11, v13, v15);
  v16 = -[CEKLightingControl isExpanded](self, "isExpanded");
  v17 = 0.75;
  memset(&v20.c, 0, 32);
  if (v16)
    v17 = 1.0;
  *(_OWORD *)&v20.a = 0uLL;
  CGAffineTransformMakeScale(&v20, v17, v17);
  v19 = v20;
  objc_msgSend(v8, "setTransform:", &v19);
  v18 = v20;
  objc_msgSend(v9, "setTransform:", &v18);

}

- (void)_layoutNameBadgeExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  void *v24;
  id v25;
  double v26;
  _QWORD v27[4];
  id v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGRect v31;

  v3 = a3;
  -[CEKLightingControl _nameBadge](self, "_nameBadge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "intrinsicContentSize");
  UIRectCenteredXInRectScale();
  v15 = v14;
  v26 = v16;
  v18 = v17;
  -[CEKLightingControl _dialVisibleHeightExpanded:](self, "_dialVisibleHeightExpanded:", v3, 0);
  v20 = v19;
  -[CEKLightingControl _dialBadgePaddingExpanded:](self, "_dialBadgePaddingExpanded:", v3);
  v22 = v21;
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  objc_msgSend(v5, "setFrame:", v15, CGRectGetMaxY(v31) - v20 - v22 - v18, v26, v18);
  v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v30.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v30.c = v23;
  *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (-[CEKLightingControl orientation](self, "orientation") == 2)
    CGAffineTransformMakeRotation(&v30, 3.14159265);
  v27[1] = 3221225472;
  v29 = v30;
  v24 = (void *)MEMORY[0x1E0DC3F10];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[2] = __47__CEKLightingControl__layoutNameBadgeExpanded___block_invoke;
  v27[3] = &unk_1E70A5328;
  v28 = v5;
  v25 = v5;
  objc_msgSend(v24, "performWithoutAnimation:", v27);

}

uint64_t __47__CEKLightingControl__layoutNameBadgeExpanded___block_invoke(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v3);
}

- (void)_layoutItemContainer
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[CEKLightingControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CEKLightingControl _itemContainer](self, "_itemContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

}

- (CGPoint)_selectionPointForExpanded:(BOOL)a3
{
  double v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double v11;
  double v12;
  CGPoint result;
  CGRect v14;
  CGRect v15;

  if (a3)
  {
    -[CEKLightingControl _dialVisibleHeightExpanded:](self, "_dialVisibleHeightExpanded:", 1);
    v5 = v4 + -36.0;
  }
  else
  {
    v5 = 34.0;
  }
  -[CEKLightingControl bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v11 = CGRectGetMaxY(v15) - v5;
  v12 = MidX;
  result.y = v11;
  result.x = v12;
  return result;
}

- (double)_dialVisibleHeightExpanded:(BOOL)a3
{
  double v4;
  double result;

  if (!a3)
    return 72.0;
  -[CEKLightingControl bounds](self, "bounds");
  -[CEKLightingControl contentHeightForWidth:](self, "contentHeightForWidth:", v4);
  return result;
}

- (double)_dialRadius
{
  double v3;
  double result;

  -[CEKLightingControl bounds](self, "bounds");
  -[CEKLightingControl _dialRadiusForWidth:](self, "_dialRadiusForWidth:", v3);
  return result;
}

- (double)_dialRadiusForWidth:(double)a3
{
  double result;

  -[CEKLightingControl _safeWidthForWidth:](self, "_safeWidthForWidth:", a3);
  -[CEKLightingControl _dialCenterDistanceBelowBoundsForWidth:](self, "_dialCenterDistanceBelowBoundsForWidth:");
  UIDistanceBetweenPoints();
  return result;
}

- (double)_angularSpacingForRadialLayout
{
  return 0.3;
}

- (double)_spacingForLinearLayout
{
  return 48.0;
}

- (double)_dialBadgePaddingExpanded:(BOOL)a3
{
  double result;

  result = -5.0;
  if (a3)
    return 10.0;
  return result;
}

- (CGPoint)_dialCenter
{
  double v3;
  double v4;
  double v5;
  CGPoint result;

  -[CEKLightingControl bounds](self, "bounds");
  -[CEKLightingControl _dialCenterForWidth:](self, "_dialCenterForWidth:", v3);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_dialCenterForWidth:(double)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;
  CGRect v17;

  -[CEKLightingControl bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CEKLightingControl _dialCenterDistanceBelowBoundsForWidth:](self, "_dialCenterDistanceBelowBoundsForWidth:", a3);
  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v12;
  CGRectGetMaxY(v17);
  UIRoundToViewScale();
  v14 = v13;
  v15 = a3 * 0.5;
  result.y = v14;
  result.x = v15;
  return result;
}

- (double)_dialCenterDistanceBelowBoundsForWidth:(double)a3
{
  double v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3 * 0.2909 + -29.09;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = -1.0 / v5 + 84.0;

  return fmin(v6, v3);
}

- (double)_angleFromCenterToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;

  y = a3.y;
  x = a3.x;
  -[CEKLightingControl _dialCenter](self, "_dialCenter");
  return atan2(v6 - y, v5 - x);
}

- (double)_offsetAngleForItemAtIndex:(unint64_t)a3 withSelectionOffset:(double)a4
{
  double v7;
  double v8;
  double v9;

  -[CEKLightingControl _angularSpacingForRadialLayout](self, "_angularSpacingForRadialLayout");
  v8 = v7;
  -[CEKLightingControl _compressedItemOffsetForFractionalItemOffset:](self, "_compressedItemOffsetForFractionalItemOffset:", a4 / v7 + (double)(uint64_t)(a3 - -[CEKLightingControl _selectionIndex](self, "_selectionIndex")));
  return v8 * v9;
}

- (double)_offsetXForItemAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[CEKLightingControl _spacingForLinearLayout](self, "_spacingForLinearLayout");
  v6 = v5;
  -[CEKLightingControl _compressedItemOffsetForFractionalItemOffset:](self, "_compressedItemOffsetForFractionalItemOffset:", (double)(uint64_t)(a3 - -[CEKLightingControl _selectionIndex](self, "_selectionIndex")));
  return v6 * v7;
}

- (double)_compressedItemOffsetForFractionalItemOffset:(double)a3
{
  double v3;

  v3 = fabs(a3);
  if (a3 >= 0.0)
    return v3 * (v3 * -0.039 + 1.024);
  else
    return -(v3 * (v3 * -0.039 + 1.024));
}

- (double)_rotationForPanGesture:(id)a3
{
  id v4;
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
  double result;

  v4 = a3;
  objc_msgSend(v4, "translationInView:", self);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "locationInView:", self);
  v10 = v9;
  v12 = v11;

  v13 = v10 - v6;
  -[CEKLightingControl _angleFromCenterToPoint:](self, "_angleFromCenterToPoint:", v10, v12);
  v15 = v14;
  -[CEKLightingControl _angleFromCenterToPoint:](self, "_angleFromCenterToPoint:", v13, v12 - v8);
  result = v15 - v16;
  if (result > 3.14159265)
    result = result + -6.28318531;
  if (result < -3.14159265)
    return result + 6.28318531;
  return result;
}

- (BOOL)_isOverDialedWithSelectionAngularOffset:(double)a3 selectionIndex:(unint64_t)a4
{
  unint64_t v6;
  BOOL v7;
  BOOL v8;

  v6 = -[CEKLightingControl _enabledItemCount](self, "_enabledItemCount") - 1;
  v7 = a3 > 0.0;
  if (a4)
    v7 = 0;
  v8 = v6 == a4 && a3 < 0.0;
  return v7 || v8;
}

- (double)_rubberBandOffsetAngleForOffsetAngle:(double)a3
{
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v11;
  double result;

  -[CEKLightingControl _angularSpacingForRadialLayout](self, "_angularSpacingForRadialLayout");
  v6 = v5;
  v7 = fabs(a3) / v5;
  v8 = -[CEKLightingControl _isOverDialedWithSelectionAngularOffset:selectionIndex:](self, "_isOverDialedWithSelectionAngularOffset:selectionIndex:", -[CEKLightingControl _selectionIndex](self, "_selectionIndex"), a3);
  if (v8 && v7 > 0.4)
    v9 = -4.0 / ((v7 + 1.546) * 0.55 + 1.0) + 1.986;
  else
    v9 = pow(10000.0, v7) * 0.0014 + -0.0014;
  if (v9 > 0.5 && !v8)
    v9 = 0.5;
  v11 = v6 * v9;
  result = -(v6 * v9);
  if (a3 >= 0.0)
    return v11;
  return result;
}

- (double)_offsetAngleForRubberBandOffsetAngle:(double)a3 selectionIndex:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double result;

  -[CEKLightingControl _angularSpacingForRadialLayout](self, "_angularSpacingForRadialLayout");
  v8 = v7;
  v9 = fabs(a3) / v7;
  if (-[CEKLightingControl _isOverDialedWithSelectionAngularOffset:selectionIndex:](self, "_isOverDialedWithSelectionAngularOffset:selectionIndex:", a4, a3)&& v9 > 0.05433)
  {
    v10 = (4.0 / (1.986 - v9) + -1.0) / 0.55 + -1.546;
  }
  else
  {
    v10 = log((v9 + 0.0014) * 714.286) * 0.108574 / 0.99999999;
  }
  v11 = v8 * v10;
  result = -(v8 * v10);
  if (a3 >= 0.0)
    return v11;
  return result;
}

- (void)_handlePressGesture:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "state");
  if (v4 <= 4 && ((1 << v4) & 0x1A) != 0)
    -[CEKLightingControl _setTracking:](self, "_setTracking:", v4 == 1);
}

- (void)_setTracking:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;

  if (self->_tracking != a3)
  {
    self->_tracking = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKLightingControl _setTimeTrackingBegan:](self, "_setTimeTrackingBegan:", v4);

      -[CEKLightingControl _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", 1, 1, 1);
      -[CEKLightingControl _cancelDelayedCollapse](self, "_cancelDelayedCollapse");
      -[CEKLightingControl _prepareFeedback](self, "_prepareFeedback");
    }
    else
    {
      -[CEKLightingControl _timeTrackingBegan](self, "_timeTrackingBegan");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceNow");
      v7 = v6;

      if (v7 >= -0.5)
      {
        v8 = -[CEKLightingControl collapsedControlLocation](self, "collapsedControlLocation") - 1;
        v9 = 1.0;
        if (v8 < 2)
          v9 = 1.5;
        -[CEKLightingControl _collapseWithDelay:](self, "_collapseWithDelay:", v9);
        -[CEKLightingControl _selectionAngularOffset](self, "_selectionAngularOffset");
        -[CEKLightingControl _snapFromSelectionOffsetAngle:toAngle:animated:](self, "_snapFromSelectionOffsetAngle:toAngle:animated:", 1);
      }
      else
      {
        -[CEKLightingControl _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", 0, 1, 1);
      }
      -[CEKLightingControl _setTimeTrackingBegan:](self, "_setTimeTrackingBegan:", 0);
    }
  }
}

- (void)_handlePanGesture:(id)a3
{
  uint64_t v4;
  CEKLightingControl *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  _BOOL4 v15;
  double v17;
  CEKLightingControl *v18;
  double v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  v4 = objc_msgSend(v30, "state");
  if (v4 == 3)
  {
    if (-[CEKLightingControl isTracking](self, "isTracking"))
    {
      v5 = self;
      v6 = 0;
      goto LABEL_8;
    }
  }
  else if (v4 == 2)
  {
    -[CEKLightingControl _rotationForPanGesture:](self, "_rotationForPanGesture:", v30);
    v8 = v7;
    -[CEKLightingControl _selectionAngularOffset](self, "_selectionAngularOffset");
    v10 = v8 + v9;
    objc_msgSend(v30, "setTranslation:inView:", self, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[CEKLightingControl _angularSpacingForRadialLayout](self, "_angularSpacingForRadialLayout");
    v12 = v11;
    v13 = v11 * 0.5;
    v14 = -[CEKLightingControl _selectionIndex](self, "_selectionIndex");
    v15 = -[CEKLightingControl _isOverDialedWithSelectionAngularOffset:selectionIndex:](self, "_isOverDialedWithSelectionAngularOffset:selectionIndex:", v14, v10);
    if (fabs(v10) >= v13 && !v15)
    {
      if (v10 <= 0.0)
        v21 = v12;
      else
        v21 = -v12;
      if (v10 <= 0.0)
        v22 = v14 + 1;
      else
        v22 = v14 - 1;
      v23 = v10 + v21;
      -[CEKLightingControl _rubberBandOffsetAngleForOffsetAngle:](self, "_rubberBandOffsetAngleForOffsetAngle:", v10);
      -[CEKLightingControl _offsetAngleForRubberBandOffsetAngle:selectionIndex:](self, "_offsetAngleForRubberBandOffsetAngle:selectionIndex:", v22, v21 + v24);
      v26 = v25;
      -[CEKLightingControl _effectTypes](self, "_effectTypes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v22);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "integerValue");

      -[CEKLightingControl _setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:](self, "_setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:", v29, v22, 1, 0, 0);
      v18 = self;
      v17 = v26;
      v19 = v23;
      v20 = 1;
    }
    else
    {
      -[CEKLightingControl _selectionAngularOffset](self, "_selectionAngularOffset");
      v18 = self;
      v19 = v10;
      v20 = 0;
    }
    -[CEKLightingControl _snapFromSelectionOffsetAngle:toAngle:animated:](v18, "_snapFromSelectionOffsetAngle:toAngle:animated:", v20, v17, v19);
    -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
  }
  else if (v4 == 1 && !-[CEKLightingControl isTracking](self, "isTracking"))
  {
    v5 = self;
    v6 = 1;
LABEL_8:
    -[CEKLightingControl _setTracking:](v5, "_setTracking:", v6);
  }

}

- (void)_handleTapGesture:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  id v23;

  v23 = a3;
  v4 = -[CEKLightingControl _expandedAnimationCounter](self, "_expandedAnimationCounter");
  v5 = v23;
  if (!v4)
  {
    objc_msgSend(v23, "locationInView:", self);
    if (-[CEKLightingControl _enabledItemCount](self, "_enabledItemCount"))
    {
      v6 = 0;
      v7 = 0;
      v8 = 1.79769313e308;
      do
      {
        -[CEKLightingControl _effectTypes](self, "_effectTypes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[CEKLightingControl _itemViewsForType](self, "_itemViewsForType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "center");
        UIDistanceBetweenPoints();
        if (v13 < v8)
        {
          v14 = v13;
          v15 = v10;

          v8 = v14;
          v7 = v15;
        }

        ++v6;
      }
      while (v6 < -[CEKLightingControl _enabledItemCount](self, "_enabledItemCount"));
    }
    else
    {
      v7 = 0;
      v8 = 1.79769313e308;
    }
    v16 = objc_msgSend(v7, "integerValue");
    -[CEKLightingControl _effectTypes](self, "_effectTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "indexOfObject:", v7);

    v19 = -[CEKLightingControl _selectionIndex](self, "_selectionIndex");
    if (v8 <= 30.0)
    {
      v20 = v19;
      if (v19 != v18)
      {
        -[CEKLightingControl _selectionAngularOffset](self, "_selectionAngularOffset");
        v22 = v21;
        -[CEKLightingControl _setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:](self, "_setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:", v16, v18, 1, 0, 0);
        -[CEKLightingControl _rotateForTapFromSelectionIndex:offset:toSelectionIndex:](self, "_rotateForTapFromSelectionIndex:offset:toSelectionIndex:", v20, v18, v22);
      }
    }

    v5 = v23;
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  BOOL v13;
  BOOL v15;

  v6 = a3;
  v7 = a4;
  -[CEKLightingControl _panGesture](self, "_panGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _pressGesture](self, "_pressGesture");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _tapGesture](self, "_tapGesture");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v6 || v9 == v7)
  {
    v13 = v10 == v6 || v10 == v7;
    v15 = v8 == v6 || v8 == v7;
    v11 = v15 ^ v13;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CEKLightingControl *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat width;
  CGFloat height;
  double MaxY;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  objc_super v33;
  CGPoint v34;
  CGPoint v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  y = a3.y;
  x = a3.x;
  v33.receiver = self;
  v33.super_class = (Class)CEKLightingControl;
  -[CEKLightingControl hitTest:withEvent:](&v33, sel_hitTest_withEvent_, a4);
  v7 = (CEKLightingControl *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    if (-[CEKLightingControl isExpanded](self, "isExpanded"))
    {
      -[CEKLightingControl _dialCenter](self, "_dialCenter");
      -[CEKLightingControl _dialRadius](self, "_dialRadius");
      v9 = v8;
      UIDistanceBetweenPoints();
      if (v10 > v9)
      {
LABEL_12:

        v7 = 0;
        return v7;
      }
    }
    else
    {
      -[CEKLightingControl bounds](self, "bounds");
      v11 = v36.origin.x;
      v12 = v36.origin.y;
      width = v36.size.width;
      height = v36.size.height;
      MaxY = CGRectGetMaxY(v36);
      -[CEKLightingControl _selectionPointForExpanded:](self, "_selectionPointForExpanded:", 0);
      v17 = MaxY - v16 + MaxY - v16;
      v18 = MaxY - v17;
      if (-[CEKLightingControl collapsedItemFading](self, "collapsedItemFading") == 2 && v19 == 2)
      {
        v37.origin.x = v11;
        v37.origin.y = v12;
        v37.size.width = width;
        v37.size.height = height;
        v11 = CGRectGetMidX(v37) + -50.0;
        width = 100.0;
      }
      v38.origin.x = v11;
      v38.origin.y = v18;
      v38.size.width = width;
      v38.size.height = v17;
      v34.x = x;
      v34.y = y;
      if (!CGRectContainsPoint(v38, v34))
      {
        -[CEKLightingControl _collapsedControlSelectionOverlay](self, "_collapsedControlSelectionOverlay");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_12;
        -[CEKLightingControl _collapsedControlSelectionOverlay](self, "_collapsedControlSelectionOverlay");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "superview");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKLightingControl _collapsedControlSelectionOverlay](self, "_collapsedControlSelectionOverlay");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "frame");
        objc_msgSend(v22, "convertRect:toView:", self);
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;

        v39.origin.x = v25;
        v39.origin.y = v27;
        v39.size.width = v29;
        v39.size.height = v31;
        v40 = CGRectInset(v39, -10.0, -10.0);
        v35.x = x;
        v35.y = y;
        if (!CGRectContainsPoint(v40, v35))
          goto LABEL_12;
      }
    }
    v7 = self;
  }
  return v7;
}

- (void)setExpanded:(BOOL)a3
{
  -[CEKLightingControl setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  -[CEKLightingControl _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", a3, a4, 0);
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  if (self->_expanded != a3)
  {
    v5 = a5;
    v6 = a4;
    v7 = a3;
    if (a5 && self->_delegateFlags.respondsToWillChangeExpanded)
    {
      -[CEKLightingControl delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lightingControl:willChangeExpanded:", self, v7);

    }
    -[CEKLightingControl _animationGenerator](self, "_animationGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopAllAnimations");
    if (v6)
      -[CEKLightingControl layoutIfNeeded](self, "layoutIfNeeded");
    self->_expanded = v7;
    -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
    -[CEKLightingControl _selectionAngularOffset](self, "_selectionAngularOffset");
    v12 = v11;
    -[CEKLightingControl _setSelectionAngularOffset:](self, "_setSelectionAngularOffset:", 0.0);
    if (v6)
    {
      if (!v7)
      {
        -[CEKLightingControl _rubberBandOffsetAngleForOffsetAngle:](self, "_rubberBandOffsetAngleForOffsetAngle:", v12);
        -[CEKLightingControl _settleSelectionViewsFromSelectionOffsetAngle:](self, "_settleSelectionViewsFromSelectionOffsetAngle:");
      }
      -[CEKLightingControl _setExpandedAnimationCounter:](self, "_setExpandedAnimationCounter:", -[CEKLightingControl _expandedAnimationCounter](self, "_expandedAnimationCounter") + 1);
      v14[4] = self;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __57__CEKLightingControl__setExpanded_animated_shouldNotify___block_invoke;
      v15[3] = &unk_1E70A4B18;
      v15[4] = self;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__CEKLightingControl__setExpanded_animated_shouldNotify___block_invoke_2;
      v14[3] = &unk_1E70A4B88;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x20000, v15, v14, 0.5, 0.0, 0.8, 0.0);
    }
    -[CEKLightingControl _updateNameBadgeAnimated:](self, "_updateNameBadgeAnimated:", v6);
    if (v5 && self->_delegateFlags.respondsToDidChangeExpanded)
    {
      -[CEKLightingControl delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lightingControlDidChangeExpanded:", self);

    }
  }
}

uint64_t __57__CEKLightingControl__setExpanded_animated_shouldNotify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __57__CEKLightingControl__setExpanded_animated_shouldNotify___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setExpandedAnimationCounter:", objc_msgSend(*(id *)(a1 + 32), "_expandedAnimationCounter") - 1);
}

- (void)_collapseWithDelay:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleCollapseTimer_, 0, 0, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _setCollapseTimer:](self, "_setCollapseTimer:", v4);

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _collapseTimer](self, "_collapseTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTimer:forMode:", v5, *MEMORY[0x1E0C99860]);

}

- (void)_handleCollapseTimer:(id)a3
{
  -[CEKLightingControl _setCollapseTimer:](self, "_setCollapseTimer:", 0);
  -[CEKLightingControl _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", 0, 1, 1);
}

- (void)_cancelDelayedCollapse
{
  void *v3;

  -[CEKLightingControl _collapseTimer](self, "_collapseTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CEKLightingControl _setCollapseTimer:](self, "_setCollapseTimer:", 0);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $7F55E5C43DCBB6AE73FA382F6052E151 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToWillChangeExpanded = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeExpanded = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setLightingEffectSet:(int64_t)a3
{
  -[CEKLightingControl setLightingEffectSet:animated:](self, "setLightingEffectSet:animated:", a3, 0);
}

- (void)setLightingEffectSet:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  if (self->_lightingEffectSet != a3)
  {
    v4 = a4;
    if (a4)
      -[CEKLightingControl layoutIfNeeded](self, "layoutIfNeeded");
    self->_lightingEffectSet = a3;
    if ((unint64_t)a3 > 3)
      v7 = 0;
    else
      v7 = qword_1E70A5780[a3];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl set_enabledEffectTypes:](self, "set_enabledEffectTypes:", v8);

    -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
    if (!-[CEKLightingControl _isLightingTypeEnabled:](self, "_isLightingTypeEnabled:", -[CEKLightingControl selectedLightingType](self, "selectedLightingType")))-[CEKLightingControl setSelectedLightingType:animated:](self, "setSelectedLightingType:animated:", -[CEKLightingControl defaultLightingType](self, "defaultLightingType"), v4);
    if (v4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __52__CEKLightingControl_setLightingEffectSet_animated___block_invoke;
      v9[3] = &unk_1E70A4B18;
      v9[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v9, 0, 0.4, 0.0);
    }
  }
}

uint64_t __52__CEKLightingControl_setLightingEffectSet_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)_isLightingTypeEnabled:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[CEKLightingControl _enabledEffectTypes](self, "_enabledEffectTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (int64_t)defaultLightingType
{
  return 1;
}

- (void)setSelectedLightingType:(int64_t)a3
{
  -[CEKLightingControl setSelectedLightingType:animated:](self, "setSelectedLightingType:animated:", a3, 0);
}

- (void)setSelectedLightingType:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  -[CEKLightingControl _effectTypes](self, "_effectTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    -[CEKLightingControl _setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:](self, "_setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:", a3, v9, 0, 1, v4);
}

- (void)ppt_selectLightingType:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  -[CEKLightingControl _effectTypes](self, "_effectTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[CEKLightingControl _setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:](self, "_setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:", a3, v7, 1, 1, 0);
}

- (void)_setSelectedLightingType:(int64_t)a3 atIndex:(unint64_t)a4 shouldNotify:(BOOL)a5 shouldSuppressHaptic:(BOOL)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v9;
  void *v13;
  _QWORD v14[5];

  if (self->_selectedLightingType != a3)
  {
    v7 = a7;
    v9 = a5;
    if (a7)
      -[CEKLightingControl layoutIfNeeded](self, "layoutIfNeeded");
    self->_selectedLightingType = a3;
    self->__selectionIndex = a4;
    -[CEKLightingControl _updateNameBadgeAnimated:](self, "_updateNameBadgeAnimated:", 0);
    -[CEKLightingControl _updateImagesForCollapedControlViews](self, "_updateImagesForCollapedControlViews");
    if (v9)
    {
      -[CEKLightingControl delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lightingControlDidChangeSelectedLightingType:", self);

    }
    if (!a6)
    {
      -[CEKLightingControl _performFeedback](self, "_performFeedback");
      -[CEKLightingControl _prepareFeedback](self, "_prepareFeedback");
    }
    -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
    if (v7)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __98__CEKLightingControl__setSelectedLightingType_atIndex_shouldNotify_shouldSuppressHaptic_animated___block_invoke;
      v14[3] = &unk_1E70A4B18;
      v14[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v14, 0, 0.15, 0.0);
    }
  }
}

uint64_t __98__CEKLightingControl__setSelectedLightingType_atIndex_shouldNotify_shouldSuppressHaptic_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_snapFromSelectionOffsetAngle:(double)a3 toAngle:(double)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  id location;

  if (a3 != a4)
  {
    v5 = a5;
    -[CEKLightingControl _setSelectionAngularOffset:](self, "_setSelectionAngularOffset:", a4);
    if (v5)
    {
      objc_initWeak(&location, self);
      LODWORD(v8) = 0;
      LODWORD(v9) = 0;
      LODWORD(v10) = 0;
      LODWORD(v11) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKLightingControl _animationGenerator](self, "_animationGenerator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __69__CEKLightingControl__snapFromSelectionOffsetAngle_toAngle_animated___block_invoke;
      v15[3] = &unk_1E70A5720;
      objc_copyWeak(v17, &location);
      v17[1] = *(id *)&a3;
      v14 = v12;
      v16 = v14;
      objc_msgSend(v13, "startAnimationForIdentifier:duration:updateHandler:completionHandler:", CFSTR("rotation"), v15, 0, 0.2);

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
    else
    {
      -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

void __69__CEKLightingControl__snapFromSelectionOffsetAngle_toAngle_animated___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleSnapFromOffset:withProgress:timingCurve:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), a2);

}

- (void)_handleSnapFromOffset:(double)a3 withProgress:(double)a4 timingCurve:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;

  v8 = a5;
  -[CEKLightingControl _selectionAngularOffset](self, "_selectionAngularOffset");
  -[CEKLightingControl _rubberBandOffsetAngleForOffsetAngle:](self, "_rubberBandOffsetAngleForOffsetAngle:");
  v10 = v9;
  -[CEKLightingControl _rubberBandOffsetAngleForOffsetAngle:](self, "_rubberBandOffsetAngleForOffsetAngle:", a3);
  v12 = v11;
  *(float *)&v11 = a4;
  objc_msgSend(v8, "_solveForInput:", v11);
  LODWORD(a4) = v13;

  v14 = v12 + *(float *)&a4 * (v10 - v12);
  -[CEKLightingControl _layoutItemViewsRadialWithSelectionOffsetAngle:](self, "_layoutItemViewsRadialWithSelectionOffsetAngle:", v14);
  -[CEKLightingControl _updateItemViewsWithSelectionOffsetAngle:](self, "_updateItemViewsWithSelectionOffsetAngle:", v14);
  -[CEKLightingControl _updateSelectionViewsWithSelectionOffsetAngle:](self, "_updateSelectionViewsWithSelectionOffsetAngle:", v14);
}

- (void)_rotateForTapFromSelectionIndex:(unint64_t)a3 offset:(double)a4 toSelectionIndex:(unint64_t)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20[2];
  id location;

  -[CEKLightingControl _angularSpacingForRadialLayout](self, "_angularSpacingForRadialLayout");
  v10 = v9;
  objc_initWeak(&location, self);
  LODWORD(v11) = 0;
  LODWORD(v12) = 0;
  LODWORD(v13) = 0;
  LODWORD(v14) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _animationGenerator](self, "_animationGenerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__CEKLightingControl__rotateForTapFromSelectionIndex_offset_toSelectionIndex___block_invoke;
  v18[3] = &unk_1E70A5720;
  objc_copyWeak(v20, &location);
  *(double *)&v20[1] = v10 * (double)(uint64_t)(a5 - a3) + a4;
  v17 = v15;
  v19 = v17;
  objc_msgSend(v16, "startAnimationForIdentifier:duration:updateHandler:completionHandler:", CFSTR("rotation"), v18, 0, 0.35);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __78__CEKLightingControl__rotateForTapFromSelectionIndex_offset_toSelectionIndex___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleTapRotationFromOffset:withProgress:timingCurve:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), a2);

}

- (void)_handleTapRotationFromOffset:(double)a3 withProgress:(double)a4 timingCurve:(id)a5
{
  id v8;
  double v9;
  double v10;
  int v11;
  double v12;

  v8 = a5;
  -[CEKLightingControl _selectionAngularOffset](self, "_selectionAngularOffset");
  v10 = v9;
  *(float *)&v9 = a4;
  objc_msgSend(v8, "_solveForInput:", v9);
  LODWORD(a4) = v11;

  v12 = a3 + *(float *)&a4 * (v10 - a3);
  -[CEKLightingControl _layoutItemViewsRadialWithSelectionOffsetAngle:](self, "_layoutItemViewsRadialWithSelectionOffsetAngle:", v12);
  -[CEKLightingControl _updateItemViewsWithSelectionOffsetAngle:](self, "_updateItemViewsWithSelectionOffsetAngle:", v12);
  -[CEKLightingControl _updateSelectionViewsWithSelectionOffsetAngle:](self, "_updateSelectionViewsWithSelectionOffsetAngle:", v12);
}

- (void)preloadEffectChangeAnimation
{
  id v2;

  -[CEKLightingControl _frameCache](self, "_frameCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preloadForegroundFrames");
  objc_msgSend(v2, "preloadBackgroundFrames");

}

- (void)setHighlighted:(BOOL)a3
{
  -[CEKLightingControl setHighlighted:animated:](self, "setHighlighted:animated:", a3, 0);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;

  if (self->_highlighted != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_highlighted = a3;
    -[CEKLightingControl _nameBadge](self, "_nameBadge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlighted:animated:", v5, v4);

    -[CEKLightingControl _updateSelectionOverlayColorAnimated:](self, "_updateSelectionOverlayColorAnimated:", v4);
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CEKLightingControl;
  -[CEKLightingControl tintColorDidChange](&v3, sel_tintColorDidChange);
  -[CEKLightingControl _updateSelectionOverlayColorAnimated:](self, "_updateSelectionOverlayColorAnimated:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CEKLightingControl;
  -[CEKLightingControl traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CEKLightingControl _updateSelectionOverlayColorAnimated:](self, "_updateSelectionOverlayColorAnimated:", 0);
}

- (void)_updateSelectionOverlayColorAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CEKLightingControl *v17;

  v3 = a3;
  -[CEKLightingControl tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _nameBadge](self, "_nameBadge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

  if (-[CEKLightingControl isHighlighted](self, "isHighlighted"))
    -[CEKLightingControl tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CEKLightingControl _selectionOverlay](self, "_selectionOverlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3)
  {
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__CEKLightingControl__updateSelectionOverlayColorAnimated___block_invoke;
    v14[3] = &unk_1E70A5300;
    v15 = v10;
    v16 = v9;
    v17 = self;
    objc_msgSend(v12, "animateWithDuration:animations:", v14, 0.25);

  }
  else
  {
    objc_msgSend(v10, "setContentsMultiplyColor:", v9);
    -[CEKLightingControl _collapsedControlSelectionOverlay](self, "_collapsedControlSelectionOverlay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentsMultiplyColor:", v9);

  }
}

void __59__CEKLightingControl__updateSelectionOverlayColorAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setContentsMultiplyColor:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_collapsedControlSelectionOverlay");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentsMultiplyColor:", v2);

}

- (void)_updateSelectionViewsWithSelectionOffsetAngle:(double)a3
{
  uint64_t v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;

  v5 = -[CEKLightingControl _selectionIndex](self, "_selectionIndex");
  v6 = -[CEKLightingControl _isOverDialedWithSelectionAngularOffset:selectionIndex:](self, "_isOverDialedWithSelectionAngularOffset:selectionIndex:", v5, a3);
  -[CEKLightingControl _angularSpacingForRadialLayout](self, "_angularSpacingForRadialLayout");
  v8 = -a3 / v7;
  if (fabs(v8) >= 0.5)
  {
    v9 = v8 + (double)(unint64_t)v5;
    v5 = (uint64_t)fmax(fmin((double)(-[CEKLightingControl _enabledItemCount](self, "_enabledItemCount") - 1), (double)(uint64_t)round(v9)), 0.0);
    v8 = v9 - (double)v5;
  }
  v10 = fmax(fmin(v8 * 0.15, 0.1889), -0.1889);
  if (v6)
    v8 = v10;
  v11 = (uint64_t)-round(v8 * 90.0);
  -[CEKLightingControl _frameCache](self, "_frameCache");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _effectTypes](self, "_effectTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v21, "foregroundFrameForAngle:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "backgroundFrameForAngle:lightingType:", v11, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15)
    v18 = v16 == 0;
  else
    v18 = 1;
  if (!v18)
  {
    -[CEKLightingControl _selectionOverlay](self, "_selectionOverlay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImage:", v15);

    -[CEKLightingControl _selectionUnderlay](self, "_selectionUnderlay");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v17);

    -[CEKLightingControl _updateSelectionOverlayColorAnimated:](self, "_updateSelectionOverlayColorAnimated:", 0);
  }

}

- (void)_updateImagesForCollapedControlViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[CEKLightingControl _collapsedControlItemView](self, "_collapsedControlItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CEKLightingControl _effectItemsForType](self, "_effectItemsForType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CEKLightingControl selectedLightingType](self, "selectedLightingType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[CEKLightingControl _frameCache](self, "_frameCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl _collapsedControlItemView](self, "_collapsedControlItemView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v7);

    objc_msgSend(v15, "displayShadowImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl _collapsedControlShadowView](self, "_collapsedControlShadowView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v9);

    objc_msgSend(v6, "foregroundFrameForAngle:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl _collapsedControlSelectionOverlay](self, "_collapsedControlSelectionOverlay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v11);

    objc_msgSend(v6, "backgroundFrameForAngle:lightingType:", 0, -[CEKLightingControl selectedLightingType](self, "selectedLightingType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl _collapsedControlSelectionUnderlay](self, "_collapsedControlSelectionUnderlay");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);

  }
}

- (void)_settleSelectionViewsFromSelectionOffsetAngle:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  objc_initWeak(&location, self);
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  LODWORD(v7) = 0;
  LODWORD(v8) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _animationGenerator](self, "_animationGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__CEKLightingControl__settleSelectionViewsFromSelectionOffsetAngle___block_invoke;
  v12[3] = &unk_1E70A5720;
  objc_copyWeak(v14, &location);
  v14[1] = *(id *)&a3;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "startAnimationForIdentifier:duration:updateHandler:completionHandler:", CFSTR("cubeSettling"), v12, 0, 0.25);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __68__CEKLightingControl__settleSelectionViewsFromSelectionOffsetAngle___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleSettlingSelectionViewsFromOffset:withProgress:timingCurve:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), a2);

}

- (void)_handleSettlingSelectionViewsFromOffset:(double)a3 withProgress:(double)a4 timingCurve:(id)a5
{
  double v5;
  float v7;

  v5 = a3;
  *(float *)&a3 = a4;
  objc_msgSend(a5, "_solveForInput:", a3);
  -[CEKLightingControl _updateSelectionViewsWithSelectionOffsetAngle:](self, "_updateSelectionViewsWithSelectionOffsetAngle:", (1.0 - v7) * v5);
}

- (void)setCollapsedItemFading:(id)a3
{
  -[CEKLightingControl setCollapsedItemFading:animated:](self, "setCollapsedItemFading:animated:", a3.var0, a3.var1, 0);
}

- (void)setCollapsedItemFading:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  v4 = a4;
  if (a3.var0 != self->_collapsedItemFading.leftRate || a3.var1 != self->_collapsedItemFading.rightRate)
  {
    v5 = MEMORY[0x1E0C809B0];
    self->_collapsedItemFading = ($C9D92E28556B0069BD874CE32F50D5A6)a3;
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __54__CEKLightingControl_setCollapsedItemFading_animated___block_invoke;
    aBlock[3] = &unk_1E70A4B18;
    aBlock[4] = self;
    v6 = _Block_copy(aBlock);
    v7 = v6;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.25);
    else
      (*((void (**)(void *))v6 + 2))(v6);

  }
}

uint64_t __54__CEKLightingControl_setCollapsedItemFading_animated___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_selectionAngularOffset");
  return objc_msgSend(v1, "_updateItemViewsWithSelectionOffsetAngle:");
}

- (void)_updateItemViewsWithSelectionOffsetAngle:(double)a3
{
  CEKLightingControl *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  double v13;
  int v14;
  double v15;
  double v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  CEKLightingControl *v28;
  uint64_t v29;
  uint64_t v30;
  CEKLightingControl *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  int64_t v60;
  int v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;

  v4 = self;
  v60 = -[CEKLightingControl selectedLightingType](self, "selectedLightingType");
  -[CEKLightingControl _effectItemsForType](v4, "_effectItemsForType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _itemViewsForType](v4, "_itemViewsForType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _itemShadowViewsForType](v4, "_itemShadowViewsForType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _itemOutlineViewsForType](v4, "_itemOutlineViewsForType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingControl _effectTypes](v4, "_effectTypes");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CEKLightingControl isExpanded](v4, "isExpanded");
  v10 = -[CEKLightingControl collapsedControlLocation](v4, "collapsedControlLocation");
  v11 = 1.0;
  v12 = v10 - 1;
  v59 = v9;
  if (v9)
    v13 = 0.0;
  else
    v13 = 1.0;
  if (!v10)
    v11 = 0.0;
  if (v12 >= 2)
    v13 = v11;
  v54 = v13;
  v14 = v12 < 2 && !v9;
  v61 = v14;
  -[CEKLightingControl _angularSpacingForRadialLayout](v4, "_angularSpacingForRadialLayout");
  v16 = v15;
  v17 = -[CEKLightingControl _itemCount](v4, "_itemCount");
  if (-[CEKLightingControl _itemCount](v4, "_itemCount"))
  {
    v18 = 0;
    v19 = v16 * (double)(unint64_t)(v17 - 1);
    v55 = fabs(a3);
    v57 = v6;
    v58 = v7;
    v56 = v8;
    do
    {
      objc_msgSend(v62, "objectAtIndexedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v20);
      v64 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v20);
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v65, "lightingType");
      -[CEKLightingControl _offsetAngleForItemAtIndex:withSelectionOffset:](v4, "_offsetAngleForItemAtIndex:withSelectionOffset:", v18, a3);
      v24 = 1.0;
      v25 = fmin(fabs(v23) / v19, 1.0);
      v26 = (v25 * (v25 * v25) + v25 * v25 * -4.0 + v25 * 5.0) * 0.5 * -0.3 + 1.0;
      memset(&v69.c, 0, 32);
      if (!v59)
        v26 = v26 * 0.75;
      *(_OWORD *)&v69.a = 0uLL;
      CGAffineTransformMakeScale(&v69, v26, v26);
      if (!v59)
      {
        v27 = -[CEKLightingControl collapsedItemFading](v4, "collapsedItemFading");
        v28 = v4;
        v30 = v29;
        v31 = v28;
        v32 = -[CEKLightingControl _selectionIndex](v28, "_selectionIndex");
        v33 = v18 - v32;
        if ((uint64_t)(v18 - v32) >= 0)
          v34 = v30;
        else
          v34 = v27;
        if (v34 == 2)
        {
          if (v33 < 0)
            v33 = v32 - v18;
          v37 = 1.0 - (double)v33;
        }
        else
        {
          if (v34 != 1)
          {
            v4 = v31;
            v8 = v56;
            v6 = v57;
            v36 = v63;
            v35 = (void *)v64;
            if (!v34)
              v24 = v25 * -0.7 + 1.0;
            goto LABEL_31;
          }
          if (v33 < 0)
            v33 = v32 - v18;
          v37 = (double)v33 * -0.375 + 1.0;
        }
        v24 = fmax(v37, 0.0);
        v4 = v31;
        v8 = v56;
        v6 = v57;
      }
      v36 = v63;
      v35 = (void *)v64;
LABEL_31:
      v38 = 0.0;
      v39 = v24;
      if (v22 == v60 && v36 | v21)
      {
        -[CEKLightingControl _angularSpacingForRadialLayout](v4, "_angularSpacingForRadialLayout");
        v39 = v24 * (1.0 - (v40 * 0.5 - v55) / (v40 * 0.5 - v40 * 0.5 * 0.5));
        v38 = 1.0 - v39;
      }
      v41 = -[CEKLightingControl _isLightingTypeEnabled:](v4, "_isLightingTypeEnabled:", v22);
      if (v41)
        v42 = v24;
      else
        v42 = 0.0;
      if (v41)
        v43 = v39;
      else
        v43 = 0.0;
      if (v41)
        v44 = v38;
      else
        v44 = 0.0;
      if (v61)
      {
        v42 = 0.0;
        v45 = 0.0;
      }
      else
      {
        v45 = v43;
      }
      if (v61)
        v46 = 0.0;
      else
        v46 = v44;
      objc_msgSend(v35, "setAlpha:", v42, v43, v44);
      objc_msgSend((id)v36, "setAlpha:", v46);
      objc_msgSend((id)v21, "setAlpha:", v45);
      v68 = v69;
      objc_msgSend(v35, "setTransform:", &v68);
      v67 = v69;
      objc_msgSend((id)v36, "setTransform:", &v67);
      v66 = v69;
      objc_msgSend((id)v21, "setTransform:", &v66);

      ++v18;
      v7 = v58;
    }
    while (v18 < -[CEKLightingControl _itemCount](v4, "_itemCount"));
  }
  if (v61)
    v47 = 0.0;
  else
    v47 = 1.0;
  -[CEKLightingControl _selectionUnderlay](v4, "_selectionUnderlay");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setAlpha:", v47);

  -[CEKLightingControl _selectionOverlay](v4, "_selectionOverlay");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAlpha:", v47);

  -[CEKLightingControl _collapsedControlItemView](v4, "_collapsedControlItemView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setAlpha:", v54);

  -[CEKLightingControl _collapsedControlShadowView](v4, "_collapsedControlShadowView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAlpha:", v54);

  -[CEKLightingControl _collapsedControlSelectionUnderlay](v4, "_collapsedControlSelectionUnderlay");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setAlpha:", v54);

  -[CEKLightingControl _collapsedControlSelectionOverlay](v4, "_collapsedControlSelectionOverlay");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setAlpha:", v54);

}

- (void)setNameBadgeHidden:(BOOL)a3
{
  -[CEKLightingControl setNameBadgeHidden:animated:](self, "setNameBadgeHidden:animated:", a3, 0);
}

- (void)setNameBadgeHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_nameBadgeHidden != a3)
  {
    self->_nameBadgeHidden = a3;
    -[CEKLightingControl _updateNameBadgeAnimated:](self, "_updateNameBadgeAnimated:", a4);
  }
}

- (void)_updateNameBadgeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  double v14;

  v3 = a3;
  v5 = (double)(-[CEKLightingControl isNameBadgeHidden](self, "isNameBadgeHidden") ^ 1);
  -[CEKLightingControl _nameBadge](self, "_nameBadge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __47__CEKLightingControl__updateNameBadgeAnimated___block_invoke;
    v12 = &unk_1E70A4E38;
    v13 = v6;
    v14 = v5;
    objc_msgSend(v8, "animateWithDuration:animations:", &v9, 0.25);

  }
  else
  {
    objc_msgSend(v6, "setAlpha:", v5);
  }
  objc_msgSend(v7, "setLightingType:", -[CEKLightingControl selectedLightingType](self, "selectedLightingType", v9, v10, v11, v12));

}

uint64_t __47__CEKLightingControl__updateNameBadgeAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)setOrientation:(int64_t)a3
{
  int64_t orientation;

  orientation = self->_orientation;
  if (orientation != a3)
  {
    self->_orientation = a3;
    if (a3 == 2 || orientation == 2)
      -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNameBadgeFontStyle:(unint64_t)a3
{
  id v4;

  -[CEKLightingControl _nameBadge](self, "_nameBadge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFontStyle:", a3);

}

- (unint64_t)nameBadgeFontStyle
{
  void *v2;
  unint64_t v3;

  -[CEKLightingControl _nameBadge](self, "_nameBadge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fontStyle");

  return v3;
}

- (void)_loadItemsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CEKLightingControlItem *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CEKLightingControl _effectItemsForType](self, "_effectItemsForType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CEKLightingControl _effectTypes](self, "_effectTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v12 = -[CEKLightingControlItem initWithType:]([CEKLightingControlItem alloc], "initWithType:", objc_msgSend(v11, "integerValue", (_QWORD)v13));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[CEKLightingControl _setEffectItemsForType:](self, "_setEffectItemsForType:", v5);
  }
}

- (unint64_t)_itemCount
{
  void *v2;
  unint64_t v3;

  -[CEKLightingControl _effectTypes](self, "_effectTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)_enabledItemCount
{
  void *v2;
  unint64_t v3;

  -[CEKLightingControl _enabledEffectTypes](self, "_enabledEffectTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)_createItemViewsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[CEKLightingControl _itemViewsForType](self, "_itemViewsForType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CEKLightingControl _loadItemsIfNeeded](self, "_loadItemsIfNeeded");
    -[CEKLightingControl _effectItemsForType](self, "_effectItemsForType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v6)
    {
      v7 = v6;
      v28 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v28)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "lightingType");
          objc_msgSend(v9, "displayImage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "displayShadowImage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "displayOutlineImage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v14, v15);

            -[CEKLightingControl _itemContainer](self, "_itemContainer");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addSubview:", v14);

          }
          if (v13)
          {
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v13);
            objc_msgSend(v17, "setTintColor:", v25);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, v18);

            -[CEKLightingControl _itemContainer](self, "_itemContainer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addSubview:", v17);

          }
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v20, v21);

          -[CEKLightingControl _itemContainer](self, "_itemContainer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addSubview:", v20);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v7);
    }

    -[CEKLightingControl _selectionOverlay](self, "_selectionOverlay");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl bringSubviewToFront:](self, "bringSubviewToFront:", v23);

    -[CEKLightingControl _setItemViewsForType:](self, "_setItemViewsForType:", v29);
    -[CEKLightingControl _setItemShadowViewsForType:](self, "_setItemShadowViewsForType:", v27);
    -[CEKLightingControl _setItemOutlineViewsForType:](self, "_setItemOutlineViewsForType:", v26);

  }
}

id __46__CEKLightingControl__createItemViewsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_createCollapsedControlViewsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CEKMultiplyImageView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (-[CEKLightingControl collapsedControlLocation](self, "collapsedControlLocation"))
  {
    -[CEKLightingControl _collapsedControlItemView](self, "_collapsedControlItemView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
      -[CEKLightingControl set_collapsedControlItemView:](self, "set_collapsedControlItemView:", v4);

      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
      -[CEKLightingControl set_collapsedControlShadowView:](self, "set_collapsedControlShadowView:", v5);

      v6 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      -[CEKLightingControl set_collapsedControlSelectionUnderlay:](self, "set_collapsedControlSelectionUnderlay:", v6);

      v7 = objc_alloc_init(CEKMultiplyImageView);
      -[CEKLightingControl set_collapsedControlSelectionOverlay:](self, "set_collapsedControlSelectionOverlay:", v7);

      -[CEKLightingControl _itemContainer](self, "_itemContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKLightingControl _collapsedControlSelectionUnderlay](self, "_collapsedControlSelectionUnderlay");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      -[CEKLightingControl _itemContainer](self, "_itemContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKLightingControl _collapsedControlShadowView](self, "_collapsedControlShadowView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v11);

      -[CEKLightingControl _itemContainer](self, "_itemContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKLightingControl _collapsedControlItemView](self, "_collapsedControlItemView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v13);

      -[CEKLightingControl _itemContainer](self, "_itemContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKLightingControl _collapsedControlSelectionOverlay](self, "_collapsedControlSelectionOverlay");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v15);

      -[CEKLightingControl _updateImagesForCollapedControlViews](self, "_updateImagesForCollapedControlViews");
    }
  }
}

- (void)_createBackgroundViewIfNeeded
{
  void *v3;
  CEKLightingDialBackground *v4;

  -[CEKLightingControl _backgroundView](self, "_backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(CEKLightingDialBackground);
    -[CEKLightingDialBackground setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[CEKLightingControl _dialRadius](self, "_dialRadius");
    -[CEKLightingDialBackground setRadius:](v4, "setRadius:");
    -[CEKLightingControl insertSubview:atIndex:](self, "insertSubview:atIndex:", v4, 0);
    -[CEKLightingControl _setBackgroundView:](self, "_setBackgroundView:", v4);

  }
}

- (void)_createSelectionViewsIfNeeded
{
  void *v3;
  CEKMultiplyImageView *v4;
  void *v5;
  void *v6;
  id v7;

  -[CEKLightingControl _selectionOverlay](self, "_selectionOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(CEKMultiplyImageView);
    -[CEKLightingControl addSubview:](self, "addSubview:", v4);
    -[CEKLightingControl setNeedsLayout](self, "setNeedsLayout");
    -[CEKLightingControl _setSelectionOverlay:](self, "_setSelectionOverlay:", v4);
    -[CEKLightingControl _updateSelectionOverlayColorAnimated:](self, "_updateSelectionOverlayColorAnimated:", 0);

  }
  -[CEKLightingControl _selectionUnderlay](self, "_selectionUnderlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[CEKLightingControl insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);
    -[CEKLightingControl _backgroundView](self, "_backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingControl sendSubviewToBack:](self, "sendSubviewToBack:", v6);

    -[CEKLightingControl _setSelectionUnderlay:](self, "_setSelectionUnderlay:", v7);
  }
}

- (void)_createNameBadgeIfNeeded
{
  void *v3;
  CEKLightingNameBadge *v4;

  -[CEKLightingControl _nameBadge](self, "_nameBadge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(CEKLightingNameBadge);
    -[CEKBadgeView setDelegate:](v4, "setDelegate:", self);
    -[CEKLightingControl addSubview:](self, "addSubview:", v4);
    -[CEKLightingControl _setNameBadge:](self, "_setNameBadge:", v4);
    -[CEKLightingControl _updateNameBadgeAnimated:](self, "_updateNameBadgeAnimated:", 0);

  }
}

- (void)_createItemContainerIfNeeded
{
  void *v3;
  id v4;

  -[CEKLightingControl _itemContainer](self, "_itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[CEKLightingControl addSubview:](self, "addSubview:", v4);
    objc_msgSend(v4, "setClipsToBounds:", 1);
    objc_msgSend(v4, "setUserInteractionEnabled:", 0);
    -[CEKLightingControl _setItemContainer:](self, "_setItemContainer:", v4);

  }
}

- (void)_prepareFeedback
{
  id v2;

  -[CEKLightingControl _selectionFeedbackGenerator](self, "_selectionFeedbackGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareFeedback");

}

- (void)_performFeedback
{
  id v2;

  -[CEKLightingControl _selectionFeedbackGenerator](self, "_selectionFeedbackGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performFeedback");

}

- (CEKLightingControlDelegate)delegate
{
  return (CEKLightingControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)lightingEffectSet
{
  return self->_lightingEffectSet;
}

- (int64_t)selectedLightingType
{
  return self->_selectedLightingType;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)collapsedItemFading
{
  $C9D92E28556B0069BD874CE32F50D5A6 *p_collapsedItemFading;
  unint64_t leftRate;
  unint64_t rightRate;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  p_collapsedItemFading = &self->_collapsedItemFading;
  leftRate = self->_collapsedItemFading.leftRate;
  rightRate = p_collapsedItemFading->rightRate;
  result.var1 = rightRate;
  result.var0 = leftRate;
  return result;
}

- (BOOL)isNameBadgeHidden
{
  return self->_nameBadgeHidden;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)additionalBottomPadding
{
  return self->_additionalBottomPadding;
}

- (double)maxContentWidth
{
  return self->_maxContentWidth;
}

- (unint64_t)collapsedControlLocation
{
  return self->_collapsedControlLocation;
}

- (double)collapsedSelectionCenterPointEdgeInset
{
  return self->_collapsedSelectionCenterPointEdgeInset;
}

- (NSArray)_effectTypes
{
  return self->__effectTypes;
}

- (NSSet)_enabledEffectTypes
{
  return self->__enabledEffectTypes;
}

- (void)set_enabledEffectTypes:(id)a3
{
  objc_storeStrong((id *)&self->__enabledEffectTypes, a3);
}

- (NSDictionary)_effectItemsForType
{
  return self->__effectItemsForType;
}

- (void)_setEffectItemsForType:(id)a3
{
  objc_storeStrong((id *)&self->__effectItemsForType, a3);
}

- (double)_selectionAngularOffset
{
  return self->__selectionAngularOffset;
}

- (void)_setSelectionAngularOffset:(double)a3
{
  self->__selectionAngularOffset = a3;
}

- (unint64_t)_selectionIndex
{
  return self->__selectionIndex;
}

- (CEKLightingFrameCache)_frameCache
{
  return self->__frameCache;
}

- (NSDictionary)_itemViewsForType
{
  return self->__itemViewsForType;
}

- (void)_setItemViewsForType:(id)a3
{
  objc_storeStrong((id *)&self->__itemViewsForType, a3);
}

- (NSDictionary)_itemShadowViewsForType
{
  return self->__itemShadowViewsForType;
}

- (void)_setItemShadowViewsForType:(id)a3
{
  objc_storeStrong((id *)&self->__itemShadowViewsForType, a3);
}

- (NSDictionary)_itemOutlineViewsForType
{
  return self->__itemOutlineViewsForType;
}

- (void)_setItemOutlineViewsForType:(id)a3
{
  objc_storeStrong((id *)&self->__itemOutlineViewsForType, a3);
}

- (UIImageView)_collapsedControlItemView
{
  return self->__collapsedControlItemView;
}

- (void)set_collapsedControlItemView:(id)a3
{
  objc_storeStrong((id *)&self->__collapsedControlItemView, a3);
}

- (UIImageView)_collapsedControlShadowView
{
  return self->__collapsedControlShadowView;
}

- (void)set_collapsedControlShadowView:(id)a3
{
  objc_storeStrong((id *)&self->__collapsedControlShadowView, a3);
}

- (UIImageView)_collapsedControlSelectionUnderlay
{
  return self->__collapsedControlSelectionUnderlay;
}

- (void)set_collapsedControlSelectionUnderlay:(id)a3
{
  objc_storeStrong((id *)&self->__collapsedControlSelectionUnderlay, a3);
}

- (CEKMultiplyImageView)_collapsedControlSelectionOverlay
{
  return self->__collapsedControlSelectionOverlay;
}

- (void)set_collapsedControlSelectionOverlay:(id)a3
{
  objc_storeStrong((id *)&self->__collapsedControlSelectionOverlay, a3);
}

- (CEKLightingDialBackground)_backgroundView
{
  return self->__backgroundView;
}

- (void)_setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundView, a3);
}

- (CEKMultiplyImageView)_selectionOverlay
{
  return self->__selectionOverlay;
}

- (void)_setSelectionOverlay:(id)a3
{
  objc_storeStrong((id *)&self->__selectionOverlay, a3);
}

- (UIImageView)_selectionUnderlay
{
  return self->__selectionUnderlay;
}

- (void)_setSelectionUnderlay:(id)a3
{
  objc_storeStrong((id *)&self->__selectionUnderlay, a3);
}

- (CEKLightingNameBadge)_nameBadge
{
  return self->__nameBadge;
}

- (void)_setNameBadge:(id)a3
{
  objc_storeStrong((id *)&self->__nameBadge, a3);
}

- (UIView)_itemContainer
{
  return self->__itemContainer;
}

- (void)_setItemContainer:(id)a3
{
  objc_storeStrong((id *)&self->__itemContainer, a3);
}

- (UIPanGestureRecognizer)_panGesture
{
  return self->__panGesture;
}

- (UILongPressGestureRecognizer)_pressGesture
{
  return self->__pressGesture;
}

- (UITapGestureRecognizer)_tapGesture
{
  return self->__tapGesture;
}

- (NSDate)_timeTrackingBegan
{
  return self->__timeTrackingBegan;
}

- (void)_setTimeTrackingBegan:(id)a3
{
  objc_storeStrong((id *)&self->__timeTrackingBegan, a3);
}

- (CEKAnimationGenerator)_animationGenerator
{
  return self->__animationGenerator;
}

- (NSTimer)_collapseTimer
{
  return self->__collapseTimer;
}

- (void)_setCollapseTimer:(id)a3
{
  objc_storeStrong((id *)&self->__collapseTimer, a3);
}

- (unint64_t)_expandedAnimationCounter
{
  return self->__expandedAnimationCounter;
}

- (void)_setExpandedAnimationCounter:(unint64_t)a3
{
  self->__expandedAnimationCounter = a3;
}

- (CEKSelectionFeedbackGenerator)_selectionFeedbackGenerator
{
  return self->__selectionFeedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__collapseTimer, 0);
  objc_storeStrong((id *)&self->__animationGenerator, 0);
  objc_storeStrong((id *)&self->__timeTrackingBegan, 0);
  objc_storeStrong((id *)&self->__tapGesture, 0);
  objc_storeStrong((id *)&self->__pressGesture, 0);
  objc_storeStrong((id *)&self->__panGesture, 0);
  objc_storeStrong((id *)&self->__itemContainer, 0);
  objc_storeStrong((id *)&self->__nameBadge, 0);
  objc_storeStrong((id *)&self->__selectionUnderlay, 0);
  objc_storeStrong((id *)&self->__selectionOverlay, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__collapsedControlSelectionOverlay, 0);
  objc_storeStrong((id *)&self->__collapsedControlSelectionUnderlay, 0);
  objc_storeStrong((id *)&self->__collapsedControlShadowView, 0);
  objc_storeStrong((id *)&self->__collapsedControlItemView, 0);
  objc_storeStrong((id *)&self->__itemOutlineViewsForType, 0);
  objc_storeStrong((id *)&self->__itemShadowViewsForType, 0);
  objc_storeStrong((id *)&self->__itemViewsForType, 0);
  objc_storeStrong((id *)&self->__frameCache, 0);
  objc_storeStrong((id *)&self->__effectItemsForType, 0);
  objc_storeStrong((id *)&self->__enabledEffectTypes, 0);
  objc_storeStrong((id *)&self->__effectTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
