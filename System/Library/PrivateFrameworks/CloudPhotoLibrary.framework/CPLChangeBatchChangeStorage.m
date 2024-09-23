@implementation CPLChangeBatchChangeStorage

- (CPLChangeBatchChangeStorage)initWithBatch:(id)a3 name:(id)a4
{
  id v8;
  id v9;
  void *v10;
  CPLChangeBatchChangeStorage *v11;
  CPLChangeBatchChangeStorage *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Trying to create a batch change storage without a batch", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangeBatchChangeStorage.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 20, CFSTR("Trying to create a batch change storage without a batch"));

    abort();
  }
  v10 = v9;
  v17.receiver = self;
  v17.super_class = (Class)CPLChangeBatchChangeStorage;
  v11 = -[CPLChangeBatchChangeStorage init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_batch, a3);
    objc_storeStrong((id *)&v12->_storageDescription, a4);
  }

  return v12;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v4;
  NSDictionary *changesPerScopedIdentifier;
  NSDictionary *v6;
  CPLChangeBatch *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  changesPerScopedIdentifier = self->_changesPerScopedIdentifier;
  if (!changesPerScopedIdentifier)
  {
    v6 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[CPLChangeBatch count](self->_batch, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_batch;
    v8 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "scopedIdentifier", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, v13);

        }
        v9 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v14 = self->_changesPerScopedIdentifier;
    self->_changesPerScopedIdentifier = v6;

    changesPerScopedIdentifier = self->_changesPerScopedIdentifier;
  }
  -[NSDictionary objectForKeyedSubscript:](changesPerScopedIdentifier, "objectForKeyedSubscript:", v4, (_QWORD)v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v5;
  CPLChangeBatch *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  CPLChangeBatch *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  BOOL v21;
  id v22;
  void *v23;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_batch;
  v7 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v26 = 0;
    v9 = *(_QWORD *)v28;
    v25 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "relatedIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if (v14)
          {
            v15 = v6;
            objc_msgSend(v11, "scopedIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "scopeIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = v5;
            objc_msgSend(v5, "scopeIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v17, "isEqualToString:", v19);

            if (v20)
              v21 = v26 == 0;
            else
              v21 = 0;
            if (v21)
            {
              v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v23 = (void *)objc_msgSend(v11, "copy");
              v26 = v22;
              objc_msgSend(v22, "addObject:", v23);

            }
            v6 = v15;
            v5 = v18;
            v9 = v25;
          }

        }
      }
      v8 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)storageDescription
{
  return self->_storageDescription;
}

- (CPLChangeBatch)batch
{
  return self->_batch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batch, 0);
  objc_storeStrong((id *)&self->_storageDescription, 0);
  objc_storeStrong((id *)&self->_changesPerScopedIdentifier, 0);
}

@end
