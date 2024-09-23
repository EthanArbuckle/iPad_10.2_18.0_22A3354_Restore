@implementation DiscoveredMaterialRecipeURLs

void ___DiscoveredMaterialRecipeURLs_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "coreMaterialRecipeBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLsForMaterialRecipes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLsForMaterialRecipeDescendants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v0, "containsObject:", v10, (_QWORD)v12) & 1) == 0)
          objc_msgSend(v0, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11 = (void *)_DiscoveredMaterialRecipeURLs___discoveredMaterialRecipeURLs;
  _DiscoveredMaterialRecipeURLs___discoveredMaterialRecipeURLs = (uint64_t)v0;

}

@end
