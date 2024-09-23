@implementation PKTextInputDrawingGestureRecognizer

- (PKTextInputDrawingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  PKTextInputDrawingGestureRecognizer *v4;
  PKTextInputDrawingGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKTextInputDrawingGestureRecognizer;
  v4 = -[PKTextInputDrawingGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PKTextInputDrawingGestureRecognizer setDelaysTouchesBegan:](v4, "setDelaysTouchesBegan:", 1);
    -[PKTextInputDrawingGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 1);
    -[PKTextInputDrawingGestureRecognizer setRequiresExclusiveTouchType:](v5, "setRequiresExclusiveTouchType:", 1);
    -[PKTextInputDrawingGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &unk_1E77ECEE0);
  }
  return v5;
}

- (void)setState:(int64_t)a3
{
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  id gestureEnvironmentResetTimeoutBlock;
  id v12;
  dispatch_block_t v13;
  id v14;
  dispatch_time_t v15;
  _QWORD block[4];
  id v17;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
  v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5 > 5)
      v9 = 0;
    else
      v9 = off_1E777DAE8[v5];
    if ((unint64_t)a3 > 5)
      v10 = 0;
    else
      v10 = off_1E777DAE8[a3];
    *(_DWORD *)buf = 134218498;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_INFO, "Gesture touch %p changing state: %@ -> %@", buf, 0x20u);

  }
  v18.receiver = self;
  v18.super_class = (Class)PKTextInputDrawingGestureRecognizer;
  -[PKTextInputDrawingGestureRecognizer setState:](&v18, sel_setState_, a3);
  if (v5 != a3)
  {
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    gestureEnvironmentResetTimeoutBlock = self->_gestureEnvironmentResetTimeoutBlock;
    if (gestureEnvironmentResetTimeoutBlock)
    {
      dispatch_block_cancel(gestureEnvironmentResetTimeoutBlock);
      v12 = self->_gestureEnvironmentResetTimeoutBlock;
      self->_gestureEnvironmentResetTimeoutBlock = 0;

    }
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__PKTextInputDrawingGestureRecognizer_setState___block_invoke;
      block[3] = &unk_1E7777588;
      objc_copyWeak(&v17, (id *)buf);
      v13 = dispatch_block_create((dispatch_block_flags_t)0, block);
      v14 = self->_gestureEnvironmentResetTimeoutBlock;
      self->_gestureEnvironmentResetTimeoutBlock = v13;

      v15 = dispatch_time(0, 500000000);
      dispatch_after(v15, MEMORY[0x1E0C80D38], self->_gestureEnvironmentResetTimeoutBlock);
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __48__PKTextInputDrawingGestureRecognizer_setState___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "state") == 5 || objc_msgSend(v2, "state") == 3)
    {
      if (objc_msgSend(v2, "state") == 3)
      {
        v3 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v5 = 0;
          _os_log_fault_impl(&dword_1BE213000, v3, OS_LOG_TYPE_FAULT, "Stuck gesture environment after moving to Ended detected", v5, 2u);
        }

      }
      objc_msgSend(v2, "_cancelOrFailGesture");
    }
    v4 = (void *)v2[43];
    v2[43] = 0;

  }
}

- (void)finishedElementFindingWithElement:(id)a3 candidateElements:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
    if (v10 > 5)
      v11 = 0;
    else
      v11 = off_1E777DAE8[v10];
    v12 = 134218754;
    v13 = v9;
    v14 = 2048;
    v15 = v6;
    v16 = 2048;
    v17 = v7;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Gesture touch %p finishedElementFindingWithElement: %p, candidateElements: %p state: %@", (uint8_t *)&v12, 0x2Au);

  }
  if (self->_waitingForTargetElementSearch)
  {
    -[PKTextInputDrawingGestureRecognizer setTargetElement:](self, "setTargetElement:", v6);
    -[PKTextInputDrawingGestureRecognizer _updatePanStateForCandidateElements:](self, "_updatePanStateForCandidateElements:", v7);
    self->_waitingForTargetElementSearch = 0;
    -[PKTextInputDrawingGestureRecognizer _evaluateMovingToBeganStateUseTimestampFromTouch:](self, "_evaluateMovingToBeganStateUseTimestampFromTouch:", 0);
    -[PKTextInputDrawingGestureRecognizer _updateStrokeAcceptanceStateUseTimestampFromTouch:](self, "_updateStrokeAcceptanceStateUseTimestampFromTouch:", 0);
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }

}

- (CGPoint)locationInView:(id)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (a3 && self->_drawingTouch)
  {
    -[UITouch PK_locationInView:](self->_drawingTouch, "PK_locationInView:");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKTextInputDrawingGestureRecognizer;
    -[PKTextInputDrawingGestureRecognizer locationInView:](&v5, sel_locationInView_);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)_distanceFromStartPositionForTouch:(id)a3
{
  double x;
  double y;
  double v5;
  double v6;

  x = self->_drawTouchStartPoint.x;
  y = self->_drawTouchStartPoint.y;
  objc_msgSend(a3, "locationInView:", 0);
  return sqrt((y - v6) * (y - v6) + (x - v5) * (x - v5));
}

- (double)timeIntervalSinceStartOfGesture
{
  double v3;

  if (!self->_drawingTouch)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return v3 - self->_drawStartTime;
}

- (double)timeIntervalSinceTouchesBeganForTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_drawingTouch)
    {
      objc_msgSend(v4, "timestamp");
      v7 = v6 - self->_touchesBeganTimestamp;
    }
    else
    {
      v7 = 0.0;
    }
  }
  else
  {
    -[PKTextInputDrawingGestureRecognizer timeIntervalSinceStartOfGesture](self, "timeIntervalSinceStartOfGesture");
    v7 = v8;
  }

  return v7;
}

- (BOOL)_gestureStartedInsideTargetElement
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
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGRect v25;

  -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputElement coordinateSpace]((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKTextInputElement frame]((uint64_t)v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputElement coordinateSpace]((uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDrawingGestureRecognizer view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v14, v16, v6, v8, v10, v12);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v25.origin.x = v17;
  v25.origin.y = v19;
  v25.size.width = v21;
  v25.size.height = v23;
  return CGRectContainsPoint(v25, self->_drawTouchStartPoint);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKTextInputDrawingGestureRecognizer;
  -[PKTextInputDrawingGestureRecognizer description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKTextInputDebugStateIntrospector debugStateLineDescriptionForIntrospectable:](PKTextInputDebugStateIntrospector, "debugStateLineDescriptionForIntrospectable:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)hasMovedPastTapUseTimestampFromTouch:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingGestureTapDetectionDistanceThreshold");
  v7 = v6;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawingGestureTapDetectionTimeInterval");
  v10 = v9;

  -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDrawingGestureRecognizer _distanceFromStartPositionForTouch:](self, "_distanceFromStartPositionForTouch:", v11);
  v13 = v12;

  if (-[PKTextInputDrawingGestureRecognizer _gestureStartedInsideTargetElement](self, "_gestureStartedInsideTargetElement"))
  {
    v14 = v10 + -v10 / (v7 * v7) * (v13 * v13);
    if (a3)
    {
      -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDrawingGestureRecognizer timeIntervalSinceTouchesBeganForTouch:](self, "timeIntervalSinceTouchesBeganForTouch:", v15);
      v17 = v16;

    }
    else
    {
      -[PKTextInputDrawingGestureRecognizer timeIntervalSinceTouchesBeganForTouch:](self, "timeIntervalSinceTouchesBeganForTouch:", 0);
      v17 = v19;
    }
    v18 = v17 <= v14;
  }
  else
  {
    v18 = v13 <= v7;
  }
  return !v18;
}

