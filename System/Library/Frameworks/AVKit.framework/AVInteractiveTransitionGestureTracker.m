@implementation AVInteractiveTransitionGestureTracker

- (void)addRecognizersToView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AVInteractiveTransitionGestureTracker recognizers](self, "recognizers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[AVInteractiveTransitionGestureTracker contentTransitioningViewGestureRecognizer](self, "contentTransitioningViewGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AVInteractiveTransitionGestureTracker contentTransitioningViewGestureRecognizer](self, "contentTransitioningViewGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addGestureRecognizer:", v11);

  }
}

- (NSArray)recognizers
{
  return self->_recognizers;
}

- (void)willMoveToView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AVInteractiveTransitionGestureTracker recognizers](self, "recognizers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[AVInteractiveTransitionGestureTracker contentTransitioningViewGestureRecognizer](self, "contentTransitioningViewGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInteractiveTransitionGestureTracker contentTransitioningViewGestureRecognizer](self, "contentTransitioningViewGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeGestureRecognizer:", v12);

}

- (UIPanGestureRecognizer)contentTransitioningViewGestureRecognizer
{
  return (UIPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->_contentTransitioningViewGestureRecognizer);
}

- (AVInteractiveTransitionGestureTracker)init
{
  AVInteractiveTransitionGestureTracker *v2;
  uint64_t v3;
  UIPanGestureRecognizer *panGestureRecognizer;
  uint64_t v5;
  UIPinchGestureRecognizer *pinchGestureRecognizer;
  uint64_t v7;
  UIRotationGestureRecognizer *rotationGestureRecognizer;
  uint64_t v9;
  UIPanGestureRecognizer *indirectPanGestureRecognizer;
  UIPanGestureRecognizer *v11;
  uint64_t v12;
  NSArray *recognizers;
  objc_super v15;
  UIPanGestureRecognizer *v16;
  __int128 v17;
  UIPanGestureRecognizer *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)AVInteractiveTransitionGestureTracker;
  v2 = -[AVInteractiveTransitionGestureTracker init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v2, sel__handlePanGesture_);
    panGestureRecognizer = v2->_panGestureRecognizer;
    v2->_panGestureRecognizer = (UIPanGestureRecognizer *)v3;

    -[UIPanGestureRecognizer setDelegate:](v2->_panGestureRecognizer, "setDelegate:", v2);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v2->_panGestureRecognizer, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setAllowedTouchTypes:](v2->_panGestureRecognizer, "setAllowedTouchTypes:", &unk_1E5BF3F00);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", v2, sel__handlePinchGesture_);
    pinchGestureRecognizer = v2->_pinchGestureRecognizer;
    v2->_pinchGestureRecognizer = (UIPinchGestureRecognizer *)v5;

    -[UIPinchGestureRecognizer setDelegate:](v2->_pinchGestureRecognizer, "setDelegate:", v2);
    -[UIPinchGestureRecognizer _setEndsOnSingleTouch:](v2->_pinchGestureRecognizer, "_setEndsOnSingleTouch:", 1);
    -[UIPinchGestureRecognizer _setRequiresSystemGesturesToFail:](v2->_pinchGestureRecognizer, "_setRequiresSystemGesturesToFail:", 1);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3BB8]), "initWithTarget:action:", v2, sel__handleRotationGesture_);
    rotationGestureRecognizer = v2->_rotationGestureRecognizer;
    v2->_rotationGestureRecognizer = (UIRotationGestureRecognizer *)v7;

    -[UIRotationGestureRecognizer setDelegate:](v2->_rotationGestureRecognizer, "setDelegate:", v2);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v2, sel__handlePanGesture_);
    indirectPanGestureRecognizer = v2->_indirectPanGestureRecognizer;
    v2->_indirectPanGestureRecognizer = (UIPanGestureRecognizer *)v9;

    -[UIPanGestureRecognizer setDelegate:](v2->_indirectPanGestureRecognizer, "setDelegate:", v2);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v2->_indirectPanGestureRecognizer, "setMaximumNumberOfTouches:", 2);
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v2->_indirectPanGestureRecognizer, "setMinimumNumberOfTouches:", 2);
    -[UIPanGestureRecognizer setAllowedTouchTypes:](v2->_indirectPanGestureRecognizer, "setAllowedTouchTypes:", &unk_1E5BF3F18);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v2->_indirectPanGestureRecognizer, "setAllowedScrollTypesMask:", 2);
    v11 = v2->_indirectPanGestureRecognizer;
    v16 = v2->_panGestureRecognizer;
    v17 = *(_OWORD *)&v2->_pinchGestureRecognizer;
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 4);
    v12 = objc_claimAutoreleasedReturnValue();
    recognizers = v2->_recognizers;
    v2->_recognizers = (NSArray *)v12;

    -[AVInteractiveTransitionGestureTracker setEnabled:](v2, "setEnabled:", 1);
  }
  return v2;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setTransitionDriverDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transitionDriverDelegate, a3);
}

