@implementation BSUIScrollView

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  _QWORD v8[5];
  id v9[3];
  BOOL v10;
  id location;

  y = a3.y;
  x = a3.x;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__BSUIScrollView_setContentOffset_animated___block_invoke;
  v8[3] = &unk_1E4349148;
  objc_copyWeak(v9, &location);
  v10 = a4;
  v9[1] = *(id *)&x;
  v9[2] = *(id *)&y;
  v8[4] = self;
  -[BSUIScrollView _setContentOffset:withBlock:](self, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_notifyDidScroll
{
  void *v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  objc_super v10;

  self->_didScroll = 1;
  -[BSUIScrollView _setScrolling:]((uint64_t)self, 1);
  v10.receiver = self;
  v10.super_class = (Class)BSUIScrollView;
  -[BSUIScrollView _notifyDidScroll](&v10, sel__notifyDidScroll);
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  -[BSUIScrollView currentScrollContext](self, "currentScrollContext");
  v4 = v7;
  v5 = v8;
  v6 = v9;
  -[BSUIScrollView _bs_didScrollWithContext:](self, "_bs_didScrollWithContext:", &v4);
  -[BSUIScrollView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v7;
    v5 = v8;
    v6 = v9;
    objc_msgSend(v3, "scrollViewDidScroll:withContext:", self, &v4);
  }
  -[BSUIScrollView _updateScrolling](self);

}

- (void)_setScrolling:(uint64_t)a1
{
  char v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(id, uint64_t);

  if (a1)
  {
    v2 = a2;
    if (*(unsigned __int8 *)(a1 + 2120) != a2)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend((id)a1, "_bs_willBeginScrolling");
        objc_msgSend((id)a1, "delegate");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "scrollViewWillBeginScrolling:", a1);

      }
      else if (*(_BYTE *)(a1 + 2073))
      {
        return;
      }
      *(_BYTE *)(a1 + 2120) = v2;
      objc_msgSend((id)a1, "contentOffset");
      *(_QWORD *)(a1 + 2104) = v4;
      *(_QWORD *)(a1 + 2112) = v5;
      if ((v2 & 1) == 0)
      {
        v9 = (void (**)(id, uint64_t))MEMORY[0x1A1AF63A8](*(_QWORD *)(a1 + 2080));
        v6 = *(void **)(a1 + 2080);
        *(_QWORD *)(a1 + 2080) = 0;

        objc_msgSend((id)a1, "_bs_didEndScrolling");
        objc_msgSend((id)a1, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "scrollViewDidEndScrolling:", a1);
        if (v9)
          v9[2](v9, 1);

      }
    }
  }
}

- (BSUIScrollViewDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSUIScrollView;
  -[BSUIScrollView delegate](&v3, sel_delegate);
  return (BSUIScrollViewDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- ($57C6A38B097B1DD8ADCFE6DE7C16ED39)currentScrollContext
{
  $57C6A38B097B1DD8ADCFE6DE7C16ED39 *v3;
  int64_t v5;

  v3 = self;
  retstr->var2.y = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.y = 0u;
  if (self
    && (self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)-[$57C6A38B097B1DD8ADCFE6DE7C16ED39 isScrolling](self, "isScrolling"), (_DWORD)self))
  {
    self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)-[$57C6A38B097B1DD8ADCFE6DE7C16ED39 isDragging](v3, "isDragging");
    if ((self & 1) != 0
      || (self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)-[$57C6A38B097B1DD8ADCFE6DE7C16ED39 isTracking](v3, "isTracking"),
          (self & 1) != 0))
    {
      v5 = 3;
    }
    else
    {
      self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)-[$57C6A38B097B1DD8ADCFE6DE7C16ED39 isScrollAnimating](v3, "isScrollAnimating");
      if ((self & 1) != 0)
      {
        v5 = 2;
      }
      else
      {
        self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)-[$57C6A38B097B1DD8ADCFE6DE7C16ED39 isDecelerating](v3, "isDecelerating");
        v5 = 1;
        if ((_DWORD)self)
          v5 = 2;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  retstr->var0 = v5;
  retstr->var1 = v3[52].var1;
  retstr->var2 = v3[52].var2;
  return self;
}

