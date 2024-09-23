@implementation CPLEngineCloudCache

- (unint64_t)scopeType
{
  return 2;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v11;
  int v12;
  char v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  id v20;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  if (!v12)
    return 0;
  if (*a5)
    return 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v15 = objc_msgSend(v14, "popCloudScopedIdentifiersToCheck:otherScopeIndex:maxCount:deletedCount:error:", &v20, a3, a4, a5, a6);
  v16 = v20;

  if (v15)
  {
    if (objc_msgSend(v16, "count"))
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pendingRecordChecks");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v18, "enqueueCloudScopedIdentifiersToCheck:error:", v16, a6);
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_invalidCloudCacheErrorWithInvalidRecord:(id)a3 method:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = objc_opt_class();

  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("Trying to %@ an invalid %@"), v6, v9);
  +[CPLErrors invalidCloudCacheErrorWithReason:](CPLErrors, "invalidCloudCacheErrorWithReason:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)addRecord:(id)a3 isFinal:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Adding %@", (uint8_t *)&v17, 0xCu);
    }

  }
  if ((objc_msgSend(v9, "isFullRecord") & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Storing a non full record: %@", (uint8_t *)&v17, 0xCu);
    }

  }
  if (objc_msgSend(v9, "validateFullRecord"))
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addRecord:isFinal:error:", v9, v6, a5);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_15506();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "%@: invalid record %@", (uint8_t *)&v17, 0x16u);

      }
    }
    if (a5)
    {
      -[CPLEngineCloudCache _invalidCloudCacheErrorWithInvalidRecord:method:](self, "_invalidCloudCacheErrorWithInvalidRecord:method:", v9, CFSTR("add"));
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (BOOL)updateFinalRecord:(id)a3 confirmed:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Updating %@", (uint8_t *)&v17, 0xCu);
    }

  }
  if ((objc_msgSend(v9, "isFullRecord") & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Updating a non full record: %@", (uint8_t *)&v17, 0xCu);
    }

  }
  if (objc_msgSend(v9, "validateFullRecord"))
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "updateFinalRecord:confirmed:error:", v9, v6, a5);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_15506();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "%@: invalid record %@", (uint8_t *)&v17, 0x16u);

      }
    }
    if (a5)
    {
      -[CPLEngineCloudCache _invalidCloudCacheErrorWithInvalidRecord:method:](self, "_invalidCloudCacheErrorWithInvalidRecord:method:", v9, CFSTR("update final"));
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (BOOL)updateStagedRecord:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Updating %@", (uint8_t *)&v15, 0xCu);
    }

  }
  if ((objc_msgSend(v7, "isFullRecord") & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Updating a non full record: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  if (objc_msgSend(v7, "validateFullRecord"))
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "updateStagedRecord:error:", v7, a4);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_15506();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "%@: invalid record %@", (uint8_t *)&v15, 0x16u);

      }
    }
    if (a4)
    {
      -[CPLEngineCloudCache _invalidCloudCacheErrorWithInvalidRecord:method:](self, "_invalidCloudCacheErrorWithInvalidRecord:method:", v7, CFSTR("update staged"));
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)applyBatch:(id)a3 isFinal:(BOOL)a4 direction:(unint64_t)a5 withError:(id *)a6
{
  _BOOL8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  id *v37;
  _BOOL4 v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  char v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  BOOL v46;
  void *v47;
  id *v48;
  NSObject *v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  char v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  NSObject *v63;
  char v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  id v78;
  uint64_t v79;

  v7 = a4;
  v79 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v8;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Applying %@", buf, 0xCu);
    }

  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quarantinedRecords");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "idMapping");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushRepository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v10;
  objc_msgSend(v10, "scopes");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v12;
  v13 = objc_msgSend(v12, "isEmpty");
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v14 = v8;
  v61 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v61)
  {
    v51 = a6;
    v15 = 0;
    v60 = *(_QWORD *)v73;
    v16 = !v7;
    if (a5 != 2)
      v16 = 1;
    v58 = v16 | v13;
    v55 = v11;
    obj = v14;
    while (1)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v73 != v60)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v17);
        objc_msgSend(v18, "scopedIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "changeType");
        -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self, "recordWithScopedIdentifier:isFinal:", v19, v7);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20 != 1024)
        {
          if (!v21)
          {
            if (v20)
            {
              v48 = v51;
              v47 = v52;
              v14 = obj;
              if (!_CPLSilentLogging)
              {
                __CPLStorageOSLogDomain_15506();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v18;
                  _os_log_impl(&dword_1B03C2000, v50, OS_LOG_TYPE_ERROR, "%@ is a new record but is not a full record", buf, 0xCu);
                }

              }
              +[CPLErrors invalidCloudCacheErrorWithReason:](CPLErrors, "invalidCloudCacheErrorWithReason:", CFSTR("new record but not full record"));
              v22 = v15;
              v15 = objc_claimAutoreleasedReturnValue();
              goto LABEL_67;
            }
            v69 = v15;
            v23 = -[CPLEngineCloudCache addRecord:isFinal:error:](self, "addRecord:isFinal:error:", v18, v7, &v69);
            v36 = v69;

            v15 = v36;
LABEL_39:
            if (!v23)
              goto LABEL_52;
            goto LABEL_48;
          }
          v68 = 0;
          -[NSObject realRecordChangeFromRecordChange:direction:newRecord:](v21, "realRecordChangeFromRecordChange:direction:newRecord:", v18, a5, &v68);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v68;
          if (v25)
          {
            objc_msgSend(v18, "recordChangeData");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setRecordChangeData:", v27);

            objc_msgSend(v18, "sharingRecordChangeData");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setSharingRecordChangeData:", v28);

            objc_msgSend(v26, "setServerRecordIsCorrupted:", objc_msgSend(v18, "serverRecordIsCorrupted"));
            objc_msgSend(v18, "recordModificationDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v18, "recordModificationDate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setRecordModificationDate:", v30);

            }
            if (v7)
            {
              if (objc_msgSend(v18, "supportsResources")
                && objc_msgSend(v18, "hasChangeType:", 8))
              {
                objc_msgSend(v18, "resources");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "count") == 0;

              }
              else
              {
                v32 = 1;
              }
              v67 = v15;
              v37 = (id *)&v67;
              v38 = -[CPLEngineCloudCache updateFinalRecord:confirmed:error:](self, "updateFinalRecord:confirmed:error:", v26, v32, &v67);
            }
            else
            {
              v66 = v15;
              v37 = (id *)&v66;
              v38 = -[CPLEngineCloudCache updateStagedRecord:error:](self, "updateStagedRecord:error:", v26, &v66);
            }
LABEL_46:
            v23 = v38;
            v39 = *v37;

            v15 = v39;
            v11 = v55;
          }
          else
          {
            if (v7)
            {
              v65 = v15;
              v37 = (id *)&v65;
              v38 = -[CPLEngineCloudCache ackownledgeRecordWithScopedIdentifier:error:](self, "ackownledgeRecordWithScopedIdentifier:error:", v19, &v65);
              goto LABEL_46;
            }
            v23 = 1;
          }

          if (!v23)
            goto LABEL_52;
          goto LABEL_48;
        }
        if (v21)
        {
          v71 = v15;
          v23 = -[CPLEngineCloudCache deleteRecordWithScopedIdentifier:isFinal:error:](self, "deleteRecordWithScopedIdentifier:isFinal:error:", v19, v7, &v71);
          v24 = v15;
          v15 = v71;
        }
        else
        {
          if (_CPLSilentLogging)
          {
            v23 = 1;
            goto LABEL_28;
          }
          __CPLStorageOSLogDomain_15506();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v18;
            _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEBUG, "Ignoring %@ as it is already known", buf, 0xCu);
          }
          v23 = 1;
        }

