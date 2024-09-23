@implementation QLImageAnimationTimer

- (QLImageAnimationTimer)init
{
  QLImageAnimationTimer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLImageAnimationTimer;
  v2 = -[QLImageAnimationTimer init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[QLImageAnimationTimer setObservers:](v2, "setObservers:", v3);

  }
  return v2;
}

+ (id)sharedTimer
{
  if (sharedTimer_once[0] != -1)
    dispatch_once(sharedTimer_once, &__block_literal_global_20);
  return (id)sharedTimer_sAnimatedImageTimer;
}

void __36__QLImageAnimationTimer_sharedTimer__block_invoke()
{
  QLImageAnimationTimer *v0;
  void *v1;

  v0 = objc_alloc_init(QLImageAnimationTimer);
  v1 = (void *)sharedTimer_sAnimatedImageTimer;
  sharedTimer_sAnimatedImageTimer = (uint64_t)v0;

}

- (void)addAnimationTimerObserver:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[QLImageAnimationTimer observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if ((v5 & 1) == 0)
  {
    -[QLImageAnimationTimer observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_animationTimerFired_);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addToRunLoop:forMode:", v8, *MEMORY[0x24BDBCB80]);

      -[QLImageAnimationTimer setDisplayLink:](self, "setDisplayLink:", v7);
    }
    objc_msgSend(v6, "addObject:", v9);

  }
}

- (void)removeAnimationTimerObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[QLImageAnimationTimer observers](self, "observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  if (!objc_msgSend(v6, "count"))
  {
    -[QLImageAnimationTimer displayLink](self, "displayLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

  }
}

- (void)animationTimerFired:(id)a3
{
  id v4;
  void *v5;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[QLImageAnimationTimer observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v10, "animationTimerFired:");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
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

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