- (void)setContentOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint *p_previousContentOffset;
  CGFloat v7;
  CGFloat v8;
  _QWORD v9[7];

  y = a3.y;
  x = a3.x;
  p_previousContentOffset = &self->_previousContentOffset;
  -[BSUIScrollView contentOffset](self, "contentOffset");
  p_previousContentOffset->x = v7;
  p_previousContentOffset->y = v8;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__BSUIScrollView_setContentOffset___block_invoke;
  v9[3] = &unk_1E4349120;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  v9[4] = self;
  -[BSUIScrollView _setContentOffset:withBlock:](self, v9);
}

- (void)_setContentOffset:(_BYTE *)a1 withBlock:(void *)a2
{
  int v3;
  int v4;
  void *v5;
  void (**v6)(void);

  v6 = a2;
  if (a1)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__setContentOffset_withBlock_, a1, CFSTR("BSUIScrollView.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

    }
    objc_msgSend(a1, "contentOffset");
    v3 = BSPointEqualToPoint();
    v4 = objc_msgSend(a1, "isScrolling") | v3;
    if ((v4 & 1) == 0)
      -[BSUIScrollView _setScrolling:]((uint64_t)a1, 1);
    v6[2]();
    if (!v4)
      goto LABEL_10;
    if (v3)
    {
      if (a1[2075])
      {
        -[BSUIScrollView _callScrollCompletionIfNecessary](a1);
        goto LABEL_11;
      }
LABEL_10:
      -[BSUIScrollView _updateScrolling](a1);
    }
  }
LABEL_11:

}

- (void)_updateScrolling
{
  int v2;

  if (a1)
  {
    if ((objc_msgSend(a1, "isDragging") & 1) != 0 || (objc_msgSend(a1, "isDecelerating") & 1) != 0)
      v2 = 1;
    else
      v2 = objc_msgSend(a1, "isScrollAnimating");
    -[BSUIScrollView _setScrolling:]((uint64_t)a1, v2);
    -[BSUIScrollView _callScrollCompletionIfNecessary](a1);
  }
}

- (BOOL)isScrolling
{
  return self->_scrolling;
}

id __35__BSUIScrollView_setContentOffset___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)BSUIScrollView;
  return objc_msgSendSuper2(&v2, sel_setContentOffset_, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id __44__BSUIScrollView_setContentOffset_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[BSUIScrollView _setCurrentContentOffsetImmediatelyIfScrollInterruptionAnimated:]((uint64_t)WeakRetained, *(_BYTE *)(a1 + 64));

  v3 = *(unsigned __int8 *)(a1 + 64);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)BSUIScrollView;
  return objc_msgSendSuper2(&v5, sel_setContentOffset_animated_, v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (uint64_t)_setCurrentContentOffsetImmediatelyIfScrollInterruptionAnimated:(uint64_t)result
{
  _BYTE *v3;
  objc_super v4;

  if (result)
  {
    v3 = (_BYTE *)result;
    result = objc_msgSend((id)result, "isScrolling");
    v3[2073] = result & a2;
    if (v3[2073])
    {
      objc_msgSend(v3, "contentOffset");
      v4.receiver = v3;
      v4.super_class = (Class)BSUIScrollView;
      result = (uint64_t)objc_msgSendSuper2(&v4, sel_setContentOffset_animated_, 0);
      v3[2073] = 0;
    }
  }
  return result;
}

- (BSUIScrollView)initWithFrame:(CGRect)a3
{
  BSUIScrollView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUIScrollView;
  v3 = -[BSUIScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__willBeginDraggingNotification_, *MEMORY[0x1E0CEC188], v3);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__didEndDraggingNotification_, *MEMORY[0x1E0CEC178], v3);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__didDidEndDeceleratingNotification_, *MEMORY[0x1E0CEC170], v3);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__didEndScrollAnimationNotification_, CFSTR("_UIScrollViewAnimationEndedNotification"), v3);

  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSUIScrollView;
  -[BSUIScrollView setDelegate:](&v3, sel_setDelegate_, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BSUIScrollView;
  -[BSUIScrollView dealloc](&v4, sel_dealloc);
}

- (BOOL)setContentOffset:(CGPoint)a3 animated:(BOOL)a4 completion:(id)a5
{
  return -[BSUIScrollView _setContentOffset:animated:withAnimation:completion:]((uint64_t)self, a4, 0, a5, a3.x, a3.y);
}

