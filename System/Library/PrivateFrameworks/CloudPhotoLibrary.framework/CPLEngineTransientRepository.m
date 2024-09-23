@implementation CPLEngineTransientRepository

- (CPLEngineTransientRepository)initWithEngineStore:(id)a3 name:(id)a4
{
  CPLEngineTransientRepository *v4;
  CPLEngineTransientRepository *v5;
  NSMutableArray *v6;
  NSMutableArray *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLEngineTransientRepository;
  v4 = -[CPLEngineStorage initWithEngineStore:name:](&v9, sel_initWithEngineStore_name_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_maximumCountOfRecordsInBatches = 100;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v5->_observers;
    v5->_observers = v6;

  }
  return v5;
}

- (void)setMaximumCountOfRecordsInBatches:(unint64_t)a3
{
  unint64_t v3;

  v3 = 100;
  if (a3)
    v3 = a3;
  self->_maximumCountOfRecordsInBatches = v3;
}

- (unint64_t)scopeType
{
  return 1;
}

- (BOOL)hasUnmingledChanges
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasUnmingledChanges");

  return v3;
}

- (BOOL)hasUnmingledChangesForScope:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasUnmingledChangesForScope:", v4);

  return v6;
}

- (id)batchStorageForScope:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CPLSharedBatchStorage *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CPLSharedRecordMerger *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CPLSharedRecordMerger *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "scopeType");
  if ((unint64_t)(v5 - 4) >= 2)
  {
    if (v5 != 1)
    {
LABEL_19:
      v11 = -[CPLEngineTransientRepositoryBatchStorage initWithTransientRepository:scope:]([CPLEngineTransientRepositoryBatchStorage alloc], "initWithTransientRepository:scope:", self, v4);
      goto LABEL_20;
    }
    -[CPLEngineStorage engineStore](self, "engineStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharingScopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "scopes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sharingScopeForScope:", v4);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v8, "flagsForScope:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "valueForFlag:", 52)
          || (objc_msgSend(v14, "valueForFlag:", 64) & 1) != 0)
        {
          v15 = [CPLSharedRecordMerger alloc];
          -[CPLEngineStorage engineStore](self, "engineStore");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "engineLibrary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "transport");
          v23 = v14;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "propertyMapping");
          v24 = v8;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[CPLSharedRecordMerger initWithMapping:](v15, "initWithMapping:", v19);

          v11 = -[CPLSharedBatchStorage initWithTransientRepository:scope:sharedScope:merger:]([CPLSharedBatchStorage alloc], "initWithTransientRepository:scope:sharedScope:merger:", self, v4, v13, v20);
          goto LABEL_11;
        }
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_8093();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v26 = v13;
            v27 = 2112;
            v28 = v14;
            v29 = 2112;
            v30 = v4;
            _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring %@ (%@) for %@", buf, 0x20u);
          }

        }
      }
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharingScopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_18;
  objc_msgSend(v6, "scopes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scopeForSharingScope:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_17:

    goto LABEL_18;
  }
  v10 = (void *)v9;
  v11 = -[CPLInvalidBatchStorage initWithTransientRepository:scope:]([CPLInvalidBatchStorage alloc], "initWithTransientRepository:scope:", self, v4);

LABEL_11:
LABEL_20:

  return v11;
}

- (id)cachedRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordWithScopedIdentifier:isFinal:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldKeepDeleteChange:(id)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  char v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26 = 0;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v7, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "quarantinedRecords");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isRecordWithScopedIdentifierQuarantined:", v10);

    if (v13)
    {
      if (_CPLSilentLogging)
      {
        v15 = 1;
        goto LABEL_19;
      }
      __CPLStorageOSLogDomain_8093();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v6;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "%@ is a delete for a quarantined record. Keeping.", buf, 0xCu);
      }
      goto LABEL_6;
    }
  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cloudCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "targetForRecordWithCloudScopedIdentifier:", v7);
  v14 = objc_claimAutoreleasedReturnValue();

  -[NSObject otherScopedIdentifier](v14, "otherScopedIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_13;
  v19 = (void *)v18;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ignoredRecords");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject otherScopedIdentifier](v14, "otherScopedIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "hasRecordWithScopedIdentifier:", v22);

  if (!v23)
  {
LABEL_13:
    if (_CPLSilentLogging)
    {
      v15 = 0;
      goto LABEL_18;
    }
    __CPLStorageOSLogDomain_8093();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEBUG, "%@ is a delete for a record we don't know or has already been deleted. Ignoring.", buf, 0xCu);
    }
    v15 = 0;
    goto LABEL_17;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_8093();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEBUG, "%@ is a delete of a record shadowing an other record", buf, 0xCu);
    }
    v15 = 1;
