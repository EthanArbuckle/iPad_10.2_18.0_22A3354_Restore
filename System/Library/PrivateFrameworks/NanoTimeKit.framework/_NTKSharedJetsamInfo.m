@implementation _NTKSharedJetsamInfo

- (BOOL)getInfoFor:(id)a3 into:(jetsam_info *)a4
{
  id v6;
  int v7;
  unint64_t v8;
  void *v9;
  int64_t currentKB;
  uint64_t v11;
  int64_t maxLifetimeKB;
  _OWORD v14[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  memset(v14, 0, sizeof(v14));
  v7 = proc_pid_rusage(self->_pid, 4, (rusage_info_t *)v14);
  if (!v7)
  {
    v8 = (unint64_t)v26 >> 10;
    a4->currentKB = *((_QWORD *)&v15 + 1) >> 10;
    a4->maxLifetimeKB = v8;
    -[NSLock lock](self->_fetchersLock, "lock");
    -[NSMapTable objectForKey:](self->_fetchers, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock unlock](self->_fetchersLock, "unlock");
    if (v9)
    {
      if (*((_QWORD *)&v28 + 1) >> 10 <= a4->currentKB)
        currentKB = a4->currentKB;
      else
        currentKB = *((_QWORD *)&v28 + 1) >> 10;
      v11 = objc_msgSend(v9, "longLongValue");
      if (currentKB <= v11)
        maxLifetimeKB = v11;
      else
        maxLifetimeKB = currentKB;
    }
    else
    {
      maxLifetimeKB = a4->maxLifetimeKB;
    }
    a4->maxIntervalKB = maxLifetimeKB;

  }
  return v7 == 0;
}

+ (id)sharedJetsamInfo
{
  if (sharedJetsamInfo_onceToken != -1)
    dispatch_once(&sharedJetsamInfo_onceToken, &__block_literal_global_130);
  return (id)sharedJetsamInfo_sharedJetsamInfo;
}

- (void)unregister:(id)a3
{
  NSLock *fetchersLock;
  id v5;

  fetchersLock = self->_fetchersLock;
  v5 = a3;
  -[NSLock lock](fetchersLock, "lock");
  -[NSMapTable removeObjectForKey:](self->_fetchers, "removeObjectForKey:", v5);

  -[NSLock unlock](self->_fetchersLock, "unlock");
}

- (BOOL)resetIntervalFor:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  NSMapTable *fetchers;
  void *v23;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  rusage_info_t buffer[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  *(_OWORD *)buffer = 0u;
  v38 = 0u;
  if (proc_pid_rusage(self->_pid, 4, buffer))
  {
    v5 = 0;
  }
  else
  {
    v25 = v4;
    v6 = *((_QWORD *)&v54 + 1);
    if (proc_reset_footprint_interval())
    {
      v5 = 0;
      v4 = v25;
    }
    else
    {
      v7 = v6 >> 10;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMapTable count](self->_fetchers, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSLock lock](self->_fetchersLock, "lock");
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[NSMapTable keyEnumerator](self->_fetchers, "keyEnumerator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v8);
            v13 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (v13 != v25)
            {
              -[NSMapTable objectForKey:](self->_fetchers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "longLongValue");

              if (v15 < v7)
                objc_msgSend(v26, "addObject:", v13);
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v10);
      }

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v16 = v26;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
            fetchers = self->_fetchers;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7, v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](fetchers, "setObject:forKey:", v23, v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v18);
      }

      v4 = v25;
      -[NSMapTable setObject:forKey:](self->_fetchers, "setObject:forKey:", &unk_1E6CA1260, v25);
      -[NSLock unlock](self->_fetchersLock, "unlock");

      v5 = 1;
    }
  }

  return v5;
}

- (_NTKSharedJetsamInfo)init
{
  _NTKSharedJetsamInfo *v2;
  uint64_t v3;
  NSLock *fetchersLock;
  uint64_t v5;
  NSMapTable *fetchers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NTKSharedJetsamInfo;
  v2 = -[_NTKSharedJetsamInfo init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    fetchersLock = v2->_fetchersLock;
    v2->_fetchersLock = (NSLock *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    fetchers = v2->_fetchers;
    v2->_fetchers = (NSMapTable *)v5;

    v2->_pid = getpid();
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchersLock, 0);
  objc_storeStrong((id *)&self->_fetchers, 0);
}

@end
