@implementation AXPIFingerContainerView

- (AXPIFingerContainerView)initWithFrame:(CGRect)a3
{
  AXPIFingerContainerView *v3;
  uint64_t v4;
  NSMutableArray *fingerViews;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXPIFingerContainerView;
  v3 = -[AXPIFingerContainerView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    fingerViews = v3->_fingerViews;
    v3->_fingerViews = (NSMutableArray *)v4;

    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BEBDE00];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__AXPIFingerContainerView_initWithFrame___block_invoke;
    v11[3] = &unk_24F478BD0;
    objc_copyWeak(&v12, &location);
    v9 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v8, 0, v7, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __41__AXPIFingerContainerView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFingerModelViews:startPointForAnimation:", 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

- (BOOL)isPinchChainVisible
{
  return self->_pinchChainView != 0;
}

- (void)_updateFingerModelViews:(BOOL)a3 startPointForAnimation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  AXPIFingerView *v22;
  void *v23;
  AXPIFingerView *v24;
  id obj;
  _BOOL4 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  y = a4.y;
  x = a4.x;
  v26 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_fingerViews, "enumerateObjectsUsingBlock:", &__block_literal_global_7);
  -[UIView subviews](self->_viewForAnimatingAlpha, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_179);

  -[NSMutableArray removeAllObjects](self->_fingerViews, "removeAllObjects");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[AXPIFingerContainerView fingerModels](self, "fingerModels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    v11 = !v26;
    if (x != *MEMORY[0x24BDBEFB0])
      v11 = 1;
    if (y == *(double *)(MEMORY[0x24BDBEFB0] + 8))
      v12 = v11;
    else
      v12 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[AXPIFingerContainerView appearanceDelegate](self, "appearanceDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fingerWidth");
        v17 = v16;

        objc_msgSend(v14, "location");
        if (v26)
        {
          v19 = y;
          v18 = x;
        }
        if ((v12 & 1) == 0)
          objc_msgSend(v14, "location", v18, v19);
        v20 = v18 - v17 * 0.5;
        v21 = v19 - v17 * 0.5;
        v22 = [AXPIFingerView alloc];
        -[AXPIFingerContainerView appearanceDelegate](self, "appearanceDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[AXPIFingerView initWithFrame:appearanceDelegate:](v22, "initWithFrame:appearanceDelegate:", v23, v20, v21, v17, v17);

        -[AXPIFingerView setPressed:animated:](v24, "setPressed:animated:", objc_msgSend(v14, "isPressed"), -[AXPIFingerContainerView shouldAnimatePress](self, "shouldAnimatePress"));
        -[AXPIFingerView setSelected:](v24, "setSelected:", objc_msgSend(v14, "isSelected"));
        objc_msgSend(v14, "force");
        -[AXPIFingerView setForce:](v24, "setForce:");
        -[UIView addSubview:](self->_viewForAnimatingAlpha, "addSubview:", v24);
        -[NSMutableArray addObject:](self->_fingerViews, "addObject:", v24);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

}

uint64_t __74__AXPIFingerContainerView__updateFingerModelViews_startPointForAnimation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __74__AXPIFingerContainerView__updateFingerModelViews_startPointForAnimation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (void)showFingerModels:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5 shouldShowPinchChain:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  _BOOL8 v9;
  id v11;
  _UILumaTrackingBackdropView *v12;
  _UILumaTrackingBackdropView *pointerLumaMeasurementView;
  UIView *viewForAnimatingAlpha;
  id v15;
  UIView *v16;
  UIView *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  AXPIPinchChainView *pinchChainView;
  AXPIPinchChainView *v27;
  AXPIPinchChainView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  _QWORD v34[5];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v9 = a4;
  v41 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = (_UILumaTrackingBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDCA0]), "initWithTransitionBoundaries:delegate:frame:", self, 0.45, 0.55, 0.0, 0.0, 19.0, 19.0);
  pointerLumaMeasurementView = self->_pointerLumaMeasurementView;
  self->_pointerLumaMeasurementView = v12;

  -[_UILumaTrackingBackdropView setPaused:](self->_pointerLumaMeasurementView, "setPaused:", 1);
  -[_UILumaTrackingBackdropView setHidden:](self->_pointerLumaMeasurementView, "setHidden:", 1);
  -[AXPIFingerContainerView addSubview:](self, "addSubview:", self->_pointerLumaMeasurementView);
  viewForAnimatingAlpha = self->_viewForAnimatingAlpha;
  if (viewForAnimatingAlpha)
    -[UIView removeFromSuperview](viewForAnimatingAlpha, "removeFromSuperview");
  v15 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[AXPIFingerContainerView bounds](self, "bounds");
  v16 = (UIView *)objc_msgSend(v15, "initWithFrame:");
  v17 = self->_viewForAnimatingAlpha;
  self->_viewForAnimatingAlpha = v16;

  -[UIView setAutoresizingMask:](self->_viewForAnimatingAlpha, "setAutoresizingMask:", 18);
  -[AXPIFingerContainerView addSubview:](self, "addSubview:", self->_viewForAnimatingAlpha);
  -[AXPIFingerContainerView setFingerModels:](self, "setFingerModels:", v11);
  v33 = v9;
  -[AXPIFingerContainerView _updateFingerModelViews:startPointForAnimation:](self, "_updateFingerModelViews:startPointForAnimation:", v9, x, y);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v19)
  {
    v21 = 0;
    v22 = 0;
    goto LABEL_17;
  }
  v20 = v19;
  LOBYTE(v21) = 0;
  LOBYTE(v22) = 0;
  v23 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v37 != v23)
        objc_enumerationMutation(v18);
      v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      if ((v22 & 1) != 0)
      {
        v22 = 1;
        if ((v21 & 1) == 0)
          goto LABEL_10;
      }
      else
      {
        v22 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "isSelected");
        if ((v21 & 1) == 0)
        {
LABEL_10:
          v21 = objc_msgSend(v25, "isPressed");
          continue;
        }
      }
      v21 = 1;
    }
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v20);
LABEL_17:

  if (v6)
  {
    pinchChainView = self->_pinchChainView;
    if (pinchChainView)
      -[AXPIPinchChainView removeFromSuperview](pinchChainView, "removeFromSuperview");
    v27 = objc_alloc_init(AXPIPinchChainView);
    v28 = self->_pinchChainView;
    self->_pinchChainView = v27;

    -[AXPIFingerContainerView appearanceDelegate](self, "appearanceDelegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPIPinchChainView setAppearanceDelegate:](self->_pinchChainView, "setAppearanceDelegate:", v29);

    -[UIView addSubview:](self->_viewForAnimatingAlpha, "addSubview:", self->_pinchChainView);
    if (objc_msgSend(v18, "count") == 2)
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "location");
      -[AXPIPinchChainView setStartPoint:](self->_pinchChainView, "setStartPoint:");

      objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "location");
      -[AXPIPinchChainView setEndPoint:](self->_pinchChainView, "setEndPoint:");

      -[AXPIFingerContainerView _updatePinchChainAppearance](self, "_updatePinchChainAppearance");
    }
  }
  if (+[AXPIFingerUtilities laserEnabled](AXPIFingerUtilities, "laserEnabled"))
  {
    -[AXPIFingerContainerView _updateLumaMeasurementViewFrame](self, "_updateLumaMeasurementViewFrame");
    -[AXPIFingerContainerView _updateSystemFiltersWithBackgroundLuminanceLevel:](self, "_updateSystemFiltersWithBackgroundLuminanceLevel:", 0);
    -[AXPIFingerContainerView setPressedState:animated:](self, "setPressedState:animated:", v22 | v21, 0);
  }
  if (-[AXPIFingerContainerView shouldSuppressFingerVisuals](self, "shouldSuppressFingerVisuals"))
  {
    -[UIView setAlpha:](self->_viewForAnimatingAlpha, "setAlpha:", 0.0);
  }
  else if (v33)
  {
    -[UIView setAlpha:](self->_viewForAnimatingAlpha, "setAlpha:", 0.0);
    v32 = (void *)MEMORY[0x24BEBDB00];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __97__AXPIFingerContainerView_showFingerModels_animated_startPointForAnimation_shouldShowPinchChain___block_invoke;
    v34[3] = &unk_24F478680;
    v34[4] = self;
    v35 = v18;
    objc_msgSend(v32, "animateWithDuration:animations:", v34, 0.25);

  }
}