LABEL_17:

    goto LABEL_18;
  }
LABEL_6:
  v15 = 1;
LABEL_18:

LABEL_19:
  return v15;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v10;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  return (char)a6;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasRecordWithScopedIdentifier:", v4);

  return v6;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordWithScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasStashedRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasStashedRecordWithScopedIdentifier:", v4);

  return v6;
}

- (id)_sharedDeleteFromDelete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  _BOOL4 v19;

  v4 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetForRecordWithSharedCloudScopedIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scopedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineTransientRepository cachedRecordWithScopedIdentifier:](self, "cachedRecordWithScopedIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "relatedScopedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "targetForRecordWithCloudScopedIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "otherScopedIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    goto LABEL_8;
  }
  -[CPLEngineTransientRepository changeWithScopedIdentifier:](self, "changeWithScopedIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "changeType") == 1024)
  {

    goto LABEL_15;
  }
  if (!v10)
  {
LABEL_15:
    objc_msgSend(v8, "scopedIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CPLEngineTransientRepository shouldKeepDeleteChange:forRecordWithScopedIdentifier:](self, "shouldKeepDeleteChange:forRecordWithScopedIdentifier:", v4, v18);

    if (v19)
    {
      v17 = v4;
      v10 = 0;
      v14 = 0;
    }
    else
    {
      v10 = 0;
      v14 = 0;
      v17 = 0;
    }
    goto LABEL_18;
  }
  objc_msgSend(v10, "relatedIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v15 = objc_opt_class();
  if (v15 == objc_opt_class())
    v16 = (id)objc_msgSend((id)objc_opt_class(), "newDeleteChangeWithScopedIdentifier:", v7);
  else
    v16 = v4;
  v17 = v16;
  if (v14)
    objc_msgSend(v16, "setRelatedIdentifier:", v14);
LABEL_18:

  return v17;
}

- (BOOL)_appendBatchToStorage:(id)a3 alreadyMingled:(BOOL)a4 countOfAssetChanges:(unint64_t *)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  char v37;
  void *v38;
  CPLChangeBatch *v39;
  NSObject *v41;
  void *v42;
  void *v43;
  SEL v44;
  _BOOL4 v46;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  CPLChangeBatch *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  CPLEngineTransientRepository *v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v46 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v52 = objc_alloc_init(CPLChangeBatch);
  v56 = self;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remappedRecords");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sharingScopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v9;
  objc_msgSend(v9, "ignoredRecords");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v8;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v54)
  {
    v44 = a2;
    v11 = 0;
    v55 = 0;
    v53 = *(_QWORD *)v60;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v53)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x1B5E08BF0]();
      objc_msgSend(v13, "scopedIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scopeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineStorage mainScopeIdentifier](v56, "mainScopeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if ((v18 & 1) == 0 && v10)
      {
        objc_msgSend(v15, "scopeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v19, "isEqualToString:", v10);

      }
      if (!objc_msgSend(v13, "isDelete"))
      {
        v23 = v13;
        objc_opt_class();
        v55 += objc_opt_isKindOfClass() & 1;
        if (v18)
          goto LABEL_30;
        goto LABEL_31;
      }
      if (v10)
      {
        objc_msgSend(v15, "scopeIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v10);

        if (v21)
        {
          -[CPLEngineTransientRepository _sharedDeleteFromDelete:](v56, "_sharedDeleteFromDelete:", v13);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
      }
      if (!v15)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_8093();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v64 = 0;
            _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_ERROR, "Got a delete change with no identifier: %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepository.m");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v44, v56, v43, 378, CFSTR("Got a delete change with no identifier: %@"), 0);

        abort();
      }
      -[CPLEngineTransientRepository cachedRecordWithScopedIdentifier:](v56, "cachedRecordWithScopedIdentifier:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        break;
      -[CPLEngineTransientRepository changeWithScopedIdentifier:](v56, "changeWithScopedIdentifier:", v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v24 = v27;
        if (objc_msgSend(v27, "changeType") != 1024)
          break;

      }
      if (-[CPLEngineTransientRepository shouldKeepDeleteChange:forRecordWithScopedIdentifier:](v56, "shouldKeepDeleteChange:forRecordWithScopedIdentifier:", v13, v15))
      {
        v22 = v13;
LABEL_24:
        v23 = v22;
        if (v18)
          goto LABEL_30;
        goto LABEL_31;
      }
      v23 = 0;
      if (v18)
        goto LABEL_30;
LABEL_31:
      if ((objc_msgSend(v23, "isDelete") & 1) != 0 || objc_msgSend(v23, "hasChangeType:", 2))
      {
        objc_msgSend(v23, "realIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          objc_msgSend(v23, "scopedIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v33, "copy");
          v57 = v11;
          v35 = objc_msgSend(v49, "removeRemappedRecordWithScopedIdentifier:error:", v34, &v57);
          v31 = v57;

          v11 = v31;
          if (!v35)
          {
LABEL_43:

            objc_autoreleasePoolPop(v14);
            if (a6)
            {
              v11 = objc_retainAutorelease(v31);
              v37 = 0;
              *a6 = v11;
            }
            else
            {
              v37 = 0;
              v11 = v31;
            }
            v39 = v52;
            goto LABEL_51;
          }
        }
      }
      if (v23)
        -[CPLChangeBatch addRecord:](v52, "addRecord:", v23);

      objc_autoreleasePoolPop(v14);
      if (v54 == ++v12)
      {
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        v54 = v36;
        if (v36)
          goto LABEL_3;
        goto LABEL_46;
      }
    }
    v25 = objc_opt_class();
    if (v25 == objc_opt_class())
      v26 = (id)objc_msgSend((id)objc_opt_class(), "newDeleteChangeWithScopedIdentifier:", v15);
    else
      v26 = v13;
    v23 = v26;
    objc_msgSend(v24, "relatedIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v23, "setRelatedIdentifier:", v28);

    if (v18)
    {
LABEL_30:
      objc_msgSend(v13, "scopedIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v11;
      v30 = objc_msgSend(v50, "removeRecordWithScopedIdentifier:error:", v29, &v58);
      v31 = v58;

      v11 = v31;
      if (!v30)
        goto LABEL_43;
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  v11 = 0;
  v55 = 0;
LABEL_46:

  if (a5)
    *a5 = v55;
  -[CPLEngineStorage platformObject](v56, "platformObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v52;
  v37 = objc_msgSend(v38, "appendBatch:alreadyMingled:error:", v52, v46, a6);

LABEL_51:
  return v37;
}

- (BOOL)appendBatch:(id)a3 alreadyMingled:(BOOL)a4 countOfAssetChanges:(unint64_t *)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v8 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_8093();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134217984;
      v15 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEBUG, "Adding %lu records in disk storage", (uint8_t *)&v14, 0xCu);
    }

  }
  if (a5)
    *a5 = 0;
  v12 = -[CPLEngineTransientRepository _appendBatchToStorage:alreadyMingled:countOfAssetChanges:error:](self, "_appendBatchToStorage:alreadyMingled:countOfAssetChanges:error:", v10, v8, a5, a6);

  return v12;
}

