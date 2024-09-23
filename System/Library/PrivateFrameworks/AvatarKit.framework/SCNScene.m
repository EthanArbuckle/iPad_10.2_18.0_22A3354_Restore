@implementation SCNScene

void __90__SCNScene_AVTExtension__avt_setInitialValuesExportedAsAnimationsWithWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "animationKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "animationForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        AVTSetInitialValuesExportedAsAnimations(v3, v10, *(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 != v10)
        {
          objc_msgSend(v3, "removeAnimationForKey:", v9);
          if (v11)
            objc_msgSend(v3, "addAnimation:forKey:", v11, v9);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __69__SCNScene_AVTExtension__avt_removeDuplicateSkeletonRootWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(a2, "skinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skeleton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    objc_msgSend(v3, "setSkeleton:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "bones");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      avt_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __69__SCNScene_AVTExtension__avt_removeDuplicateSkeletonRootWithHandler___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

    }
  }

}

void __76__SCNScene_AVTExtension__avt_removeFaceSetsExportedAsDummyNodesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("_MTL"));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __69__SCNScene_AVTExtension__avt_removeDuplicateSkeletonRootWithHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Root joint shouldn't never be bound", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