- (void)_enumerateTouchesForUpdateWithEvent:(id)a3 block:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    objc_msgSend(a3, "coalescedTouchesForTouch:", self->_drawingTouch);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
    else
    {
      ((void (**)(id, UITouch *))v6)[2](v6, self->_drawingTouch);
    }

  }
}

- (void)_setLongPressState:(int64_t)a3
{
  void *v4;

  if (self->_longPressState != a3)
  {
    self->_longPressState = a3;
    -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "drawingGestureRecognizerLongPressStateDidChange:", self);

    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }
}

- (BOOL)_isValidLongPress
{
  void *v3;
  BOOL v4;

  if ((unint64_t)(-[PKTextInputDrawingGestureRecognizer longPressState](self, "longPressState") - 1) > 1)
    return 0;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawingGestureLongPressDetectionTimeInterval");
  v4 = -[PKTextInputDrawingGestureRecognizer _isValidLongPressOverDuration:](self, "_isValidLongPressOverDuration:");

  return v4;
}

- (BOOL)_isWithinLongPressDistanceForTouch:(id)a3
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[PKTextInputDrawingGestureRecognizer _distanceFromStartPositionForTouch:](self, "_distanceFromStartPositionForTouch:", a3);
  v4 = v3;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingGestureLongPressMaxDistance");
  v7 = v6;

  return v4 <= v7;
}

- (BOOL)_isValidLongPressOverDuration:(double)a3
{
  void *v5;
  BOOL v6;
  double v7;

  -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKTextInputDrawingGestureRecognizer _isWithinLongPressDistanceForTouch:](self, "_isWithinLongPressDistanceForTouch:", v5);

  -[PKTextInputDrawingGestureRecognizer timeIntervalSinceStartOfGesture](self, "timeIntervalSinceStartOfGesture");
  return v7 > a3 && v6;
}

- (void)_scheduleLongPressTimerBlocks
{
  uint64_t v3;
  dispatch_block_t v4;
  id longPressTentativeBlock;
  dispatch_block_t v6;
  id longPressSuccessBlock;
  void *v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  dispatch_time_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id location;

  -[PKTextInputDrawingGestureRecognizer _cancelLongPressTimerBlocks](self, "_cancelLongPressTimerBlocks");
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKTextInputDrawingGestureRecognizer__scheduleLongPressTimerBlocks__block_invoke;
  block[3] = &unk_1E7777588;
  objc_copyWeak(&v21, &location);
  v4 = dispatch_block_create((dispatch_block_flags_t)0, block);
  longPressTentativeBlock = self->_longPressTentativeBlock;
  self->_longPressTentativeBlock = v4;

  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __68__PKTextInputDrawingGestureRecognizer__scheduleLongPressTimerBlocks__block_invoke_2;
  v18[3] = &unk_1E7777588;
  objc_copyWeak(&v19, &location);
  v6 = dispatch_block_create((dispatch_block_flags_t)0, v18);
  longPressSuccessBlock = self->_longPressSuccessBlock;
  self->_longPressSuccessBlock = v6;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawingGestureTapDetectionTimeInterval");
  v10 = v9;

  v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  dispatch_after(v11, MEMORY[0x1E0C80D38], self->_longPressTentativeBlock);
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawingGestureLongPressDetectionTimeInterval");
  v14 = v13;

  v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  v16 = self->_longPressSuccessBlock;
  v17 = (void *)MEMORY[0x1E0C80D38];
  dispatch_after(v15, MEMORY[0x1E0C80D38], v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __68__PKTextInputDrawingGestureRecognizer__scheduleLongPressTimerBlocks__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_longPressTentativeTimerFired");

}

void __68__PKTextInputDrawingGestureRecognizer__scheduleLongPressTimerBlocks__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_longPressSuccessTimerFired");

}

- (void)_longPressTentativeTimerFired
{
  id longPressTentativeBlock;
  void *v4;
  double v5;
  double v6;

  longPressTentativeBlock = self->_longPressTentativeBlock;
  self->_longPressTentativeBlock = 0;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drawingGestureTapDetectionTimeInterval");
  v6 = v5;

  if (-[PKTextInputDrawingGestureRecognizer state](self, "state") >= 1
    && -[PKTextInputDrawingGestureRecognizer state](self, "state") <= 2)
  {
    if (-[PKTextInputDrawingGestureRecognizer _isValidLongPressOverDuration:](self, "_isValidLongPressOverDuration:", v6))
    {
      -[PKTextInputDrawingGestureRecognizer _setLongPressState:](self, "_setLongPressState:", 1);
    }
  }
}

- (void)_longPressSuccessTimerFired
{
  id longPressSuccessBlock;
  uint64_t v4;

  longPressSuccessBlock = self->_longPressSuccessBlock;
  self->_longPressSuccessBlock = 0;

  if (-[PKTextInputDrawingGestureRecognizer state](self, "state") >= 1
    && -[PKTextInputDrawingGestureRecognizer state](self, "state") <= 2
    && -[PKTextInputDrawingGestureRecognizer _isValidLongPress](self, "_isValidLongPress")
    && -[PKTextInputDrawingGestureRecognizer longPressState](self, "longPressState") == 1)
  {
    v4 = 2;
  }
  else
  {
    v4 = 3;
  }
  -[PKTextInputDrawingGestureRecognizer _setLongPressState:](self, "_setLongPressState:", v4);
}

- (void)_updateLongPressValidityForTouch:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (self->_longPressSuccessBlock)
  {
    v6 = v4;
    v5 = -[PKTextInputDrawingGestureRecognizer _isWithinLongPressDistanceForTouch:](self, "_isWithinLongPressDistanceForTouch:", v4);
    v4 = v6;
    if (!v5)
    {
      -[PKTextInputDrawingGestureRecognizer _cancelLongPressTimerBlocks](self, "_cancelLongPressTimerBlocks");
      -[PKTextInputDrawingGestureRecognizer _setLongPressState:](self, "_setLongPressState:", 3);
      v4 = v6;
    }
  }

}