LABEL_28:
        if ((v58 & 1) != 0)
          goto LABEL_39;
        buf[0] = 0;
        objc_msgSend(v11, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v19, buf);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33)
          v33 = (void *)objc_msgSend(v19, "copy");
        if (!objc_msgSend(v33, "scopeIndex"))
        {
          objc_msgSend(v33, "scopeIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setScopeIndex:", objc_msgSend(v53, "indexForLocalScopeIdentifier:", v34));

        }
        if (objc_msgSend(v33, "scopeIndex") != 0x7FFFFFFFFFFFFFFFLL)
        {
          v70 = v15;
          v23 = objc_msgSend(v54, "discardChangeWithScopedIdentifier:error:", v33, &v70);
          v35 = v70;

          v15 = v35;
        }

        if (!v23)
        {
LABEL_52:
          if (!v23)
            goto LABEL_66;
          goto LABEL_58;
        }
LABEL_48:
        if (!v7)
          goto LABEL_52;
        v64 = 0;
        objc_msgSend(v11, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v19, &v64);
        v40 = objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          v41 = (void *)v40;
          v63 = v15;
          v42 = objc_msgSend(v57, "removeQuarantinedRecordWithScopedIdentifier:notify:error:", v40, 1, &v63);
          v43 = v63;

          v15 = v43;
          if ((v42 & 1) == 0)
          {
            v15 = v43;
LABEL_66:
            v48 = v51;
            v47 = v52;
            v14 = obj;
LABEL_67:

            if (v48)
            {
              v15 = objc_retainAutorelease(v15);
              v46 = 0;
              *v48 = v15;
            }
            else
            {
              v46 = 0;
            }
            goto LABEL_70;
          }
        }
        else if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_15506();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v18;
            _os_log_impl(&dword_1B03C2000, v44, OS_LOG_TYPE_ERROR, "Failed to find local scoped identifier for %@ in ID mapping to unquarantine", buf, 0xCu);
          }

        }
LABEL_58:

        ++v17;
      }
      while (v61 != v17);
      v14 = obj;
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      v61 = v45;
      if (!v45)
        goto LABEL_65;
    }
  }
  v15 = 0;
LABEL_65:

  v46 = 1;
  v47 = v52;
LABEL_70:

  return v46;
}

- (id)cloudChangeBatchFromBatch:(id)a3 usingMapping:(id)a4 isFinal:(BOOL)a5 withError:(id *)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  const char *v15;
  uint64_t i;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  char v22;
  void *v23;
  char v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  uint64_t (*v28)(void);
  int v29;
  char v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  BOOL v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  CPLRecordChangeDiffTracker *v40;
  id v41;
  void *v42;
  BOOL v43;
  id v44;
  void *v45;
  NSObject *v46;
  int v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  char v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  char v56;
  NSObject *v57;
  char v58;
  char v59;
  char v60;
  id v61;
  void *v62;
  int v63;
  void *v64;
  NSObject *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  id v71;
  NSObject *v72;
  void *v73;
  char v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  char v78;
  NSObject *v79;
  id v80;
  void *v81;
  void *v82;
  _BOOL8 v83;
  NSObject *v84;
  char *v85;
  NSObject *v86;
  id v87;
  id v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  int v94;
  id v95;
  NSObject *v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  char v108;
  _BOOL4 v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  char v114;
  _BOOL4 v115;
  void *v116;
  id v117;
  uint64_t (**v118)(_QWORD, _QWORD);
  void *v119;
  BOOL v120;
  int v121;
  int v122;
  char v123;
  void *v124;
  BOOL v125;
  void *v126;
  NSObject *v127;
  NSObject *v128;
  NSObject *v129;
  void *v130;
  void *v131;
  void *v132;
  NSObject *v133;
  id v134;
  void *v136;
  NSObject *v137;
  void *v138;
  void *v139;
  uint64_t v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  const char *v146;
  void *v147;
  id v148;
  void *v149;
  CPLRecordChangeDiffTracker *v150;
  void *v151;
  _BOOL4 v152;
  void *v153;
  id v155;
  CPLEngineCloudCache *v156;
  id obj;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  int v161;
  _QWORD *v162;
  void *v163;
  NSObject *v164;
  NSObject *v165;
  NSObject *v166;
  id v167;
  void *v168;
  _QWORD v169[4];
  id v170;
  void *v171;
  id v172;
  uint64_t *v173;
  char v174;
  id v175;
  id v176;
  id v177;
  char v178;
  char v179;
  id v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _QWORD v185[4];
  id v186;
  uint64_t *v187;
  _QWORD *v188;
  _QWORD *v189;
  _QWORD v190[3];
  char v191;
  _QWORD v192[3];
  char v193;
  uint64_t v194;
  id *v195;
  uint64_t v196;
  uint64_t (*v197)(uint64_t, uint64_t);
  void (*v198)(uint64_t);
  id v199;
  uint64_t v200;
  uint64_t *v201;
  uint64_t v202;
  uint64_t (*v203)(uint64_t, uint64_t);
  void (*v204)(uint64_t);
  CPLChangeBatch *v205;
  uint8_t buf[4];
  const char *v207;
  __int16 v208;
  NSObject *v209;
  __int16 v210;
  CPLRecordChangeDiffTracker *v211;
  __int16 v212;
  id v213;
  __int16 v214;
  id v215;
  _BYTE v216[128];
  uint64_t v217;

  v152 = a5;
  v217 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v167 = a4;
  v156 = self;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1;
  if (!v167)
    v9 = 2;
  v141 = v9;
  objc_msgSend(v151, "scopes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "statusCenter");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = 0;
  v201 = &v200;
  v202 = 0x3032000000;
  v203 = __Block_byref_object_copy__15533;
  v204 = __Block_byref_object_dispose__15534;
  v205 = objc_alloc_init(CPLChangeBatch);
  if (v167)
  {
    objc_msgSend(v151, "transientPullRepository");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = 0;
    v149 = 0;
    v145 = 0;
    v143 = 0;
    v160 = 0;
    v147 = 0;
  }
  else
  {
    objc_msgSend(v151, "idMapping");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "remappedRecords");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    objc_msgSend(v151, "transactionClientCacheView");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "pullQueue");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "quarantinedRecords");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v148 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v160 = v13;

    v142 = 0;
  }
  v194 = 0;
  v195 = (id *)&v194;
  v196 = 0x3032000000;
  v197 = __Block_byref_object_copy__15533;
  v198 = __Block_byref_object_dispose__15534;
  v199 = 0;
  v192[0] = 0;
  v192[1] = v192;
  v192[2] = 0x2020000000;
  v193 = 0;
  v190[0] = 0;
  v190[1] = v190;
  v190[2] = 0x2020000000;
  v191 = 0;
  v185[0] = MEMORY[0x1E0C809B0];
  v185[1] = 3221225472;
  v185[2] = __80__CPLEngineCloudCache_cloudChangeBatchFromBatch_usingMapping_isFinal_withError___block_invoke;
  v185[3] = &unk_1E60DC0A0;
  v187 = &v194;
  v188 = v192;
  v189 = v190;
  v155 = v10;
  v186 = v155;
  v162 = (_QWORD *)MEMORY[0x1B5E08DC4](v185);
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v216, 16);
  if (!v14)
  {
    v168 = 0;
    goto LABEL_283;
  }
  v168 = 0;
  v159 = *(_QWORD *)v182;
  v15 = "local";
  if (!v167)
    v15 = "cloud";
  v146 = v15;
  do
  {
    v158 = v14;
    for (i = 0; i != v158; ++i)
    {
      if (*(_QWORD *)v182 != v159)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * i);
      objc_msgSend(v17, "scopedIdentifier");
      v164 = objc_claimAutoreleasedReturnValue();
      -[NSObject scopeIdentifier](v164, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v168;
      v20 = v18;
      v21 = (id)v20;
      v168 = (void *)v19;
      v166 = v20;
      if (v19 && v20)
      {
        v22 = objc_msgSend((id)v19, "isEqual:", v20);
        v23 = v21;
        v24 = v22;

        if ((v24 & 1) != 0)
          goto LABEL_21;
      }
      else
      {
        v25 = (v19 | v20) != 0;

        if (!v25)
        {
          v168 = 0;
          goto LABEL_21;
        }
      }
      objc_msgSend(v155, "scopeWithIdentifier:", v166);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        if (a6)
        {
          +[CPLErrors invalidScopeErrorWithScopedIdentifier:](CPLErrors, "invalidScopeErrorWithScopedIdentifier:", v164);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        v128 = v201[5];
        v201[5] = 0;
        goto LABEL_282;
      }
      v27 = v166;

      objc_storeStrong(v195 + 5, v26);
      v168 = v27;
LABEL_21:
      v28 = (uint64_t (*)(void))v162[2];
      if (v167)
      {
        v29 = 0;
        v161 = v28() ^ 1;
      }
      else
      {
        v161 = 0;
        v29 = v28() ^ 1;
      }
      v180 = 0;
      v30 = objc_msgSend(v17, "validateChangeWithError:", &v180);
      v165 = v180;
      if ((v30 & 1) == 0)
      {
        if (v167)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_15506();
            v129 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v17;
              v208 = 2112;
              v209 = v165;
              _os_log_impl(&dword_1B03C2000, v129, OS_LOG_TYPE_ERROR, "Incorrect change %@ in push repository: %@", buf, 0x16u);
            }

          }
          +[CPLErrors cplErrorWithCode:underlyingError:description:](CPLErrors, "cplErrorWithCode:underlyingError:description:", 20, v165, CFSTR("Incorrect change %@ in push repository"), v17);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = (void *)v201[5];
          v201[5] = 0;

          if (a6)
            *a6 = objc_retainAutorelease(v130);

          v128 = v165;
          goto LABEL_282;
        }
        objc_msgSend(v17, "realIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31 == 0;

        if (v32)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_15506();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v17;
              v208 = 2112;
              v209 = v165;
              _os_log_impl(&dword_1B03C2000, v36, OS_LOG_TYPE_ERROR, "Incorrect change coming from the cloud %@: %@", buf, 0x16u);
            }