- (id)nextBatchOfRemappedRecordsInScope:(id)a3 maximumCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextBatchOfRemappedRecordsInScope:maximumCount:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)popChangeBatchOfRemappedRecords:(id *)a3 scope:(id)a4 maximumCount:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;

  v10 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "popChangeBatchOfRemappedRecords:scope:maximumCount:error:", a3, v10, a5, a6);

  return (char)a6;
}

- (id)unmingledChangeWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unmingledChangeWithScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allUnmingledChangesWithClass:scopeIdentifier:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allUnmingledNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allUnmingledNonDeletedChangesWithClass:scopeIdentifier:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allUnmingledDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allUnmingledDeletedChangesWithClass:scopeIdentifier:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allUnmingledChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allUnmingledChangesWithClass:relatedScopedIdentifier:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allUnmingledChangesWithScopeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allUnmingledChangesWithScopeIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)markUnmingledChangeWithScopedIdentifierAsMingled:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "markUnmingledChangeWithScopedIdentifierAsMingled:error:", v6, a4);

  return (char)a4;
}

- (BOOL)hasMingledRecordsForScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMingledRecordsForScopeWithIdentifier:", v4);

  return v6;
}

- (BOOL)hasUnmingledNonStashedRecordsForScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasUnmingledNonStashedRecordsForScopeWithIdentifier:", v4);

  return v6;
}

- (BOOL)hasOnlyMingledRecordsWithScopeIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasOnlyMingledRecordsWithScopeIdentifier:", v4);

  return v6;
}

