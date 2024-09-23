@implementation FPSpotlightDropIndexOperation

- (FPSpotlightDropIndexOperation)initWithIndexer:(id)a3 index:(id)a4 spotlightDomainIdentifier:(id)a5 dropReason:(unint64_t)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  FPSpotlightDropIndexOperation *v16;
  FPSpotlightDropIndexOperation *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FPSpotlightDropIndexOperation;
  v16 = -[FPOperation init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_indexer, v12);
    objc_storeWeak((id *)&v17->_delegate, v15);
    objc_storeStrong((id *)&v17->_index, a4);
    objc_storeStrong((id *)&v17->_spotlightDomainIdentifier, a5);
    v17->_dropReason = a6;
  }

  return v17;
}

- (id)operationDescription
{
  return (id)FPHumanReadableDropReason(self->_dropReason);
}

+ (void)deleteSearchableItemsAndClearClientStateWithDomainIdentifier:(id)a3 index:(id)a4 dropReason:(unint64_t)a5 delegate:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = a3;
  v15 = FPCSIndexReasonForFPIndexDropReason(a5);
  v26[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __138__FPSpotlightDropIndexOperation_deleteSearchableItemsAndClearClientStateWithDomainIdentifier_index_dropReason_delegate_completionHandler___block_invoke;
  v20[3] = &unk_1E444DDA8;
  v23 = v13;
  v24 = a5;
  v21 = v12;
  v22 = v11;
  v25 = v15;
  v17 = v11;
  v18 = v12;
  v19 = v13;
  objc_msgSend(v17, "deleteSearchableItemsWithDomainIdentifiers:reason:completionHandler:", v16, v15, v20);

}

void __138__FPSpotlightDropIndexOperation_deleteSearchableItemsAndClearClientStateWithDomainIdentifier_index_dropReason_delegate_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "didDropIndexWithDropReason:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "beginIndexBatch");
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endIndexBatchWithExpectedClientState:newClientState:reason:completionHandler:", 0, v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

  }
}

- (void)main
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, a3, "[ERROR] won't restore persona: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void __37__FPSpotlightDropIndexOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
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
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  double v37;
  void *v38;
  id v39;
  _QWORD v40[6];
  id v41;
  id v42;
  uint8_t buf[4];
  double v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v39 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(WeakRetained, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = fpfs_adopt_log(v4);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPersona");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0;
  objc_msgSend(v38, "userPersonaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v10)
  {

LABEL_13:
    v23 = 0;
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
  v41 = 0;
  v15 = (void *)objc_msgSend(v38, "copyCurrentPersonaContextWithError:", &v41);
  v16 = v41;
  v17 = v42;
  v42 = v15;

  if (v16)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FPSpotlightDropIndexOperation main].cold.2((uint64_t)v16, v18, v19);

  }
  v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v20, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "personaIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "generateAndRestorePersonaContextWithPersonaUniqueString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
      objc_msgSend(v35, "domain");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "personaIdentifier");
      v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412546;
      v44 = v37;
      v45 = 2112;
      v46 = v23;
      _os_log_error_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  if (v39)
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v39, "fp_prettyDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      __37__FPSpotlightDropIndexOperation_main__block_invoke_cold_1(v26, (uint64_t)buf, v25);
    }

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v39);
  }
  else
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
      v29 = v28;
      FPHumanReadableDropReason(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
      *(_DWORD *)buf = 134218498;
      v44 = -v29;
      v45 = 2112;
      v46 = v30;
      v47 = 2112;
      v48 = v31;
      _os_log_impl(&dword_1A0A34000, v27, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] done deleting all searchable items in %.3fs (because \"%@\") in %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "beginIndexBatch");
    v32 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __37__FPSpotlightDropIndexOperation_main__block_invoke_4;
    v40[3] = &unk_1E444DDD0;
    v34 = *(_QWORD *)(a1 + 48);
    v40[4] = *(_QWORD *)(a1 + 32);
    v40[5] = v34;
    objc_msgSend(v32, "endIndexBatchWithClientState:completionHandler:", v33, v40);

  }
  _FPRestorePersona(&v42);

}

void __37__FPSpotlightDropIndexOperation_main__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(WeakRetained, "log");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = fpfs_adopt_log(v5);

  v10 = *(_QWORD *)(a1 + 40);
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __37__FPSpotlightDropIndexOperation_main__block_invoke_4_cold_2(&v10, v7);

  if (v3)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "fp_prettyDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __37__FPSpotlightDropIndexOperation_main__block_invoke_4_cold_1(v9, (uint64_t)v11, v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
  }
  __fp_leave_section_Debug((uint64_t)&v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_indexer);
}

void __37__FPSpotlightDropIndexOperation_main__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a3, (uint64_t)a3, "[ERROR] [spotlight] failed dropping all searchable items: %@", (uint8_t *)a2);

}

void __37__FPSpotlightDropIndexOperation_main__block_invoke_4_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a3, (uint64_t)a3, "[ERROR] [spotlight] failed to reset client state: %@", (uint8_t *)a2);

}

void __37__FPSpotlightDropIndexOperation_main__block_invoke_4_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx [spotlight] endIndexBatchWithClientState", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

@end
