@implementation ARDisplayLink

- (ARDisplayLink)initWithPreferredFramesPerSecond:(int64_t)a3 callback:(id)a4
{
  id v6;
  ARDisplayLink *v7;
  ARDisplayLink *v8;
  uint64_t v9;
  id callback;
  ARRunLoop *v11;
  void *v12;
  uint64_t v13;
  ARRunLoop *runloop;
  ARRunLoop *v15;
  _QWORD v17[4];
  id v18[2];
  id location;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ARDisplayLink;
  v7 = -[ARDisplayLink init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    v9 = objc_msgSend(v6, "copy");
    callback = v8->_callback;
    v8->_callback = (id)v9;

    v8->_preferredFramesPerSecond = a3;
    v11 = [ARRunLoop alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.arkit.ardisplaylink.%p"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ARRunLoop initWithName:](v11, "initWithName:", v12);
    runloop = v8->_runloop;
    v8->_runloop = (ARRunLoop *)v13;

    -[ARRunLoop start](v8->_runloop, "start");
    objc_initWeak(&location, v8);
    v15 = v8->_runloop;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__ARDisplayLink_initWithPreferredFramesPerSecond_callback___block_invoke;
    v17[3] = &unk_1E6674CD8;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a3;
    -[ARRunLoop runOnRunLoop:](v15, "runOnRunLoop:", v17);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __59__ARDisplayLink_initWithPreferredFramesPerSecond_callback___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  _ARDisplayLinkHelper *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v8 = -[_ARDisplayLinkHelper initWithDisplayLink:]([_ARDisplayLinkHelper alloc], "initWithDisplayLink:", WeakRetained);
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v8, sel_callback_);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v3[1];
    v3[1] = (id)v4;

    objc_msgSend(v3[1], "setPreferredFramesPerSecond:", *(_QWORD *)(a1 + 40));
    v6 = v3[1];
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

  }
}

- (ARDisplayLink)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[ARDisplayLink init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return -[ARDisplayLink init](self, "init");
}

- (void)dealloc
{
  objc_super v3;

  -[ARDisplayLink invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ARDisplayLink;
  -[ARDisplayLink dealloc](&v3, sel_dealloc);
}

- (void)setVsyncOffset:(double)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_vsyncOffset = a3;
  -[ARDisplayLink _recomputeActualVsyncOffsetWithVsyncOffset:preferredFramesPerSecond:](self, "_recomputeActualVsyncOffsetWithVsyncOffset:preferredFramesPerSecond:", self->_preferredFramesPerSecond, a3);
  os_unfair_lock_unlock(p_lock);
}

- (double)vsyncOffset
{
  os_unfair_lock_s *p_lock;
  double vsyncOffset;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  vsyncOffset = self->_vsyncOffset;
  os_unfair_lock_unlock(p_lock);
  return vsyncOffset;
}

- (int64_t)preferredFramesPerSecond
{
  os_unfair_lock_s *p_lock;
  int64_t preferredFramesPerSecond;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preferredFramesPerSecond = self->_preferredFramesPerSecond;
  os_unfair_lock_unlock(p_lock);
  return preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  CADisplayLink *v6;
  ARRunLoop *runloop;
  CADisplayLink *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  CADisplayLink *v13;
  int64_t v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_preferredFramesPerSecond != a3)
  {
    self->_preferredFramesPerSecond = a3;
    v6 = self->_displayLink;
    runloop = self->_runloop;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __45__ARDisplayLink_setPreferredFramesPerSecond___block_invoke;
    v12 = &unk_1E6673378;
    v13 = v6;
    v14 = a3;
    v8 = v6;
    -[ARRunLoop runOnRunLoop:](runloop, "runOnRunLoop:", &v9);
    -[ARDisplayLink _recomputeActualVsyncOffsetWithVsyncOffset:preferredFramesPerSecond:](self, "_recomputeActualVsyncOffsetWithVsyncOffset:preferredFramesPerSecond:", self->_preferredFramesPerSecond, self->_vsyncOffset, v9, v10, v11, v12);

  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __45__ARDisplayLink_setPreferredFramesPerSecond___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredFramesPerSecond:", *(_QWORD *)(a1 + 40));
}

- (void)invalidate
{
  CADisplayLink *v3;
  ARRunLoop *runloop;
  CADisplayLink *v5;
  _QWORD v6[4];
  CADisplayLink *v7;

  v3 = self->_displayLink;
  runloop = self->_runloop;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__ARDisplayLink_invalidate__block_invoke;
  v6[3] = &unk_1E6672168;
  v7 = v3;
  v5 = v3;
  -[ARRunLoop runOnRunLoop:](runloop, "runOnRunLoop:", v6);
  -[ARRunLoop cancel](self->_runloop, "cancel");

}

uint64_t __27__ARDisplayLink_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_recomputeActualVsyncOffsetWithVsyncOffset:(double)a3 preferredFramesPerSecond:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  ARRunLoop *runloop;
  _QWORD v10[6];

  v5 = 1.0 / (double)a4;
  v6 = fmod(a3, v5);
  v7 = -0.0;
  if (v6 < 0.0)
    v7 = v5;
  v8 = v6 + v7 - ARDispatchAfterLeewayForTimeInterval(v6 + v7);
  if (v8 < 0.0)
    v8 = 0.0;
  runloop = self->_runloop;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__ARDisplayLink__recomputeActualVsyncOffsetWithVsyncOffset_preferredFramesPerSecond___block_invoke;
  v10[3] = &unk_1E6673378;
  v10[4] = self;
  *(double *)&v10[5] = v8;
  -[ARRunLoop runOnRunLoop:](runloop, "runOnRunLoop:", v10);
}

double __85__ARDisplayLink__recomputeActualVsyncOffsetWithVsyncOffset_preferredFramesPerSecond___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

- (void)displayLinkCallback
{
  void *v3;
  double actualVsyncOffset;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  actualVsyncOffset = self->_actualVsyncOffset;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__ARDisplayLink_displayLinkCallback__block_invoke;
  v6[3] = &unk_1E6674D00;
  objc_copyWeak(&v7, &location);
  v5 = (id)objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, actualVsyncOffset);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __36__ARDisplayLink_displayLinkCallback__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    (*(void (**)(void))(*((_QWORD *)WeakRetained + 2) + 16))();
  objc_msgSend(v5, "invalidate");

}

- (ARRunLoop)runloop
{
  return self->_runloop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runloop, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
