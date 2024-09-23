@implementation HDCloudSyncUpdateLocalAnchorsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (id)finishedOperationTags
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D5D8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)operationTagDependencies
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  v3[1] = 0x1E6D4D5B8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)performWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "legacyRepositoryProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HDCloudSyncUpdateLocalAnchorsOperation_performWithError___block_invoke;
  v11[3] = &unk_1E6CEBC00;
  v11[4] = self;
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncAnchorEntity, "performWriteTransactionWithHealthDatabase:error:block:", v9, a3, v11);

  return (char)a3;
}

uint64_t __59__HDCloudSyncUpdateLocalAnchorsOperation_performWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id obj;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v4 = a1;
  v78 = *MEMORY[0x1E0C80C00];
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (!v8)
  {
    v49 = 1;
    goto LABEL_43;
  }
  v9 = v8;
  v10 = *(_QWORD *)v66;
  v59 = v4;
  v60 = v7;
  v55 = *(_QWORD *)v66;
  while (2)
  {
    v11 = 0;
    v56 = v9;
    do
    {
      if (*(_QWORD *)v66 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v11);
      v13 = objc_msgSend(v12, "purpose");
      if (v13)
      {
        if (v13 != 1)
          goto LABEL_32;
        v14 = *(void **)(v4 + 32);
        v15 = v12;
        v16 = v15;
        v63 = v14;
        if (!v14)
        {
LABEL_41:

          _HKInitializeLogging();
          v50 = *MEMORY[0x1E0CB5370];
          v7 = v60;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            goto LABEL_42;
          v54 = *(_QWORD *)(v59 + 32);
          *(_DWORD *)buf = 138543618;
          v75 = v54;
          v76 = 2114;
          v77 = v16;
          v52 = "%{public}@: Failed to update expected sync anchors for %{public}@";
          goto LABEL_45;
        }
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend(v15, "storeRecord");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "orderedSequenceRecords");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v18;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
        if (v19)
        {
          v20 = v19;
          v62 = *(_QWORD *)v70;
          v57 = v11;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              v22 = a3;
              if (*(_QWORD *)v70 != v62)
                objc_enumerationMutation(obj);
              v23 = *(id *)(*((_QWORD *)&v69 + 1) + 8 * i);
              v24 = v16;
              objc_msgSend(v16, "store");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "syncStoreForEpoch:", objc_msgSend(v23, "baselineEpoch"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v63, "configuration");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "repository");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "profile");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "legacyRepositoryProfile");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              a3 = v22;
              if (!+[HDSyncAnchorEntity resetSyncAnchorsOfType:store:profile:error:](HDSyncAnchorEntity, "resetSyncAnchorsOfType:store:profile:error:", 4, v26, v30, v22))
              {

LABEL_40:
                v16 = v24;
                goto LABEL_41;
              }
              objc_msgSend(v23, "syncAnchorMap");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:type:store:updatePolicy:resetInvalid:profile:error:](HDSyncAnchorEntity, "updateSyncAnchorsWithMap:type:store:updatePolicy:resetInvalid:profile:error:", v31, 4, v26, 2, 0, v30, v22);

              if (!v32)
                goto LABEL_40;
              v16 = v24;
            }
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
            v11 = v57;
            v4 = v59;
            v10 = v55;
            v9 = v56;
            if (v20)
              continue;
            break;
          }
        }

        v7 = v60;
      }
      else
      {
        v58 = v11;
        v64 = a3;
        v33 = *(_QWORD *)(v4 + 32);
        v34 = v12;
        v35 = v34;
        if (!v33)
        {
LABEL_37:

          _HKInitializeLogging();
          v50 = *MEMORY[0x1E0CB5370];
          v7 = v60;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
LABEL_42:
            v49 = 0;
            goto LABEL_43;
          }
          v51 = *(_QWORD *)(v59 + 32);
          *(_DWORD *)buf = 138543618;
          v75 = v51;
          v76 = 2114;
          v77 = v35;
          v52 = "%{public}@: Failed to update frozen sync anchors for %{public}@";
LABEL_45:
          _os_log_error_impl(&dword_1B7802000, v50, OS_LOG_TYPE_ERROR, v52, buf, 0x16u);
          goto LABEL_42;
        }
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend(v34, "storeRecord");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "orderedSequenceRecords");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v70;
          while (2)
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v70 != v40)
                objc_enumerationMutation(v37);
              v42 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
              objc_msgSend(v35, "store");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "syncStoreForEpoch:", objc_msgSend(v42, "baselineEpoch"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                objc_msgSend(v42, "frozenSyncAnchorMap");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (v45)
                {
                  objc_msgSend(v42, "record");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "modificationDate");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = objc_msgSend(v44, "replaceFrozenAnchorMap:updateDate:error:", v45, v47, v64);

                  if (!v48)
                  {

                    goto LABEL_37;
                  }
                }

              }
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
            if (v39)
              continue;
            break;
          }
        }

        v4 = v59;
        v7 = v60;
        a3 = v64;
        v10 = v55;
        v9 = v56;
        v11 = v58;
      }
LABEL_32:
      ++v11;
    }
    while (v11 != v9);
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    v49 = 1;
    if (v9)
      continue;
    break;
  }
LABEL_43:

  return v49;
}

@end