LABEL_88:

          }
LABEL_89:

          continue;
        }
      }
      objc_msgSend(v17, "realIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        objc_msgSend(v17, "_ignoredRecord");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34 == 0;

        if (!v35)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_15506();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v17, "_ignoredRecord");
              v37 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v17;
              v208 = 2112;
              v209 = v37;
              _os_log_impl(&dword_1B03C2000, v36, OS_LOG_TYPE_DEFAULT, "Ignoring already known remapped record %@ (shadowing %@)", buf, 0x16u);

            }
            goto LABEL_88;
          }
          goto LABEL_89;
        }
      }
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_15506();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v39 = (id)objc_opt_class();
          objc_msgSend(v17, "scopedIdentifier");
          v40 = (CPLRecordChangeDiffTracker *)(id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "cplFullDescription");
          v41 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v207 = v146;
          v208 = 2112;
          v209 = v39;
          v210 = 2112;
          v211 = v40;
          v212 = 2112;
          v213 = v41;
          _os_log_impl(&dword_1B03C2000, v38, OS_LOG_TYPE_DEBUG, "Filtering %s <%@ %@> against cloud cache:\n%@", buf, 0x2Au);

        }
      }
      objc_msgSend(v17, "realIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42 == 0;

      if (!v43)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_15506();
          v137 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v207 = (const char *)v17;
            _os_log_impl(&dword_1B03C2000, v137, OS_LOG_TYPE_ERROR, "Trying to mingle a remapped record %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineCloudCache.m");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "handleFailureInMethod:object:file:lineNumber:description:", a2, v156, v139, 328, CFSTR("Trying to mingle a remapped record %@"), v17);

        abort();
      }
      if (v167)
      {
        objc_msgSend(v17, "translateToCloudChangeUsingIDMapping:error:", v167, a6);
        v44 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v44 = v17;
      }
      objc_msgSend(v44, "scopedIdentifier");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = 1;
      if (!v44)
        goto LABEL_279;
      -[CPLEngineStorage platformObject](v156, "platformObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "recordWithScopedIdentifier:isFinal:isConfirmed:", v163, v152, &v179);
      v46 = objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v44, "isDelete"))
      {
        if (v46)
        {
          if (!v167)
            goto LABEL_191;
          objc_msgSend(v44, "restoreRelationshipsFromFullRecord:", v46);
          goto LABEL_181;
        }
        if (v29)
        {
          v178 = 0;
          objc_msgSend(v160, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v163, &v178);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (v64 && objc_msgSend(v149, "hasRecordWithScopedIdentifier:", v64))
          {
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_15506();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v207 = (const char *)v17;
                _os_log_impl(&dword_1B03C2000, v65, OS_LOG_TYPE_DEBUG, "%@ is already known to the cloud cache but not from the client cache - keeping", buf, 0xCu);
              }

            }
            v66 = 0;
          }
          else
          {
            v66 = 1;
          }

LABEL_160:
          if (v66 && v167 == 0)
          {
            v178 = 0;
            objc_msgSend(v160, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v163, &v178);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            if (v92 && objc_msgSend(v145, "isRecordWithScopedIdentifierQuarantined:", v92))
            {
              if (!_CPLSilentLogging)
              {
                __CPLStorageOSLogDomain_15506();
                v93 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v207 = (const char *)v17;
                  _os_log_impl(&dword_1B03C2000, v93, OS_LOG_TYPE_DEFAULT, "%@ is already known to the cloud cache but the record is quarantined - keeping", buf, 0xCu);
                }

              }
              v66 = 0;
            }
            else
            {
              v66 = 1;
            }

          }
        }
        else
        {
          if (!v167)
          {
            v66 = 1;
            goto LABEL_160;
          }
          v66 = (objc_msgSend(v17, "_shouldNotTrustCloudCache") & 1) == 0
             && !objc_msgSend(v142, "hasRecordWithScopedIdentifier:", v163);
        }
        if (!v147)
        {
          v95 = 0;
          if (v66)
            goto LABEL_173;
          goto LABEL_180;
        }
        v177 = 0;
        v94 = objc_msgSend(v147, "removeRemappedRecordWithScopedIdentifier:error:", v163, &v177);
        v95 = v177;
        if (v94)
        {
          if (v66)
          {
LABEL_173:
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_15506();
              v96 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v207 = (const char *)v17;
                _os_log_impl(&dword_1B03C2000, v96, OS_LOG_TYPE_DEBUG, "%@ is already known to the cache. Ignoring", buf, 0xCu);
              }

            }
            v44 = 0;
            if (!v167)
              goto LABEL_189;