- (void)didMoveToView:(id)a3
{
  id v4;

  v4 = a3;
  -[AVInteractiveTransitionGestureTracker setView:](self, "setView:", v4);
  -[AVInteractiveTransitionGestureTracker addRecognizersToView:](self, "addRecognizersToView:", v4);

}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AVInteractiveTransitionGestureTracker recognizers](self, "recognizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeGestureRecognizer:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  -[AVInteractiveTransitionGestureTracker contentTransitioningViewGestureRecognizer](self, "contentTransitioningViewGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInteractiveTransitionGestureTracker contentTransitioningViewGestureRecognizer](self, "contentTransitioningViewGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", v12);

  v13.receiver = self;
  v13.super_class = (Class)AVInteractiveTransitionGestureTracker;
  -[AVInteractiveTransitionGestureTracker dealloc](&v13, sel_dealloc);
}

- (void)setContentTransitioningViewGestureRecognizer:(id)a3
{
  UIPanGestureRecognizer **p_contentTransitioningViewGestureRecognizer;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id obj;

  obj = a3;
  p_contentTransitioningViewGestureRecognizer = &self->_contentTransitioningViewGestureRecognizer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentTransitioningViewGestureRecognizer);

  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_contentTransitioningViewGestureRecognizer);
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)&self->_contentTransitioningViewGestureRecognizer);
    objc_msgSend(v7, "removeGestureRecognizer:", v8);

    objc_storeWeak((id *)&self->_contentTransitioningViewGestureRecognizer, obj);
    -[AVInteractiveTransitionGestureTracker view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)p_contentTransitioningViewGestureRecognizer);
    objc_msgSend(v9, "addGestureRecognizer:", v10);

  }
}

- (BOOL)isTracking
{
  return -[AVInteractiveTransitionGestureTracker transitionInteraction](self, "transitionInteraction") != 0;
}

- (id)_locationRecognizer
{
  void *v3;
  UIPanGestureRecognizer *v4;

  -[AVInteractiveTransitionGestureTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVInteractiveTransitionGestureTracker isPanToDismissEnabled](self, "isPanToDismissEnabled"))
  {
    v4 = self->_activePanGestureRecognizer;

    v3 = v4;
  }
  return v3;
}

- (CGPoint)_untranslatedUnfilteredLocationInFixedCoordinateSpace
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  -[AVInteractiveTransitionGestureTracker _locationRecognizer](self, "_locationRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInView:", 0);
  v5 = v4;
  v7 = v6;

  -[AVInteractiveTransitionGestureTracker view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fixedCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInteractiveTransitionGestureTracker view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "windowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v15, v5, v7);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (CGPoint)_filteredUntranslatedLocationInWindow
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[AVInteractiveTransitionGestureTracker _locationRecognizer](self, "_locationRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInteractiveTransitionGestureTracker view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  if (!-[AVInteractiveTransitionGestureTracker _isWaitingToContinue](self, "_isWaitingToContinue"))
    -[AVInteractiveTransitionGestureTracker setLastReportedLocationInWindow:](self, "setLastReportedLocationInWindow:", v7, v9);
  -[AVInteractiveTransitionGestureTracker lastReportedLocationInWindow](self, "lastReportedLocationInWindow");
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)locationInWindow
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  CGPoint result;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[AVInteractiveTransitionGestureTracker _filteredUntranslatedLocationInWindow](self, "_filteredUntranslatedLocationInWindow");
  v4 = v3;
  v6 = v5;
  v7 = -[AVInteractiveTransitionGestureTracker initialInterfaceOrientation](self, "initialInterfaceOrientation");
  -[AVInteractiveTransitionGestureTracker view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "interfaceOrientation");

  -[AVInteractiveTransitionGestureTracker view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  switch(v7)
  {
    case 1:
      v21 = 0;
      break;
    case 3:
      v21 = -1;
      break;
    case 4:
      v21 = 1;
      break;
    default:
      v21 = 2 * (v7 == 2);
      break;
  }
  switch(v10)
  {
    case 1:
      v22 = 0;
      break;
    case 3:
      v22 = 1;
      break;
    case 4:
      v22 = -1;
      break;
    default:
      v22 = -2;
      if (v10 != 2)
        v22 = 0;
      break;
  }
  v23 = v22 + v21;
  if (v23 == 2)
  {
    v28.origin.x = v14;
    v28.origin.y = v16;
    v28.size.width = v18;
    v28.size.height = v20;
    v4 = CGRectGetWidth(v28) - v4;
    v29.origin.x = v14;
    v29.origin.y = v16;
    v29.size.width = v18;
    v29.size.height = v20;
    v24 = CGRectGetHeight(v29) - v6;
LABEL_23:
    v6 = v4;
    goto LABEL_24;
  }
  if (v23 == 1)
  {
    v30.origin.x = v14;
    v30.origin.y = v16;
    v30.size.width = v18;
    v30.size.height = v20;
    v6 = CGRectGetHeight(v30) - v6;
    v24 = v4;
    goto LABEL_24;
  }
  if (v23 != -1)
  {
    v24 = v6;
    goto LABEL_23;
  }
  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  v24 = CGRectGetWidth(v27) - v4;
LABEL_24:
  v25 = v6;
  result.y = v24;
  result.x = v25;
  return result;
}

- (CGPoint)translationInWindow
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[AVInteractiveTransitionGestureTracker locationInWindow](self, "locationInWindow");
  v4 = v3;
  v6 = v5;
  -[AVInteractiveTransitionGestureTracker anchorLocationInWindow](self, "anchorLocationInWindow");
  v8 = v4 - v7;
  v10 = v6 - v9;
  result.y = v10;
  result.x = v8;
  return result;
}

