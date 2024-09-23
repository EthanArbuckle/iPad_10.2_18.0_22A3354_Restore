@implementation CPLEngineRemappedRecords

- (unint64_t)scopeType
{
  return 2;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v10;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  return (char)a6;
}

- (BOOL)addRemappedRecordWithScopedIdentifier:(id)a3 realScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v10, "addRemappedRecordWithScopedIdentifier:realScopedIdentifier:error:", v8, v9, &v15);
  v12 = v15;

  if ((v11 & 1) != 0)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_perTransactionRemappedScopedIdentifiers, "removeObjectForKey:", v8);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_9704();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v17 = v8;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Failed to remapped record %@ -> %@: %@ - ignoring", buf, 0x20u);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v11;
}

- (BOOL)removeRemappedRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  NSMutableDictionary *perTransactionRemappedScopedIdentifiers;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v7, "removeRemappedRecordWithScopedIdentifier:error:", v6, &v13);
  v9 = v13;

  if ((v8 & 1) != 0)
  {
    perTransactionRemappedScopedIdentifiers = self->_perTransactionRemappedScopedIdentifiers;
    self->_perTransactionRemappedScopedIdentifiers = 0;

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_9704();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Failed to discard remapped record %@: %@ - ignoring", buf, 0x16u);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (id)_fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers:(id)a3 fallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v12 = v7;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v29 = 0;
        objc_msgSend(v9, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v16, &v29);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v12 = v16;

          v19 = (void *)objc_msgSend(v12, "copy");
          -[CPLEngineStorage engineStore](self, "engineStore");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = MEMORY[0x1E0C809B0];
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke;
          v27[3] = &unk_1E60DD810;
          v27[4] = self;
          v28 = v19;
          v25[0] = v21;
          v25[1] = 3221225472;
          v25[2] = __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke_3;
          v25[3] = &unk_1E60DD838;
          v26 = v28;
          v22 = v28;
          v23 = (id)objc_msgSend(v20, "performWriteTransactionWithBlock:completionHandler:", v27, v25);

          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v13)
        continue;
      break;
    }
    v12 = v7;
  }
LABEL_11:

  return v12;
}

- (id)realScopedIdentifierForRemappedScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *perTransactionRemappedScopedIdentifiers;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_perTransactionRemappedScopedIdentifiers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = v4;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CPLEngineStorage platformObject](self, "platformObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v10 = v9;
    if ((objc_msgSend(v7, "containsObject:", v9) & 1) != 0)
    {
LABEL_7:
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_9704();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v7;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Infinite remaps: %@", buf, 0xCu);
        }

      }
      -[CPLEngineRemappedRecords _fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers:fallback:](self, "_fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers:fallback:", v7, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = v9;
      while (1)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perTransactionRemappedScopedIdentifiers, "objectForKeyedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(v8, "realScopedIdentifierForRemappedScopedIdentifier:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
            break;
        }
        objc_msgSend(v7, "addObject:", v5);
        v10 = v11;

        v5 = v10;
        if ((objc_msgSend(v7, "containsObject:", v10) & 1) != 0)
          goto LABEL_7;
      }
      v10 = v5;
    }
    if (!self->_perTransactionRemappedScopedIdentifiers)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      perTransactionRemappedScopedIdentifiers = self->_perTransactionRemappedScopedIdentifiers;
      self->_perTransactionRemappedScopedIdentifiers = v13;

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_perTransactionRemappedScopedIdentifiers, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v17);
    }

  }
  return v5;
}

- (id)scopedIdentifiersRemappedToScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopedIdentifiersRemappedToScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isRecordWithScopedIdentifierRemapped:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRecordWithScopedIdentifierRemapped:", v4);

  return v6;
}

- (void)writeTransactionDidFail
{
  NSMutableDictionary *perTransactionRemappedScopedIdentifiers;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPLEngineRemappedRecords;
  -[CPLEngineStorage writeTransactionDidFail](&v4, sel_writeTransactionDidFail);
  perTransactionRemappedScopedIdentifiers = self->_perTransactionRemappedScopedIdentifiers;
  self->_perTransactionRemappedScopedIdentifiers = 0;

}

- (void)writeTransactionDidSucceed
{
  NSMutableDictionary *perTransactionRemappedScopedIdentifiers;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPLEngineRemappedRecords;
  -[CPLEngineStorage writeTransactionDidSucceed](&v4, sel_writeTransactionDidSucceed);
  perTransactionRemappedScopedIdentifiers = self->_perTransactionRemappedScopedIdentifiers;
  self->_perTransactionRemappedScopedIdentifiers = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perTransactionRemappedScopedIdentifiers, 0);
}

void __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke_2;
  v4[3] = &unk_1E60DDA30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "do:", v4);

}

void __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_9704();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Failed to fixup infinite loop for remapped identifiers related to %@: %@", (uint8_t *)&v8, 0x16u);

    }
  }

}

uint64_t __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "removeRemappedRecordWithScopedIdentifier:error:", *(_QWORD *)(a1 + 40), a2);

  return v5;
}

@end
