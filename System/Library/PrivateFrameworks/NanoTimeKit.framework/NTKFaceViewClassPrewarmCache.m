@implementation NTKFaceViewClassPrewarmCache

- (NTKFaceViewClassPrewarmCache)init
{
  NTKFaceViewClassPrewarmCache *v2;
  uint64_t v3;
  NSMutableDictionary *prewarmCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKFaceViewClassPrewarmCache;
  v2 = -[NTKFaceViewClassPrewarmCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    prewarmCache = v2->_prewarmCache;
    v2->_prewarmCache = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  return (id)sharedInstance_singleton;
}

void __46__NTKFaceViewClassPrewarmCache_sharedInstance__block_invoke()
{
  NTKFaceViewClassPrewarmCache *v0;
  void *v1;

  v0 = objc_alloc_init(NTKFaceViewClassPrewarmCache);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

- (id)prewarmDataForClass:(Class)a3
{
  void *v5;
  void *v6;

  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_prewarmCache, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[objc_class _prewarmSharedData](a3, "_prewarmSharedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[NSMutableDictionary setObject:forKey:](self->_prewarmCache, "setObject:forKey:", v6, v5);
  }

  return v6;
}

- (void)prewarmClasses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  NSString *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allKeys](self->_prewarmCache, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        NSStringFromClass(*(Class *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v15, "minusSet:", v8);
  v16 = (void *)objc_msgSend(v8, "mutableCopy");
  v29 = v7;
  objc_msgSend(v16, "minusSet:", v7);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        -[NSMutableDictionary removeObjectForKey:](self->_prewarmCache, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v19);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = v16;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        v27 = *(NSString **)(*((_QWORD *)&v30 + 1) + 8 * k);
        -[objc_class _prewarmSharedData](NSClassFromString(v27), "_prewarmSharedData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          -[NSMutableDictionary setObject:forKey:](self->_prewarmCache, "setObject:forKey:", v28, v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v24);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmCache, 0);
}

@end
