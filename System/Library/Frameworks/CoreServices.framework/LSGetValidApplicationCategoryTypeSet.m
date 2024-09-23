@implementation LSGetValidApplicationCategoryTypeSet

void ___LSGetValidApplicationCategoryTypeSet_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;

  if ((*(_BYTE *)(a3 + 8) & 0x20) != 0)
  {
    v4 = (const void *)_CSStringCopyCFString();
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), v4);
    CFRelease(v4);
  }
}

void ___LSGetValidApplicationCategoryTypeSet_block_invoke_52(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    ___LSGetValidApplicationCategoryTypeSet_block_invoke_52_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void ___LSGetValidApplicationCategoryTypeSet_block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (v6)
  {
    _LSDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      ___LSGetValidApplicationCategoryTypeSet_block_invoke_54_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  }
}

void ___LSGetValidApplicationCategoryTypeSet_block_invoke_52_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "Error on connection finding category type identifiers from lsd: %@", a5, a6, a7, a8, 2u);
}

void ___LSGetValidApplicationCategoryTypeSet_block_invoke_54_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "Error finding category type identifiers from lsd: %@", a5, a6, a7, a8, 2u);
}

@end
