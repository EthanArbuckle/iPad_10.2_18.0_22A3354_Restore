@implementation FPDidUpdateAlternateContentsDocumentForDocumentAtURL

void __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke(uint64_t a1, void *a2)
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
      __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke_cold_1(a1, v5);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_22_0(a1), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] did update alternate contents document for document at URL %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke_cold_2()
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
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] failed updating alternate contents document for document at URL %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
