@implementation _DKObjectFromMOCache

- (_DKObjectFromMOCache)init
{
  _DKObjectFromMOCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKObjectFromMOCache;
  v2 = -[_DKObjectFromMOCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (_QWORD)initWithReporting
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!a1)
    return 0;
  v1 = (_QWORD *)objc_msgSend(a1, "init");
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v1[2];
    v1[2] = v2;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v1[3];
    v1[3] = v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v1[4];
    v1[4] = v6;

  }
  return v1;
}

- (void)reportMetrics
{
  id v3;
  SEL v4;
  id v5;
  SEL v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  SEL v22;
  void *v23;
  SEL v24;
  void *v25;
  SEL v26;
  id self;
  id obj;
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
  id Property;
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    Property = objc_getProperty(a1, a2, 16, 1);
    v3 = Property;
    v40 = objc_getProperty(a1, v4, 24, 1);
    v5 = v40;
    self = a1;
    v41 = objc_getProperty(a1, v6, 32, 1);
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v41;
    objc_msgSend(v7, "arrayWithObjects:count:", &Property, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v9;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v10)
    {
      v11 = v10;
      v29 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v31 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
                objc_msgSend(v14, "objectForKeyedSubscript:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", objc_msgSend(v20, "longValue"), v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v16);
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(self, v22, v21, 16);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(self, v24, v23, 24);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(self, v26, v25, 32);

  }
}

- (id)objectForKey:(void *)a3 type:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SEL v10;
  id v11;
  const char *v12;
  void *v13;
  id Property;
  void *v15;
  SEL v16;
  void *v17;
  void *v18;
  const char *v19;
  id *v20;
  ptrdiff_t v21;
  SEL v22;
  void *v23;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1[1], "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_getProperty(a1, v10, 24, 1);
      if (v11)
      {
        v13 = v11;
        Property = objc_getProperty(a1, v12, 32, 1);

        if (Property)
        {
          if (v9)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coreduet.knowledgeMOCache.%@.hit"), v6);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(objc_getProperty(a1, v16, 24, 1), "objectForKeyedSubscript:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue") + 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = a1;
            v21 = 24;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coreduet.knowledgeMOCache.%@.miss"), v6);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(objc_getProperty(a1, v22, 32, 1), "objectForKeyedSubscript:", v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "unsignedIntegerValue") + 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = a1;
            v21 = 32;
          }
          objc_msgSend(objc_getProperty(v20, v19, v21, 1), "setObject:forKeyedSubscript:", v18, v15);

        }
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setObject:(void *)a3 forKey:(void *)a4 type:
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  void *v11;
  void *v12;
  SEL v13;
  void *v14;
  void *v15;
  SEL v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(a1[1], "objectForKeyedSubscript:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      objc_msgSend(v10, "setCountLimit:", 20);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coreduet.moconverter.cache.%@"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setName:", v11);

      objc_msgSend(a1[1], "setObject:forKeyedSubscript:", v10, v8);
    }
    if (objc_getProperty(a1, v9, 16, 1))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coreduet.knowledgeMOCache.%@.set"), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objc_getProperty(a1, v13, 24, 1), "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(objc_getProperty(a1, v16, 16, 1), "setObject:forKeyedSubscript:", v15, v12);
    }
    objc_msgSend(v10, "setObject:forKey:", v17, v7);

  }
}

- (id)objectForKey:(void *)a3 type:(void *)a4 setIfMissingWithBlock:
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    -[_DKObjectFromMOCache objectForKey:type:](a1, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v9[2](v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[_DKObjectFromMOCache setObject:forKey:type:](a1, v10, v7, v8);
    }
    a1 = v10;

  }
  return a1;
}

- (id)deduplicateString:(id *)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42___DKObjectFromMOCache_deduplicateString___block_invoke;
    v6[3] = &unk_1E26E6510;
    v7 = v3;
    -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](a1, v7, CFSTR("_str"), v6);
    a1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheMisses, 0);
  objc_storeStrong((id *)&self->_cacheHits, 0);
  objc_storeStrong((id *)&self->_cacheEntries, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
