@implementation NSFileManager

uint64_t __53__NSFileManager_MobileBackup___removeAllPaths_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, a3);

  return v6;
}

uint64_t __54__NSFileManager_MobileBackup___migratePaths_to_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "moveItemAtPath:toPath:error:", v7, v8, a3);

  return v9;
}

@end
