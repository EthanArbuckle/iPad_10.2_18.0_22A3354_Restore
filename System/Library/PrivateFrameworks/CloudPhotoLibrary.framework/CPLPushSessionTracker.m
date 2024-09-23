@implementation CPLPushSessionTracker

- (CPLPushSessionTracker)initWithIncomingBatch:(id)a3 store:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  CPLPushSessionTracker *v11;
  CPLPushSessionTracker *v12;
  uint64_t v13;
  CPLEngineIDMapping *idMapping;
  uint64_t v15;
  CPLEngineScopeStorage *scopes;
  NSMutableDictionary *v17;
  NSMutableDictionary *storedClientRecords;
  NSMutableDictionary *v19;
  NSMutableDictionary *storedCloudRecords;
  CPLPushSessionTracker *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CPLPushSessionTracker;
  v11 = -[CPLPushSessionTracker init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_store, a4);
    +[CPLClientCacheBaseView clientCacheBaseViewIDMappingForStore:](CPLClientCacheBaseView, "clientCacheBaseViewIDMappingForStore:", v12->_store);
    v13 = objc_claimAutoreleasedReturnValue();
    idMapping = v12->_idMapping;
    v12->_idMapping = (CPLEngineIDMapping *)v13;

    objc_msgSend(v10, "scopes");
    v15 = objc_claimAutoreleasedReturnValue();
    scopes = v12->_scopes;
    v12->_scopes = (CPLEngineScopeStorage *)v15;

    v12->_checkScopeIdentifier = objc_msgSend(v10, "libraryOptions") != 0;
    objc_storeStrong((id *)&v12->_incomingBatch, a3);
    if (!-[CPLChangeBatch sortBatchWithError:](v12->_incomingBatch, "sortBatchWithError:", a5))
    {
      v21 = 0;
      goto LABEL_6;
    }
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storedClientRecords = v12->_storedClientRecords;
    v12->_storedClientRecords = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storedCloudRecords = v12->_storedCloudRecords;
    v12->_storedCloudRecords = v19;

  }
  v21 = v12;
LABEL_6:

  return v21;
}

- (BOOL)hasPushChangeTasks
{
  return -[CPLPushChangeTasks hasTasks](self->_pushChangeTasks, "hasTasks");
}

- (BOOL)knowsClientRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incomingBatchRecordPerScopedIdentifiers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    LODWORD(self) = objc_msgSend(v5, "isDelete") ^ 1;
  else
    LOBYTE(self) = -[CPLPushSessionTracker hasClientRecordWithLocalScopedIdentifier:](self, "hasClientRecordWithLocalScopedIdentifier:", v4);

  return (char)self;
}

- (id)_resourceIdentitiesFromChange:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "identity", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "resourceType"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

- (id)enqueuedOrStoredRecordWithLocalScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incomingBatchRecordPerScopedIdentifiers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[CPLPushSessionTracker storedClientRecordWithLocalScopedIdentifier:](self, "storedClientRecordWithLocalScopedIdentifier:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = v8;
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isDelete") & 1) == 0)
  {
    v8 = v6;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (id)resourceIdentitiesForRecordWithLocalScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incomingBatchRecordPerScopedIdentifiers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isDelete") & 1) != 0)
    {
      v7 = 0;
      goto LABEL_13;
    }
    if (objc_msgSend(v6, "supportsResources") && objc_msgSend(v6, "hasChangeType:", 8))
    {
      -[CPLPushSessionTracker _resourceIdentitiesFromChange:](self, "_resourceIdentitiesFromChange:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  -[CPLPushSessionTracker storedClientRecordWithLocalScopedIdentifier:](self, "storedClientRecordWithLocalScopedIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "supportsResources"))
    {
      -[CPLPushSessionTracker _resourceIdentitiesFromChange:](self, "_resourceIdentitiesFromChange:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA70];
    }
  }
  else
  {
    v7 = 0;
  }

LABEL_13:
  return v7;
}

- (BOOL)checkScopeIdentifier:(id)a3
{
  id v4;
  NSMutableSet *validScopeIdentifiers;
  BOOL v6;
  NSMutableSet *invalidScopeIdentifiers;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  CPLEngineScopeStorage *scopes;
  _BOOL4 v19;
  id v20;
  void *v21;
  NSMutableSet *v22;
  NSObject *v23;
  void *v24;
  NSMutableSet *v25;
  NSMutableSet *v26;
  NSMutableSet *v27;
  NSMutableSet *v28;
  NSMutableSet *v29;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_checkScopeIdentifier)
  {
    validScopeIdentifiers = self->_validScopeIdentifiers;
    if (!validScopeIdentifiers
      || (-[NSMutableSet containsObject:](validScopeIdentifiers, "containsObject:", v4) & 1) == 0)
    {
      invalidScopeIdentifiers = self->_invalidScopeIdentifiers;
      if (invalidScopeIdentifiers
        && (-[NSMutableSet containsObject:](invalidScopeIdentifiers, "containsObject:", v4) & 1) != 0)
      {
        v6 = 0;
        goto LABEL_36;
      }
      -[CPLEngineScopeStorage scopeWithIdentifier:](self->_scopes, "scopeWithIdentifier:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8
        || ((-[CPLEngineScopeStorage flagsForScope:](self->_scopes, "flagsForScope:", v8),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v10 = objc_msgSend(v9, "valueForFlag:", 16),
             v11 = objc_msgSend(v9, "valueForFlag:", 36),
             v12 = v10 | v11,
             v9,
             v12 == 1)
          ? (v13 = v11 == 0)
          : (v13 = 0),
            v13))
      {
        -[CPLEngineStore mainScopeIdentifier](self->_store, "mainScopeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v4, "isEqualToString:", v14);

        if (!v15)
        {
LABEL_29:
          v25 = self->_invalidScopeIdentifiers;
          if (v25)
          {
            -[NSMutableSet addObject:](v25, "addObject:", v4);
          }
          else
          {
            v26 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v4, 0);
            v27 = self->_invalidScopeIdentifiers;
            self->_invalidScopeIdentifiers = v26;

          }
          v6 = 0;
LABEL_35:

          goto LABEL_36;
        }
        if (!_CPLSilentLogging)
        {
          __CPLSessionOSLogDomain_14133();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            -[CPLEngineStore mainScopeIdentifier](self->_store, "mainScopeIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v33 = v17;
            _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Client failed to properly re-enable %@ - will do it directly", buf, 0xCu);

          }
        }
        scopes = self->_scopes;
        v31 = 0;
        v19 = -[CPLEngineScopeStorage enablePrimaryScopeWithError:](scopes, "enablePrimaryScopeWithError:", &v31);
        v20 = v31;
        v21 = v20;
        if (!v19)
        {
          if (!_CPLSilentLogging)
          {
            __CPLSessionOSLogDomain_14133();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              -[CPLEngineStore mainScopeIdentifier](self->_store, "mainScopeIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v33 = v24;
              v34 = 2112;
              v35 = v21;
              _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "Failed to auto-enable %@: %@", buf, 0x16u);

            }
          }

          goto LABEL_29;
        }

      }
      else if ((v12 & 1) != 0)
      {
        goto LABEL_29;
      }
      v22 = self->_validScopeIdentifiers;
      if (v22)
      {
        -[NSMutableSet addObject:](v22, "addObject:", v4);
      }
      else
      {
        v28 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v4, 0);
        v29 = self->_validScopeIdentifiers;
        self->_validScopeIdentifiers = v28;

      }
      v6 = 1;
      goto LABEL_35;
    }
  }
  v6 = 1;
LABEL_36:

  return v6;
}

- (id)storedClientRecordWithLocalScopedIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storedClientRecords, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5 == MEMORY[0x1E0C9AAB0];
  else
    v7 = 1;
  if (v7)
  {
    -[CPLEngineStore transactionClientCacheView](self->_store, "transactionClientCacheView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordViewWithScopedIdentifier:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synthesizedRecord");
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storedClientRecords, "setObject:forKeyedSubscript:", v6, v4);
LABEL_11:

      v6 = 0;
      goto LABEL_12;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storedClientRecords, "setObject:forKeyedSubscript:", v10, v4);
    v6 = (void *)v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v11)
      goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (BOOL)hasClientRecordWithLocalScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storedClientRecords, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 != v6;

  }
  else
  {
    -[CPLEngineStore transactionClientCacheView](self->_store, "transactionClientCacheView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasRecordWithScopedIdentifier:", v4);

    if (v9)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storedClientRecords, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);
      v7 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storedClientRecords, "setObject:forKeyedSubscript:", v10, v4);

      v7 = 0;
    }
  }

  return v7;
}

- (id)storedCloudRecordWithLocalScopedIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v14;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storedCloudRecords, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5 == MEMORY[0x1E0C9AAB0];
  else
    v7 = 1;
  if (v7)
  {
    v14 = 0;
    -[CPLEngineIDMapping cloudScopedIdentifierForLocalScopedIdentifier:isFinal:](self->_idMapping, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v4, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[CPLEngineStore cloudCache](self->_store, "cloudCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recordWithScopedIdentifier:isFinal:", v8, 1);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storedCloudRecords, "setObject:forKeyedSubscript:", v6, v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storedCloudRecords, "setObject:forKeyedSubscript:", v12, v4);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v11)
    {

      v6 = 0;
    }
  }

  return v6;
}

- (void)acknowledgeNewClientRecord:(id)a3 withScopedIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  char v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0;
  -[CPLEngineIDMapping cloudScopedIdentifierForLocalScopedIdentifier:isFinal:](self->_idMapping, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CPLEngineStore cloudCache](self->_store, "cloudCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v8 = objc_msgSend(v7, "ackownledgeRecordWithScopedIdentifier:error:", v6, &v12);
    v9 = v12;

    if ((v8 & 1) != 0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_storedClientRecords, "objectForKeyedSubscript:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = objc_claimAutoreleasedReturnValue();

        if (v10 == v11)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storedClientRecords, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v5);
      }
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_10:

        goto LABEL_11;
      }
      __CPLSessionOSLogDomain_14133();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v15 = v5;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Failed to acknowledge %@ (cloud %@) for client in cloud cache: %@", buf, 0x20u);
      }
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)hasCloudRecordWithLocalScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v13;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storedCloudRecords, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 != v6;

  }
  else
  {
    v13 = 0;
    -[CPLEngineIDMapping cloudScopedIdentifierForLocalScopedIdentifier:isFinal:](self->_idMapping, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v4, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (-[CPLEngineStore cloudCache](self->_store, "cloudCache"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "hasRecordWithScopedIdentifier:", v8),
          v9,
          v10))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storedCloudRecords, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);
      v7 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storedCloudRecords, "setObject:forKeyedSubscript:", v11, v4);

      v7 = 0;
    }

  }
  return v7;
}

