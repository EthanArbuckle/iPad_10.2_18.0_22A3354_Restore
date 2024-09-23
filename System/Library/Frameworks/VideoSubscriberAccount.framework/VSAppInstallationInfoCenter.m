@implementation VSAppInstallationInfoCenter

- (VSOptional)installedAppBundleIDs
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)MEMORY[0x1D8236758]();
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 128);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D8236758](v5);
        objc_msgSend(v9, "bundleIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v2, "addObject:", v11);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v6 = v5;
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v3);
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (VSOptional *)v12;
}

@end