LABEL_181:
            objc_msgSend(v17, "scopedIdentifier");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v176 = 0;
            v98 = objc_msgSend(v167, "addDeleteEventForRecordWithLocalScopedIdentifier:direction:error:", v97, 1, &v176);
            v95 = v176;

            if ((v98 & 1) != 0)
            {

              if (v44)
                goto LABEL_183;
              goto LABEL_217;
            }
            v132 = (void *)v201[5];
            v201[5] = 0;

            if (a6)
            {
              v95 = objc_retainAutorelease(v95);
              goto LABEL_286;
            }
            goto LABEL_281;
          }
LABEL_180:

          if (!v167)
          {
            v46 = 0;
            goto LABEL_191;
          }
          goto LABEL_181;
        }
        v136 = (void *)v201[5];
        v201[5] = 0;

        if (a6)
        {
          v95 = objc_retainAutorelease(v95);
          v46 = 0;
LABEL_286:
          *a6 = v95;
        }
        else
        {
          v46 = 0;
        }
LABEL_281:

        v128 = v166;
        v166 = v164;
        v164 = v46;
LABEL_282:

        goto LABEL_283;
      }
      if (v46)
        v47 = v29;
      else
        v47 = 0;
      if (v47 == 1)
      {
        v178 = 0;
        objc_msgSend(v160, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v163, &v178);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48
          && (objc_msgSend(v149, "hasRecordWithScopedIdentifier:", v48) & 1) == 0
          && (objc_msgSend(v143, "hasSomeChangeWithScopedIdentifier:", v163) & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_15506();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v207 = (const char *)v17;
              _os_log_impl(&dword_1B03C2000, v49, OS_LOG_TYPE_DEFAULT, "%@ is already known to the cloud cache but not from the client cache. Forcing change to client cache", buf, 0xCu);
            }

          }
          v46 = 0;
        }

      }
      if (!v46)
      {
        if (v167)
        {
          if ((objc_msgSend(v44, "isFullRecord") & 1) != 0)
          {
            if (objc_msgSend(v44, "supportsResources"))
            {
              v67 = (void *)v201[5];
              objc_msgSend(v17, "resources");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "appendLocalResources:forItemWithCloudScopedIdentifier:", v68, v163);

            }
            v46 = 0;
LABEL_183:
            v62 = v44;
LABEL_184:
            -[NSObject recordChangeData](v46, "recordChangeData");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setRecordChangeData:", v99);

            -[NSObject sharingRecordChangeData](v46, "sharingRecordChangeData");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setSharingRecordChangeData:", v100);

            objc_msgSend(v62, "setServerRecordIsCorrupted:", -[NSObject serverRecordIsCorrupted](v46, "serverRecordIsCorrupted"));
            objc_msgSend(v62, "restoreRelationshipsFromFullRecord:", v46);
            goto LABEL_193;
          }
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_15506();
            v133 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v207 = (const char *)v17;
              _os_log_impl(&dword_1B03C2000, v133, OS_LOG_TYPE_ERROR, "Got a partial record %@ from the client which is new to the cache", buf, 0xCu);
            }

          }
          if (a6)
          {
            +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", 0);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_279:
          v46 = 0;
          goto LABEL_280;
        }
        if ((objc_msgSend(v44, "isFullRecord") & 1) != 0)
        {
          objc_msgSend(v44, "relatedScopedIdentifier");
          v72 = objc_claimAutoreleasedReturnValue();
          if (!v72)
            goto LABEL_120;
          if ((objc_msgSend(v148, "containsObject:", v72) & 1) != 0)
            goto LABEL_120;
          -[CPLEngineStorage platformObject](v156, "platformObject");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "hasRecordWithScopedIdentifier:", v72);

          if ((v74 & 1) != 0)
            goto LABEL_120;
          if (objc_msgSend(v17, "relatedRelationshipIsWeak"))
          {
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_15506();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v207 = (const char *)v17;
                v208 = 2112;
                v209 = v72;
                _os_log_impl(&dword_1B03C2000, v75, OS_LOG_TYPE_DEFAULT, "%@ is referencing a related record %@ which is unknown to the cache", buf, 0x16u);
              }

            }
LABEL_120:
            objc_msgSend(v44, "secondaryScopedIdentifier");
            v76 = objc_claimAutoreleasedReturnValue();
            if (!v76)
              goto LABEL_128;
            if ((objc_msgSend(v148, "containsObject:", v76) & 1) != 0)
              goto LABEL_128;
            -[CPLEngineStorage platformObject](v156, "platformObject");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v77, "hasRecordWithScopedIdentifier:", v76);

            if ((v78 & 1) != 0)
              goto LABEL_128;
            if (objc_msgSend(v44, "secondaryRelationshipIsWeak"))
            {
              if (!_CPLSilentLogging)
              {
                __CPLStorageOSLogDomain_15506();
                v79 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v207 = (const char *)v44;
                  v208 = 2112;
                  v209 = v76;
                  _os_log_impl(&dword_1B03C2000, v79, OS_LOG_TYPE_DEFAULT, "%@ is referencing a secondary record %@ which is unknown to the cache", buf, 0x16u);
                }

              }
LABEL_128:

              objc_msgSend(v148, "addObject:", v163);
              v46 = 0;
LABEL_191:
              v62 = v44;
LABEL_192:
              objc_msgSend(v17, "recordChangeData");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setRecordChangeData:", v101);

              objc_msgSend(v17, "sharingRecordChangeData");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setSharingRecordChangeData:", v102);

              objc_msgSend(v62, "setServerRecordIsCorrupted:", objc_msgSend(v17, "serverRecordIsCorrupted"));
LABEL_193:
              v103 = 0;
              goto LABEL_218;
            }
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_15506();
              v127 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v207 = (const char *)v44;
                v208 = 2112;
                v209 = v76;
                _os_log_impl(&dword_1B03C2000, v127, OS_LOG_TYPE_ERROR, "%@ is referencing a secondary record %@ which is unknown to the cache", buf, 0x16u);
              }

            }
LABEL_250:

          }
          else if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_15506();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v17;
              v208 = 2112;
              v209 = v72;
              _os_log_impl(&dword_1B03C2000, v76, OS_LOG_TYPE_ERROR, "%@ is referencing a related record %@ which is unknown to the cache", buf, 0x16u);
            }
            goto LABEL_250;
          }
LABEL_188:

        }
        else if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_15506();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v207 = (const char *)v17;
            _os_log_impl(&dword_1B03C2000, v72, OS_LOG_TYPE_ERROR, "Got a partial record %@ from the cloud which is new to the cache", buf, 0xCu);
          }
          goto LABEL_188;
        }
