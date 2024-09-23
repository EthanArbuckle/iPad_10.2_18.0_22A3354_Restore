@implementation CPLBeforeUploadCheckItems

- (CPLBeforeUploadCheckItems)initWithBatch:(id)a3 targetMapping:(id)a4 ruleGroups:(int64_t)a5 pushRepositoryPriority:(unint64_t)a6 provider:(id)a7
{
  id v13;
  id v14;
  id v15;
  CPLBeforeUploadCheckItems *v16;
  CPLBeforeUploadCheckItems *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *nonAssetsWithResourcesToUpload;
  NSMutableDictionary *v20;
  NSMutableDictionary *assetsWithResourcesToUpload;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CPLBeforeUploadCheckItems;
  v16 = -[CPLBeforeUploadCheckItems init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_originalBatch, a3);
    objc_storeStrong((id *)&v17->_targetMapping, a4);
    objc_storeStrong((id *)&v17->_provider, a7);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nonAssetsWithResourcesToUpload = v17->_nonAssetsWithResourcesToUpload;
    v17->_nonAssetsWithResourcesToUpload = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetsWithResourcesToUpload = v17->_assetsWithResourcesToUpload;
    v17->_assetsWithResourcesToUpload = v20;

    v17->_ruleGroups = a5;
    v17->_pushRepositoryPriority = a6;
  }

  return v17;
}

- (NSArray)recordsToFetch
{
  return (NSArray *)-[NSMutableSet allObjects](self->_recordsToFetch, "allObjects");
}

- (NSArray)fetchRules
{
  return (NSArray *)-[NSMutableSet allObjects](self->_fetchRules, "allObjects");
}

