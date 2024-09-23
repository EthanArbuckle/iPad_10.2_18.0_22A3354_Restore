@implementation SFSafariDataSharingController

void __50___SFSafariDataSharingController_sharedController__block_invoke()
{
  _SFSafariDataSharingController *v0;
  void *v1;

  v0 = objc_alloc_init(_SFSafariDataSharingController);
  v1 = (void *)sharedController_sharedController_0;
  sharedController_sharedController_0 = (uint64_t)v0;

}

void __61___SFSafariDataSharingController_checkInAppBundleIDIfNeeded___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_loadAppBundlesWithSeparateDataIfNeeded");
  if ((objc_msgSend(*(id *)(*v2 + 16), "containsObject:", v2[1]) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("AppBundleIDsWithSeperateData"));
    objc_msgSend(v3, "synchronize");
    v4 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_INFO, "Apps currently using SafariViewController in Separated data mode...", v6, 2u);
    }
    v5 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __61___SFSafariDataSharingController_checkInAppBundleIDIfNeeded___block_invoke_cold_1((uint64_t)v2, v5);

  }
}

void __54___SFSafariDataSharingController_clearAllWebsitesData__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("AppBundleIDsWithSeperateData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v4;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "systemDataContainerURLWithAppBundleID:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("/Library"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "path");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v5, "fileExistsAtPath:", v13);

          if (v14)
          {
            objc_msgSend(v5, "removeItemAtURL:error:", v12, 0);
          }
          else
          {
            v15 = WBS_LOG_CHANNEL_PREFIXViewService();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A3B2D000, v15, OS_LOG_TYPE_INFO, "Skip clearing data for app since it has been uninstalled", buf, 2u);
            }
            v16 = WBS_LOG_CHANNEL_PREFIXViewService();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138477827;
              v25 = v10;
              _os_log_debug_impl(&dword_1A3B2D000, v16, OS_LOG_TYPE_DEBUG, "App bundle ID: %{private}@", buf, 0xCu);
            }
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", CFSTR("AppBundleIDsWithSeperateData"));
    objc_msgSend(v17, "synchronize");

    v4 = v18;
  }

}

void __61___SFSafariDataSharingController_checkInAppBundleIDIfNeeded___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v3 = 138477827;
  v4 = v2;
  _os_log_debug_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_DEBUG, "... apps: %{private}@", (uint8_t *)&v3, 0xCu);
}

@end