- (void)_cancelLongPressTimerBlocks
{
  id longPressTentativeBlock;
  id v4;
  id longPressSuccessBlock;
  id v6;

  longPressTentativeBlock = self->_longPressTentativeBlock;
  if (longPressTentativeBlock)
  {
    dispatch_block_cancel(longPressTentativeBlock);
    v4 = self->_longPressTentativeBlock;
    self->_longPressTentativeBlock = 0;

  }
  longPressSuccessBlock = self->_longPressSuccessBlock;
  if (longPressSuccessBlock)
  {
    dispatch_block_cancel(longPressSuccessBlock);
    v6 = self->_longPressSuccessBlock;
    self->_longPressSuccessBlock = 0;

  }
}

- (void)_setPanState:(int64_t)a3
{
  if (self->_panState != a3)
  {
    self->_panState = a3;
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }
}

- (BOOL)_hasMovedPastMinimumPanThresholdForTouch:(id)a3
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[PKTextInputDrawingGestureRecognizer _distanceFromStartPositionForTouch:](self, "_distanceFromStartPositionForTouch:", a3);
  v4 = v3;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingGestureMinimumPanDistanceThreshold");
  v7 = v6;

  return v4 > v7;
}

- (BOOL)_hasMovedPastScrollThresholdForTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = a3;
  -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKTextInputDrawingGestureRecognizer _distanceFromStartPositionForTouch:](self, "_distanceFromStartPositionForTouch:", v4);
    v7 = v6;
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "drawingGestureMinimumScrollDistanceThreshold");
    v10 = v9;

    v11 = v7 > v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_updatePanGestureStateForTouch:(id)a3
{
  int64_t v4;
  PKTextInputDrawingGestureRecognizer *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (!-[PKTextInputDrawingGestureRecognizer panState](self, "panState"))
  {
    if (!-[PKTextInputDrawingGestureRecognizer _hasMovedPastMinimumPanThresholdForTouch:](self, "_hasMovedPastMinimumPanThresholdForTouch:", v7))
    {
      -[PKTextInputDrawingGestureRecognizer _setPanDirection:](self, "_setPanDirection:", 0);
      goto LABEL_12;
    }
    -[PKTextInputDrawingGestureRecognizer _setPanDirection:](self, "_setPanDirection:", -[PKTextInputDrawingGestureRecognizer _panDirectionForTouch:](self, "_panDirectionForTouch:", v7));
    if (-[PKTextInputDrawingGestureRecognizer panDirection](self, "panDirection") == 1
      || -[PKTextInputDrawingGestureRecognizer panDirection](self, "panDirection") == 3)
    {
      v5 = self;
      v6 = 1;
LABEL_10:
      -[PKTextInputDrawingGestureRecognizer _setPanState:](v5, "_setPanState:", v6);
      goto LABEL_12;
    }
LABEL_9:
    v5 = self;
    v6 = 2;
    goto LABEL_10;
  }
  if (-[PKTextInputDrawingGestureRecognizer panState](self, "panState") == 1)
  {
    v4 = -[PKTextInputDrawingGestureRecognizer _panDirectionForTouch:](self, "_panDirectionForTouch:", v7);
    if (-[PKTextInputDrawingGestureRecognizer panDirection](self, "panDirection") != v4)
    {
      -[PKTextInputDrawingGestureRecognizer _setPanDirection:](self, "_setPanDirection:", 0);
      goto LABEL_9;
    }
  }
LABEL_12:
  if (-[PKTextInputDrawingGestureRecognizer state](self, "state") != 4
    && -[PKTextInputDrawingGestureRecognizer panState](self, "panState") == 1
    && -[PKTextInputDrawingGestureRecognizer _hasMovedPastScrollThresholdForTouch:](self, "_hasMovedPastScrollThresholdForTouch:", v7))
  {
    -[PKTextInputDrawingGestureRecognizer cancel](self, "cancel");
  }

}

- (int64_t)_panDirectionForTouch:(id)a3
{
  double x;
  double y;
  double v5;
  double v6;
  uint64_t v7;
  double v8;

  x = self->_drawTouchStartPoint.x;
  y = self->_drawTouchStartPoint.y;
  objc_msgSend(a3, "locationInView:", 0);
  v7 = (uint64_t)(atan2(v6 - y, v5 - x) * 57.2957795 + 90.0 + 45.0);
  v8 = fmod((double)v7, 360.0);
  if ((unint64_t)v7 <= 0x168)
    v8 = (double)v7;
  if (v8 < 0.0)
    v8 = v8 + 360.0;
  if (v8 == 0.0)
    v8 = 0.0;
  return (uint64_t)((double)(uint64_t)v8 / 90.0) + 1;
}

- (void)_updatePanStateForCandidateElements:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
    goto LABEL_19;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
  {
LABEL_18:

    goto LABEL_19;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      -[PKTextInputElement referenceView](*(id **)(*((_QWORD *)&v15 + 1) + 8 * i));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v12 = v8;
        goto LABEL_17;
      }
      v12 = v11;
      objc_msgSend(v11, "PK_enclosingScrollableScrollView", (_QWORD)v15);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v8)
      {
        if (v8 != v13)
        {

LABEL_17:
          goto LABEL_18;
        }
      }
      else
      {
        v8 = v13;
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
      continue;
    break;
  }

  if (!v8)
  {
LABEL_19:
    -[PKTextInputDrawingGestureRecognizer _setPanDirection:](self, "_setPanDirection:", 0, (_QWORD)v15);
    -[PKTextInputDrawingGestureRecognizer _setPanState:](self, "_setPanState:", 2);
    v8 = 0;
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  unint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_isReplaying)
  {
    if (self->_drawingTouch)
    {
      v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 134217984;
        v29 = v27;
        _os_log_error_impl(&dword_1BE213000, v8, OS_LOG_TYPE_ERROR, "Gesture touch %p touchesBegan called multiple times", (uint8_t *)&v28, 0xCu);

      }
      goto LABEL_26;
    }
    objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_90);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_26:

      goto LABEL_27;
    }
    -[NSObject timestamp](v8, "timestamp");
    self->_touchesBeganTimestamp = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_drawStartTime = v11;
    objc_storeStrong((id *)&self->_drawingTouch, v8);
    self->_activeInputProperties = objc_msgSend(v7, "PK_activeInputPropertiesForTouch:", v8);
    -[UITouch locationInView:](self->_drawingTouch, "locationInView:", 0);
    self->_drawTouchStartPoint.x = v12;
    self->_drawTouchStartPoint.y = v13;
    -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_requiresTargetElementToBegin = objc_msgSend(v14, "drawingGestureRecognizerRequiresTargetElementToBegin:", self);

    -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_requiresPastTapToBegin = objc_msgSend(v15, "drawingGestureRecognizerRequiresPastTapToBegin:", self);

    -[PKTextInputDrawingGestureRecognizer setTargetElement:](self, "setTargetElement:", 0);
    self->_waitingForTargetElementSearch = self->_requiresTargetElementToBegin;
    if (-[PKTextInputDrawingGestureRecognizer state](self, "state")
      || (-[PKTextInputDrawingGestureRecognizer delegate](self, "delegate"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v23,
          !v23))
    {
      v16 = 1;
    }
    else
    {
      -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "drawingGestureRecognizer:shouldBeginDrawingWithTouches:event:", self, v6, v7);

      if (!v25)
      {
        v16 = 0;
        v17 = 0;
        goto LABEL_10;
      }
      -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v26, "drawingGestureRecognizerLongPressShouldBegin:", self);

    }
    v17 = 1;
