@implementation FBSDisplayMonitor

- (NSSet)connectedIdentities
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__FBSDisplayMonitor_connectedIdentities__block_invoke;
  v7[3] = &unk_1E38EDB68;
  v5 = v4;
  v8 = v5;
  -[FBSDisplayMonitor _lock_enumerateConnectedWithBlock:](self, "_lock_enumerateConnectedWithBlock:", v7);
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v5;
}

- (void)_lock_enumerateConnectedWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __55__FBSDisplayMonitor__lock_enumerateConnectedWithBlock___block_invoke;
    v6[3] = &unk_1E38EDC50;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v4;
    -[FBSDisplayMonitor _lock_enumerateSourcesWithBlock:](self, "_lock_enumerateSourcesWithBlock:", v6);

    v4 = v5;
  }

}

- (void)_lock_enumerateSourcesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMapTable objectEnumerator](self->_lock_sourcesByDisplay, "objectEnumerator", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

void __55__FBSDisplayMonitor__lock_enumerateConnectedWithBlock___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[FBSDisplaySource connectedConfigurations](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (FBSDisplayIdentity)mainIdentity
{
  void *v2;
  void *v3;

  -[FBSDisplayMonitor mainConfiguration](self, "mainConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayIdentity *)v3;
}

- (FBSDisplayConfiguration)mainConfiguration
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[FBSDisplaySource connectedConfigurations]((os_unfair_lock_s *)self->_mainDisplaySource);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isMainRootDisplay", (_QWORD)v8) & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (FBSDisplayConfiguration *)v3;
}

void __40__FBSDisplayMonitor_connectedIdentities__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __31__FBSDisplayMonitor_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (id)_initWithBookendObserver:(id)a3 transformer:(id)a4
{
  id v6;
  id v7;
  FBSDisplayMonitor *v8;
  FBSDisplayMonitor *v9;
  uint64_t v10;
  NSHashTable *lock_observers;
  void *v12;
  uint64_t v13;
  CADisplay *mainDisplay;
  CADisplay *v15;
  FBSDisplaySource *v16;
  FBSDisplaySource *mainDisplaySource;
  uint64_t v18;
  NSMapTable *lock_sourcesByDisplay;
  void *v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  CADisplay *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)FBSDisplayMonitor;
  v8 = -[FBSDisplayMonitor init](&v47, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_callOutQueue, MEMORY[0x1E0C80D38]);
    objc_storeWeak((id *)&v9->_lock_bookendObserver, v6);
    v9->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 4);
    lock_observers = v9->_lock_observers;
    v9->_lock_observers = (NSHashTable *)v10;

    objc_storeStrong((id *)&v9->_transformer, a4);
    if (!getCADisplayClass())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to find the symbol for CADisplay"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplayMonitor _initWithBookendObserver:transformer:].cold.1();
      objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EFE48);
    }
    objc_msgSend(getCADisplayClass(), "displays");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    mainDisplay = v9->_mainDisplay;
    v9->_mainDisplay = (CADisplay *)v13;

    v15 = v9->_mainDisplay;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to find the main CADisplay"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplayMonitor _initWithBookendObserver:transformer:].cold.2();
      objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EFEA0);
    }
    v16 = (FBSDisplaySource *)-[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:]([FBSDisplaySource alloc], v9->_mainDisplay, 1, -[CADisplay isExternal](v15, "isExternal"), v9);
    mainDisplaySource = v9->_mainDisplaySource;
    v9->_mainDisplaySource = v16;

    if (!v9->_mainDisplaySource)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to initialize mainDisplay source -> mainDisplay=%@"), v9->_mainDisplay);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplayMonitor _initWithBookendObserver:transformer:].cold.3();
      objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EFF00);
    }
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 2);
    lock_sourcesByDisplay = v9->_lock_sourcesByDisplay;
    v9->_lock_sourcesByDisplay = (NSMapTable *)v18;

    -[NSMapTable setObject:forKey:](v9->_lock_sourcesByDisplay, "setObject:forKey:", v9->_mainDisplaySource, v9->_mainDisplay);
    -[FBSDisplayMonitor mainIdentity](v9, "mainIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isMainDisplay");

    if ((v21 & 1) == 0)
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      -[FBSDisplayMonitor mainConfiguration](v9, "mainConfiguration");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("failed to initialize mainConfiguration -> %@"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplayMonitor _initWithBookendObserver:transformer:].cold.6();
      objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EFF74);
    }
    v42 = v7;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v12, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v23 = v12;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(v23);
          v28 = *(CADisplay **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v29 = -[CADisplay displayId](v28, "displayId");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "containsObject:", v30))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("two CADisplays had the same displayID(%u) -> $@"), v29, v23);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBSDisplayMonitor _initWithBookendObserver:transformer:].cold.4();
            objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A6EFD94);
          }
          objc_msgSend(v22, "addObject:", v30);
          if (v9->_mainDisplay != v28)
          {
            v31 = -[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:]([FBSDisplaySource alloc], v28, 0, 1, v9);
            if (!v31)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to initialize display source -> display=%@"), v28);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                -[FBSDisplayMonitor _initWithBookendObserver:transformer:].cold.5();
              objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A6EFDF0);
            }
            v32 = v31;
            -[NSMapTable setObject:forKey:](v9->_lock_sourcesByDisplay, "setObject:forKey:", v31, v28);
            -[FBSDisplaySource setAllowsUnknown:]((uint64_t)v32, v9->_lock_allowsUnknownDisplays);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v25);
    }

    v7 = v42;
  }

  return v9;
}