LABEL_189:

        v46 = 0;
        goto LABEL_217;
      }
      if (!v167)
      {
        objc_msgSend(v44, "relatedScopedIdentifier");
        v50 = objc_claimAutoreleasedReturnValue();
        if (!v50)
          goto LABEL_68;
        if ((objc_msgSend(v148, "containsObject:", v50) & 1) != 0)
          goto LABEL_68;
        -[CPLEngineStorage platformObject](v156, "platformObject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "hasRecordWithScopedIdentifier:", v50);

        if ((v52 & 1) != 0)
          goto LABEL_68;
        if (objc_msgSend(v44, "relatedRelationshipIsWeak"))
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_15506();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v44;
              v208 = 2112;
              v209 = v50;
              _os_log_impl(&dword_1B03C2000, v53, OS_LOG_TYPE_DEFAULT, "%@ is referencing a related record %@ which is unknown to the cache", buf, 0x16u);
            }

          }
LABEL_68:
          objc_msgSend(v44, "secondaryScopedIdentifier");
          v54 = objc_claimAutoreleasedReturnValue();
          if (!v54
            || (objc_msgSend(v148, "containsObject:", v54) & 1) != 0
            || (-[CPLEngineStorage platformObject](v156, "platformObject"),
                v55 = (void *)objc_claimAutoreleasedReturnValue(),
                v56 = objc_msgSend(v55, "hasRecordWithScopedIdentifier:", v54),
                v55,
                (v56 & 1) != 0))
          {
LABEL_76:

            goto LABEL_77;
          }
          if (objc_msgSend(v44, "secondaryRelationshipIsWeak"))
          {
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_15506();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v207 = (const char *)v44;
                v208 = 2112;
                v209 = v54;
                _os_log_impl(&dword_1B03C2000, v57, OS_LOG_TYPE_DEFAULT, "%@ is referencing a secondary record %@ which is unknown to the cache", buf, 0x16u);
              }

            }
            goto LABEL_76;
          }
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_15506();
            v104 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v44;
              v208 = 2112;
              v209 = v54;
              _os_log_impl(&dword_1B03C2000, v104, OS_LOG_TYPE_ERROR, "%@ is referencing a secondary record %@ which is unknown to the cache", buf, 0x16u);
            }

          }
LABEL_202:

        }
        else if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_15506();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v207 = (const char *)v44;
            v208 = 2112;
            v209 = v50;
            _os_log_impl(&dword_1B03C2000, v54, OS_LOG_TYPE_ERROR, "%@ is referencing a related record %@ which is unknown to the cache", buf, 0x16u);
          }
          goto LABEL_202;
        }

LABEL_204:
        -[NSObject recordChangeData](v46, "recordChangeData");
        v105 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "recordChangeData");
        v106 = objc_claimAutoreleasedReturnValue();
        v107 = (void *)v106;
        if (v105 && v106)
        {
          v108 = objc_msgSend((id)v105, "isEqual:", v106);

          if ((v108 & 1) != 0)
            goto LABEL_210;
LABEL_209:
          objc_msgSend(v17, "recordChangeData");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setRecordChangeData:](v46, "setRecordChangeData:", v110);

          -[NSObject setServerRecordIsCorrupted:](v46, "setServerRecordIsCorrupted:", objc_msgSend(v17, "serverRecordIsCorrupted"));
        }
        else
        {
          v109 = (v105 | v106) != 0;

          if (v109)
            goto LABEL_209;
        }
LABEL_210:
        -[NSObject sharingRecordChangeData](v46, "sharingRecordChangeData");
        v111 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sharingRecordChangeData");
        v112 = objc_claimAutoreleasedReturnValue();
        v113 = (void *)v112;
        if (v111 && v112)
        {
          v114 = objc_msgSend((id)v111, "isEqual:", v112);

          if ((v114 & 1) != 0)
          {
LABEL_216:
            if (-[CPLEngineCloudCache updateStagedRecord:error:](v156, "updateStagedRecord:error:", v46, a6))
              goto LABEL_217;
            v44 = 0;
LABEL_280:
            v95 = (id)v201[5];
            v201[5] = 0;
            goto LABEL_281;
          }
        }
        else
        {
          v115 = (v111 | v112) != 0;

          if (!v115)
            goto LABEL_216;
        }
        objc_msgSend(v17, "sharingRecordChangeData");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setSharingRecordChangeData:](v46, "setSharingRecordChangeData:", v116);

        -[NSObject setServerRecordIsCorrupted:](v46, "setServerRecordIsCorrupted:", objc_msgSend(v17, "serverRecordIsCorrupted"));
        goto LABEL_216;
      }
LABEL_77:
      v58 = objc_msgSend(v17, "_shouldNotTrustCloudCache");
      v59 = v58;
      if (v167)
        v60 = 1;
      else
        v60 = v58;
      if ((v60 & 1) != 0)
      {
        v61 = v44;
        v62 = v61;
        if ((v59 & 1) != 0)
          goto LABEL_106;
        if (v167 && objc_msgSend(v61, "hasChangeType:", 2))
        {
          v150 = -[CPLRecordChangeDiffTracker initWithTrackingChangeTypeMask:]([CPLRecordChangeDiffTracker alloc], "initWithTrackingChangeTypeMask:", 2);
          v63 = 1;
          goto LABEL_133;
        }
      }
      else
      {
        buf[0] = 0;
        objc_msgSend(v160, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v163, buf);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
        {
          v70 = objc_msgSend(v145, "isRecordWithScopedIdentifierQuarantined:", v69);

          v71 = v44;
          if ((v70 & 1) != 0)
          {
            v62 = v71;
LABEL_106:
            v150 = 0;
            v144 = 0;
            goto LABEL_136;
          }
        }
        else
        {
          v80 = v44;
        }
      }
      v150 = objc_alloc_init(CPLRecordChangeDiffTracker);
      v63 = 0;
LABEL_133:
      v175 = 0;
      -[NSObject realRecordChangeFromRecordChange:direction:newRecord:diffTracker:](v46, "realRecordChangeFromRecordChange:direction:newRecord:diffTracker:", v44, v141, &v175, v150);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = v175;

      if (v63)
        objc_msgSend(v62, "attachDiffTracker:", v150);
      if (!v62)
      {
        if (_CPLSilentLogging)
        {
          v89 = 0;
          v62 = 0;
          goto LABEL_149;
        }
        __CPLStorageOSLogDomain_15506();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v207 = (const char *)v17;
          _os_log_impl(&dword_1B03C2000, v84, OS_LOG_TYPE_DEBUG, "%@ is already known to the cache. Ignoring", buf, 0xCu);
        }
        v89 = 0;
        v62 = 0;
        goto LABEL_148;
      }