- (CPLChangeBatch)batchToUpload
{
  CPLChangeBatch *v3;
  CPLChangeBatch *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *items;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *additionalRecords;
  _QWORD v15[4];
  CPLChangeBatch *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(CPLChangeBatch);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_originalBatch;
  v5 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        items = self->_items;
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "scopedIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](items, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "change");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          -[CPLChangeBatch addRecord:](v3, "addRecord:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  if (-[NSMutableDictionary count](self->_additionalRecords, "count"))
  {
    additionalRecords = self->_additionalRecords;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__CPLBeforeUploadCheckItems_batchToUpload__block_invoke;
    v15[3] = &unk_1E60DD550;
    v16 = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](additionalRecords, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
  return v3;
}

- (NSDictionary)itemsToReinject
{
  if (self->_itemsToReinject)
    return (NSDictionary *)self->_itemsToReinject;
  else
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (NSArray)recordsNeedingGeneratedDerivatives
{
  NSDictionary *items;
  void *v3;
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17551;
  v11 = __Block_byref_object_dispose__17552;
  v12 = 0;
  items = self->_items;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__CPLBeforeUploadCheckItems_recordsNeedingGeneratedDerivatives__block_invoke;
  v6[3] = &unk_1E60DC508;
  v6[5] = &v7;
  v6[6] = a2;
  v6[4] = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](items, "enumerateKeysAndObjectsUsingBlock:", v6);
  v3 = (void *)v8[5];
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (BOOL)shouldResetExceedingQuotaOnSuccessfulUpload
{
  NSDictionary *items;
  BOOL v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (self->_pushRepositoryPriority < 0x7D0)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  items = self->_items;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__CPLBeforeUploadCheckItems_shouldResetExceedingQuotaOnSuccessfulUpload__block_invoke;
  v5[3] = &unk_1E60DC530;
  v5[4] = &v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](items, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)countOfAssetsWithResourcesToUpload
{
  return -[NSMutableDictionary count](self->_assetsWithResourcesToUpload, "count");
}

- (unint64_t)estimatedUploadResourceSize
{
  uint64_t v3;
  NSMutableDictionary *assetsWithResourcesToUpload;
  NSMutableDictionary *nonAssetsWithResourcesToUpload;
  unint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = MEMORY[0x1E0C809B0];
  assetsWithResourcesToUpload = self->_assetsWithResourcesToUpload;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CPLBeforeUploadCheckItems_estimatedUploadResourceSize__block_invoke;
  v9[3] = &unk_1E60DC530;
  v9[4] = &v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](assetsWithResourcesToUpload, "enumerateKeysAndObjectsUsingBlock:", v9);
  nonAssetsWithResourcesToUpload = self->_nonAssetsWithResourcesToUpload;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __56__CPLBeforeUploadCheckItems_estimatedUploadResourceSize__block_invoke_2;
  v8[3] = &unk_1E60DC530;
  v8[4] = &v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nonAssetsWithResourcesToUpload, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)willUploadSomeResources
{
  return -[NSMutableDictionary count](self->_assetsWithResourcesToUpload, "count")
      || -[NSMutableDictionary count](self->_nonAssetsWithResourcesToUpload, "count") != 0;
}

- (BOOL)prepareBatchBeforeUploadWithError:(id *)a3
{
  CPLBeforeUploadCheckItems *v4;
  void *v5;
  CPLChangeBatch *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  CPLBeforeUploadCheckItem *v12;
  id v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id *v35;
  NSObject *v36;
  uint64_t v37;
  NSDictionary *items;
  BOOL v39;
  id *v41;
  CPLBeforeUploadCheckItems *v42;
  char v43;
  void *v44;
  void *v45;
  CPLChangeBatch *obj;
  uint64_t v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v4 = self;
  v63 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[CPLChangeBatch count](self->_originalBatch, "count"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v6 = v4->_originalBatch;
  v48 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v48)
  {
    v45 = 0;
    obj = v6;
    v41 = a3;
    v7 = 0;
    v44 = 0;
    v47 = *(_QWORD *)v51;
    v43 = 1;
    v42 = v4;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v47)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v8);
      v10 = (void *)MEMORY[0x1B5E08BF0]();
      objc_msgSend(v9, "scopedIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CPLBeforeUploadCheckItem initWithChange:checkItems:]([CPLBeforeUploadCheckItem alloc], "initWithChange:checkItems:", v9, v4);
      v49 = 0;
      LOBYTE(v9) = -[CPLBeforeUploadCheckItem prepareWithError:](v12, "prepareWithError:", &v49);
      v13 = v49;
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
        v14 = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLCheckOSLogDomain();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v59 = v12;
            v60 = 2112;
            v61 = v13;
            _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Failed to prepare %@: %@", buf, 0x16u);
          }

        }
        if (objc_msgSend(v13, "isCPLErrorWithCode:", 18))
        {
          v16 = v7;
          v17 = v5;
          objc_msgSend(v13, "userInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CPLErrorRejectedReasonKey"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          v21 = CFSTR("change was rejected before being sent to transport");
          if (v19)
            v21 = (__CFString *)v19;
          v22 = v21;

          v23 = v45;
          if (v45)
          {
            v5 = v17;
            v24 = v44;
          }
          else
          {
            v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);

            v24 = v27;
            v23 = v26;
            v5 = v17;
          }
          v44 = v24;
          objc_msgSend(v24, "addObject:", v22);
          v45 = v23;
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v11);

          v14 = 1;
          v7 = v16;
          v4 = v42;
        }
        else
        {
          v25 = v13;

          v43 = 0;
          v14 = 0;
          v7 = v25;
        }
      }

      objc_autoreleasePoolPop(v10);
      if (!v14)
        break;
      if (v48 == ++v8)
      {
        v48 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        if (v48)
          goto LABEL_3;
        break;
      }
    }

    v28 = v45;
    if ((v43 & (v45 != 0)) == 1)
    {
      if (objc_msgSend(v45, "count") == 1)
      {
        v56 = CFSTR("CPLErrorRejectedRecordIdentifiersAndReasons");
        v57 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "allValues");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstObject");
        v31 = v5;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 18, 0, v29, CFSTR("%@"), v32);
        v33 = objc_claimAutoreleasedReturnValue();

        v5 = v31;
        v7 = v30;
        v28 = v45;
      }
      else
      {
        v54 = CFSTR("CPLErrorRejectedRecordIdentifiersAndReasons");
        v55 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 18, 0, v29, CFSTR("%lu changes were rejected before sending them to the transport"), objc_msgSend(v45, "count"));
        v33 = objc_claimAutoreleasedReturnValue();
      }
      v35 = v41;

      v7 = (id)v33;
      v34 = v44;
      goto LABEL_35;
    }
    v34 = v44;
    v35 = v41;
    if ((v43 & 1) == 0)
    {
LABEL_35:
      if (v35)
      {
        v7 = objc_retainAutorelease(v7);
        v39 = 0;
        *v35 = v7;
      }
      else
      {
        v39 = 0;
      }
      goto LABEL_38;
    }
  }
  else
  {

    v7 = 0;
    v34 = 0;
    v28 = 0;
  }
  if (!_CPLSilentLogging)
  {
    __CPLCheckOSLogDomain();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v4;
      _os_log_impl(&dword_1B03C2000, v36, OS_LOG_TYPE_DEBUG, "Prepared %@", buf, 0xCu);
    }

  }
  v37 = objc_msgSend(v5, "copy");
  items = v4->_items;
  v4->_items = (NSDictionary *)v37;

  v39 = 1;