LABEL_10:
    v18 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        v20 = CFSTR("Y");
      else
        v20 = CFSTR("N");
      v21 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
      if (v21 > 5)
        v22 = 0;
      else
        v22 = off_1E777DAE8[v21];
      v28 = 134218498;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "Gesture touch %p touchesBegan, canBeginDrawing: %@, state: %@.", (uint8_t *)&v28, 0x20u);

    }
    if (v17)
    {
      -[PKTextInputDrawingGestureRecognizer _evaluateMovingToBeganStateUseTimestampFromTouch:](self, "_evaluateMovingToBeganStateUseTimestampFromTouch:", 1);
      if (v16)
        -[PKTextInputDrawingGestureRecognizer _scheduleLongPressTimerBlocks](self, "_scheduleLongPressTimerBlocks");
    }
    else
    {
      -[PKTextInputDrawingGestureRecognizer _cancelOrFailGesture](self, "_cancelOrFailGesture");
    }
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    goto LABEL_26;
  }
LABEL_27:

}

BOOL __62__PKTextInputDrawingGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v6 = a4;
  if (objc_msgSend(a3, "containsObject:", self->_drawingTouch))
  {
    if (!self->_isReplaying)
    {
      -[PKTextInputDrawingGestureRecognizer _evaluateMovingToBeganStateUseTimestampFromTouch:](self, "_evaluateMovingToBeganStateUseTimestampFromTouch:", 1);
      -[PKTextInputDrawingGestureRecognizer _drawingMoved:](self, "_drawingMoved:", v6);
      -[PKTextInputDrawingGestureRecognizer _updateStrokeAcceptanceStateUseTimestampFromTouch:](self, "_updateStrokeAcceptanceStateUseTimestampFromTouch:", 1);
      v7 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __62__PKTextInputDrawingGestureRecognizer_touchesMoved_withEvent___block_invoke;
      v9[3] = &unk_1E777DAC8;
      v9[4] = self;
      -[PKTextInputDrawingGestureRecognizer _enumerateTouchesForUpdateWithEvent:block:](self, "_enumerateTouchesForUpdateWithEvent:block:", v6, v9);
      v8[0] = v7;
      v8[1] = 3221225472;
      v8[2] = __62__PKTextInputDrawingGestureRecognizer_touchesMoved_withEvent___block_invoke_2;
      v8[3] = &unk_1E777DAC8;
      v8[4] = self;
      -[PKTextInputDrawingGestureRecognizer _enumerateTouchesForUpdateWithEvent:block:](self, "_enumerateTouchesForUpdateWithEvent:block:", v6, v8);
      if ((-[PKTextInputDrawingGestureRecognizer state](self, "state") == 1
         || -[PKTextInputDrawingGestureRecognizer state](self, "state") == 2)
        && -[PKTextInputDrawingGestureRecognizer strokeAcceptanceState](self, "strokeAcceptanceState") == 1)
      {
        -[PKTextInputDrawingGestureRecognizer _cancelScheduledStrokeAcceptanceBlock](self, "_cancelScheduledStrokeAcceptanceBlock");
        if (-[PKTextInputDrawingGestureRecognizer state](self, "state") == 1)
          -[PKTextInputDrawingGestureRecognizer setState:](self, "setState:", 2);
      }
    }
  }

}

uint64_t __62__PKTextInputDrawingGestureRecognizer_touchesMoved_withEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLongPressValidityForTouch:", a2);
}

uint64_t __62__PKTextInputDrawingGestureRecognizer_touchesMoved_withEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePanGestureStateForTouch:", a2);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  NSObject *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_isReplaying)
  {
    v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
      if (v7 > 5)
        v8 = 0;
      else
        v8 = off_1E777DAE8[v7];
      v9 = 134218242;
      v10 = v6;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Gesture touch %p touchesCancelled, state: %@. Cancelling gesture.", (uint8_t *)&v9, 0x16u);

    }
    -[PKTextInputDrawingGestureRecognizer _cancelOrFailGesture](self, "_cancelOrFailGesture");
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  unint64_t v15;
  __CFString *v16;
  const char *v17;
  int v18;
  void *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_isReplaying)
    return;
  if (!objc_msgSend(a3, "containsObject:", self->_drawingTouch, a4))
  {
    v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
      if (v13 > 5)
        v14 = 0;
      else
        v14 = off_1E777DAE8[v13];
      v18 = 134218242;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      v17 = "Gesture touch %p touchesEnded, but touches do not contain the original drawing touch, state: %@. Cancelling gesture.";
      goto LABEL_18;
    }
LABEL_19:

    -[PKTextInputDrawingGestureRecognizer _cancelOrFailGesture](self, "_cancelOrFailGesture");
    return;
  }
  -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "drawingGestureRecognizer:shouldFinishGestureWithTouch:", self, self->_drawingTouch);

    if ((v7 & 1) == 0)
    {
      v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
        if (v15 > 5)
          v16 = 0;
        else
          v16 = off_1E777DAE8[v15];
        v18 = 134218242;
        v19 = v12;
        v20 = 2112;
        v21 = v16;
        v17 = "Gesture touch %p touchesEnded, but delegate.shouldFinishGestureWithTouch: N, state: %@. Cancelling gesture.";
LABEL_18:
        _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 0x16u);

        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "drawingGestureRecognizer:touchesEndedWithDrawingTouch:", self, self->_drawingTouch);

  }
  -[PKTextInputDrawingGestureRecognizer _endDrawing](self, "_endDrawing");
}

- (void)touchesEstimatedPropertiesUpdated:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingEstimatedPropertiesUpdated:", v4);

}

- (void)_beginDrawingIfNeeded
{
  if ((!-[PKTextInputDrawingGestureRecognizer state](self, "state")
     || -[PKTextInputDrawingGestureRecognizer state](self, "state") == 1
     || -[PKTextInputDrawingGestureRecognizer state](self, "state") == 2)
    && !-[PKTextInputDrawingGestureRecognizer drawingTargetIsDrawing](self, "drawingTargetIsDrawing"))
  {
    -[PKTextInputDrawingGestureRecognizer _drawingBegan](self, "_drawingBegan");
  }
}

- (void)_evaluateMovingToBeganStateUseTimestampFromTouch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 v6;
  int v7;
  NSObject *v8;
  dispatch_block_t v9;
  id notMovingCancelBlock;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  dispatch_block_t v15;
  id timeoutBlock;
  dispatch_time_t v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD block[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _BYTE location[12];
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  if (-[PKTextInputDrawingGestureRecognizer state](self, "state"))
    return;
  if (!self->_requiresTargetElementToBegin)
  {
    v6 = -[PKTextInputDrawingGestureRecognizer hasMovedPastTapUseTimestampFromTouch:](self, "hasMovedPastTapUseTimestampFromTouch:", v3);
LABEL_6:
    v7 = !self->_requiresPastTapToBegin || v6;
    goto LABEL_9;
  }
  -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PKTextInputDrawingGestureRecognizer hasMovedPastTapUseTimestampFromTouch:](self, "hasMovedPastTapUseTimestampFromTouch:", v3);
  if (v5)
    goto LABEL_6;
  v7 = 0;
