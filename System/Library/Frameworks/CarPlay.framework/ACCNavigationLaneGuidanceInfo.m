@implementation ACCNavigationLaneGuidanceInfo

id __78__ACCNavigationLaneGuidanceInfo_CPAccNavInfo__initWithLaneGuidance_component___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a2, "key");
  if (v3 == 3)
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "instructionVariants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CP_variantFittingLaneGuidanceDescription:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = (void *)objc_opt_new();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "lanes", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00BC0]), "initWithLane:component:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), *(_QWORD *)(a1 + 40));
            objc_msgSend(v4, "addObject:", v10);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v7);
      }

    }
    else
    {
      v4 = 0;
    }
    return v4;
  }
}

@end
