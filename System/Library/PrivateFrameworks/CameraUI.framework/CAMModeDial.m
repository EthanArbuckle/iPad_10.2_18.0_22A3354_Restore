@implementation CAMModeDial

- (CAMModeDial)initWithLayoutStyle:(int64_t)a3
{
  CAMModeDial *v4;
  CAMModeDial *v5;
  CAMModeDial *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMModeDial;
  v4 = -[CAMModeDial initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[CAMModeDial _commonCAMModeDialInitializationWithLayoutStyle:](v4, "_commonCAMModeDialInitializationWithLayoutStyle:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMModeDialInitializationWithLayoutStyle:(int64_t)a3
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *meshTransformView;
  UIView *v13;
  UIView *itemsContainerView;
  CAGradientLayer *v15;
  CAGradientLayer *gradientLayer;
  id v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial setTintColor:](self, "setTintColor:", v5);

  -[CAMModeDial setClipsToBounds:](self, "setClipsToBounds:", 1);
  self->_layoutStyle = a3;
  v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
  meshTransformView = self->__meshTransformView;
  self->__meshTransformView = v11;

  -[UIView setUserInteractionEnabled:](self->__meshTransformView, "setUserInteractionEnabled:", 0);
  -[CAMModeDial addSubview:](self, "addSubview:", self->__meshTransformView);
  -[CAMModeDial _configureMeshTransformForLayoutStyle:](self, "_configureMeshTransformForLayoutStyle:", a3);
  v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
  itemsContainerView = self->__itemsContainerView;
  self->__itemsContainerView = v13;

  -[UIView setUserInteractionEnabled:](self->__itemsContainerView, "setUserInteractionEnabled:", 0);
  -[UIView addSubview:](self->__meshTransformView, "addSubview:", self->__itemsContainerView);
  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v15 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  gradientLayer = self->__gradientLayer;
  self->__gradientLayer = v15;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAGradientLayer setBackgroundColor:](self->__gradientLayer, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setCompositingFilter:](self->__gradientLayer, "setCompositingFilter:", v18);

  -[UIView layer](self->__meshTransformView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSublayer:", self->__gradientLayer);

  -[CAMModeDial _configureGradientForLayoutStyle:](self, "_configureGradientForLayoutStyle:", a3);
  -[CAMModeDial _updateForLayoutStyle](self, "_updateForLayoutStyle");
}

- (void)_configureMeshTransformForLayoutStyle:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v5 = objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", a3);
  -[UIView layer](self->__meshTransformView, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial _meshTransformForLayoutStyle:](self, "_meshTransformForLayoutStyle:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMeshTransform:", v6);
  -[CAMModeDial traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  objc_msgSend(v8, "setRasterizationScale:");

  objc_msgSend(v8, "setAllowsGroupBlending:", v5);
}

+ (BOOL)wantsVerticalModeDialForLayoutStyle:(int64_t)a3
{
  return a3 == 1;
}

- (id)_meshTransformForLayoutStyle:(int64_t)a3
{
  void *v4;

  if ((objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", a3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[CAMModeDial _horizontalMeshTransform](self, "_horizontalMeshTransform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_horizontalMeshTransform
{
  void *v2;
  void *v3;
  void *v4;
  _BYTE v6[1152];
  _BYTE __dst[2960];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memcpy(__dst, &unk_1DB9A5A68, sizeof(__dst));
  memcpy(v6, &unk_1DB9A65F8, sizeof(v6));
  objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 74, __dst, 36, v6, *MEMORY[0x1E0CD2A90]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "setSubdivisionSteps:", 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)_configureGradientForLayoutStyle:(int64_t)a3
{
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  -[CAMModeDial _gradientLayer](self, "_gradientLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", a3);
  objc_msgSend(v4, "setType:", *MEMORY[0x1E0CD2F48]);
  if (v5)
    v6 = 0.5;
  else
    v6 = 0.0;
  if (v5)
    v7 = 1.0;
  else
    v7 = 0.5;
  if (v5)
    v8 = 0.5;
  else
    v8 = 1.0;
  if (v5)
    v9 = &unk_1EA3B3440;
  else
    v9 = &unk_1EA3B3458;
  objc_msgSend(v4, "setStartPoint:", v6);
  objc_msgSend(v4, "setEndPoint:", v8, v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17[0] = objc_msgSend(v10, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17[1] = objc_msgSend(v11, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17[2] = objc_msgSend(v12, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17[3] = objc_msgSend(v13, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17[4] = objc_msgSend(v14, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17[5] = objc_msgSend(v15, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColors:", v16);

  objc_msgSend(v4, "setLocations:", v9);
}

- (CAGradientLayer)_gradientLayer
{
  return self->__gradientLayer;
}

- (void)_updateForLayoutStyle
{
  int64_t v3;

  v3 = -[CAMModeDial layoutStyle](self, "layoutStyle");
  -[CAMModeDial _configureGradientForLayoutStyle:](self, "_configureGradientForLayoutStyle:", v3);
  -[CAMModeDial _configureMeshTransformForLayoutStyle:](self, "_configureMeshTransformForLayoutStyle:", v3);
  -[CAMModeDial _updateItemsForLayoutStyle:](self, "_updateItemsForLayoutStyle:", v3);
  -[CAMModeDial _updateSelectedItemBackgroundForLayoutStyle:](self, "_updateSelectedItemBackgroundForLayoutStyle:", v3);
  -[CAMModeDial _updateContainerCenterFromSelectedModeAnimated:](self, "_updateContainerCenterFromSelectedModeAnimated:", 0);
  -[CAMModeDial reloadData](self, "reloadData");
  -[CAMModeDial setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)_updateItemsForLayoutStyle:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CAMModeDial _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "integerValue");
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "cam_localizedTitleForMode:wantsCompactTitle:", v11, objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", a3));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTitle:", v13);

        -[CAMModeDial _fontForLayoutStyle:selected:](self, "_fontForLayoutStyle:selected:", a3, v11 == -[CAMModeDial selectedMode](self, "selectedMode"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFont:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  -[CAMModeDial setNeedsLayout](self, "setNeedsLayout");

}

- (NSDictionary)_items
{
  return self->__items;
}

- (void)_updateSelectedItemBackgroundForLayoutStyle:(int64_t)a3
{
  UIView *selectedItemBackgroundView;
  id v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  void *v9;

  switch(a3)
  {
    case 0:
    case 2:
    case 4:
      -[UIView removeFromSuperview](self->__selectedItemBackgroundView, "removeFromSuperview");
      selectedItemBackgroundView = self->__selectedItemBackgroundView;
      self->__selectedItemBackgroundView = 0;

      break;
    case 1:
      v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v7 = self->__selectedItemBackgroundView;
      self->__selectedItemBackgroundView = v6;

      v8 = self->__selectedItemBackgroundView;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[CAMModeDial insertSubview:atIndex:](self, "insertSubview:atIndex:", self->__selectedItemBackgroundView, 0);
      break;
    default:
      break;
  }
  -[CAMModeDial setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateContainerCenterFromSelectedModeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  CGRect v38;

  v3 = a3;
  v5 = -[CAMModeDial selectedMode](self, "selectedMode");
  v6 = objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", -[CAMModeDial layoutStyle](self, "layoutStyle"));
  if (v6)
    -[CAMModeDial _verticalContainerCenterForMode:](self, "_verticalContainerCenterForMode:", v5);
  else
    -[CAMModeDial _horizontalContainerCenterForMode:](self, "_horizontalContainerCenterForMode:", v5);
  v9 = v7;
  v10 = v8;
  -[CAMModeDial _itemsContainerView](self, "_itemsContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3)
  {
    objc_msgSend(v11, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentationLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "position");
    v16 = v15;
    v18 = v17;

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v16, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFromValue:", v20);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v9, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setToValue:", v21);

    UIAnimationDragCoefficient();
    objc_msgSend(v19, "setDuration:", v22 * 0.3);
    LODWORD(v23) = 1042536202;
    LODWORD(v24) = 1045220557;
    LODWORD(v25) = 0.25;
    LODWORD(v26) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v25, v23, v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimingFunction:", v27);

    objc_msgSend(v13, "addAnimation:forKey:", v19, CFSTR("centerTranslation"));
    objc_msgSend(v13, "setPosition:", v9, v10);

    if (!v6)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(v11, "setCenter:", v9, v10);
    if (!v6)
      goto LABEL_11;
  }
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  -[CAMModeDial _items](self, "_items");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __62__CAMModeDial__updateContainerCenterFromSelectedModeAnimated___block_invoke;
  v33[3] = &unk_1EA32BFB8;
  v33[4] = &v34;
  objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v33);
  UICeilToViewScale();
  v30 = v29;
  -[CAMModeDial _selectedItem](self, "_selectedItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  if (CGRectGetHeight(v38) > v35[3] * 1.8)
    UICeilToViewScale();
  -[CAMModeDial bounds](self, "bounds");
  UIRectCenteredIntegralRectScale();
  -[UIView setFrame:](self->__selectedItemBackgroundView, "setFrame:", 0);
  -[UIView layer](self->__selectedItemBackgroundView, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCornerRadius:", v30 * 0.5);

  _Block_object_dispose(&v34, 8);
LABEL_11:

}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (CGPoint)_horizontalContainerCenterForMode:(int64_t)a3
{
  void *v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGRect v22;
  CGRect v23;

  -[CAMModeDial _itemsContainerView](self, "_itemsContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial bounds](self, "bounds");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  MidX = CGRectGetMidX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  objc_msgSend(v6, "convertPoint:fromView:", self, MidX, CGRectGetMidY(v23));
  -[CAMModeDial _selectedItem](self, "_selectedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial _centeringNudgeForMode:](self, "_centeringNudgeForMode:", a3);
  objc_msgSend(v12, "center");
  objc_msgSend(v6, "convertPoint:fromView:", v5);
  UIRoundToViewScale();
  v14 = v13;
  objc_msgSend(v5, "center");
  v16 = v15;
  v18 = v14 + v17;

  v19 = v18;
  v20 = v16;
  result.y = v20;
  result.x = v19;
  return result;
}

- (UIView)_itemsContainerView
{
  return self->__itemsContainerView;
}

- (id)_selectedItem
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[CAMModeDial selectedMode](self, "selectedMode");
  -[CAMModeDial _items](self, "_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_centeringNudgeForMode:(int64_t)a3
{
  double result;

  switch(a3)
  {
    case 1:
      result = 1.0 - CAMPixelWidthForView(self);
      break;
    case 2:
    case 4:
    case 5:
      result = CAMPixelWidthForView(self);
      break;
    case 3:
      result = -CAMPixelWidthForView(self);
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  CAMModeDialItem *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  int64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[CAMModeDial dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAMModeDial _items](self, "_items");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    v30 = v3;
    objc_msgSend(v3, "modesForModeDial:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMModeDial _setModes:](self, "_setModes:", v4);
    v5 = -[CAMModeDial selectedMode](self, "selectedMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "containsObject:", v8);

      v10 = 0;
      if ((v9 & 1) == 0)
      {
        if (objc_msgSend(v4, "count"))
        {
          objc_msgSend(v4, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v11, "integerValue");

        }
        else
        {
          v10 = 0;
        }
      }
      -[CAMModeDial setSelectedMode:](self, "setSelectedMode:", v10);
    }
    v33 = -[CAMModeDial selectedMode](self, "selectedMode");
    v12 = -[CAMModeDial layoutStyle](self, "layoutStyle");
    v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v4;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v13)
    {
      v14 = v13;
      v32 = *(_QWORD *)v36;
      v15 = *MEMORY[0x1E0C9D648];
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v36 != v32)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v19);
          v21 = objc_msgSend(v20, "integerValue");
          v22 = -[CAMModeDialItem initWithFrame:]([CAMModeDialItem alloc], "initWithFrame:", v15, v16, v17, v18);
          -[CAMModeDialItem setSelected:](v22, "setSelected:", v21 == v33);
          objc_msgSend(MEMORY[0x1E0CB3940], "cam_localizedTitleForMode:wantsCompactTitle:", v21, objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", v12));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMModeDialItem setTitle:](v22, "setTitle:", v23);
          -[CAMModeDial _fontForLayoutStyle:selected:](self, "_fontForLayoutStyle:selected:", v12, v21 == v33);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMModeDialItem setFont:](v22, "setFont:", v24);

          if ((unint64_t)(v12 - 2) < 3)
          {
LABEL_16:
            +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isCTMSupported");

            goto LABEL_17;
          }
          if (v12 == 1)
          {
            v26 = 1;
          }
          else
          {
            if (!v12)
              goto LABEL_16;
            v26 = 0;
          }
LABEL_17:
          -[CAMModeDialItem setShouldShadowTitleText:](v22, "setShouldShadowTitleText:", v26);
          -[UIView addSubview:](self->__itemsContainerView, "addSubview:", v22);
          objc_msgSend(v34, "setObject:forKey:", v22, v20);

          ++v19;
        }
        while (v14 != v19);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        v14 = v27;
      }
      while (v27);
    }

    -[CAMModeDial _setItems:](self, "_setItems:", v34);
    -[CAMModeDial setNeedsLayout](self, "setNeedsLayout");

    v3 = v30;
  }

}

- (CAMModeDialDataSource)dataSource
{
  return self->_dataSource;
}

- (void)_setModes:(id)a3
{
  objc_storeStrong((id *)&self->__modes, a3);
}

- (void)setSelectedMode:(int64_t)a3
{
  -[CAMModeDial setSelectedMode:animated:](self, "setSelectedMode:animated:", a3, 0);
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_selectedMode != a3)
  {
    v4 = a4;
    if (a4)
      -[CAMModeDial layoutIfNeeded](self, "layoutIfNeeded");
    -[CAMModeDial _items](self, "_items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_selectedMode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self->_selectedMode = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v9;
    objc_msgSend(v9, "setSelected:animated:", 0, v4);
    objc_msgSend(v11, "setSelected:animated:", 1, v4);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMModeDial _fontForLayoutStyle:selected:](self, "_fontForLayoutStyle:selected:", self->_layoutStyle, objc_msgSend(v17, "integerValue") == a3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setFont:", v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    -[CAMModeDial _updateContainerCenterFromSelectedModeAnimated:](self, "_updateContainerCenterFromSelectedModeAnimated:", v4);
  }
}

- (void)_setItems:(id)a3
{
  objc_storeStrong((id *)&self->__items, a3);
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (CAMModeDialDataSource *)a3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMModeDial;
  -[CAMModeDial layoutSubviews](&v3, sel_layoutSubviews);
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", -[CAMModeDial layoutStyle](self, "layoutStyle")))-[CAMModeDial _layoutVerticalModeDial](self, "_layoutVerticalModeDial");
  else
    -[CAMModeDial _layoutHorizontalModeDial](self, "_layoutHorizontalModeDial");
  -[CAMModeDial _updateContainerCenterFromSelectedModeAnimated:](self, "_updateContainerCenterFromSelectedModeAnimated:", 0);
}

- (void)_layoutHorizontalModeDial
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CGFloat Width;
  double Height;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  uint64_t i;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v49 = *MEMORY[0x1E0C80C00];
  -[CAMModeDial bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMModeDial _interpolatedHorizontalMeshTransformSize](self, "_interpolatedHorizontalMeshTransformSize");
  v12 = v11;
  v14 = v13;
  v50.origin.x = v4;
  v50.origin.y = v6;
  v50.size.width = v8;
  v50.size.height = v10;
  CGRectGetWidth(v50);
  UIRoundToViewScale();
  v16 = v15;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  v17 = v16 + CGRectGetMinX(v51);
  v52.origin.x = v4;
  v18 = v4;
  v52.origin.y = v6;
  v52.size.width = v8;
  v52.size.height = v10;
  v19 = CGRectGetMaxY(v52) - v14;
  -[CAMModeDial _meshTransformView](self, "_meshTransformView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v17, v19, v12, v14);
  v53.origin.x = v17;
  v53.origin.y = v19;
  v53.size.width = v12;
  v53.size.height = v14;
  v43 = -CGRectGetMinX(v53);
  v54.origin.x = v17;
  v54.origin.y = v19;
  v54.size.width = v12;
  v54.size.height = v14;
  v42 = -CGRectGetMinY(v54);
  -[CAMModeDial _gradientLayer](self, "_gradientLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v12, v14);
  -[CAMModeDial _modes](self, "_modes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial _items](self, "_items");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55.origin.x = v18;
  v55.origin.y = v6;
  v55.size.width = v8;
  v55.size.height = v10;
  Width = CGRectGetWidth(v55);
  v56.origin.x = v18;
  v56.origin.y = v6;
  v56.size.width = v8;
  v56.size.height = v10;
  Height = CGRectGetHeight(v56);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v26 = v22;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v45;
    v30 = *MEMORY[0x1E0C9D820];
    v31 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v32 = 0.0;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(v23, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "sizeThatFits:", v30, v31);
        v36 = v35;
        v38 = v37;
        v57.origin.y = v42;
        v57.origin.x = v43;
        v57.size.width = Width;
        v57.size.height = Height;
        CGRectGetHeight(v57);
        UIRoundToViewScale();
        v40 = v39;
        objc_msgSend(v34, "setFrame:", v32, v39, v36, v38);
        v58.origin.x = v32;
        v58.origin.y = v40;
        v58.size.width = v36;
        v58.size.height = v38;
        v32 = CGRectGetMaxX(v58) + 26.0;

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v28);
  }
  else
  {
    v32 = 0.0;
  }

  -[CAMModeDial _itemsContainerView](self, "_itemsContainerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrame:", v43, v42, v32, Height);

}

- (CGSize)_interpolatedHorizontalMeshTransformSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;
  CGRect v8;

  -[CAMModeDial bounds](self, "bounds");
  CGRectGetWidth(v8);
  UIRoundToViewScale();
  v3 = v2;
  UIRoundToViewScale();
  v5 = v4;
  v6 = v3;
  result.height = v5;
  result.width = v6;
  return result;
}

- (UIView)_meshTransformView
{
  return self->__meshTransformView;
}

- (NSArray)_modes
{
  return self->__modes;
}

- (CAMModeDial)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMModeDial initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CAMModeDial)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMModeDial initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    -[CAMModeDial reloadData](self, "reloadData");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", -[CAMModeDial layoutStyle](self, "layoutStyle")))
  {
    -[CAMModeDial _modes](self, "_modes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMModeDial _items](self, "_items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      v12 = *MEMORY[0x1E0C9D820];
      v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v14 = 0.0;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sizeThatFits:", v12, v13);
          if (v17 > v14)
            v14 = v17;

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    UIRoundToViewScale();
    width = v18;

  }
  v19 = width;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_layoutVerticalModeDial
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t i;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;

  v42 = *MEMORY[0x1E0C80C00];
  -[CAMModeDial bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMModeDial _meshTransformView](self, "_meshTransformView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v4;
  v36 = v6;
  objc_msgSend(v34, "setFrame:", v4, v6, v8, v10);
  -[CAMModeDial _gradientLayer](self, "_gradientLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(v11, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v8, v10);
  -[CAMModeDial _modes](self, "_modes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial _items](self, "_items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial _itemsContainerView](self, "_itemsContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v13;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    v20 = *MEMORY[0x1E0C9D820];
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sizeThatFits:", v20, v21);
        v43.origin.x = v35;
        v43.origin.y = v36;
        v43.size.width = v12;
        v43.size.height = v10;
        CGRectGetWidth(v43);
        -[CAMModeDial traitCollection](self, "traitCollection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "displayScale");
        UIRectIntegralWithScale();
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;

        objc_msgSend(v23, "setFrame:", v26, v28, v30, v32);
        v44.origin.x = v26;
        v44.origin.y = v28;
        v44.size.width = v30;
        v44.size.height = v32;
        v33 = CGRectGetMaxY(v44) + 30.0;

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v18);
  }
  else
  {
    v33 = 0.0;
  }

  objc_msgSend(v15, "setFrame:", v35, v36, v12, v33);
}

- (CGPoint)_verticalContainerCenterForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;
  CGRect v21;
  CGRect v22;

  -[CAMModeDial _itemsContainerView](self, "_itemsContainerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial bounds](self, "bounds");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  objc_msgSend(v5, "convertPoint:fromView:", self, MidX, CGRectGetMidY(v22));
  -[CAMModeDial _selectedItem](self, "_selectedItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "center");
  objc_msgSend(v5, "convertPoint:fromView:", v4);
  UIRoundToViewScale();
  v13 = v12;
  objc_msgSend(v4, "center");
  v15 = v14;
  v17 = v13 + v16;

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

void __62__CAMModeDial__updateContainerCenterFromSelectedModeAnimated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double Height;
  uint64_t v5;
  double v6;
  CGRect v8;

  objc_msgSend(a3, "frame");
  Height = CGRectGetHeight(v8);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(double *)(v5 + 24);
  if (v6 == 0.0 || v6 > Height)
    *(double *)(v5 + 24) = Height;
}

- (id)_fontForLayoutStyle:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v4 = a4;
  -[CAMModeDial traitCollection](self, "traitCollection", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CAMFont cameraModeDialFontForContentSize:](CAMFont, "cameraModeDialFontForContentSize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCTMSupported");

    if (v9)
    {
      +[CAMFont cameraModeDialFontForContentSize:weight:](CAMFont, "cameraModeDialFontForContentSize:weight:", v6, *MEMORY[0x1E0DC1448]);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
  }

  return v7;
}

- (int64_t)_nearestCaptureModeForLocation:(CGPoint)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CAMModeDial _modes](self, "_modes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    v9 = 1.79769313e308;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[CAMModeDial _items](self, "_items");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        UIDistanceBetweenPointAndRect();
        if (v14 < v9)
        {
          v15 = v14;
          v7 = objc_msgSend(v11, "integerValue");
          v9 = v15;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  int64_t v11;
  id v12;

  objc_msgSend(a3, "anyObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMModeDial _itemsContainerView](self, "_itemsContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "locationInView:", v5);
  v7 = v6;
  v9 = v8;
  v10 = -[CAMModeDial selectedMode](self, "selectedMode");
  v11 = -[CAMModeDial _nearestCaptureModeForLocation:](self, "_nearestCaptureModeForLocation:", v7, v9);
  if (v10 != v11)
  {
    -[CAMModeDial setSelectedMode:animated:](self, "setSelectedMode:animated:", v11, 1);
    -[CAMModeDial sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }

}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMModeDial _updateForLayoutStyle](self, "_updateForLayoutStyle");
  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  -[CAMModeDial _itemsContainerView](self, "_itemsContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfAccessibilityGestureInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = -[CAMModeDial _nearestCaptureModeForLocation:](self, "_nearestCaptureModeForLocation:", v7, v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->__items, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0DC3418]);
  v15 = (void *)objc_msgSend(v14, "initWithTitle:image:imageInsets:", v13, 0, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  return v15;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;

  v4 = a3;
  -[CAMModeDial _itemsContainerView](self, "_itemsContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfAccessibilityGestureInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = -[CAMModeDial _nearestCaptureModeForLocation:](self, "_nearestCaptureModeForLocation:", v7, v9);
  if (v10 != -[CAMModeDial selectedMode](self, "selectedMode"))
  {
    -[CAMModeDial setSelectedMode:animated:](self, "setSelectedMode:animated:", v10, 1);
    -[CAMModeDial sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (UIView)_selectedItemBackgroundView
{
  return self->__selectedItemBackgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__itemsContainerView, 0);
  objc_storeStrong((id *)&self->__gradientLayer, 0);
  objc_storeStrong((id *)&self->__meshTransformView, 0);
  objc_storeStrong((id *)&self->__items, 0);
  objc_storeStrong((id *)&self->__modes, 0);
  objc_storeStrong((id *)&self->__selectedItemBackgroundView, 0);
}

@end