- (CGPoint)velocityInWindow
{
  UIPanGestureRecognizer *activePanGestureRecognizer;
  void *v4;
  void *v5;
  double v6;
  double v7;
  int64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  CGPoint result;

  if (-[AVInteractiveTransitionGestureTracker transitionInteraction](self, "transitionInteraction") == 3)
  {
    activePanGestureRecognizer = self->_activePanGestureRecognizer;
    -[AVInteractiveTransitionGestureTracker view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer velocityInView:](activePanGestureRecognizer, "velocityInView:", v5);
    v19 = v7;
    v20 = v6;

    v8 = -[AVInteractiveTransitionGestureTracker initialInterfaceOrientation](self, "initialInterfaceOrientation");
    -[AVInteractiveTransitionGestureTracker view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "interfaceOrientation");

    v12 = -1;
    v13 = 1;
    if (v8 != 4)
      v13 = 2 * (v8 == 2);
    if (v8 != 3)
      v12 = v13;
    if (v8 == 1)
      v12 = 0;
    v14 = 1;
    v15 = -1;
    v16 = -2;
    if (v11 != 2)
      v16 = 0;
    if (v11 != 4)
      v15 = v16;
    if (v11 != 3)
      v14 = v15;
    if (v11 == 1)
      v14 = 0;
    CGAffineTransformMakeRotation(&v21, (double)(v14 + v12) * 1.57079633);
    v17 = vaddq_f64(*(float64x2_t *)&v21.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v21.c, v19), *(float64x2_t *)&v21.a, v20));
  }
  else
  {
    v17 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  }
  v18 = v17.f64[1];
  result.x = v17.f64[0];
  result.y = v18;
  return result;
}

- (double)angleOfVelocityInWindow
{
  double v2;
  double v3;

  -[AVInteractiveTransitionGestureTracker velocityInWindow](self, "velocityInWindow");
  return atan2(v3 - v2 * 0.0, v2 + v3 * 0.0) * 57.2957795;
}