- (uint64_t)_setContentOffset:(void *)a3 animated:(void *)a4 withAnimation:(double)a5 completion:(double)a6
{
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (a1)
  {
    v14 = (unint64_t)v12;
    v15 = MEMORY[0x1A1AF63A8](*(_QWORD *)(a1 + 2080));
    v16 = (void *)v15;
    if (v14 | v15)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __39__BSUIScrollView__setScrollCompletion___block_invoke;
      v23 = &unk_1E4349198;
      v24 = (id)v15;
      v25 = (id)v14;
      v17 = objc_msgSend(&v20, "copy");
      v18 = *(void **)(a1 + 2080);
      *(_QWORD *)(a1 + 2080) = v17;

    }
    *(_BYTE *)(a1 + 2074) = 0;
    if (v11 && (_DWORD)a2)
      objc_msgSend((id)a1, "_setContentOffset:animation:", v11, a5, a6);
    else
      objc_msgSend((id)a1, "setContentOffset:animated:", a2, a5, a6, v20, v21, v22, v23);
    if (*(_BYTE *)(a1 + 2074))
      a1 = 1;
    else
      a1 = objc_msgSend((id)a1, "isScrolling");
  }

  return a1;
}

- (BOOL)setContentOffset:(CGPoint)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = v9;
    v12 = v11;
    if (self)
    {
      if (objc_msgSend(v11, "isSpringAnimation"))
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CD2848]);
        objc_msgSend(v12, "mass");
        objc_msgSend(v13, "setMass:");
        objc_msgSend(v12, "stiffness");
        objc_msgSend(v13, "setStiffness:");
        objc_msgSend(v12, "damping");
        objc_msgSend(v13, "setDamping:");
        objc_msgSend(v12, "epsilon");
        objc_msgSend(v13, "durationForEpsilon:");
        objc_msgSend(v13, "setDuration:");
      }
      else
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CD2710]);
        objc_msgSend(v12, "duration");
        objc_msgSend(v13, "setDuration:");
        objc_msgSend(v12, "speed");
        objc_msgSend(v13, "setSpeed:");
      }
      objc_msgSend(v12, "timingFunction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTimingFunction:", v14);

    }
    else
    {
      v13 = 0;
    }

    v15 = -[BSUIScrollView _setContentOffset:animated:withAnimation:completion:]((uint64_t)self, 1, v13, v10, x, y);
  }
  else
  {
    v15 = -[BSUIScrollView _setContentOffset:animated:withAnimation:completion:]((uint64_t)self, 0, 0, v10, x, y);
  }

  return v15;
}

- (void)_setContentOffset:(CGPoint)a3 animation:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BSUIScrollView *v11;
  id v12[3];
  id location;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__BSUIScrollView__setContentOffset_animation___block_invoke;
  v9[3] = &unk_1E4349170;
  objc_copyWeak(v12, &location);
  v12[1] = *(id *)&x;
  v12[2] = *(id *)&y;
  v10 = v7;
  v11 = self;
  v8 = v7;
  -[BSUIScrollView _setContentOffset:withBlock:](self, v9);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

id __46__BSUIScrollView__setContentOffset_animation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[BSUIScrollView _setCurrentContentOffsetImmediatelyIfScrollInterruptionAnimated:]((uint64_t)WeakRetained, 1);

  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)BSUIScrollView;
  return objc_msgSendSuper2(&v5, sel__setContentOffset_animation_, v3, *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_callScrollCompletionIfNecessary
{
  void *v2;
  void (**v3)(id, _QWORD);

  if ((objc_msgSend(a1, "isScrolling") & 1) == 0)
  {
    if (a1[260])
    {
      v3 = (void (**)(id, _QWORD))MEMORY[0x1A1AF63A8]();
      v2 = (void *)a1[260];
      a1[260] = 0;

      v3[2](v3, 0);
    }
  }
}

uint64_t __39__BSUIScrollView__setScrollCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_willBeginDraggingNotification:(id)a3
{
  -[BSUIScrollView _setScrolling:]((uint64_t)self, 1);
}

- (void)_didEndDraggingNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEC180]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
    -[BSUIScrollView _setScrolling:]((uint64_t)self, 0);

}

- (void)_didDidEndDeceleratingNotification:(id)a3
{
  -[BSUIScrollView _setScrolling:]((uint64_t)self, 0);
}

- (void)_didEndScrollAnimationNotification:(id)a3
{
  self->_isHandlingAnimationEnded = 1;
  -[BSUIScrollView _setScrolling:]((uint64_t)self, 0);
  self->_isHandlingAnimationEnded = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scrollCompletion, 0);
}

@end
