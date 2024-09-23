@implementation CPLAssetChange

- (CPLAssetChange)initWithCoder:(id)a3
{
  id v4;
  CPLAssetChange *v5;
  CPLAssetChange *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLAssetChange;
  v5 = -[CPLRecordChange initWithCoder:](&v10, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[CPLAssetChange facesData](v5, "facesData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faces"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if (initWithCoder__onceToken_62 != -1)
          dispatch_once(&initWithCoder__onceToken_62, &__block_literal_global_63);
        -[CPLAssetChange setFaces:](v6, "setFaces:", v8);
      }

    }
  }

  return v6;
}

void __45__CPLAssetChange_CPLNSCoding__initWithCoder___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1B03C2000, v0, OS_LOG_TYPE_DEFAULT, "Storage might contain old serialized faces", v1, 2u);
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("faces")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLAssetChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("faces")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLAssetChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

- (id)scopedIdentifiersForMapping
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v8.receiver = self;
  v8.super_class = (Class)CPLAssetChange;
  -[CPLRecordChange scopedIdentifiersForMapping](&v8, sel_scopedIdentifiersForMapping);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[CPLAssetChange masterScopedIdentifier](self, "masterScopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);

  return v5;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  CPLAssetChange *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLAssetChange;
  -[CPLRecordChange translateToCloudChangeUsingIDMapping:error:](&v13, sel_translateToCloudChangeUsingIDMapping_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12 = 0;
    -[CPLAssetChange masterScopedIdentifier](self, "masterScopedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v8, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v7, "setMasterScopedIdentifier:", v9);
      }
      else
      {
        if (a4)
        {
          +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v15 = v8;
            v16 = 2112;
            v17 = self;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Can't map local \"masterScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }

        }
        v7 = 0;
      }

    }
  }

  return v7;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  CPLAssetChange *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLAssetChange;
  -[CPLRecordChange translateToClientChangeUsingIDMapping:error:](&v13, sel_translateToClientChangeUsingIDMapping_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12 = 0;
    -[CPLAssetChange masterScopedIdentifier](self, "masterScopedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v8, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v7, "setMasterScopedIdentifier:", v9);
      }
      else
      {
        if (a4)
        {
          +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v15 = v8;
            v16 = 2112;
            v17 = self;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Can't map cloud \"masterScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }

        }
        v7 = 0;
      }

    }
  }

  return v7;
}

- (id)compactedChangeWithRelatedChanges:(id)a3 isOnlyChange:(BOOL)a4 fullRecord:(id)a5 usingStorageView:(id)a6
{
  CPLAssetChange *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  CPLAssetChange *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  CPLAssetChange *v54;
  id v55;
  id v56;
  id v57;
  id obj;
  id v59;
  _QWORD v60[5];
  id v61;
  uint64_t *v62;
  uint64_t *v63;
  SEL v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  uint8_t buf[4];
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v52 = a4;
  v82 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v57 = a5;
  v56 = a6;
  if (-[CPLRecordChange changeType](self, "changeType") != 1024)
  {
    v54 = self;
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 0;
    v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = (void *)objc_msgSend(v55, "mutableCopy");
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "recordViewsWithRelatedScopedIdentifier:class:", v11, objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__9654;
    v73 = __Block_byref_object_dispose__9655;
    v74 = 0;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v66 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(v16, "scopedIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v10, "removeObjectForKey:", v17);
            if (objc_msgSend(v18, "changeType") == 1024)
            {
              *((_BYTE *)v76 + 24) = 1;
              goto LABEL_22;
            }
            objc_msgSend(v18, "relation");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v70[5])
            {
              objc_msgSend(v18, "recordModificationDate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                v24 = (void *)v70[5];
                objc_msgSend(v18, "recordModificationDate");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "laterDate:", v25);
                v26 = objc_claimAutoreleasedReturnValue();
                v27 = (void *)v70[5];
                v70[5] = v26;

                goto LABEL_17;
              }
            }
            else
            {
              objc_msgSend(v18, "recordModificationDate");
              v28 = objc_claimAutoreleasedReturnValue();
              v25 = (void *)v70[5];
              v70[5] = v28;
LABEL_17:

            }
            if (!v22)
            {
              if (!_CPLSilentLogging)
              {
                __CPLStorageOSLogDomain_9628();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v80 = v18;
                  _os_log_impl(&dword_1B03C2000, v49, OS_LOG_TYPE_ERROR, "%@ has no relation", buf, 0xCu);
                }

              }
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLClientCacheView_Extensions.m");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v54, v51, 513, CFSTR("%@ has no relation"), v18);

              abort();
            }
            objc_msgSend(v16, "relation");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v22, "isEqual:", v29);

            if ((v30 & 1) == 0)
              *((_BYTE *)v76 + 24) = 1;
            objc_msgSend(v59, "addObject:", v22);

            goto LABEL_22;
          }
          objc_msgSend(v16, "relation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (v20)
          {
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_9628();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v80 = v16;
                _os_log_impl(&dword_1B03C2000, v46, OS_LOG_TYPE_ERROR, "%@ in client cache has no relation", buf, 0xCu);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLClientCacheView_Extensions.m");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, v54, v48, 496, CFSTR("%@ in client cache has no relation"), v16);

            abort();
          }
          objc_msgSend(v16, "relation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addObject:", v21);

LABEL_22:
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      }
      while (v13);
    }

    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __113__CPLAssetChange_CPLClientCacheView__compactedChangeWithRelatedChanges_isOnlyChange_fullRecord_usingStorageView___block_invoke;
    v60[3] = &unk_1E60D9CB0;
    v62 = &v75;
    v63 = &v69;
    v64 = a2;
    v60[4] = v54;
    v31 = v59;
    v61 = v31;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v60);
    if (v57)
    {
      objc_msgSend(v57, "setContainerRelations:", v31);
      if (v70[5])
      {
        objc_msgSend(v57, "recordModificationDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        v34 = v70[5];
        if (v32)
        {
          objc_msgSend(v32, "laterDate:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setRecordModificationDate:", v35);

        }
        else
        {
          objc_msgSend(v57, "setRecordModificationDate:", v34);
        }

      }
    }
    if (v52)
    {
      if (*((_BYTE *)v76 + 24))
      {
        v36 = (void *)objc_opt_class();
        -[CPLRecordChange scopedIdentifier](v54, "scopedIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (CPLAssetChange *)objc_msgSend(v36, "newChangeWithScopedIdentifier:changeType:", v37, 16);

        if (objc_msgSend(v31, "count"))
          -[CPLItemChange setContainerRelations:](v38, "setContainerRelations:", v31);
        goto LABEL_44;
      }
      v38 = 0;
    }
    else
    {
      if (-[CPLRecordChange isFullRecord](v54, "isFullRecord"))
      {
        if (objc_msgSend(v31, "count"))
          -[CPLItemChange setContainerRelations:](v54, "setContainerRelations:", v31);
      }
      else if (*((_BYTE *)v76 + 24))
      {
        v38 = (CPLAssetChange *)-[CPLAssetChange copy](v54, "copy");
        if (objc_msgSend(v31, "count"))
          -[CPLItemChange setContainerRelations:](v38, "setContainerRelations:", v31);
        v39 = -[CPLRecordChange changeType](v38, "changeType");
        if (v39)
          v40 = v39 | 0x10;
        else
          v40 = 0;
        -[CPLRecordChange setChangeType:](v38, "setChangeType:", v40);
LABEL_44:
        if (!v38)
          goto LABEL_52;
LABEL_47:
        if (v70[5])
        {
          -[CPLRecordChange recordModificationDate](v38, "recordModificationDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            -[CPLRecordChange recordModificationDate](v38, "recordModificationDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "laterDate:", v70[5]);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLRecordChange setRecordModificationDate:](v38, "setRecordModificationDate:", v43);

          }
          else
          {
            -[CPLRecordChange setRecordModificationDate:](v38, "setRecordModificationDate:", v70[5]);
          }
        }
        goto LABEL_52;
      }
      v38 = v54;
      if (v38)
        goto LABEL_47;
    }