- (id)_realChangeFromChange:(id)a3 comparedToStoredRecord:(id)a4 changeType:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = v9;
  if (objc_msgSend(v9, "supportsResources"))
  {
    if (!a5 || (v10 = v9, (a5 & 8) != 0))
    {
      objc_msgSend(v9, "resources");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "cplDeepCopy");

      v10 = v9;
      if (v12)
      {
        v10 = (void *)objc_msgSend(v9, "copy");

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v10, "resources");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v23;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v23 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "identity");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setAvailable:", 1);
              objc_msgSend(v18, "setFileURL:", 0);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v15);
        }

      }
    }
  }
  v21 = 0;
  objc_msgSend(v8, "realRecordChangeFromRecordChange:direction:newRecord:changeType:diffTracker:", v10, 1, &v21, a5, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)computeExpandedBatchWithError:(id *)a3
{
  CPLPushSessionTracker *v3;
  id *v4;
  NSDate *now;
  uint64_t v6;
  NSMutableDictionary *incomingBatchRecordPerScopedIdentifiers;
  NSMutableSet *v8;
  NSMutableSet *unquarantinedRecordScopedIdentifiers;
  CPLChangeBatch *v10;
  CPLChangeBatch *expandedBatch;
  CPLPushChangeTasks *v12;
  CPLPushChangeTasks *pushChangeTasks;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  CPLEngineScopeStorage *scopes;
  BOOL v18;
  id v19;
  NSObject *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  CPLPushChangeTasks *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSMutableSet *validScopeIdentifiers;
  void *v40;
  NSObject *v41;
  id v42;
  CPLEngineScopeStorage *v43;
  void *v44;
  id v45;
  NSMutableSet *v46;
  NSObject *v47;
  uint64_t v48;
  NSMutableSet *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  unint64_t v66;
  BOOL v67;
  char v68;
  void *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  int v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  char v93;
  uint64_t v94;
  uint64_t ii;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v102;
  int v103;
  id v104;
  NSObject *v105;
  void *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  void *v116;
  int v117;
  void *v118;
  BOOL v119;
  NSObject *v120;
  void *v121;
  void *v122;
  char v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  int v130;
  NSObject *v131;
  void *v132;
  NSObject *v133;
  NSObject *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t j;
  void *v141;
  void *v142;
  void *v143;
  CPLChangeBatch *v144;
  id v145;
  NSObject *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t k;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  NSMutableDictionary *storedClientRecords;
  void *v158;
  id v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t m;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t n;
  CPLChangeBatch *v179;
  NSObject *v180;
  NSObject *v181;
  void *v182;
  void *v183;
  NSObject *v184;
  void *v185;
  NSObject *v186;
  NSObject *v187;
  int v188;
  NSObject *v189;
  void *v190;
  id v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t i;
  void *v196;
  void *v197;
  void *v198;
  id v199;
  void *v200;
  void *v201;
  NSObject *v202;
  uint64_t v203;
  BOOL v204;
  NSObject *v205;
  CPLPushChangeTasks *v206;
  void *revertedChanges;
  void *v208;
  BOOL expandHasBeenSuccessful;
  uint64_t v210;
  NSObject *v212;
  NSObject *v213;
  NSObject *v214;
  void *v215;
  void *v216;
  NSObject *v217;
  NSObject *v218;
  void *v219;
  void *v220;
  void *v221;
  char v222;
  uint64_t v223;
  uint64_t (**v225)(void *, id, _QWORD);
  id v226;
  id v227;
  void *v228;
  void *v229;
  NSDate *v230;
  id *v231;
  uint64_t v232;
  id v233;
  id v234;
  id v235;
  uint64_t v236;
  void *v237;
  void *v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  id v246;
  CPLChangeBatch *obj;
  id *p_isa;
  NSObject *v249;
  id v250;
  id v251;
  NSObject *v252;
  NSObject *v253;
  id v254;
  id v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  id v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  _QWORD v264[5];
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  id v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  _QWORD v290[4];
  NSObject *v291;
  CPLPushSessionTracker *v292;
  id v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  id v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  id v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  _BYTE v308[128];
  _BYTE v309[128];
  _BYTE v310[128];
  _BYTE v311[128];
  _BYTE v312[128];
  _BYTE v313[128];
  _BYTE v314[128];
  uint8_t v315[128];
  uint8_t buf[4];
  NSObject *p_super;
  __int16 v318;
  uint64_t v319;
  __int16 v320;
  id v321;
  NSObject *v322;
  _BYTE v323[128];
  _BYTE v324[128];
  uint64_t v325;

  v3 = self;
  v325 = *MEMORY[0x1E0C80C00];
  if (self->_expandHasBeenSuccessful)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v217 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v218 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        p_super = v218;
        _os_log_impl(&dword_1B03C2000, v217, OS_LOG_TYPE_ERROR, "%@ called twice", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v219, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, v220, 323, CFSTR("%@ called twice"), v221);

    abort();
  }
  v4 = a3;
  now = self->_now;
  if (now)
  {
    v230 = now;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v230 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[CPLChangeBatch count](v3->_incomingBatch, "count"));
  incomingBatchRecordPerScopedIdentifiers = v3->_incomingBatchRecordPerScopedIdentifiers;
  v3->_incomingBatchRecordPerScopedIdentifiers = (NSMutableDictionary *)v6;

  v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  unquarantinedRecordScopedIdentifiers = v3->_unquarantinedRecordScopedIdentifiers;
  v3->_unquarantinedRecordScopedIdentifiers = v8;

  v10 = objc_alloc_init(CPLChangeBatch);
  expandedBatch = v3->_expandedBatch;
  v3->_expandedBatch = v10;

  v12 = -[CPLPushChangeTasks initEmpty]([CPLPushChangeTasks alloc], "initEmpty");
  pushChangeTasks = v3->_pushChangeTasks;
  v3->_pushChangeTasks = v12;

  -[CPLEngineStore pushPullGatekeepers](v3->_store, "pushPullGatekeepers");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v259 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v304 = 0u;
  v305 = 0u;
  v306 = 0u;
  v307 = 0u;
  obj = v3->_incomingBatch;
  v258 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v304, v324, 16);
  if (!v258)
  {
LABEL_383:

    v204 = -[CPLPushChangeTasks hasTasks](v3->_pushChangeTasks, "hasTasks");
    v3->_expandHasBeenSuccessful = !v204;
    if (v204)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_14133();
        v205 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
        {
          v206 = v3->_pushChangeTasks;
          *(_DWORD *)buf = 138412290;
          p_super = &v206->super;
          _os_log_impl(&dword_1B03C2000, v205, OS_LOG_TYPE_DEFAULT, "Batch was rejected because of %@", buf, 0xCu);
        }

      }
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 18, CFSTR("Client needs to fix records in batch"));
      revertedChanges = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLPushChangeTasks invalidRecordScopedIdentifiers](v3->_pushChangeTasks, "invalidRecordScopedIdentifiers");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v208, "count"))
        -[CPLEngineStore noteInvalidRecordScopedIdentifiersInPushSession:](v3->_store, "noteInvalidRecordScopedIdentifiersInPushSession:", v208);
      if (v4)
        *v4 = objc_retainAutorelease(revertedChanges);

    }
    else
    {
      if (!objc_msgSend(v259, "count"))
      {
LABEL_396:
        expandHasBeenSuccessful = v3->_expandHasBeenSuccessful;
        goto LABEL_397;
      }
      objc_msgSend(v259, "array");
      v210 = objc_claimAutoreleasedReturnValue();
      revertedChanges = v3->_revertedChanges;
      v3->_revertedChanges = (NSArray *)v210;
    }

    goto LABEL_396;
  }
  v257 = *(_QWORD *)v305;
  p_isa = (id *)&v3->super.isa;
  v231 = v4;
LABEL_7:
  v14 = 0;
LABEL_8:
  if (*(_QWORD *)v305 != v257)
    objc_enumerationMutation(obj);
  v15 = objc_msgSend(*(id *)(*((_QWORD *)&v304 + 1) + 8 * v14), "copy");
  -[NSObject awakeFromStorage](v15, "awakeFromStorage");
  if (-[NSObject isScopeChange](v15, "isScopeChange"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        p_super = v15;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Client pushed a scope change: %@", buf, 0xCu);
      }

    }
    scopes = v3->_scopes;
    v303 = 0;
    v18 = -[CPLEngineScopeStorage updateScopeWithChange:error:](scopes, "updateScopeWithChange:error:", v15, &v303);
    v19 = v303;
    if (!v18)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_14133();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          p_super = v15;
          v318 = 2112;
          v319 = (uint64_t)v19;
          _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Client failed to update scope with %@: %@", buf, 0x16u);
        }

      }
      if (v4)
        *v4 = objc_retainAutorelease(v19);
LABEL_22:
      v21 = 1;
      goto LABEL_50;
    }
LABEL_49:
    v21 = 3;
    goto LABEL_50;
  }
  v256 = v14;
  v301 = 0u;
  v302 = 0u;
  v299 = 0u;
  v300 = 0u;
  v22 = v238;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v299, v323, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v300;
