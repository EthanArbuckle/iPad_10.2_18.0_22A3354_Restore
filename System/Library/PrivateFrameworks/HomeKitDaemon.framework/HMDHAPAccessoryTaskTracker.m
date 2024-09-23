@implementation HMDHAPAccessoryTaskTracker

- (HMDHAPAccessoryTaskTracker)init
{
  HMDHAPAccessoryTaskTracker *v2;
  uint64_t v3;
  NSMutableDictionary *pendingTasks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDHAPAccessoryTaskTracker;
  v2 = -[HMDHAPAccessoryTaskTracker init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    pendingTasks = v2->_pendingTasks;
    v2->_pendingTasks = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)executeTask:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *pendingTasks;
  void *v6;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  pendingTasks = self->_pendingTasks;
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](pendingTasks, "setObject:forKey:", v7, v6);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v7, "execute");

}

- (void)removePendingTaskWithIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->_pendingTasks, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (unint64_t)nextTaskIdentifier
{
  os_unfair_lock_s *p_lock;
  unint64_t currentTaskIdentifier;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  currentTaskIdentifier = self->_currentTaskIdentifier;
  self->_currentTaskIdentifier = currentTaskIdentifier + 1;
  os_unfair_lock_unlock(p_lock);
  return currentTaskIdentifier;
}

- (id)pendingRemoteTasks
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  os_unfair_lock_t lock;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[NSMutableDictionary allValues](self->_pendingTasks, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v35;
    v27 = *(_QWORD *)v35;
    v28 = v4;
    do
    {
      v7 = 0;
      v29 = v5;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
        if ((objc_msgSend(v8, "supportsMultiPartResponse", lock) & 1) != 0)
        {
          v9 = v8;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 = v9;
          else
            v10 = 0;
          v11 = v10;

          if (v11)
          {
            objc_msgSend(v3, "addObject:", v11);
          }
          else
          {
            v12 = v9;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v13 = v12;
            else
              v13 = 0;
            v14 = v13;

            objc_msgSend(v14, "remoteTask");
            v9 = (id)objc_claimAutoreleasedReturnValue();

            if (v9)
            {
              objc_msgSend(v3, "addObject:", v9);
            }
            else
            {
              v32 = 0u;
              v33 = 0u;
              v30 = 0u;
              v31 = 0u;
              v15 = v12;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v16 = v15;
              else
                v16 = 0;
              v17 = v16;

              objc_msgSend(v17, "remoteFallbackTasks");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v9 = 0;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              if (v19)
              {
                v20 = *(_QWORD *)v31;
                do
                {
                  for (i = 0; i != v19; ++i)
                  {
                    if (*(_QWORD *)v31 != v20)
                      objc_enumerationMutation(v18);
                    objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "remoteTask");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v23 = v22;
                    else
                      v23 = 0;
                    v24 = v23;

                    v9 = v24;
                    if (v24)
                      objc_msgSend(v3, "addObject:", v24);
                  }
                  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
                }
                while (v19);
              }

            }
          }

          v6 = v27;
          v4 = v28;
          v5 = v29;
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
  return v3;
}

- (NSMutableDictionary)pendingTasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTasks, 0);
}

@end