LABEL_52:
    v44 = v61;
    v9 = v38;

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v75, 8);
    goto LABEL_53;
  }
  v9 = self;
LABEL_53:

  return v9;
}

void __113__CPLAssetChange_CPLClientCacheView__compactedChangeWithRelatedChanges_isOnlyChange_fullRecord_usingStorageView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  if (objc_msgSend(v6, "changeType") == 1024)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_9628();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Trying to delete an inexisting relation: %@", buf, 0xCu);
      }

    }
    goto LABEL_14;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(v6, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(v6, "recordModificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v10;
    goto LABEL_11;
  }

  if (v11)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v6, "recordModificationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "laterDate:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

LABEL_11:
  }
  if (!v8)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_9628();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = 0;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "%@ in client cache has no relation", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 64);
    v21 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLClientCacheView_Extensions.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v20, v21, v22, 539, CFSTR("%@ in client cache has no relation"), 0);

    abort();
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

LABEL_14:
}

- (BOOL)validateRecordForTracker:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  CPLScopedIdentifier *v14;
  void *v15;
  CPLAssetChange *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  BOOL v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t buf[4];
  CPLAssetChange *v35;
  __int16 v36;
  CPLAssetChange *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CPLAssetChange;
  if (!-[CPLRecordChange validateRecordForTracker:](&v33, sel_validateRecordForTracker_, v4))
    goto LABEL_39;
  if (-[CPLRecordChange isFullRecord](self, "isFullRecord"))
  {
    -[CPLAssetChange masterScopedIdentifier](self, "masterScopedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ((objc_msgSend(v4, "knowsClientRecordWithScopedIdentifier:", v5) & 1) != 0)
      {

        goto LABEL_6;
      }
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_14133();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_DEFAULT, "Client pushed an asset but we need the master too: %@", buf, 0xCu);
        }

      }
      objc_msgSend(v4, "pushChangeTasks");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      v24 = 4;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_14133();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          v20 = "Client pushed an asset with no master identifier: %@";
LABEL_30:
          _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
        }
LABEL_31:

      }
LABEL_32:
      objc_msgSend(v4, "pushChangeTasks");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      v24 = 0;
    }
    objc_msgSend(v23, "addTask:forRecordWithScopedIdentifier:", v24, v22);

LABEL_39:
    v26 = 0;
    goto LABEL_42;
  }