LABEL_136:
      objc_msgSend(v62, "recordModificationDate");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (v81)
        goto LABEL_139;
      objc_msgSend(v44, "recordModificationDate");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v82 == 0;

      if (!v83)
      {
        objc_msgSend(v44, "recordModificationDate");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setRecordModificationDate:", v81);
LABEL_139:

      }
      if (_CPLSilentLogging)
      {
        v89 = 1;
        goto LABEL_149;
      }
      __CPLStorageOSLogDomain_15506();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
      {
        v85 = (char *)(id)objc_opt_class();
        objc_msgSend(v44, "scopedIdentifier");
        v86 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "cplFullDescription");
        v87 = (id)objc_claimAutoreleasedReturnValue();
        -[NSObject cplFullDescription](v46, "cplFullDescription");
        v88 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v207 = v85;
        v208 = 2112;
        v209 = v86;
        v210 = 2112;
        v211 = v150;
        v212 = 2112;
        v213 = v87;
        v214 = 2112;
        v215 = v88;
        _os_log_impl(&dword_1B03C2000, v84, OS_LOG_TYPE_DEBUG, "<%@ %@> is a real diff for cloud cache (%@): %@\nvs.:\n%@", buf, 0x34u);

      }
      v89 = 1;
LABEL_148:

LABEL_149:
      if (v167
        && objc_msgSend(v44, "supportsResources")
        && (v89 & objc_msgSend(v44, "hasChangeType:", 8)) == 1
        && objc_msgSend(v62, "hasChangeType:", 8))
      {
        v90 = (void *)v201[5];
        objc_msgSend(v17, "resources");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "appendLocalResources:forItemWithCloudScopedIdentifier:", v91, v163);

      }
      if (v62)
      {
        if (!v167)
          goto LABEL_192;
        goto LABEL_184;
      }
      if (!v167)
        goto LABEL_204;
LABEL_217:
      v62 = 0;
      v103 = 1;
LABEL_218:
      v169[0] = MEMORY[0x1E0C809B0];
      v169[1] = 3221225472;
      v169[2] = __80__CPLEngineCloudCache_cloudChangeBatchFromBatch_usingMapping_isFinal_withError___block_invoke_22;
      v169[3] = &unk_1E60DC0C8;
      v117 = v160;
      v174 = v179;
      v170 = v117;
      v171 = v17;
      v172 = v153;
      v173 = &v200;
      v118 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1B5E08DC4](v169);
      if ((v103 & 1) != 0)
      {
        if (!objc_msgSend(v17, "supportsResources")
          || !objc_msgSend(v17, "hasChangeType:", 8)
          || (objc_msgSend(v17, "resources"),
              v119 = (void *)objc_claimAutoreleasedReturnValue(),
              v120 = objc_msgSend(v119, "count") == 0,
              v119,
              v120))
        {
          if (!v167)
            goto LABEL_240;
LABEL_239:
          if (-[CPLEngineCloudCache ackownledgeRecordWithScopedIdentifier:error:](v156, "ackownledgeRecordWithScopedIdentifier:error:", v163, a6))
          {
LABEL_240:
            v122 = 1;
            goto LABEL_243;
          }
          v126 = (void *)v201[5];
          v201[5] = 0;
LABEL_242:

          v122 = v103 ^ 1;
          goto LABEL_243;
        }
        v121 = ((uint64_t (**)(_QWORD, id *))v118)[2](v118, a6);
        v122 = v121;
        if (v167)
          v123 = v121;
        else
          v123 = 0;
        if ((v123 & 1) != 0)
          goto LABEL_239;
      }
      else
      {
        if (!objc_msgSend(v17, "supportsResources")
          || !objc_msgSend(v17, "hasChangeType:", 8)
          || (objc_msgSend(v62, "hasChangeType:", 8) & 1) != 0
          || (objc_msgSend(v17, "resources"),
              v124 = (void *)objc_claimAutoreleasedReturnValue(),
              v125 = objc_msgSend(v124, "count") == 0,
              v124,
              v125)
          || (((uint64_t (**)(_QWORD, id *))v118)[2](v118, a6) & 1) != 0)
        {
          if (v161 && objc_msgSend(v62, "hasChangeType:", 2))
            objc_msgSend(v62, "setShouldFilterDefaultValuesForNewProperties:", 1);
          objc_msgSend(v17, "_pushContext");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "_setPushContext:", v126);
          objc_msgSend(v62, "_setShouldNotTrustCloudCache:", objc_msgSend(v17, "_shouldNotTrustCloudCache"));
          if (v167)
            objc_msgSend(v62, "_setRecordKnownByCloudCache:", v46);
          objc_msgSend((id)v201[5], "addRecord:", v62);
          goto LABEL_242;
        }
        v122 = 0;
      }
LABEL_243:

      if (!v122)
        goto LABEL_283;
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v216, 16);
  }
  while (v14);
LABEL_283:

  v134 = (id)v201[5];
  _Block_object_dispose(v190, 8);
  _Block_object_dispose(v192, 8);

  _Block_object_dispose(&v194, 8);
  _Block_object_dispose(&v200, 8);

  return v134;
}

- (BOOL)confirmAllRecordsWithError:(id *)a3
{
  void *v4;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "confirmAllRecordsWithError:", a3);

  return (char)a3;
}

- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  int v13;
  id v14;
  uint64_t v15;

  v6 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Deleting record %@", (uint8_t *)&v13, 0xCu);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "deleteRecordWithScopedIdentifier:isFinal:error:", v8, v6, a5);

  return v11;
}

- (id)recordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordWithScopedIdentifier:isFinal:isConfirmed:", v6, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)recordWithScopedIdentifier:(id)a3 isConfirmed:(BOOL *)a4 isStaged:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordWithScopedIdentifier:isConfirmed:isStaged:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (BOOL)hasAnyRecordWithRelatedScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAnyRecordWithRelatedScopedIdentifier:", v4);

  return v6;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordsWithRelatedScopedIdentifier:isFinal:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordsWithRelatedScopedIdentifier:class:isFinal:", v8, a4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relatedScopedIdentifierForRecordWithScopedIdentifier:isFinal:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)recordAcknowledgedByClientWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordAcknowledgedByClientWithScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasRecordAcknowledgedByClientWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasRecordAcknowledgedByClientWithScopedIdentifier:", v4);

  return v6;
}

- (id)recordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordsAcknowledgedByClientWithRelatedScopedIdentifier:class:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  unint64_t v8;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:class:", v6, a4);

  return v8;
}

- (BOOL)ackownledgeRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "ackownledgeRecordWithScopedIdentifier:error:", v6, a4);

  return (char)a4;
}

- (BOOL)remapAllRecordsWithPreviousScopedIdentifier:(id)a3 newScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Remapping %@ -> %@", buf, 0x16u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = objc_msgSend(v11, "remapAllRecordsWithPreviousScopedIdentifier:newScopedIdentifier:error:", v8, v9, &v16);
  v13 = v16;

  if ((v12 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_15506();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Can't remap: %@", buf, 0xCu);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }

  return v12;
}

- (BOOL)commitStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Committing staged changes", v14, 2u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "commitStagedChangesForScopeWithIdentifier:error:", v6, a4);

  if (v9)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scopes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "scopeWithIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      LOBYTE(v9) = objc_msgSend(v11, "commitSyncAnchorForScope:error:", v12, a4);
      if (objc_msgSend(v11, "hasFinishedAFullSyncForScope:", v12))
        LOBYTE(v9) = objc_msgSend(v11, "clearTransportGroupsForScope:error:", v12, a4);
    }
    else if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v6);
      LOBYTE(v9) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  return v9;
}