LABEL_9:
  v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("N");
    if (v7)
      v20 = CFSTR("Y");
    else
      v20 = CFSTR("N");
    if (self->_requiresTargetElementToBegin)
      v21 = CFSTR("Y");
    else
      v21 = CFSTR("N");
    -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement", v20, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v23 = CFSTR("Y");
    else
      v23 = CFSTR("N");
    if (self->_requiresPastTapToBegin)
      v24 = CFSTR("Y");
    else
      v24 = CFSTR("N");
    if (v6)
      v19 = CFSTR("Y");
    -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDrawingGestureRecognizer _distanceFromStartPositionForTouch:](self, "_distanceFromStartPositionForTouch:", v25);
    *(_DWORD *)location = 134219522;
    *(_QWORD *)&location[4] = v28;
    v34 = 2112;
    v35 = v27;
    v36 = 2112;
    v37 = v21;
    v38 = 2112;
    v39 = v23;
    v40 = 2112;
    v41 = v24;
    v42 = 2112;
    v43 = v19;
    v44 = 2048;
    v45 = v26;
    _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "Gesture touch %p evaluateMovingToBeganState shouldBegin: %@, requiresTargetElementToBegin: %@, hasTargetElement: %@, requiresPastTap: %@, hasMovedPastTap: %@, movedDistance: %0.2f", location, 0x48u);

  }
  if (v7)
  {
    -[PKTextInputDrawingGestureRecognizer setState:](self, "setState:", 1);
    if (-[PKTextInputDrawingGestureRecognizer state](self, "state") == 5)
    {
      -[PKTextInputDrawingGestureRecognizer _cancelOrFailGesture](self, "_cancelOrFailGesture");
    }
    else
    {
      -[PKTextInputDrawingGestureRecognizer _beginDrawingIfNeeded](self, "_beginDrawingIfNeeded");
      -[PKTextInputDrawingGestureRecognizer _updateStrokeAcceptanceStateUseTimestampFromTouch:](self, "_updateStrokeAcceptanceStateUseTimestampFromTouch:", 1);
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "asyncElementRequestTimeout");
      v14 = v13;

      if (!-[PKTextInputDrawingGestureRecognizer strokeAcceptanceState](self, "strokeAcceptanceState")
        && !self->_timeoutBlock
        && v14 > 0.0)
      {
        objc_initWeak((id *)location, self);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __88__PKTextInputDrawingGestureRecognizer__evaluateMovingToBeganStateUseTimestampFromTouch___block_invoke;
        v31[3] = &unk_1E7777588;
        objc_copyWeak(&v32, (id *)location);
        v15 = dispatch_block_create((dispatch_block_flags_t)0, v31);
        timeoutBlock = self->_timeoutBlock;
        self->_timeoutBlock = v15;

        v17 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
        dispatch_after(v17, MEMORY[0x1E0C80D38], self->_timeoutBlock);
        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)location);
      }
    }
    -[PKTextInputDrawingGestureRecognizer _cancelNotMovingCancellationBlock](self, "_cancelNotMovingCancellationBlock");
  }
  else if (!self->_notMovingCancelBlock)
  {
    objc_initWeak((id *)location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__PKTextInputDrawingGestureRecognizer__evaluateMovingToBeganStateUseTimestampFromTouch___block_invoke_2;
    block[3] = &unk_1E7777588;
    objc_copyWeak(&v30, (id *)location);
    v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
    notMovingCancelBlock = self->_notMovingCancelBlock;
    self->_notMovingCancelBlock = v9;

    v11 = dispatch_time(0, 500000000);
    dispatch_after(v11, MEMORY[0x1E0C80D38], self->_notMovingCancelBlock);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }
}

void __88__PKTextInputDrawingGestureRecognizer__evaluateMovingToBeganStateUseTimestampFromTouch___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_acceptStrokeTimeoutTriggered");

}

void __88__PKTextInputDrawingGestureRecognizer__evaluateMovingToBeganStateUseTimestampFromTouch___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateCancelIfNotMoving");

}

- (void)_updateStrokeAcceptanceStateUseTimestampFromTouch:(BOOL)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  char v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  int v29;
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  double v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!-[PKTextInputDrawingGestureRecognizer strokeAcceptanceState](self, "strokeAcceptanceState"))
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKTextInputDrawingGestureRecognizer state](self, "state") == 1
      || -[PKTextInputDrawingGestureRecognizer state](self, "state") == 2)
    {
      if (!self->_requiresTargetElementToBegin
        || (-[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v6,
            v6))
      {
        v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (self->_requiresTargetElementToBegin)
            v9 = CFSTR("Y");
          else
            v9 = CFSTR("N");
          -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 134218498;
          if (v10)
            v11 = CFSTR("Y");
          else
            v11 = CFSTR("N");
          v30 = v8;
          v31 = 2112;
          v32 = v9;
          v33 = 2112;
          v34 = v11;
          _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Gesture touch %p updateStrokeAcceptanceState acceping stroke, requiresElement: %@, hasElement: %@", (uint8_t *)&v29, 0x20u);

        }
        v12 = 1;
        goto LABEL_42;
      }
    }
    if (self->_requiresTargetElementToBegin)
    {
      if (self->_waitingForTargetElementSearch)
      {
        v13 = 0;
LABEL_21:
        -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16 != 0;

        goto LABEL_22;
      }
      -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15 == 0;

      if (self->_requiresTargetElementToBegin)
        goto LABEL_21;
    }
    else
    {
      v13 = 0;
    }
    v14 = 1;
LABEL_22:
    if (a3)
    {
      -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDrawingGestureRecognizer timeIntervalSinceTouchesBeganForTouch:](self, "timeIntervalSinceTouchesBeganForTouch:", v17);
      v19 = v18;

    }
    else
    {
      -[PKTextInputDrawingGestureRecognizer timeIntervalSinceTouchesBeganForTouch:](self, "timeIntervalSinceTouchesBeganForTouch:", 0);
      v19 = v20;
    }
    objc_msgSend(v5, "asyncElementRequestTimeout");
    v22 = v21;
    v23 = v19 <= v21 || v14;
    if (!v13 && (v23 & 1) != 0)
      goto LABEL_43;
    v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v25 = CFSTR("Y");
      else
        v25 = CFSTR("N");
      if (v14)
        v26 = CFSTR("Y");
      else
        v26 = CFSTR("N");
      if (v19 > v22)
        v27 = CFSTR("Y");
      else
        v27 = CFSTR("N");
      objc_msgSend(v5, "asyncElementRequestTimeout");
      v29 = 134219266;
      v30 = v24;
      v31 = 2112;
      v32 = v25;
      v33 = 2112;
      v34 = v26;
      v35 = 2112;
      v36 = v27;
      v37 = 2048;
      v38 = v19;
      v39 = 2048;
      v40 = v28;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Gesture touch %p updateStrokeAcceptanceState rejecting stroke. targetSearchFailed: %@, targetSearchSatisfied: %@, targetSearchTimedOut: %@, timeSinceStart: %0.3f, cancelTime: %0.3f", (uint8_t *)&v29, 0x3Eu);

    }
    v12 = 2;
