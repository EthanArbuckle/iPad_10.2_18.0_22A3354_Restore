@implementation AXProfileDatabase

+ (id)sharedDatabase
{
  if (sharedDatabase_onceToken != -1)
    dispatch_once(&sharedDatabase_onceToken, &__block_literal_global_8);
  return (id)sharedDatabase___sharedDatabase;
}

void __35__AXProfileDatabase_sharedDatabase__block_invoke()
{
  AXProfileDatabase *v0;
  void *v1;

  v0 = objc_alloc_init(AXProfileDatabase);
  v1 = (void *)sharedDatabase___sharedDatabase;
  sharedDatabase___sharedDatabase = (uint64_t)v0;

}

- (AXProfileDatabase)init
{
  AXProfileDatabase *v2;
  NSMutableArray *v3;
  NSMutableArray *entries;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXProfileDatabase;
  v2 = -[AXProfileDatabase init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    entries = v2->_entries;
    v2->_entries = v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_gatherTransactionSummary, CFSTR("AXGatherTransactionSummary"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)registerEntry:(id)a3
{
  -[NSMutableArray addObject:](self->_entries, "addObject:", a3);
}

- (id)transactionSummary
{
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("app,attributeName,pid,uid,type,attribute,size,hash,duration\n"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_entries;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v4, "appName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v4, "attribute");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v4, "pid");
        objc_msgSend(v4, "uid");
        v9 = v8;
        v10 = objc_msgSend(v4, "uid");
        v11 = objc_msgSend(v4, "type");
        v12 = objc_msgSend(v4, "attribute");
        v13 = objc_msgSend(v4, "valueSize");
        v14 = objc_msgSend(v4, "valueHash");
        objc_msgSend(v4, "duration");
        objc_msgSend(v19, "appendFormat:", CFSTR("%@,%@,%d,%llu.%llu,%lu,%ld,%lu,%lu,%f\n"), v5, v7, v21, v9, v10, v11, v12, v13, v14, v15);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v20);
  }

  return v19;
}

- (id)debugStatistics
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  NSMutableArray *obj;
  uint64_t v35;
  void *v36;
  id v37;
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
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E691BCF0);
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = self->_entries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v5)
  {
    v6 = v5;
    v35 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v47 != v35)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v8, "attribute"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v10 = (void *)objc_opt_new();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);
        }
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v11 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v9);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v9);

        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "doubleValue");
        v15 = v14;
        objc_msgSend(v8, "duration");
        objc_msgSend(v13, "numberWithDouble:", v15 + v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v9);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "keysSortedByValueUsingSelector:", sel_compare_);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keysSortedByValueUsingSelector:", sel_compare_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v18, "reverseObjectEnumerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v3, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "appendFormat:", CFSTR("%@ = %@\n"), v24, v25);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v21);
  }

  objc_msgSend(v37, "appendString:", CFSTR("\n"));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v36, "reverseObjectEnumerator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
        objc_msgSend(v4, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "appendFormat:", CFSTR("%@ = %@\n"), v31, v32);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v28);
  }

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
