@implementation HKPropertyAnimationApplier

- (HKPropertyAnimationApplier)init
{
  HKPropertyAnimationApplier *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *animations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKPropertyAnimationApplier;
  v2 = -[HKPropertyAnimationApplier init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    animations = v2->_animations;
    v2->_animations = v3;

  }
  return v2;
}

- (void)applyAnimation:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *animations;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "_validate");
  v8 = (id)objc_msgSend(v4, "copy");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAppliedDate:", v5);

  animations = self->_animations;
  objc_msgSend(v8, "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](animations, "setObject:forKeyedSubscript:", v8, v7);

  -[HKPropertyAnimationApplier _startDisplayLinkIfNecessary](self, "_startDisplayLinkIfNecessary");
}

- (void)cancelAnimationsForProperty:(id)a3
{
  NSMutableDictionary *animations;
  id v5;
  id v6;

  animations = self->_animations;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](animations, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_finishCancelled:", 1);
  -[NSMutableDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", v5);

  -[HKPropertyAnimationApplier _stopDisplayLinkIfNecessary](self, "_stopDisplayLinkIfNecessary");
}

- (void)_startDisplayLinkIfNecessary
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  id v6;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

  }
}

- (void)_stopDisplayLinkIfNecessary
{
  CADisplayLink *displayLink;

  if (!-[NSMutableDictionary count](self->_animations, "count"))
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)_displayLinkFired:(id)a3
{
  -[HKPropertyAnimationApplier _applyAnimations](self, "_applyAnimations", a3);
  -[HKPropertyAnimationApplier _cleanupCompletedAnimations](self, "_cleanupCompletedAnimations");
  -[HKPropertyAnimationApplier _stopDisplayLinkIfNecessary](self, "_stopDisplayLinkIfNecessary");
}

- (void)_applyAnimations
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_animations, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_applyWithCurrentDate:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_cleanupCompletedAnimations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSMutableDictionary *animations;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_animations, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "_isCompleted"))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_applyWithCurrentDate:", v9);

          objc_msgSend(v8, "_finishCancelled:", 0);
          animations = self->_animations;
          objc_msgSend(v8, "property");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](animations, "removeObjectForKey:", v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end