- (BOOL)discardStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_15506();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Discarding staged changes", v14, 2u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "discardStagedChangesForScopeWithIdentifier:error:", v6, a4);

  if (v9)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scopes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "scopeWithIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      LOBYTE(v9) = objc_msgSend(v11, "discardStagedSyncAnchorForScope:error:", v12, a4);
    }
    else if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v6);
      LOBYTE(v9) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  return v9;
}

- (BOOL)discardStagedChangesWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "discardStagedChangesWithScopeFilter:error:", v6, a4);

  if (v8)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scopes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "discardStagedSyncAnchorWithScopeFilter:error:", v6, a4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_otherScopedIdentifierForCloudScopedIdentifier:(id)a3 sharedScoped:(id)a4
{
  id v6;
  id v7;
  CPLScopedIdentifier *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CPLScopedIdentifier *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = [CPLScopedIdentifier alloc];
  objc_msgSend(v6, "scopeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "cloudIndex");
  v12 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:](v8, "initWithScopeIdentifier:identifier:scopeIndex:", v9, v10, v11);

  -[CPLEngineStorage engineStore](self, "engineStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remappedRecords");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "realScopedIdentifierForRemappedScopedIdentifier:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = v12;
  v17 = v15;

  return v17;
}

- (id)_targetWithShareableRecord:(id)a3 cloudScopedIdentifier:(id)a4 otherScopedIdentifier:(id)a5 sharedScope:(id)a6 trustRecordChangeData:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  char v30;
  CPLRecordTarget *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  CPLRecordTarget *v35;
  void *v37;
  id v38;
  id v39;
  _BOOL4 v40;
  id v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v7 = a7;
  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v15, "scopeIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v19 = 0;
    goto LABEL_39;
  }
  if (objc_msgSend(v12, "isMasterChange"))
  {
    objc_msgSend(v12, "recordChangeData");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sharingRecordChangeData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)v17;
    if (v17 && v18)
    {
      v19 = 3;
    }
    else
    {
      v42 = v18;
      objc_msgSend(v12, "scopedIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineCloudCache recordsWithRelatedScopedIdentifier:class:isFinal:](self, "recordsWithRelatedScopedIdentifier:class:isFinal:", v21, objc_opt_class(), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v23 = v22;
      v19 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v19)
      {
        v40 = v7;
        v38 = v15;
        v39 = v13;
        v41 = v14;
        v24 = 0;
        v25 = 0;
        v26 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v45 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            v29 = (void *)MEMORY[0x1B5E08BF0]();
            v30 = objc_msgSend(v28, "isSharedInScopeWithIdentifier:", v16);
            v25 |= v30;
            v24 |= v30 ^ 1;
            objc_autoreleasePoolPop(v29);
            if ((v25 & 1) != 0 && (v24 & 1) != 0)
            {

              v19 = 3;
              goto LABEL_27;
            }
          }
          v19 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v19)
            continue;
          break;
        }

        if ((v24 & 1) != 0)
          v19 = 3;
        else
          v19 = 2;
        if ((v25 & 1) == 0)
          v19 = v24 & 1;
LABEL_27:
        v15 = v38;
        v13 = v39;
        v14 = v41;
        v7 = v40;
      }
      else
      {

      }
      v18 = v42;
    }

    goto LABEL_32;
  }
  if (objc_msgSend(v12, "supportsSharingScopedIdentifier"))
  {
    if (!objc_msgSend(v12, "isSharedInScopeWithIdentifier:", v16))
    {
      v19 = 1;
LABEL_32:
      if (v19 == 1 && v7)
      {
        objc_msgSend(v12, "sharingRecordChangeData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "recordChangeData");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = 2;
        if (v33)
          v34 = 3;
        if (v32)
          v19 = v34;
        else
          v19 = v33 != 0;
      }
      goto LABEL_39;
    }
    objc_msgSend(v12, "recordChangeData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v19 = 3;
    }
    else
    {
      objc_msgSend(v12, "sharingRecordChangeData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
        v19 = 2;
      else
        v19 = 3;
    }
LABEL_39:
    v31 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v13, v14, v19);
    goto LABEL_40;
  }
  v31 = -[CPLRecordTarget initWithScopedIdentifier:]([CPLRecordTarget alloc], "initWithScopedIdentifier:", v13);
LABEL_40:
  v35 = v31;

  return v35;
}

- (id)_targetWithRecord:(id)a3 cloudScopedIdentifier:(id)a4 trustRecordChangeData:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CPLRecordTarget *v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (!v12)
    goto LABEL_6;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scopes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "scopeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scopeWithIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || (objc_msgSend(v14, "sharingScopeForScope:", v16), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    v20 = -[CPLRecordTarget initWithScopedIdentifier:]([CPLRecordTarget alloc], "initWithScopedIdentifier:", v9);
    goto LABEL_7;
  }
  v18 = (void *)v17;
  -[CPLEngineCloudCache _otherScopedIdentifierForCloudScopedIdentifier:sharedScoped:](self, "_otherScopedIdentifierForCloudScopedIdentifier:sharedScoped:", v9, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineCloudCache _targetWithShareableRecord:cloudScopedIdentifier:otherScopedIdentifier:sharedScope:trustRecordChangeData:](self, "_targetWithShareableRecord:cloudScopedIdentifier:otherScopedIdentifier:sharedScope:trustRecordChangeData:", v8, v9, v19, v18, v5);
  v20 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v20;
}

- (id)targetForRecordWithCloudScopedIdentifier:(id)a3
{
  return -[CPLEngineCloudCache targetForRecordWithCloudScopedIdentifier:trustRecordChangeData:](self, "targetForRecordWithCloudScopedIdentifier:trustRecordChangeData:", a3, 0);
}

- (id)targetForRecordWithCloudScopedIdentifier:(id)a3 trustRecordChangeData:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  CPLRecordTarget *v18;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (!v9)
    goto LABEL_6;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scopes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scopeWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || (objc_msgSend(v11, "sharingScopeForScope:", v13), (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    v18 = -[CPLRecordTarget initWithScopedIdentifier:]([CPLRecordTarget alloc], "initWithScopedIdentifier:", v6);
    goto LABEL_7;
  }
  v15 = (void *)v14;
  -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self, "recordWithScopedIdentifier:isFinal:", v6, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineCloudCache _otherScopedIdentifierForCloudScopedIdentifier:sharedScoped:](self, "_otherScopedIdentifierForCloudScopedIdentifier:sharedScoped:", v6, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineCloudCache _targetWithShareableRecord:cloudScopedIdentifier:otherScopedIdentifier:sharedScope:trustRecordChangeData:](self, "_targetWithShareableRecord:cloudScopedIdentifier:otherScopedIdentifier:sharedScope:trustRecordChangeData:", v16, v6, v17, v15, v4);
  v18 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v18;
}

- (id)targetForRecordWithSharedCloudScopedIdentifier:(id)a3
{
  return -[CPLEngineCloudCache targetForRecordWithSharedCloudScopedIdentifier:trustRecordChangeData:](self, "targetForRecordWithSharedCloudScopedIdentifier:trustRecordChangeData:", a3, 0);
}

