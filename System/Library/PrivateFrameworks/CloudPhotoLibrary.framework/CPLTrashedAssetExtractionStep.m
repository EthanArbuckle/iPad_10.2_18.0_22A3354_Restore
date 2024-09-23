@implementation CPLTrashedAssetExtractionStep

- (CPLTrashedAssetExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  id v9;
  id v10;
  CPLTrashedAssetExtractionStep *v11;
  CPLTrashedAssetExtractionStep *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CPLTrashedAssetExtractionStep;
  v11 = -[CPLBatchExtractionStep initWithStorage:scopeIdentifier:](&v18, sel_initWithStorage_scopeIdentifier_, v9, v10);
  v12 = v11;
  if (v11)
  {
    if (a5 <= 1)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Can't extract masters with no room for assets", v17, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, v16, 577, CFSTR("Can't extract masters with no room for assets"));

      abort();
    }
    v11->_maximumCount = a5;
  }

  return v12;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  id v9;
  unint64_t maximumCount;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void (*v27)(_QWORD *, void *, void *);
  _BOOL4 v28;
  int v29;
  BOOL v30;
  NSObject *v32;
  void *v33;
  void *v34;
  CPLTrashedAssetExtractionStep *v36;
  unint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  unint64_t v51;
  _QWORD v52[4];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint8_t buf[4];
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 1;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__11905;
  v61 = __Block_byref_object_dispose__11906;
  v62 = 0;
  maximumCount = self->_maximumCount;
  if (maximumCount >= a4)
    maximumCount = a4;
  v38 = maximumCount;
  v36 = self;
  -[CPLBatchExtractionStep storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  -[CPLBatchExtractionStep scopeIdentifier](self, "scopeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allChangesWithClass:scopeIdentifier:trashed:", v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v52[3] = a5;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __87__CPLTrashedAssetExtractionStep_extractToBatch_maximumCount_maximumResourceSize_error___block_invoke;
  v44[3] = &unk_1E60DA7D8;
  v39 = v11;
  v45 = v39;
  v47 = v52;
  v15 = v9;
  v46 = v15;
  v48 = &v53;
  v49 = &v63;
  v50 = &v57;
  v51 = v38;
  v16 = (_QWORD *)MEMORY[0x1B5E08DC4](v44);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v69, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1B5E08BF0]();
        if ((objc_msgSend(v21, "isFullRecord") & 1) != 0)
        {
          objc_msgSend(v21, "masterScopedIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            if (!_CPLSilentLogging)
            {
              __CPLGenericOSLogDomain();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v68 = v21;
                _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_ERROR, "%@ should have a master identifier", buf, 0xCu);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v36, v34, 635, CFSTR("%@ should have a master identifier"), v21);

            abort();
          }
          objc_msgSend(v39, "changeWithScopedIdentifier:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            v26 = objc_msgSend(v24, "isFullRecord");
            v27 = (void (*)(_QWORD *, void *, void *))v16[2];
            if (v26)
            {
              v27(v16, v21, v25);
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            v27 = (void (*)(_QWORD *, void *, void *))v16[2];
          }
          v27(v16, v21, 0);
          goto LABEL_16;
        }
        ((void (*)(_QWORD *, void *, _QWORD))v16[2])(v16, v21, 0);
LABEL_17:
        v28 = (objc_msgSend(v15, "isFull") & 1) == 0 && *((_BYTE *)v64 + 24) && v54[3] < v38;
        objc_autoreleasePoolPop(v22);
        if (!v28)
          goto LABEL_24;
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v69, 16);
    }
    while (v18);
  }
LABEL_24:

  if (*((_BYTE *)v64 + 24) && (v54[3] || objc_msgSend(v15, "batchCanLowerQuota")))
    objc_msgSend(v15, "setFull:", 1);
  v29 = *((unsigned __int8 *)v64 + 24);
  if (a6 && !*((_BYTE *)v64 + 24))
  {
    *a6 = objc_retainAutorelease((id)v58[5]);
    v29 = *((unsigned __int8 *)v64 + 24);
  }
  v30 = v29 != 0;

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  return v30;
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isAssetChange") && (objc_msgSend(v3, "inTrash") & 1) != 0;

  return v4;
}

- (id)shortDescription
{
  return CFSTR("Trashed(Asset)");
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

void __87__CPLTrashedAssetExtractionStep_extractToBatch_maximumCount_maximumResourceSize_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  id obj;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "effectiveResourceSizeToUploadUsingStorage:", *(_QWORD *)(a1 + 32));
  if (v6)
    v7 += objc_msgSend(v6, "effectiveResourceSizeToUploadUsingStorage:", *(_QWORD *)(a1 + 32));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(_QWORD *)(v8 + 24);
  if (v7 > v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "batch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = *(void **)(a1 + 40);
LABEL_11:
      objc_msgSend(v12, "setFull:", 1);
      goto LABEL_15;
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(_QWORD *)(v8 + 24);
  }
  v13 = v9 >= v7;
  v14 = v9 - v7;
  if (!v13)
    v14 = 0;
  *(_QWORD *)(v8 + 24) = v14;
  if (v6)
  {
    v12 = *(void **)(a1 + 40);
    if ((unint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 2) > *(_QWORD *)(a1 + 80))
      goto LABEL_11;
    objc_msgSend(v12, "addChange:fromStorage:", v6, *(_QWORD *)(a1 + 32));
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v16 + 40);
    v17 = objc_msgSend(v15, "removeChange:error:", v6, &obj);
    objc_storeStrong((id *)(v16 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v17;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "addChange:fromStorage:", v5, *(_QWORD *)(a1 + 32));
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v21 = *(id *)(v19 + 40);
    v20 = objc_msgSend(v18, "removeChange:error:", v5, &v21);
    objc_storeStrong((id *)(v19 + 40), v21);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v20;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
LABEL_15:

}

@end
