@implementation LoadCoreMaterialRecipeNames

void ___LoadCoreMaterialRecipeNames_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "coreMaterialRecipeBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForMaterialRecipes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForMaterialRecipeDescendants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v1;
  objc_msgSend(v1, "arrayByAddingObjectsFromArray:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByDeletingPathExtension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = MTLogConfiguration;
        if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          v21 = v11;
          v22 = 2114;
          v23 = v9;
          _os_log_debug_impl(&dword_1AAB41000, v12, OS_LOG_TYPE_DEBUG, "Found recipe '%{public}@' at URL: %{public}@", buf, 0x16u);
        }
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

  v13 = (void *)__coreMaterialRecipeNames;
  __coreMaterialRecipeNames = (uint64_t)v3;

}

@end
