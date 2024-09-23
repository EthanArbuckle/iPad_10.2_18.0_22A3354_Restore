@implementation FPFileProviderServiceEndpointCreatingForItemAtURL

void __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id v9;

  v8 = *(_QWORD *)(a1 + 40);
  FPProviderNotFoundErrorForURL(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v8 + 16))(v8, 0, 0, 0, v9);

}

void __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  unint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v9 | v12)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2_cold_1(v10, a1, v14);
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2_cold_2(a1, v12, v14);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callNextOverrides");
  }

}

void __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a2 + 40), "fp_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, v7, "[DEBUG] got services [%@] for item at URL %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_7();
}

void __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] failed to get services for for item at URL %@: %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_7();
}

@end
