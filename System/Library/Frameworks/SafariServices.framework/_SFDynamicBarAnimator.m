@implementation _SFDynamicBarAnimator

- (int64_t)targetState
{
  return self->_targetTopBarHeight != self->_topBarHeightForState[0];
}

- (void)attemptTransitionToState:(int64_t)a3 animated:(BOOL)a4
{
  double *topBarHeightForState;

  if (-[_SFDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:"))
  {
    self->_didHideOrShowBarsExplicitly = 1;
    topBarHeightForState = self->_topBarHeightForState;
    self->_targetTopBarHeight = self->_topBarHeightForState[a3];
    if (!a4)
    {
      self->_lastUnroundedTopBarHeight = topBarHeightForState[a3];
      self->_unroundedTopBarHeight = topBarHeightForState[a3];
    }
    -[_SFDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
}

- (BOOL)canTransitionToState:(int64_t)a3
{
  return -[_SFDynamicBarAnimator _canTransitionToState:withMinimumTopBarHeight:](self, "_canTransitionToState:withMinimumTopBarHeight:", a3, self->_minimumTopBarHeight);
}

- (BOOL)_canTransitionToState:(int64_t)a3 withMinimumTopBarHeight:(double)a4
{
  double *v4;
  double v5;

  v4 = (double *)(&self->super.isa + a3);
  -[_SFDynamicBarAnimator _constrainTopBarHeight:withMinimumTopBarHeight:](self, "_constrainTopBarHeight:withMinimumTopBarHeight:", v4[1], a4);
  return v5 == v4[1];
}

- (void)_updateOutputs
{
  double bottomBarOffset;
  double topBarHeight;
  int64_t state;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  int v11;
  char v12;
  _BOOL8 v13;
  NSPointerArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id WeakRetained;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_performingBatchUpdates)
  {
    topBarHeight = self->_topBarHeight;
    bottomBarOffset = self->_bottomBarOffset;
    state = self->_state;
    -[_SFDynamicBarAnimator _constrainTopBarHeight:](self, "_constrainTopBarHeight:", self->_unroundedTopBarHeight);
    self->_unroundedTopBarHeight = v6;
    -[_SFDynamicBarAnimator _constrainTopBarHeight:](self, "_constrainTopBarHeight:", self->_targetTopBarHeight);
    self->_targetTopBarHeight = v7;
    if (!self->_dragging && v7 != self->_topBarHeightForState[0])
      self->_targetTopBarHeight = self->_topBarHeightForState[1];
    _SFRoundFloatToPixels();
    self->_topBarHeight = v8;
    -[_SFDynamicBarAnimator _updateDisplayLink](self, "_updateDisplayLink");
    -[_SFDynamicBarAnimator _bottomBarOffsetForTopBarHeight:](self, "_bottomBarOffsetForTopBarHeight:", self->_unroundedTopBarHeight);
    _SFRoundFloatToPixels();
    self->_bottomBarOffset = v9;
    if (_SFEqualWithEpsilon())
      v10 = _SFEqualWithEpsilon();
    else
      v10 = 0;
    v11 = _SFEqualWithEpsilon();
    if (v11)
      v11 = _SFEqualWithEpsilon();
    self->_state = v10 ^ 1u;
    v12 = v10 | v11;
    v13 = (v10 | v11) == 1 && self->_displayLink == 0;
    -[_SFDynamicBarAnimator _setInSteadyState:](self, "_setInSteadyState:", v13);
    if (state != self->_state)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = self->_stateObservers;
      v15 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v19, "dynamicBarAnimatorStateDidChange:", self, (_QWORD)v21);
          }
          v16 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v16);
      }

    }
    if (topBarHeight != self->_topBarHeight || bottomBarOffset != self->_bottomBarOffset || state != self->_state)
    {
      self->_sendingOutputsDidChange = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "dynamicBarAnimatorOutputsDidChange:", self);

      self->_sendingOutputsDidChange = 0;
      if ((v12 & 1) == 0 && !self->_dragging && !self->_displayLink)
        -[_SFDynamicBarAnimator _transitionToSteadyState](self, "_transitionToSteadyState");
    }
  }
}

- (double)_constrainTopBarHeight:(double)a3 withMinimumTopBarHeight:(double)a4
{
  return fmin(fmax(a3, fmax(a4, self->_topBarHeightForState[0])), self->_topBarHeightForState[1]);
}

- (double)_constrainTopBarHeight:(double)a3
{
  double result;

  -[_SFDynamicBarAnimator _constrainTopBarHeight:withMinimumTopBarHeight:](self, "_constrainTopBarHeight:withMinimumTopBarHeight:", a3, self->_minimumTopBarHeight);
  return result;
}