- (OS_dispatch_queue)callOutQueue
{
  return self->_callOutQueue;
}

- (FBSDisplayTransformer)transformer
{
  return self->_transformer;
}

- (FBSDisplayMonitor)init
{
  return (FBSDisplayMonitor *)-[FBSDisplayMonitor _initWithBookendObserver:transformer:](self, "_initWithBookendObserver:transformer:", 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_sourcesByDisplay, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_destroyWeak((id *)&self->_lock_bookendObserver);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_mainDisplaySource, 0);
  objc_storeStrong((id *)&self->_mainDisplay, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
}

- (void)addObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSHashTable containsObject:](self->_lock_observers, "containsObject:", v4))
    -[NSHashTable addObject:](self->_lock_observers, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayMonitor invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FBSDisplayMonitor;
  -[FBSDisplayMonitor dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSHashTable *lock_observers;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_lock_bookendObserver, 0);
  lock_observers = self->_lock_observers;
  self->_lock_observers = 0;

  -[FBSDisplayMonitor _lock_enumerateSourcesWithBlock:](self, "_lock_enumerateSourcesWithBlock:", &__block_literal_global_30);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSHashTable containsObject:](self->_lock_observers, "containsObject:", v4))
    -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (FBSDisplayMonitor)initWithInitializationCompletion:(id)a3
{
  id v4;
  FBSDisplayMonitor *v5;
  FBSDisplayMonitor *v6;
  NSObject *callOutQueue;
  _QWORD v9[4];
  FBSDisplayMonitor *v10;
  id v11;

  v4 = a3;
  v5 = -[FBSDisplayMonitor _initWithBookendObserver:transformer:](self, "_initWithBookendObserver:transformer:", 0, 0);
  v6 = v5;
  if (v4 && v5)
  {
    callOutQueue = v5->_callOutQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__FBSDisplayMonitor_initWithInitializationCompletion___block_invoke;
    v9[3] = &unk_1E38EBB98;
    v10 = v5;
    v11 = v4;
    dispatch_async(callOutQueue, v9);

  }
  return v6;
}

void __54__FBSDisplayMonitor_initWithInitializationCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__FBSDisplayMonitor_initWithInitializationCompletion___block_invoke_2;
  v5[3] = &unk_1E38EDB68;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "_lock_enumerateConnectedWithBlock:", v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __54__FBSDisplayMonitor_initWithInitializationCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)configurationForIdentity:(id)a3
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSDisplayMonitor *v11;
  uint64_t *v12;
  SEL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__FBSDisplayMonitor_configurationForIdentity___block_invoke;
  v9[3] = &unk_1E38EDB90;
  v6 = v5;
  v10 = v6;
  v11 = self;
  v12 = &v14;
  v13 = a2;
  -[FBSDisplayMonitor _lock_enumerateConnectedWithBlock:](self, "_lock_enumerateConnectedWithBlock:", v9);
  os_unfair_lock_unlock(&self->_lock);
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

