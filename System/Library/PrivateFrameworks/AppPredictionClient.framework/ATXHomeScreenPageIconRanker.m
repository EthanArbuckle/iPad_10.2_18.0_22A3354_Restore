@implementation ATXHomeScreenPageIconRanker

- (ATXHomeScreenPageIconRanker)init
{
  void *v3;
  ATXHomeScreenPageIconRanker *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXHomeScreenPageIconRanker initWithCache:](self, "initWithCache:", v3);

  return v4;
}

- (ATXHomeScreenPageIconRanker)initWithCache:(id)a3
{
  id v5;
  ATXHomeScreenPageIconRanker *v6;
  ATXHomeScreenPageIconRanker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHomeScreenPageIconRanker;
  v6 = -[ATXHomeScreenPageIconRanker init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cache, a3);

  return v7;
}

- (id)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;

  -[ATXHomeScreenPageIconRanker _pageForPageIndex:](self, "_pageForPageIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
  {
    v5 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2419200.0);
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v10 = v9;

    BiomeLibrary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "App");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "InFocus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "atx_publisherFromStartTime:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_2;
    v65[3] = &unk_1E4D58528;
    v54 = v3;
    v17 = v3;
    v66 = v17;
    v18 = v6;
    v67 = v18;
    v19 = v5;
    v68 = v19;
    v20 = v7;
    v69 = v20;
    v53 = v15;
    v21 = (id)objc_msgSend(v15, "sinkWithCompletion:receiveInput:", &__block_literal_global_16, v65);
    v22 = (void *)objc_opt_new();
    objc_msgSend(v17, "leafIcons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v16;
    v62[1] = 3221225472;
    v62[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_5;
    v62[3] = &unk_1E4D58550;
    v52 = v19;
    v63 = v52;
    v24 = v22;
    v64 = v24;
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", v62);

    __atxlog_handle_default();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:].cold.6();

    objc_msgSend(v18, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v16;
    v60[1] = 3221225472;
    v60[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_18;
    v60[3] = &unk_1E4D58578;
    v27 = v18;
    v61 = v27;
    objc_msgSend(v26, "sortedArrayUsingComparator:", v60);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_default();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:].cold.5();

    objc_msgSend(v17, "leafIcons");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_pas_mappedArrayWithIndexedTransform:", &__block_literal_global_22_0);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
      v33 = (void *)v31;
    else
      v33 = v4;
    v34 = v33;

    __atxlog_handle_default();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:].cold.4();

    v36 = (void *)objc_opt_new();
    v37 = v17;
    v38 = (void *)objc_opt_new();
    objc_msgSend(v37, "leafIcons");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v70[0] = v16;
    v70[1] = 3221225472;
    v70[2] = __folderIndexesForPage_block_invoke;
    v70[3] = &unk_1E4D585C0;
    v71 = v38;
    v40 = v38;
    objc_msgSend(v39, "enumerateObjectsUsingBlock:", v70);

    v57[0] = v16;
    v57[1] = 3221225472;
    v57[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_24;
    v57[3] = &unk_1E4D57B18;
    v41 = v20;
    v58 = v41;
    v42 = v36;
    v59 = v42;
    objc_msgSend(v40, "enumerateIndexesUsingBlock:", v57);

    __atxlog_handle_default();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:].cold.3();

    objc_msgSend(v41, "allObjects");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v16;
    v55[1] = 3221225472;
    v55[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_26;
    v55[3] = &unk_1E4D58578;
    v45 = v41;
    v56 = v45;
    objc_msgSend(v44, "sortedArrayUsingComparator:", v55);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_default();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:].cold.2();

    v4 = (void *)objc_opt_new();
    v48 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v4, "addObjectsFromArray:", v48);

    v49 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v4, "addObjectsFromArray:", v49);

    objc_msgSend(v4, "addObjectsFromArray:", v34);
    objc_msgSend(v4, "addObjectsFromArray:", v46);
    objc_msgSend(v4, "addObjectsFromArray:", v28);
    __atxlog_handle_default();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:].cold.1();

    v3 = v54;
  }

  return v4;
}

void __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(a2, "eventBody");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "starting"))
  {
    objc_msgSend(v6, "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "leafIcons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_3;
    v7[3] = &unk_1E4D58500;
    v8 = v3;
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    v5 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  }
}

void __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v7))
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
      *a4 = 1;
LABEL_7:

      goto LABEL_8;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_4;
    v11[3] = &unk_1E4D584D8;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 56);
    v14 = a3;
    objc_msgSend(v10, "enumerateApps:", v11);

    v7 = v12;
    goto LABEL_7;
  }
LABEL_8:

}

void __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", a1[4]);

  if (v4)
  {
    v5 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) == 0)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
    v6 = v10;
  }

}

uint64_t __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 >= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 > v8)
    return 1;
  else
    return v9;
}

id __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_20(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  char isKindOfClass;
  void *v6;

  v4 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_24(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 >= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 > v8)
    return 1;
  else
    return v9;
}

- (id)_pageForPageIndex:(unint64_t)a3
{
  ATXHomeScreenConfigCache *cache;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  cache = self->_cache;
  v20 = 0;
  -[ATXHomeScreenConfigCache loadHomeScreenAndTodayPageConfigurationsWithError:](cache, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v20;
  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenPageIconRanker _pageForPageIndex:].cold.1();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "pageIndex", (_QWORD)v16) == a3)
        {
          v14 = v13;
          goto LABEL_15;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXHomeScreenPageIconRanker: final sorted icon indexes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXHomeScreenPageIconRanker: sorted launched folder indexes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXHomeScreenPageIconRanker: unlaunched folder indexes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXHomeScreenPageIconRanker: web clip indexes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXHomeScreenPageIconRanker: sorted launched app indexes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXHomeScreenPageIconRanker: unlaunched app indexes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_pageForPageIndex:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_ERROR, "ATXHomeScreenPageIconRanker: Unable to retrieve home screen config: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
