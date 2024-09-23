@implementation NAValueThrottler

- (NAValueThrottler)initWithThrottleInterval:(double)a3
{
  return -[NAValueThrottler initWithThrottleInterval:initialValue:](self, "initWithThrottleInterval:initialValue:", 0, a3);
}

- (NAValueThrottler)initWithThrottleInterval:(double)a3 initialValue:(id)a4
{
  id v7;
  NAValueThrottler *v8;
  NAValueThrottler *v9;
  uint64_t v10;
  NSMutableSet *observerBlocks;
  uint64_t v12;
  NAScheduler *updateScheduler;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NAValueThrottler;
  v8 = -[NAValueThrottler init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_throttleInterval = a3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    observerBlocks = v9->_observerBlocks;
    v9->_observerBlocks = (NSMutableSet *)v10;

    +[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler");
    v12 = objc_claimAutoreleasedReturnValue();
    updateScheduler = v9->_updateScheduler;
    v9->_updateScheduler = (NAScheduler *)v12;

    objc_storeStrong(&v9->_value, a4);
  }

  return v9;
}

- (NAValueThrottler)init
{
  return -[NAValueThrottler initWithThrottleInterval:](self, "initWithThrottleInterval:", 0.0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NAValueThrottler valueUpdateCancelationToken](self, "valueUpdateCancelationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)NAValueThrottler;
  -[NAValueThrottler dealloc](&v4, sel_dealloc);
}

- (void)setValue:(id)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id value;
  char v9;
  id v10;

  v4 = a4;
  v7 = a3;
  value = self->_value;
  if (value != v7)
  {
    v10 = v7;
    v9 = objc_msgSend(value, "isEqual:", v7);
    v7 = v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong(&self->_value, a3);
      v7 = v10;
      if (v4)
      {
        -[NAValueThrottler _enqueueValueUpdateIfNecessary](self, "_enqueueValueUpdateIfNecessary");
        v7 = v10;
      }
    }
  }

}

- (void)setValue:(id)a3
{
  -[NAValueThrottler setValue:notifyObservers:](self, "setValue:notifyObservers:", a3, 1);
}

- (void)setUpdateScheduler:(id)a3
{
  void *v5;
  void *v6;
  NAScheduler *v7;

  v7 = (NAScheduler *)a3;
  if (self->_updateScheduler != v7)
  {
    objc_storeStrong((id *)&self->_updateScheduler, a3);
    -[NAValueThrottler valueUpdateCancelationToken](self, "valueUpdateCancelationToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NAValueThrottler valueUpdateCancelationToken](self, "valueUpdateCancelationToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancel");

      -[NAValueThrottler setValueUpdateCancelationToken:](self, "setValueUpdateCancelationToken:", 0);
      -[NAValueThrottler _enqueueValueUpdateIfNecessary](self, "_enqueueValueUpdateIfNecessary");
    }
  }

}

- (void)_enqueueValueUpdateIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[NAValueThrottler valueUpdateCancelationToken](self, "valueUpdateCancelationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    -[NAValueThrottler updateScheduler](self, "updateScheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAValueThrottler throttleInterval](self, "throttleInterval");
    v6 = v5;
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __50__NAValueThrottler__enqueueValueUpdateIfNecessary__block_invoke;
    v11 = &unk_1E6227E00;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "afterDelay:performBlock:", &v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAValueThrottler setValueUpdateCancelationToken:](self, "setValueUpdateCancelationToken:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __50__NAValueThrottler__enqueueValueUpdateIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setValueUpdateCancelationToken:", 0);
  objc_msgSend(WeakRetained, "_notifyObserversOfValueUpdate");

}

- (void)_notifyObserversOfValueUpdate
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_observerBlocks;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[NAValueThrottler value](self, "value", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)observeValueChangesWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *observerBlocks;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  observerBlocks = self->_observerBlocks;
  v7 = (void *)MEMORY[0x1B5E0F7A8]();
  -[NSMutableSet addObject:](observerBlocks, "addObject:", v7);

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__NAValueThrottler_observeValueChangesWithBlock___block_invoke;
  v11[3] = &unk_1E6227E28;
  objc_copyWeak(&v13, &location);
  v8 = v5;
  v12 = v8;
  +[NACancelationToken tokenWithCancelationBlock:](NACancelationToken, "tokenWithCancelationBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __49__NAValueThrottler_observeValueChangesWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)WeakRetained[4];
  v3 = (void *)MEMORY[0x1B5E0F7A8](*(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "removeObject:", v3);

}

- (void)flushValueChanges
{
  void *v3;
  void *v4;

  -[NAValueThrottler valueUpdateCancelationToken](self, "valueUpdateCancelationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NAValueThrottler valueUpdateCancelationToken](self, "valueUpdateCancelationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[NAValueThrottler setValueUpdateCancelationToken:](self, "setValueUpdateCancelationToken:", 0);
    -[NAValueThrottler _notifyObserversOfValueUpdate](self, "_notifyObserversOfValueUpdate");
  }
}

- (BOOL)hasPendingValueChange
{
  void *v2;
  BOOL v3;

  -[NAValueThrottler valueUpdateCancelationToken](self, "valueUpdateCancelationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (double)throttleInterval
{
  return self->_throttleInterval;
}

- (NAScheduler)updateScheduler
{
  return self->_updateScheduler;
}

- (id)value
{
  return self->_value;
}

- (NSMutableSet)observerBlocks
{
  return self->_observerBlocks;
}

- (NACancelable)valueUpdateCancelationToken
{
  return self->_valueUpdateCancelationToken;
}

- (void)setValueUpdateCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_valueUpdateCancelationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueUpdateCancelationToken, 0);
  objc_storeStrong((id *)&self->_observerBlocks, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_updateScheduler, 0);
}

@end