LABEL_25:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v300 != v25)
        objc_enumerationMutation(v22);
      v27 = *(NSObject **)(*((_QWORD *)&v299 + 1) + 8 * v26);
      v28 = -[NSObject checkPushedChange:](v27, "checkPushedChange:", v15);
      switch(v28)
      {
        case 2:
          if (!_CPLSilentLogging)
          {
            __CPLSessionOSLogDomain_14133();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v27;
              v318 = 2112;
              v319 = (uint64_t)v15;
              _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_DEFAULT, "%@ modified %@ so we will revert it", buf, 0x16u);
            }

          }
          objc_msgSend(v259, "addObject:", v15);
          break;
        case 3:
          v14 = v256;
          if (!_CPLSilentLogging)
          {
            __CPLSessionOSLogDomain_14133();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v27;
              v318 = 2112;
              v319 = (uint64_t)v15;
              _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEFAULT, "%@ asked to reject %@", buf, 0x16u);
            }

          }
          v35 = v3->_pushChangeTasks;
          -[NSObject scopedIdentifier](v15, "scopedIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLPushChangeTasks addTask:forRecordWithScopedIdentifier:](v35, "addTask:forRecordWithScopedIdentifier:", 1, v36);

LABEL_63:
LABEL_64:
          if (++v14 == v258)
          {
            v203 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v304, v324, 16);
            v258 = v203;
            if (!v203)
              goto LABEL_383;
            goto LABEL_7;
          }
          goto LABEL_8;
        case 1:
          v14 = v256;
          if (!_CPLSilentLogging)
          {
            __CPLSessionOSLogDomain_14133();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v27;
              v318 = 2112;
              v319 = (uint64_t)v15;
              _os_log_impl(&dword_1B03C2000, v37, OS_LOG_TYPE_DEFAULT, "%@ asked to drop (and revert) %@", buf, 0x16u);
            }

          }
          objc_msgSend(v259, "addObject:", v15);
          goto LABEL_63;
      }
      if (v24 == ++v26)
      {
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v299, v323, 16);
        if (!v24)
          break;
        goto LABEL_25;
      }
    }
  }

  if ((-[NSObject isDelete](v15, "isDelete") & 1) == 0)
  {
    -[NSObject recordModificationDate](v15, "recordModificationDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      -[NSObject setRecordModificationDate:](v15, "setRecordModificationDate:", v230);
  }
  -[NSObject scopedIdentifier](v15, "scopedIdentifier");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v212 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
      {
        v213 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        p_super = v213;
        v214 = v213;
        _os_log_impl(&dword_1B03C2000, v212, OS_LOG_TYPE_ERROR, "%@ should have an identifier here", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v215, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, v216, 376, CFSTR("%@ should have an identifier here"), objc_opt_class());

    abort();
  }
  v19 = (id)v31;
  -[NSMutableDictionary objectForKey:](v3->_incomingBatchRecordPerScopedIdentifiers, "objectForKey:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v14 = v256;
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        p_super = v15;
        _os_log_impl(&dword_1B03C2000, v33, OS_LOG_TYPE_ERROR, "Client pushed the same record twice: %@ - ignoring", buf, 0xCu);
      }

    }
    ++v3->_ignoredRecordCount;
    goto LABEL_49;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_incomingBatchRecordPerScopedIdentifiers, "setObject:forKeyedSubscript:", v15, v19);
  v14 = v256;
  if (!v3->_checkScopeIdentifier)
  {
    objc_msgSend(v19, "scopeIdentifier");
    v38 = objc_claimAutoreleasedReturnValue();
    validScopeIdentifiers = v3->_validScopeIdentifiers;
    if (!validScopeIdentifiers
      || (-[NSMutableSet containsObject:](validScopeIdentifiers, "containsObject:", v38) & 1) == 0)
    {
      -[CPLEngineScopeStorage scopeWithIdentifier:](v3->_scopes, "scopeWithIdentifier:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40)
      {
        if (!_CPLSilentLogging)
        {
          __CPLSessionOSLogDomain_14133();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            p_super = v38;
            _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_ERROR, "Client pushed records for an unknown scope %@ (likely because CPL database has been wiped) but does not support re-creating that scope itself. Automatically recreating it", buf, 0xCu);
          }

        }
        v42 = v19;
        v43 = v3->_scopes;
        v298 = 0;
        -[CPLEngineScopeStorage createScopeWithIdentifier:scopeType:flags:transportScope:error:](v43, "createScopeWithIdentifier:scopeType:flags:transportScope:error:", v38, 0, 0, 0, &v298);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v298;

        if (!v44)
        {
          v19 = v42;
          if (!_CPLSilentLogging)
          {
            __CPLSessionOSLogDomain_14133();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v38;
              v318 = 2112;
              v319 = (uint64_t)v45;
              _os_log_impl(&dword_1B03C2000, v47, OS_LOG_TYPE_ERROR, "Failed to re-create scope %@ automatically: %@", buf, 0x16u);
            }

          }
          if (v4)
            *v4 = objc_retainAutorelease(v45);

          goto LABEL_22;
        }
        v46 = v3->_validScopeIdentifiers;
        if (v46)
        {
          -[NSMutableSet addObject:](v46, "addObject:", v38);
        }
        else
        {
          v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v38, 0);
          v49 = v3->_validScopeIdentifiers;
          v3->_validScopeIdentifiers = (NSMutableSet *)v48;

        }
        v19 = v42;

      }
    }

  }
  if (computeExpandedBatchWithError__onceToken != -1)
    dispatch_once(&computeExpandedBatchWithError__onceToken, &__block_literal_global_14196);
  if (-[NSObject supportsResources](v15, "supportsResources")
    && -[NSObject hasChangeType:](v15, "hasChangeType:", 8))
  {
    -[NSObject resourceCopyFromScopedIdentifier](v15, "resourceCopyFromScopedIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v50)
    {
LABEL_146:

      goto LABEL_147;
    }
    if (computeExpandedBatchWithError__simulateResourceCopyFailure)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_14133();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          p_super = v15;
          v318 = 2112;
          v319 = (uint64_t)v50;
          _os_log_impl(&dword_1B03C2000, v51, OS_LOG_TYPE_ERROR, "Simulating resource copy failure for change %@ with resources copied from %@", buf, 0x16u);
        }

      }
      -[CPLPushChangeTasks addTask:forRecordWithScopedIdentifier:](v3->_pushChangeTasks, "addTask:forRecordWithScopedIdentifier:", 7, v19);
      goto LABEL_323;
    }
    -[NSObject resources](v15, "resources");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "count"))
    {
      -[CPLPushSessionTracker resourceIdentitiesForRecordWithLocalScopedIdentifier:](v3, "resourceIdentitiesForRecordWithLocalScopedIdentifier:", v50);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        v296 = 0u;
        v297 = 0u;
        v294 = 0u;
        v295 = 0u;
        v249 = v52;
        v54 = -[NSObject countByEnumeratingWithState:objects:count:](v249, "countByEnumeratingWithState:objects:count:", &v294, v315, 16);
        if (v54)
        {
          v55 = v54;
          v239 = v52;
          v243 = v50;
          v56 = *(_QWORD *)v295;
          v226 = v19;
          v251 = v53;
          do
          {
            v57 = 0;
            do
            {
              if (*(_QWORD *)v295 != v56)
                objc_enumerationMutation(v249);
              v58 = *(void **)(*((_QWORD *)&v294 + 1) + 8 * v57);
              objc_msgSend(v58, "identity");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v58, "sourceResourceType");
              if (!v60)
              {
                v4 = v231;
                v14 = v256;
                v52 = v239;
                v50 = v243;
                if (_CPLSilentLogging)
                  goto LABEL_319;
                __CPLSessionOSLogDomain_14133();
                v63 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                  goto LABEL_318;
                v14 = v256;
                +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", objc_msgSend(v58, "resourceType"));
                v181 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                p_super = v15;
                v318 = 2112;
                v319 = (uint64_t)v181;
                v320 = 2112;
                v321 = v243;
                _os_log_impl(&dword_1B03C2000, v63, OS_LOG_TYPE_ERROR, "Client pushed %@ copying resource to %@ from %@ but did not specify which resource type to copy from", buf, 0x20u);
LABEL_317:

                goto LABEL_318;
              }
              v61 = v60;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v60);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectForKeyedSubscript:", v62);
              v63 = objc_claimAutoreleasedReturnValue();

              if (v63)
              {
                objc_msgSend(v59, "fingerPrint");
                v64 = objc_claimAutoreleasedReturnValue();
                -[NSObject fingerPrint](v63, "fingerPrint");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = (unint64_t)v65;
                if (v64)
                  v67 = v65 == 0;
                else
                  v67 = 1;
                if (v67)
                {

                  if (v64 | v66)
                    goto LABEL_307;
                }
                else
                {
                  v68 = objc_msgSend((id)v64, "isEqual:", v65);

                  if ((v68 & 1) == 0)
                  {
LABEL_307:
                    if (_CPLSilentLogging)
                      goto LABEL_378;
                    __CPLSessionOSLogDomain_14133();
                    v181 = objc_claimAutoreleasedReturnValue();
                    v4 = v231;
                    if (!os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                    {
                      v3 = (CPLPushSessionTracker *)p_isa;
                      v14 = v256;
                      goto LABEL_315;
                    }
                    +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", v61);
                    v183 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    p_super = v15;
                    v318 = 2112;
                    v319 = (uint64_t)v183;
                    v320 = 2112;
                    v50 = v243;
                    v321 = v243;
                    _os_log_impl(&dword_1B03C2000, v181, OS_LOG_TYPE_ERROR, "Client pushed %@ copying resource %@ from %@ but the fingerprints don't match", buf, 0x20u);

                    v3 = (CPLPushSessionTracker *)p_isa;
                    v14 = v256;
LABEL_316:
                    v52 = v239;
                    goto LABEL_317;
                  }
                }
              }
              else if (objc_msgSend(v58, "resourceType") != 1000
                     || (-[NSObject isAssetChange](v15, "isAssetChange") & 1) == 0)
              {
                if (!_CPLSilentLogging)
                {
                  __CPLSessionOSLogDomain_14133();
                  v181 = objc_claimAutoreleasedReturnValue();
                  v4 = v231;
                  v14 = v256;
                  if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                  {
                    +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", v61);
                    v182 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    p_super = v15;
                    v318 = 2112;
                    v319 = (uint64_t)v182;
                    v320 = 2112;
                    v50 = v243;
                    v321 = v243;
                    _os_log_impl(&dword_1B03C2000, v181, OS_LOG_TYPE_ERROR, "Client pushed %@ copying resource %@ from %@ but it does not have this resource", buf, 0x20u);

                    v63 = 0;
                    v3 = (CPLPushSessionTracker *)p_isa;
                    goto LABEL_316;
                  }
                  v63 = 0;
                  v3 = (CPLPushSessionTracker *)p_isa;
LABEL_315:
                  v50 = v243;
                  goto LABEL_316;
                }
                v63 = 0;
LABEL_378:
                v3 = (CPLPushSessionTracker *)p_isa;
                v4 = v231;
                v14 = v256;
                v52 = v239;
                v50 = v243;
LABEL_318:

LABEL_319:
                v19 = v226;
                v53 = v251;
LABEL_320:

                goto LABEL_321;
              }

              ++v57;
              v3 = (CPLPushSessionTracker *)p_isa;
              v19 = v226;
              v53 = v251;
            }
            while (v55 != v57);
            v55 = -[NSObject countByEnumeratingWithState:objects:count:](v249, "countByEnumeratingWithState:objects:count:", &v294, v315, 16);
          }
          while (v55);
          v4 = v231;
          v14 = v256;
          v52 = v239;
          v50 = v243;
        }
        else
        {
          v14 = v256;
        }
        goto LABEL_142;
      }
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_14133();
        v76 = objc_claimAutoreleasedReturnValue();
        v249 = v76;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          v77 = objc_msgSend(v52, "count");
          *(_DWORD *)buf = 138412802;
          p_super = v15;
          v318 = 2048;
          v319 = v77;
          v320 = 2112;
          v321 = v50;
          _os_log_impl(&dword_1B03C2000, v76, OS_LOG_TYPE_ERROR, "Client pushed %@ copying %lu resources from %@ which is unknown or deleted", buf, 0x20u);
        }
        goto LABEL_320;
      }
LABEL_321:
      -[CPLPushChangeTasks addTask:forRecordWithScopedIdentifier:](v3->_pushChangeTasks, "addTask:forRecordWithScopedIdentifier:", 7, v19);

    }
    else
    {
      if (-[NSObject isAssetChange](v15, "isAssetChange")
        && (-[NSObject adjustments](v15, "adjustments"),
            v69 = (void *)objc_claimAutoreleasedReturnValue(),
            v69,
            v69))
      {
        -[CPLPushSessionTracker enqueuedOrStoredRecordWithLocalScopedIdentifier:](v3, "enqueuedOrStoredRecordWithLocalScopedIdentifier:", v50);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v70)
        {
          v53 = v70;
          if (!objc_msgSend(v70, "isAssetChange"))
          {
            if (_CPLSilentLogging)
              goto LABEL_144;
            __CPLSessionOSLogDomain_14133();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v15;
              v318 = 2112;
              v319 = (uint64_t)v53;
              _os_log_impl(&dword_1B03C2000, v78, OS_LOG_TYPE_ERROR, "Client pushed adjusted %@ with no resources to copy from %@", buf, 0x16u);
            }
LABEL_143:

LABEL_144:
            goto LABEL_145;
          }
          objc_msgSend(v53, "resourceForType:", 1000);
          v249 = objc_claimAutoreleasedReturnValue();
          if (v249)
          {
            if (!_CPLSilentLogging)
            {
              __CPLSessionOSLogDomain_14133();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                p_super = v249;
                v318 = 2112;
                v319 = (uint64_t)v53;
                _os_log_impl(&dword_1B03C2000, v71, OS_LOG_TYPE_DEFAULT, "Automatically inferring using %@ in adjusted %@", buf, 0x16u);
              }

            }
            v72 = -[NSObject copy](v249, "copy");
            -[NSObject setSourceResourceType:](v72, "setSourceResourceType:", -[NSObject resourceType](v249, "resourceType"));
            v322 = v72;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v322, 1);
            v73 = v53;
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setResources:](v15, "setResources:", v74);

            v53 = v73;
          }
          else
          {
            if (_CPLSilentLogging)
            {
              v78 = 0;
              goto LABEL_143;
            }
            __CPLSessionOSLogDomain_14133();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v15;
              v318 = 2112;
              v319 = (uint64_t)v53;
              _os_log_impl(&dword_1B03C2000, v72, OS_LOG_TYPE_DEFAULT, "Client pushed adjusted %@ with no original resource to use from %@ - hopefully, the resources will be copied from what's on the server", buf, 0x16u);
            }
          }