void __46__FBSDisplayMonitor_configurationForIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if (!v5)
    goto LABEL_4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(_QWORD *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (!v8)
  {
    objc_storeStrong(v7, a2);
LABEL_4:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("somehow we ended up with two connected displays with the same identity - this shouldn't be possible : manager=%@"), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __46__FBSDisplayMonitor_configurationForIdentity___block_invoke_cold_1();
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (FBSDisplayMonitor)initWithTransformer:(id)a3
{
  id v4;
  void *v5;
  FBSDisplayMonitor *v6;
  FBSDisplayMonitor *result;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = -[FBSDisplayMonitor _initWithBookendObserver:transformer:](self, "_initWithBookendObserver:transformer:", 0, v4);

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("transformer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayMonitor initWithTransformer:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = (FBSDisplayMonitor *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)updateTransformsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__FBSDisplayMonitor_updateTransformsWithCompletion___block_invoke;
  v16[3] = &unk_1E38EDBD8;
  v6 = v5;
  v17 = v6;
  -[FBSDisplayMonitor _lock_enumerateSourcesWithBlock:](self, "_lock_enumerateSourcesWithBlock:", v16);
  os_unfair_lock_unlock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
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
        -[FBSDisplaySource updateTransforms](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v9);
  }

  if (v4)
    dispatch_async((dispatch_queue_t)self->_callOutQueue, v4);

}

uint64_t __52__FBSDisplayMonitor_updateTransformsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (BOOL)allowsUnknownDisplays
{
  FBSDisplayMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_allowsUnknownDisplays;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAllowsUnknownDisplays:(BOOL)a3
{
  _BOOL4 v3;
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
  _QWORD v15[4];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&setAllowsUnknownDisplays____allowsUnknownLock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_allowsUnknownDisplays != v3)
  {
    self->_lock_allowsUnknownDisplays = v3;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__FBSDisplayMonitor_setAllowsUnknownDisplays___block_invoke;
    v15[3] = &unk_1E38EDBD8;
    v16 = v5;
    -[FBSDisplayMonitor _lock_enumerateSourcesWithBlock:](self, "_lock_enumerateSourcesWithBlock:", v15);

  }
  os_unfair_lock_unlock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
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
        -[FBSDisplaySource setAllowsUnknown:](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&setAllowsUnknownDisplays____allowsUnknownLock);
}

uint64_t __46__FBSDisplayMonitor_setAllowsUnknownDisplays___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)_postInitialBookendObserverConnections
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_DEBUG, "posting bookend initialization %@", (uint8_t *)&v2, 0xCu);
}

void __59__FBSDisplayMonitor__postInitialBookendObserverConnections__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "addObject:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v9);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }

}

- (BOOL)canPostToBookendObserver
{
  FBSDisplayMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_canPostToBookendObserver;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (FBSDisplayObserving)bookendObserver
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_lock_bookendObserver);
  os_unfair_lock_unlock(p_lock);
  return (FBSDisplayObserving *)WeakRetained;
}

- (NSArray)observers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_lock_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  FBSDisplayMonitor *v12;
  id v13;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __32__FBSDisplayMonitor_description__block_invoke;
  v11 = &unk_1E38EAE08;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("sources"), v4, &v8);

  objc_msgSend(v5, "build", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

void __32__FBSDisplayMonitor_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
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
  objc_msgSend(*(id *)(a1 + 32), "_sortedSources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "succinctDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:withName:", v8, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  FBSDisplayMonitor *v13;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __37__FBSDisplayMonitor_debugDescription__block_invoke;
  v11 = &unk_1E38EAE08;
  v12 = v3;
  v13 = self;
  v4 = v3;
  v5 = (id)objc_msgSend(v4, "modifyBody:", &v8);
  objc_msgSend(v4, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

void __37__FBSDisplayMonitor_debugDescription__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sortedSources");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:", v2, CFSTR("sources"), 0);

}

- (id)_sortedSources
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectEnumerator](self->_lock_sourcesByDisplay, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__FBSDisplayMonitor__sortedSources__block_invoke;
  v9[3] = &unk_1E38EDC28;
  v9[4] = self;
  v9[5] = a2;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __35__FBSDisplayMonitor__sortedSources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t result;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = -[FBSDisplaySource displayID]((uint64_t)v5);
  v8 = -[FBSDisplaySource displayID]((uint64_t)v6);
  if (v7 == v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we previously guaranteed that they can never be the same"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __35__FBSDisplayMonitor__sortedSources__block_invoke_cold_1(a1);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    if (v7 < v8)
      v9 = -1;
    else
      v9 = 1;

    return v9;
  }
  return result;
}

- (void)_initWithBookendObserver:transformer:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithBookendObserver:transformer:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithBookendObserver:transformer:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithBookendObserver:transformer:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithBookendObserver:transformer:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithBookendObserver:transformer:.cold.6()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __46__FBSDisplayMonitor_configurationForIdentity___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(*(SEL *)(v0 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithTransformer:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __35__FBSDisplayMonitor__sortedSources__block_invoke_cold_1(uint64_t a1)
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

  NSStringFromSelector(*(SEL *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