LABEL_6:
  if (-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 16))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[CPLItemChange containerRelations](self, "containerRelations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v30;
      v10 = 1;
      *(_QWORD *)&v7 = 138412546;
      v28 = v7;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "containerIdentifier", v28);
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12
            || (v13 = (void *)v12,
                v14 = [CPLScopedIdentifier alloc],
                -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier"),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                v16 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v14, "initRelativeToScopedIdentifier:identifier:", v15, v13), v15, v13, !v16))
          {
            if (_CPLSilentLogging)
              goto LABEL_32;
            __CPLSessionOSLogDomain_14133();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v35 = self;
              v20 = "Client pushed a relation with no album in an asset: %@";
              goto LABEL_30;
            }
            goto LABEL_31;
          }
          if ((objc_msgSend(v4, "knowsClientRecordWithScopedIdentifier:", v16) & 1) == 0)
          {
            if (!_CPLSilentLogging)
            {
              __CPLSessionOSLogDomain_14133();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v28;
                v35 = v16;
                v36 = 2112;
                v37 = self;
                _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "Client pushed an asset belonging in an unknown album %@: %@", buf, 0x16u);
              }

            }
            objc_msgSend(v4, "pushChangeTasks");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addTask:forRecordWithScopedIdentifier:", 5, v16);

            v10 = 0;
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v8)
          continue;
        break;
      }

      if ((v10 & 1) == 0)
        goto LABEL_39;
    }
    else
    {

    }
  }
  v26 = 1;
LABEL_42:

  return v26;
}

- (CPLAssetChange)init
{
  CPLAssetChange *v2;
  CPLAssetChange *v3;
  NSArray *keywords;
  NSArray *v5;
  NSArray *resources;
  NSArray *people;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLAssetChange;
  v2 = -[CPLItemChange init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    keywords = v2->_keywords;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_keywords = (NSArray *)MEMORY[0x1E0C9AA60];

    resources = v3->_resources;
    v3->_resources = v5;

    people = v3->_people;
    v3->_people = v5;

  }
  return v3;
}

- (id)fingerprintScheme
{
  CPLFingerprintScheme *fingerprintScheme;
  CPLFingerprintScheme *v4;
  CPLFingerprintScheme *v5;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  CPLAssetChange *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  fingerprintScheme = self->_fingerprintScheme;
  if (!fingerprintScheme)
  {
    if (!self->_masterIdentifier)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v14 = v9;
          v15 = 2112;
          v16 = self;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "%@ called on %@ with master identifier not set", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLAssetChange.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 123, CFSTR("%@ called on %@ with master identifier not set"), v12, self);

      abort();
    }
    +[CPLFingerprintScheme fingerprintSchemeForMasterIdentifier:](CPLFingerprintScheme, "fingerprintSchemeForMasterIdentifier:");
    v4 = (CPLFingerprintScheme *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fingerprintScheme;
    self->_fingerprintScheme = v4;

    fingerprintScheme = self->_fingerprintScheme;
  }
  return fingerprintScheme;
}

- (id)propertiesDescription
{
  CPLAssetChange *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  __CFString *v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  __CFString *v29;
  const char *v30;
  void *v31;
  void *v33;
  const char *v34;
  void *v35;
  unint64_t v36;
  __CFString *v37;
  CPLAssetChange *v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v2 = self;
  v46 = *MEMORY[0x1E0C80C00];
  v3 = -[CPLRecordChange changeType](self, "changeType");
  -[CPLItemChange containerDescription](v2, "containerDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange resourcesDescription](v2, "resourcesDescription");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v3 || (v3 & 8) != 0)
  {
    v9 = " / ";
    -[CPLAssetChange adjustments](v2, "adjustments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = "";
    if (!objc_msgSend(v4, "length"))
      v9 = "";
    if (objc_msgSend(v6, "length"))
      v11 = " ";
    if (v8)
    {
      objc_msgSend(v8, "adjustmentSimpleDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      v7 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR("%s%@%s%@"), v9, v6, v11, v12);

      v6 = (void *)v12;
    }
    else
    {
      v7 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR("%s%@%s%@"), v9, v6, v11, CFSTR("no adj."));
    }

  }
  else
  {
    v7 = &stru_1E60DF6B8;
    v8 = (void *)v5;
  }

  if (!v3 || (v3 & 0x20) != 0)
  {
    v14 = " / ";
    if (!objc_msgSend(v4, "length") && !-[__CFString length](v7, "length"))
      v14 = "";
    -[CPLAssetChange faces](v2, "faces");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "faces");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") | v3)
    {
      v33 = v16;
      v34 = v14;
      v36 = v3;
      v37 = v7;
      v38 = v2;
      v39 = v4;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v35 = v15;
      objc_msgSend(v15, "faces");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v17)
      {
        v18 = v17;
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v23 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v42 != v23)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            v26 = objc_msgSend(v25, "isKeyFace");
            if (objc_msgSend(v25, "isManual"))
            {
              ++v20;
            }
            else
            {
              objc_msgSend(v25, "personIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
                ++v22;
            }
            v19 += v26;
            objc_msgSend(v25, "rejectedPersonIdentifiers");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v21 += objc_msgSend(v28, "count");

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v18);
      }
      else
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
      }

      v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%sfaces: %lu conf., %lu rej., %lu man., %lu key"), v34, v22, v21, v20, v19);
      v2 = v38;
      v4 = v39;
      v3 = v36;
      v7 = v37;
      v15 = v35;
      v16 = v33;
    }
    else
    {
      v13 = &stru_1E60DF6B8;
    }

    if (!v3)
      goto LABEL_37;
  }
  else
  {
    v13 = &stru_1E60DF6B8;
  }
  if ((v3 & 2) == 0)
  {
    v29 = &stru_1E60DF6B8;
    goto LABEL_43;
  }
