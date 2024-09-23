@implementation SUUIDynamicBarAnimator

- (SUUIDynamicBarAnimator)init
{
  SUUIDynamicBarAnimator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIDynamicBarAnimator;
  result = -[SUUIDynamicBarAnimator init](&v3, sel_init);
  if (result)
  {
    result->_state = 1;
    result->_inSteadyState = 1;
  }
  return result;
}

- (void)dealloc
{
  __assert_rtn("-[SUUIDynamicBarAnimator dealloc]", "SUUIDynamicBarAnimator.m", 61, "!_displayLink");
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
  -[SUUIDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
}

- (void)attemptTransitionToState:(int64_t)a3 animated:(BOOL)a4
{
  if ((unint64_t)a3 >= 2)
    -[SUUIDynamicBarAnimator attemptTransitionToState:animated:].cold.1();
  if (-[SUUIDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:"))
  {
    self->_didHideOrShowBarsExplicitly = 1;
    self->_targetTopBarHeight = self->_topBarHeightForState[a3];
    if (!a4)
      self->_unroundedTopBarHeight = self->_topBarHeightForState[a3];
    -[SUUIDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
}

- (void)_transitionToSteadyState
{
  BOOL v3;
  uint64_t v4;

  if (self->_topBarHeight >= self->_topBarHeightForState[1] * 0.9
    || (v3 = -[SUUIDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:", 0), v4 = 0, !v3))
  {
    v4 = 1;
  }
  -[SUUIDynamicBarAnimator attemptTransitionToState:animated:](self, "attemptTransitionToState:animated:", v4, 1);
}

- (double)_bottomBarOffsetForTopBarHeight:(double)a3
{
  double v3;

  v3 = (a3 - self->_topBarHeightForState[0]) / (self->_topBarHeightForState[1] - self->_topBarHeightForState[0]);
  return v3 * self->_bottomBarOffsetForState[1] + (1.0 - v3) * self->_bottomBarOffsetForState[0];
}

- (double)_topBarHeightForBottomBarOffset:(double)a3
{
  double v3;

  v3 = (a3 - self->_bottomBarOffsetForState[0])
     / (self->_bottomBarOffsetForState[1] - self->_bottomBarOffsetForState[0]);
  return v3 * self->_topBarHeightForState[1] + (1.0 - v3) * self->_topBarHeightForState[0];
}

- (void)_updateOutputs
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v10;
  _BOOL8 v11;
  int64_t v12;
  id WeakRetained;

  -[SUUIDynamicBarAnimator _constrainTopBarHeight:](self, "_constrainTopBarHeight:", self->_unroundedTopBarHeight);
  self->_unroundedTopBarHeight = v3;
  -[SUUIDynamicBarAnimator _constrainTopBarHeight:](self, "_constrainTopBarHeight:", self->_targetTopBarHeight);
  self->_targetTopBarHeight = v4;
  if (!self->_dragging && v4 != self->_topBarHeightForState[0])
    self->_targetTopBarHeight = self->_topBarHeightForState[1];
  -[SUUIDynamicBarAnimator _updateDisplayLink](self, "_updateDisplayLink");
  v5 = __40__SUUIDynamicBarAnimator__updateOutputs__block_invoke(self->_unroundedTopBarHeight);
  -[SUUIDynamicBarAnimator _bottomBarOffsetForTopBarHeight:](self, "_bottomBarOffsetForTopBarHeight:", self->_unroundedTopBarHeight);
  v7 = __40__SUUIDynamicBarAnimator__updateOutputs__block_invoke(v6);
  v8 = v7 == self->_bottomBarOffsetForState[0] && v5 == self->_topBarHeightForState[0];
  v9 = v7 == self->_bottomBarOffsetForState[1] && v5 == self->_topBarHeightForState[1];
  v10 = v8 || v9;
  v11 = (v8 || v9) && self->_displayLink == 0;
  -[SUUIDynamicBarAnimator _setInSteadyState:](self, "_setInSteadyState:", v11);
  v12 = !v8;
  if (v5 != self->_topBarHeight || v7 != self->_bottomBarOffset || self->_state != v12)
  {
    self->_state = v12;
    self->_topBarHeight = v5;
    self->_bottomBarOffset = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dynamicBarAnimatorDidUpdate:", self);

    if (!v10 && !self->_dragging && !self->_displayLink)
      -[SUUIDynamicBarAnimator _transitionToSteadyState](self, "_transitionToSteadyState");
  }
}

double __40__SUUIDynamicBarAnimator__updateOutputs__block_invoke(double a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return round(v4 * a1) / v4;
}

- (void)_setInSteadyState:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;

  if (self->_inSteadyState != a3)
  {
    v3 = a3;
    self->_inSteadyState = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "dynamicBarAnimatorWillEnterSteadyState:", self);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "dynamicBarAnimatorWillLeaveSteadyState:", self);
    }

  }
}

- (int64_t)targetState
{
  return self->_targetTopBarHeight != self->_topBarHeightForState[0];
}

- (BOOL)canTransitionToState:(int64_t)a3
{
  double *v3;
  double v4;

  if ((unint64_t)a3 >= 2)
    -[SUUIDynamicBarAnimator canTransitionToState:].cold.1();
  v3 = (double *)(&self->super.isa + a3);
  -[SUUIDynamicBarAnimator _constrainTopBarHeight:](self, "_constrainTopBarHeight:", v3[1]);
  return v4 == v3[1];
}

- (double)_constrainTopBarHeight:(double)a3
{
  double minimumTopBarHeight;
  double result;

  minimumTopBarHeight = self->_minimumTopBarHeight;
  -[SUUIDynamicBarAnimator _topBarHeightForBottomBarOffset:](self, "_topBarHeightForBottomBarOffset:", self->_maximumBottomBarOffset);
  if (minimumTopBarHeight >= result)
    result = minimumTopBarHeight;
  if (result < self->_topBarHeightForState[0])
    result = self->_topBarHeightForState[0];
  if (result <= a3)
    result = a3;
  if (result >= self->_topBarHeightForState[1])
    return self->_topBarHeightForState[1];
  return result;
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
  -[SUUIDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
}

- (void)_updateDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *v4;
  double topBarHeight;
  CADisplayLink *v6;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  void *v9;

  if (vabdd_f64(self->_topBarHeight, self->_targetTopBarHeight) >= 0.1
    || vabdd_f64(self->_lastUnroundedTopBarHeight, self->_unroundedTopBarHeight) >= 10.0)
  {
    if (!self->_displayLink)
    {
      objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
      v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v6;

      v8 = self->_displayLink;
      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x24BDBCB80]);

      self->_lastUnroundedTopBarHeight = self->_unroundedTopBarHeight;
    }
  }
  else
  {
    v3 = self->_displayLink;
    if (v3)
    {
      -[CADisplayLink invalidate](v3, "invalidate");
      v4 = self->_displayLink;
      self->_displayLink = 0;

      topBarHeight = self->_topBarHeight;
      self->_targetTopBarHeight = topBarHeight;
      self->_unroundedTopBarHeight = topBarHeight;
      self->_lastUnroundedTopBarHeight = topBarHeight;
      -[SUUIDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
    }
  }
}

- (void)beginDraggingWithOffset:(double)a3
{
  self->_dragging = 1;
  *(_WORD *)&self->_didHideBarsByMoving = 0;
  self->_lastOffset = a3;
}

- (void)updateDraggingWithOffset:(double)a3
{
  double v5;
  double v6;
  id WeakRetained;
  int v8;

  if (self->_state == 1 && !self->_didHideOrShowBarsExplicitly)
  {
    v5 = a3 - self->_lastOffset;
    v6 = fmax(self->_topBarHeight - self->_topBarHeightForState[0] - v5, 0.0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(WeakRetained, "dynamicBarAnimator:canHideBarsByDraggingWithOffset:", self, v6);

    if (v8)
    {
      -[SUUIDynamicBarAnimator _moveBarsWithDelta:](self, "_moveBarsWithDelta:", v5);
      if (!self->_state)
        self->_didHideBarsByMoving = 1;
    }
  }
  self->_lastOffset = a3;
}

- (void)endDraggingWithTargetOffset:(double)a3 velocity:(double)a4
{
  SUUIDynamicBarAnimator *v5;
  uint64_t v6;

  self->_dragging = 0;
  if (self->_didHideOrShowBarsExplicitly)
  {
    if (!-[SUUIDynamicBarAnimator targetState](self, "targetState", a3, a4)
      && -[SUUIDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:", 0))
    {
      v5 = self;
      v6 = 0;
LABEL_7:
      -[SUUIDynamicBarAnimator attemptTransitionToState:animated:](v5, "attemptTransitionToState:animated:", v6, 1);
      return;
    }
LABEL_6:
    v5 = self;
    v6 = 1;
    goto LABEL_7;
  }
  if (a4 < -250.0)
    goto LABEL_6;
  -[SUUIDynamicBarAnimator _transitionToSteadyState](self, "_transitionToSteadyState");
}

- (void)setTopBarHeight:(double)a3 forState:(int64_t)a4
{
  if ((unint64_t)a4 >= 2)
    -[SUUIDynamicBarAnimator setTopBarHeight:forState:].cold.1();
  if (self->_topBarHeightForState[a4] != a3)
  {
    self->_topBarHeightForState[a4] = a3;
    if (self->_state == a4)
    {
      self->_targetTopBarHeight = a3;
      self->_unroundedTopBarHeight = a3;
      -[SUUIDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
    }
  }
}

- (void)setBottomBarOffset:(double)a3 forState:(int64_t)a4
{
  if ((unint64_t)a4 >= 2)
    -[SUUIDynamicBarAnimator setBottomBarOffset:forState:].cold.1();
  if (self->_bottomBarOffsetForState[a4] != a3)
  {
    self->_bottomBarOffsetForState[a4] = a3;
    if (self->_state == a4)
      -[SUUIDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
}

- (void)setMinimumTopBarHeight:(double)a3
{
  if (self->_minimumTopBarHeight != a3)
  {
    self->_minimumTopBarHeight = a3;
    -[SUUIDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
}

- (void)setMaximumBottomBarOffset:(double)a3
{
  if (self->_maximumBottomBarOffset != a3)
  {
    self->_maximumBottomBarOffset = a3;
    -[SUUIDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
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

- (double)minimumTopBarHeight
{
  return self->_minimumTopBarHeight;
}

- (double)maximumBottomBarOffset
{
  return self->_maximumBottomBarOffset;
}

- (SUUIDynamicBarAnimatorDelegate)delegate
{
  return (SUUIDynamicBarAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)attemptTransitionToState:animated:.cold.1()
{
  __assert_rtn("-[SUUIDynamicBarAnimator attemptTransitionToState:animated:]", "SUUIDynamicBarAnimator.m", 78, "state < _SUUIDynamicBarAnimatorNumberOfStates");
}

- (void)canTransitionToState:.cold.1()
{
  __assert_rtn("-[SUUIDynamicBarAnimator canTransitionToState:]", "SUUIDynamicBarAnimator.m", 173, "state < _SUUIDynamicBarAnimatorNumberOfStates");
}

- (void)setTopBarHeight:forState:.cold.1()
{
  __assert_rtn("-[SUUIDynamicBarAnimator setTopBarHeight:forState:]", "SUUIDynamicBarAnimator.m", 263, "state < _SUUIDynamicBarAnimatorNumberOfStates");
}

- (void)setBottomBarOffset:forState:.cold.1()
{
  __assert_rtn("-[SUUIDynamicBarAnimator setBottomBarOffset:forState:]", "SUUIDynamicBarAnimator.m", 275, "state < _SUUIDynamicBarAnimatorNumberOfStates");
}

@end
