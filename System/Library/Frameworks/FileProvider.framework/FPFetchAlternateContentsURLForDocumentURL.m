@implementation FPFetchAlternateContentsURLForDocumentURL

void __FPFetchAlternateContentsURLForDocumentURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __FPFetchAlternateContentsURLForDocumentURL_block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __FPFetchAlternateContentsURLForDocumentURL_block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

void __FPFetchAlternateContentsURLForDocumentURL_block_invoke_cold_1()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_27_0();
  objc_msgSend(v1, "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 32), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v4, v5, "[DEBUG] did fetch %@ as alternate contents URL for document URL %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __FPFetchAlternateContentsURLForDocumentURL_block_invoke_cold_2()
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
  objc_msgSend((id)OUTLINED_FUNCTION_22_0(v1), "fp_scopeDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26_0(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] failed fetching alternate contents URL for document URL %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
