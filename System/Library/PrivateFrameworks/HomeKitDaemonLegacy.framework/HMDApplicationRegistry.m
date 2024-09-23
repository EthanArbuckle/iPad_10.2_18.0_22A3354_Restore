@implementation HMDApplicationRegistry

- (id)applicationInfoForBundleURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    __HMDApplicationRegistryApplicationForBundleURL((id *)&self->super.super.isa, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      || (+[HMDApplicationInfo applicationInfoForBundleURL:](HMDApplicationInfo, "applicationInfoForBundleURL:", v4), v5 = (void *)objc_claimAutoreleasedReturnValue(), !objc_msgSend(v5, "isInstalled")))
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[NSMutableSet addObject:](self->_applications, "addObject:", v5);
      os_unfair_lock_unlock(&self->_lock);
      __HMDApplicationRegistryHandleAddedApplicationInfo((uint64_t)self, v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)sharedRegistry
{
  if (sharedRegistry_onceToken_111705 != -1)
    dispatch_once(&sharedRegistry_onceToken_111705, &__block_literal_global_111706);
  return (id)sharedRegistry_sharedRegistry;
}

- (HMDApplicationRegistry)init
{
  HMDApplicationRegistry *v2;
  uint64_t v3;
  NSMutableSet *applications;
  uint64_t v5;
  LSApplicationWorkspace *workspace;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDApplicationRegistry;
  v2 = -[HMDApplicationRegistry init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    applications = v2->_applications;
    v2->_applications = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = objc_claimAutoreleasedReturnValue();
    workspace = v2->_workspace;
    v2->_workspace = (LSApplicationWorkspace *)v5;

    -[LSApplicationWorkspace addObserver:](v2->_workspace, "addObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[LSApplicationWorkspace removeObserver:](self->_workspace, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HMDApplicationRegistry;
  -[HMDApplicationRegistry dealloc](&v3, sel_dealloc);
}

- (NSArray)applications
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_applications, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)applicationInfoForBundleIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    __HMDApplicationRegistryApplicationWithBundleIdentifier((id *)&self->super.super.isa, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      +[HMDApplicationInfo applicationInfoForBundleIdentifier:](HMDApplicationInfo, "applicationInfoForBundleIdentifier:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isInstalled"))
      {
        -[NSMutableSet addObject:](self->_applications, "addObject:", v8);
        os_unfair_lock_unlock(&self->_lock);
        __HMDApplicationRegistryHandleAddedApplicationInfo((uint64_t)self, v8);
      }
      else
      {
        os_unfair_lock_unlock(&self->_lock);
      }
      v7 = v8;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        __HMDApplicationRegistryApplicationInfoForApplicationProxy(self, *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[NSMutableSet removeObject:](self->_applications, "removeObject:", v10);
          objc_msgSend(v5, "addObject:", v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        logAndPostNotification(CFSTR("HMDApplicationUninstalledNotification"), *(void **)(*((_QWORD *)&v15 + 1) + 8 * v14++), 0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)applicationsDidInstall:(id)a3
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
  _QWORD v12[5];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__HMDApplicationRegistry_applicationsDidInstall___block_invoke;
  v12[3] = &unk_1E89B3A70;
  v12[4] = self;
  objc_msgSend(a3, "na_map:", v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
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
        logAndPostNotification(CFSTR("HMDApplicationInstalledNotification"), *(void **)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_applications, 0);
}

HMDApplicationInfo *__49__HMDApplicationRegistry_applicationsDidInstall___block_invoke(uint64_t a1, void *a2)
{
  return __HMDApplicationRegistryApplicationInfoForApplicationProxy(*(void **)(a1 + 32), a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_111700 != -1)
    dispatch_once(&logCategory__hmf_once_t3_111700, &__block_literal_global_9_111701);
  return (id)logCategory__hmf_once_v4_111702;
}

void __37__HMDApplicationRegistry_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_111702;
  logCategory__hmf_once_v4_111702 = v0;

}

void __40__HMDApplicationRegistry_sharedRegistry__block_invoke()
{
  HMDApplicationRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(HMDApplicationRegistry);
  v1 = (void *)sharedRegistry_sharedRegistry;
  sharedRegistry_sharedRegistry = (uint64_t)v0;

}

@end
