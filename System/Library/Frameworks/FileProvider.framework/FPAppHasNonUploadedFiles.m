@implementation FPAppHasNonUploadedFiles

void __FPAppHasNonUploadedFiles_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __FPAppHasNonUploadedFiles_block_invoke_cold_2(a1, v5);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __FPAppHasNonUploadedFiles_block_invoke_cold_1(a1, a2, v7);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

void __FPAppHasNonUploadedFiles_block_invoke_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  const __CFString *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  v4 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
    v3 = CFSTR("YES");
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = v3;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, (uint64_t)a3, "[DEBUG] did check if app %@ is uploading files, result was %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_3();
}

void __FPAppHasNonUploadedFiles_block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] Failed checking if app %@ is uploading files: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