LABEL_37:
  if (objc_msgSend(v4, "length"))
  {
    v30 = ", ";
  }
  else
  {
    v30 = ", ";
    if (!-[__CFString length](v7, "length") && !-[__CFString length](v13, "length"))
      v30 = "";
  }
  v29 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("master: %@%s"), v2->_masterIdentifier, v30);
LABEL_43:
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@%@%@"), v29, v4, v7, v13);

  return v31;
}

- (id)propertiesForChangeType:(unint64_t)a3
{
  void *v5;
  id v6;
  objc_super v8;

  if (propertiesForChangeType__onceToken_16612 != -1)
    dispatch_once(&propertiesForChangeType__onceToken_16612, &__block_literal_global_34);
  if (a3 == 32)
  {
    v5 = (void *)propertiesForChangeType__facesProperties;
  }
  else
  {
    if (a3 != 8)
    {
      v8.receiver = self;
      v8.super_class = (Class)CPLAssetChange;
      -[CPLItemChange propertiesForChangeType:](&v8, sel_propertiesForChangeType_, a3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    v5 = (void *)propertiesForChangeType__resourceProperties;
  }
  v6 = v5;
  return v6;
}

- (id)masterScopedIdentifier
{
  void *v3;
  CPLScopedIdentifier *v4;
  void *v5;
  id v6;

  -[CPLAssetChange masterIdentifier](self, "masterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [CPLScopedIdentifier alloc];
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v4, "initRelativeToScopedIdentifier:identifier:", v5, v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setMasterScopedIdentifier:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(v21, "scopeIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v5 && v7)
  {
    v8 = objc_msgSend((id)v5, "isEqual:", v7);

    if ((v8 & 1) == 0)
      goto LABEL_4;
  }
  else
  {

    if (v5 | v7)
    {
LABEL_4:
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "scopeIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scopeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v23 = v10;
          v24 = 2112;
          v25 = v12;
          v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLAssetChange.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scopeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 226, CFSTR("Invalid call to %@ with mismatched scope: %@ vs. %@"), v16, v18, v19);

      abort();
    }
  }
  objc_msgSend(v21, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLAssetChange setMasterIdentifier:](self, "setMasterIdentifier:", v20);

}

- (void)setResources:(id)a3
{
  id v5;
  NSArray *v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSArray *resources;
  NSArray *v17;
  NSDictionary *resourcePerResourceType;
  NSDictionary *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v5 = a3;
  +[CPLResource normalizedResourcesFromResources:resourcePerResourceType:](CPLResource, "normalizedResourcesFromResources:resourcePerResourceType:", v5, &v20);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7 = (NSDictionary *)v20;
  v8 = -[NSArray count](v6, "count");
  v9 = objc_msgSend(v5, "count");

  if (v8 != v9 && _CPLSilentLogging == 0)
  {
    __CPLGenericOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v12;
      v23 = 2112;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "<%@ %@> %{public}@ got duplicate or incorrect resource types", buf, 0x20u);

    }
  }
  resources = self->_resources;
  self->_resources = v6;
  v17 = v6;

  resourcePerResourceType = self->_resourcePerResourceType;
  self->_resourcePerResourceType = v7;
  v19 = v7;

}

- (id)resourceForType:(unint64_t)a3
{
  NSDictionary *resourcePerResourceType;
  void *v4;
  void *v5;
  objc_super v7;

  resourcePerResourceType = self->_resourcePerResourceType;
  if (resourcePerResourceType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](resourcePerResourceType, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLAssetChange;
    -[CPLRecordChange resourceForType:](&v7, sel_resourceForType_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)copyDerivativesFromRecordIfPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  unint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isAssetChange"))
  {
    -[CPLAssetChange adjustments](self, "adjustments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v4, "adjustments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "otherAdjustmentsFingerprint");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "otherAdjustmentsFingerprint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (unint64_t)v8;
      if (v7 && v8)
      {
        v10 = objc_msgSend((id)v7, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_28;
LABEL_9:
        -[NSDictionary objectForKeyedSubscript:](self->_resourcePerResourceType, "objectForKeyedSubscript:", &unk_1E611A2A0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fingerPrint");
        v13 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "resourceForType:", 13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fingerPrint");
        v16 = objc_claimAutoreleasedReturnValue();

        if (v13 && v16)
        {
          if ((objc_msgSend((id)v13, "isEqual:", v16) & 1) == 0)
            goto LABEL_27;
        }
        else if (v13 | v16)
        {
LABEL_27:

          goto LABEL_28;
        }
        v17 = (id)-[NSDictionary mutableCopy](self->_resourcePerResourceType, "mutableCopy");
        if (!v17)
          v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v18 = objc_msgSend(v17, "count");
        -[CPLRecordChange copyDerivatives:count:avoidResourceType:fromRecord:inResourcePerType:](self, "copyDerivatives:count:avoidResourceType:fromRecord:inResourcePerType:", &copyDerivativesFromRecordIfPossible__originalDerivativesImageAndVideo_16599, 9, 0, v4, v17);
        if (v18 >= objc_msgSend(v17, "count"))
        {
          if (_CPLSilentLogging)
          {
LABEL_26:

            goto LABEL_27;
          }
          __CPLGenericOSLogDomain();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v29 = (void *)objc_opt_class();
            v33 = v29;
            objc_msgSend(v4, "scopedIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_opt_class();
            v31 = v25;
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v35 = (unint64_t)v29;
            v36 = 2112;
            v37 = v24;
            v38 = 2112;
            v39 = v25;
            v40 = 2112;
            v41 = v26;
            _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_DEFAULT, "Found no derivatives to copy from <%@ %@> to <%@ %@>", buf, 0x2Au);

          }
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            __CPLGenericOSLogDomain();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v28 = objc_msgSend(v17, "count") - v18;
              v27 = (void *)objc_opt_class();
              v32 = v27;
              objc_msgSend(v4, "scopedIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)objc_opt_class();
              v30 = v21;
              -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
              *(_DWORD *)buf = 134219010;
              v35 = v28;
              v36 = 2112;
              v37 = v27;
              v38 = 2112;
              v39 = v20;
              v40 = 2112;
              v41 = v21;
              v42 = 2112;
              v43 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)v43;
              _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "Automatically copied %lu derivatives from <%@ %@> to <%@ %@>", buf, 0x34u);

            }
          }
          objc_msgSend(v17, "allValues", v27);
          v23 = objc_claimAutoreleasedReturnValue();
          -[CPLAssetChange setResources:](self, "setResources:", v23);
        }

        goto LABEL_26;
      }

      if (!(v7 | v9))
        goto LABEL_9;
    }
LABEL_28:

    goto LABEL_29;
  }
