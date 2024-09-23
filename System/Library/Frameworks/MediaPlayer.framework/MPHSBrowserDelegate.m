@implementation MPHSBrowserDelegate

- (void)browser:(id)a3 didAddLibrary:(id)a4
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MPHSBrowserDelegate_browser_didAddLibrary___block_invoke;
  block[3] = &unk_1E3163508;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)browser:(id)a3 didRemoveLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__MPHSBrowserDelegate_browser_didRemoveLibrary___block_invoke;
  v9[3] = &unk_1E31635F8;
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __48__MPHSBrowserDelegate_browser_didRemoveLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[MPMediaLibrary mediaLibraries](MPMediaLibrary, "mediaLibraries", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("libraryDataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "homeSharingLibrary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

          if (v10)
          {
            v11 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v12 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v18 = v12;
              v19 = 2114;
              v20 = v8;
              _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Browser: %{public}@ Removed %{public}@", buf, 0x16u);
            }

            +[MPMediaLibrary removeLibraryDataProvider:removalReason:](MPMediaLibrary, "removeLibraryDataProvider:removalReason:", v8, 1);
            goto LABEL_14;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

}

void __45__MPHSBrowserDelegate_browser_didAddLibrary___block_invoke(uint64_t a1)
{
  NSObject *v2;
  MPHomeSharingML3DataProvider *v3;
  MPHomeSharingML3DataProvider *v4;
  NSObject *v5;
  int v6;
  MPHomeSharingML3DataProvider *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (MPHomeSharingML3DataProvider *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Found library %{public}@", (uint8_t *)&v6, 0xCu);

  }
  v4 = -[MPHomeSharingML3DataProvider initWithHomeSharingLibrary:]([MPHomeSharingML3DataProvider alloc], "initWithHomeSharingLibrary:", *(_QWORD *)(a1 + 32));
  +[MPMediaLibrary addLibraryDataProvider:](MPMediaLibrary, "addLibraryDataProvider:", v4);
  v5 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Added %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

@end
