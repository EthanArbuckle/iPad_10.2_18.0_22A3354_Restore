@implementation FPDocumentURLFromUniversalBookmarkableString

uint64_t __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke_2(uint64_t a1, void *a2, void *a3)
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
        objc_msgSend((id)v5, "fp_shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_INFO, "[INFO] Resolved universal bookmark to URL %@", (uint8_t *)&v11, 0xCu);

      }
      MEMORY[0x1A1AFFDB8](v5, CFSTR("FPFileIsBookmarkURLProperty"), *MEMORY[0x1E0C9AE50]);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke_2_cold_1((void *)v6);

    }
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, unint64_t, unint64_t))(v10 + 16))(v10, v5, v6);
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callNextOverrides");
  }

}

void __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11_3(&dword_1A0A34000, v2, v3, "[ERROR] Could not resolve universal bookmark. Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_1();
}

@end
