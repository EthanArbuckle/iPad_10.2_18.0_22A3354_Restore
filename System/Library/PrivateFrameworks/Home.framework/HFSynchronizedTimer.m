@implementation HFSynchronizedTimer

+ (id)sharedInstance
{
  if (_MergedGlobals_331 != -1)
    dispatch_once(&_MergedGlobals_331, &__block_literal_global_2_37);
  return (id)qword_1ED379F28;
}

void __37__HFSynchronizedTimer_sharedInstance__block_invoke_2()
{
  HFSynchronizedTimer *v0;
  void *v1;

  v0 = objc_alloc_init(HFSynchronizedTimer);
  v1 = (void *)qword_1ED379F28;
  qword_1ED379F28 = (uint64_t)v0;

}

- (HFSynchronizedTimer)init
{
  HFSynchronizedTimer *v2;
  uint64_t v3;
  NSMapTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFSynchronizedTimer;
  v2 = -[HFSynchronizedTimer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v3;

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  -[HFSynchronizedTimer observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_initWeak(&location, self);
    v7 = objc_alloc(MEMORY[0x1E0D51998]);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __35__HFSynchronizedTimer_addObserver___block_invoke;
    v13 = &unk_1EA73AD38;
    objc_copyWeak(&v14, &location);
    v8 = (void *)objc_msgSend(v7, "initWithTargetObject:finalizer:", v4, &v10);
    -[HFSynchronizedTimer observers](self, "observers", v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v4);

    -[HFSynchronizedTimer _updateTimerState](self, "_updateTimerState");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __35__HFSynchronizedTimer_addObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeObserver:", a2);

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFSynchronizedTimer observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[HFSynchronizedTimer _updateTimerState](self, "_updateTimerState");
}

- (void)_updateTimerState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  -[HFSynchronizedTimer observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[HFSynchronizedTimer activeTimer](self, "activeTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {

    if (!v6)
    {
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x1E0C99E88];
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __40__HFSynchronizedTimer__updateTimerState__block_invoke;
      v12 = &unk_1EA7316A0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v9, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFSynchronizedTimer setActiveTimer:](self, "setActiveTimer:", v8, v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(v5, "invalidate");

    -[HFSynchronizedTimer setActiveTimer:](self, "setActiveTimer:", 0);
  }
}

void __40__HFSynchronizedTimer__updateTimerState__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerDidFire");

}

- (void)_timerDidFire
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HFSynchronizedTimer observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "countdownTimerDidFire:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSTimer)activeTimer
{
  return self->_activeTimer;
}

- (void)setActiveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activeTimer, a3);
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeTimer, 0);
}

@end
