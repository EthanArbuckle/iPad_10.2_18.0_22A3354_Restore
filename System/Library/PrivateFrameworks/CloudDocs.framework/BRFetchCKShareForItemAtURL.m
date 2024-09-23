@implementation BRFetchCKShareForItemAtURL

void __BRFetchCKShareForItemAtURL_block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    brc_bread_crumbs((uint64_t)"BRFetchCKShareForItemAtURL_block_invoke", 63);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      v18 = 138412802;
      v19 = v17;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v11;
      _os_log_debug_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched existing share %@, root share URL is %@%@", (uint8_t *)&v18, 0x20u);
    }

  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRFetchCKShareForItemAtURL_block_invoke", 59);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __BRFetchCKShareForItemAtURL_block_invoke_cold_1();

    v15 = *(_QWORD *)(a1[5] + 8);
    v16 = v10;
    v11 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __BRFetchCKShareForItemAtURL_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] file is not shared, error: %@%@");
  OUTLINED_FUNCTION_1();
}

@end