- (id)targetForRecordWithSharedCloudScopedIdentifier:(id)a3 trustRecordChangeData:(BOOL)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CPLScopedIdentifier *v18;
  void *v19;
  void *v20;
  CPLScopedIdentifier *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __objc2_class **v30;
  uint64_t i;
  CPLEngineCloudCache *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  const __CFString *v45;
  void *v46;
  SEL v47;
  CPLEngineCloudCache *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  CPLScopedIdentifier *v53;
  unsigned int v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  id v66;
  uint64_t v67;

  v4 = a4;
  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharingScopeIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v7, "scopeIdentifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", v10),
        v11,
        (v12 & 1) == 0))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_15506();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v7;
        _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_ERROR, "Trying to find target for %@ but sharing is not enabled", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineCloudCache.m");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v43, 921, CFSTR("Trying to find target for %@ but sharing is not enabled"), v7);
LABEL_36:

    abort();
  }
  objc_msgSend(v8, "scopes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scopeWithIdentifier:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_15506();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v44, OS_LOG_TYPE_ERROR, "We should have a shared scope here", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineCloudCache.m");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = CFSTR("We should have a shared scope here");
    v46 = v42;
    v47 = a2;
    v48 = self;
    v49 = v43;
    v50 = 924;
    goto LABEL_35;
  }
  v15 = (void *)v14;
  objc_msgSend(v13, "scopeForSharingScope:", v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_15506();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v51, OS_LOG_TYPE_ERROR, "We should have a main scope here", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineCloudCache.m");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = CFSTR("We should have a main scope here");
    v46 = v42;
    v47 = a2;
    v48 = self;
    v49 = v43;
    v50 = 926;
LABEL_35:
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v47, v48, v49, v50, v45, v52);
    goto LABEL_36;
  }
  v17 = (void *)v16;
  v58 = v15;
  v59 = v13;
  v18 = [CPLScopedIdentifier alloc];
  objc_msgSend(v17, "scopeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v18, "initWithScopeIdentifier:identifier:", v19, v20);

  -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self, "recordWithScopedIdentifier:isFinal:", v21, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
  }
  else
  {
    v57 = v10;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[CPLEngineStorage engineStore](self, "engineStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "remappedRecords");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scopedIdentifiersRemappedToScopedIdentifier:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v27)
    {
      v28 = v27;
      v53 = v21;
      v54 = v4;
      v55 = v8;
      v56 = v7;
      v29 = *(_QWORD *)v61;
      v30 = off_1E60D5000;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          v32 = self;
          if (*(_QWORD *)v61 != v29)
            objc_enumerationMutation(v26);
          v33 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          v34 = objc_alloc(v30[34]);
          objc_msgSend(v17, "scopeIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v34, "initWithScopeIdentifier:identifier:", v35, v36);

          self = v32;
          -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](v32, "recordWithScopedIdentifier:isFinal:", v37, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v23 = v38;
            objc_msgSend(v38, "scopedIdentifier");
            v21 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue();

            v8 = v55;
            v7 = v56;
            v4 = v54;
            goto LABEL_18;
          }

          v30 = off_1E60D5000;
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
        if (v28)
          continue;
        break;
      }
      v23 = 0;
      v8 = v55;
      v7 = v56;
      v4 = v54;
      v21 = v53;
    }
    else
    {
      v23 = 0;
    }
LABEL_18:

    v10 = v57;
  }
  -[CPLEngineCloudCache _targetWithShareableRecord:cloudScopedIdentifier:otherScopedIdentifier:sharedScope:trustRecordChangeData:](self, "_targetWithShareableRecord:cloudScopedIdentifier:otherScopedIdentifier:sharedScope:trustRecordChangeData:", v23, v21, v7, v58, v4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (void)updateStoredTargetsFromTargetMapping:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasUpdatedTargets"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_15506();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "updatedTargetsDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138543362;
        v7 = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Updating targets:\n%{public}@", (uint8_t *)&v6, 0xCu);

      }
    }
    objc_msgSend(v3, "startTrackingUpdates");
  }

}

- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 record:(id *)a5 target:(id *)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self, "recordWithScopedIdentifier:isFinal:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineCloudCache _targetWithRecord:cloudScopedIdentifier:trustRecordChangeData:](self, "_targetWithRecord:cloudScopedIdentifier:trustRecordChangeData:", v13, v12, 1);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (a7)
    {
      v21 = CFSTR("Record does not exist");
      v22 = 25;
LABEL_23:
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", v22, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_18;
  }
  if (a5)
    *a5 = -[CPLPlaceholderRecord initWithRecord:]([CPLPlaceholderRecord alloc], "initWithRecord:", v13);
  if ((objc_msgSend(v13, "supportsResources") & 1) == 0)
  {
    if (a7)
    {
      +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("itemScopedIdentifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      v20 = 0;
      *a7 = v23;
      goto LABEL_25;
    }
LABEL_18:
    v20 = 0;
    goto LABEL_25;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v13, "resources", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v19, "resourceType") == a3)
        {
          v20 = v19;
          goto LABEL_20;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_20:

  if (a7 && !v20)
  {
    v21 = CFSTR("Record does not have this type of resource");
    v22 = 26;
    goto LABEL_23;
  }
LABEL_25:

  return v20;
}

- (void)getCommittedRecord:(id *)a3 stagedRecord:(id *)a4 forScopedIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  char v15;
  unint64_t v16;

  v8 = a5;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordWithScopedIdentifier:isFinal:isConfirmed:", v8, 1, 0);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordWithScopedIdentifier:isFinal:isConfirmed:", v8, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *a4 = v11;
  v12 = (unint64_t)*a3;
  v13 = (void *)v12;
  v14 = (unint64_t)*a4;
  if (!v12 || !v14)
  {
    v16 = v12 | v14;

    if (v16)
      return;
    goto LABEL_6;
  }
  v15 = objc_msgSend((id)v12, "isEqual:");

  if ((v15 & 1) != 0)
LABEL_6:
    *a4 = 0;
}

- (id)recordsOfClass:(Class)a3 isFinal:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordsOfClass:isFinal:", a3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allRecordsIsFinal:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allRecordsIsFinal:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __80__CPLEngineCloudCache_cloudChangeBatchFromBatch_usingMapping_isFinal_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v4;
  uint64_t v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    return 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = a1 + 56;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "hasFinishedAFullSyncForScope:");
    v5 = *(_QWORD *)(a1 + 56);
    v2 = a1 + 56;
    *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 - 8) + 8) + 24) = 1;
  }
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 24) != 0;
}

uint64_t __80__CPLEngineCloudCache_cloudChangeBatchFromBatch_usingMapping_isFinal_withError___block_invoke_22(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v12;

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v5 = 0;
LABEL_11:
      v6 = 1;
      goto LABEL_12;
    }
    v12 = 0;
    objc_msgSend(*(id *)(a1 + 40), "scopedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v9, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v5 = (id)objc_msgSend((id)objc_opt_class(), "newRecordWithScopedIdentifier:", v10);
    else
      v5 = 0;

    if (!v5)
      goto LABEL_11;
  }
  else
  {
    v5 = *(id *)(a1 + 40);
    if (!v5)
      goto LABEL_11;
  }
  v6 = 1;
  if ((objc_msgSend(*(id *)(a1 + 48), "notifyStatusForRecordHasChanged:persist:error:", v5, 1, a2) & 1) == 0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    v6 = 0;
  }
LABEL_12:

  return v6;
}

@end