LABEL_38:

  return v39;
}

- (BOOL)checkBatchWithFoundRecords:(id)a3 error:(id *)a4
{
  id v8;
  NSDictionary **p_foundRecords;
  CPLChangeBatch *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CPLBeforeUploadCheckItems *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  CPLBeforeUploadCheckItems *v18;
  CPLBeforeUploadCheckItems *v19;
  CPLBeforeUploadCheckItems *v20;
  char v21;
  id v22;
  int v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  id v30;
  id v31;
  void *v32;
  __CFString *v33;
  void *v34;
  id v35;
  __CFString *v36;
  id *v37;
  NSObject *v38;
  BOOL v39;
  NSDictionary *v40;
  NSObject *v42;
  void *v43;
  void *v44;
  SEL v45;
  id *v46;
  NSDictionary **v47;
  id v48;
  char v49;
  CPLBeforeUploadCheckItems *v50;
  __CFString *v51;
  CPLChangeBatch *obj;
  void *v53;
  uint64_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  uint8_t buf[4];
  CPLBeforeUploadCheckItems *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  p_foundRecords = &self->_foundRecords;
  objc_storeStrong((id *)&self->_foundRecords, a3);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v50 = self;
  v10 = self->_originalBatch;
  v11 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v11)
  {
    v12 = v11;
    v51 = 0;
    obj = v10;
    v45 = a2;
    v46 = a4;
    v47 = &self->_foundRecords;
    v48 = v8;
    v13 = 0;
    v53 = 0;
    v54 = *(_QWORD *)v57;
    v49 = 1;
    v14 = self;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v54)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v15);
      v17 = (void *)MEMORY[0x1B5E08BF0]();
      objc_msgSend(v16, "scopedIdentifier");
      v18 = (CPLBeforeUploadCheckItems *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v14->_items, "objectForKeyedSubscript:", v18);
      v19 = (CPLBeforeUploadCheckItems *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v18;
            _os_log_impl(&dword_1B03C2000, v42, OS_LOG_TYPE_ERROR, "Failed to find %@ in items to check", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", v45, v14, v44, 207, CFSTR("Failed to find %@ in items to check"), v18);

        abort();
      }
      v20 = v19;
      v55 = 0;
      v21 = -[CPLBeforeUploadCheckItems checkBeforeUploadWithError:](v19, "checkBeforeUploadWithError:", &v55);
      v22 = v55;
      if ((v21 & 1) != 0)
      {
        v23 = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLCheckOSLogDomain();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v65 = v20;
            v66 = 2112;
            v67 = v22;
            _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "Failed to check %@: %@", buf, 0x16u);
          }

        }
        if (objc_msgSend(v22, "isCPLErrorWithCode:", 18))
        {
          objc_msgSend(v22, "userInfo");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("CPLErrorRejectedReasonKey"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          v28 = CFSTR("change was rejected before being sent to transport");
          if (v26)
            v28 = (__CFString *)v26;
          v29 = v28;

          v30 = v53;
          if (!v53)
          {
            v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);

            v13 = v31;
          }
          objc_msgSend(v13, "addObject:", v29);
          v53 = v30;
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v18);
          v23 = 1;
          v14 = v50;
        }
        else
        {
          v49 = 0;
          v23 = 0;
          v29 = v51;
          v51 = (__CFString *)v22;
        }

      }
      objc_autoreleasePoolPop(v17);
      if (!v23)
        break;
      if (v12 == ++v15)
      {
        v12 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }

    if ((v49 & (v53 != 0)) == 1)
    {
      if (objc_msgSend(v53, "count") == 1)
      {
        v62 = CFSTR("CPLErrorRejectedRecordIdentifiersAndReasons");
        v63 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "allValues");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString firstObject](v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 18, 0, v32, CFSTR("%@"), v34);
        v35 = (id)objc_claimAutoreleasedReturnValue();

        v36 = v33;
        p_foundRecords = v47;
        v8 = v48;
      }
      else
      {
        v60 = CFSTR("CPLErrorRejectedRecordIdentifiersAndReasons");
        v61 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 18, 0, v32, CFSTR("%lu changes were rejected before sending them to the transport"), objc_msgSend(v53, "count"));
        v35 = (id)objc_claimAutoreleasedReturnValue();
        p_foundRecords = v47;
        v8 = v48;
        v36 = v51;
      }
      v37 = v46;

      goto LABEL_36;
    }
    p_foundRecords = v47;
    v8 = v48;
    v35 = v51;
    v37 = v46;
    if ((v49 & 1) == 0)
    {
LABEL_36:
      if (v37)
      {
        v35 = objc_retainAutorelease(v35);
        v39 = 0;
        *v37 = v35;
      }
      else
      {
        v39 = 0;
      }
      goto LABEL_39;
    }
  }
  else
  {

    v35 = 0;
    v13 = 0;
    v53 = 0;
  }
  if (!_CPLSilentLogging)
  {
    __CPLCheckOSLogDomain();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v50;
      _os_log_impl(&dword_1B03C2000, v38, OS_LOG_TYPE_DEBUG, "Checked %@", buf, 0xCu);
    }

  }
  v39 = 1;
