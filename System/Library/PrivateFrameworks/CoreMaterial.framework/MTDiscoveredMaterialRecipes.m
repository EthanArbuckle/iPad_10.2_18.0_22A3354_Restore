@implementation MTDiscoveredMaterialRecipes

void __MTDiscoveredMaterialRecipes_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  if (_DiscoveredMaterialRecipeURLs_onceToken != -1)
    dispatch_once(&_DiscoveredMaterialRecipeURLs_onceToken, &__block_literal_global_142);
  obj = (id)_DiscoveredMaterialRecipeURLs___discoveredMaterialRecipeURLs;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      v1 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v1), "lastPathComponent");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "stringByDeletingPathExtension");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        if (_LoadCoreMaterialRecipeNames_onceToken != -1)
          dispatch_once(&_LoadCoreMaterialRecipeNames_onceToken, &__block_literal_global_143);
        v4 = (id)__coreMaterialRecipeNames;
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (!v5)
        {

LABEL_22:
          objc_msgSend(v0, "addObject:", v3);
          goto LABEL_23;
        }
        v6 = v5;
        v17 = v1;
        v7 = 0;
        v8 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v19 != v8)
              objc_enumerationMutation(v4);
            v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            _RecipeNameForCoreMaterialRecipe(v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v3, "isEqualToString:", v11);

            if (v12)
            {
              objc_msgSend(v0, "addObject:", v10);
              v7 = 1;
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v6);

        v1 = v17;
        if ((v7 & 1) == 0)
          goto LABEL_22;
LABEL_23:

        ++v1;
      }
      while (v1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v16);
  }

  v13 = (void *)MTDiscoveredMaterialRecipes___materialRecipes;
  MTDiscoveredMaterialRecipes___materialRecipes = (uint64_t)v0;

}

@end