LABEL_42:

    -[PKTextInputDrawingGestureRecognizer _setStrokeAcceptanceState:](self, "_setStrokeAcceptanceState:", v12);
LABEL_43:

  }
}

- (void)_setStrokeAcceptanceState:(int64_t)a3
{
  void *v4;

  if (self->_strokeAcceptanceState != a3)
  {
    self->_strokeAcceptanceState = a3;
    if (a3)
    {
      -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "drawingGestureStrokeAcceptanceStateDidChange:", self);

    }
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }
}

- (void)_evaluateCancelIfNotMoving
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PKTextInputDrawingGestureRecognizer _cancelNotMovingCancellationBlock](self, "_cancelNotMovingCancellationBlock");
  if (self->_requiresPastTapToBegin
    && !-[PKTextInputDrawingGestureRecognizer state](self, "state")
    && !-[PKTextInputDrawingGestureRecognizer hasMovedPastTapUseTimestampFromTouch:](self, "hasMovedPastTapUseTimestampFromTouch:", 0)&& !-[PKTextInputDrawingGestureRecognizer _gestureStartedInsideTargetElement](self, "_gestureStartedInsideTargetElement"))
  {
    v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDrawingGestureRecognizer timeIntervalSinceTouchesBeganForTouch:](self, "timeIntervalSinceTouchesBeganForTouch:", v5);
      v7 = v6;
      v8 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
      if (v8 > 5)
        v9 = 0;
      else
        v9 = off_1E777DAE8[v8];
      v10 = 134218498;
      v11 = v4;
      v12 = 2048;
      v13 = v7;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Gesture touch %p Cancelling gesture because it hasn't moved past tap (outside of target) after %0.2fs, state: %@.", (uint8_t *)&v10, 0x20u);

    }
    -[PKTextInputDrawingGestureRecognizer cancel](self, "cancel");
  }
}

- (void)_cancelNotMovingCancellationBlock
{
  id notMovingCancelBlock;
  id v4;

  notMovingCancelBlock = self->_notMovingCancelBlock;
  if (notMovingCancelBlock)
  {
    dispatch_block_cancel(notMovingCancelBlock);
    v4 = self->_notMovingCancelBlock;
    self->_notMovingCancelBlock = 0;

  }
}

- (void)_cancelScheduledStrokeAcceptanceBlock
{
  id timeoutBlock;
  id v4;

  timeoutBlock = self->_timeoutBlock;
  if (timeoutBlock)
  {
    dispatch_block_cancel(timeoutBlock);
    v4 = self->_timeoutBlock;
    self->_timeoutBlock = 0;

  }
}

- (void)_acceptStrokeTimeoutTriggered
{
  -[PKTextInputDrawingGestureRecognizer _cancelScheduledStrokeAcceptanceBlock](self, "_cancelScheduledStrokeAcceptanceBlock");
  -[PKTextInputDrawingGestureRecognizer _updateStrokeAcceptanceStateUseTimestampFromTouch:](self, "_updateStrokeAcceptanceStateUseTimestampFromTouch:", 0);
}

- (void)_cancelOrFailGesture
{
  uint64_t v3;

  if (-[PKTextInputDrawingGestureRecognizer state](self, "state"))
    v3 = 4;
  else
    v3 = 5;
  -[PKTextInputDrawingGestureRecognizer setState:](self, "setState:", v3);
  if (self->_drawingTargetIsDrawing)
    -[PKTextInputDrawingGestureRecognizer cancelDrawing](self, "cancelDrawing");
  -[PKTextInputDrawingGestureRecognizer _cancelLongPressTimerBlocks](self, "_cancelLongPressTimerBlocks");
  -[PKTextInputDrawingGestureRecognizer _setLongPressState:](self, "_setLongPressState:", 3);
}

- (void)_endDrawing
{
  -[PKTextInputDrawingGestureRecognizer setState:](self, "setState:", 3);
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[PKTextInputDrawingGestureRecognizer state](self, "state") != 5
    && -[PKTextInputDrawingGestureRecognizer state](self, "state") != 4)
  {
    v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134218240;
      v6 = v4;
      v7 = 2048;
      v8 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Gesture touch %p cancel called, state: %ld. Cancelling gesture.", (uint8_t *)&v5, 0x16u);

    }
    -[PKTextInputDrawingGestureRecognizer _cancelOrFailGesture](self, "_cancelOrFailGesture");
  }
}

- (void)reset
{
  id gestureEnvironmentResetTimeoutBlock;
  id v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  unint64_t v8;
  __CFString *v9;
  uint64_t v10;
  UITouch *drawingTouch;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  gestureEnvironmentResetTimeoutBlock = self->_gestureEnvironmentResetTimeoutBlock;
  if (gestureEnvironmentResetTimeoutBlock)
  {
    dispatch_block_cancel(gestureEnvironmentResetTimeoutBlock);
    v4 = self->_gestureEnvironmentResetTimeoutBlock;
    self->_gestureEnvironmentResetTimeoutBlock = 0;

  }
  v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKTextInputDrawingGestureRecognizer drawingTouch](self, "drawingTouch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_drawingTargetIsDrawing)
      v7 = CFSTR("Y");
    else
      v7 = CFSTR("N");
    v8 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
    if (v8 > 5)
      v9 = 0;
    else
      v9 = off_1E777DAE8[v8];
    v12 = 134218498;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Gesture touch %p reset, drawingTargetIsDrawing: %@, state: %@", (uint8_t *)&v12, 0x20u);

  }
  v10 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
  if (self->_drawingTargetIsDrawing)
  {
    if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 4
      || -[PKTextInputDrawingGestureRecognizer strokeAcceptanceState](self, "strokeAcceptanceState") != 1)
    {
      -[PKTextInputDrawingGestureRecognizer cancelDrawing](self, "cancelDrawing");
    }
    else
    {
      -[PKTextInputDrawingGestureRecognizer _drawingEnded](self, "_drawingEnded");
    }
  }
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_drawingTargetIsDrawing = 0;
  self->_strokeAcceptanceState = 0;
  -[PKTextInputDrawingGestureRecognizer setTargetElement:](self, "setTargetElement:", 0);
  self->_waitingForTargetElementSearch = 0;
  self->_requiresTargetElementToBegin = 0;
  self->_requiresPastTapToBegin = 0;
  -[PKTextInputDrawingGestureRecognizer _cancelScheduledStrokeAcceptanceBlock](self, "_cancelScheduledStrokeAcceptanceBlock");
  -[PKTextInputDrawingGestureRecognizer _cancelNotMovingCancellationBlock](self, "_cancelNotMovingCancellationBlock");
  -[PKTextInputDrawingGestureRecognizer _cancelLongPressTimerBlocks](self, "_cancelLongPressTimerBlocks");
  -[PKTextInputDrawingGestureRecognizer _setLongPressState:](self, "_setLongPressState:", 0);
  -[PKTextInputDrawingGestureRecognizer _setPanState:](self, "_setPanState:", 0);
  -[PKTextInputDrawingGestureRecognizer _setPanDirection:](self, "_setPanDirection:", 0);
  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
}

