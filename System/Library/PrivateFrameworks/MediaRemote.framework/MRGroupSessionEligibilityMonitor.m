@implementation MRGroupSessionEligibilityMonitor

- (MRGroupSessionEligibilityMonitor)init
{
  MRGroupSessionEligibilityMonitor *v2;
  uint64_t v3;
  NSHashTable *observers;
  void *v5;
  uint64_t v6;
  MRGroupSessionEligibilityStatus *status;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRGroupSessionEligibilityMonitor;
  v2 = -[MRGroupSessionEligibilityMonitor init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    +[MRGroupSessionRequestManager sharedManager](MRGroupSessionRequestManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eligibilityStatus");
    v6 = objc_claimAutoreleasedReturnValue();
    status = v2->_status;
    v2->_status = (MRGroupSessionEligibilityStatus *)v6;

    -[MRGroupSessionEligibilityMonitor registerNotifications](v2, "registerNotifications");
  }
  return v2;
}

- (void)registerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_updateStatus_, CFSTR("MRGroupSessionEligibilityDidChangeNotification"), 0);

}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[MRGroupSessionEligibilityMonitor observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[MRGroupSessionEligibilityMonitor observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (MRGroupSessionEligibilityStatus)status
{
  os_unfair_lock_s *p_lock;
  MRGroupSessionEligibilityStatus *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_status;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateStatus:(id)a3
{
  void *v4;
  void *v5;
  MRGroupSessionEligibilityStatus *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MRGroupSessionEligibilityStatusUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  v6 = self->_status;
  objc_storeStrong((id *)&self->_status, v5);
  -[MRGroupSessionEligibilityMonitor observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "groupSessionMonitor:statusDidChangeFrom:to:", self, v6, v5);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "groupSessionMonitor:statusDidChange:", self, v5, (_QWORD)v15);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