LABEL_142:
          v78 = v249;
          goto LABEL_143;
        }
      }
      else if (-[CPLPushSessionTracker knowsClientRecordWithScopedIdentifier:](v3, "knowsClientRecordWithScopedIdentifier:", v50))
      {
LABEL_145:

        goto LABEL_146;
      }
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_14133();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          p_super = v15;
          v318 = 2112;
          v319 = (uint64_t)v50;
          _os_log_impl(&dword_1B03C2000, v75, OS_LOG_TYPE_ERROR, "Client pushed %@ copying 0 resources from %@ which is unknown or deleted", buf, 0x16u);
        }

      }
      -[CPLPushChangeTasks addTask:forRecordWithScopedIdentifier:](v3->_pushChangeTasks, "addTask:forRecordWithScopedIdentifier:", 7, v19);
    }

LABEL_323:
    goto LABEL_49;
  }
LABEL_147:
  -[CPLEngineStore quarantinedRecords](v3->_store, "quarantinedRecords");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "isRecordWithScopedIdentifierQuarantined:", v19);
  if (v80)
  {
    if ((-[NSObject isFullRecord](v15, "isFullRecord") & 1) == 0
      && !-[NSObject isDelete](v15, "isDelete"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_14133();
        v108 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          p_super = v15;
          _os_log_impl(&dword_1B03C2000, v108, OS_LOG_TYPE_DEFAULT, "Client pushed quarantined record: %@ - rejecting", buf, 0xCu);
        }

      }
      -[CPLPushChangeTasks addTask:forRecordWithScopedIdentifier:](v3->_pushChangeTasks, "addTask:forRecordWithScopedIdentifier:", 1, v19);
      goto LABEL_202;
    }
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        p_super = v15;
        _os_log_impl(&dword_1B03C2000, v81, OS_LOG_TYPE_DEFAULT, "Client pushed quarantined record: %@ - unquarantining", buf, 0xCu);
      }

    }
    if (-[NSObject isAssetChange](v15, "isAssetChange"))
    {
      -[NSObject masterScopedIdentifier](v15, "masterScopedIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if (v82
        && (-[NSMutableSet containsObject:](v3->_unquarantinedRecordScopedIdentifiers, "containsObject:", v82) & 1) == 0
        && objc_msgSend(v79, "isRecordWithScopedIdentifierQuarantined:", v82))
      {
        if (!_CPLSilentLogging)
        {
          __CPLSessionOSLogDomain_14133();
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            p_super = v15;
            _os_log_impl(&dword_1B03C2000, v83, OS_LOG_TYPE_DEFAULT, "Client pushed quarantined asset: %@ but also needs to push its master - rejecting", buf, 0xCu);
          }

        }
        -[CPLPushChangeTasks addTask:forRecordWithScopedIdentifier:](v3->_pushChangeTasks, "addTask:forRecordWithScopedIdentifier:", 4, v19);

        goto LABEL_202;
      }

    }
    -[NSMutableSet addObject:](v3->_unquarantinedRecordScopedIdentifiers, "addObject:", v19);
  }
  if (!-[NSObject validateRecordForTracker:](v15, "validateRecordForTracker:", v3))
  {
LABEL_202:
    v21 = 3;
    goto LABEL_369;
  }
  v290[0] = MEMORY[0x1E0C809B0];
  v290[1] = 3221225472;
  v290[2] = __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_20;
  v290[3] = &unk_1E60DAEC0;
  v84 = v15;
  v291 = v84;
  v292 = v3;
  v85 = v19;
  v293 = v85;
  v86 = (void *)MEMORY[0x1B5E08DC4](v290);
  v250 = v85;
  -[CPLPushSessionTracker storedClientRecordWithLocalScopedIdentifier:](v3, "storedClientRecordWithLocalScopedIdentifier:", v85);
  v87 = objc_claimAutoreleasedReturnValue();
  v228 = v79;
  v229 = (void *)v87;
  if (!v87)
  {
    if (-[NSObject isDelete](v84, "isDelete"))
    {
      if (!_CPLSilentLogging)
      {
        v106 = v86;
        __CPLSessionOSLogDomain_14133();
        v107 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          p_super = v84;
          _os_log_impl(&dword_1B03C2000, v107, OS_LOG_TYPE_DEBUG, "Client pushed a delete to an already deleted record: %@ - ignoring", buf, 0xCu);
        }

        v86 = v106;
      }
      ++v3->_ignoredRecordCount;
      goto LABEL_339;
    }
    if ((-[NSObject isFullRecord](v84, "isFullRecord") & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        v132 = v86;
        __CPLSessionOSLogDomain_14133();
        v133 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          p_super = v84;
          _os_log_impl(&dword_1B03C2000, v133, OS_LOG_TYPE_ERROR, "Client pushed a change but we are missing the full record: %@", buf, 0xCu);
        }

        v86 = v132;
      }
      -[CPLPushChangeTasks addTask:forRecordWithScopedIdentifier:](v3->_pushChangeTasks, "addTask:forRecordWithScopedIdentifier:", 2, v250);
      goto LABEL_339;
    }
    v109 = v84;
    if (!-[NSObject supportsResources](v84, "supportsResources"))
      goto LABEL_354;
    v225 = (uint64_t (**)(void *, id, _QWORD))v86;
    -[NSObject fingerprintScheme](v84, "fingerprintScheme");
    v240 = (id)objc_claimAutoreleasedReturnValue();
    v286 = 0u;
    v287 = 0u;
    v288 = 0u;
    v289 = 0u;
    v253 = v84;
    -[NSObject resources](v84, "resources");
    v234 = (id)objc_claimAutoreleasedReturnValue();
    v232 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v286, v314, 16);
    if (!v232)
    {
      v130 = 1;
      goto LABEL_352;
    }
    v236 = *(_QWORD *)v287;
LABEL_207:
    v110 = 0;
    while (1)
    {
      if (*(_QWORD *)v287 != v236)
        objc_enumerationMutation(v234);
      v111 = *(NSObject **)(*((_QWORD *)&v286 + 1) + 8 * v110);
      -[NSObject identity](v111, "identity");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "fingerPrint");
      v113 = objc_claimAutoreleasedReturnValue();
      if (!v113)
      {
        if (_CPLSilentLogging)
        {
          v185 = 0;
          v4 = v231;
        }
        else
        {
          __CPLSessionOSLogDomain_14133();
          v184 = objc_claimAutoreleasedReturnValue();
          v4 = v231;
          if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            p_super = v111;
            v318 = 2112;
            v319 = (uint64_t)v253;
            _os_log_impl(&dword_1B03C2000, v184, OS_LOG_TYPE_ERROR, "Client pushed a record with a resource missing finger print %@: %@", buf, 0x16u);
          }
          v185 = 0;
LABEL_332:

        }
        goto LABEL_333;
      }
      v114 = (void *)v113;
      v115 = v19;
      objc_msgSend(v240, "zeroByteFileFingerprint");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v244 = v114;
      v117 = objc_msgSend(v114, "isEqualToString:", v116);

      if (v117)
      {
        if (!_CPLSilentLogging)
        {
          __CPLSessionOSLogDomain_14133();
          v184 = objc_claimAutoreleasedReturnValue();
          v4 = v231;
          v19 = v115;
          if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            p_super = v111;
            v318 = 2112;
            v319 = (uint64_t)v253;
            _os_log_impl(&dword_1B03C2000, v184, OS_LOG_TYPE_ERROR, "Client pushed a record with 0 fileSize %@: %@", buf, 0x16u);
          }
          v185 = v244;
          goto LABEL_332;
        }
        v4 = v231;
        v19 = v115;
        v185 = v114;
LABEL_333:
        -[CPLPushChangeTasks addTask:forRecordWithScopedIdentifier:](v3->_pushChangeTasks, "addTask:forRecordWithScopedIdentifier:", 0, v250);
        goto LABEL_351;
      }
      objc_msgSend(v112, "fileUTI");
      v118 = (void *)objc_claimAutoreleasedReturnValue();

      if (v118)
        v119 = 0;
      else
        v119 = _CPLSilentLogging == 0;
      if (v119)
      {
        __CPLSessionOSLogDomain_14133();
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          p_super = v111;
          v318 = 2112;
          v319 = (uint64_t)v253;
          _os_log_impl(&dword_1B03C2000, v120, OS_LOG_TYPE_ERROR, "Client pushed a record with a resource missing file type %@: %@", buf, 0x16u);
        }

      }
      -[CPLPushSessionTracker storedCloudRecordWithLocalScopedIdentifier:](v3, "storedCloudRecordWithLocalScopedIdentifier:", v250);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "fileURL");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v122)
      {
        v19 = v115;
        if (!-[NSObject canGenerateDerivative](v111, "canGenerateDerivative"))
          goto LABEL_236;
        if (computeExpandedBatchWithError__onceToken_22 != -1)
          dispatch_once(&computeExpandedBatchWithError__onceToken_22, &__block_literal_global_24_14216);
        if (computeExpandedBatchWithError__alwaysAskForDerivatives)
          v123 = 1;
        else
          v123 = v80;
        if ((v123 & 1) != 0)
          goto LABEL_346;
        if (!v121)
          goto LABEL_346;
        objc_msgSend(v121, "resourceForType:", -[NSObject resourceType](v111, "resourceType"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v124)
          goto LABEL_346;
        v122 = v124;
        objc_msgSend(v124, "identity");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v125, "isAvailable"))
          goto LABEL_345;
        objc_msgSend(v125, "fingerPrint");
        v126 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "fingerPrint");
        v127 = objc_claimAutoreleasedReturnValue();
        v128 = (void *)v127;
        if (v126 && v127)
        {
          v222 = objc_msgSend((id)v126, "isEqual:", v127);

          v3 = (CPLPushSessionTracker *)p_isa;
          if ((v222 & 1) == 0)
            goto LABEL_345;
        }
        else
        {
          v223 = v126 | v127;

          v3 = (CPLPushSessionTracker *)p_isa;
          if (v223)
          {
LABEL_345:

LABEL_346:
            v4 = v231;
            v19 = v115;
            v185 = v244;
            if (!_CPLSilentLogging)
            {
              __CPLSessionOSLogDomain_14133();
              v187 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                p_super = v253;
                _os_log_impl(&dword_1B03C2000, v187, OS_LOG_TYPE_DEFAULT, "Client optimistically pushed a record without resources but was wrong: %@", buf, 0xCu);
              }

            }
            -[CPLPushChangeTasks addTask:forRecordWithScopedIdentifier:](v3->_pushChangeTasks, "addTask:forRecordWithScopedIdentifier:", 3, v250);

LABEL_351:
            v130 = 0;
            v14 = v256;
LABEL_352:

            v188 = v225[2](v225, v253, 0);
            v21 = 3;
            if (!v188)
              goto LABEL_367;
            v86 = v225;
            v109 = v253;
            if (!v130)
              goto LABEL_368;
LABEL_354:
            v189 = v109;
            if (-[NSObject isAssetChange](v109, "isAssetChange"))
            {
              v225 = (uint64_t (**)(void *, id, _QWORD))v86;
              v227 = v19;
              -[NSObject containerRelations](v109, "containerRelations");
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setContainerRelations:](v189, "setContainerRelations:", 0);
              -[CPLChangeBatch addRecord:](v3->_expandedBatch, "addRecord:", v189);
              v191 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              -[NSObject recordModificationDate](v189, "recordModificationDate");
              v246 = (id)objc_claimAutoreleasedReturnValue();
              v282 = 0u;
              v283 = 0u;
              v284 = 0u;
              v285 = 0u;
              v255 = v190;
              v192 = objc_msgSend(v255, "countByEnumeratingWithState:objects:count:", &v282, v313, 16);
              if (v192)
              {
                v193 = v192;
                v194 = *(_QWORD *)v283;
                do
                {
                  for (i = 0; i != v193; ++i)
                  {
                    if (*(_QWORD *)v283 != v194)
                      objc_enumerationMutation(v255);
                    v196 = *(void **)(*((_QWORD *)&v282 + 1) + 8 * i);
                    objc_msgSend(v196, "containerIdentifier");
                    v197 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v191, "containsObject:", v197) & 1) == 0)
                    {
                      objc_msgSend(v191, "addObject:", v197);
                      objc_msgSend(v196, "proposedScopedIdentifierForItemScopedIdentifier:", v250);
                      v198 = (void *)objc_claimAutoreleasedReturnValue();
                      v199 = +[CPLRecordChange newRecordWithScopedIdentifier:](CPLContainerRelationChange, "newRecordWithScopedIdentifier:", v198);
                      objc_msgSend(v250, "identifier");
                      v200 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v199, "setItemIdentifier:", v200);

                      objc_msgSend(v199, "setRelation:", v196);
                      objc_msgSend(v199, "setRecordModificationDate:", v246);
                      objc_msgSend(p_isa[20], "addRecord:", v199);

                      v3 = (CPLPushSessionTracker *)p_isa;
                      v4 = v231;
                    }

                  }
                  v193 = objc_msgSend(v255, "countByEnumeratingWithState:objects:count:", &v282, v313, 16);
                }
                while (v193);
              }

              v21 = 0;