LABEL_39:
  v40 = *p_foundRecords;
  *p_foundRecords = 0;

  return v39;
}

- (BOOL)requestFetchOfRecordWithScopedIdentifier:(id)a3 forItem:(id)a4 rule:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSMutableSet *recordsToFetch;
  NSMutableSet *v12;
  NSMutableSet *v13;
  NSMutableSet *fetchRules;
  NSMutableSet *v15;
  NSMutableSet *v16;
  BOOL v17;

  v9 = a3;
  v10 = a5;
  if ((-[NSMutableSet containsObject:](self->_recordsToFetch, "containsObject:", v9) & 1) == 0)
  {
    if (!-[CPLBeforeUploadCheckItemsProvider willNeedToAccessRecordWithScopedIdentifier:error:](self->_provider, "willNeedToAccessRecordWithScopedIdentifier:error:", v9, a6))
    {
      v17 = 0;
      goto LABEL_10;
    }
    recordsToFetch = self->_recordsToFetch;
    if (!recordsToFetch)
    {
      v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v13 = self->_recordsToFetch;
      self->_recordsToFetch = v12;

      recordsToFetch = self->_recordsToFetch;
    }
    -[NSMutableSet addObject:](recordsToFetch, "addObject:", v9);
  }
  fetchRules = self->_fetchRules;
  if (!fetchRules)
  {
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v16 = self->_fetchRules;
    self->_fetchRules = v15;

    fetchRules = self->_fetchRules;
  }
  -[NSMutableSet addObject:](fetchRules, "addObject:", v10);
  v17 = 1;
LABEL_10:

  return v17;
}

- (id)willUploadCloudResource:(id)a3 localResource:(id)a4 forItem:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  NSMutableDictionary *assetsWithResourcesToUpload;
  void *v13;

  v10 = a5;
  -[CPLBeforeUploadCheckItemsProvider willUploadCloudResource:localResource:error:](self->_provider, "willUploadCloudResource:localResource:error:", a3, a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (objc_msgSend(v10, "isAsset"))
      assetsWithResourcesToUpload = self->_assetsWithResourcesToUpload;
    else
      assetsWithResourcesToUpload = self->_nonAssetsWithResourcesToUpload;
    objc_msgSend(v10, "scopedIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](assetsWithResourcesToUpload, "setObject:forKeyedSubscript:", v10, v13);

  }
  return v11;
}

- (void)itemWillDropResourceChange:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableDictionary *assetsWithResourcesToUpload;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *nonAssetsWithResourcesToUpload;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isAsset"))
  {
    v5 = -[NSMutableDictionary count](self->_assetsWithResourcesToUpload, "count");
    assetsWithResourcesToUpload = self->_assetsWithResourcesToUpload;
    objc_msgSend(v4, "scopedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeObjectForKey:](assetsWithResourcesToUpload, "removeObjectForKey:", v7);
    v8 = self->_assetsWithResourcesToUpload;
  }
  else
  {
    v5 = -[NSMutableDictionary count](self->_nonAssetsWithResourcesToUpload, "count");
    nonAssetsWithResourcesToUpload = self->_nonAssetsWithResourcesToUpload;
    objc_msgSend(v4, "scopedIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeObjectForKey:](nonAssetsWithResourcesToUpload, "removeObjectForKey:", v10);
    v8 = self->_nonAssetsWithResourcesToUpload;
  }
  if (-[NSMutableDictionary count](v8, "count") < v5)
    self->_hasDroppedSomeResources = 1;
}

- (void)itemShouldBeReinjectedInPushRepository:(id)a3
{
  id v4;
  NSMutableDictionary *itemsToReinject;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  v4 = a3;
  itemsToReinject = self->_itemsToReinject;
  v9 = v4;
  if (!itemsToReinject)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_itemsToReinject;
    self->_itemsToReinject = v6;

    v4 = v9;
    itemsToReinject = self->_itemsToReinject;
  }
  objc_msgSend(v4, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](itemsToReinject, "setObject:forKeyedSubscript:", v9, v8);

}