LABEL_30:

}

- (void)setKeywords:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *keywords;
  NSArray *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
    v7 = objc_msgSend(v6, "count");
    if (v7 != objc_msgSend(v5, "count") && _CPLSilentLogging == 0)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_opt_class();
        v11 = v10;
        -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v10;
        v19 = 2112;
        v20 = v12;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "<%@ %@> %@ got duplicate keywords", (uint8_t *)&v17, 0x20u);

      }
    }
    +[CPLAssetKeywordSortDescriptor sortedKeywordsForKeywordSet:](CPLAssetKeywordSortDescriptor, "sortedKeywordsForKeywordSet:", v6);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    keywords = self->_keywords;
    self->_keywords = v14;

  }
  else
  {
    v16 = self->_keywords;
    self->_keywords = (NSArray *)MEMORY[0x1E0C9AA60];

  }
}

- (void)setPeople:(id)a3
{
  NSArray *v4;
  NSArray *people;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_71_16581);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    people = self->_people;
    self->_people = v4;
  }
  else
  {
    people = self->_people;
    self->_people = (NSArray *)MEMORY[0x1E0C9AA60];
  }

}

- (int64_t)dequeueOrder
{
  void *v3;
  void *v4;
  double v5;
  int64_t v6;
  objc_super v8;

  -[CPLAssetChange assetDate](self, "assetDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[CPLAssetChange assetDate](self, "assetDate");
  else
    -[CPLAssetChange addedDate](self, "addedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLAssetChange;
    v5 = (double)-[CPLRecordChange dequeueOrder](&v8, sel_dequeueOrder);
  }
  v6 = (uint64_t)v5;

  return v6;
}

- (id)allRelatedScopedIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  CPLScopedIdentifier *v13;
  void *v14;
  id v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  CPLScopedIdentifier *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)CPLAssetChange;
  -[CPLRecordChange allRelatedScopedIdentifiers](&v36, sel_allRelatedScopedIdentifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLAssetChange faces](self, "faces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || -[NSArray count](self->_people, "count"))
  {
    v27 = v3;
    v3 = (void *)objc_msgSend(v3, "mutableCopy");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v26 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "personIdentifier");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            v13 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v13, "initRelativeToScopedIdentifier:identifier:", v14, v12);

            if (v15)
            {
              objc_msgSend(v3, "addObject:", v15);

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v8);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = self->_people;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "personIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v22, "initRelativeToScopedIdentifier:identifier:", v23, v21);

            objc_msgSend(v3, "addObject:", v24);
          }

        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v18);
    }

    if (v27)
      objc_msgSend(v3, "unionSet:", v27);

    v5 = v26;
  }

  return v3;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  uint64_t v6;
  void *v8;
  objc_super v9;

  if (sel_assetHDRType == a3)
    return &__block_literal_global_82_16576;
  if (sel_originalChoice == a3)
    return &__block_literal_global_85;
  if (sel_assetDate == a3 || sel_facesData == a3 || sel_timeZoneOffset == a3 || sel_mediaGroupIdentifier == a3)
  {
    v6 = _CPLDefaultValueObjectNil;
LABEL_33:
    v8 = (void *)MEMORY[0x1B5E08DC4](v6, a2);
    return v8;
  }
  if (sel_people == a3
    || sel_videoComplementDurationValue == a3
    || sel_videoComplementDurationTimescale == a3
    || sel_videoComplementImageDisplayValue == a3
    || sel_videoComplementImageDisplayTimescale == a3
    || sel_videoComplementVisibilityState == a3
    || sel_playCount == a3
    || sel_shareCount == a3
    || sel_viewCount == a3
    || sel_customRenderedValue == a3
    || sel_viewPresentation == a3)
  {
    v6 = _CPLDefaultValueNSINTEGER0;
    goto LABEL_33;
  }
  if (sel_assetSubtype == a3)
    return &__block_literal_global_116;
  if (sel_keywords == a3)
    return &__block_literal_global_119_16577;
  if (sel_trashedReason == a3)
    return &__block_literal_global_122_16578;
  v9.receiver = self;
  v9.super_class = (Class)CPLAssetChange;
  -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](&v9, sel_checkDefaultValueBlockForPropertyWithSelector_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (BOOL)validateFullRecord
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLAssetChange;
  v3 = -[CPLRecordChange validateFullRecord](&v5, sel_validateFullRecord);
  if (v3)
    LOBYTE(v3) = self->_masterIdentifier != 0;
  return v3;
}