- (void)_updateDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *v4;
  double unroundedTopBarHeight;
  CADisplayLink *v6;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  void *v9;
  CAFrameRateRange v10;

  if (vabdd_f64(self->_topBarHeight, self->_targetTopBarHeight) >= 0.1
    || vabdd_f64(self->_lastUnroundedTopBarHeight, self->_unroundedTopBarHeight) >= 10.0)
  {
    if (self->_displayLink)
      return;
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
    v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v6;

    v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v10.minimum, *(double *)&v10.maximum, *(double *)&v10.preferred);
    -[CADisplayLink setHighFrameRateReason:](self->_displayLink, "setHighFrameRateReason:", 1638405);
    v8 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

    unroundedTopBarHeight = self->_unroundedTopBarHeight;
  }
  else
  {
    v3 = self->_displayLink;
    if (!v3)
      return;
    -[CADisplayLink invalidate](v3, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

    unroundedTopBarHeight = self->_topBarHeight;
    self->_targetTopBarHeight = unroundedTopBarHeight;
    self->_unroundedTopBarHeight = unroundedTopBarHeight;
  }
  self->_lastUnroundedTopBarHeight = unroundedTopBarHeight;
}

- (void)_setInSteadyState:(BOOL)a3
{
  _BOOL4 v3;
  NSPointerArray *v5;
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
  if (((!self->_inSteadyState ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_inSteadyState = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_stateObservers;
    v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          if (v3)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v10, "dynamicBarAnimatorWillEnterSteadyState:", self);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v10, "dynamicBarAnimatorWillLeaveSteadyState:", self, (_QWORD)v11);
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (double)_bottomBarOffsetForTopBarHeight:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v4 = self->_topBarHeightForState[0];
  v5 = self->_topBarHeightForState[1];
  v7 = self->_bottomBarOffsetForState[0];
  v6 = self->_bottomBarOffsetForState[1];
  if ((_SFEqualWithEpsilon() & 1) != 0)
    return v6;
  else
    return (a3 - v4) / (v5 - v4) * v6 + (1.0 - (a3 - v4) / (v5 - v4)) * v7;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      -[_SFDynamicBarAnimator removeObserver:](self, "removeObserver:", WeakRetained);
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj)
      -[_SFDynamicBarAnimator addObserver:](self, "addObserver:");
  }

}

- (void)addObserver:(id)a3
{
  -[NSPointerArray addPointer:](self->_stateObservers, "addPointer:", a3);
}