LABEL_365:
              v14 = v256;
LABEL_366:
              v19 = v227;
              goto LABEL_367;
            }
            v179 = v3->_expandedBatch;
            v180 = v109;
LABEL_299:
            -[CPLChangeBatch addRecord:](v179, "addRecord:", v180);
            v21 = 0;
            goto LABEL_368;
          }
        }

      }
      v19 = v115;
LABEL_236:

      if (v232 == ++v110)
      {
        v129 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v286, v314, 16);
        v130 = 1;
        v4 = v231;
        v14 = v256;
        v232 = v129;
        if (!v129)
          goto LABEL_352;
        goto LABEL_207;
      }
    }
  }
  v88 = v87;
  if (!-[NSObject supportsResources](v84, "supportsResources")
    || !-[NSObject hasChangeType:](v84, "hasChangeType:", 8))
  {
LABEL_253:
    if (-[NSObject isAssetChange](v84, "isAssetChange"))
    {
      if (-[NSObject isDelete](v84, "isDelete"))
      {
        v134 = v84;
        v225 = (uint64_t (**)(void *, id, _QWORD))v86;
        v227 = v19;
        v275 = 0u;
        v276 = 0u;
        v273 = 0u;
        v274 = 0u;
        -[CPLEngineStore transactionClientCacheView](v3->_store, "transactionClientCacheView");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "recordViewsWithRelatedScopedIdentifier:class:", v250, objc_opt_class());
        v136 = (void *)objc_claimAutoreleasedReturnValue();

        v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v273, v311, 16);
        if (v137)
        {
          v138 = v137;
          v139 = *(_QWORD *)v274;
          do
          {
            for (j = 0; j != v138; ++j)
            {
              if (*(_QWORD *)v274 != v139)
                objc_enumerationMutation(v136);
              v141 = *(void **)(*((_QWORD *)&v273 + 1) + 8 * j);
              objc_msgSend(v141, "scopedIdentifier");
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v141, "synthesizedRecord");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_storedClientRecords, "setObject:forKeyedSubscript:", v143, v142);

              v144 = v3->_expandedBatch;
              v145 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:](CPLContainerRelationChange, "newDeleteChangeWithScopedIdentifier:", v142);
              -[CPLChangeBatch addRecord:](v144, "addRecord:", v145);

            }
            v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v273, v311, 16);
          }
          while (v138);
        }

        -[CPLChangeBatch addRecord:](v3->_expandedBatch, "addRecord:", v134);
        v21 = 0;
        v4 = v231;
        goto LABEL_365;
      }
      if (-[NSObject hasChangeType:](v84, "hasChangeType:", 16))
      {
        v225 = (uint64_t (**)(void *, id, _QWORD))v86;
        -[NSObject containerRelations](v84, "containerRelations");
        v241 = (id)objc_claimAutoreleasedReturnValue();
        if (-[NSObject changeType](v84, "changeType") != 16)
        {
          if ((-[NSObject isFullRecord](v84, "isFullRecord") & 1) == 0)
            -[NSObject setChangeType:](v84, "setChangeType:", -[NSObject changeType](v84, "changeType") & 0xFFFFFFFFFFFFFFEFLL);
          -[NSObject setContainerRelations:](v84, "setContainerRelations:", 0);
          -[CPLChangeBatch addRecord:](v3->_expandedBatch, "addRecord:", v84);
        }
        v146 = v84;
        v227 = v19;
        -[CPLEngineStore transactionClientCacheView](v3->_store, "transactionClientCacheView");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "recordViewsWithRelatedScopedIdentifier:class:", v250, objc_opt_class());
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        v254 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v269 = 0u;
        v270 = 0u;
        v271 = 0u;
        v272 = 0u;
        v245 = v148;
        v149 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v269, v310, 16);
        if (v149)
        {
          v150 = v149;
          v151 = *(_QWORD *)v270;
          do
          {
            for (k = 0; k != v150; ++k)
            {
              if (*(_QWORD *)v270 != v151)
                objc_enumerationMutation(v245);
              v153 = *(void **)(*((_QWORD *)&v269 + 1) + 8 * k);
              objc_msgSend(v153, "synthesizedRecord");
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v154, "relation");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v155, "containerIdentifier");
              v156 = (void *)objc_claimAutoreleasedReturnValue();

              if (v156)
              {
                objc_msgSend(v254, "setObject:forKeyedSubscript:", v154, v156);
                storedClientRecords = v3->_storedClientRecords;
                objc_msgSend(v153, "scopedIdentifier");
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](storedClientRecords, "setObject:forKeyedSubscript:", v154, v158);

              }
            }
            v150 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v269, v310, 16);
          }
          while (v150);
        }

        v159 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v233 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSObject recordModificationDate](v146, "recordModificationDate");
        v235 = (id)objc_claimAutoreleasedReturnValue();
        v265 = 0u;
        v266 = 0u;
        v267 = 0u;
        v268 = 0u;
        v242 = v241;
        v160 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v265, v309, 16);
        v161 = v254;
        v237 = v159;
        if (v160)
        {
          v162 = v160;
          v163 = *(_QWORD *)v266;
          do
          {
            for (m = 0; m != v162; ++m)
            {
              if (*(_QWORD *)v266 != v163)
                objc_enumerationMutation(v242);
              v165 = *(void **)(*((_QWORD *)&v265 + 1) + 8 * m);
              objc_msgSend(v165, "containerIdentifier");
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              if (v166 && (objc_msgSend(v159, "containsObject:", v166) & 1) == 0)
              {
                objc_msgSend(v159, "addObject:", v166);
                objc_msgSend(v161, "objectForKeyedSubscript:", v166);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                v168 = v167;
                if (v167)
                {
                  objc_msgSend(v167, "scopedIdentifier");
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  v170 = +[CPLRecordChange newRecordWithScopedIdentifier:](CPLContainerRelationChange, "newRecordWithScopedIdentifier:", v169);

                  objc_msgSend(v250, "identifier");
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v170, "setItemIdentifier:", v171);

                  objc_msgSend(v170, "setRelation:", v165);
                  objc_msgSend(v170, "setRecordModificationDate:", v235);
                  objc_msgSend(v161, "removeObjectForKey:", v166);
                  objc_msgSend(v233, "addObject:", v170);
                }
                else
                {
                  objc_msgSend(v165, "proposedScopedIdentifierForItemScopedIdentifier:", v250);
                  v170 = (id)objc_claimAutoreleasedReturnValue();
                  v172 = +[CPLRecordChange newRecordWithScopedIdentifier:](CPLContainerRelationChange, "newRecordWithScopedIdentifier:", v170);
                  objc_msgSend(v250, "identifier");
                  v173 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v172, "setItemIdentifier:", v173);

                  v161 = v254;
                  objc_msgSend(v172, "setRelation:", v165);
                  objc_msgSend(v172, "setRecordModificationDate:", v235);
                  objc_msgSend(v233, "addObject:", v172);

                }
                v159 = v237;
              }

            }
            v162 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v265, v309, 16);
          }
          while (v162);
        }

        v264[0] = MEMORY[0x1E0C809B0];
        v264[1] = 3221225472;
        v264[2] = __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_29;
        v264[3] = &unk_1E60DAF08;
        v3 = (CPLPushSessionTracker *)p_isa;
        v264[4] = p_isa;
        objc_msgSend(v161, "enumerateKeysAndObjectsUsingBlock:", v264);
        v262 = 0u;
        v263 = 0u;
        v260 = 0u;
        v261 = 0u;
        v174 = v233;
        v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v260, v308, 16);
        v4 = v231;
        v14 = v256;
        if (v175)
        {
          v176 = v175;
          v177 = *(_QWORD *)v261;
          do
          {
            for (n = 0; n != v176; ++n)
            {
              if (*(_QWORD *)v261 != v177)
                objc_enumerationMutation(v174);
              objc_msgSend(p_isa[20], "addRecord:", *(_QWORD *)(*((_QWORD *)&v260 + 1) + 8 * n));
            }
            v176 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v260, v308, 16);
          }
          while (v176);
        }

        v21 = 0;
        goto LABEL_366;
      }
    }
    v179 = v3->_expandedBatch;
    v180 = v84;
    goto LABEL_299;
  }
  v225 = (uint64_t (**)(void *, id, _QWORD))v86;
  v280 = 0u;
  v281 = 0u;
  v278 = 0u;
  v279 = 0u;
  -[NSObject resources](v84, "resources");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v278, v312, 16);
  if (!v90)
  {

    v86 = v225;
    if ((v225[2](v225, v84, v88) & 1) != 0)
      goto LABEL_253;
LABEL_339:
    v21 = 3;
    goto LABEL_368;
  }
  v91 = v90;
  v252 = v84;
  v227 = v19;
  v92 = 0;
  v93 = 0;
  v94 = *(_QWORD *)v279;
  while (2)
  {
    for (ii = 0; ii != v91; ++ii)
    {
      if (*(_QWORD *)v279 != v94)
        objc_enumerationMutation(v89);
      v96 = *(NSObject **)(*((_QWORD *)&v278 + 1) + 8 * ii);
      -[NSObject identity](v96, "identity");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "fileURL");
      v98 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v98)
      {
        v93 = -[NSObject canGenerateDerivative](v96, "canGenerateDerivative");
        v92 = 1;
      }
      objc_msgSend(v97, "fingerPrint");
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v99)
      {
        v3 = (CPLPushSessionTracker *)p_isa;
        v4 = v231;
        if (!_CPLSilentLogging)
        {
          __CPLSessionOSLogDomain_14133();
          v131 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            p_super = v96;
            v318 = 2112;
            v319 = (uint64_t)v252;
            _os_log_impl(&dword_1B03C2000, v131, OS_LOG_TYPE_DEFAULT, "Client pushed a record with a resource missing finger print %@: %@", buf, 0x16u);
          }

        }
        objc_msgSend(p_isa[21], "addTask:forRecordWithScopedIdentifier:", 0, v250);

        v21 = 3;
        goto LABEL_365;
      }

    }
    v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v278, v312, 16);
    if (v91)
      continue;
    break;
  }

  v86 = v225;
  v100 = ((uint64_t (**)(void *, id, void *))v225)[2](v225, v252, v229);
  v4 = v231;
  if ((v100 & v92) != 1)
  {
    v3 = (CPLPushSessionTracker *)p_isa;
    v14 = v256;
    v19 = v227;
    v84 = v252;
    if ((v100 & 1) != 0)
      goto LABEL_253;
    goto LABEL_339;
  }
  v3 = (CPLPushSessionTracker *)p_isa;
  objc_msgSend(p_isa, "_realChangeFromChange:comparedToStoredRecord:changeType:", v252, v229, 8);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v101;
  v14 = v256;
  v19 = v227;
  if (!v101 || !objc_msgSend(v101, "hasChangeType:", 8))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v186 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        p_super = v252;
        _os_log_impl(&dword_1B03C2000, v186, OS_LOG_TYPE_DEFAULT, "Client pushed a record update with sparse resources but with no actual resource change: %@", buf, 0xCu);
      }

    }
    goto LABEL_344;
  }
  if ((v93 & 1) != 0
    || !-[NSObject allowsToOnlyUploadNewResources](v252, "allowsToOnlyUploadNewResources"))
  {
    objc_msgSend(v102, "resourceCopyFromScopedIdentifier");
    v201 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v201)
      goto LABEL_372;
