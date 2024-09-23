@implementation CPLRecordStorageView

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[CPLRecordStorageView recordViewWithScopedIdentifier:](self, "recordViewWithScopedIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relatedScopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[CPLRecordStorageView recordViewWithScopedIdentifier:](self, "recordViewWithScopedIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CPLRecordStorageView recordViewsWithRelatedScopedIdentifier:class:](self, "recordViewsWithRelatedScopedIdentifier:class:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "count");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = v8;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          --v10;
        }
        while (v10);
        v5 += v8;
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)compactedBatchFromExpandedBatch:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  CPLChangeBatch *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  CPLChangeBatch *v39;
  id v41;
  CPLChangeBatch *v42;
  CPLChangeBatch *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v48[5];
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  CPLChangeBatch *v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  CPLRecordStorageView *v60;
  CPLChangeBatch *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v43 = objc_alloc_init(CPLChangeBatch);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v63;
    v46 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v63 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasChangeType:", 2, v41, v43) & 1) != 0)
        {
          objc_msgSend(v10, "relatedScopedIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
            goto LABEL_22;
        }
        else
        {
          objc_msgSend(v10, "scopedIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordStorageView relatedScopedIdentifierForRecordWithScopedIdentifier:](self, "relatedScopedIdentifierForRecordWithScopedIdentifier:", v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            goto LABEL_22;
        }
        objc_msgSend(v4, "objectForKey:", v11);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (id)v13;
          v15 = v8;
          objc_msgSend(v10, "scopedIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            v18 = _CPLSilentLogging == 0;
          else
            v18 = 0;
          if (v18)
          {
            __CPLStorageOSLogDomain_9628();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "objectForKey:", v16);
              v20 = v5;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v68 = v21;
              v69 = 2112;
              v70 = v10;
              _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Expanded batch contains changes for the same record twice: %@ vs. %@", buf, 0x16u);

              v5 = v20;
              v4 = v46;
            }

          }
          objc_msgSend(v14, "setObject:forKey:", v10, v16);
          v8 = v15;
        }
        else
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v4, "setObject:forKey:", v14, v11);
          objc_msgSend(v10, "scopedIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v10, v16);
        }

LABEL_22:
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v7);
  }

  v22 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke;
  v58[3] = &unk_1E60D9C38;
  v23 = v41;
  v59 = v23;
  v60 = self;
  v24 = v43;
  v61 = v24;
  v25 = (void *)MEMORY[0x1B5E08DC4](v58);
  v54[0] = v22;
  v54[1] = 3221225472;
  v54[2] = __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke_8;
  v54[3] = &unk_1E60D9C60;
  v42 = v24;
  v55 = v42;
  v45 = v23;
  v56 = v45;
  v44 = v25;
  v57 = v44;
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E08DC4](v54);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v27 = v5;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v51 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v32, "scopedIdentifier", v42);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "additionalRecordWithScopedIdentifier:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "compactedChangeWithRelatedChanges:isOnlyChange:fullRecord:usingStorageView:", v34, 0, v35, self);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          ((void (**)(_QWORD, void *, void *))v26)[2](v26, v36, v35);
        if (v34)
          objc_msgSend(v4, "removeObjectForKey:", v33);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    }
    while (v29);
  }

  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke_10;
  v48[3] = &unk_1E60D9C88;
  v48[4] = self;
  v49 = v26;
  v37 = v26;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v48);
  v38 = v49;
  v39 = v42;

  return v39;
}

- (id)localChangeBatchFromCloudBatch:(id)a3 usingMapping:(id)a4 withError:(id *)a5
{
  id v6;
  id v7;
  CPLChangeBatch *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  const __CFString *v36;
  NSObject *v37;
  const __CFString *v38;
  uint64_t v39;
  __int128 v41;
  void *v42;
  CPLChangeBatch *v43;
  void *v44;
  void *v45;
  id obj;
  char v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  NSObject *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CPLChangeBatch);
  objc_msgSend(v7, "engineStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quarantinedRecords");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudCache");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v10)
  {
    v12 = v10;
    v42 = v9;
    v13 = *(_QWORD *)v51;
    *(_QWORD *)&v11 = 138412546;
    v41 = v11;
    v43 = v8;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v51 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v14);
        if (objc_msgSend(v15, "changeType", v41) != 1024)
        {
          if (v7)
          {
            objc_msgSend(v15, "translateToClientChangeUsingIDMapping:error:", v7, a5);
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_14:
            v20 = v15;
          }
          v19 = v20;
          if (!v20)
          {
LABEL_65:

            v8 = 0;
            goto LABEL_66;
          }
          goto LABEL_16;
        }
        if (!v7)
          goto LABEL_14;
        v49 = 0;
        objc_msgSend(v15, "scopedIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v16, &v49);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
        }
        else
        {
          v18 = (void *)objc_msgSend(v16, "copy");
          v32 = objc_msgSend(v44, "hasRecordWithScopedIdentifier:", v16);
          if ((v32 & 1) == 0 && !objc_msgSend(v45, "isRecordWithScopedIdentifierQuarantined:", v18))
          {
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_9628();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v15;
                _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEFAULT, "Ignoring no-op delete for %@", buf, 0xCu);
              }