- (double)pinchScale
{
  void *v3;
  double v4;
  double v5;

  if ((unint64_t)(-[AVInteractiveTransitionGestureTracker transitionInteraction](self, "transitionInteraction")
                        - 1) > 1)
    return 0.0;
  -[AVInteractiveTransitionGestureTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  return v5;
}

- (double)pinchVelocity
{
  void *v3;
  double v4;
  double v5;

  if ((unint64_t)(-[AVInteractiveTransitionGestureTracker transitionInteraction](self, "transitionInteraction")
                        - 1) > 1)
    return 0.0;
  -[AVInteractiveTransitionGestureTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "velocity");
  v5 = v4;

  return v5;
}

- (double)rotation
{
  double result;

  if ((unint64_t)(-[AVInteractiveTransitionGestureTracker transitionInteraction](self, "transitionInteraction")
                        - 1) > 1)
    return 0.0;
  -[AVInteractiveTransitionGestureTracker _rotation](self, "_rotation");
  return result;
}

- (double)rotationVelocity
{
  void *v3;
  double v4;
  double v5;

  if ((unint64_t)(-[AVInteractiveTransitionGestureTracker transitionInteraction](self, "transitionInteraction")
                        - 1) > 1)
    return 0.0;
  -[AVInteractiveTransitionGestureTracker rotationGestureRecognizer](self, "rotationGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "velocity");
  v5 = v4;

  return v5;
}

- (BOOL)transitionDriver:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "_isPointerTouch") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[AVInteractiveTransitionGestureTracker transitionDriverDelegate](self, "transitionDriverDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "transitionDriver:gestureRecognizer:shouldReceiveTouch:", self, v6, v7);

  }
  return v8;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5;
  char isKindOfClass;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIPanGestureRecognizer *activePanGestureRecognizer;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  CGPoint v35;
  CGRect v36;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    -[AVInteractiveTransitionGestureTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v27 = objc_claimAutoreleasedReturnValue();
    if ((id)v27 == v5)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[AVInteractiveTransitionGestureTracker rotationGestureRecognizer](self, "rotationGestureRecognizer");
      v29 = (id)objc_claimAutoreleasedReturnValue();

      if (v29 != v5)
      {
        if ((isKindOfClass & 1) != 0)
        {
          if (!-[AVInteractiveTransitionGestureTracker isTracking](self, "isTracking"))
          {
            -[AVInteractiveTransitionGestureTracker transitionDriverDelegate](self, "transitionDriverDelegate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVInteractiveTransitionGestureTracker setPanToDismissEnabled:](self, "setPanToDismissEnabled:", objc_msgSend(v30, "transitionDriver:shouldDriveTransitionInteractionOfType:", self, 3));

          }
          v31 = -[AVInteractiveTransitionGestureTracker isPanToDismissEnabled](self, "isPanToDismissEnabled");
          goto LABEL_20;
        }
        goto LABEL_18;
      }
    }
    if (!-[AVInteractiveTransitionGestureTracker isTracking](self, "isTracking"))
    {
      -[AVInteractiveTransitionGestureTracker transitionDriverDelegate](self, "transitionDriverDelegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVInteractiveTransitionGestureTracker setPinchToDismissEnabled:](self, "setPinchToDismissEnabled:", objc_msgSend(v32, "transitionDriver:shouldDriveTransitionInteractionOfType:", self, 2));

      -[AVInteractiveTransitionGestureTracker transitionDriverDelegate](self, "transitionDriverDelegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVInteractiveTransitionGestureTracker setPinchToPresentEnabled:](self, "setPinchToPresentEnabled:", objc_msgSend(v33, "transitionDriver:shouldDriveTransitionInteractionOfType:", self, 1));

    }
    if (!-[AVInteractiveTransitionGestureTracker isPinchToDismissEnabled](self, "isPinchToDismissEnabled"))
    {
      v31 = -[AVInteractiveTransitionGestureTracker isPinchToPresentEnabled](self, "isPinchToPresentEnabled");
LABEL_20:
      v26 = v31;
      goto LABEL_21;
    }
LABEL_18:
    v26 = 1;
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_activePanGestureRecognizer, a3);
  -[UIPanGestureRecognizer velocityInView:](self->_activePanGestureRecognizer, "velocityInView:", 0);
  v8 = v7;
  v10 = v9;
  -[UIPanGestureRecognizer translationInView:](self->_activePanGestureRecognizer, "translationInView:", 0);
  v12 = v11;
  v14 = v13;
  activePanGestureRecognizer = self->_activePanGestureRecognizer;
  objc_msgSend(v5, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer locationInView:](activePanGestureRecognizer, "locationInView:", v16);
  v18 = v17;
  v20 = v19;

  objc_msgSend(v5, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v36.origin.x = v22 + 16.0;
  v36.origin.y = v23 + 16.0;
  v36.size.width = v24 + -32.0;
  v36.size.height = v25 + -32.0;
  v35.x = v18;
  v35.y = v20;
  if (CGRectContainsPoint(v36, v35) || v10 > 44.0 || v10 > fabs(v8 * 0.125))
  {

    goto LABEL_8;
  }

  if (v14 > fabs(v12 * 0.125))
    goto LABEL_8;
  v26 = 0;
LABEL_21:

  return v26;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[AVInteractiveTransitionGestureTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AVInteractiveTransitionGestureTracker rotationGestureRecognizer](self, "rotationGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v10 = v9 == v7;
  }
  else if (v9 == v6)
  {
    -[AVInteractiveTransitionGestureTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v11 == v7;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  char isKindOfClass;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AVInteractiveTransitionGestureTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_11;
  }
  -[AVInteractiveTransitionGestureTracker panGestureRecognizer](self, "panGestureRecognizer");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v6)
  {

  }
  else
  {
    v10 = (void *)v9;
    -[AVInteractiveTransitionGestureTracker indirectPanGestureRecognizer](self, "indirectPanGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 != v6)
    {
      isKindOfClass = 0;
      goto LABEL_11;
    }
  }
  -[AVInteractiveTransitionGestureTracker contentTransitioningViewGestureRecognizer](self, "contentTransitioningViewGestureRecognizer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v7)
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

LABEL_11:
  return isKindOfClass & 1;
}

- (void)_handlePinchGesture:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  double Width;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double Height;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint8_t v28[16];
  uint8_t buf[16];
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a3;
  if (!-[AVInteractiveTransitionGestureTracker isPinchToPresentEnabled](self, "isPinchToPresentEnabled")
    && !-[AVInteractiveTransitionGestureTracker isPinchToDismissEnabled](self, "isPinchToDismissEnabled"))
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "Recognized pinch gesture without enabling pinch to present or pinch to dismiss.", buf, 2u);
    }

  }
  v6 = -[AVInteractiveTransitionGestureTracker isPinchToPresentEnabled](self, "isPinchToPresentEnabled");
  if (v6 == -[AVInteractiveTransitionGestureTracker isPinchToDismissEnabled](self, "isPinchToDismissEnabled"))
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v28 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Pinch to present and pinch to dismiss cannot be simultaneously enabled.", v28, 2u);
    }

  }
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      if (-[AVInteractiveTransitionGestureTracker isPinchToDismissEnabled](self, "isPinchToDismissEnabled"))
        v8 = 2;
      else
        v8 = 1;
      -[AVInteractiveTransitionGestureTracker _beginTracking:](self, "_beginTracking:", v8);
      objc_msgSend(v4, "scale");
      -[AVInteractiveTransitionGestureTracker setPreviousPinchScale:](self, "setPreviousPinchScale:");
      break;
    case 2:
      if (!-[AVInteractiveTransitionGestureTracker _isWaitingToContinue](self, "_isWaitingToContinue"))
      {
        -[AVInteractiveTransitionGestureTracker _setHasContinuedIfNeeded](self, "_setHasContinuedIfNeeded");
        if (-[AVInteractiveTransitionGestureTracker isPinchToPresentEnabled](self, "isPinchToPresentEnabled"))
        {
          objc_msgSend(v4, "view");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bounds");
          Width = CGRectGetWidth(v30);
          objc_msgSend(v4, "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "window");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bounds");
          v13 = Width / CGRectGetWidth(v31);

          objc_msgSend(v4, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bounds");
          Height = CGRectGetHeight(v32);
          objc_msgSend(v4, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "window");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "bounds");
          v18 = Height / CGRectGetHeight(v33);

          -[AVInteractiveTransitionGestureTracker previousPinchScale](self, "previousPinchScale");
          v20 = v19;
          objc_msgSend(v4, "scale");
          v22 = v21;
          -[AVInteractiveTransitionGestureTracker previousPinchScale](self, "previousPinchScale");
          v24 = v22 - v23;
          if (v13 >= v18)
            v25 = v13;
          else
            v25 = v18;
          objc_msgSend(v4, "setScale:", v20 + v24 * v25);
        }
        objc_msgSend(v4, "scale");
        -[AVInteractiveTransitionGestureTracker setPreviousPinchScale:](self, "setPreviousPinchScale:");
        if (!-[AVInteractiveTransitionGestureTracker hasRotated](self, "hasRotated"))
        {
          -[AVInteractiveTransitionGestureTracker rotationGestureRecognizer](self, "rotationGestureRecognizer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setRotation:", 0.0);

        }
        -[AVInteractiveTransitionGestureTracker transitionDriverDelegate](self, "transitionDriverDelegate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "transitionDriverDidContinueInteraction:", self);

      }
      break;
    case 3:
      if (-[AVInteractiveTransitionGestureTracker _isWaitingToContinue](self, "_isWaitingToContinue"))
        goto LABEL_11;
      -[AVInteractiveTransitionGestureTracker _finish](self, "_finish");
      break;
    case 4:
    case 5:
LABEL_11:
      -[AVInteractiveTransitionGestureTracker _cancel](self, "_cancel");
      break;
    default:
      break;
  }

}

