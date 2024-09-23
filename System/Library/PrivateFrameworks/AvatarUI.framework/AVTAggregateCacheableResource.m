@implementation AVTAggregateCacheableResource

- (AVTAggregateCacheableResource)initWithCacheableResources:(id)a3
{
  id v5;
  AVTAggregateCacheableResource *v6;
  AVTAggregateCacheableResource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAggregateCacheableResource;
  v6 = -[AVTAggregateCacheableResource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cacheableResources, a3);

  return v7;
}

- (unint64_t)costForScope:(id)a3
{
  return objc_msgSend(a3, "cacheableResourceAssociatedCost");
}

- (BOOL)requiresEncryption
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AVTAggregateCacheableResource cacheableResources](self, "cacheableResources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "requiresEncryption") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)volatileIdentifierForScope:(id)a3
{
  return -[AVTAggregateCacheableResource identifierForScope:persistent:](self, "identifierForScope:persistent:", a3, 0);
}

- (id)persistentIdentifierForScope:(id)a3
{
  return -[AVTAggregateCacheableResource identifierForScope:persistent:](self, "identifierForScope:persistent:", a3, 1);
}

- (id)identifierForScope:(id)a3 persistent:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[AVTAggregateCacheableResource cacheableResources](self, "cacheableResources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "persistentIdentifierForScope:", 0);
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12, "volatileIdentifierForScope:", 0);
          v13 = objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)v13;
        objc_msgSend(v6, "appendFormat:", CFSTR("%@_"), v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "length"))
    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
  if (v18)
  {
    objc_msgSend(v18, "cacheableResourceAssociatedIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v15);

  }
  v16 = (void *)objc_msgSend(v6, "copy");

  return v16;
}

- (NSArray)cacheableResources
{
  return self->_cacheableResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheableResources, 0);
}

@end
