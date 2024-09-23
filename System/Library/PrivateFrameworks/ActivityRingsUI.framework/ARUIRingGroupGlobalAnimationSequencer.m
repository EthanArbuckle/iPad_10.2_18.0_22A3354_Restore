@implementation ARUIRingGroupGlobalAnimationSequencer

- (void)_displayLinkFired:(id)a3
{
  double v4;
  double v5;
  ARUIObserverStore *observers;
  _QWORD v7[6];

  objc_msgSend(a3, "timestamp");
  v5 = v4 - self->_lastUpdateTime;
  self->_lastUpdateTime = v4;
  observers = self->_observers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__ARUIRingGroupGlobalAnimationSequencer__displayLinkFired___block_invoke;
  v7[3] = &unk_24CEC6498;
  v7[4] = self;
  *(double *)&v7[5] = v5;
  -[ARUIObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v7);
  -[ARUIRingGroupGlobalAnimationSequencer _updateDisplayLink](self, "_updateDisplayLink");
}

- (void)_updateDisplayLink
{
  _BOOL4 v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  id v9;

  v3 = -[ARUIRingGroupGlobalAnimationSequencer _needsDisplayLink](self, "_needsDisplayLink");
  displayLink = self->_displayLink;
  if (v3)
  {
    if (!displayLink)
    {
      objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
      v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v6 = self->_displayLink;
      self->_displayLink = v5;

      v7 = self->_displayLink;
      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v9, *MEMORY[0x24BDBCB80]);

    }
  }
  else if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v8 = self->_displayLink;
    self->_displayLink = 0;

    self->_lastUpdateTime = NAN;
  }
}

- (BOOL)_needsDisplayLink
{
  return -[ARUIObserverStore count](self->_observers, "count") != 0;
}

uint64_t __59__ARUIRingGroupGlobalAnimationSequencer__displayLinkFired___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "animationSequencer:updatedWithTime:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)addObserver:(id)a3
{
  -[ARUIObserverStore addObserver:](self->_observers, "addObserver:", a3);
  -[ARUIRingGroupGlobalAnimationSequencer _updateDisplayLink](self, "_updateDisplayLink");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  return (id)sharedInstance___sharedInstance;
}

void __55__ARUIRingGroupGlobalAnimationSequencer_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ARUIRingGroupGlobalAnimationSequencer _init]([ARUIRingGroupGlobalAnimationSequencer alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  ARUIRingGroupGlobalAnimationSequencer *v2;
  ARUIObserverStore *v3;
  ARUIObserverStore *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARUIRingGroupGlobalAnimationSequencer;
  v2 = -[ARUIRingGroupGlobalAnimationSequencer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ARUIObserverStore);
    observers = v2->_observers;
    v2->_observers = v3;

    v2->_lastUpdateTime = NAN;
  }
  return v2;
}

- (void)removeObserver:(id)a3
{
  -[ARUIObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
  -[ARUIRingGroupGlobalAnimationSequencer _updateDisplayLink](self, "_updateDisplayLink");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
