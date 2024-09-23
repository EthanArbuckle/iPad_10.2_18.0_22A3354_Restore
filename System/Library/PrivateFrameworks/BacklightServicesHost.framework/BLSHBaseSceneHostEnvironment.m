@implementation BLSHBaseSceneHostEnvironment

- (BLSHBaseSceneHostEnvironment)initWithIdentifier:(id)a3
{
  id v4;
  BLSHBaseSceneHostEnvironment *v5;
  BLSHBaseSceneHostEnvironment *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  BLSBacklightSceneVisualState *lock_visualState;
  uint64_t v11;
  NSHashTable *lock_observers;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLSHBaseSceneHostEnvironment;
  v5 = -[BLSHBaseSceneHostEnvironment init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE0B898]), "initWithActiveAppearance:updateFidelity:adjustedLuminance:", 1, 3, 2);
    lock_visualState = v6->_lock_visualState;
    v6->_lock_visualState = (BLSBacklightSceneVisualState *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 1);
    lock_observers = v6->_lock_observers;
    v6->_lock_observers = (NSHashTable *)v11;

  }
  return v6;
}

- (RBSProcessIdentity)budgetProcessIdentity
{
  return 0;
}

- (BOOL)clientHasDelegate
{
  return 1;
}

- (BOOL)isClientActive
{
  return 1;
}

- (BOOL)clientSupportsAlwaysOn
{
  return 0;
}

- (BOOL)isLocal
{
  return 1;
}

- (BOOL)isAlwaysOnEnabledForEnvironment
{
  BLSHBaseSceneHostEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnEnabledForEnvironment;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnEnabledForEnvironment:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_alwaysOnEnabledForEnvironment;
  _QWORD v7[5];
  char v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_alwaysOnEnabledForEnvironment = self->_lock_alwaysOnEnabledForEnvironment;
  self->_lock_alwaysOnEnabledForEnvironment = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_alwaysOnEnabledForEnvironment != v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__BLSHBaseSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke;
    v7[3] = &unk_24D1BC980;
    v7[4] = self;
    v8 = v3;
    -[BLSHBaseSceneHostEnvironment notifyObserversWithBlock:](self, "notifyObserversWithBlock:", v7);
  }
}

void __65__BLSHBaseSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetAlwaysOnEnabledForEnvironment:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)isLiveUpdating
{
  BLSHBaseSceneHostEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_liveUpdating;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLiveUpdating:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_liveUpdating;
  _QWORD v7[5];
  char v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_liveUpdating = self->_lock_liveUpdating;
  self->_lock_liveUpdating = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_liveUpdating != v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__BLSHBaseSceneHostEnvironment_setLiveUpdating___block_invoke;
    v7[3] = &unk_24D1BC980;
    v7[4] = self;
    v8 = v3;
    -[BLSHBaseSceneHostEnvironment notifyObserversWithBlock:](self, "notifyObserversWithBlock:", v7);
  }
}

void __48__BLSHBaseSceneHostEnvironment_setLiveUpdating___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetLiveUpdating:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  BLSHBaseSceneHostEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_unrestrictedFramerateUpdates;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUnrestrictedFramerateUpdates:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_unrestrictedFramerateUpdates;
  _QWORD v7[5];
  char v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_unrestrictedFramerateUpdates = self->_lock_unrestrictedFramerateUpdates;
  self->_lock_unrestrictedFramerateUpdates = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_unrestrictedFramerateUpdates != v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__BLSHBaseSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke;
    v7[3] = &unk_24D1BC980;
    v7[4] = self;
    v8 = v3;
    -[BLSHBaseSceneHostEnvironment notifyObserversWithBlock:](self, "notifyObserversWithBlock:", v7);
  }
}