uint64_t __97__AXPIFingerContainerView_showFingerModels_animated_startPointForAnimation_shouldShowPinchChain___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __97__AXPIFingerContainerView_showFingerModels_animated_startPointForAnimation_shouldShowPinchChain___block_invoke_2;
  v4[3] = &unk_24F4789D8;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setHidden:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setPaused:", 0);
}

void __97__AXPIFingerContainerView_showFingerModels_animated_startPointForAnimation_shouldShowPinchChain___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");

  objc_msgSend(v6, "setFrame:", _frameCenteredAroundPointForView(v6));
}

- (void)setShouldSuppressFingerVisuals:(BOOL)a3
{
  _BOOL8 v3;
  double v5;

  if (self->_shouldSuppressFingerVisuals != a3)
  {
    v3 = a3;
    self->_shouldSuppressFingerVisuals = a3;
    v5 = 1.0;
    if (a3)
      v5 = 0.0;
    -[UIView setAlpha:](self->_viewForAnimatingAlpha, "setAlpha:", v5);
    -[_UILumaTrackingBackdropView setHidden:](self->_pointerLumaMeasurementView, "setHidden:", v3);
    -[_UILumaTrackingBackdropView setPaused:](self->_pointerLumaMeasurementView, "setPaused:", v3);
  }
}

