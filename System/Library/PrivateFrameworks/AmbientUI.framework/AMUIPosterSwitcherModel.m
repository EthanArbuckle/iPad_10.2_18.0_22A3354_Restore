@implementation AMUIPosterSwitcherModel

+ (AMUIPosterSwitcherModel)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__AMUIPosterSwitcherModel_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (AMUIPosterSwitcherModel *)(id)sharedInstance___sharedInstance;
}

void __41__AMUIPosterSwitcherModel_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;

}

- (AMUIPosterSwitcherModel)init
{
  AMUIPosterSwitcherModel *v2;
  AMUIPosterSwitcherModel *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  AMUIPosterSwitcherModel *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AMUIPosterUpdater *posterConfigurationsUpdater;
  _QWORD v19[4];
  AMUIPosterSwitcherModel *v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)AMUIPosterSwitcherModel;
  v2 = -[AMUIPosterSwitcherModel init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_stateLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(MEMORY[0x24BE74C70]);
    v5 = objc_alloc(MEMORY[0x24BE74C38]);
    v6 = *MEMORY[0x24BE74C78];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE74C78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithRoles:", v7);

    objc_initWeak(&location, v3);
    v9 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __31__AMUIPosterSwitcherModel_init__block_invoke;
    v21[3] = &unk_250763A10;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v8, "setHandler:", v21);
    objc_msgSend(v4, "setActivePosterRoleObserver:", v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74C40]), "initWithRole:", v6);
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __31__AMUIPosterSwitcherModel_init__block_invoke_2;
    v19[3] = &unk_250763A38;
    v11 = v3;
    v20 = v11;
    objc_msgSend(v10, "setHandler:", v19);
    objc_msgSend(v4, "setPostersCollectionRoleObserver:", v10);
    v12 = objc_alloc(MEMORY[0x24BE74C68]);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithExplanation:", v14);

    objc_msgSend(v15, "activateWithConfiguration:", v4);
    objc_storeStrong((id *)&v11->_wallpaperObserver, v15);
    +[AMUIPosterUpdater defaultUpdater](AMUIPosterUpdater, "defaultUpdater");
    v16 = objc_claimAutoreleasedReturnValue();
    posterConfigurationsUpdater = v11->_posterConfigurationsUpdater;
    v11->_posterConfigurationsUpdater = (AMUIPosterUpdater *)v16;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __31__AMUIPosterSwitcherModel_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "activePoster");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setActiveConfiguration:", v5);

  }
}

void __31__AMUIPosterSwitcherModel_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = v4;
    objc_msgSend(a4, "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setPosterConfigurations:", v7);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[PRSWallpaperObserver invalidate](self->_wallpaperObserver, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterSwitcherModel;
  -[AMUIPosterSwitcherModel dealloc](&v3, sel_dealloc);
}

- (NSArray)posterConfigurations
{
  os_unfair_lock_s *p_stateLock;
  NSArray *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_posterConfigurations;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (void)_setPosterConfigurations:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;
  NSArray *v6;
  NSArray *posterConfigurations;
  void *v8;
  id v9;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  posterConfigurations = self->_posterConfigurations;
  self->_posterConfigurations = v6;

  v8 = (void *)-[NSArray copy](self->_posterConfigurations, "copy");
  os_unfair_lock_unlock(p_stateLock);
  v9 = v8;
  BSDispatchMain();

}

void __52__AMUIPosterSwitcherModel__setPosterConfigurations___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "posterSwitcherModel:didUpdateConfigurations:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (PRSPosterConfiguration)activeConfiguration
{
  os_unfair_lock_s *p_stateLock;
  PRSPosterConfiguration *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_activeConfiguration;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (void)_setActiveConfiguration:(id)a3
{
  PRSPosterConfiguration *v5;
  PRSPosterConfiguration *v6;

  v5 = (PRSPosterConfiguration *)a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_activeConfiguration != v5)
    objc_storeStrong((id *)&self->_activeConfiguration, a3);
  os_unfair_lock_unlock(&self->_stateLock);
  v6 = v5;
  BSDispatchMain();

}

void __51__AMUIPosterSwitcherModel__setActiveConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "posterSwitcherModel:didUpdateActiveConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (AMUIPosterUpdater)posterConfigurationsUpdater
{
  return self->_posterConfigurationsUpdater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterConfigurationsUpdater, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_posterConfigurations, 0);
  objc_storeStrong((id *)&self->_wallpaperObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
