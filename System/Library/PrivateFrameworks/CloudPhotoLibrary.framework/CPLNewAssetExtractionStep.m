@implementation CPLNewAssetExtractionStep

- (CPLNewAssetExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  id v9;
  id v10;
  CPLNewAssetExtractionStep *v11;
  CPLNewAssetExtractionStep *v12;
  NSMutableSet *v13;
  NSMutableSet *alreadySeenMasterScopedIdentifiers;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CPLNewAssetExtractionStep;
  v11 = -[CPLBatchExtractionStep initWithStorage:scopeIdentifier:](&v20, sel_initWithStorage_scopeIdentifier_, v9, v10);
  v12 = v11;
  if (v11)
  {
    if (a5 <= 1)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Can't extract masters with no room for assets", v19, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, v18, 390, CFSTR("Can't extract masters with no room for assets"));

      abort();
    }
    v11->_maximumCount = a5;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    alreadySeenMasterScopedIdentifiers = v12->_alreadySeenMasterScopedIdentifiers;
    v12->_alreadySeenMasterScopedIdentifiers = v13;

  }
  return v12;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)maximumCount maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  int v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  id *v35;
  int v36;
  void *v37;
  _BOOL4 v38;
  unint64_t v39;
  void *v40;
  _BOOL4 v41;
  BOOL v42;
  unint64_t v43;
  unint64_t v44;
  id *v45;
  int v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id *v52;
  uint64_t v54;
  int v55;
  BOOL v56;
  NSObject *v58;
  void *v59;
  void *v60;
  SEL v61;
  id v63;
  unint64_t v64;
  void *v65;
  unint64_t v66;
  id v67;
  void *v68;
  id obj;
  CPLNewAssetExtractionStep *v70;
  uint64_t (**v71)(_QWORD, _QWORD, _QWORD);
  id v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint8_t buf[8];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v116 = 0;
  v117 = &v116;
  v118 = 0x2020000000;
  v119 = 1;
  v110 = 0;
  v111 = &v110;
  v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__11905;
  v114 = __Block_byref_object_dispose__11906;
  v115 = 0;
  if (self->_maximumCount < maximumCount)
    maximumCount = self->_maximumCount;
  v70 = self;
  -[CPLBatchExtractionStep storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = maximumCount;
  v64 = a5;
  v61 = a2;
  v11 = objc_opt_class();
  -[CPLBatchExtractionStep scopeIdentifier](self, "scopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allChangesWithClass:scopeIdentifier:changeType:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v10;

  v76 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
  if (v14)
  {
    v74 = *(_QWORD *)v107;
    do
    {
      v15 = 0;
      v75 = v14;
      do
      {
        if (*(_QWORD *)v107 != v74)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1B5E08BF0]();
        objc_msgSend(v16, "scopedIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v76, "containsObject:", v18) & 1) == 0)
        {
          objc_msgSend(v76, "addObject:", v18);
          objc_msgSend(v16, "masterScopedIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            if ((-[NSMutableSet containsObject:](v70->_alreadySeenMasterScopedIdentifiers, "containsObject:", v20) & 1) != 0)
            {
              v21 = 0;
            }
            else
            {
              objc_msgSend(v68, "changeWithScopedIdentifier:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[NSMutableSet addObject:](v70->_alreadySeenMasterScopedIdentifiers, "addObject:", v20);
            if (v21 && (objc_msgSend(v21, "isFullRecord") & 1) != 0)
            {
              v101 = 0;
              v102 = &v101;
              v103 = 0x2020000000;
              v104 = 0;
              v104 = objc_msgSend(v21, "effectiveResourceSizeToUploadUsingStorage:", v68);
              v66 = v73 - 1;
              if (v73 == 1)
              {
                -[NSMutableSet removeObject:](v70->_alreadySeenMasterScopedIdentifiers, "removeObject:", v20);
                objc_msgSend(v72, "setFull:", 1);
                v19 = 2;
                v73 = 1;
              }
              else
              {
                v65 = v21;
                v97 = 0;
                v98 = &v97;
                v99 = 0x2020000000;
                v100 = 0;
                v22 = objc_alloc(MEMORY[0x1E0C99DE8]);
                if (v66 >= 0x64)
                  v23 = 100;
                else
                  v23 = v73 - 1;
                v24 = (void *)objc_msgSend(v22, "initWithCapacity:", v23);
                v88[0] = MEMORY[0x1E0C809B0];
                v88[1] = 3221225472;
                v88[2] = __83__CPLNewAssetExtractionStep_extractToBatch_maximumCount_maximumResourceSize_error___block_invoke;
                v88[3] = &unk_1E60DA7B0;
                v92 = &v110;
                v93 = &v116;
                v89 = v76;
                v63 = v24;
                v90 = v63;
                v94 = &v101;
                v67 = v68;
                v91 = v67;
                v95 = &v97;
                v96 = v73 - 1;
                v71 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E08DC4](v88);
                v25 = ((uint64_t (**)(_QWORD, void *, void *))v71)[2](v71, v18, v16);
                v26 = v64;
                v27 = v21;
                v28 = v73 - 1;
                if (v25)
                {
                  v86 = 0u;
                  v87 = 0u;
                  v84 = 0u;
                  v85 = 0u;
                  objc_msgSend(v67, "allChangesWithClass:relatedScopedIdentifier:", objc_opt_class(), v20);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v84, v121, 16);
                  if (v30)
                  {
                    v31 = *(_QWORD *)v85;
                    while (2)
                    {
                      for (i = 0; i != v30; ++i)
                      {
                        if (*(_QWORD *)v85 != v31)
                          objc_enumerationMutation(v29);
                        v33 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                        objc_msgSend(v33, "scopedIdentifier");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v34, "isEqual:", v18) & 1) == 0
                          && (((uint64_t (**)(_QWORD, void *, void *))v71)[2](v71, v34, v33) & 1) == 0)
                        {

                          goto LABEL_40;
                        }

                      }
                      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v84, v121, 16);
                      if (v30)
                        continue;
                      break;
                    }
                  }
LABEL_40:

                  v26 = v64;
                  v27 = v65;
                  v28 = v73 - 1;
                }
                if (!*((_BYTE *)v117 + 24))
                  goto LABEL_67;
                if (v98[3] <= v28)
                  goto LABEL_45;
                objc_msgSend(v72, "batch");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "count") == 0;

                if (!v38)
                {
LABEL_47:
                  -[NSMutableSet removeObject:](v70->_alreadySeenMasterScopedIdentifiers, "removeObject:", v20);
                  objc_msgSend(v72, "setFull:", 1);
                  goto LABEL_67;
                }
                objc_msgSend(v63, "removeLastObject");
                v26 = v64;
                v27 = v65;
LABEL_45:
                v39 = v102[3];
                if (v39 > v26)
                {
                  objc_msgSend(v72, "batch");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v40, "count") == 0;

                  if (!v41)
                    goto LABEL_47;
                  v39 = v102[3];
                  v26 = v64;
                  v27 = v65;
                }
                v42 = v26 >= v39;
                v43 = v26 - v39;
                v44 = v42 ? v43 : 0;
                objc_msgSend(v72, "addChange:fromStorage:", v27, v67);
                v45 = (id *)(v111 + 5);
                v83 = (id)v111[5];
                v46 = objc_msgSend(v67, "removeChange:error:", v27, &v83);
                v64 = v44;
                objc_storeStrong(v45, v83);
                *((_BYTE *)v117 + 24) = v46;
                if (!v46)
                  goto LABEL_67;
                v81 = 0u;
                v82 = 0u;
                v79 = 0u;
                v80 = 0u;
                v47 = v63;
                v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v79, v120, 16);
                if (v48)
                {
                  v49 = *(_QWORD *)v80;
LABEL_55:
                  v50 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v80 != v49)
                      objc_enumerationMutation(v47);
                    v51 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v50);
                    objc_msgSend(v72, "addChange:fromStorage:", v51, v67);
                    v52 = (id *)(v111 + 5);
                    v78 = (id)v111[5];
                    LOBYTE(v51) = objc_msgSend(v67, "removeChange:error:", v51, &v78);
                    objc_storeStrong(v52, v78);
                    *((_BYTE *)v117 + 24) = v51;
                    if ((v51 & 1) == 0)
                      break;
                    if (v48 == ++v50)
                    {
                      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v79, v120, 16);
                      if (v48)
                        goto LABEL_55;
                      break;
                    }
                  }
                }

                if (*((_BYTE *)v117 + 24))
                {
                  if (v98[3] >= v66 || v64 >> 11 <= 4)
                  {
                    objc_msgSend(v72, "setFull:", 1);
                    goto LABEL_67;
                  }
                  v54 = objc_msgSend(v47, "count");
                  v73 = v66 - v54;
                  if (v66 == v54)
                  {
                    if (!_CPLSilentLogging)
                    {
                      __CPLGenericOSLogDomain();
                      v58 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1B03C2000, v58, OS_LOG_TYPE_ERROR, "Batch should have at least one place left", buf, 2u);
                      }

                    }
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", v61, v70, v60, 543, CFSTR("Batch should have at least one place left"));

                    abort();
                  }
                  v19 = 0;
                }
                else
                {
LABEL_67:
                  v19 = 2;
                }

                _Block_object_dispose(&v97, 8);
                v21 = v65;
              }
              _Block_object_dispose(&v101, 8);