- (void)_handleRotationGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "state");
  v5 = v11;
  if (v4 == 1)
  {
LABEL_10:
    objc_msgSend(v5, "setRotation:", 0.0);
    goto LABEL_11;
  }
  if (v4 == 2)
  {
    if (!-[AVInteractiveTransitionGestureTracker hasRotated](self, "hasRotated"))
    {
      -[AVInteractiveTransitionGestureTracker setHasRotated:](self, "setHasRotated:", 1);
      objc_msgSend(v11, "setRotation:", 0.0);
    }
    v6 = -[AVInteractiveTransitionGestureTracker hasRotated](self, "hasRotated");
    v5 = v11;
    if (v6)
    {
      objc_msgSend(v11, "rotation");
      v5 = v11;
      if (v7 < 0.0)
        v7 = -v7;
      if (v7 < 0.636619772)
      {
        -[AVInteractiveTransitionGestureTracker _rotation](self, "_rotation");
        v9 = v8;
        objc_msgSend(v11, "rotation");
        -[AVInteractiveTransitionGestureTracker _setRotation:](self, "_setRotation:", v9 + v10);
        v5 = v11;
      }
    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_handlePanGesture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (!-[AVInteractiveTransitionGestureTracker isPanToDismissEnabled](self, "isPanToDismissEnabled"))
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "Recognized pan gesture without enabling pan to dismiss.", v7, 2u);
    }

  }
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[AVInteractiveTransitionGestureTracker _beginTracking:](self, "_beginTracking:", 3);
      break;
    case 2:
      if (!-[AVInteractiveTransitionGestureTracker _isWaitingToContinue](self, "_isWaitingToContinue"))
      {
        -[AVInteractiveTransitionGestureTracker _setHasContinuedIfNeeded](self, "_setHasContinuedIfNeeded");
        -[AVInteractiveTransitionGestureTracker _updateLastNonZeroVelocityDirection](self, "_updateLastNonZeroVelocityDirection");
        -[AVInteractiveTransitionGestureTracker transitionDriverDelegate](self, "transitionDriverDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "transitionDriverDidContinueInteraction:", self);

      }
      break;
    case 3:
      if (-[AVInteractiveTransitionGestureTracker _isWaitingToContinue](self, "_isWaitingToContinue"))
        goto LABEL_6;
      if (-[AVInteractiveTransitionGestureTracker isWaitingForBoundsChange](self, "isWaitingForBoundsChange"))
        -[AVInteractiveTransitionGestureTracker _updateLastNonZeroVelocityDirection](self, "_updateLastNonZeroVelocityDirection");
      -[AVInteractiveTransitionGestureTracker _finish](self, "_finish");
      break;
    case 4:
    case 5:
LABEL_6:
      -[AVInteractiveTransitionGestureTracker _cancel](self, "_cancel");
      break;
    default:
      break;
  }

}

