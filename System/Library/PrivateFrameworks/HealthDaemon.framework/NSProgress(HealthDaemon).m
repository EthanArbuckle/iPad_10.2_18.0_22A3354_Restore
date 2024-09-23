@implementation NSProgress(HealthDaemon)

+ (_HDMirroredProgress)hd_progressMirroringProgress:()HealthDaemon
{
  id v4;
  _HDMirroredProgress *v5;
  id v6;
  _HDMirroredProgress *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [_HDMirroredProgress alloc];
  v6 = v4;
  if (v5)
  {
    v14.receiver = v5;
    v14.super_class = (Class)_HDMirroredProgress;
    v7 = (_HDMirroredProgress *)objc_msgSendSuper2(&v14, sel_initWithParent_userInfo_, 0, 0);
    v5 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v7->_originalProgress, a3);
      os_unfair_lock_lock(&v5->_lock);
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      +[_HDMirroredProgress _KVOKeyPaths]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            -[NSProgress addObserver:forKeyPath:options:context:](v5->_originalProgress, "addObserver:forKeyPath:options:context:", v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++), 0, _HDProgressMirrorObserverContext);
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

      os_unfair_lock_unlock(&v5->_lock);
      -[_HDMirroredProgress _update]((uint64_t)v5);
    }
  }

  return v5;
}

+ (id)hk_finishedDiscreteProgressWithTotalUnitCount:()HealthDaemon
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setCompletedUnitCount:", objc_msgSend(v0, "totalUnitCount"));
  return v0;
}

@end
