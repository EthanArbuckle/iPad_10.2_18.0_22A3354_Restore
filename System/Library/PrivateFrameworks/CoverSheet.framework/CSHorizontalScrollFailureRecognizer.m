@implementation CSHorizontalScrollFailureRecognizer

- (CSHorizontalScrollFailureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  CSHorizontalScrollFailureRecognizer *v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  NSMutableSet *touches;
  NSArray *debugViews;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  v4 = -[CSHorizontalScrollFailureRecognizer initWithTarget:action:](&v11, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "horizontalScrollFailureRecognizerSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addKeyObserver:", v4);
    -[CSHorizontalScrollFailureRecognizer _loadFromSettings:](v4, "_loadFromSettings:", v6);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    touches = v4->_touches;
    v4->_touches = v7;

    v4->_effectiveTopAngle = 0.0;
    v4->_effectiveBottomAngle = 0.0;
    debugViews = v4->_debugViews;
    v4->_debugViews = (NSArray *)MEMORY[0x1E0C9AA60];

    -[CSHorizontalScrollFailureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 1);
    -[CSHorizontalScrollFailureRecognizer setDelaysTouchesBegan:](v4, "setDelaysTouchesBegan:", 0);
    -[CSHorizontalScrollFailureRecognizer reset](v4, "reset");

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CSHorizontalScrollFailureRecognizer _setDebugViewsVisible:](self, "_setDebugViewsVisible:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  -[CSHorizontalScrollFailureRecognizer dealloc](&v3, sel_dealloc);
}

- (BOOL)isEnabled
{
  return self->_externallyEnabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_externallyEnabled != a3)
  {
    self->_externallyEnabled = a3;
    -[CSHorizontalScrollFailureRecognizer _updateEnabled](self, "_updateEnabled");
  }
}

- (double)_effectiveTopAngle
{
  return self->_effectiveTopAngle;
}

- (double)_effectiveBottomAngle
{
  return self->_effectiveBottomAngle;
}

- (BOOL)_effectivelyEnabled
{
  return self->_armed && self->_externallyEnabled;
}

- (void)_updateEnabled
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  -[CSHorizontalScrollFailureRecognizer setEnabled:](&v2, sel_setEnabled_, -[CSHorizontalScrollFailureRecognizer _effectivelyEnabled](self, "_effectivelyEnabled"));
}

- (void)_setArmed:(BOOL)a3
{
  if (self->_armed != a3)
  {
    self->_armed = a3;
    -[CSHorizontalScrollFailureRecognizer _updateEnabled](self, "_updateEnabled");
  }
}

