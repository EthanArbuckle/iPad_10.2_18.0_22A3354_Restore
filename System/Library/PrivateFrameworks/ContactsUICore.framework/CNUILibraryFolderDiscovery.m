@implementation CNUILibraryFolderDiscovery

+ (id)localImageFolders
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CNUILibraryFolderDiscovery_localImageFolders__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localImageFolders_cn_once_token_1 != -1)
    dispatch_once(&localImageFolders_cn_once_token_1, block);
  return (id)localImageFolders_cn_once_object_1;
}

void __47__CNUILibraryFolderDiscovery_localImageFolders__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "discoverFoldersWithPathComponents:fileManager:", &unk_1EA61C670, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)localImageFolders_cn_once_object_1;
  localImageFolders_cn_once_object_1 = v3;

}

+ (id)discoverFoldersWithPathComponents:(id)a3 fileManager:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  id v19;
  char *v20;
  void *v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  void *v28;
  int AppBooleanValue;
  char *v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v33 = a4;
  v28 = (void *)MEMORY[0x1DF0D61B4]();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ABImageDebug"), CFSTR("com.apple.AddressBook"), 0);
  NSSearchPathForDirectoriesInDomains(NSAllLibrariesDirectory, 0xFFFFuLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = &v25;
  v25 = objc_msgSend(v5, "count");
  v30 = (char *)&v25 - ((8 * v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = 8 * v25;
  bzero(v30, 8 * v25);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v31 = v5;
  v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  v6 = 0;
  if (v35)
  {
    v32 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(v31);
        v8 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v9 = v34;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        v11 = v8;
        if (v10)
        {
          v12 = v10;
          v13 = *(_QWORD *)v38;
          v11 = v8;
          do
          {
            v14 = 0;
            v15 = v11;
            do
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v9);
              objc_msgSend(v15, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v14));
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              ++v14;
              v15 = v11;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v12);
        }

        v36 = 0;
        if (objc_msgSend(v33, "fileExistsAtPath:isDirectory:", v11, &v36))
          v16 = v36 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 1);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)&v30[8 * v6];
          *(_QWORD *)&v30[8 * v6] = v17;

          if (AppBooleanValue)
            NSLog(CFSTR("[RIL] Found image library at %@"), v8);
          ++v6;
        }

      }
      v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v35);
  }

  v19 = objc_alloc(MEMORY[0x1E0C99D20]);
  v20 = v30;
  v21 = (void *)objc_msgSend(v19, "initWithObjects:count:", v30, v6);
  v22 = v26;
  if (v25)
  {
    v23 = v20 - 8;
    do
    {

      v22 -= 8;
    }
    while (v22);
  }

  objc_autoreleasePoolPop(v28);
  return v21;
}

@end