LABEL_344:

    v86 = v225;
    v84 = v252;
    goto LABEL_253;
  }
  v277 = 0;
  v103 = -[NSObject changeIsOnlyAddingResourcesToRecord:addedResources:](v252, "changeIsOnlyAddingResourcesToRecord:addedResources:", v229, &v277);
  v104 = v277;
  if (v103 && !_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_14133();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      p_super = v252;
      v318 = 2112;
      v319 = (uint64_t)v104;
      _os_log_impl(&dword_1B03C2000, v105, OS_LOG_TYPE_DEFAULT, "Client pushed a record update with sparse resources but just adding new non-sparse resources: %@\nAdded resources:\n%@", buf, 0x16u);
    }

    v19 = v227;
  }

  if ((v103 & 1) != 0)
    goto LABEL_344;
LABEL_372:
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_14133();
    v202 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      p_super = v252;
      _os_log_impl(&dword_1B03C2000, v202, OS_LOG_TYPE_ERROR, "Client pushed a record update with sparse resources: %@", buf, 0xCu);
    }

  }
  v21 = 3;
  objc_msgSend(p_isa[21], "addTask:forRecordWithScopedIdentifier:", 3, v250);

LABEL_367:
  v86 = v225;
LABEL_368:

  v79 = v228;
LABEL_369:

LABEL_50:
  if (v21 == 3 || !v21)
    goto LABEL_64;

  expandHasBeenSuccessful = 0;
LABEL_397:

  return expandHasBeenSuccessful;
}

- (BOOL)computeDiff
{
  CPLChangeBatch *v3;
  CPLChangeBatch *diffedBatch;
  NSMutableArray *v5;
  NSMutableArray *addedRecords;
  NSMutableArray *v7;
  NSMutableArray *updatedRecords;
  NSMutableArray *v9;
  NSMutableArray *deletedRecordScopedIdentifiers;
  NSMutableDictionary *v11;
  NSMutableDictionary *fullRecords;
  NSMutableDictionary *v13;
  NSMutableDictionary *resourcesToUpload;
  NSMutableArray *v15;
  NSMutableArray *changesWithResourceChanges;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  char v32;
  NSObject *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  CPLRecordChangeDiffTracker *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  id v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  void *v72;
  NSObject *v73;
  id v74;
  void *v75;
  char v76;
  NSObject *v77;
  id v78;
  id v79;
  CPLRecordChangeDiffTracker *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  id v84;
  id v85;
  CPLRecordChangeDiffTracker *v86;
  char v87;
  void *v88;
  id v89;
  id v90;
  NSObject *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v112;
  id v113;
  CPLChangeBatch *obj;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void (**v121)(void);
  CPLPushSessionTracker *v122;
  _QWORD v123[5];
  id v124;
  id v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _QWORD v131[4];
  id v132;
  id v133;
  id v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[5];
  id v141;
  void *v142;
  __int128 *v143;
  _QWORD v144[5];
  id v145;
  id v146;
  __int128 *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _QWORD v152[5];
  id v153;
  _QWORD v154[4];
  id v155;
  CPLPushSessionTracker *v156;
  uint8_t v157[128];
  uint8_t buf[4];
  id v159;
  __int16 v160;
  id v161;
  __int16 v162;
  CPLRecordChangeDiffTracker *v163;
  uint8_t v164[128];
  __int128 v165;
  uint64_t v166;
  BOOL v167;
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  if (!self->_expandHasBeenSuccessful)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v165) = 138412290;
        *(_QWORD *)((char *)&v165 + 4) = v102;
        _os_log_impl(&dword_1B03C2000, v101, OS_LOG_TYPE_ERROR, "%@ called before expansion", (uint8_t *)&v165, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v104, 841, CFSTR("%@ called before expansion"), v105);

    abort();
  }
  if (self->_diffHasBeenSuccessful)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v165) = 138412290;
        *(_QWORD *)((char *)&v165 + 4) = v107;
        _os_log_impl(&dword_1B03C2000, v106, OS_LOG_TYPE_ERROR, "%@ called twice", (uint8_t *)&v165, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v109, 842, CFSTR("%@ called twice"), v110);

    abort();
  }
  v3 = objc_alloc_init(CPLChangeBatch);
  diffedBatch = self->_diffedBatch;
  self->_diffedBatch = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  addedRecords = self->_addedRecords;
  self->_addedRecords = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  updatedRecords = self->_updatedRecords;
  self->_updatedRecords = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  deletedRecordScopedIdentifiers = self->_deletedRecordScopedIdentifiers;
  self->_deletedRecordScopedIdentifiers = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  fullRecords = self->_fullRecords;
  self->_fullRecords = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  resourcesToUpload = self->_resourcesToUpload;
  self->_resourcesToUpload = v13;

  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  changesWithResourceChanges = self->_changesWithResourceChanges;
  self->_changesWithResourceChanges = v15;

  v115 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v154[0] = MEMORY[0x1E0C809B0];
  v154[1] = 3221225472;
  v154[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke;
  v154[3] = &unk_1E60DAF30;
  v112 = v17;
  v155 = v112;
  v122 = self;
  v156 = self;
  v18 = (void *)MEMORY[0x1B5E08DC4](v154);
  v152[0] = MEMORY[0x1E0C809B0];
  v152[1] = 3221225472;
  v152[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_2;
  v152[3] = &unk_1E60DAF58;
  v113 = v18;
  v153 = v113;
  v152[4] = self;
  v118 = (void *)MEMORY[0x1B5E08DC4](v152);
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  obj = self->_expandedBatch;
  v119 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
  if (v119)
  {
    v117 = *(_QWORD *)v149;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v149 != v117)
        {
          v20 = v19;
          objc_enumerationMutation(obj);
          v19 = v20;
        }
        v120 = v19;
        v21 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v19);
        objc_msgSend(v21, "scopedIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          if (!_CPLSilentLogging)
          {
            __CPLSessionOSLogDomain_14133();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v165) = 138412290;
              *(_QWORD *)((char *)&v165 + 4) = v21;
              _os_log_impl(&dword_1B03C2000, v92, OS_LOG_TYPE_ERROR, "%@ should have an identifier", (uint8_t *)&v165, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", a2, v122, v94, 877, CFSTR("%@ should have an identifier"), v21);

          abort();
        }
        if (objc_msgSend(v21, "isFullRecord"))
          -[CPLPushSessionTracker acknowledgeNewClientRecord:withScopedIdentifier:](v122, "acknowledgeNewClientRecord:withScopedIdentifier:", v21, v22);
        *(_QWORD *)&v165 = 0;
        *((_QWORD *)&v165 + 1) = &v165;
        v166 = 0x2020000000;
        v167 = 0;
        if (objc_msgSend(v21, "supportsResources")
          && objc_msgSend(v21, "hasChangeType:", 8))
        {
          objc_msgSend(v21, "resources");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count") != 0;

        }
        else
        {
          v24 = 0;
        }
        v167 = v24;
        v144[0] = MEMORY[0x1E0C809B0];
        v144[1] = 3221225472;
        v144[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_41;
        v144[3] = &unk_1E60DAF80;
        v147 = &v165;
        v144[4] = v122;
        v25 = v22;
        v145 = v25;
        v146 = v118;
        v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E08DC4](v144);
        v140[0] = MEMORY[0x1E0C809B0];
        v140[1] = 3221225472;
        v140[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_2_42;
        v140[3] = &unk_1E60DAFA8;
        v143 = &v165;
        v140[4] = v122;
        v27 = v25;
        v141 = v27;
        v142 = v21;
        v121 = (void (**)(void))MEMORY[0x1B5E08DC4](v140);
        if (objc_msgSend(v21, "isMasterChange"))
          objc_msgSend(v115, "setObject:forKeyedSubscript:", &unk_1E611A240, v27);
        -[CPLPushSessionTracker storedClientRecordWithLocalScopedIdentifier:](v122, "storedClientRecordWithLocalScopedIdentifier:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          if (objc_msgSend(v21, "isDelete"))
          {
            if (!_CPLSilentLogging)
            {
              __CPLSessionOSLogDomain_14133();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                v30 = (id)objc_opt_class();
                objc_msgSend(v21, "scopedIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v159 = v30;
                v160 = 2112;
                v161 = v31;
                _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_DEBUG, "-- adding real change delete <%@ %@> to batch", buf, 0x16u);

              }
            }
            -[NSMutableArray addObject:](v122->_deletedRecordScopedIdentifiers, "addObject:", v27);
            if (v122->_diffedBatchCanLowerQuota)
              v32 = 1;
            else
              v32 = objc_msgSend(v21, "canLowerQuota");
            v122->_diffedBatchCanLowerQuota = v32;
            objc_msgSend(v28, "relatedIdentifier");
            v61 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "secondaryIdentifier");
            v62 = objc_claimAutoreleasedReturnValue();
            if (v61 | v62)
            {
              v33 = objc_msgSend(v21, "copy");
              -[NSObject setRelatedIdentifier:](v33, "setRelatedIdentifier:", v61);
              -[NSObject setSecondaryIdentifier:](v33, "setSecondaryIdentifier:", v62);
            }
            else
            {
              v33 = v21;
            }
            ((void (**)(_QWORD, NSObject *, void *))v26)[2](v26, v33, v28);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v122->_fullRecords, "setObject:forKeyedSubscript:", v28, v27);
            if (objc_msgSend(v21, "isAssetChange"))
            {
              objc_msgSend(v28, "masterScopedIdentifier");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              if (v63)
              {
                objc_msgSend(v115, "objectForKeyedSubscript:", v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_msgSend(v64, "integerValue");

                if (v65 != 0x8000000000000000)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v65 + 1);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v115, "setObject:forKeyedSubscript:", v66, v63);

                }
              }

            }
            if (objc_msgSend(v28, "supportsResources"))
              -[NSMutableArray addObject:](v122->_changesWithResourceChanges, "addObject:", v27);

          }
          else
          {
            v36 = v21;
            v37 = v36;
            if (objc_msgSend(v36, "isFullRecord"))
            {
              objc_msgSend((id)objc_opt_class(), "copyPropertyBlockForDirection:", 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v36;
              if (v38)
              {
                v39 = (void *)objc_msgSend((id)objc_opt_class(), "newRecordWithScopedIdentifier:", v27);

                v131[0] = MEMORY[0x1E0C809B0];
                v131[1] = 3221225472;
                v131[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_46;
                v131[3] = &unk_1E60DAFD0;
                v135 = v38;
                v37 = v39;
                v132 = v37;
                v133 = v36;
                v134 = v28;
                objc_msgSend(v37, "cplCopyPropertiesFromObject:withCopyBlock:", v36, v131);

              }
            }
            if (objc_msgSend(v37, "supportsResources")
              && objc_msgSend(v37, "hasChangeType:", 8)
              && (objc_msgSend(v36, "resources"),
                  v40 = (void *)objc_claimAutoreleasedReturnValue(),
                  v116 = (void *)objc_msgSend(v40, "cplDeepCopy"),
                  v40,
                  v116))
            {
              if (v37 == v36)
              {
                v37 = (id)objc_msgSend(v36, "copy");

              }
              v129 = 0u;
              v130 = 0u;
              v127 = 0u;
              v128 = 0u;
              objc_msgSend(v37, "resources");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v127, v157, 16);
              if (v42)
              {
                v43 = *(_QWORD *)v128;
                do
                {
                  for (i = 0; i != v42; ++i)
                  {
                    if (*(_QWORD *)v128 != v43)
                      objc_enumerationMutation(v41);
                    objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * i), "identity");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "setAvailable:", 1);
                    objc_msgSend(v45, "setFileURL:", 0);

                  }
                  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v127, v157, 16);
                }
                while (v42);
              }

            }
            else
            {
              v116 = 0;
            }
            v46 = objc_alloc_init(CPLRecordChangeDiffTracker);
            v126 = 0;
            objc_msgSend(v28, "realRecordChangeFromRecordChange:direction:newRecord:diffTracker:", v37, 1, &v126, v46);
            v33 = objc_claimAutoreleasedReturnValue();
            v47 = v126;

            if (-[NSMutableSet containsObject:](v122->_unquarantinedRecordScopedIdentifiers, "containsObject:", v27))
            {
              if (v33)
              {
                v48 = v47;
                v47 = v33;
              }
              else
              {
                v48 = v28;
              }
              v33 = v48;

              -[CPLRecordChangeDiffTracker withTrackerForChangeType:block:](v46, "withTrackerForChangeType:block:", 2, &__block_literal_global_51);
              v47 = v33;
            }
            if (v33)
            {
              if (!v47)
              {
                if (!_CPLSilentLogging)
                {
                  __CPLSessionOSLogDomain_14133();
                  v95 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v159 = v36;
                    _os_log_impl(&dword_1B03C2000, v95, OS_LOG_TYPE_ERROR, "With a real change should come an updated record for %@", buf, 0xCu);
                  }

                }
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, v122, v97, 1075, CFSTR("With a real change should come an updated record for %@"), v36);

                abort();
              }
              -[NSObject recordModificationDate](v33, "recordModificationDate");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = v70 == 0;

              if (v71)
              {
                objc_msgSend(v36, "recordModificationDate");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setRecordModificationDate:](v33, "setRecordModificationDate:", v72);

              }
              if (!_CPLSilentLogging)
              {
                __CPLSessionOSLogDomain_14133();
                v73 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  v74 = (id)objc_opt_class();
                  objc_msgSend(v36, "scopedIdentifier");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v159 = v74;
                  v160 = 2112;
                  v161 = v75;
                  v162 = 2112;
                  v163 = v46;
                  _os_log_impl(&dword_1B03C2000, v73, OS_LOG_TYPE_DEFAULT, "-- adding real change <%@ %@> to batch (%@)", buf, 0x20u);

                }
              }
              -[NSMutableArray addObject:](v122->_updatedRecords, "addObject:", v47);
              if (v122->_diffedBatchCanLowerQuota)
                v76 = 1;
              else
                v76 = -[NSObject canLowerQuota](v33, "canLowerQuota");
              v122->_diffedBatchCanLowerQuota = v76;
              if ((-[NSObject hasChangeType:](v33, "hasChangeType:", 2) & 1) == 0)
              {
                objc_msgSend(v28, "relatedIdentifier");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setRelatedIdentifier:](v33, "setRelatedIdentifier:", v81);

                objc_msgSend(v28, "secondaryIdentifier");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setSecondaryIdentifier:](v33, "setSecondaryIdentifier:", v82);

              }
              ((void (**)(_QWORD, NSObject *, void *))v26)[2](v26, v33, v28);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v122->_fullRecords, "setObject:forKeyedSubscript:", v47, v27);
              if (v116 && -[NSObject hasChangeType:](v33, "hasChangeType:", 8))
                -[NSMutableDictionary setObject:forKeyedSubscript:](v122->_resourcesToUpload, "setObject:forKeyedSubscript:", v116, v27);
              if (-[NSObject supportsResources](v33, "supportsResources")
                && -[NSObject hasChangeType:](v33, "hasChangeType:", 8))
              {
                -[NSMutableArray addObject:](v122->_changesWithResourceChanges, "addObject:", v27);
              }
            }
            else
            {
              if (!_CPLSilentLogging)
              {
                __CPLSessionOSLogDomain_14133();
                v77 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                {
                  v78 = (id)objc_opt_class();
                  objc_msgSend(v36, "scopedIdentifier");
                  v79 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "cplFullDescription");
                  v80 = (CPLRecordChangeDiffTracker *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v159 = v78;
                  v160 = 2112;
                  v161 = v79;
                  v162 = 2112;
                  v163 = v80;
                  _os_log_impl(&dword_1B03C2000, v77, OS_LOG_TYPE_DEBUG, "-- <%@ %@> did not result in a change of the stored record: %@", buf, 0x20u);

                }
              }
              v121[2]();
            }

          }