- (void)clearAllFingersAnimated:(BOOL)a3 endPointForAnimation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  _BOOL4 v6;
  void *v8;
  AXPIPinchChainView *pinchChainView;
  UIView *v10;
  UIView *viewForAnimatingAlpha;
  _UILumaTrackingBackdropView *pointerLumaMeasurementView;
  void *v13;
  uint64_t v14;
  UIView *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  UIView *v25;
  _QWORD v26[4];
  UIView *v27;
  id v28;
  CGFloat v29;
  CGFloat v30;
  _BYTE v31[128];
  uint64_t v32;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)-[NSMutableArray copy](self->_fingerViews, "copy");
  -[NSMutableArray removeAllObjects](self->_fingerViews, "removeAllObjects");
  -[AXPIPinchChainView removeFromSuperview](self->_pinchChainView, "removeFromSuperview");
  pinchChainView = self->_pinchChainView;
  self->_pinchChainView = 0;

  v10 = self->_viewForAnimatingAlpha;
  viewForAnimatingAlpha = self->_viewForAnimatingAlpha;
  self->_viewForAnimatingAlpha = 0;

  -[_UILumaTrackingBackdropView removeFromSuperview](self->_pointerLumaMeasurementView, "removeFromSuperview");
  pointerLumaMeasurementView = self->_pointerLumaMeasurementView;
  self->_pointerLumaMeasurementView = 0;

  if (v6)
  {
    v13 = (void *)MEMORY[0x24BEBDB00];
    v14 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __72__AXPIFingerContainerView_clearAllFingersAnimated_endPointForAnimation___block_invoke;
    v26[3] = &unk_24F478C58;
    v27 = v10;
    v28 = v8;
    v29 = x;
    v30 = y;
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __72__AXPIFingerContainerView_clearAllFingersAnimated_endPointForAnimation___block_invoke_2;
    v24[3] = &unk_24F478A78;
    v25 = v27;
    objc_msgSend(v13, "animateWithDuration:animations:completion:", v26, v24, 0.25);

    v15 = v27;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v8;
    v16 = -[UIView countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "removeFromSuperview", (_QWORD)v20);
        }
        while (v17 != v19);
        v17 = -[UIView countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
      }
      while (v17);
    }
  }

}