- (void)setState:(int64_t)a3
{
  UIEvent *triggeredEvent;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  -[CSHorizontalScrollFailureRecognizer setState:](&v8, sel_setState_);
  if (a3 != 3)
  {
    triggeredEvent = self->_triggeredEvent;
    self->_triggeredEvent = 0;

    if (a3)
    {
      if (a3 != 1)
        return;
      objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    -[CSHorizontalScrollFailureRecognizer _setDebugViewsColor:](self, "_setDebugViewsColor:", v6);

  }
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  -[CSHorizontalScrollFailureRecognizer reset](&v3, sel_reset);
  -[NSMutableSet removeAllObjects](self->_touches, "removeAllObjects");
  self->_tracking = 0;
  self->_startingLocation = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_effectiveTopAngle = 0.0;
  self->_effectiveBottomAngle = 0.0;
  -[CSHorizontalScrollFailureRecognizer setState:](self, "setState:", 0);
  -[CSHorizontalScrollFailureRecognizer _setDebugViewsVisible:](self, "_setDebugViewsVisible:", 0);
}

- (BOOL)_recognizeForMultiTouchIfNecessary:(id)a3
{
  void *v4;
  BOOL v5;
  NSObject *v7;

  -[CSHorizontalScrollFailureRecognizer view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[NSMutableSet count](self->_touches, "count") < 2
    || -[CSHorizontalScrollFailureRecognizer allowMultiTouch](self, "allowMultiTouch"))
  {
    v5 = 0;
  }
  else if (-[CSHorizontalScrollFailureRecognizer state](self, "state"))
  {
    v5 = 1;
  }
  else
  {
    SBLogDashBoardScrollGestures();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CSHorizontalScrollFailureRecognizer _recognizeForMultiTouchIfNecessary:].cold.1((void **)&self->_touches, v4);

    v5 = 1;
    -[CSHorizontalScrollFailureRecognizer setState:](self, "setState:", 1);
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  NSMutableSet *touches;
  void *v8;
  NSObject *v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CSHorizontalScrollFailureRecognizer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  touches = self->_touches;
  -[CSHorizontalScrollFailureRecognizer _touchesFromEvent:](self, "_touchesFromEvent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](touches, "unionSet:", v8);

  SBLogDashBoardScrollGestures();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[CSHorizontalScrollFailureRecognizer _touchesFromEvent:](self, "_touchesFromEvent:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __stringsFromTouches(v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __stringsFromTouches(self->_touches, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    _os_log_debug_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEBUG, "HorizontalScrollFailureRecognizer - touches BEGAN: touchesFromEvent: %@, knownTouches: %@", (uint8_t *)&v17, 0x16u);

  }
  if (!-[CSHorizontalScrollFailureRecognizer _recognizeForMultiTouchIfNecessary:](self, "_recognizeForMultiTouchIfNecessary:", v5)&& !self->_tracking)
  {
    -[CSHorizontalScrollFailureRecognizer _averagePointFromTouches](self, "_averagePointFromTouches");
    self->_startingLocation.x = v10;
    self->_startingLocation.y = v11;
    self->_tracking = 1;
    -[CSHorizontalScrollFailureRecognizer _computeEffectiveAngleFromMin:max:](self, "_computeEffectiveAngleFromMin:max:", self->_minAllowedTopAngle, self->_maxAllowedTopAngle);
    self->_effectiveTopAngle = v12;
    -[CSHorizontalScrollFailureRecognizer _computeEffectiveAngleFromMin:max:](self, "_computeEffectiveAngleFromMin:max:", self->_minAllowedBottomAngle, self->_maxAllowedBottomAngle);
    self->_effectiveBottomAngle = v13;
    -[CSHorizontalScrollFailureRecognizer _setDebugViewsVisible:](self, "_setDebugViewsVisible:", self->_viewDebugArea);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CSHorizontalScrollFailureRecognizer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogDashBoardScrollGestures();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[CSHorizontalScrollFailureRecognizer _touchesFromEvent:](self, "_touchesFromEvent:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __stringsFromTouches(v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __stringsFromTouches(self->_touches, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_debug_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEBUG, "HorizontalScrollFailureRecognizer - touches MOVED: touches: %@, knownTouches: %@", (uint8_t *)&v12, 0x16u);

  }
  if (!-[CSHorizontalScrollFailureRecognizer state](self, "state"))
  {
    -[CSHorizontalScrollFailureRecognizer _averagePointFromTouches](self, "_averagePointFromTouches");
    if (-[CSHorizontalScrollFailureRecognizer _isLocationOutOfBounds:](self, "_isLocationOutOfBounds:"))
    {
      SBLogDashBoardScrollGestures();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D0337000, v8, OS_LOG_TYPE_INFO, "HorizontalScrollFailureRecognizer - beginning recognitition due to location out of bounds.", (uint8_t *)&v12, 2u);
      }

      -[CSHorizontalScrollFailureRecognizer setState:](self, "setState:", 1);
    }
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[CSHorizontalScrollFailureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet minusSet:](self->_touches, "minusSet:", v8);

  SBLogDashBoardScrollGestures();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[CSHorizontalScrollFailureRecognizer _touchesFromEvent:](self, "_touchesFromEvent:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __stringsFromTouches(v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __stringsFromTouches(self->_touches, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    _os_log_debug_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEBUG, "HorizontalScrollFailureRecognizer - touches ENDED: touchesFromEvent: %@, knownTouches: %@", (uint8_t *)&v15, 0x16u);

  }
  if (!-[NSMutableSet count](self->_touches, "count"))
  {
    if (-[CSHorizontalScrollFailureRecognizer state](self, "state"))
    {
      objc_storeStrong((id *)&self->_triggeredEvent, a4);
      v11 = 3;
    }
    else
    {
      v11 = 5;
    }
    -[CSHorizontalScrollFailureRecognizer setState:](self, "setState:", v11);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[CSHorizontalScrollFailureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet minusSet:](self->_touches, "minusSet:", v7);

  SBLogDashBoardScrollGestures();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[CSHorizontalScrollFailureRecognizer _touchesFromEvent:](self, "_touchesFromEvent:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __stringsFromTouches(v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __stringsFromTouches(self->_touches, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_debug_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEBUG, "HorizontalScrollFailureRecognizer - touches CANCELLED: touchesFromEvent: %@, knownTouches: %@", (uint8_t *)&v14, 0x16u);

  }
  if (!-[NSMutableSet count](self->_touches, "count"))
  {
    if (-[CSHorizontalScrollFailureRecognizer state](self, "state"))
      v10 = 4;
    else
      v10 = 5;
    -[CSHorizontalScrollFailureRecognizer setState:](self, "setState:", v10);
  }

}

- (CGPoint)_locationOfTouch:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
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
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGPoint result;

  v6 = a4;
  v7 = a3;
  -[CSHorizontalScrollFailureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v8, v12, v14);
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "coordinateSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertPoint:fromCoordinateSpace:", v9, v16, v18);
  v21 = v20;
  v23 = v22;

  objc_msgSend(v6, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coordinateSpace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "convertPoint:fromCoordinateSpace:", v25, v21, v23);
  v27 = v26;
  v29 = v28;

  objc_msgSend(v6, "convertPoint:fromCoordinateSpace:", v24, v27, v29);
  v31 = v30;
  v33 = v32;

  v34 = v31;
  v35 = v33;
  result.y = v35;
  result.x = v34;
  return result;
}

- (id)_touchesFromEvent:(id)a3
{
  return (id)objc_msgSend(a3, "touchesForGestureRecognizer:", self);
}

- (void)_loadFromSettings:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[CSHorizontalScrollFailureRecognizer _setArmed:](self, "_setArmed:", objc_msgSend(v4, "enabled"));
  -[CSHorizontalScrollFailureRecognizer setViewDebugArea:](self, "setViewDebugArea:", objc_msgSend(v4, "viewDebugArea"));
  -[CSHorizontalScrollFailureRecognizer setMaxAllowableVerticalOffset:](self, "setMaxAllowableVerticalOffset:", objc_msgSend(v4, "maxAllowableVerticalOffset"));
  objc_msgSend(v4, "topAngle");
  -[CSHorizontalScrollFailureRecognizer setMaxAllowedTopAngle:](self, "setMaxAllowedTopAngle:");
  objc_msgSend(v4, "topAngle");
  -[CSHorizontalScrollFailureRecognizer setMinAllowedTopAngle:](self, "setMinAllowedTopAngle:");
  objc_msgSend(v4, "bottomAngle");
  -[CSHorizontalScrollFailureRecognizer setMaxAllowedBottomAngle:](self, "setMaxAllowedBottomAngle:");
  objc_msgSend(v4, "bottomAngle");
  v6 = v5;

  -[CSHorizontalScrollFailureRecognizer setMinAllowedBottomAngle:](self, "setMinAllowedBottomAngle:", v6);
}