- (BOOL)resetMingledRecordsWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  NSMutableArray *observers;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "resetMingledRecordsWithScopeFilter:error:", v6, a4);

  if (v8)
  {
    observers = self->_observers;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__CPLEngineTransientRepository_resetMingledRecordsWithScopeFilter_error___block_invoke;
    v11[3] = &unk_1E60D95F0;
    v11[4] = self;
    v12 = v6;
    -[NSMutableArray enumerateObjectsUsingBlock:](observers, "enumerateObjectsUsingBlock:", v11);

  }
  return v8;
}

- (BOOL)deleteMingledRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint8_t v11[16];

  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_8093();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Deleting mingled records", v11, 2u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deleteMingledRecordsForScopeWithIdentifier:error:", v6, a4);

  return v9;
}

- (unint64_t)countOfUnmingledRecords
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfUnmingledRecords");

  return v3;
}

- (BOOL)resetTransientRepositoryForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint8_t v11[16];

  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_8093();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Deleting all transient changes in storage", v11, 2u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deleteAllRecordsForScopeWithIdentifier:error:", v6, a4);

  return v9;
}

- (BOOL)hasUnmingledOrStashedRecordsWithScopeFilter:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasUnmingledOrStashedRecordsWithScopeFilter:", v4);

  return v6;
}

- (BOOL)stashChangeWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "stashChangeWithScopedIdentifier:error:", v6, a4);

  return (char)a4;
}

- (BOOL)unstashRecordsForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6
{
  id v10;
  void *v11;

  v10 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "unstashRecordsForScopeWithIdentifier:maxCount:hasMore:error:", v10, a4, a5, a6);

  return (char)a6;
}

- (BOOL)hasStashedChangesForScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasStashedChangesForScopeWithIdentifier:", v4);

  return v6;
}

- (void)addObserver:(id)a3
{
  -[NSMutableArray addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)openWithError:(id *)a3
{
  _BOOL4 v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineTransientRepository;
  v4 = -[CPLEngineStorage openWithError:](&v9, sel_openWithError_, a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerForKey:", CFSTR("CPLMaximumSizeForPulledBatches"));

    if (v6 >= 1)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_8093();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v11 = v6;
          _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Will give batches with a maximum size of %lu", buf, 0xCu);
        }

      }
      self->_maximumCountOfRecordsInBatches = v6;
    }
  }
  return v4;
}

- (id)status
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLEngineTransientRepository;
  -[CPLEngineStorage status](&v6, sel_status);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[NSMutableArray count](self->_observers, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR("\n%lu observers"), -[NSMutableArray count](self->_observers, "count"));
  return v4;
}

- (unint64_t)maximumCountOfRecordsInBatches
{
  return self->_maximumCountOfRecordsInBatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

uint64_t __73__CPLEngineTransientRepository_resetMingledRecordsWithScopeFilter_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "transientRepository:didResetMingledRecordsForScopesWithFiler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)orderedClassesForDelete
{
  if (orderedClassesForDelete_onceToken != -1)
    dispatch_once(&orderedClassesForDelete_onceToken, &__block_literal_global_8139);
  return (id)orderedClassesForDelete_orderedClasses;
}

+ (id)orderedClassesForChanges
{
  if (orderedClassesForChanges_onceToken != -1)
    dispatch_once(&orderedClassesForChanges_onceToken, &__block_literal_global_13);
  return (id)orderedClassesForChanges_orderedClasses;
}

+ (id)orderedClassesForChangesForLargeSync
{
  if (orderedClassesForChangesForLargeSync_onceToken != -1)
    dispatch_once(&orderedClassesForChangesForLargeSync_onceToken, &__block_literal_global_14_8127);
  return (id)orderedClassesForChangesForLargeSync_orderedClasses;
}

void __68__CPLEngineTransientRepository_orderedClassesForChangesForLargeSync__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];

  v2[12] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)orderedClassesForChangesForLargeSync_orderedClasses;
  orderedClassesForChangesForLargeSync_orderedClasses = v0;

}

void __56__CPLEngineTransientRepository_orderedClassesForChanges__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];

  v2[12] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)orderedClassesForChanges_orderedClasses;
  orderedClassesForChanges_orderedClasses = v0;

}

void __55__CPLEngineTransientRepository_orderedClassesForDelete__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];

  v2[12] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)orderedClassesForDelete_orderedClasses;
  orderedClassesForDelete_orderedClasses = v0;

}

@end
