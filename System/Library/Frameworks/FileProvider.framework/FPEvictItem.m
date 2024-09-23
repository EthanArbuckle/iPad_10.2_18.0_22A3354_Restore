@implementation FPEvictItem

void __FPEvictItem_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __FPEvictItem_block_invoke_cold_1();

  }
}

void __FPEvictItem_block_invoke_cold_1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_22_0(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26_0(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] Cannot evict item at URL %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