- (int64_t)_activeTouchCountForEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CSHorizontalScrollFailureRecognizer _touchesFromEvent:](self, "_touchesFromEvent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "phase") < 3)
          ++v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CGPoint)_averagePointFromTouches
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGPoint result;

  v24 = *MEMORY[0x1E0C80C00];
  -[CSHorizontalScrollFailureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_touches;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        -[CSHorizontalScrollFailureRecognizer _locationOfTouch:inView:](self, "_locationOfTouch:inView:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v3, (_QWORD)v19);
        v10 = v10 + v12;
        v9 = v9 + v13;
      }
      v7 += v6;
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);

    v14 = v10 / (double)v7;
    v15 = v9 / (double)v7;
  }
  else
  {

    v14 = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  SBLogDashBoardScrollGestures();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[CSHorizontalScrollFailureRecognizer _averagePointFromTouches].cold.1(v14, v15);

  v17 = v14;
  v18 = v15;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)_computeEffectiveAngleFromMin:(double)a3 max:(double)a4
{
  void *v7;
  void *v8;
  double v9;

  -[CSHorizontalScrollFailureRecognizer view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (vabdd_f64(a4, a3) > 0.001)
  {
    objc_msgSend(v7, "bounds");
    a4 = self->_startingLocation.x * ((a4 - a3) / v9);
  }

  return a4;
}

- (BOOL)_isOutOfBoundsVertically:(CGPoint)a3
{
  double v3;
  double v4;

  v3 = floor(vabdd_f64(a3.y, self->_startingLocation.y));
  -[CSHorizontalScrollFailureRecognizer _maxAllowableVerticalOffsetForPoint:](self, "_maxAllowableVerticalOffsetForPoint:", a3.x);
  return v3 > v4;
}

- (double)_maxAllowableVerticalOffsetForPoint:(CGPoint)a3
{
  double y;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  y = a3.y;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return (double)self->_maxAllowableVerticalOffset;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 != 1)
      return (double)self->_maxAllowableVerticalOffset;
  }
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  v11 = fabs(y + v10 * -0.5);
  return (double)self->_maxAllowableVerticalOffset / 3.0
       + (1.0 - (v11 + v11) / v10)
       * (((double)self->_maxAllowableVerticalOffset + (double)self->_maxAllowableVerticalOffset)
        / 3.0);
}

