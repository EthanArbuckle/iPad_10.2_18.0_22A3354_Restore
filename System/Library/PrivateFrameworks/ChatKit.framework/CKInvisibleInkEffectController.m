@implementation CKInvisibleInkEffectController

- (CKInvisibleInkEffectController)initWithHostView:(id)a3
{
  id v4;
  CKInvisibleInkEffectController *v5;
  CKInvisibleInkEffectController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKInvisibleInkEffectController;
  v5 = -[CKInvisibleInkEffectController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_hostView, v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKInvisibleInkEffectController resumeTimer](self, "resumeTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CKInvisibleInkEffectController;
  -[CKInvisibleInkEffectController dealloc](&v4, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  _QWORD block[5];

  if (((!self->_enabled ^ a3) & 1) == 0)
  {
    self->_enabled = a3;
    -[CKInvisibleInkEffectController setEffectViewNeedsReset:](self, "setEffectViewNeedsReset:", 1);
    -[CKInvisibleInkEffectController setSuspended:](self, "setSuspended:", 0);
    -[CKInvisibleInkEffectController resumeTimer](self, "resumeTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    if (!self->_enabled)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__CKInvisibleInkEffectController_setEnabled___block_invoke;
      block[3] = &unk_1E274A208;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __45__CKInvisibleInkEffectController_setEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    if (*(_QWORD *)(v2 + 16))
    {
      objc_msgSend((id)v2, "hostView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "detachInvisibleInkEffectView");

      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 16);
      *(_QWORD *)(v4 + 16) = 0;

    }
  }
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  if (((!self->_suspended ^ a3) & 1) == 0)
  {
    v4 = a3;
    self->_suspended = a3;
    -[CKInvisibleInkEffectView setSuspended:](self->_effectView, "setSuspended:");
    -[CKInvisibleInkEffectController hostView](self, "hostView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "invisibleInkEffectViewWasSuspended");
    else
      objc_msgSend(v5, "invisibleInkEffectViewWasResumed");

  }
  -[CKInvisibleInkEffectController resumeTimer](self, "resumeTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

}

- (void)resumeTimerFired:(id)a3
{
  -[CKInvisibleInkEffectController setSuspended:](self, "setSuspended:", 0);
}

- (void)suspendForTimeInterval:(double)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[CKInvisibleInkEffectController setSuspended:](self, "setSuspended:", 1);
  -[CKInvisibleInkEffectController resumeTimer](self, "resumeTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isValid");

  if (v6)
  {
    -[CKInvisibleInkEffectController resumeTimer](self, "resumeTimer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFireDate:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_resumeTimerFired_, 0, 0, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEffectController setResumeTimer:](self, "setResumeTimer:");
  }

}

- (void)prepareForDisplay
{
  _BOOL4 v3;
  CKInvisibleInkEffectView *effectView;
  CKInvisibleInkEffectView *v5;
  void *v6;
  id v7;
  CKInvisibleInkEffectView *v8;
  CKInvisibleInkEffectView *v9;
  CKInvisibleInkGestureRecognizer *v10;
  id v11;

  -[CKInvisibleInkEffectController hostView](self, "hostView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[CKInvisibleInkEffectController isEnabled](self, "isEnabled");
  effectView = self->_effectView;
  if (v3)
  {
    if (effectView)
    {
      if (-[CKInvisibleInkEffectController effectViewNeedsReset](self, "effectViewNeedsReset"))
        -[CKInvisibleInkEffectView reset](self->_effectView, "reset");
    }
    else
    {
      -[CKInvisibleInkEffectController hostView](self, "hostView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc((Class)objc_msgSend(v6, "invisibleInkEffectViewClass"));
      objc_msgSend(v11, "bounds");
      v8 = (CKInvisibleInkEffectView *)objc_msgSend(v7, "initWithFrame:");
      v9 = self->_effectView;
      self->_effectView = v8;

      -[CKInvisibleInkEffectView setAutoresizingMask:](self->_effectView, "setAutoresizingMask:", 18);
      v10 = objc_alloc_init(CKInvisibleInkGestureRecognizer);
      -[CKInvisibleInkGestureRecognizer setCancelsTouchesInView:](v10, "setCancelsTouchesInView:", 0);
      -[CKInvisibleInkEffectView addGestureRecognizer:](self->_effectView, "addGestureRecognizer:", v10);
      -[CKInvisibleInkEffectView setDelegate:](self->_effectView, "setDelegate:", self);
      -[CKInvisibleInkEffectView setPaused:](self->_effectView, "setPaused:", -[CKInvisibleInkEffectController isPaused](self, "isPaused"));
      -[CKInvisibleInkEffectView setSuspended:](self->_effectView, "setSuspended:", -[CKInvisibleInkEffectController isSuspended](self, "isSuspended"));
      objc_msgSend(v11, "attachInvisibleInkEffectView");

    }
    -[CKInvisibleInkEffectController setEffectViewNeedsReset:](self, "setEffectViewNeedsReset:", 0);
  }
  else if (effectView)
  {
    objc_msgSend(v11, "detachInvisibleInkEffectView");
    v5 = self->_effectView;
    self->_effectView = 0;

  }
}

- (void)hostViewDidLayoutSubviews
{
  CKInvisibleInkEffectView *effectView;
  void *v4;
  id v5;

  if (-[CKInvisibleInkEffectController isEnabled](self, "isEnabled"))
  {
    effectView = self->_effectView;
    -[CKInvisibleInkEffectController hostView](self, "hostView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageForInvisibleInkEffectView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEffectView setImage:](effectView, "setImage:", v4);

  }
}

- (void)hostViewDidUpdateSnapshot:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CKInvisibleInkEffectController isEnabled](self, "isEnabled"))
    -[CKInvisibleInkEffectView setImage:](self->_effectView, "setImage:", v4);

}

- (void)setPaused:(BOOL)a3
{
  if (((!self->_paused ^ a3) & 1) == 0)
  {
    self->_paused = a3;
    -[CKInvisibleInkEffectView setPaused:](self->_effectView, "setPaused:");
  }
}

- (void)_updateBorrowedEffectViewSnapshot
{
  void *v3;
  id v4;

  -[CKInvisibleInkEffectView snapshotViewAfterScreenUpdates:](self->_effectView, "snapshotViewAfterScreenUpdates:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEffectController hostView](self, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detachInvisibleInkEffectView");
  -[CKInvisibleInkEffectController setBorrowedEffectViewSnapshot:](self, "setBorrowedEffectViewSnapshot:", v4);
  objc_msgSend(v3, "attachInvisibleInkEffectView");

}

- (id)borrowEffectView
{
  void *v3;

  -[CKInvisibleInkEffectController borrowedEffectViewSnapshot](self, "borrowedEffectViewSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CKInvisibleInkEffectController _updateBorrowedEffectViewSnapshot](self, "_updateBorrowedEffectViewSnapshot");
  return self->_effectView;
}

- (void)returnBorrowedEffectView
{
  void *v3;
  void *v4;
  CKInvisibleInkEffectView *effectView;
  __int128 v6;
  CKInvisibleInkEffectView *v7;
  _OWORD v8[3];

  -[CKInvisibleInkEffectController borrowedEffectViewSnapshot](self, "borrowedEffectViewSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKInvisibleInkEffectController hostView](self, "hostView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detachInvisibleInkEffectView");
    -[CKInvisibleInkEffectController setBorrowedEffectViewSnapshot:](self, "setBorrowedEffectViewSnapshot:", 0);
    effectView = self->_effectView;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v8[0] = *MEMORY[0x1E0C9BAA8];
    v8[1] = v6;
    v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[CKInvisibleInkEffectView setTransform:](effectView, "setTransform:", v8);
    v7 = self->_effectView;
    objc_msgSend(v4, "bounds");
    -[CKInvisibleInkEffectView setFrame:](v7, "setFrame:");
    objc_msgSend(v4, "attachInvisibleInkEffectView");

  }
}

- (CKInvisibleInkEffectView)effectView
{
  CKInvisibleInkEffectView *borrowedEffectViewSnapshot;

  borrowedEffectViewSnapshot = (CKInvisibleInkEffectView *)self->_borrowedEffectViewSnapshot;
  if (!borrowedEffectViewSnapshot)
    borrowedEffectViewSnapshot = self->_effectView;
  return borrowedEffectViewSnapshot;
}

- (void)invisibleInkEffectViewWasUncovered:(id)a3
{
  id v3;

  -[CKInvisibleInkEffectController hostView](self, "hostView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invisibleInkEffectViewWasUncovered");

}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (CKInvisibleInkEffectHostView)hostView
{
  return (CKInvisibleInkEffectHostView *)objc_loadWeakRetained((id *)&self->_hostView);
}

- (void)setHostView:(id)a3
{
  objc_storeWeak((id *)&self->_hostView, a3);
}

- (BOOL)effectViewNeedsReset
{
  return self->_effectViewNeedsReset;
}

- (void)setEffectViewNeedsReset:(BOOL)a3
{
  self->_effectViewNeedsReset = a3;
}

- (NSTimer)resumeTimer
{
  return self->_resumeTimer;
}

- (void)setResumeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_resumeTimer, a3);
}

- (UIView)borrowedEffectViewSnapshot
{
  return self->_borrowedEffectViewSnapshot;
}

- (void)setBorrowedEffectViewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_borrowedEffectViewSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borrowedEffectViewSnapshot, 0);
  objc_storeStrong((id *)&self->_resumeTimer, 0);
  objc_destroyWeak((id *)&self->_hostView);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