void __72__AXPIFingerContainerView_clearAllFingersAnimated_endPointForAnimation___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t i;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = *MEMORY[0x24BDBEFB0];
    v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        if (*(double *)(a1 + 48) != v6 || *(double *)(a1 + 56) != v7)
        {
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          v11 = _frameCenteredAroundPointForView(v10);
          objc_msgSend(v10, "setFrame:", v11, (_QWORD)v12);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __72__AXPIFingerContainerView_clearAllFingersAnimated_endPointForAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (unint64_t)indexOfFingerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  y = a3.y;
  x = a3.x;
  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_fingerViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "convertPoint:fromView:", self, x, y, (_QWORD)v14);
        if (objc_msgSend(v11, "pointInside:withEvent:", 0))
        {
          v12 = -[NSMutableArray indexOfObject:](self->_fingerViews, "indexOfObject:", v11);
          goto LABEL_11;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (void)updateWithFingerModel:(id)a3 forFingerAtIndex:(unint64_t)a4
{
  void *v6;
  int v7;
  int v8;
  AXPIPinchChainView *pinchChainView;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](self->_fingerViews, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPressed");
  v8 = objc_msgSend(v6, "isSelected");
  objc_msgSend(v11, "location");
  objc_msgSend(v6, "setFrame:", _frameCenteredAroundPointForView(v6));
  objc_msgSend(v6, "setPressed:animated:", objc_msgSend(v11, "isPressed"), -[AXPIFingerContainerView shouldAnimatePress](self, "shouldAnimatePress"));
  objc_msgSend(v6, "setSelected:", objc_msgSend(v11, "isSelected"));
  objc_msgSend(v11, "force");
  objc_msgSend(v6, "setForce:");
  objc_msgSend(v6, "setShape:", objc_msgSend(v11, "shape"));
  if (self->_pinchChainView)
  {
    objc_msgSend(v11, "location");
    pinchChainView = self->_pinchChainView;
    if (a4)
      -[AXPIPinchChainView setEndPoint:](pinchChainView, "setEndPoint:");
    else
      -[AXPIPinchChainView setStartPoint:](pinchChainView, "setStartPoint:");
    -[AXPIFingerContainerView _updatePinchChainAppearance](self, "_updatePinchChainAppearance");
  }
  if (v7 != objc_msgSend(v6, "isPressed") || v8 != objc_msgSend(v6, "isSelected"))
  {
    if ((objc_msgSend(v6, "isPressed") & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(v6, "isSelected");
    -[AXPIFingerContainerView setPressedState:animated:](self, "setPressedState:animated:", v10, 1);
  }
  -[AXPIFingerContainerView _updateLumaMeasurementViewFrame](self, "_updateLumaMeasurementViewFrame");

}

- (void)setPressedState:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  void *v16;
  _QWORD v17[4];
  void *v18;
  _QWORD v19[5];
  BOOL v20;

  v4 = a4;
  if (+[AXPIFingerUtilities laserEnabled](AXPIFingerUtilities, "laserEnabled"))
  {
    v7 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __52__AXPIFingerContainerView_setPressedState_animated___block_invoke;
    v19[3] = &unk_24F478930;
    v20 = a3;
    v19[4] = self;
    v8 = (void *)MEMORY[0x22E2DFEB0](v19);
    v9 = v8;
    v10 = (void *)MEMORY[0x24BEBDB00];
    if (v4)
    {
      +[AXPIFingerUtilities pointerAnimationSettings](AXPIFingerUtilities, "pointerAnimationSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __52__AXPIFingerContainerView_setPressedState_animated___block_invoke_2;
      v17[3] = &unk_24F478868;
      v12 = &v18;
      v18 = v9;
      v13 = v9;
      objc_msgSend(v10, "_animateUsingSpringBehavior:tracking:animations:completion:", v11, 0, v17, 0);

    }
    else
    {
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __52__AXPIFingerContainerView_setPressedState_animated___block_invoke_3;
      v15[3] = &unk_24F478868;
      v12 = &v16;
      v16 = v8;
      v14 = v8;
      objc_msgSend(v10, "_performWithoutRetargetingAnimations:", v15);
    }

  }
}

void *__52__AXPIFingerContainerView_setPressedState_animated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  void *result;
  void *v24;
  CGAffineTransform v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGAffineTransform v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "appearanceDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "pressedScale");
  else
    objc_msgSend(v3, "unpressedScale");
  v6 = v5;

  v7 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "appearanceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "pressedAlpha");
  else
    objc_msgSend(v8, "unpressedAlpha");
  v11 = v10;

  v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v30.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v30.c = v12;
  *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformMakeScale(&v30, v6, v6);
  v13 = objc_msgSend(*(id *)(a1 + 32), "isPinchChainVisible");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = *(id *)(*(_QWORD *)(a1 + 32) + 416);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v20, "filterLayer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v11;
        *(float *)&v22 = v18;
        objc_msgSend(v21, "setOpacity:", v22);

        if ((v13 & 1) == 0)
        {
          v25 = v30;
          objc_msgSend(v20, "setTransform:", &v25);
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v16);
  }

  result = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  if (result)
    result = (void *)objc_msgSend(result, "setAlpha:", v11);
  if (v13)
  {
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
    v25 = v30;
    return (void *)objc_msgSend(v24, "setTransform:", &v25);
  }
  return result;
}

uint64_t __52__AXPIFingerContainerView_setPressedState_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__AXPIFingerContainerView_setPressedState_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateSystemFiltersWithBackgroundLuminanceLevel:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  if (+[AXPIFingerUtilities laserEnabled](AXPIFingerUtilities, "laserEnabled"))
  {
    -[AXPIFingerContainerView appearanceDelegate](self, "appearanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "useSystemFilters");

    if (v6)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __76__AXPIFingerContainerView__updateSystemFiltersWithBackgroundLuminanceLevel___block_invoke;
      v10[3] = &unk_24F478C80;
      v10[4] = self;
      v10[5] = a3;
      v7 = (void *)MEMORY[0x22E2DFEB0](v10);
      v8 = (void *)MEMORY[0x24BEBDB00];
      +[AXPIFingerUtilities pointerAnimationSettings](AXPIFingerUtilities, "pointerAnimationSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_animateUsingSpringBehavior:tracking:animations:completion:", v9, 0, v7, 0);

    }
  }
}

