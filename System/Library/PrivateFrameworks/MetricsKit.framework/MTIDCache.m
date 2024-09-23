@implementation MTIDCache

+ (BOOL)idInfo:(id)a3 isValidForDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "effectiveDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "compare:", v6) == 1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "expirationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v9 = !v10 || objc_msgSend(v10, "compare:", v6) != -1;

  }
  return v9;
}

- (id)IDInfoForScheme:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  MTIDCache *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dsId"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &unk_24C7B8268;
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  -[MTIDCache cache](v8, "cache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idNamespace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "scheme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqual:", v6)
      && +[MTIDCache idInfo:isValidForDate:](MTIDCache, "idInfo:isValidForDate:", v19, v12))
    {
      objc_msgSend(v19, "dsId");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21 == v16)
      {

LABEL_16:
        +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_msgSend(v19, "dsId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v16, "isEqual:", v22);

      if (v23)
        goto LABEL_16;
    }
    else
    {

    }
  }
  -[MTIDCache promiseKeyForScheme:options:](v8, "promiseKeyForScheme:options:", v6, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCache promiseCache](v8, "promiseCache");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  objc_sync_exit(v8);

  return v26;
}

- (NSMutableDictionary)promiseCache
{
  return self->_promiseCache;
}

- (id)promiseKeyForScheme:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v9 = (void *)v10;
LABEL_4:
    v11 = v9;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
LABEL_5:
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", round(v13 / 10.0) * 10.0);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("date"));

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "idNamespace");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v16;
  else
    v17 = &stru_24C7A22D0;
  -[MTIDCache optionsDescription:](self, "optionsDescription:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@:%@"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)optionsDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTIDCommon idOptions](MTIDCommon, "idOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __32__MTIDCache_optionsDescription___block_invoke;
  v13 = &unk_24C7A0CE8;
  v14 = v3;
  v15 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","), v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

void __32__MTIDCache_optionsDescription___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "description");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = &stru_24C7A22D0;
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v10);
  }

}

void __48__MTIDCache_addIdInfoPromise_forScheme_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_sync_enter(v8);
    objc_msgSend(v8, "promiseCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    if (v10)
      objc_msgSend(v8, "addIDInfo:reset:", v10, *(unsigned __int8 *)(a1 + 48));
    objc_sync_exit(v8);

  }
}

- (void)addIDInfo:(id)a3 reset:(BOOL)a4
{
  _BOOL4 v4;
  MTIDCache *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[MTIDCache cache](v6, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idNamespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v17 || (objc_msgSend(v10, "isEqual:", v17) & 1) != 0)
  {

    objc_sync_exit(v6);
  }
  else
  {
    objc_msgSend(v17, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idNamespace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDCache removeNamespace:](v6, "removeNamespace:", v12);

    -[MTIDCache cache](v6, "cache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "idNamespace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v15);

    objc_sync_exit(v6);
    if (!v4)
      goto LABEL_5;
    objc_msgSend(v17, "scheme");
    v6 = (MTIDCache *)objc_claimAutoreleasedReturnValue();
    -[MTIDCache idNamespace](v6, "idNamespace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTInterprocessChangeNotifier notify:](MTInterprocessChangeNotifier, "notify:", v16);

  }
LABEL_5:

}

- (void)addIdInfoPromise:(id)a3 forScheme:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  MTIDCache *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MTIDCache promiseKeyForScheme:options:](self, "promiseKeyForScheme:options:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("reset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = self;
  objc_sync_enter(v14);
  -[MTIDCache promiseCache](v14, "promiseCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, v11);

  objc_sync_exit(v14);
  objc_initWeak(&location, v14);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__MTIDCache_addIdInfoPromise_forScheme_options___block_invoke;
  v17[3] = &unk_24C7A0D10;
  objc_copyWeak(&v19, &location);
  v16 = v11;
  v18 = v16;
  v20 = v13;
  objc_msgSend(v8, "addFinishBlock:", v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (MTIDCache)init
{
  MTIDCache *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTIDCache;
  v2 = -[MTIDCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDCache setCache:](v2, "setCache:", v3);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDCache setPromiseCache:](v2, "setPromiseCache:", v4);

  }
  return v2;
}

- (void)removeNamespace:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTIDCache removeNamespaces:](self, "removeNamespaces:", v6, v7, v8);
}

- (void)removeNamespaces:(id)a3
{
  id v4;
  MTIDCache *v5;
  void *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  MTIDCache *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v7 = &v19;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  do
  {
    *v7 = 1;
    -[MTIDCache cache](v5, "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __30__MTIDCache_removeNamespaces___block_invoke;
    v12[3] = &unk_24C7A0D38;
    v11 = v6;
    v13 = v11;
    v14 = v5;
    v15 = &v16;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

    v7 = (char *)(v17 + 3);
  }
  while (!*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);

  objc_sync_exit(v5);
}

void __30__MTIDCache_removeNamespaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idNamespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v9);

  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v5);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v6, "scheme", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "correlations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i)))
        {
          v17 = *(void **)(a1 + 32);
          objc_msgSend(v6, "scheme");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "idNamespace");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v17) = objc_msgSend(v17, "containsObject:", v19);

          if ((v17 & 1) == 0)
          {
            v20 = *(void **)(a1 + 32);
            objc_msgSend(v6, "scheme");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "idNamespace");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v22);

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
            goto LABEL_14;
          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)removeAllNamespaces
{
  void *v2;
  MTIDCache *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MTIDCache cache](obj, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_sync_exit(obj);
}

- (void)removeUnsyncedNamespaces
{
  MTIDCache *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[MTIDCache cache](v2, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[MTIDCache cache](v2, "cache", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "isSynchronized") & 1) == 0)
        {
          -[MTIDCache cache](v2, "cache");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_sync_exit(v2);
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setPromiseCache:(id)a3
{
  objc_storeStrong((id *)&self->_promiseCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseCache, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