- (BOOL)_isOutOfBounds:(CGPoint)a3 forAngle:(double)a4
{
  double y;
  double x;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;

  y = a3.y;
  x = a3.x;
  v8 = -[CSHorizontalScrollFailureRecognizer _isOutOfBoundsVertically:](self, "_isOutOfBoundsVertically:");
  if (v8)
  {
    v9 = fabs(tan(a4 * 0.0174532925)) * vabdd_f64(x, self->_startingLocation.x) + 0.0;
    v10 = floor(vabdd_f64(y, self->_startingLocation.y));
    -[CSHorizontalScrollFailureRecognizer _maxAllowableVerticalOffsetForPoint:](self, "_maxAllowableVerticalOffsetForPoint:", x, y);
    LOBYTE(v8) = v10 - v11 > v9;
  }
  return v8;
}

- (BOOL)_isLocationOutOfBounds:(CGPoint)a3
{
  return -[CSHorizontalScrollFailureRecognizer _isOutOfBounds:forAngle:](self, "_isOutOfBounds:forAngle:", a3.x);
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)_setDebugViewsVisible:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double x;
  double y;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  SBHorizontalScrollFailureTriangleView *v19;
  SBHorizontalScrollFailureTriangleView *v20;
  SBHorizontalScrollFailureTriangleView *v21;
  SBHorizontalScrollFailureTriangleView *v22;
  NSArray *v23;
  NSArray *debugViews;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  SBHorizontalScrollFailureTriangleView *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[5];
  _BYTE v42[128];
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = self->_debugViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "removeFromSuperview");
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v7);
  }

  if (v3)
  {
    -[CSHorizontalScrollFailureRecognizer view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    x = self->_startingLocation.x;
    y = self->_startingLocation.y;
    -[CSHorizontalScrollFailureRecognizer _maxAllowableVerticalOffsetForPoint:](self, "_maxAllowableVerticalOffsetForPoint:", x, y);
    v14 = v13;
    v15 = y - v13;
    objc_msgSend(v10, "bounds");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, v15, v16, v14 + v14);
    objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v18);

    v19 = -[SBHorizontalScrollFailureTriangleView initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:]([SBHorizontalScrollFailureTriangleView alloc], "initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:", 0, self, v10, 1, x, y, v14);
    v20 = -[SBHorizontalScrollFailureTriangleView initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:]([SBHorizontalScrollFailureTriangleView alloc], "initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:", 0, self, v10, 0, x, y, v14);
    v21 = -[SBHorizontalScrollFailureTriangleView initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:]([SBHorizontalScrollFailureTriangleView alloc], "initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:", 1, self, v10, 1, x, y, v14);
    v22 = -[SBHorizontalScrollFailureTriangleView initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:]([SBHorizontalScrollFailureTriangleView alloc], "initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:", 1, self, v10, 0, x, y, v14);
    v41[0] = v17;
    v41[1] = v20;
    v31 = v19;
    v41[2] = v19;
    v41[3] = v22;
    v41[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    debugViews = self->_debugViews;
    self->_debugViews = v23;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = self->_debugViews;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v33 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          objc_msgSend(v30, "setUserInteractionEnabled:", 0);
          objc_msgSend(v10, "addSubview:", v30);
          objc_msgSend(v30, "setAlpha:", 0.5);
        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v27);
    }

  }
}