void __76__AXPIFingerContainerView__updateSystemFiltersWithBackgroundLuminanceLevel___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  +[AXPIFingerUtilities pointerFiltersForLuminanceLevel:](AXPIFingerUtilities, "pointerFiltersForLuminanceLevel:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 416);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "filterLayer", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFilters:", v2);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilters:", v2);

}

- (void)_updateLumaMeasurementViewFrame
{
  void *v3;
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  unint64_t v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  if (-[NSMutableArray count](self->_fingerViews, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_fingerViews, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    x = v4;
    y = v6;
    width = v8;
    height = v10;

    if ((unint64_t)-[NSMutableArray count](self->_fingerViews, "count") >= 2)
    {
      v12 = 1;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_fingerViews, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        v20.origin.x = v14;
        v20.origin.y = v15;
        v20.size.width = v16;
        v20.size.height = v17;
        v18.origin.x = x;
        v18.origin.y = y;
        v18.size.width = width;
        v18.size.height = height;
        v19 = CGRectUnion(v18, v20);
        x = v19.origin.x;
        y = v19.origin.y;
        width = v19.size.width;
        height = v19.size.height;

        ++v12;
      }
      while (v12 < -[NSMutableArray count](self->_fingerViews, "count"));
    }
  }
  else
  {
    width = 19.0;
    x = 0.0;
    y = 0.0;
    height = 19.0;
  }
  -[_UILumaTrackingBackdropView setFrame:](self->_pointerLumaMeasurementView, "setFrame:", x, y, width, height);
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  -[AXPIFingerContainerView _updateSystemFiltersWithBackgroundLuminanceLevel:](self, "_updateSystemFiltersWithBackgroundLuminanceLevel:", a4);
}

- (void)_updatePinchChainAppearance
{
  double y;
  double x;
  double height;
  double width;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_fingerViews;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    LOBYTE(v11) = 1;
    LOBYTE(v12) = 1;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "frame", (_QWORD)v19);
        v27.origin.x = v15;
        v27.origin.y = v16;
        v27.size.width = v17;
        v27.size.height = v18;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v27);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        if ((v12 & 1) != 0)
        {
          v12 = objc_msgSend(v14, "isPressed");
          if ((v11 & 1) == 0)
            goto LABEL_8;
        }
        else
        {
          v12 = 0;
          if ((v11 & 1) == 0)
          {
LABEL_8:
            v11 = 0;
            continue;
          }
        }
        v11 = objc_msgSend(v14, "isSelected");
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v9)
        goto LABEL_15;
    }
  }
  v11 = 1;
  v12 = 1;