- (BOOL)validateChangeWithError:(id *)a3
{
  _BOOL4 v5;
  NSString *masterIdentifier;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLAssetChange;
  v5 = -[CPLRecordChange validateChangeWithError:](&v9, sel_validateChangeWithError_);
  if (v5)
  {
    if (-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 2))
    {
      masterIdentifier = self->_masterIdentifier;
      LOBYTE(v5) = masterIdentifier != 0;
      if (a3 && !masterIdentifier)
      {
        +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 18, CFSTR("%@ has no master identifier"), self);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v5) = 0;
        *a3 = v7;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setFaces:(id)a3
{
  id v4;
  uint64_t v5;
  id *p_facesData;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
  {
    p_facesData = (id *)&self->_facesData;
LABEL_5:
    v8 = *p_facesData;
    *p_facesData = 0;

    goto LABEL_6;
  }
  objc_msgSend(v4, "data");
  v5 = objc_claimAutoreleasedReturnValue();
  p_facesData = (id *)&self->_facesData;
  v7 = *p_facesData;
  *p_facesData = (id)v5;

  if (!objc_msgSend(*p_facesData, "length"))
    goto LABEL_5;
LABEL_6:

}

- (CPLFaceAnalysisReference)faces
{
  CPLFaceAnalysisReference *v2;

  if (self->_facesData)
    v2 = -[CPLFaceAnalysisReference initWithData:]([CPLFaceAnalysisReference alloc], "initWithData:", self->_facesData);
  else
    v2 = 0;
  return v2;
}

- (void)setFacesData:(id)a3
{
  NSData *v4;
  NSData *facesData;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v4 = (NSData *)objc_msgSend(v6, "copy");
    facesData = self->_facesData;
    self->_facesData = v4;
  }
  else
  {
    facesData = self->_facesData;
    self->_facesData = 0;
  }

}

- (BOOL)canLowerQuota
{
  _BOOL4 v3;

  if (-[CPLRecordChange isDelete](self, "isDelete"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[CPLRecordChange hasChangeType:](self, "hasChangeType:", 2);
    if (v3)
      LOBYTE(v3) = -[CPLRecordChange inTrash](self, "inTrash");
  }
  return v3;
}

- (unint64_t)fullChangeTypeForFullRecord
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLAssetChange;
  return -[CPLRecordChange fullChangeTypeForFullRecord](&v3, sel_fullChangeTypeForFullRecord) | 0x20;
}

- (unint64_t)supportedChangeTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLAssetChange;
  return -[CPLRecordChange supportedChangeTypes](&v3, sel_supportedChangeTypes) | 0x10;
}

- (id)scopeIdentifiersForQuarantine
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPLRecordChange isFullRecord](self, "isFullRecord"))
  {
    v8[0] = v3;
    -[CPLAssetChange masterScopedIdentifier](self, "masterScopedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)isAssetChange
{
  return 1;
}

- (NSString)masterIdentifier
{
  return self->_masterIdentifier;
}

- (void)setMasterIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDate)lastSharedDate
{
  return self->_lastSharedDate;
}

- (void)setLastSharedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSDate)addedDate
{
  return self->_addedDate;
}

- (void)setAddedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSDate)assetDate
{
  return self->_assetDate;
}

- (void)setAssetDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)resources
{
  return self->_resources;
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)extendedDescription
{
  return self->_extendedDescription;
}

- (void)setExtendedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (NSString)adjustedMediaMetaDataType
{
  return self->_adjustedMediaMetaDataType;
}

- (void)setAdjustedMediaMetaDataType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSData)adjustedMediaMetaData
{
  return self->_adjustedMediaMetaData;
}

- (void)setAdjustedMediaMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_adjustedMediaMetaData, a3);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (void)setTimeZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSNumber)timeZoneOffset
{
  return self->_timeZoneOffset;
}

- (void)setTimeZoneOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (unint64_t)burstFlags
{
  return self->_burstFlags;
}

- (void)setBurstFlags:(unint64_t)a3
{
  self->_burstFlags = a3;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (void)setBurstIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)mediaGroupIdentifier
{
  return self->_mediaGroupIdentifier;
}

- (void)setMediaGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (int64_t)videoComplementDurationValue
{
  return self->_videoComplementDurationValue;
}

- (void)setVideoComplementDurationValue:(int64_t)a3
{
  self->_videoComplementDurationValue = a3;
}

