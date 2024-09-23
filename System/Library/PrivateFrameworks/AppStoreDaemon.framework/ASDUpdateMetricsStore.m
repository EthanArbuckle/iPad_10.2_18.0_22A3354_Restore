@implementation ASDUpdateMetricsStore

- (ASDUpdateMetricsStore)init
{
  ASDUpdateMetricsStore *v2;
  NSLock *v3;
  NSLock *lock;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  unint64_t v20;
  void *v21;
  char v22;
  void *v23;
  double v24;
  uint64_t v25;
  NSDate *lastAutoPollDate;
  uint64_t v27;
  NSArray *metrics;
  ASDUpdateMetricsStore *v30;
  int v31;
  uint64_t v32;
  id obj;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)ASDUpdateMetricsStore;
  v2 = -[ASDUpdateMetricsStore init](&v34, sel_init);
  if (!v2)
    return v2;
  v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  lock = v2->_lock;
  v30 = v2;
  v2->_lock = v3;

  objc_opt_self();
  v5 = (void *)CFPreferencesCopyValue(CFSTR("UpdateMetrics"), CFSTR("com.apple.appstored"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v7)
  {
    v9 = 0;
    v31 = 0;
    v11 = 0.0;
    goto LABEL_18;
  }
  v8 = v7;
  v9 = 0;
  v31 = 0;
  v10 = *(_QWORD *)v36;
  v11 = 0.0;
  v12 = 0x1E37BC000uLL;
  v13 = CFSTR("Manual");
  do
  {
    v14 = 0;
    v32 = v8;
    do
    {
      if (*(_QWORD *)v36 != v10)
        objc_enumerationMutation(obj);
      v15 = (void *)objc_msgSend(objc_alloc(*(Class *)(v12 + 3496)), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v14));
      objc_msgSend(v6, "addObject:", v15);
      objc_msgSend(v15, "reason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", v13) & 1) == 0)
      {
        v17 = v10;
        v18 = v6;
        v19 = v13;
        v20 = v12;
        objc_msgSend(v15, "reason");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("Migration"));

        if ((v22 & 1) != 0)
        {
          v12 = v20;
          v13 = v19;
          v6 = v18;
          v10 = v17;
          v8 = v32;
          goto LABEL_14;
        }
        if (v9)
        {
          ++v31;
          objc_msgSend(v15, "pollTime");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSinceDate:", v9);
          v11 = v11 + v24;

        }
        v12 = v20;
        v13 = v19;
        v6 = v18;
        v10 = v17;
        objc_msgSend(v15, "pollTime", v30);
        v16 = v9;
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v32;
      }

LABEL_14:
      ++v14;
    }
    while (v8 != v14);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  }
  while (v8);
LABEL_18:

  v2 = v30;
  -[NSLock lock](v30->_lock, "lock");
  if (v31 >= 1)
    v30->_averagePollTime = v11 / (double)v31;
  if (v9)
  {
    v25 = objc_msgSend(v9, "copy");
    lastAutoPollDate = v30->_lastAutoPollDate;
    v30->_lastAutoPollDate = (NSDate *)v25;

  }
  v27 = objc_msgSend(v6, "copy", v30);
  metrics = v2->_metrics;
  v2->_metrics = (NSArray *)v27;

  -[NSLock unlock](v2->_lock, "unlock");
  return v2;
}

- (void)addPoll:(id)a3
{
  NSLock *lock;
  id v5;
  NSArray *v6;
  NSArray *metrics;
  id v8;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_metrics);
  objc_msgSend(v8, "addObject:", v5);

  if ((unint64_t)objc_msgSend(v8, "count") >= 0x11)
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
  v6 = (NSArray *)objc_msgSend(v8, "copy");
  metrics = self->_metrics;
  self->_metrics = v6;

  -[NSLock unlock](self->_lock, "unlock");
  -[ASDUpdateMetricsStore synchronize](self, "synchronize");

}

- (void)synchronize
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id value;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[NSLock lock](self->_lock, "lock");
    v3 = (void *)-[NSArray copy](self->_metrics, "copy");
    -[NSLock unlock](self->_lock, "unlock");
    v4 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "dictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v11 = 0;
  }
  value = v11;
  objc_opt_self();
  CFPreferencesSetAppValue(CFSTR("UpdateMetrics"), value, CFSTR("com.apple.appstored"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.appstored"));
}

- (double)averagePollTime
{
  return self->_averagePollTime;
}

- (NSArray)metrics
{
  return self->_metrics;
}

- (NSDate)lastAutoPollDate
{
  return self->_lastAutoPollDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAutoPollDate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
