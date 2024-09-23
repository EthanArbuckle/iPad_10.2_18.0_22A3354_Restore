@implementation FPSpotlightIndexOneBatchOperation

- (FPSpotlightIndexOneBatchOperation)initWithIndexer:(id)a3 isInitialIndexing:(BOOL)a4 isOutOfBandIndexing:(BOOL)a5 queue:(id)a6
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  FPSpotlightIndexOneBatchOperation *v29;
  FPSpotlightIndexOneBatchOperation *v30;
  void *v32;
  void *v33;
  void *v34;
  id v38;
  objc_super v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v38 = a6;
  objc_msgSend(v7, "log");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = fpfs_adopt_log(v8);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentPersona");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0;
  objc_msgSend(v11, "userPersonaUniqueString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domainContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "personaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v15)
  {

LABEL_13:
    v27 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v7, "domainContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "personaIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v12, "isEqualToString:", v18);

  if ((v19 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v40 = 0;
  v20 = (void *)objc_msgSend(v11, "copyCurrentPersonaContextWithError:", &v40);
  v21 = v40;
  v22 = v41;
  v41 = v20;

  if (v21)
  {
    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  objc_msgSend(v7, "domainContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "domain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "personaIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generateAndRestorePersonaContextWithPersonaUniqueString:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "domainContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "domain");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "personaIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v34;
      v44 = 2112;
      v45 = v27;
      _os_log_error_impl(&dword_1A0A34000, v28, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  v39.receiver = self;
  v39.super_class = (Class)FPSpotlightIndexOneBatchOperation;
  v29 = -[FPOperation init](&v39, sel_init);
  v30 = v29;
  if (v29)
  {
    objc_storeWeak((id *)&v29->_indexer, v7);
    v30->_isInitialIndexing = a4;
    v30->_isOutOfBandIndexing = a5;
    -[FPOperation setCallbackQueue:](v30, "setCallbackQueue:", v38);
    if (!a5)
    {
      if (objc_msgSend(v7, "isIndexing"))
        __assert_rtn("-[FPSpotlightIndexOneBatchOperation initWithIndexer:isInitialIndexing:isOutOfBandIndexing:queue:]", "FPSpotlightIndexOneBatchOperation.m", 227, "!indexer.isIndexing");
      objc_msgSend(v7, "setIndexing:", 1);
    }
  }

  _FPRestorePersona(&v41);
  return v30;
}

- (void)main
{
  FPSpotlightIndexer **p_indexer;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  unint64_t section;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD block[5];
  id v38;
  id v39;
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  p_indexer = &self->_indexer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  objc_msgSend(WeakRetained, "log");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = fpfs_adopt_log(v5);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  objc_msgSend(v36, "userPersonaUniqueString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)p_indexer);
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personaIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v11)
  {

LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  v12 = objc_loadWeakRetained((id *)p_indexer);
  objc_msgSend(v12, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personaIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "isEqualToString:", v14);

  if ((v15 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v38 = 0;
  v16 = (void *)objc_msgSend(v36, "copyCurrentPersonaContextWithError:", &v38);
  v17 = v38;
  v18 = v39;
  v39 = v16;

  if (v17)
  {
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v20 = objc_loadWeakRetained((id *)p_indexer);
  objc_msgSend(v20, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "personaIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "generateAndRestorePersonaContextWithPersonaUniqueString:", v22);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_loadWeakRetained((id *)p_indexer);
      objc_msgSend(v33, "domain");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "personaIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = (unint64_t)v35;
      v42 = 2112;
      v43 = v23;
      _os_log_error_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  section = __fp_create_section();
  fp_current_or_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v29 = objc_loadWeakRetained((id *)p_indexer);
    objc_msgSend(v29, "lastIndexState");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = CFSTR("start");
    if (v30)
      v32 = (const __CFString *)v30;
    *(_DWORD *)buf = 134218242;
    v41 = section;
    v42 = 2112;
    v43 = v32;
    _os_log_debug_impl(&dword_1A0A34000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx starting spotlight batch fetch from %@", buf, 0x16u);

  }
  self->_logSection = section;
  v27 = objc_loadWeakRetained((id *)p_indexer);
  objc_msgSend(v27, "workloop");
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__FPSpotlightIndexOneBatchOperation_main__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(v28, block);

  _FPRestorePersona(&v39);
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  int v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  char v37;
  NSObject *v38;
  id v39;
  void *v40;
  char v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  _QWORD v75[5];
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  id v86;
  id v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(WeakRetained, "log");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = fpfs_adopt_log(v3);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = 0;
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v10)
  {

LABEL_13:
    v73 = 0;
    goto LABEL_14;
  }
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personaIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqualToString:", v13);

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v86 = 0;
  v15 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v86);
  v16 = v86;
  v17 = v87;
  v87 = v15;

  if (v16)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v19, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "personaIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v21);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v73)
    goto LABEL_13;
  fp_current_or_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v68 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
    objc_msgSend(v68, "domain");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "personaIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v89 = (uint64_t)v70;
    v90 = 2112;
    v91 = (uint64_t)v73;
    _os_log_error_impl(&dword_1A0A34000, v22, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

  }
LABEL_14:
  v85 = 0;
  v85 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  fp_current_or_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v42 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
    v43 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "count");
    v44 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "count");
    v45 = *(_QWORD *)(a1 + 32);
    v46 = *(_QWORD *)(v45 + 352);
    objc_msgSend(*(id *)(v45 + 360), "fp_prettyDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v89 = v85;
    v90 = 2112;
    v91 = (uint64_t)v42;
    v92 = 2048;
    v93 = v43;
    v94 = 2048;
    v95 = v44;
    v96 = 2112;
    v97 = v46;
    v98 = 2112;
    v99 = v47;
    _os_log_debug_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@: received new batch (updated:%lu, deleted:%lu, changeToken:%@, error:%@)", buf, 0x3Eu);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled") & 1) == 0)
  {
    v24 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v24 + 360))
    {
      objc_msgSend((id)v24, "completedWithResult:error:", 0);
      goto LABEL_47;
    }
    v72 = *(id *)(v24 + 352);
    v25 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v25 + 313))
    {
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_3();

      v27 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
      objc_msgSend(v27, "lastIndexState");
      v28 = objc_claimAutoreleasedReturnValue();

      v72 = (id)v28;
    }
    else
    {
      v29 = objc_loadWeakRetained((id *)(v25 + 304));
      objc_msgSend(v29, "lastIndexState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v72, "isEqualToData:", v30);

      if (v31)
      {
        fp_current_or_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_1();

        objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
        goto LABEL_46;
      }
    }
    v33 = *(_QWORD *)(a1 + 32);
    v34 = *(_QWORD *)(v33 + 376);
    if (v34
      && (v35 = objc_loadWeakRetained((id *)(v33 + 304)),
          objc_msgSend(v35, "lastIndexState"),
          v36 = (void *)objc_claimAutoreleasedReturnValue(),
          v37 = (*(uint64_t (**)(uint64_t, void *))(v34 + 16))(v34, v36),
          v36,
          v35,
          v33 = *(_QWORD *)(a1 + 32),
          (v37 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1002, 0);
      v65 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33, "completedWithResult:error:", 0, v65);
    }
    else
    {
      if (*(_BYTE *)(v33 + 312))
      {
        fp_current_or_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_2();

        v33 = *(_QWORD *)(a1 + 32);
      }
      v39 = objc_loadWeakRetained((id *)(v33 + 304));
      objc_msgSend(v39, "domain");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v40, "isHidden") & 1) != 0)
      {
        v41 = 1;
      }
      else
      {
        v48 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
        objc_msgSend(v48, "domain");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v49, "isHiddenByUser");

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "fp_map:", &__block_literal_global_39);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v50, "mutableCopy");

      v52 = *(void **)(*(_QWORD *)(a1 + 32) + 336);
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2;
      v81[3] = &unk_1E444DFD8;
      v84 = v41;
      v53 = v51;
      v54 = *(_QWORD *)(a1 + 32);
      v82 = v53;
      v83 = v54;
      objc_msgSend(v52, "fp_map:", v81);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
      objc_msgSend(v56, "index");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "beginIndexBatch");
      objc_msgSend(v57, "indexSearchableItems:completionHandler:", v55, 0);
      objc_msgSend(v57, "deleteSearchableItemsWithIdentifiers:reason:completionHandler:", v53, objc_msgSend(*(id *)(a1 + 32), "indexReason"), 0);
      fp_current_or_default_log();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = objc_msgSend(v55, "count");
        v60 = objc_msgSend(v53, "count");
        *(_DWORD *)buf = 134218754;
        v89 = v59;
        v90 = 2048;
        v91 = v60;
        v92 = 2112;
        v93 = (uint64_t)v72;
        v94 = 2112;
        v95 = (uint64_t)v57;
        _os_log_impl(&dword_1A0A34000, v58, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] adding %ld and deleting %ld items state:%@ (in %@)", buf, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(*(id *)(a1 + 32), "passExpectedState");
      if (v62)
      {
        v71 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
        objc_msgSend(v71, "lastIndexState");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v63 = 0;
      }
      v64 = objc_msgSend(*(id *)(a1 + 32), "indexReason");
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_76;
      v75[3] = &unk_1E444E028;
      v75[4] = *(_QWORD *)(a1 + 32);
      v74 = v55;
      v76 = v74;
      v65 = v53;
      v77 = v65;
      v78 = v72;
      v66 = v61;
      v79 = v66;
      v67 = v57;
      v80 = v67;
      objc_msgSend(v67, "endIndexBatchWithExpectedClientState:newClientState:reason:completionHandler:", v63, v78, v64, v75);
      if (v62)
      {

      }
    }