- (void)_setDebugViewsColor:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_debugViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "setContentColor:", v4);
        else
          objc_msgSend(v10, "setBackgroundColor:", v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)allowMultiTouch
{
  return self->_allowMultiTouch;
}

- (void)setAllowMultiTouch:(BOOL)a3
{
  self->_allowMultiTouch = a3;
}

- (unint64_t)maxAllowableVerticalOffset
{
  return self->_maxAllowableVerticalOffset;
}

- (void)setMaxAllowableVerticalOffset:(unint64_t)a3
{
  self->_maxAllowableVerticalOffset = a3;
}

- (double)maxAllowedTopAngle
{
  return self->_maxAllowedTopAngle;
}

- (void)setMaxAllowedTopAngle:(double)a3
{
  self->_maxAllowedTopAngle = a3;
}

- (double)minAllowedTopAngle
{
  return self->_minAllowedTopAngle;
}

- (void)setMinAllowedTopAngle:(double)a3
{
  self->_minAllowedTopAngle = a3;
}

- (double)maxAllowedBottomAngle
{
  return self->_maxAllowedBottomAngle;
}

- (void)setMaxAllowedBottomAngle:(double)a3
{
  self->_maxAllowedBottomAngle = a3;
}

- (double)minAllowedBottomAngle
{
  return self->_minAllowedBottomAngle;
}

- (void)setMinAllowedBottomAngle:(double)a3
{
  self->_minAllowedBottomAngle = a3;
}

- (BOOL)viewDebugArea
{
  return self->_viewDebugArea;
}

- (void)setViewDebugArea:(BOOL)a3
{
  self->_viewDebugArea = a3;
}

- (UIEvent)triggeredEvent
{
  return self->_triggeredEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggeredEvent, 0);
  objc_storeStrong((id *)&self->_debugViews, 0);
  objc_storeStrong((id *)&self->_touches, 0);
}

- (void)_recognizeForMultiTouchIfNecessary:(void *)a1 .cold.1(void **a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __stringsFromTouches(*a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_1D0337000, v3, v4, "HorizontalScrollFailureRecognizer - begining recognition for multi-touch: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_10();
}

- (void)_averagePointFromTouches
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  NSStringFromCGPoint(*(CGPoint *)&a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_1D0337000, v3, v4, "FAILURE RECOGNIZER - averagePointFromTouches: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_10();
}

@end