- (void)_beginTracking:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  _QWORD v15[5];
  uint8_t buf[16];

  -[AVInteractiveTransitionGestureTracker _filteredUntranslatedLocationInWindow](self, "_filteredUntranslatedLocationInWindow");
  if (-[AVInteractiveTransitionGestureTracker isTracking](self, "isTracking"))
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "Began tracking when already tracking.", buf, 2u);
    }

  }
  -[AVInteractiveTransitionGestureTracker setWaitingForTransition:](self, "setWaitingForTransition:", 1);
  -[AVInteractiveTransitionGestureTracker view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInteractiveTransitionGestureTracker setInitialInterfaceOrientation:](self, "setInitialInterfaceOrientation:", objc_msgSend(v8, "interfaceOrientation"));

  -[AVInteractiveTransitionGestureTracker view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[AVInteractiveTransitionGestureTracker setInitialCoordinateSpaceBounds:](self, "setInitialCoordinateSpaceBounds:");

  -[AVInteractiveTransitionGestureTracker setTransitionInteraction:](self, "setTransitionInteraction:", a3);
  -[AVInteractiveTransitionGestureTracker _resetGesturesIfPossible](self, "_resetGesturesIfPossible");
  -[AVInteractiveTransitionGestureTracker transitionDriverDelegate](self, "transitionDriverDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AVInteractiveTransitionGestureTracker transitionInteraction](self, "transitionInteraction");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__AVInteractiveTransitionGestureTracker__beginTracking___block_invoke;
  v15[3] = &unk_1E5BB4CA0;
  v15[4] = self;
  objc_msgSend(v13, "transitionDriver:didBeginTrackingTransitionInteraction:readyToProceedHandler:", self, v14, v15);

}

- (void)_cancel
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (!-[AVInteractiveTransitionGestureTracker isTracking](self, "isTracking"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Cannot cancel when not tracking.", v5, 2u);
    }

  }
  -[AVInteractiveTransitionGestureTracker transitionDriverDelegate](self, "transitionDriverDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionDriverDidCancelInteraction:", self);

  -[AVInteractiveTransitionGestureTracker _reset](self, "_reset");
}

- (void)_finish
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (!-[AVInteractiveTransitionGestureTracker isTracking](self, "isTracking"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Cannot finish when not tracking.", v5, 2u);
    }

  }
  -[AVInteractiveTransitionGestureTracker transitionDriverDelegate](self, "transitionDriverDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionDriverDidFinishInteraction:", self);

  -[AVInteractiveTransitionGestureTracker _reset](self, "_reset");
}