LABEL_122:

          goto LABEL_123;
        }
        if (!objc_msgSend(v21, "isDelete"))
        {
          if ((objc_msgSend(v21, "isFullRecord") & 1) == 0)
          {
            if (!_CPLSilentLogging)
            {
              __CPLSessionOSLogDomain_14133();
              v98 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v159 = v21;
                _os_log_impl(&dword_1B03C2000, v98, OS_LOG_TYPE_ERROR, "%@ should be a full record as a new record", buf, 0xCu);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "handleFailureInMethod:object:file:lineNumber:description:", a2, v122, v100, 922, CFSTR("%@ should be a full record as a new record"), v21);

            abort();
          }
          if (objc_msgSend(v21, "isAssetChange"))
          {
            objc_msgSend(0, "masterScopedIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
            {
              objc_msgSend(v115, "objectForKeyedSubscript:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "integerValue");

              if (v51 != 0x8000000000000000)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51 - 1);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "setObject:forKeyedSubscript:", v52, v49);

              }
            }

          }
          v53 = v21;
          if (-[NSObject supportsResources](v53, "supportsResources"))
          {
            -[NSObject resources](v53, "resources");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = (void *)objc_msgSend(v54, "cplDeepCopy");

            if (v55)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v122->_resourcesToUpload, "setObject:forKeyedSubscript:", v55, v27);
              v33 = -[NSObject copy](v53, "copy");

              v138 = 0u;
              v139 = 0u;
              v136 = 0u;
              v137 = 0u;
              -[NSObject resources](v33, "resources");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v136, v164, 16);
              if (v57)
              {
                v58 = *(_QWORD *)v137;
                do
                {
                  for (j = 0; j != v57; ++j)
                  {
                    if (*(_QWORD *)v137 != v58)
                      objc_enumerationMutation(v56);
                    objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * j), "identity");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "setAvailable:", 1);
                    objc_msgSend(v60, "setFileURL:", 0);

                  }
                  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v136, v164, 16);
                }
                while (v57);
              }

            }
            else
            {
              v33 = v53;
            }

          }
          else
          {
            v33 = v53;
          }
          if (!_CPLSilentLogging)
          {
            __CPLSessionOSLogDomain_14133();
            v83 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              v84 = (id)objc_opt_class();
              -[NSObject scopedIdentifier](v33, "scopedIdentifier");
              v85 = (id)objc_claimAutoreleasedReturnValue();
              -[NSObject cplFullDescription](v33, "cplFullDescription");
              v86 = (CPLRecordChangeDiffTracker *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v159 = v84;
              v160 = 2112;
              v161 = v85;
              v162 = 2112;
              v163 = v86;
              _os_log_impl(&dword_1B03C2000, v83, OS_LOG_TYPE_DEBUG, "-- adding real change <%@ %@> to batch (new record): %@", buf, 0x20u);

            }
          }
          -[NSMutableArray addObject:](v122->_addedRecords, "addObject:", v33);
          if (v122->_diffedBatchCanLowerQuota)
            v87 = 1;
          else
            v87 = -[NSObject canLowerQuota](v33, "canLowerQuota");
          v122->_diffedBatchCanLowerQuota = v87;
          ((void (**)(_QWORD, NSObject *, _QWORD))v26)[2](v26, v33, 0);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v122->_fullRecords, "setObject:forKeyedSubscript:", v33, v27);
          goto LABEL_122;
        }
        if (-[NSMutableSet containsObject:](v122->_unquarantinedRecordScopedIdentifiers, "containsObject:", v27))
        {
          if (_CPLSilentLogging)
            goto LABEL_123;
          __CPLSessionOSLogDomain_14133();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = (id)objc_opt_class();
            objc_msgSend(v21, "scopedIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v159 = v34;
            v160 = 2112;
            v161 = v35;
            _os_log_impl(&dword_1B03C2000, v33, OS_LOG_TYPE_DEFAULT, "-- <%@ %@> is already missing in cache but forcing delete as it is unquarantining the record", buf, 0x16u);

          }
          goto LABEL_122;
        }
        if (!_CPLSilentLogging)
        {
          __CPLSessionOSLogDomain_14133();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          {
            v68 = (id)objc_opt_class();
            objc_msgSend(v21, "scopedIdentifier");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v159 = v68;
            v160 = 2112;
            v161 = v69;
            _os_log_impl(&dword_1B03C2000, v67, OS_LOG_TYPE_DEBUG, "-- <%@ %@> is already missing in cache. Ignoring delete", buf, 0x16u);

          }
        }
        v121[2]();
