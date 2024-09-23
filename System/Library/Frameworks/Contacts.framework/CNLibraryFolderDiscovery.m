@implementation CNLibraryFolderDiscovery

+ (NSArray)localImageFolders
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CNLibraryFolderDiscovery_localImageFolders__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localImageFolders_cn_once_token_0 != -1)
    dispatch_once(&localImageFolders_cn_once_token_0, block);
  return (NSArray *)(id)localImageFolders_cn_once_object_0;
}

void __45__CNLibraryFolderDiscovery_localImageFolders__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "discoverFoldersWithPathComponents:", &unk_1E2A407A0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)localImageFolders_cn_once_object_0;
  localImageFolders_cn_once_object_0 = v1;

}

+ (id)discoverFoldersWithPathComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x19400675C]();
  NSSearchPathForDirectoriesInDomains(NSAllLibrariesDirectory, 0xFFFFuLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_distinctObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CNLibraryFolderDiscovery_discoverFoldersWithPathComponents___block_invoke;
  v11[3] = &unk_1E29FE248;
  v7 = v3;
  v12 = v7;
  objc_msgSend(v6, "_cn_map:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_filter:", &__block_literal_global_149);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v9;
}

id __62__CNLibraryFolderDiscovery_discoverFoldersWithPathComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v6 = v3;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    v6 = v3;
    do
    {
      v9 = 0;
      v10 = v6;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(v10, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v6;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __62__CNLibraryFolderDiscovery_discoverFoldersWithPathComponents___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  char v9;

  v9 = 0;
  v2 = (void *)MEMORY[0x1E0D13A38];
  v3 = a2;
  objc_msgSend(v2, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtURL:isDirectory:", v3, &v9);

  if (v9)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

@end