- (BOOL)_isWaitingToContinue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  unint64_t v33;
  double v35;
  CGRect v36;
  CGRect v37;

  -[AVInteractiveTransitionGestureTracker _locationRecognizer](self, "_locationRecognizer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    objc_msgSend(v3, "_activeEventOfType:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "timestamp");
    else
      objc_msgSend(v4, "lastTouchTimestamp");
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
  }

  if (-[AVInteractiveTransitionGestureTracker isWaitingForBoundsChange](self, "isWaitingForBoundsChange"))
  {
    -[AVInteractiveTransitionGestureTracker initialCoordinateSpaceBounds](self, "initialCoordinateSpaceBounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[AVInteractiveTransitionGestureTracker view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "windowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "coordinateSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v37.origin.x = v21;
    v37.origin.y = v22;
    v37.size.width = v23;
    v37.size.height = v24;
    v36.origin.x = v10;
    v36.origin.y = v12;
    v36.size.width = v14;
    v36.size.height = v16;
    v25 = CGRectEqualToRect(v36, v37);

    if (!v25)
    {
      -[AVInteractiveTransitionGestureTracker _untranslatedUnfilteredLocationInFixedCoordinateSpace](self, "_untranslatedUnfilteredLocationInFixedCoordinateSpace");
      -[AVInteractiveTransitionGestureTracker setGestureLocationAfterBoundsChange:](self, "setGestureLocationAfterBoundsChange:");
      -[AVInteractiveTransitionGestureTracker setWaitingForLocationChangeAfterBoundsChange:](self, "setWaitingForLocationChangeAfterBoundsChange:", 1);
      -[AVInteractiveTransitionGestureTracker setWaitingForBoundsChange:](self, "setWaitingForBoundsChange:", 0);
    }
  }
  if (!-[AVInteractiveTransitionGestureTracker isWaitingForBoundsChange](self, "isWaitingForBoundsChange"))
  {
    if (-[AVInteractiveTransitionGestureTracker isWaitingForLocationChangeAfterBoundsChange](self, "isWaitingForLocationChangeAfterBoundsChange"))
    {
      -[AVInteractiveTransitionGestureTracker _untranslatedUnfilteredLocationInFixedCoordinateSpace](self, "_untranslatedUnfilteredLocationInFixedCoordinateSpace");
      v27 = v26;
      v29 = v28;
      -[AVInteractiveTransitionGestureTracker gestureLocationAfterBoundsChange](self, "gestureLocationAfterBoundsChange");
      if (v27 != v31 || v29 != v30)
      {
        -[AVInteractiveTransitionGestureTracker setWaitingForLocationChangeAfterBoundsChange:](self, "setWaitingForLocationChangeAfterBoundsChange:", 0);
        -[AVInteractiveTransitionGestureTracker setTimestampOfTouchWithLocationChangeAfterBoundsChange:](self, "setTimestampOfTouchWithLocationChangeAfterBoundsChange:", v8);
      }
    }
  }
  -[AVInteractiveTransitionGestureTracker _locationRecognizer](self, "_locationRecognizer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "state");

  if (v33 > 2)
    return 0;
  if (-[AVInteractiveTransitionGestureTracker isWaitingForBoundsChange](self, "isWaitingForBoundsChange")
    || -[AVInteractiveTransitionGestureTracker isWaitingForTransition](self, "isWaitingForTransition")
    || -[AVInteractiveTransitionGestureTracker isWaitingForLocationChangeAfterBoundsChange](self, "isWaitingForLocationChangeAfterBoundsChange"))
  {
    return 1;
  }
  -[AVInteractiveTransitionGestureTracker timestampOfTouchWithLocationChangeAfterBoundsChange](self, "timestampOfTouchWithLocationChangeAfterBoundsChange");
  return v8 - v35 < 0.0166666667;
}

- (void)_reset
{
  NSObject *v3;
  uint8_t v4[16];

  if (!-[AVInteractiveTransitionGestureTracker isTracking](self, "isTracking"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Cannot reset when not tracking.", v4, 2u);
    }

  }
  -[AVInteractiveTransitionGestureTracker setPinchToDismissEnabled:](self, "setPinchToDismissEnabled:", 0);
  -[AVInteractiveTransitionGestureTracker setPinchToPresentEnabled:](self, "setPinchToPresentEnabled:", 0);
  -[AVInteractiveTransitionGestureTracker setPanToDismissEnabled:](self, "setPanToDismissEnabled:", 0);
  -[AVInteractiveTransitionGestureTracker setTransitionInteraction:](self, "setTransitionInteraction:", 0);
  -[AVInteractiveTransitionGestureTracker setHasRotated:](self, "setHasRotated:", 0);
  -[AVInteractiveTransitionGestureTracker setHasContinued:](self, "setHasContinued:", 0);
  -[AVInteractiveTransitionGestureTracker setWaitingForBoundsChange:](self, "setWaitingForBoundsChange:", 0);
  -[AVInteractiveTransitionGestureTracker setWaitingForLocationChangeAfterBoundsChange:](self, "setWaitingForLocationChangeAfterBoundsChange:", 0);
  -[AVInteractiveTransitionGestureTracker setWaitingForTransition:](self, "setWaitingForTransition:", 0);
  -[AVInteractiveTransitionGestureTracker setInitialInterfaceOrientation:](self, "setInitialInterfaceOrientation:", 0);
  -[AVInteractiveTransitionGestureTracker _resetGesturesIfPossible](self, "_resetGesturesIfPossible");
}

- (void)_resetGesturesIfPossible
{
  void *v3;
  id v4;

  if (!-[AVInteractiveTransitionGestureTracker _isWaitingToContinue](self, "_isWaitingToContinue"))
  {
    -[AVInteractiveTransitionGestureTracker setLastNonZeroVelocityWasDownward:](self, "setLastNonZeroVelocityWasDownward:", 0);
    -[AVInteractiveTransitionGestureTracker locationInWindow](self, "locationInWindow");
    -[AVInteractiveTransitionGestureTracker setAnchorLocationInWindow:](self, "setAnchorLocationInWindow:");
    -[AVInteractiveTransitionGestureTracker rotationGestureRecognizer](self, "rotationGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRotation:", 0.0);

    -[AVInteractiveTransitionGestureTracker pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScale:", 1.0);

  }
}

- (void)_setHasContinuedIfNeeded
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[AVInteractiveTransitionGestureTracker _isWaitingToContinue](self, "_isWaitingToContinue"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Cannot continue if still waiting.", v4, 2u);
    }

  }
  if (!-[AVInteractiveTransitionGestureTracker hasContinued](self, "hasContinued"))
  {
    -[AVInteractiveTransitionGestureTracker setHasContinued:](self, "setHasContinued:", 1);
    -[AVInteractiveTransitionGestureTracker _resetGesturesIfPossible](self, "_resetGesturesIfPossible");
  }
}

- (void)_updateLastNonZeroVelocityDirection
{
  double v3;
  double v4;
  _BOOL8 v5;

  -[AVInteractiveTransitionGestureTracker velocityInWindow](self, "velocityInWindow");
  if (v3 != 0.0)
  {
    if (v3 <= 0.0)
    {
      v5 = 0;
    }
    else
    {
      -[AVInteractiveTransitionGestureTracker angleOfVelocityInWindow](self, "angleOfVelocityInWindow");
      if (v4 < 0.0)
        v4 = -v4;
      v5 = v4 < 80.0;
    }
    -[AVInteractiveTransitionGestureTracker setLastNonZeroVelocityWasDownward:](self, "setLastNonZeroVelocityWasDownward:", v5);
  }
}