LABEL_70:

              goto LABEL_71;
            }
          }
          else
          {
            v21 = 0;
          }
          objc_msgSend(v72, "addChange:fromStorage:", v16, v68);
          v35 = (id *)(v111 + 5);
          v105 = (id)v111[5];
          v36 = objc_msgSend(v68, "removeChange:error:", v16, &v105);
          objc_storeStrong(v35, v105);
          *((_BYTE *)v117 + 24) = v36;
          if (v36)
          {
            if (v73 != 1)
            {
              --v73;
              v19 = 3;
              goto LABEL_70;
            }
            objc_msgSend(v72, "setFull:", 1);
            v73 = 0;
          }
          else
          {
            --v73;
          }
          v19 = 2;
          goto LABEL_70;
        }
        v19 = 3;
LABEL_71:

        objc_autoreleasePoolPop(v17);
        if (v19 != 3 && v19)
          goto LABEL_78;
        ++v15;
      }
      while (v15 != v75);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
    }
    while (v14);
  }
LABEL_78:

  v55 = *((unsigned __int8 *)v117 + 24);
  if (a6 && !*((_BYTE *)v117 + 24))
  {
    *a6 = objc_retainAutorelease((id)v111[5]);
    v55 = *((unsigned __int8 *)v117 + 24);
  }
  v56 = v55 != 0;

  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v116, 8);

  return v56;
}

