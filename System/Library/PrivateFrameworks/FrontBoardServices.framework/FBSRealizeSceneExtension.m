@implementation FBSRealizeSceneExtension

void __FBSRealizeSceneExtension_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = (void *)__SceneExtensions;
  if (!__SceneExtensions)
  {
    v3 = objc_opt_new();
    v4 = (void *)__SceneExtensions;
    __SceneExtensions = v3;

    v2 = (void *)__SceneExtensions;
  }
  if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v5 = (void *)MEMORY[0x19AECA15C]();
    objc_msgSend((id)__SceneExtensions, "addObject:", *(_QWORD *)(a1 + 32));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "settingsExtensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          objc_opt_class();
          _realizeSettingsExtension();
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v8);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "clientSettingsExtensions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          objc_opt_class();
          _realizeSettingsExtension();
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v13);
    }

    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "transitionContextExtensions", 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_opt_class();
          _realizeSettingsExtension();
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v18);
    }

    objc_autoreleasePoolPop(v5);
  }
}

@end