+ (id)_systemGestureClassesToAvoid
{
  if (_MergedGlobals_23 != -1)
    dispatch_once(&_MergedGlobals_23, &__block_literal_global_22_0);
  return (id)qword_1EF560540;
}

void __67__PKTextInputDrawingGestureRecognizer__systemGestureClassesToAvoid__block_invoke()
{
  Class v0;
  Class v1;
  Class v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v0 = NSClassFromString(CFSTR("_UITouchDurationObservingGestureRecognizer"));
  if (v0)
    objc_msgSend(v6, "addObject:", v0);
  v1 = NSClassFromString(CFSTR("_UISystemGestureGateGestureRecognizer"));
  if (v1)
    objc_msgSend(v6, "addObject:", v1);
  v2 = NSClassFromString(CFSTR("_UIRelationshipGestureRecognizer"));
  v3 = v6;
  if (v2)
  {
    objc_msgSend(v6, "addObject:");
    v3 = v6;
  }
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)qword_1EF560540;
  qword_1EF560540 = v4;

}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend((id)objc_opt_class(), "_systemGestureClassesToAvoid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v4);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    objc_msgSend(v3, "name");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v9 == CFSTR("com.apple.PencilKit.tapGestureFailure"))
    {
      v16 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = 1;
      goto LABEL_22;
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "view", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gestureRecognizers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (!v11)
    {
      v16 = 1;
      goto LABEL_21;
    }
    v12 = v11;
    v13 = *(_QWORD *)v19;
LABEL_13:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "name");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v15 == CFSTR("com.apple.PencilKit.tapGestureFailure"))
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        v16 = 1;
        if (v12)
          goto LABEL_13;
        goto LABEL_21;
      }
    }
  }
  v16 = 0;
LABEL_21:

LABEL_22:
  return v16;
}

- (void)_setDrawingTargetIsDrawing:(BOOL)a3
{
  id v4;

  if (self->_drawingTargetIsDrawing != a3)
  {
    self->_drawingTargetIsDrawing = a3;
    -[PKTextInputDrawingGestureRecognizer delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "drawingGestureRecognizerDrawingTargetIsDrawingDidChange:", self);

  }
}

- (void)_drawingBegan
{
  void *v3;

  if (!self->_drawingTargetIsDrawing)
  {
    -[PKTextInputDrawingGestureRecognizer _setDrawingTargetIsDrawing:](self, "_setDrawingTargetIsDrawing:", 1);
    -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "drawingBegan:", self->_drawingTouch);

    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }
}

- (void)_drawingMoved:(id)a3
{
  id v4;
  id v5;

  if (self->_drawingTargetIsDrawing)
  {
    v4 = a3;
    -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "drawingMoved:withEvent:", self->_drawingTouch, v4);

  }
}

- (void)_drawingEnded
{
  void *v3;

  if (self->_drawingTargetIsDrawing)
  {
    -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "drawingEnded:", self->_drawingTouch);

    -[PKTextInputDrawingGestureRecognizer _setDrawingTargetIsDrawing:](self, "_setDrawingTargetIsDrawing:", 0);
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }
}

- (void)cancelDrawing
{
  void *v3;

  if (self->_drawingTargetIsDrawing)
  {
    -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "drawingCancelled");

    -[PKTextInputDrawingGestureRecognizer _setDrawingTargetIsDrawing:](self, "_setDrawingTargetIsDrawing:", 0);
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }
}

- (void)reportDebugStateDescription:(id)a3
{
  unint64_t v4;
  __CFString *v5;
  const __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  unint64_t v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  unint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void (**v20)(id, const __CFString *, __CFString *);

  v20 = (void (**)(id, const __CFString *, __CFString *))a3;
  v4 = -[PKTextInputDrawingGestureRecognizer state](self, "state");
  if (v4 > 5)
    v5 = 0;
  else
    v5 = off_1E777DAE8[v4];
  v20[2](v20, CFSTR("Gesture state"), v5);
  if (-[PKTextInputDrawingGestureRecognizer drawingTargetIsDrawing](self, "drawingTargetIsDrawing"))
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  v20[2](v20, CFSTR("drawingTargetIsDrawing"), (__CFString *)v6);
  v7 = -[PKTextInputDrawingGestureRecognizer strokeAcceptanceState](self, "strokeAcceptanceState");
  if (v7 > 2)
    v8 = 0;
  else
    v8 = off_1E777DB18[v7];
  v20[2](v20, CFSTR("strokeAcceptanceState"), v8);
  v9 = -[PKTextInputDrawingGestureRecognizer longPressState](self, "longPressState");
  if (v9 > 3)
    v10 = 0;
  else
    v10 = off_1E777DB30[v9];
  v20[2](v20, CFSTR("longPressState"), v10);
  v11 = -[PKTextInputDrawingGestureRecognizer panState](self, "panState");
  if (v11 > 2)
    v12 = 0;
  else
    v12 = off_1E777DB50[v11];
  v20[2](v20, CFSTR("panState"), v12);
  v13 = -[PKTextInputDrawingGestureRecognizer panDirection](self, "panDirection");
  if (v13 > 4)
    v14 = 0;
  else
    v14 = off_1E777DB68[v13];
  v20[2](v20, CFSTR("panDirection"), v14);
  if (self->_requiresTargetElementToBegin)
    v15 = CFSTR("Yes");
  else
    v15 = CFSTR("No");
  v20[2](v20, CFSTR("requiresTargetElementToBegin"), (__CFString *)v15);
  if (self->_requiresPastTapToBegin)
    v16 = CFSTR("Yes");
  else
    v16 = CFSTR("No");
  v20[2](v20, CFSTR("requiresPastTapToBegin"), (__CFString *)v16);
  if (self->_waitingForTargetElementSearch)
    v17 = CFSTR("Yes");
  else
    v17 = CFSTR("No");
  v20[2](v20, CFSTR("waitingForTargetElementSearch"), (__CFString *)v17);
  -[PKTextInputDrawingGestureRecognizer targetElement](self, "targetElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = CFSTR("Yes");
  else
    v19 = CFSTR("No");
  v20[2](v20, CFSTR("hasTargetElement"), (__CFString *)v19);

}

- (void)_replayDrawingBegan:(id *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[8];

  -[PKTextInputDrawingGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var9;
  v10[4] = *(_OWORD *)&a3->var7;
  v10[5] = v6;
  v7 = *(_OWORD *)&a3->var13;
  v10[6] = *(_OWORD *)&a3->var11;
  v10[7] = v7;
  v8 = *(_OWORD *)&a3->var1;
  v10[0] = a3->var0;
  v10[1] = v8;
  v9 = *(_OWORD *)&a3->var5;
  v10[2] = *(_OWORD *)&a3->var3;
  v10[3] = v9;
  -[PKTextInputDrawingGestureRecognizer _replayDrawingBegan:coordinateSpace:activeInputProperties:inputType:](self, "_replayDrawingBegan:coordinateSpace:activeInputProperties:inputType:", v10, v5, 23, 1);

}

- (void)_replayDrawingBegan:(id *)a3 coordinateSpace:(id)a4 activeInputProperties:(unint64_t)a5 inputType:(int64_t)a6
{
  id v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[8];

  v10 = a4;
  -[PKTextInputDrawingGestureRecognizer setIsReplaying:](self, "setIsReplaying:", 1);
  -[PKTextInputDrawingGestureRecognizer _setDrawingTargetIsDrawing:](self, "_setDrawingTargetIsDrawing:", 1);
  -[PKTextInputDrawingGestureRecognizer _setStrokeAcceptanceState:](self, "_setStrokeAcceptanceState:", 1);
  -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_OWORD *)&a3->var9;
    v18[4] = *(_OWORD *)&a3->var7;
    v18[5] = v14;
    v15 = *(_OWORD *)&a3->var13;
    v18[6] = *(_OWORD *)&a3->var11;
    v18[7] = v15;
    v16 = *(_OWORD *)&a3->var1;
    v18[0] = a3->var0;
    v18[1] = v16;
    v17 = *(_OWORD *)&a3->var5;
    v18[2] = *(_OWORD *)&a3->var3;
    v18[3] = v17;
    objc_msgSend(v13, "_replayDrawingBegan:coordinateSpace:activeInputProperties:inputType:", v18, v10, a5, a6);

  }
}