LABEL_123:

        _Block_object_dispose(&v165, 8);
        v19 = v120 + 1;
      }
      while (v120 + 1 != v119);
      v119 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
    }
    while (v119);
  }

  -[CPLEngineStore quarantinedRecords](v122->_store, "quarantinedRecords");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_56;
  v123[3] = &unk_1E60DB038;
  v123[4] = v122;
  v124 = v88;
  v125 = v118;
  v89 = v118;
  v90 = v88;
  objc_msgSend(v115, "enumerateKeysAndObjectsUsingBlock:", v123);
  v122->_diffHasBeenSuccessful = 1;

  return 1;
}

- (void)enumerateDiffWithBlock:(id)a3
{
  void (**v4)(id, id, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(id, id, void *, _BYTE *);
  uint64_t v16;
  void *v17;
  void *v18;
  CPLPushSessionTracker *v19;
  CPLChangeBatch *obj;
  unsigned __int8 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id, void *, _BYTE *))a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_diffedBatch;
  v5 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v19 = self;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
      v21 = 0;
      objc_msgSend(v9, "scopedIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_fullRecords, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      if ((objc_msgSend(v12, "hasChangeType:", 2) & 1) == 0)
      {
        objc_msgSend(v11, "relatedIdentifier");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "secondaryIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v13 | v14)
        {
          v15 = v4;
          v16 = v7;
          v17 = (void *)objc_msgSend(v12, "copy");

          objc_msgSend(v17, "setRelatedIdentifier:", v13);
          objc_msgSend(v17, "setSecondaryIdentifier:", v14);
          v12 = v17;
          v7 = v16;
          v4 = v15;
          self = v19;
        }

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_resourcesToUpload, "objectForKeyedSubscript:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v12, v18, &v21);

      LODWORD(v18) = v21;
      if ((_DWORD)v18)
        break;
      if (v6 == ++v8)
      {
        v6 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (NSArray)addedRecords
{
  return (NSArray *)self->_addedRecords;
}

- (NSArray)updatedRecords
{
  return (NSArray *)self->_updatedRecords;
}

- (NSArray)deletedRecordScopedIdentifiers
{
  return (NSArray *)self->_deletedRecordScopedIdentifiers;
}

- (id)deletedRecordIdentifiers
{
  void *v2;
  void *v3;

  -[CPLPushSessionTracker deletedRecordScopedIdentifiers](self, "deletedRecordScopedIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLScopedIdentifier unscopedIdentifiersFromArrayOfScopedIdentifiers:](CPLScopedIdentifier, "unscopedIdentifiersFromArrayOfScopedIdentifiers:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)resourcesToUpload
{
  return (NSDictionary *)self->_resourcesToUpload;
}

- (BOOL)notifyClientOfStatusChangesIfNecessaryWithError:(id *)a3
{
  if (-[CPLChangeBatch count](self->_diffedBatch, "count") || !self->_recordWithStatusChangesToNotify)
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "notifyClientOfStore:ofStatusChanges:error:", self->_store, self->_recordWithStatusChangesToNotify, a3);
}

- (BOOL)shouldCancelSyncSessionTryingToUploadChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "scopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray containsObject:](self->_changesWithResourceChanges, "containsObject:", v5)
    && objc_msgSend(v4, "supportsResources")
    && objc_msgSend(v4, "hasChangeType:", 8))
  {
    objc_msgSend(v4, "resources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CPLChangeBatch)incomingBatch
{
  return self->_incomingBatch;
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (CPLChangeBatch)expandedBatch
{
  return self->_expandedBatch;
}

- (NSSet)unquarantinedRecordScopedIdentifiers
{
  return &self->_unquarantinedRecordScopedIdentifiers->super;
}

- (CPLPushChangeTasks)pushChangeTasks
{
  return self->_pushChangeTasks;
}

- (CPLChangeBatch)diffedBatch
{
  return self->_diffedBatch;
}

- (NSDictionary)recordWithStatusChangesToNotify
{
  return &self->_recordWithStatusChangesToNotify->super;
}

- (NSArray)revertedChanges
{
  return self->_revertedChanges;
}

- (unint64_t)ignoredRecordCount
{
  return self->_ignoredRecordCount;
}

- (BOOL)diffedBatchCanLowerQuota
{
  return self->_diffedBatchCanLowerQuota;
}

- (NSDate)now
{
  return self->_now;
}

- (void)setNow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)expandHasBeenSuccessful
{
  return self->_expandHasBeenSuccessful;
}

- (BOOL)diffHasBeenSuccessful
{
  return self->_diffHasBeenSuccessful;
}

- (BOOL)applyHasBeenSuccessful
{
  return self->_applyHasBeenSuccessful;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_revertedChanges, 0);
  objc_storeStrong((id *)&self->_diffedBatch, 0);
  objc_storeStrong((id *)&self->_pushChangeTasks, 0);
  objc_storeStrong((id *)&self->_expandedBatch, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_incomingBatch, 0);
  objc_storeStrong((id *)&self->_invalidScopeIdentifiers, 0);
  objc_storeStrong((id *)&self->_validScopeIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordWithStatusChangesToNotify, 0);
  objc_storeStrong((id *)&self->_resourcesToUpload, 0);
  objc_storeStrong((id *)&self->_fullRecords, 0);
  objc_storeStrong((id *)&self->_changesWithResourceChanges, 0);
  objc_storeStrong((id *)&self->_deletedRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
  objc_storeStrong((id *)&self->_addedRecords, 0);
  objc_storeStrong((id *)&self->_storedCloudRecords, 0);
  objc_storeStrong((id *)&self->_storedClientRecords, 0);
  objc_storeStrong((id *)&self->_incomingBatchRecordPerScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_unquarantinedRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_idMapping, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

uint64_t __36__CPLPushSessionTracker_computeDiff__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "scopeWithIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "hasFinishedAFullSyncForScope:", v7) ^ 1;
    else
      v6 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v3);

  }
  return v6;
}

void __36__CPLPushSessionTracker_computeDiff__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scopeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CPLRecordPushContext newPushContextForChange:overStoredRecord:initialUpload:](CPLRecordPushContext, "newPushContextForChange:overStoredRecord:initialUpload:", v7, v6, (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v9));

  objc_msgSend(v7, "_setPushContext:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "addRecord:", v7);

}

void __36__CPLPushSessionTracker_computeDiff__block_invoke_41(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) && (objc_msgSend(v10, "hasChangeType:", 8) & 1) == 0)
  {
    v6 = *(void **)(a1[4] + 104);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = a1[4];
      v9 = *(void **)(v8 + 104);
      *(_QWORD *)(v8 + 104) = v7;

      v6 = *(void **)(a1[4] + 104);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, a1[5]);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __36__CPLPushSessionTracker_computeDiff__block_invoke_2_42(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    if (!*(_QWORD *)(a1[4] + 104))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v3 = a1[4];
      v4 = *(void **)(v3 + 104);
      *(_QWORD *)(v3 + 104) = v2;

    }
    v5 = (void *)objc_msgSend((id)objc_opt_class(), "newDeleteChangeWithScopedIdentifier:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 104), "setObject:forKeyedSubscript:", v5, a1[5]);

  }
  ++*(_QWORD *)(a1[4] + 192);
}

uint64_t __36__CPLPushSessionTracker_computeDiff__block_invoke_46(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a4, a5, a6, 1);
}

void __36__CPLPushSessionTracker_computeDiff__block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a3, "integerValue");
  if (v6 >= 1)
  {
    v7 = v6;
    if ((objc_msgSend(*(id *)(a1 + 32), "hasCloudRecordWithLocalScopedIdentifier:", v5) & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "transactionClientCacheView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countOfRecordsWithRelatedScopedIdentifier:class:", v5, objc_opt_class());

      if (v7 >= v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "storedClientRecordWithLocalScopedIdentifier:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:](CPLMasterChange, "newDeleteChangeWithScopedIdentifier:", v5);
          if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", v5) & 1) != 0
            || !objc_msgSend(*(id *)(a1 + 40), "isRecordWithScopedIdentifierQuarantined:", v5))
          {
            if (!_CPLSilentLogging)
            {
              __CPLSessionOSLogDomain_14133();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                v14 = 138412290;
                v15 = v5;
                _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Automatically deleting not yet uploaded master %@", (uint8_t *)&v14, 0xCu);
              }

            }
          }
          else
          {
            if (!_CPLSilentLogging)
            {
              __CPLSessionOSLogDomain_14133();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                v14 = 138412290;
                v15 = v5;
                _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Automatically deleting and unquarantining not yet uploaded master %@", (uint8_t *)&v14, 0xCu);
              }

            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v5);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v5);
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", v10, v5);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v5);

        }
      }
    }
  }

}

uint64_t __36__CPLPushSessionTracker_computeDiff__block_invoke_2_49(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteObjectsDifferOnProperty:", CFSTR("quarantine"));
}

uint64_t __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_20(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isMasterChange"))
  {
    if (objc_msgSend(v5, "hasChangeType:", 8))
      v7 = v5;
    else
      v7 = v6;
    v8 = v7;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "expungeableResourceStates", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v8, "resourceForType:", objc_msgSend(v14, "resourceType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            if (!_CPLSilentLogging)
            {
              __CPLSessionOSLogDomain_14133();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                v18 = a1[4];
                *(_DWORD *)buf = 138412546;
                v25 = v14;
                v26 = 2112;
                v27 = v18;
                _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Client pushed a record with a expungeable resource type that doesn't exist as a resource on this record %@: %@", buf, 0x16u);
              }

            }
            objc_msgSend(*(id *)(a1[5] + 168), "addTask:forRecordWithScopedIdentifier:", 8, a1[6]);
            v16 = 0;
            goto LABEL_20;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_20:

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

void __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  objc_msgSend(a3, "scopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:](CPLContainerRelationChange, "newDeleteChangeWithScopedIdentifier:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addRecord:", v5);
}

void __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_23()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  computeExpandedBatchWithError__alwaysAskForDerivatives = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPLAlwaysAskForDerivatives"));

}

void __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  computeExpandedBatchWithError__simulateResourceCopyFailure = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPLSimulateResourceCopyFailure"));

}

+ (BOOL)notifyClientOfStore:(id)a3 ofStatusChanges:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v7 = a3;
  v8 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v7, "statusCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__14246;
    v21 = __Block_byref_object_dispose__14247;
    v22 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__CPLPushSessionTracker_notifyClientOfStore_ofStatusChanges_error___block_invoke;
    v13[3] = &unk_1E60DB060;
    v15 = &v23;
    v10 = v9;
    v14 = v10;
    v16 = &v17;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);
    if (a5 && !*((_BYTE *)v24 + 24))
      *a5 = objc_retainAutorelease((id)v18[5]);

    _Block_object_dispose(&v17, 8);
  }
  v11 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __67__CPLPushSessionTracker_notifyClientOfStore_ofStatusChanges_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char v7;
  id v8;
  id v9;
  id v10;

  v6 = (void *)a1[4];
  v10 = 0;
  v7 = objc_msgSend(v6, "notifyStatusForRecordHasChanged:persist:error:", a3, 1, &v10);
  v8 = v10;
  v9 = v10;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v7;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v8);
  }

}

@end
