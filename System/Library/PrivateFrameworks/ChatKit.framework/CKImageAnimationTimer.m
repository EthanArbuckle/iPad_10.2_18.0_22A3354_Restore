@implementation CKImageAnimationTimer

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CKImageAnimationTimer;
  -[CKImageAnimationTimer dealloc](&v4, sel_dealloc);
}

- (CKImageAnimationTimer)init
{
  CKImageAnimationTimer *v2;
  __int128 v3;
  CFMutableSetRef v4;
  void *v5;
  CFSetCallBacks v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKImageAnimationTimer;
  v2 = -[CKImageAnimationTimer init](&v8, sel_init);
  if (v2)
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&v7.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&v7.release = v3;
    *(_OWORD *)&v7.equal = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 32);
    v7.retain = 0;
    v7.release = 0;
    v4 = CFSetCreateMutable(0, 0, &v7);
    -[CKImageAnimationTimer setObservers:](v2, "setObservers:", v4);
    -[CKImageAnimationTimer setShouldStopWhenBackgrounded:](v2, "setShouldStopWhenBackgrounded:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_updateDisplayLink, *MEMORY[0x1E0CEB270], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_updateDisplayLink, *MEMORY[0x1E0CEB288], 0);

  }
  return v2;
}

+ (id)sharedTimer
{
  if (sharedTimer_once != -1)
    dispatch_once(&sharedTimer_once, &__block_literal_global_217);
  return (id)sharedTimer_sAnimatedImageTimer;
}

void __36__CKImageAnimationTimer_sharedTimer__block_invoke()
{
  CKImageAnimationTimer *v0;
  void *v1;

  v0 = objc_alloc_init(CKImageAnimationTimer);
  v1 = (void *)sharedTimer_sAnimatedImageTimer;
  sharedTimer_sAnimatedImageTimer = (uint64_t)v0;

}

- (void)setDisplayLink:(id)a3
{
  CADisplayLink *v5;
  CADisplayLink *v6;

  v5 = (CADisplayLink *)a3;
  if (self->_displayLink != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_displayLink, a3);
    -[CKImageAnimationTimer setHasValidStartTimeForCurrentDisplayLink:](self, "setHasValidStartTimeForCurrentDisplayLink:", 0);
    v5 = v6;
  }

}

- (void)addAnimationTimerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKImageAnimationTimer observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[CKImageAnimationTimer updateDisplayLink](self, "updateDisplayLink");
}

- (void)removeAnimationTimerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKImageAnimationTimer observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[CKImageAnimationTimer updateDisplayLink](self, "updateDisplayLink");
}

+ (BOOL)accessibilityAnimatedImagesDisabled
{
  return _AXSReduceMotionAutoplayAnimatedImagesEnabled() == 0;
}

- (void)animationTimerFired
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[CKImageAnimationTimer shouldStartDisplayLink](self, "shouldStartDisplayLink"))
  {
    if (!self->_hasValidStartTimeForCurrentDisplayLink)
    {
      -[CKImageAnimationTimer displayLink](self, "displayLink");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "targetTimestamp");
      self->_animationStartTime = v4;

      self->_hasValidStartTimeForCurrentDisplayLink = 1;
    }
    -[CADisplayLink targetTimestamp](self->_displayLink, "targetTimestamp");
    self->_animationTime = v5 - self->_animationStartTime;
    -[CKImageAnimationTimer observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (!+[CKImageAnimationTimer accessibilityAnimatedImagesDisabled](CKImageAnimationTimer, "accessibilityAnimatedImagesDisabled", (_QWORD)v14)|| objc_msgSend(v13, "animationExplicitlyResumed"))
          {
            objc_msgSend(v13, "animationTimerFired:", self->_animationTime);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  else
  {
    -[CKImageAnimationTimer stopDisplayLink](self, "stopDisplayLink");
  }
}

- (BOOL)shouldStartDisplayLink
{
  uint64_t v3;
  uint64_t v4;
  int v5;

  -[CKImageAnimationTimer observers](self, "observers");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)v3, "count");

  LODWORD(v3) = +[CKApplicationState isApplicationActive](CKApplicationState, "isApplicationActive");
  v5 = v3 | !-[CKImageAnimationTimer shouldStopWhenBackgrounded](self, "shouldStopWhenBackgrounded");
  if (v4)
    return v5;
  else
    return 0;
}

- (void)startDisplayLinkIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[CKImageAnimationTimer displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_animationTimerFired);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredFramesPerSecond:", 60);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addToRunLoop:forMode:", v4, *MEMORY[0x1E0C99860]);

    -[CKImageAnimationTimer setDisplayLink:](self, "setDisplayLink:", v5);
    v3 = v5;
  }

}

- (void)stopDisplayLink
{
  void *v3;

  -[CKImageAnimationTimer displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CKImageAnimationTimer setDisplayLink:](self, "setDisplayLink:", 0);
}

- (void)updateDisplayLink
{
  if (-[CKImageAnimationTimer shouldStartDisplayLink](self, "shouldStartDisplayLink"))
    -[CKImageAnimationTimer startDisplayLinkIfNeeded](self, "startDisplayLinkIfNeeded");
  else
    -[CKImageAnimationTimer stopDisplayLink](self, "stopDisplayLink");
}

- (void)setShouldStopWhenBackgrounded:(BOOL)a3
{
  if (self->_shouldStopWhenBackgrounded != a3)
  {
    self->_shouldStopWhenBackgrounded = a3;
    -[CKImageAnimationTimer updateDisplayLink](self, "updateDisplayLink");
  }
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (double)animationTime
{
  return self->_animationTime;
}

- (BOOL)shouldStopWhenBackgrounded
{
  return self->_shouldStopWhenBackgrounded;
}

- (double)animationStartTime
{
  return self->_animationStartTime;
}

- (void)setAnimationStartTime:(double)a3
{
  self->_animationStartTime = a3;
}

- (BOOL)hasValidStartTimeForCurrentDisplayLink
{
  return self->_hasValidStartTimeForCurrentDisplayLink;
}

- (void)setHasValidStartTimeForCurrentDisplayLink:(BOOL)a3
{
  self->_hasValidStartTimeForCurrentDisplayLink = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