LABEL_46:
  }
LABEL_47:
  __fp_leave_section_Debug((uint64_t)&v85);

  _FPRestorePersona(&v87);
}

uint64_t __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_72(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "coreSpotlightIdentifier");
}

id __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "toSearchableItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48)
    || (objc_msgSend(v3, "fileSystemFlags") & 8) != 0
    || (objc_msgSend(v3, "capabilities") & 0x2000000) != 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v4, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "indexOfObject:", v10);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 312))
  {
    objc_msgSend(v3, "lastUsedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v3, "contentModificationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attributeSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLastUsedDate:", v13);

    }
  }
  v7 = v4;
LABEL_6:

  return v7;
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2_77;
  block[3] = &unk_1E444E000;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v6 = v3;
  dispatch_async(v4, block);

}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2_77(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  double v31;
  void *v32;
  id *v33;
  id v34;
  _BOOL4 v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE buf[24];
  void *v53;
  _BYTE v54[10];
  __int16 v55;
  uint64_t v56;
  uint8_t v57[16];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(WeakRetained, "log");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = fpfs_adopt_log(v3);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0;
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v10)
  {

LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personaIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqualToString:", v13);

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v46 = 0;
  v15 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v46);
  v16 = v46;
  v17 = v47;
  v47 = v15;

  if (v16)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v19, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "personaIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
      objc_msgSend(v40, "domain");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "personaIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v22;
      _os_log_error_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  v45 = 0;
  v45 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  fp_current_or_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v37 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
    v38 = *(void **)(*(_QWORD *)(a1 + 32) + 352);
    objc_msgSend(*(id *)(a1 + 40), "fp_prettyDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v45;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 2112;
    v53 = v38;
    *(_WORD *)v54 = 2112;
    *(_QWORD *)&v54[2] = v39;
    _os_log_debug_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@: indexed batch for client state %@ with error: %@", buf, 0x2Au);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "fp_prettyDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2_77_cold_1(v26, v57, v25);
    }
  }
  else
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(*(id *)(a1 + 48), "count");
      v28 = objc_msgSend(*(id *)(a1 + 56), "count");
      v29 = *(void **)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 72), "timeIntervalSinceNow");
      v30 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2112;
      v53 = v29;
      *(_WORD *)v54 = 2048;
      *(double *)&v54[2] = -v31;
      v55 = 2112;
      v56 = v30;
      _os_log_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] added %ld and deleted %ld items state:%@ in %.3fs (in %@)", buf, 0x34u);
    }
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "domain");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v33 = (id *)getCSIndexErrorDomainSymbolLoc_ptr_0;
    v51 = getCSIndexErrorDomainSymbolLoc_ptr_0;
    if (!getCSIndexErrorDomainSymbolLoc_ptr_0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCSIndexErrorDomainSymbolLoc_block_invoke_0;
      v53 = &unk_1E444B188;
      *(_QWORD *)v54 = &v48;
      __getCSIndexErrorDomainSymbolLoc_block_invoke_0((uint64_t)buf);
      v33 = (id *)v49[3];
    }
    _Block_object_dispose(&v48, 8);
    if (!v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCSIndexErrorDomain(void)");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("FPSpotlightIndexOneBatchOperation.m"), 28, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v34 = *v33;
    if (objc_msgSend(v32, "isEqualToString:", v34))
    {
      v35 = objc_msgSend(*(id *)(a1 + 40), "code") == -1006;

      if (v35)
      {
        v36 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
        objc_msgSend(v36, "clearIndexState");
LABEL_30:

        objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
        goto LABEL_31;
      }
    }
    else
    {

    }
    v36 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
    objc_msgSend(v36, "learnNewIndexState:", *(_QWORD *)(a1 + 64));
    goto LABEL_30;
  }
