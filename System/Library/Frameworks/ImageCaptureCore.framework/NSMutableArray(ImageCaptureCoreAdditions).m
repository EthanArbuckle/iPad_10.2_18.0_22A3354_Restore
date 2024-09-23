@implementation NSMutableArray(ImageCaptureCoreAdditions)

- (void)addTruth:()ImageCaptureCoreAdditions code:
{
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addObject:", v5);

  }
}

- (void)addItemsMatchingType:()ImageCaptureCoreAdditions fromFolder:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = v8;
    objc_msgSend(v8, "files");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1E0CEC3F8];
          objc_msgSend(v15, "UTI");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "typeWithIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "conformsToType:", v9))
            objc_msgSend(a1, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v12);
    }

    v8 = v25;
  }
  else
  {
    objc_msgSend(v7, "files");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addObjectsFromArray:", v19);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v8, "folders");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(a1, "addItemsMatchingType:fromFolder:", v6, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v22);
  }

}

- (void)addItemsMatchingTypes:()ImageCaptureCoreAdditions fromFolder:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "addItemsMatchingType:fromFolder:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

@end
