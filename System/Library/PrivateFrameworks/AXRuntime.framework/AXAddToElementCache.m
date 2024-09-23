@implementation AXAddToElementCache

void ___AXAddToElementCache_block_invoke(uint64_t a1)
{
  void **v2;
  uint64_t *v3;
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;
  NSMapTable *v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;

  v2 = (void **)(a1 + 32);
  NSMapGet((NSMapTable *)_ElementCache, (const void *)~*(_QWORD *)(a1 + 32));
  v3 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    AXRuntimeLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ___AXAddToElementCache_block_invoke_cold_1((uint64_t *)(a1 + 32), v4);

    v5 = v3 + 2;
  }
  else
  {
    v6 = _ElementCacheUniqueID;
    do
    {
      v7 = v6 == 9998 || kAXLookingGlassUID - 1 == v6;
      ++v6;
    }
    while (v7);
    v5 = &_ElementCacheUniqueID;
    _ElementCacheUniqueID = v6;
    v8 = (NSMapTable *)_ElementCache;
    v9 = *v2;
    v10 = ~(unint64_t)*v2;
    v11 = v9;
    +[_AXObjectCacheHelper helperWithElement:uid:]((uint64_t)_AXObjectCacheHelper, (uint64_t)v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v11, &AXCacheHelper, v12, (void *)1);

    NSMapInsert(v8, (const void *)v10, v12);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *v5;

}

void ___AXAddToElementCache_block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_ERROR, "_AXAddToElementCache was called even though the element was in the cache: %@", (uint8_t *)&v3, 0xCu);
}

@end