LABEL_31:
  __fp_leave_section_Debug((uint64_t)&v45);

  _FPRestorePersona(&v47);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  v9 = WeakRetained;
  if (!self->_isOutOfBandIndexing && WeakRetained != 0)
    objc_msgSend(WeakRetained, "setIndexing:", 0);
  v11.receiver = self;
  v11.super_class = (Class)FPSpotlightIndexOneBatchOperation;
  -[FPOperation finishWithResult:error:](&v11, sel_finishWithResult_error_, v6, v7);

}

- (NSArray)updatedItems
{
  return self->_updatedItems;
}

- (void)setUpdatedItems:(id)a3
{
  objc_storeStrong((id *)&self->_updatedItems, a3);
}

- (NSArray)deletedItemIDs
{
  return self->_deletedItemIDs;
}

- (void)setDeletedItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deletedItemIDs, a3);
}

- (BOOL)passExpectedState
{
  return self->_passExpectedState;
}

- (void)setPassExpectedState:(BOOL)a3
{
  self->_passExpectedState = a3;
}

- (NSData)nextAnchor
{
  return self->_nextAnchor;
}

- (void)setNextAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_nextAnchor, a3);
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_fetchError, a3);
}

- (int64_t)indexReason
{
  return self->_indexReason;
}

- (void)setIndexReason:(int64_t)a3
{
  self->_indexReason = a3;
}

- (id)canIndexFromCurrentState
{
  return self->_canIndexFromCurrentState;
}

- (void)setCanIndexFromCurrentState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canIndexFromCurrentState, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_nextAnchor, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
  objc_storeStrong((id *)&self->_updatedItems, 0);
  objc_destroyWeak((id *)&self->_indexer);
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] received the same token twice, stopping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] will swizzle last used date because indexer is in initial indexing state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] processing out-of-band update, keeping last index state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2_77_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] [spotlight] can't index: %@", buf, 0xCu);

}

@end