void __64__BLSHBaseSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetUnrestrictedFramerateUpdates:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)is1HzFlipbook
{
  BLSHBaseSceneHostEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_1HzFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)set1HzFlipbook:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_1HzFlipbook;
  _QWORD v7[5];
  char v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_1HzFlipbook = self->_lock_1HzFlipbook;
  self->_lock_1HzFlipbook = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_1HzFlipbook != v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__BLSHBaseSceneHostEnvironment_set1HzFlipbook___block_invoke;
    v7[3] = &unk_24D1BC980;
    v7[4] = self;
    v8 = v3;
    -[BLSHBaseSceneHostEnvironment notifyObserversWithBlock:](self, "notifyObserversWithBlock:", v7);
  }
}

void __47__BLSHBaseSceneHostEnvironment_set1HzFlipbook___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSet1HzFlipbook:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)cacheFlipbookOnDisplayWake
{
  BLSHBaseSceneHostEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cacheFlipbookOnDisplayWake;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCacheFlipbookOnDisplayWake:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_cacheFlipbookOnDisplayWake;
  _QWORD v7[5];
  char v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_cacheFlipbookOnDisplayWake = self->_lock_cacheFlipbookOnDisplayWake;
  self->_lock_cacheFlipbookOnDisplayWake = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_cacheFlipbookOnDisplayWake != v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__BLSHBaseSceneHostEnvironment_setCacheFlipbookOnDisplayWake___block_invoke;
    v7[3] = &unk_24D1BC980;
    v7[4] = self;
    v8 = v3;
    -[BLSHBaseSceneHostEnvironment notifyObserversWithBlock:](self, "notifyObserversWithBlock:", v7);
  }
}

void __62__BLSHBaseSceneHostEnvironment_setCacheFlipbookOnDisplayWake___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetCacheFlipbookOnDisplayWake:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)invalidateContentForReason:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__BLSHBaseSceneHostEnvironment_invalidateContentForReason___block_invoke;
  v6[3] = &unk_24D1BC9A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BLSHBaseSceneHostEnvironment notifyObserversWithBlock:](self, "notifyObserversWithBlock:", v6);

}

void __59__BLSHBaseSceneHostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:invalidateContentForReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_lock_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (BLSBacklightSceneVisualState)visualState
{
  os_unfair_lock_s *p_lock;
  BLSBacklightSceneVisualState *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_visualState;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10
{
  _BOOL4 v11;
  BLSBacklightSceneVisualState *v14;
  void (**v15)(_QWORD);
  void (**v16)(_QWORD);
  id v17;
  BLSBacklightSceneVisualState *lock_visualState;
  BLSBacklightSceneVisualState *v19;
  NSDate *v20;
  NSDate *lock_presentationDate;
  __n128 v22;
  void (**v23)(_QWORD, __n128);

  v11 = a5;
  v14 = (BLSBacklightSceneVisualState *)a3;
  v23 = (void (**)(_QWORD, __n128))a9;
  v15 = (void (**)(_QWORD))a10;
  v16 = (void (**)(_QWORD))a8;
  v17 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_visualState = self->_lock_visualState;
  self->_lock_visualState = v14;
  v19 = v14;

  objc_msgSend(v17, "date");
  v20 = (NSDate *)objc_claimAutoreleasedReturnValue();

  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = v20;

  os_unfair_lock_unlock(&self->_lock);
  v16[2](v16);

  if (v23)
  {
    v22.n128_u64[0] = 0;
    if (v11)
      v22.n128_f64[0] = 0.25;
    v23[2](v23, v22);
  }
  if (v15)
    v15[2](v15);

}

- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v8 = (objc_class *)MEMORY[0x24BE0B818];
  v9 = a6;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(v10, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithDate:fidelity:", v12, 0);
  v15[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *))a6 + 2))(v9, v10, v14);

}

- (NSDate)presentationDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_presentationDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)clearPresentationDate
{
  os_unfair_lock_s *p_lock;
  NSDate *lock_presentationDate;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = 0;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBaseSceneHostEnvironment identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isDisplayBlanked
{
  return self->_displayBlanked;
}

- (void)setDisplayBlanked:(BOOL)a3
{
  self->_displayBlanked = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lock_presentationDate, 0);
  objc_storeStrong((id *)&self->_lock_visualState, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end
