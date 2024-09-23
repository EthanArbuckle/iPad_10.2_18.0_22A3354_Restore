@implementation SharedDataMigration

+ (id)_userCachesDirectoryPath
{
  void *v2;
  void *v3;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)_migrateCacheFileFromSubpath:(id)a3 toSubpath:(id)a4 ensureIsDirectory:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_userCachesDirectoryPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v37 = 0;
      v13 = 1;
      if (!objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v12, &v37) || !v37)
        goto LABEL_23;
    }
    else if (!objc_msgSend(v9, "fileExistsAtPath:", v12))
    {
      v13 = 1;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v11, "stringByAppendingPathComponent:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "fileExistsAtPath:", v14))
    {
      objc_msgSend(v9, "attributesOfItemAtPath:error:", v12, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileModificationDate");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "attributesOfItemAtPath:error:", v14, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileModificationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "compare:", v16) != -1)
      {
        v35 = 0;
        v19 = objc_msgSend(v9, "removeItemAtPath:error:", v12, &v35);
        v20 = v35;
        v21 = v20;
        if ((v19 & 1) == 0)
        {
          objc_msgSend(v20, "description");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog((NSString *)CFSTR("Failed to remove %@ because %@"), v12, v22);

        }
        v13 = 1;
        goto LABEL_20;
      }
      v36 = 0;
      v23 = objc_msgSend(v9, "removeItemAtPath:error:", v14, &v36);
      v24 = v36;
      v25 = v24;
      if ((v23 & 1) == 0)
      {
        objc_msgSend(v24, "description");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog((NSString *)CFSTR("Failed to remove %@ because %@"), v14, v26);

      }
    }
    objc_msgSend(v12, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog((NSString *)CFSTR("Migrating %@ ..."), v27);

    v34 = 0;
    v13 = objc_msgSend(v9, "moveItemAtPath:toPath:error:", v12, v14, &v34);
    v28 = v34;
    v29 = v28;
    if ((v13 & 1) != 0)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v28, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog((NSString *)CFSTR("Failed to migrate %@ because %@"), v12, v30);

    v33 = v29;
    v31 = objc_msgSend(v9, "removeItemAtPath:error:", v14, &v33);
    v16 = v33;

    if ((v31 & 1) != 0)
    {
LABEL_21:
      v29 = v16;
      goto LABEL_22;
    }
    objc_msgSend(v16, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog((NSString *)CFSTR("Failed to remove %@ because %@"), v14, v18);
LABEL_20:

    goto LABEL_21;
  }
  v13 = 0;
LABEL_24:

  return v13;
}

+ (void)migratePersistentStorageDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  SafariLibraryPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByResolvingSymlinksInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("WebKit/WebsiteData/LocalStorage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("WebKit/WebsiteData/WebSQL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", 1, CFSTR("WebKitLocalStorageEnabledPreferenceKey"));
  objc_msgSend(v6, "setObject:forKey:", v4, *MEMORY[0x1E0DD9830]);
  objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x1E0DD97E0]);
  objc_msgSend(v6, "synchronize");

}

+ (BOOL)migrateRecentSearches
{
  void *v2;
  char v3;

  objc_msgSend(CFSTR("com.apple.mobilesafari"), "stringByAppendingPathComponent:", CFSTR("RecentSearches.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "_migrateCacheFileFromSubpath:toSubpath:ensureIsDirectory:", CFSTR("Safari/RecentSearches.plist"), v2, 0);

  return v3;
}

+ (BOOL)migrateThumbnails
{
  void *v2;
  char v3;

  objc_msgSend(CFSTR("com.apple.mobilesafari"), "stringByAppendingPathComponent:", CFSTR("Thumbnails"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "_migrateCacheFileFromSubpath:toSubpath:ensureIsDirectory:", CFSTR("Safari/Thumbnails"), v2, 1);

  return v3;
}

+ (void)migrateTabDatabaseIfNeeded
{
  id v2;
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(void *, void *);
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD aBlock[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0DCCB60]);
  objc_msgSend(MEMORY[0x1E0DCCB18], "safariTabCollectionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithConfiguration:openDatabase:", v3, 1);

  v40 = v4;
  if ((objc_msgSend(v4, "hasCompletedMigration") & 1) == 0)
  {
    objc_msgSend(v4, "lockSync");
    objc_msgSend(MEMORY[0x1E0D4EF28], "sharedBrowserSavedState");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "browserWindows");
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v36)
    {
      v34 = *(_QWORD *)v45;
      v33 = *MEMORY[0x1E0D4F260];
      v32 = *MEMORY[0x1E0D4F258];
      v31 = *MEMORY[0x1E0D4F250];
      v30 = *MEMORY[0x1E0D4F240];
      v29 = *MEMORY[0x1E0D4F248];
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v45 != v34)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          v7 = objc_alloc(MEMORY[0x1E0DCCB90]);
          objc_msgSend(v6, "UUIDString");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sceneID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v7, "initWithUUID:sceneID:", v8, v9);

          objc_msgSend(v6, "UUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "savedTabsStateForBrowserControllerWithUUID:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v40, "saveWindowState:", v10);
            objc_msgSend(v12, "objectForKey:", v33);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:", v32);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "count") || objc_msgSend(v14, "count"))
            {
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __49__SharedDataMigration_migrateTabDatabaseIfNeeded__block_invoke;
              aBlock[3] = &unk_1E9CF6588;
              v38 = v40;
              v43 = v38;
              v15 = (void (**)(void *, void *))_Block_copy(aBlock);
              v15[2](v15, v13);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v14;
              v15[2](v15, v14);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "localTabGroup");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "privateTabGroup");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "safari_numberForKey:", v31);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "unsignedIntegerValue");

              if (v19 < objc_msgSend(v13, "count"))
              {
                objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "safari_stringForKey:", v30);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setLastSelectedTabUUID:", v21);
                objc_msgSend(v16, "uuid");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setActiveTabUUID:forTabGroupWithUUID:", v21, v22);

              }
              objc_msgSend(v12, "safari_numberForKey:", v29);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "unsignedIntegerValue");

              v14 = v41;
              if (v24 < objc_msgSend(v41, "count"))
              {
                objc_msgSend(v41, "objectAtIndexedSubscript:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "safari_stringForKey:", v30);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setLastSelectedTabUUID:", v26);
                objc_msgSend(v17, "uuid");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setActiveTabUUID:forTabGroupWithUUID:", v26, v27);

                v14 = v41;
              }
              objc_msgSend(v38, "insertTabs:inTabGroup:afterTab:", v39, v16, 0);
              objc_msgSend(v38, "insertTabs:inTabGroup:afterTab:", v37, v17, 0);

            }
          }

        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v36);
    }
    objc_msgSend(v40, "setCompletedMigration:", 1);
    objc_msgSend(v40, "unlockSync");

  }
}

id __49__SharedDataMigration_migrateTabDatabaseIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SharedDataMigration_migrateTabDatabaseIfNeeded__block_invoke_2;
  v5[3] = &unk_1E9CF6560;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __49__SharedDataMigration_migrateTabDatabaseIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = *MEMORY[0x1E0D4F240];
  v4 = a2;
  objc_msgSend(v4, "safari_stringForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x1E0D4F230]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x1E0D4F238]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);
  v10 = objc_alloc(MEMORY[0x1E0DCCB58]);
  objc_msgSend(*(id *)(a1 + 32), "currentDeviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithUUID:title:url:deviceIdentifier:", v5, v6, v9, v11);

  return v12;
}

@end
