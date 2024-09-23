@implementation FPSetAlternateContentsURLOnDocumentURL

void __FPSetAlternateContentsURLOnDocumentURL_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __FPSetAlternateContentsURLOnDocumentURL_block_invoke_cold_2((id *)a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __FPSetAlternateContentsURLOnDocumentURL_block_invoke_cold_1(a1);
  }

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __FPSetAlternateContentsURLOnDocumentURL_block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend((id)OUTLINED_FUNCTION_22_0(a1), "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v4, v5, "[DEBUG] did set %@ as alternate contents URL on document URL %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __FPSetAlternateContentsURLOnDocumentURL_block_invoke_cold_2(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1[4], "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "fp_scopeDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26_0(), "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_8_2(&dword_1A0A34000, v4, v5, "[ERROR] failed to set %@ as alternate contents URL on document URL %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_11_1();
}

@end