- (_SFDynamicBarAnimator)init
{
  _SFDynamicBarAnimator *v2;
  _SFDynamicBarAnimator *v3;
  uint64_t v4;
  NSPointerArray *stateObservers;
  _SFDynamicBarAnimator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFDynamicBarAnimator;
  v2 = -[_SFDynamicBarAnimator init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 1;
    v2->_inSteadyState = 1;
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v4 = objc_claimAutoreleasedReturnValue();
    stateObservers = v3->_stateObservers;
    v3->_stateObservers = (NSPointerArray *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_SFDynamicBarAnimator;
  -[_SFDynamicBarAnimator dealloc](&v2, sel_dealloc);
}

- (void)removeObserver:(id)a3
{
  NSPointerArray *stateObservers;
  id v5;
  void *v6;
  uint64_t v7;

  stateObservers = self->_stateObservers;
  v5 = a3;
  -[NSPointerArray compact](stateObservers, "compact");
  -[NSPointerArray allObjects](self->_stateObservers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  -[NSPointerArray removePointerAtIndex:](self->_stateObservers, "removePointerAtIndex:", v7);
}

- (void)_moveBarsWithDelta:(double)a3
{
  double unroundedTopBarHeight;
  double v6;
  double v7;
  double v8;

  unroundedTopBarHeight = self->_unroundedTopBarHeight;
  v6 = self->_targetTopBarHeight - a3;
  self->_targetTopBarHeight = v6;
  v7 = self->_topBarHeightForState[1] - self->_topBarHeightForState[0];
  v8 = vabdd_f64(unroundedTopBarHeight, v6);
  self->_unroundedTopBarHeight = unroundedTopBarHeight - exp(-(v8 * 3.0 / v7 * (v8 * 3.0 / v7))) * a3;
  -[_SFDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
}

- (void)_transitionToSteadyState
{
  BOOL v3;
  uint64_t v4;

  if (self->_topBarHeight >= self->_topBarHeightForState[1] * 0.9
    || (v3 = -[_SFDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:", 0), v4 = 0, !v3))
  {
    v4 = 1;
  }
  -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self, "attemptTransitionToState:animated:", v4, 1);
}

- (BOOL)isInSteadyState
{
  return self->_inSteadyState;
}

- (void)_displayLinkFired:(id)a3
{
  double unroundedTopBarHeight;
  double v5;

  objc_msgSend(a3, "duration");
  unroundedTopBarHeight = self->_unroundedTopBarHeight;
  self->_unroundedTopBarHeight = unroundedTopBarHeight
                               - ((self->_lastUnroundedTopBarHeight - unroundedTopBarHeight) / v5
                                + ((self->_lastUnroundedTopBarHeight - unroundedTopBarHeight) / v5 * -50.0
                                 + (unroundedTopBarHeight - self->_targetTopBarHeight) * 900.0)
                                * v5)
                               * v5;
  self->_lastUnroundedTopBarHeight = unroundedTopBarHeight;
  -[_SFDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
}

- (void)beginDraggingWithOffset:(double)a3
{
  if (!self->_ignoresDragging)
  {
    self->_dragging = 1;
    *(_WORD *)&self->_didHideBarsByMoving = 0;
    self->_lastOffset = a3;
  }
}

- (void)updateDraggingWithOffset:(double)a3
{
  double v5;
  double v6;
  id WeakRetained;
  int v8;

  if (self->_dragging)
  {
    if (self->_state == 1 && !self->_didHideOrShowBarsExplicitly)
    {
      v5 = a3 - self->_lastOffset;
      v6 = fmax(self->_topBarHeight - self->_topBarHeightForState[0] - v5, 0.0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_msgSend(WeakRetained, "dynamicBarAnimator:canTransitionToState:byDraggingWithOffset:", self, 0, v6);

      if (v8)
      {
        -[_SFDynamicBarAnimator _moveBarsWithDelta:](self, "_moveBarsWithDelta:", v5);
        if (!self->_state)
          self->_didHideBarsByMoving = 1;
      }
    }
    self->_lastOffset = a3;
  }
}

- (void)endDraggingWithTargetOffset:(double)a3 velocity:(double)a4
{
  id WeakRetained;
  double v8;
  double v9;

  if (!self->_ignoresDragging)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dynamicBarAnimator:minimumTopBarHeightForOffset:", self, a3);
    v9 = v8;

    if (a4 <= 0.0
      || -[_SFDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:", 0)
      || !-[_SFDynamicBarAnimator _canTransitionToState:withMinimumTopBarHeight:](self, "_canTransitionToState:withMinimumTopBarHeight:", 0, v9))
    {
      -[_SFDynamicBarAnimator _endDraggingWithVelocity:](self, "_endDraggingWithVelocity:", a4);
    }
  }
}

- (void)endScrolling
{
  if (self->_dragging)
    -[_SFDynamicBarAnimator _endDraggingWithVelocity:](self, "_endDraggingWithVelocity:", 0.0);
}

- (void)_endDraggingWithVelocity:(double)a3
{
  _SFDynamicBarAnimator *v4;
  uint64_t v5;
  id WeakRetained;
  int v7;

  self->_dragging = 0;
  if (self->_didHideOrShowBarsExplicitly)
  {
    if (!-[_SFDynamicBarAnimator targetState](self, "targetState", a3)
      && -[_SFDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:", 0))
    {
      v4 = self;
      v5 = 0;
LABEL_8:
      -[_SFDynamicBarAnimator attemptTransitionToState:animated:](v4, "attemptTransitionToState:animated:", v5, 1);
      return;
    }
LABEL_7:
    v4 = self;
    v5 = 1;
    goto LABEL_8;
  }
  if (a3 < -250.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_msgSend(WeakRetained, "dynamicBarAnimator:canTransitionToState:byDraggingWithOffset:", self, 1, self->_lastOffset);

    if (v7)
      goto LABEL_7;
  }
  -[_SFDynamicBarAnimator _transitionToSteadyState](self, "_transitionToSteadyState");
}

- (void)performBatchUpdates:(id)a3
{
  self->_performingBatchUpdates = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_performingBatchUpdates = 0;
  -[_SFDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
}

- (void)setTopBarHeight:(double)a3 forState:(int64_t)a4
{
  if (self->_topBarHeightForState[a4] != a3)
  {
    self->_topBarHeightForState[a4] = a3;
    if (self->_state == a4 && !self->_displayLink)
    {
      self->_unroundedTopBarHeight = a3;
      self->_lastUnroundedTopBarHeight = a3;
      self->_targetTopBarHeight = a3;
      -[_SFDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
    }
  }
}

- (void)setBottomBarOffset:(double)a3 forState:(int64_t)a4
{
  if (self->_bottomBarOffsetForState[a4] != a3)
  {
    self->_bottomBarOffsetForState[a4] = a3;
    if (self->_state == a4)
      -[_SFDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
}

- (void)setMinimumTopBarHeight:(double)a3
{
  if (self->_minimumTopBarHeight != a3)
  {
    self->_minimumTopBarHeight = a3;
    -[_SFDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
}

- (BOOL)isTrackingDrag
{
  return self->_dragging;
}

- (int64_t)state
{
  return self->_state;
}

- (double)topBarHeight
{
  return self->_topBarHeight;
}

- (double)bottomBarOffset
{
  return self->_bottomBarOffset;
}

- (BOOL)isSendingOutputsDidChange
{
  return self->_sendingOutputsDidChange;
}

- (BOOL)ignoresDragging
{
  return self->_ignoresDragging;
}

- (void)setIgnoresDragging:(BOOL)a3
{
  self->_ignoresDragging = a3;
}

- (double)minimumTopBarHeight
{
  return self->_minimumTopBarHeight;
}

- (_SFDynamicBarAnimatorDelegate)delegate
{
  return (_SFDynamicBarAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