LABEL_61:

            }
            v24 = 0;
            v28 = 0;
            goto LABEL_41;
          }
          objc_msgSend(v7, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v18, &v49);
          v33 = objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v34 = v33;
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_9628();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v36 = CFSTR("quarantine");
                if (v32)
                  v36 = CFSTR("cloud cache");
                v55 = v15;
                v56 = 2112;
                v57 = v36;
                v58 = 2112;
                v59 = v34;
                _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_ERROR, "%@ has no ID mapping but exists in %@ but also as %@ for the client - ignoring this change", buf, 0x20u);
              }

              v8 = v43;
            }
            goto LABEL_61;
          }
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_9628();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v41;
              v38 = CFSTR("quarantine");
              if (v32)
                v38 = CFSTR("cloud cache");
              v55 = v15;
              v56 = 2112;
              v57 = v38;
              _os_log_impl(&dword_1B03C2000, v37, OS_LOG_TYPE_DEFAULT, "%@ has no ID mapping but exists in %@ - client will have to delete it if necessary", buf, 0x16u);
            }

            v8 = v43;
          }
        }
        v19 = (void *)objc_msgSend((id)objc_opt_class(), "newDeleteChangeWithScopedIdentifier:", v18);

        if (!v19)
          goto LABEL_65;
LABEL_16:
        objc_msgSend(v19, "scopedIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLRecordStorageView recordViewWithScopedIdentifier:](self, "recordViewWithScopedIdentifier:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "changeType") != 1024)
        {
          v29 = objc_msgSend(v19, "isFullRecord");
          if (v22)
          {
            if (v29)
            {
              v24 = v19;
            }
            else
            {
              objc_msgSend(v22, "changeForType:", ~objc_msgSend(v19, "changeType") & 0x7A);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (id)objc_msgSend(v31, "copy");

              objc_msgSend(v24, "applyChange:", v19);
              objc_msgSend(v24, "setChangeType:", 0);
            }
            goto LABEL_33;
          }
          if ((v29 & 1) == 0)
          {
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_9628();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v15;
                _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_ERROR, "Got a partial record %@ which is new to the cache", buf, 0xCu);
              }

            }
            objc_msgSend(v19, "setChangeType:", 0);
          }
LABEL_31:
          v24 = 0;
          goto LABEL_33;
        }
        v23 = objc_opt_class();
        if (v23 != objc_opt_class())
          goto LABEL_31;
        v24 = (id)objc_msgSend(v22, "recordClass");
        if (v24
          || (objc_msgSend(v19, "scopedIdentifier"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = (id)objc_msgSend(v45, "classForQuarantinedRecordWithScopedIdentifier:", v25),
              v25,
              v24))
        {
          objc_msgSend(v19, "scopedIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v24, "newDeleteChangeWithScopedIdentifier:", v26);

          v24 = 0;
          v28 = 0;
          v19 = (void *)v27;
          if (!v27)
            goto LABEL_41;
          goto LABEL_34;
        }
LABEL_33:

LABEL_34:
        objc_msgSend(v19, "setRecordChangeData:", 0);
        objc_msgSend(v19, "setSharingRecordChangeData:", 0);
        -[CPLChangeBatch addRecord:](v8, "addRecord:", v19);
        if (v24
          && (objc_msgSend(v19, "isFullRecord") & 1) == 0
          && (objc_msgSend(v19, "isDelete") & 1) == 0
          && ((objc_msgSend(v19, "isMasterChange") & 1) != 0 || objc_msgSend(v19, "isAssetChange")))
        {
          -[CPLChangeBatch _addAdditionalRecord:](v8, "_addAdditionalRecord:", v24);
        }
        v28 = v19;
LABEL_41:

        ++v14;
      }
      while (v12 != v14);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      v12 = v39;
      if (!v39)
      {
LABEL_66:
        v9 = v42;
        break;
      }
    }
  }

  return v8;
}

- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 record:(id *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[CPLRecordStorageView recordViewWithScopedIdentifier:](self, "recordViewWithScopedIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    if (a6)
    {
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 25, CFSTR("Record %@ does not exist"), v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v21 = 0;
      *a6 = v20;
      goto LABEL_23;
    }
LABEL_22:
    v21 = 0;
    goto LABEL_23;
  }
  if ((objc_msgSend(v11, "supportsResources") & 1) == 0)
  {
    if (a6)
    {
      +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("itemScopedIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_22;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v12, "changeForType:", 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v15)
  {
LABEL_11:

LABEL_20:
    if (a6)
    {
      +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 26, CFSTR("Record %@ has no resource of type %@"), v10, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_22;
  }
  v16 = v15;
  v17 = *(_QWORD *)v25;
LABEL_5:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v17)
      objc_enumerationMutation(v14);
    v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18);
    if (objc_msgSend(v19, "resourceType") == a3)
      break;
    if (v16 == ++v18)
    {
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v16)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  v21 = v19;

  if (!v21)
    goto LABEL_20;
  if (a5)
  {
    objc_msgSend(v12, "placeholderRecord");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_23:

  return v21;
}

- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 recordClass:(Class *)a5 error:(id *)a6
{
  void *v7;
  id v8;
  void *v9;
  id v11;

  v11 = 0;
  -[CPLRecordStorageView resourceOfType:forRecordWithScopedIdentifier:record:error:](self, "resourceOfType:forRecordWithScopedIdentifier:record:error:", a3, a4, &v11, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v8;
  if (a5 && v7)
    *a5 = (Class)objc_msgSend(v8, "recordClass");

  return v7;
}

void __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "recordViewWithScopedIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "synthesizedRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_9628();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Adding %@ as an additional record to the batch, just in case", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "_addAdditionalRecord:", v6);
  }

}

void __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addRecord:", v5);
  if ((objc_msgSend(v5, "isDelete") & 1) == 0)
  {
    if (objc_msgSend(v5, "isMasterChange"))
    {
      if (objc_msgSend(v5, "isFullRecord"))
      {
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v5, "scopedIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);
LABEL_28:

        goto LABEL_29;
      }
      if (!v6)
      {
        v13 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v5, "scopedIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v8);
        goto LABEL_28;
      }
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v5, "scopedIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_9628();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v15 = 138412290;
          v16 = v6;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "Adding %@ as an additional record to the batch, just in case", (uint8_t *)&v15, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "_addAdditionalRecord:", v6);
    }
    else if (objc_msgSend(v5, "isAssetChange"))
    {
      if ((objc_msgSend(v5, "isFullRecord") & 1) == 0)
      {
        if (v6)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_9628();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              v15 = 138412290;
              v16 = v6;
              _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Adding %@ as an additional record to the batch, just in case", (uint8_t *)&v15, 0xCu);
            }

          }
          objc_msgSend(*(id *)(a1 + 32), "_addAdditionalRecord:", v6);
        }
        else if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_9628();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = 138412290;
            v16 = v5;
            _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Expected to have a precomputed a full record for %@, but didn't", (uint8_t *)&v15, 0xCu);
          }

        }
      }
      objc_msgSend(v5, "masterScopedIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 || (objc_msgSend(v6, "masterScopedIdentifier"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
          (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v8);
      }
      goto LABEL_28;
    }
  }
LABEL_29:

}

void __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "recordViewWithScopedIdentifier:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synthesizedRecord");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "compactedChangeWithRelatedChanges:isOnlyChange:fullRecord:usingStorageView:", v6, 1, v9, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)recordViewWithScopedIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLRecordStorageView.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 81, CFSTR("%@ should be implemented by %@"), v8, objc_opt_class());

  abort();
}

- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLRecordStorageView.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 86, CFSTR("%@ should be implemented by %@"), v9, objc_opt_class());

  abort();
}

- (id)description
{
  return (id)objc_msgSend((id)objc_opt_class(), "description");
}

- (id)redactedDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "description");
}

@end