- (void)reset
{
  -[NSMutableSet removeAllObjects](self->_alreadySeenMasterScopedIdentifiers, "removeAllObjects");
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isAssetChange") && (objc_msgSend(v3, "isFullRecord") & 1) != 0;

  return v4;
}

- (id)shortDescription
{
  return CFSTR("New(Asset)");
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alreadySeenMasterScopedIdentifiers, 0);
}

BOOL __83__CPLNewAssetExtractionStep_extractToBatch_maximumCount_maximumResourceSize_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;

  v4 = a3;
  if ((objc_msgSend(v4, "isDelete") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if ((objc_msgSend(v4, "isFullRecord") & 1) != 0 || (objc_msgSend(v4, "hasChangeType:", 2) & 1) != 0)
    {
      objc_msgSend(v4, "scopedIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(v4, "effectiveResourceSizeToUploadUsingStorage:", *(_QWORD *)(a1 + 48));
      v5 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) <= *(_QWORD *)(a1 + 88);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      +[CPLRecordChange descriptionForChangeType:](CPLRecordChange, "descriptionForChangeType:", objc_msgSend(v4, "changeType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("Update to an asset (%@) instead of add while its master is new"), v8);

      +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      v5 = 1;
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    v12 = v5;
  else
    v12 = 0;

  return v12;
}

@end
