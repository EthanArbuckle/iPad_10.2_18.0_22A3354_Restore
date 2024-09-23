@implementation LAUIRenderLoop

- (void)_drawWithDisplayLink:(uint64_t)a1
{
  double v3;
  id v4;

  v4 = a2;
  if (a1 && v4 && *(id *)(a1 + 24) == v4)
  {
    objc_msgSend(v4, "targetTimestamp");
    -[LAUIRenderLoop _drawAtTime:](a1, v3);
  }

}

- (LAUIRenderLoop)init
{
  LAUIRenderLoop *v2;
  LAUIRenderLoop *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LAUIRenderLoop;
  v2 = -[LAUIRenderLoop init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_paused = 1;
    *(_WORD *)&v2->_in_application_context = 256;
    v4 = MEMORY[0x24BDE5430];
    *(_QWORD *)&v2->_preferred_fps_range.minimum = *MEMORY[0x24BDE5430];
    v2->_preferred_fps_range.preferred = *(float *)(v4 + 8);
    -[LAUIRenderLoop _updateApplicationState]((uint64_t)v2);
  }
  return v3;
}

- (void)_updateApplicationState
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v2;
    if (*(_BYTE *)(a1 + 36))
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(a1 + 33) = objc_msgSend(v3, "applicationState") == 2;

      objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);
      objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);
      objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);
    }
    else
    {
      objc_msgSend(v2, "removeObserver:name:object:", a1, *MEMORY[0x24BDF7528], 0);
      objc_msgSend(v4, "removeObserver:name:object:", a1, *MEMORY[0x24BDF75D0], 0);
      objc_msgSend(v4, "removeObserver:name:object:", a1, *MEMORY[0x24BDF7510], 0);
    }
    -[LAUIRenderLoop _updateEffectivePausedState](a1);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[LAUIRenderLoop invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)LAUIRenderLoop;
  -[LAUIRenderLoop dealloc](&v4, sel_dealloc);
}

- (BOOL)attachToScreen:(id)a3
{
  id v4;
  BOOL v5;
  id WeakRetained;
  CADisplayLink *display_link;
  CADisplayLink **p_display_link;
  CADisplayLink *v9;
  id *v10;
  CADisplayLink *v11;
  CADisplayLink *v12;
  double v13;
  double v14;
  double v15;
  CADisplayLink *v16;
  void *v17;
  BOOL v18;

  v4 = a3;
  if (self->_invalidated)
  {
    v5 = 0;
    goto LABEL_19;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_screen);
  if (WeakRetained != v4)
  {
    p_display_link = &self->_display_link;
    display_link = self->_display_link;
    if (!display_link)
      goto LABEL_6;
    goto LABEL_5;
  }
  p_display_link = &self->_display_link;
  display_link = self->_display_link;
  if (v4)
  {
    if (!display_link)
    {
      objc_storeWeak((id *)&self->_screen, v4);
      goto LABEL_7;
    }
LABEL_21:
    v18 = display_link == 0;
    goto LABEL_15;
  }
  if (!display_link)
    goto LABEL_21;
LABEL_5:
  -[CADisplayLink invalidate](display_link, "invalidate");
  v9 = *p_display_link;
  *p_display_link = 0;

LABEL_6:
  objc_storeWeak((id *)&self->_screen, v4);
  if (v4)
  {
LABEL_7:
    v10 = -[LAUIDisplayLinkTargetProxy initWithTarget:]((id *)[LAUIDisplayLinkTargetProxy alloc], self);
    objc_msgSend(v4, "displayLinkWithTarget:selector:", v10, sel_drawWithDisplayLink_);
    v11 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v12 = self->_display_link;
    self->_display_link = v11;

    -[CADisplayLink setPaused:](self->_display_link, "setPaused:", self->_effective_paused);
    *(float *)&v13 = self->_preferred_fps_range.minimum;
    *(float *)&v14 = self->_preferred_fps_range.maximum;
    *(float *)&v15 = self->_preferred_fps_range.preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_display_link, "setPreferredFrameRateRange:", v13, v14, v15);
    if (self->_has_high_fps_reason)
      -[CADisplayLink setHighFrameRateReason:](self->_display_link, "setHighFrameRateReason:", self->_high_fps_reason);
    v16 = *p_display_link;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v16, "addToRunLoop:forMode:", v17, *MEMORY[0x24BDBCB80]);

    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
    goto LABEL_14;
  }
  -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
LABEL_14:
  v18 = !self->_runnable;
LABEL_15:
  v5 = !v18;

LABEL_19:
  return v5;
}

