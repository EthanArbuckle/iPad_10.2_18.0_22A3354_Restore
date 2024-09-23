@implementation FPUniversalBookmarkableStringFromDocumentURL

uint64_t __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id v9;

  v8 = *(_QWORD *)(result + 40);
  if (v8)
  {
    v9 = FPProviderNotFoundErrorForURL(*(_QWORD *)(result + 32), a2, a3, a4, a5, a6, a7, a8);
    return (*(uint64_t (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);
  }
  return result;
}

void __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 | v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_INFO, "[INFO] Created a universal bookmark for %@", (uint8_t *)&v11, 0xCu);

      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke_2_cold_1();
    }

    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(uint64_t, unint64_t, unint64_t))(v10 + 16))(v10, v5, v6);
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callNextOverrides");
  }

}

void __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_27_0();
  objc_msgSend(*(id *)(v1 + 40), "fp_scopeDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26_0(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] Could not create a universal bookmark for %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
