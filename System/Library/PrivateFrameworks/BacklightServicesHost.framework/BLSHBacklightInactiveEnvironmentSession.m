@implementation BLSHBacklightInactiveEnvironmentSession

+ (BLSHBacklightInactiveEnvironmentSession)sessionWithPresentation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPresentation:", v4);

  return (BLSHBacklightInactiveEnvironmentSession *)v5;
}

- (BLSHBacklightInactiveEnvironmentSession)initWithPresentation:(id)a3
{
  id v6;
  BLSHBacklightInactiveEnvironmentSession *v7;
  BLSHBacklightInactiveEnvironmentSession *v8;
  uint64_t v9;
  NSHashTable *observers;
  uint64_t v11;
  NSHashTable *environmentObservers;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BLSHBacklightInactiveEnvironmentSession;
  v7 = -[BLSHBacklightInactiveEnvironmentSession init](&v25, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("presentation must not be nil"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHBacklightInactiveEnvironmentSession initWithPresentation:].cold.1(a2);
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145CDFF4);
    }
    v7->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_presentation, a3);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 2);
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 2);
    environmentObservers = v8->_environmentObservers;
    v8->_environmentObservers = (NSHashTable *)v11;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v6, "presentationEntries", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "environment");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObserver:", v8);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v15);
    }

  }
  return v8;
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (BLSHBacklightInactiveEnvironmentSessionUpdating)updater
{
  os_unfair_lock_s *p_lock;
  BLSHBacklightInactiveEnvironmentSessionUpdating *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_updater;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUpdater:(id)a3
{
  BLSHBacklightInactiveEnvironmentSessionUpdating *v4;
  BLSHBacklightInactiveEnvironmentSessionUpdating *updater;

  v4 = (BLSHBacklightInactiveEnvironmentSessionUpdating *)a3;
  os_unfair_lock_lock(&self->_lock);
  updater = self->_updater;
  self->_updater = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPresentation:(id)a3
{
  id v5;
  BLSHBacklightEnvironmentPresentation *presentation;
  BLSHBacklightEnvironmentPresentation *v7;
  BLSHBacklightEnvironmentPresentation *v8;
  BLSHBacklightEnvironmentPresentation *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v5 = a3;
  if (v5)
  {
    v12 = v5;
    os_unfair_lock_lock(&self->_lock);
    if (objc_msgSend(v12, "isEqual:", self->_presentation))
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      presentation = self->_presentation;
      v7 = (BLSHBacklightEnvironmentPresentation *)v12;
      v8 = self->_presentation;
      self->_presentation = v7;
      v9 = presentation;

      os_unfair_lock_unlock(&self->_lock);
      -[BLSHBacklightInactiveEnvironmentSession updater](self, "updater");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inactiveEnvironmentSession:updateToPresentation:", self, v7);

      v13[4] = self;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __59__BLSHBacklightInactiveEnvironmentSession_setPresentation___block_invoke;
      v14[3] = &unk_24D1BCA20;
      v14[4] = self;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __59__BLSHBacklightInactiveEnvironmentSession_setPresentation___block_invoke_2;
      v13[3] = &unk_24D1BCA20;
      -[BLSHBacklightEnvironmentPresentation differenceFromPresentation:forEachRemoval:forEachAddition:](v7, "differenceFromPresentation:forEachRemoval:forEachAddition:", v9, v14, v13);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("attempted to set presentation to nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightInactiveEnvironmentSession setPresentation:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __59__BLSHBacklightInactiveEnvironmentSession_setPresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObserver:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__BLSHBacklightInactiveEnvironmentSession_setPresentation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObserver:", *(_QWORD *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)addEnvironmentsObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_environmentObservers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeEnvironmentsObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_environmentObservers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)updaterDidUpdateToPresentation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__BLSHBacklightInactiveEnvironmentSession_updaterDidUpdateToPresentation___block_invoke;
  v6[3] = &unk_24D1BCA48;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BLSHBacklightInactiveEnvironmentSession notifyObserversWithBlock:]((uint64_t)self, v6);

}

uint64_t __74__BLSHBacklightInactiveEnvironmentSession_updaterDidUpdateToPresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "inactiveEnvironmentSession:didUpdateToPresentation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  os_unfair_lock_s *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 8), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)updaterDidBeginUpdateToBacklightState:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__BLSHBacklightInactiveEnvironmentSession_updaterDidBeginUpdateToBacklightState___block_invoke;
  v3[3] = &unk_24D1BCA70;
  v3[4] = self;
  v3[5] = a3;
  -[BLSHBacklightInactiveEnvironmentSession notifyObserversWithBlock:]((uint64_t)self, v3);
}

void __81__BLSHBacklightInactiveEnvironmentSession_updaterDidBeginUpdateToBacklightState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inactiveEnvironmentSession:didBeginUpdateToBacklightState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)sessionDidEnd
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ended = 1;
  -[BLSHBacklightEnvironmentPresentation presentationEntries](self->_presentation, "presentationEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable removeAllObjects](self->_environmentObservers, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "environment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObserver:", self);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__BLSHBacklightInactiveEnvironmentSession_sessionDidEnd__block_invoke;
  v11[3] = &unk_24D1BCA98;
  v11[4] = self;
  -[BLSHBacklightInactiveEnvironmentSession notifyObserversWithBlock:]((uint64_t)self, v11);

}

uint64_t __56__BLSHBacklightInactiveEnvironmentSession_sessionDidEnd__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndInactiveEnvironmentSession:", *(_QWORD *)(a1 + 32));
}

- (void)hostEnvironment:(id)a3 clientDidUpdateEnabled:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_clientDidUpdateEnabled___block_invoke;
  v8[3] = &unk_24D1BC980;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);

}

void __82__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_clientDidUpdateEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:clientDidUpdateEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)notifyEnvironmentObserversWithBlock:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  os_unfair_lock_s *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 16), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)hostEnvironment:(id)a3 clientDidUpdateSupportsAlwaysOn:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_clientDidUpdateSupportsAlwaysOn___block_invoke;
  v8[3] = &unk_24D1BC980;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);

}

void __91__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_clientDidUpdateSupportsAlwaysOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:clientDidUpdateSupportsAlwaysOn:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_invalidateContentForReason___block_invoke;
  v10[3] = &unk_24D1BC9A8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v10);

}

void __86__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:invalidateContentForReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)hostEnvironment:(id)a3 hostDidSetAlwaysOnEnabledForEnvironment:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __99__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetAlwaysOnEnabledForEnvironment___block_invoke;
  v8[3] = &unk_24D1BC980;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);

}

void __99__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetAlwaysOnEnabledForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetAlwaysOnEnabledForEnvironment:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)hostEnvironment:(id)a3 hostDidSetLiveUpdating:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetLiveUpdating___block_invoke;
  v8[3] = &unk_24D1BC980;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);

}

void __82__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetLiveUpdating___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetLiveUpdating:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)hostEnvironment:(id)a3 hostDidSetUnrestrictedFramerateUpdates:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __98__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke;
  v8[3] = &unk_24D1BC980;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);

}

void __98__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetUnrestrictedFramerateUpdates:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  return self->_presentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_environmentObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)initWithPresentation:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)setPresentation:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
