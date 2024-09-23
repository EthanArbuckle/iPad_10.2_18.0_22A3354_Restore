@implementation CPLEngineRevertRecords

- (unint64_t)scopeType
{
  return 3;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v10;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  return (char)a6;
}

- (BOOL)addRecordsToRevertWithLocalScopedIdentifier:(id)a3 class:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "addRecordsToRevertWithLocalScopedIdentifier:class:error:", v8, a4, a5);

  return (char)a5;
}

- (id)nextBatchOfRecordsToRevert
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CPLChangeBatch *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  CPLChangeBatch *v28;
  void *v30;
  id obj;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage engineStore](self, "engineStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transactionClientCacheView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revertedPlaceholderRecordsEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v32 = *(_QWORD *)v35;
    v9 = v30;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1B5E08BF0]();
        objc_msgSend(v11, "scopedIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recordViewWithScopedIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v19 = (void *)objc_msgSend(v11, "recordClass");
          objc_msgSend(v11, "scopedIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v19, "newDeleteChangeWithScopedIdentifier:", v20);

          if (v8)
            goto LABEL_9;
LABEL_8:
          v8 = objc_alloc_init(CPLChangeBatch);
          goto LABEL_9;
        }
        objc_msgSend(v14, "synthesizedRecord");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_8;
LABEL_9:
        if (objc_msgSend(v15, "isFullRecord", v30))
        {
          if (objc_msgSend(v15, "isAssetChange"))
          {
            objc_msgSend(v15, "relatedScopedIdentifier");
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = (void *)v16;
              objc_msgSend(v15, "relatedScopedIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v33, "containsObject:", v18))
              {

              }
              else
              {
                objc_msgSend(v15, "relatedScopedIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[CPLChangeBatch additionalRecordWithScopedIdentifier:](v8, "additionalRecordWithScopedIdentifier:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                v9 = v30;
                if (v22)
                  goto LABEL_21;
                objc_msgSend(v15, "relatedScopedIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "recordViewWithScopedIdentifier:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "synthesizedRecord");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (v17)
                  -[CPLChangeBatch _addAdditionalRecord:](v8, "_addAdditionalRecord:", v17);
                v9 = v30;
              }

            }
          }
        }
LABEL_21:
        objc_msgSend(v15, "scopedIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v25);

        -[CPLChangeBatch addRecord:](v8, "addRecord:", v15);
        v26 = -[CPLChangeBatch count](v8, "count");

        objc_autoreleasePoolPop(v12);
        if (v26 > 0x63)
          goto LABEL_26;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v7)
        goto LABEL_26;
    }
  }
  v8 = 0;
  v9 = v30;
LABEL_26:

  v27 = v9;
  v28 = v8;

  return v28;
}

- (BOOL)deleteRecordsToRevertFromBatch:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  id *v20;
  void *context;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  context = (void *)MEMORY[0x1B5E08BF0]();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v20 = a4;
    v10 = 0;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
        -[CPLEngineStorage platformObject](self, "platformObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scopedIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v13;
        v17 = objc_msgSend(v15, "deleteRecordsToRevertWithLocalScopedIdentifier:error:", v16, &v22);
        v10 = v22;

        if (!v17)
        {

          objc_autoreleasePoolPop(context);
          if (v20)
          {
            v10 = objc_retainAutorelease(v10);
            v18 = 0;
            *v20 = v10;
          }
          else
          {
            v18 = 0;
          }
          goto LABEL_15;
        }
        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }

  objc_autoreleasePoolPop(context);
  v18 = 1;
LABEL_15:

  return v18;
}

- (BOOL)shouldRevertRecordWithLocalScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldRevertRecordWithLocalScopedIdentifier:", v4);

  return v6;
}

@end