- (AVTransitionDriverDelegate)transitionDriverDelegate
{
  return (AVTransitionDriverDelegate *)objc_loadWeakRetained((id *)&self->_transitionDriverDelegate);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isPinchToDismissEnabled
{
  return self->_pinchToDismissEnabled;
}

- (void)setPinchToDismissEnabled:(BOOL)a3
{
  self->_pinchToDismissEnabled = a3;
}

- (BOOL)isPinchToPresentEnabled
{
  return self->_pinchToPresentEnabled;
}

- (void)setPinchToPresentEnabled:(BOOL)a3
{
  self->_pinchToPresentEnabled = a3;
}

- (BOOL)isPanToDismissEnabled
{
  return self->_panToDismissEnabled;
}

- (void)setPanToDismissEnabled:(BOOL)a3
{
  self->_panToDismissEnabled = a3;
}

- (double)previousPinchScale
{
  return self->_previousPinchScale;
}

- (void)setPreviousPinchScale:(double)a3
{
  self->_previousPinchScale = a3;
}

- (double)_rotation
{
  return self->__rotation;
}

- (void)_setRotation:(double)a3
{
  self->__rotation = a3;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (UIPanGestureRecognizer)indirectPanGestureRecognizer
{
  return self->_indirectPanGestureRecognizer;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (UIRotationGestureRecognizer)rotationGestureRecognizer
{
  return self->_rotationGestureRecognizer;
}

- (BOOL)isWaitingForTransition
{
  return self->_waitingForTransition;
}

- (void)setWaitingForTransition:(BOOL)a3
{
  self->_waitingForTransition = a3;
}

- (BOOL)isWaitingForBoundsChange
{
  return self->_waitingForBoundsChange;
}

- (void)setWaitingForBoundsChange:(BOOL)a3
{
  self->_waitingForBoundsChange = a3;
}

- (BOOL)isWaitingForLocationChangeAfterBoundsChange
{
  return self->_waitingForLocationChangeAfterBoundsChange;
}

- (void)setWaitingForLocationChangeAfterBoundsChange:(BOOL)a3
{
  self->_waitingForLocationChangeAfterBoundsChange = a3;
}

- (double)timestampOfTouchWithLocationChangeAfterBoundsChange
{
  return self->_timestampOfTouchWithLocationChangeAfterBoundsChange;
}

- (void)setTimestampOfTouchWithLocationChangeAfterBoundsChange:(double)a3
{
  self->_timestampOfTouchWithLocationChangeAfterBoundsChange = a3;
}

- (BOOL)hasContinued
{
  return self->_hasContinued;
}

- (void)setHasContinued:(BOOL)a3
{
  self->_hasContinued = a3;
}

- (BOOL)hasRotated
{
  return self->_hasRotated;
}

- (void)setHasRotated:(BOOL)a3
{
  self->_hasRotated = a3;
}

- (int64_t)initialInterfaceOrientation
{
  return self->_initialInterfaceOrientation;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (CGRect)initialCoordinateSpaceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialCoordinateSpaceBounds.origin.x;
  y = self->_initialCoordinateSpaceBounds.origin.y;
  width = self->_initialCoordinateSpaceBounds.size.width;
  height = self->_initialCoordinateSpaceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialCoordinateSpaceBounds:(CGRect)a3
{
  self->_initialCoordinateSpaceBounds = a3;
}

- (CGPoint)gestureLocationAfterBoundsChange
{
  double x;
  double y;
  CGPoint result;

  x = self->_gestureLocationAfterBoundsChange.x;
  y = self->_gestureLocationAfterBoundsChange.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGestureLocationAfterBoundsChange:(CGPoint)a3
{
  self->_gestureLocationAfterBoundsChange = a3;
}

- (CGPoint)lastReportedLocationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastReportedLocationInWindow.x;
  y = self->_lastReportedLocationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastReportedLocationInWindow:(CGPoint)a3
{
  self->_lastReportedLocationInWindow = a3;
}

- (CGPoint)anchorLocationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorLocationInWindow.x;
  y = self->_anchorLocationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorLocationInWindow:(CGPoint)a3
{
  self->_anchorLocationInWindow = a3;
}

- (BOOL)lastNonZeroVelocityWasDownward
{
  return self->_lastNonZeroVelocityWasDownward;
}

- (void)setLastNonZeroVelocityWasDownward:(BOOL)a3
{
  self->_lastNonZeroVelocityWasDownward = a3;
}

- (int64_t)transitionInteraction
{
  return self->_transitionInteraction;
}

- (void)setTransitionInteraction:(int64_t)a3
{
  self->_transitionInteraction = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_recognizers, 0);
  objc_storeStrong((id *)&self->_rotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_transitionDriverDelegate);
  objc_destroyWeak((id *)&self->_contentTransitioningViewGestureRecognizer);
  objc_storeStrong((id *)&self->_activePanGestureRecognizer, 0);
}

uint64_t __56__AVInteractiveTransitionGestureTracker__beginTracking___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  _BOOL4 v23;
  CGRect v25;
  CGRect v26;

  v2 = (unint64_t)(objc_msgSend(*(id *)(a1 + 32), "initialInterfaceOrientation") - 1) < 2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)(objc_msgSend(v5, "interfaceOrientation") - 1) < 2;

  if (v2 != v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinateSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(*(id *)(a1 + 32), "initialCoordinateSpaceBounds");
    v26.origin.x = v19;
    v26.origin.y = v20;
    v26.size.width = v21;
    v26.size.height = v22;
    v25.origin.x = v12;
    v25.origin.y = v14;
    v25.size.width = v16;
    v25.size.height = v18;
    v23 = CGRectEqualToRect(v25, v26);

    if (v23)
      objc_msgSend(*(id *)(a1 + 32), "setWaitingForBoundsChange:", 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "setWaitingForTransition:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_resetGesturesIfPossible");
  return objc_msgSend(*(id *)(a1 + 32), "_filteredUntranslatedLocationInWindow");
}

@end
