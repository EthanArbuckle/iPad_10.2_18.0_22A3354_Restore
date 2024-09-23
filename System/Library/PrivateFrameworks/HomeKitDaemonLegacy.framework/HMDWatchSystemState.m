@implementation HMDWatchSystemState

- (HMDWatchSystemState)init
{
  HMDWatchSystemState *v2;
  HMDWatchSystemState *v3;
  uint64_t v4;
  NSHashTable *watchSystemStateDelegates;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDWatchSystemState;
  v2 = -[HMDWatchSystemState init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_companionReachable = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    watchSystemStateDelegates = v3->_watchSystemStateDelegates;
    v3->_watchSystemStateDelegates = (NSHashTable *)v4;

  }
  return v3;
}

- (BOOL)isCompanionReachable
{
  HMDWatchSystemState *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_companionReachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCompanionReachable:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSHashTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v6 = os_unfair_lock_lock_with_options();
  if (self->_companionReachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0](v6);
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[HMDWatchState] companion reachability is changing from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    +[HMDWatchConnectivityLogEventManager sharedInstance](HMDWatchConnectivityLogEventManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v12, "incrementWatchAddedNotificationCount");
    else
      objc_msgSend(v12, "incrementWatchRemovedNotificationCount");

    self->_companionReachable = v3;
    os_unfair_lock_unlock(p_lock);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = self->_watchSystemStateDelegates;
    v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          -[HMDWatchSystemState _callDidUpdateReachabilityChangeForCompanion:forDelegate:](self, "_callDidUpdateReachabilityChangeForCompanion:forDelegate:", v3, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        }
        v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

- (NSHashTable)watchSystemStateDelegates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSHashTable copy](self->_watchSystemStateDelegates, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSHashTable *)v4;
}

- (void)registerDelegate:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSHashTable addObject:](self->_watchSystemStateDelegates, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_callDidUpdateReachabilityChangeForCompanion:(BOOL)a3 forDelegate:(id)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EFB2D4A8) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didUpdateReachabilityChangeForCompanion:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchSystemStateDelegates, 0);
}

+ (id)sharedState
{
  id v3;
  _QWORD block[5];

  if (isWatch())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__HMDWatchSystemState_sharedState__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedState_onceToken != -1)
      dispatch_once(&sharedState_onceToken, block);
    v3 = (id)sharedState_shared;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __34__HMDWatchSystemState_sharedState__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedState_shared;
  sharedState_shared = (uint64_t)v1;

}

@end