- (BOOL)transportHasRecordWithScopedIdentifier:(id)a3
{
  id v5;
  NSDictionary *foundRecords;
  void *v7;
  BOOL v8;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  foundRecords = self->_foundRecords;
  if (!foundRecords)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "%@ should only be called within -checkBatchWithFoundRecords:error:", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 304, CFSTR("%@ should only be called within -checkBatchWithFoundRecords:error:"), v14);

    abort();
  }
  -[NSDictionary objectForKeyedSubscript:](foundRecords, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (id)recordFromTransportWithScopedIdentifier:(id)a3
{
  id v5;
  NSDictionary *foundRecords;
  void *v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  foundRecords = self->_foundRecords;
  if (!foundRecords)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "%@ should only be called within -checkBatchWithFoundRecords:error:", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 309, CFSTR("%@ should only be called within -checkBatchWithFoundRecords:error:"), v13);

    abort();
  }
  -[NSDictionary objectForKeyedSubscript:](foundRecords, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addAdditionalRecordWithScopedIdentifierToUploadBatch:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *additionalRecords;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_additionalRecords, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (!self->_additionalRecords)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      additionalRecords = self->_additionalRecords;
      self->_additionalRecords = v5;

    }
    -[CPLBeforeUploadCheckItemsProvider knownCloudRecordWithScopedIdentifier:](self->_provider, "knownCloudRecordWithScopedIdentifier:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v4 = (void *)v7;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_additionalRecords, "setObject:forKeyedSubscript:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_additionalRecords, "setObject:forKeyedSubscript:", v8, v9);

      v4 = 0;
    }
  }

}

- (id)itemWithScopedIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_items, "objectForKeyedSubscript:", a3);
}

- (CPLChangeBatch)originalBatch
{
  return self->_originalBatch;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (CPLBeforeUploadCheckItemsProvider)provider
{
  return self->_provider;
}

- (int64_t)ruleGroups
{
  return self->_ruleGroups;
}

- (unint64_t)pushRepositoryPriority
{
  return self->_pushRepositoryPriority;
}

- (NSString)sharingScopeIdentifier
{
  return self->_sharingScopeIdentifier;
}

- (void)setSharingScopeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)shouldCheckOverQuotaChangesWithServer
{
  return self->_shouldCheckOverQuotaChangesWithServer;
}

- (void)setShouldCheckOverQuotaChangesWithServer:(BOOL)a3
{
  self->_shouldCheckOverQuotaChangesWithServer = a3;
}

- (BOOL)hasDroppedSomeResources
{
  return self->_hasDroppedSomeResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_originalBatch, 0);
  objc_storeStrong((id *)&self->_itemsToReinject, 0);
  objc_storeStrong((id *)&self->_fetchRules, 0);
  objc_storeStrong((id *)&self->_additionalRecords, 0);
  objc_storeStrong((id *)&self->_assetsWithResourcesToUpload, 0);
  objc_storeStrong((id *)&self->_nonAssetsWithResourcesToUpload, 0);
  objc_storeStrong((id *)&self->_recordsToFetch, 0);
  objc_storeStrong((id *)&self->_foundRecords, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

uint64_t __56__CPLBeforeUploadCheckItems_estimatedUploadResourceSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "estimatedResourceUploadSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __56__CPLBeforeUploadCheckItems_estimatedUploadResourceSize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "estimatedResourceUploadSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __72__CPLBeforeUploadCheckItems_shouldResetExceedingQuotaOnSuccessfulUpload__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "isTrashedOrDeletedAsset");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __63__CPLBeforeUploadCheckItems_recordsNeedingGeneratedDerivatives__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "needsToGenerateDerivatives"))
  {
    objc_msgSend(v5, "change");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = objc_msgSend(v5, "changeClass");
          objc_msgSend(v5, "scopedIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v23 = v13;
          v24 = 2112;
          v25 = v14;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "<%@ %@> needs to generate derivatives yet has no change to upload", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a1[6];
      v17 = a1[4];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v5, "changeClass");
      objc_msgSend(v5, "scopedIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, v18, 103, CFSTR("<%@ %@> needs to generate derivatives yet has no change to upload"), v19, v20);

      abort();
    }
    v7 = (void *)v6;
    v8 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    if (!v8)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1[4] + 8), "count"));
      v10 = *(_QWORD *)(a1[5] + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    }
    objc_msgSend(v8, "addObject:", v7);

  }
}

void __42__CPLBeforeUploadCheckItems_batchToUpload__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addAdditionalRecord:", v6);
    v5 = v6;
  }

}

@end