- (int64_t)videoComplementDurationTimescale
{
  return self->_videoComplementDurationTimescale;
}

- (void)setVideoComplementDurationTimescale:(int64_t)a3
{
  self->_videoComplementDurationTimescale = a3;
}

- (int64_t)videoComplementImageDisplayValue
{
  return self->_videoComplementImageDisplayValue;
}

- (void)setVideoComplementImageDisplayValue:(int64_t)a3
{
  self->_videoComplementImageDisplayValue = a3;
}

- (int64_t)videoComplementImageDisplayTimescale
{
  return self->_videoComplementImageDisplayTimescale;
}

- (void)setVideoComplementImageDisplayTimescale:(int64_t)a3
{
  self->_videoComplementImageDisplayTimescale = a3;
}

- (unint64_t)videoComplementVisibilityState
{
  return self->_videoComplementVisibilityState;
}

- (void)setVideoComplementVisibilityState:(unint64_t)a3
{
  self->_videoComplementVisibilityState = a3;
}

- (unint64_t)assetSubtype
{
  return self->_assetSubtype;
}

- (void)setAssetSubtype:(unint64_t)a3
{
  self->_assetSubtype = a3;
}

- (unint64_t)assetHDRType
{
  return self->_assetHDRType;
}

- (void)setAssetHDRType:(unint64_t)a3
{
  self->_assetHDRType = a3;
}

- (CPLAdjustments)adjustments
{
  return self->_adjustments;
}

- (void)setAdjustments:(id)a3
{
  objc_storeStrong((id *)&self->_adjustments, a3);
}

- (unint64_t)originalChoice
{
  return self->_originalChoice;
}

- (void)setOriginalChoice:(unint64_t)a3
{
  self->_originalChoice = a3;
}

- (int64_t)customRenderedValue
{
  return self->_customRenderedValue;
}

- (void)setCustomRenderedValue:(int64_t)a3
{
  self->_customRenderedValue = a3;
}

- (NSArray)people
{
  return self->_people;
}

- (int64_t)facesVersion
{
  return self->_facesVersion;
}

- (void)setFacesVersion:(int64_t)a3
{
  self->_facesVersion = a3;
}

- (NSString)facesAdjustmentsFingerprint
{
  return self->_facesAdjustmentsFingerprint;
}

- (void)setFacesAdjustmentsFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (CPLPlaceAnnotation)placeAnnotation
{
  return self->_placeAnnotation;
}

- (void)setPlaceAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_placeAnnotation, a3);
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (int64_t)shareCount
{
  return self->_shareCount;
}

- (void)setShareCount:(int64_t)a3
{
  self->_shareCount = a3;
}

- (int64_t)viewCount
{
  return self->_viewCount;
}

- (void)setViewCount:(int64_t)a3
{
  self->_viewCount = a3;
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (void)setLastViewedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastViewedDate, a3);
}

- (signed)viewPresentation
{
  return self->_viewPresentation;
}

- (void)setViewPresentation:(signed __int16)a3
{
  self->_viewPresentation = a3;
}

- (NSString)syndicationIdentifier
{
  return self->_syndicationIdentifier;
}

- (void)setSyndicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (int64_t)sharedLibrarySharingState
{
  return self->_sharedLibrarySharingState;
}

- (void)setSharedLibrarySharingState:(int64_t)a3
{
  self->_sharedLibrarySharingState = a3;
}

- (NSString)deletedByUserIdentifier
{
  return self->_deletedByUserIdentifier;
}

- (void)setDeletedByUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (unsigned)trashedReason
{
  return self->_trashedReason;
}

- (void)setTrashedReason:(unsigned __int16)a3
{
  self->_trashedReason = a3;
}

- (NSString)computeStateVersion
{
  return self->_computeStateVersion;
}

- (void)setComputeStateVersion:(id)a3
{
  objc_storeStrong((id *)&self->_computeStateVersion, a3);
}

- (NSString)computeStateAdjustmentFingerprint
{
  return self->_computeStateAdjustmentFingerprint;
}

- (void)setComputeStateAdjustmentFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_computeStateAdjustmentFingerprint, a3);
}

- (NSDate)computeStateLastUpdatedDate
{
  return self->_computeStateLastUpdatedDate;
}

- (void)setComputeStateLastUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_computeStateLastUpdatedDate, a3);
}

- (NSData)facesData
{
  return self->_facesData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facesData, 0);
  objc_storeStrong((id *)&self->_computeStateLastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_computeStateAdjustmentFingerprint, 0);
  objc_storeStrong((id *)&self->_computeStateVersion, 0);
  objc_storeStrong((id *)&self->_deletedByUserIdentifier, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_lastViewedDate, 0);
  objc_storeStrong((id *)&self->_placeAnnotation, 0);
  objc_storeStrong((id *)&self->_facesAdjustmentsFingerprint, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_adjustments, 0);
  objc_storeStrong((id *)&self->_mediaGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_timeZoneOffset, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_adjustedMediaMetaData, 0);
  objc_storeStrong((id *)&self->_adjustedMediaMetaDataType, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_extendedDescription, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_assetDate, 0);
  objc_storeStrong((id *)&self->_addedDate, 0);
  objc_storeStrong((id *)&self->_lastSharedDate, 0);
  objc_storeStrong((id *)&self->_masterIdentifier, 0);
  objc_storeStrong((id *)&self->_fingerprintScheme, 0);
  objc_storeStrong((id *)&self->_resourcePerResourceType, 0);
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "trashedReason") == 0;
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "keywords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetSubtype") == 0;
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "originalChoice") == 0;
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetHDRType") == 0;
}