- (void)_updateEffectivePausedState
{
  int v2;
  int v3;
  int v4;
  int v5;
  id WeakRetained;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 17)
      || !*(_QWORD *)(a1 + 24)
      || !CAFrameRateRangeIsEqualToRange(*(CAFrameRateRange *)(a1 + 56), *MEMORY[0x24BDE5430])
      && *(float *)(a1 + 60) <= 0.0
      || *(_BYTE *)(a1 + 36) && *(_BYTE *)(a1 + 33))
    {
      v2 = 1;
    }
    else
    {
      v2 = objc_msgSend((id)a1, "_isForcingPause");
    }
    v3 = v2 ^ 1;
    v4 = *(unsigned __int8 *)(a1 + 39);
    if (v4 != (v2 ^ 1))
      *(_BYTE *)(a1 + 39) = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v5 = (v2 & 1) != 0 || *(_BYTE *)(a1 + 38) != 0;
    if (*(unsigned __int8 *)(a1 + 37) == v5)
    {
      if (v4 != v3)
      {
        if (*(_BYTE *)(a1 + 35))
          objc_msgSend(WeakRetained, "renderLoop:didChangeRunnable:", a1, *(unsigned __int8 *)(a1 + 39));
      }
    }
    else
    {
      *(_BYTE *)(a1 + 37) = v5;
      objc_msgSend(*(id *)(a1 + 24), "setPaused:");
      if (v4 != v3 && *(_BYTE *)(a1 + 35))
        objc_msgSend(WeakRetained, "renderLoop:didChangeRunnable:", a1, *(unsigned __int8 *)(a1 + 39));
      if (*(_BYTE *)(a1 + 34))
        objc_msgSend(WeakRetained, "renderLoop:didChangeEffectivePaused:", a1, *(unsigned __int8 *)(a1 + 37));
    }

  }
}

- (void)invalidate
{
  CADisplayLink *display_link;
  CADisplayLink *v4;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[LAUIRenderLoop _didInvalidate](self, "_didInvalidate");
    objc_storeWeak((id *)&self->_screen, 0);
    display_link = self->_display_link;
    if (display_link)
    {
      -[CADisplayLink invalidate](display_link, "invalidate");
      v4 = self->_display_link;
      self->_display_link = 0;

    }
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)_setNeedsForcingPauseUpdate
{
  if (a1)
    -[LAUIRenderLoop _updateEffectivePausedState](a1);
}

- (BOOL)_isForcingPause
{
  return 0;
}

- (void)_drawAtTime:(uint64_t)a1
{
  void *v4;
  id WeakRetained;

  if (a1 && !*(_BYTE *)(a1 + 37))
  {
    v4 = (void *)MEMORY[0x20BD1B564]();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      *(_BYTE *)(a1 + 16) = 1;
      objc_msgSend((id)a1, "_willDraw");
      objc_msgSend(WeakRetained, "renderLoop:drawAtTime:", a1, a2);
      *(_BYTE *)(a1 + 16) = 0;
      objc_msgSend((id)a1, "_didDraw");
    }

    objc_autoreleasePoolPop(v4);
  }
}

- (void)setInApplicationContext:(BOOL)a3
{
  if (self->_in_application_context != a3)
  {
    self->_in_application_context = a3;
    -[LAUIRenderLoop _updateApplicationState]((uint64_t)self);
  }
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred;
  float maximum;
  float minimum;
  double v7;
  double v8;
  double v9;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  if (!CAFrameRateRangeIsEqualToRange(self->_preferred_fps_range, a3))
  {
    self->_preferred_fps_range.minimum = minimum;
    self->_preferred_fps_range.maximum = maximum;
    self->_preferred_fps_range.preferred = preferred;
    *(float *)&v7 = minimum;
    *(float *)&v8 = maximum;
    *(float *)&v9 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_display_link, "setPreferredFrameRateRange:", v7, v8, v9);
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_has_high_fps_reason = 1;
  self->_high_fps_reason = a3;
  -[CADisplayLink setHighFrameRateReason:](self->_display_link, "setHighFrameRateReason:");
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)setDelegate:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_delegate, v6);
  v4 = v6;
  if (v6)
  {
    self->_delegate_observes_effective_paused = objc_opt_respondsToSelector() & 1;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
  }
  else
  {
    v5 = 0;
    self->_delegate_observes_effective_paused = 0;
  }
  self->_delegate_observes_runnable = v5 & 1;

}

- (void)_applicationDidEnterBackground:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "applicationState") != 2)
    __assert_rtn("-[LAUIRenderLoop _applicationDidEnterBackground:]", "LAUIRenderLoop.mm", 447, "[[UIApplication sharedApplication] applicationState] == UIApplicationStateBackground");

  if (!self->_background)
  {
    self->_background = 1;
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }

}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (self->_background)
  {
    self->_background = 0;
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "applicationState") == 2)
    __assert_rtn("-[LAUIRenderLoop _applicationDidBecomeActive:]", "LAUIRenderLoop.mm", 466, "[[UIApplication sharedApplication] applicationState] != UIApplicationStateBackground");

  if (self->_background)
  {
    self->_background = 0;
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }

}

- (BOOL)isInApplicationContext
{
  return self->_in_application_context;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  minimum = self->_preferred_fps_range.minimum;
  maximum = self->_preferred_fps_range.maximum;
  preferred = self->_preferred_fps_range.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (unsigned)highFrameRateReason
{
  return self->_high_fps_reason;
}

- (BOOL)effectiveIsPaused
{
  return self->_effective_paused;
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)isDrawing
{
  return self->_drawing;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isRunnable
{
  return self->_runnable;
}

- (LAUIRenderLoopDelegate)delegate
{
  return (LAUIRenderLoopDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_display_link, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
