@implementation NSMutableDictionary

uint64_t __75__NSMutableDictionary_MTMaterialDescriptionInternal__sortFiltersWithOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a2, "objectForKey:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MTCompareObjectsWithOrder((uint64_t)v6, v7, *(void **)(a1 + 32));
  return v8;
}

@end
