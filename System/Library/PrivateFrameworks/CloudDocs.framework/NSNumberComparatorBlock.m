@implementation NSNumberComparatorBlock

uint64_t br_NSNumberComparatorBlock_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"br_NSNumberComparatorBlock_block_invoke", 14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      br_NSNumberComparatorBlock_block_invoke_cold_2((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"br_NSNumberComparatorBlock_block_invoke", 15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      br_NSNumberComparatorBlock_block_invoke_cold_1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

  }
  v6 = objc_msgSend(v4, "compare:", v5);

  return v6;
}

void br_NSNumberComparatorBlock_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: [obj2 isKindOfClass:NSNumber.class]%@", a5, a6, a7, a8, 2u);
}

void br_NSNumberComparatorBlock_block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: [obj1 isKindOfClass:NSNumber.class]%@", a5, a6, a7, a8, 2u);
}

@end