- (void)_replayDrawingMoved:(id *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[8];

  -[PKTextInputDrawingGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var9;
  v10[4] = *(_OWORD *)&a3->var7;
  v10[5] = v6;
  v7 = *(_OWORD *)&a3->var13;
  v10[6] = *(_OWORD *)&a3->var11;
  v10[7] = v7;
  v8 = *(_OWORD *)&a3->var1;
  v10[0] = a3->var0;
  v10[1] = v8;
  v9 = *(_OWORD *)&a3->var5;
  v10[2] = *(_OWORD *)&a3->var3;
  v10[3] = v9;
  -[PKTextInputDrawingGestureRecognizer _replayDrawingMoved:coordinateSpace:](self, "_replayDrawingMoved:coordinateSpace:", v10, v5);

}

- (void)_replayDrawingMoved:(id *)a3 coordinateSpace:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];

  v6 = a4;
  -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)&a3->var9;
    v14[4] = *(_OWORD *)&a3->var7;
    v14[5] = v10;
    v11 = *(_OWORD *)&a3->var13;
    v14[6] = *(_OWORD *)&a3->var11;
    v14[7] = v11;
    v12 = *(_OWORD *)&a3->var1;
    v14[0] = a3->var0;
    v14[1] = v12;
    v13 = *(_OWORD *)&a3->var5;
    v14[2] = *(_OWORD *)&a3->var3;
    v14[3] = v13;
    objc_msgSend(v9, "_replayDrawingMoved:coordinateSpace:", v14, v6);

  }
}

- (void)_replayDrawingEnded
{
  void *v3;
  char v4;
  void *v5;

  if (-[PKTextInputDrawingGestureRecognizer drawingTargetIsDrawing](self, "drawingTargetIsDrawing"))
  {
    -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_replayDrawingEnded");

    }
    -[PKTextInputDrawingGestureRecognizer _setDrawingTargetIsDrawing:](self, "_setDrawingTargetIsDrawing:", 0);
  }
  -[PKTextInputDrawingGestureRecognizer setIsReplaying:](self, "setIsReplaying:", 0);
  -[PKTextInputDrawingGestureRecognizer reset](self, "reset");
}

- (void)_replayDrawingCancelled
{
  void *v3;
  char v4;
  void *v5;

  if (-[PKTextInputDrawingGestureRecognizer isReplaying](self, "isReplaying"))
  {
    -[PKTextInputDrawingGestureRecognizer cancel](self, "cancel");
    if (-[PKTextInputDrawingGestureRecognizer drawingTargetIsDrawing](self, "drawingTargetIsDrawing"))
    {
      -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) != 0)
      {
        -[PKTextInputDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_replayDrawingCancelled");

      }
      -[PKTextInputDrawingGestureRecognizer _setDrawingTargetIsDrawing:](self, "_setDrawingTargetIsDrawing:", 0);
    }
    -[PKTextInputDrawingGestureRecognizer setIsReplaying:](self, "setIsReplaying:", 0);
  }
  -[PKTextInputDrawingGestureRecognizer reset](self, "reset");
}

- (unint64_t)activeInputProperties
{
  return self->_activeInputProperties;
}

- (PKDrawingGestureTarget)drawingTarget
{
  return (PKDrawingGestureTarget *)objc_loadWeakRetained((id *)&self->drawingTarget);
}

- (void)setDrawingTarget:(id)a3
{
  objc_storeWeak((id *)&self->drawingTarget, a3);
}

- (BOOL)drawingTargetIsDrawing
{
  return self->_drawingTargetIsDrawing;
}

- (int64_t)strokeAcceptanceState
{
  return self->_strokeAcceptanceState;
}

- (int64_t)longPressState
{
  return self->_longPressState;
}

- (PKTextInputElement)targetElement
{
  return self->_targetElement;
}

- (void)setTargetElement:(id)a3
{
  objc_storeStrong((id *)&self->_targetElement, a3);
}

- (BOOL)isReplaying
{
  return self->_isReplaying;
}

- (void)setIsReplaying:(BOOL)a3
{
  self->_isReplaying = a3;
}

- (UITouch)drawingTouch
{
  return self->_drawingTouch;
}

- (void)setDrawingTouch:(id)a3
{
  objc_storeStrong((id *)&self->_drawingTouch, a3);
}

- (int64_t)panState
{
  return self->_panState;
}

- (int64_t)panDirection
{
  return self->_panDirection;
}

- (void)_setPanDirection:(int64_t)a3
{
  self->_panDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingTouch, 0);
  objc_storeStrong((id *)&self->_targetElement, 0);
  objc_destroyWeak((id *)&self->drawingTarget);
  objc_storeStrong(&self->_gestureEnvironmentResetTimeoutBlock, 0);
  objc_storeStrong(&self->_notMovingCancelBlock, 0);
  objc_storeStrong(&self->_longPressSuccessBlock, 0);
  objc_storeStrong(&self->_longPressTentativeBlock, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);
}

@end