uint64_t __28__CPLAssetChange_setPeople___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "personIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend(v6, "compare:", v7);
  }
  else if (v6)
  {
    if (v7)
    {
      v9 = 0;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v13 = 138412290;
          v14 = v5;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Found empty person identifier for %@", (uint8_t *)&v13, 0xCu);
        }

      }
      v9 = 1;
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Found empty person identifier for %@", (uint8_t *)&v13, 0xCu);
      }

    }
    v9 = -1;
  }

  return v9;
}

void __42__CPLAssetChange_propertiesForChangeType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("adjustments"), CFSTR("adjustedMediaMetaData"), CFSTR("adjustedMediaMetaDataType"), CFSTR("resources"), CFSTR("resourceCopyFromScopedIdentifier"), CFSTR("orientation"), CFSTR("duration"), CFSTR("originalChoice"), 0);
  v1 = (void *)propertiesForChangeType__resourceProperties;
  propertiesForChangeType__resourceProperties = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("facesData"), CFSTR("facesVersion"), CFSTR("facesAdjustmentsFingerprint"), 0);
  v3 = (void *)propertiesForChangeType__facesProperties;
  propertiesForChangeType__facesProperties = v2;

}

+ (id)equalityBlockForDirection:(unint64_t)a3
{
  void *v3;

  v3 = &__block_literal_global_7;
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return &__block_literal_global_16668;
  else
    return v3;
}

+ (id)copyPropertyBlockForDirection:(unint64_t)a3
{
  if (a3 == 1)
    return &__block_literal_global_9;
  else
    return 0;
}

+ (BOOL)supportsResources
{
  return 1;
}

+ (BOOL)supportsResourceType:(unint64_t)a3
{
  return a3 != 10;
}

+ (BOOL)requiresStableHashForResourceType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL result;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  result = 1;
  if (a3 != 2 && a3 != 16)
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLAssetChange;
    return objc_msgSendSuper2(&v7, sel_requiresStableHashForResourceType_);
  }
  return result;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (BOOL)supportsSharingScopedIdentifier
{
  return 1;
}

uint64_t __48__CPLAssetChange_copyPropertyBlockForDirection___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, char *a7)
{
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v10 = a2;
  if (sel_facesData == a7)
  {
    v12 = a3;
    objc_msgSend(a4, "facesData");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "facesData");
    v14 = objc_claimAutoreleasedReturnValue();

    if (v13 && v14)
    {
      if ((objc_msgSend((id)v13, "isEqual:", v14) & 1) != 0)
        goto LABEL_10;
    }
    else if (!(v13 | v14))
    {
      goto LABEL_10;
    }
    if (_CPLFacesDataAreAlmostIdentical((void *)v13, (void *)v14))
    {
      objc_msgSend(v10, "setFacesData:", v13);
      v11 = 1;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

uint64_t __44__CPLAssetChange_equalityBlockForDirection___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, char *a5)
{
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;

  if (sel_facesData == a5)
  {
    v9 = a3;
    objc_msgSend(a2, "facesData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "facesData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (_CPLFacesDataAreAlmostIdentical(v10, v11))
      v7 = 2;
    else
      v7 = 1;

  }
  else if (sel_computeStateLastUpdatedDate == a5
         || sel_computeStateAdjustmentFingerprint == a5
         || sel_computeStateVersion == a5)
  {
    return 2;
  }
  else
  {
    return 0;
  }
  return v7;
}

uint64_t __44__CPLAssetChange_equalityBlockForDirection___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, char *a5)
{
  uint64_t v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  CPLFaceAnalysisReference *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  if (sel_facesData == a5)
  {
    v7 = a3;
    objc_msgSend(a2, "facesData");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "facesData");
    v9 = objc_claimAutoreleasedReturnValue();

    if (!v8 || !v9)
    {
      if (v8 | v9)
        v5 = 1;
      else
        v5 = 2;
      goto LABEL_15;
    }
    if ((objc_msgSend((id)v8, "isEqual:", v9) & 1) == 0)
    {
      v5 = 1;
LABEL_15:

      return v5;
    }
    v10 = -[CPLFaceAnalysisReference initWithData:]([CPLFaceAnalysisReference alloc], "initWithData:", v9);
    -[CPLFaceAnalysis petFaceInstances](v10, "petFaceInstances");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {

    }
    else
    {
      -[CPLFaceAnalysis torsoFaceInstances](v10, "torsoFaceInstances");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (!v13)
      {
        v5 = 2;
        goto LABEL_14;
      }
    }
    v5 = 1;
LABEL_14:

    goto LABEL_15;
  }
  return 0;
}

+ (BOOL)serverSupportsVision
{
  return 1;
}

+ (BOOL)serverSupportsSharedLibrarySharingState
{
  return 1;
}

+ (BOOL)serverSupportsDeletedByUserIdentifier
{
  return 1;
}

+ (BOOL)serverSupportsLastViewedDate
{
  return 1;
}

+ (BOOL)serverSupportsComputeState
{
  return 0;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end