LABEL_15:

  -[AXPIPinchChainView setFrame:](self->_pinchChainView, "setFrame:", x, y, width, height);
  -[AXPIPinchChainView setPressed:](self->_pinchChainView, "setPressed:", v12);
  -[AXPIPinchChainView setSelected:](self->_pinchChainView, "setSelected:", v11);
}

- (CGRect)rectForFingersAtPoints:(id)a3
{
  id v4;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  CGPoint v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v4);
        v15 = CGPointFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v14));
        v38.origin.x = v15.x;
        v38.origin.y = v15.y;
        v33.origin.x = x;
        v33.origin.y = y;
        v33.size.width = width;
        v33.size.height = height;
        v38.size.width = v12;
        v38.size.height = v13;
        v34 = CGRectUnion(v33, v38);
        x = v34.origin.x;
        y = v34.origin.y;
        width = v34.size.width;
        height = v34.size.height;
        ++v14;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }
  -[AXPIFingerContainerView appearanceDelegate](self, "appearanceDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fingerWidth");
  v18 = v17;

  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v36 = CGRectInset(v35, v18 * -0.5, v18 * -0.5);
  v19 = v36.origin.x;
  v20 = v36.origin.y;
  v21 = v36.size.width;
  v22 = v36.size.height;

  v23 = v19;
  v24 = v20;
  v25 = v21;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)performCircularProgressAnimationOnFingersWithDuration:(double)a3 completion:(id)a4
{
  NSObject *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  -[AXPIFingerContainerView cancelCircularProgressAnimation](self, "cancelCircularProgressAnimation");
  v6 = dispatch_group_create();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 1;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_fingerViews;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        dispatch_group_enter(v6);
        v18[0] = v9;
        v18[1] = 3221225472;
        v18[2] = __92__AXPIFingerContainerView_performCircularProgressAnimationOnFingersWithDuration_completion___block_invoke;
        v18[3] = &unk_24F478CA8;
        v20 = v25;
        v19 = v6;
        objc_msgSend(v12, "animateCircularProgressWithDuration:completion:", v18, a3);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __92__AXPIFingerContainerView_performCircularProgressAnimationOnFingersWithDuration_completion___block_invoke_2;
  block[3] = &unk_24F478CD0;
  v16 = v14;
  v17 = v25;
  block[4] = self;
  v13 = v14;
  dispatch_group_notify(v6, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v25, 8);
}

void __92__AXPIFingerContainerView_performCircularProgressAnimationOnFingersWithDuration_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __92__AXPIFingerContainerView_performCircularProgressAnimationOnFingersWithDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  return objc_msgSend(*(id *)(a1 + 32), "cancelCircularProgressAnimation");
}

- (void)cancelCircularProgressAnimation
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_fingerViews;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancelExisingCircularProgressAnimation", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)animateToTapWithDuration:(double)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_fingerViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "animateToTapWithDuration:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)shouldAnimatePress
{
  return self->_shouldAnimatePress;
}

- (void)setShouldAnimatePress:(BOOL)a3
{
  self->_shouldAnimatePress = a3;
}

- (BOOL)shouldSuppressFingerVisuals
{
  return self->_shouldSuppressFingerVisuals;
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  return (AXPIFingerAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_appearanceDelegate);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appearanceDelegate, a3);
}

- (NSArray)fingerModels
{
  return self->_fingerModels;
}

- (void)setFingerModels:(id)a3
{
  objc_storeStrong((id *)&self->_fingerModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerModels, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_pointerLumaMeasurementView, 0);
  objc_storeStrong((id *)&self->_pinchChainView, 0);
  objc_storeStrong((id *)&self->_viewForAnimatingAlpha, 0);
  objc_storeStrong((id *)&self->_fingerViews, 0);
}

@end
