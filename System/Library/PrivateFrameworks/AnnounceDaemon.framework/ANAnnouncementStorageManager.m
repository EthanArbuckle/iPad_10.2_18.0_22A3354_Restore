@implementation ANAnnouncementStorageManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ANAnnouncementStorageManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_manager;
}

uint64_t __45__ANAnnouncementStorageManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.announce.announcements"));
  v3 = *(void **)(sharedManager_manager + 8);
  *(_QWORD *)(sharedManager_manager + 8) = v2;

  v4 = objc_opt_new();
  v5 = *(void **)(sharedManager_manager + 16);
  *(_QWORD *)(sharedManager_manager + 16) = v4;

  return objc_msgSend(*(id *)(sharedManager_manager + 16), "setDelegate:");
}

- (id)storedAnnouncementsForEndpointID:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForDefault:", *MEMORY[0x1E0CF7B48]);

  if (v5)
  {
    ANLogHandleAnnouncementStorageManager();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = &stru_1E93913D0;
      v37 = 2112;
      v38 = v29;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "%@Loading Announcements from Metadata for EndpontID: %@", buf, 0x16u);
    }

    objc_msgSend(v29, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnouncementStorageManager defaults](self, "defaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v27 = v9;
      v28 = v7;
      objc_msgSend(v9, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "na_map:", &__block_literal_global_10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v13 = v11;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            -[ANAnnouncementStorageManager fileManager](self, "fileManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "filePath");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

            if ((v21 & 1) == 0)
            {
              objc_msgSend(v18, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[ANAnnouncementStorageManager deleteAnnouncementWithID:endpointID:](self, "deleteAnnouncementWithID:endpointID:", v22, v29);

              ANLogHandleAnnouncementStorageManager();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v18, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v36 = &stru_1E93913D0;
                v37 = 2112;
                v38 = v24;
                _os_log_impl(&dword_1D23A0000, v23, OS_LOG_TYPE_DEFAULT, "%@Deleting Announcement missing Audio Data on disk: %@", buf, 0x16u);

              }
              objc_msgSend(v12, "removeObject:", v18);
            }
          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v15);
      }

      v25 = (void *)objc_msgSend(v12, "copy");
      v9 = v27;
      v7 = v28;
    }
    else
    {
      ANLogHandleAnnouncementStorageManager();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v36 = &stru_1E93913D0;
        v37 = 2112;
        v38 = v29;
        _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@No Announcements found for Endpoint %@", buf, 0x16u);
      }
      v25 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v25;
}

id __65__ANAnnouncementStorageManager_storedAnnouncementsForEndpointID___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CF7DF8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithMessage:", v3);

  return v4;
}

- (void)saveAnnouncement:(id)a3 endpointID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[ANAnnouncementStorageManager _saveAudioDataForAnnouncement:endpointID:](self, "_saveAudioDataForAnnouncement:endpointID:", v10, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForDefault:", *MEMORY[0x1E0CF7B48]);

    if (v9)
      -[ANAnnouncementStorageManager _saveMetadataForAnnouncement:endpointID:](self, "_saveMetadataForAnnouncement:endpointID:", v10, v6);
  }

}

- (void)deleteAnnouncementWithID:(id)a3 endpointID:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForDefault:", *MEMORY[0x1E0CF7B90]);

  if ((v8 & 1) == 0)
    -[ANAnnouncementStorageManager _removeAudioDataForAnnouncementID:endpointID:](self, "_removeAudioDataForAnnouncementID:endpointID:", v11, v6);
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForDefault:", *MEMORY[0x1E0CF7B48]);

  if (v10)
    -[ANAnnouncementStorageManager _removeMetadataForAnnouncementID:endpointID:](self, "_removeMetadataForAnnouncementID:endpointID:", v11, v6);

}

- (void)deleteAnnouncementsExcludingAnnouncementsForEndpointIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ANLogHandleAnnouncementStorageManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = &stru_1E93913D0;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@Scrubbing stored announcements excluding: %@", buf, 0x16u);
  }

  -[ANAnnouncementStorageManager defaults](self, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v16 = (void *)objc_msgSend(v15, "initWithUUIDString:", v14, (_QWORD)v18);
        if (v16 && (objc_msgSend(v4, "containsObject:", v16) & 1) == 0)
        {
          -[ANAnnouncementStorageManager defaults](self, "defaults");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObjectForKey:", v14);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[ANAnnouncementStorageManager _removeDirectoryForEndpointsExcludingEndpointIDs:](self, "_removeDirectoryForEndpointsExcludingEndpointIDs:", v4);
}

- (void)removeAnnouncementDataExcludingDataForAnnouncementIDs:(id)a3 endpointID:(id)a4
{
  id v6;
  char *v7;
  id v8;
  void *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  const char *v35;
  uint32_t v36;
  char *v37;
  char *v38;
  ANAnnouncementStorageManager *v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  char *v53;
  __int16 v54;
  char *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47 = 0;
  -[ANAnnouncementStorageManager _announcementDataDirectoryForType:endpointID:error:](self, "_announcementDataDirectoryForType:endpointID:error:", CFSTR("received"), a4, &v47);
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v47;
  if (v7)
  {
    -[ANAnnouncementStorageManager fileManager](self, "fileManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v8;
    objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, MEMORY[0x1E0C9AA60], 0, &v46);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (char *)v46;

    ANLogHandleAnnouncementStorageManager();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      v38 = v11;
      v39 = self;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v49 = &stru_1E93913D0;
        v50 = 2112;
        v51 = v7;
        _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@Cleaning Announcement Data in: %@", buf, 0x16u);
      }
      v37 = v7;

      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v10 = v10;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v43;
        do
        {
          v17 = 0;
          v40 = v15;
          do
          {
            if (*(_QWORD *)v43 != v16)
              objc_enumerationMutation(v10);
            v18 = *(char **)(*((_QWORD *)&v42 + 1) + 8 * v17);
            ANLogHandleAnnouncementStorageManager();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v49 = &stru_1E93913D0;
              v50 = 2112;
              v51 = v18;
              _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "%@Checking item %@", buf, 0x16u);
            }

            objc_msgSend(v18, "URLByDeletingPathExtension");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "lastPathComponent");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("--"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v6, "containsObject:", v23) & 1) == 0)
            {
              v24 = v16;
              v25 = v10;
              v26 = v6;
              ANLogHandleAnnouncementStorageManager();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v49 = &stru_1E93913D0;
                v50 = 2112;
                v51 = v18;
                _os_log_impl(&dword_1D23A0000, v27, OS_LOG_TYPE_DEFAULT, "%@Removing item %@", buf, 0x16u);
              }

              -[ANAnnouncementStorageManager fileManager](v39, "fileManager");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = 0;
              v29 = objc_msgSend(v28, "removeItemAtURL:error:", v18, &v41);
              v30 = v41;

              ANLogHandleAnnouncementStorageManager();
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = v31;
              if ((v29 & 1) != 0)
              {
                v6 = v26;
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v49 = &stru_1E93913D0;
                  v50 = 2080;
                  v51 = "-[ANAnnouncementStorageManager removeAnnouncementDataExcludingDataForAnnouncementIDs:endpointID:]";
                  v52 = 2112;
                  v53 = v18;
                  v33 = v32;
                  v34 = OS_LOG_TYPE_DEFAULT;
                  v35 = "%@%s Successfully removed item %@";
                  v36 = 32;
                  goto LABEL_20;
                }
              }
              else
              {
                v6 = v26;
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138413058;
                  v49 = &stru_1E93913D0;
                  v50 = 2080;
                  v51 = "-[ANAnnouncementStorageManager removeAnnouncementDataExcludingDataForAnnouncementIDs:endpointID:]";
                  v52 = 2112;
                  v53 = v18;
                  v54 = 2112;
                  v55 = v38;
                  v33 = v32;
                  v34 = OS_LOG_TYPE_ERROR;
                  v35 = "%@%s Failed to remove item: %@, Error = %@";
                  v36 = 42;
LABEL_20:
                  _os_log_impl(&dword_1D23A0000, v33, v34, v35, buf, v36);
                }
              }

              v10 = v25;
              v16 = v24;
              v15 = v40;
            }

            ++v17;
          }
          while (v15 != v17);
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        }
        while (v15);
      }

      v7 = v37;
      v11 = v38;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v49 = &stru_1E93913D0;
        v50 = 2112;
        v51 = v11;
        _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_ERROR, "%@Failed to get contents of directory: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    ANLogHandleAnnouncementStorageManager();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v49 = &stru_1E93913D0;
      v50 = 2112;
      v51 = (const char *)v8;
      _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_ERROR, "%@Failed to get Directory for saved announcements. %@", buf, 0x16u);
    }
    v11 = (char *)v8;
  }

}

- (void)_saveMetadataForAnnouncement:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  ANLogHandleAnnouncementStorageManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ANAnnouncementStorageManager defaults](self, "defaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412546;
    v23 = &stru_1E93913D0;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@Saving Announcement Metadata to %@", (uint8_t *)&v22, 0x16u);

  }
  objc_msgSend(v6, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  ANLogHandleAnnouncementStorageManager();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = &stru_1E93913D0;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@Key: %@", (uint8_t *)&v22, 0x16u);
  }

  -[ANAnnouncementStorageManager defaults](self, "defaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryForKey:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x1E0C9AA70];
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v7, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v19);
  -[ANAnnouncementStorageManager defaults](self, "defaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v20, "setObject:forKey:", v21, v10);

}

- (id)_saveAudioDataForAnnouncement:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30 = 0;
  -[ANAnnouncementStorageManager _announcementDataDirectoryForType:endpointID:error:](self, "_announcementDataDirectoryForType:endpointID:error:", CFSTR("received"), v7, &v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v30;
  v10 = v9;
  if (v8)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF7E98], "an_dateFormatterForFilename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromDate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@--%@"), v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URLByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathExtension:", CFSTR("caf"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    ANLogHandleAnnouncementStorageManager();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "fileData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");
      *(_DWORD *)buf = 138412802;
      v32 = &stru_1E93913D0;
      v33 = 2112;
      v34 = v18;
      v35 = 2048;
      v36 = v21;
      _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "%@Saving to URL: %@, Size: %lu", buf, 0x20u);

    }
    objc_msgSend(v6, "fileData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v10;
    v23 = objc_msgSend(v22, "writeToURL:options:error:", v18, 1, &v29);
    v24 = v29;

    if ((v23 & 1) != 0)
    {
      objc_msgSend(v18, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFilePath:", v25);
    }
    else
    {
      ANLogHandleAnnouncementStorageManager();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v32 = &stru_1E93913D0;
        v33 = 2112;
        v34 = v24;
        _os_log_impl(&dword_1D23A0000, v26, OS_LOG_TYPE_ERROR, "%@Failed to write data: %@", buf, 0x16u);
      }

      +[ANAnalytics shared](ANAnalytics, "shared");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "error:context:", 5009, v27);

    }
  }
  else
  {
    v24 = v9;
  }

  return v24;
}

- (void)_removeAudioDataForAnnouncementID:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  ANAnnouncementStorageManager *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  uint8_t buf[4];
  const __CFString *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v39 = 0;
  -[ANAnnouncementStorageManager _announcementDataDirectoryForType:endpointID:error:](self, "_announcementDataDirectoryForType:endpointID:error:", CFSTR("received"), v7, &v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v39;
  -[ANAnnouncementStorageManager fileManager](self, "fileManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v9;
  objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, MEMORY[0x1E0C9AA60], 0, &v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v38;

  if (v11)
  {
    v29 = self;
    v30 = v7;
    v31 = v12;
    v32 = v11;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v11;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          ANLogHandleAnnouncementStorageManager();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v41 = &stru_1E93913D0;
            v42 = 2112;
            v43 = v18;
            _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "%@Checking item %@", buf, 0x16u);
          }

          objc_msgSend(v18, "URLByDeletingPathExtension");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("--"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v6, "isEqualToString:", v23))
          {
            -[ANAnnouncementStorageManager fileManager](v29, "fileManager");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v31;
            v25 = objc_msgSend(v24, "removeItemAtURL:error:", v18, &v33);
            v12 = v33;

            ANLogHandleAnnouncementStorageManager();
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if ((v25 & 1) != 0)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v41 = &stru_1E93913D0;
                v42 = 2112;
                v43 = v18;
                v44 = 2112;
                v45 = v6;
                _os_log_impl(&dword_1D23A0000, v27, OS_LOG_TYPE_DEFAULT, "%@Removed file (%@) for AnnouncementID (%@)", buf, 0x20u);
              }
              v7 = v30;
            }
            else
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v41 = &stru_1E93913D0;
                v42 = 2112;
                v43 = v18;
                v44 = 2112;
                v45 = v12;
                _os_log_impl(&dword_1D23A0000, v27, OS_LOG_TYPE_ERROR, "%@Failed to remove file (%@): %@", buf, 0x20u);
              }

              +[ANAnalytics shared](ANAnalytics, "shared");
              v27 = objc_claimAutoreleasedReturnValue();
              v7 = v30;
              +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v30);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject error:context:](v27, "error:context:", 5010, v28);

            }
            goto LABEL_25;
          }

        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        if (v15)
          continue;
        break;
      }
    }

    ANLogHandleAnnouncementStorageManager();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v41 = &stru_1E93913D0;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@File does not exist for %@. Nothing to delete.", buf, 0x16u);
    }
    v7 = v30;
    v12 = v31;
LABEL_25:
    v11 = v32;
  }
  else
  {
    ANLogHandleAnnouncementStorageManager();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v41 = &stru_1E93913D0;
      v42 = 2112;
      v43 = v12;
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_ERROR, "%@Failed to get contents of directory: %@", buf, 0x16u);
    }
  }

}

- (void)_removeMetadataForAnnouncementID:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementStorageManager defaults](self, "defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(v10, "mutableCopy");
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v6);
    ANLogHandleAnnouncementStorageManager();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D23A0000, v12, OS_LOG_TYPE_DEFAULT, "%@Removed Announcement Metadata: %@", (uint8_t *)&v15, 0x16u);
    }

    -[ANAnnouncementStorageManager defaults](self, "defaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject copy](v11, "copy");
    objc_msgSend(v13, "setObject:forKey:", v14, v8);

  }
  else
  {
    ANLogHandleAnnouncementStorageManager();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@No Announcements found for Endpoint %@", (uint8_t *)&v15, 0x16u);
    }
  }

}

- (void)_removeDirectoryForEndpointsExcludingEndpointIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  uint32_t v28;
  void *v29;
  void *v30;
  id v31;
  char *v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  char *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40 = 0;
  -[ANAnnouncementStorageManager _cachesURLWithError:](self, "_cachesURLWithError:", &v40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v40;
  if (v5)
  {
    -[ANAnnouncementStorageManager fileManager](self, "fileManager");
    v7 = objc_claimAutoreleasedReturnValue();
    v39 = v6;
    -[NSObject contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, MEMORY[0x1E0C9AA60], 0, &v39);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (char *)v39;

    ANLogHandleAnnouncementStorageManager();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      v32 = v9;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "absoluteString");
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v42 = &stru_1E93913D0;
        v43 = 2112;
        v44 = v12;
        _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@Cleaning Items in: %@", buf, 0x16u);

      }
      v30 = v5;

      v31 = v4;
      objc_msgSend(v4, "na_map:", &__block_literal_global_28);
      v11 = objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v29 = v8;
      obj = v8;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v36 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v17, "lastPathComponent");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((-[NSObject containsObject:](v11, "containsObject:", v18) & 1) == 0)
            {
              ANLogHandleAnnouncementStorageManager();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v42 = &stru_1E93913D0;
                v43 = 2112;
                v44 = (const char *)v17;
                _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "%@Removing item %@", buf, 0x16u);
              }

              v34 = 0;
              v20 = v7;
              v21 = -[NSObject removeItemAtURL:error:](v7, "removeItemAtURL:error:", v17, &v34);
              v22 = v34;
              ANLogHandleAnnouncementStorageManager();
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if ((v21 & 1) != 0)
              {
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v42 = &stru_1E93913D0;
                  v43 = 2080;
                  v44 = "-[ANAnnouncementStorageManager _removeDirectoryForEndpointsExcludingEndpointIDs:]";
                  v45 = 2112;
                  v46 = v17;
                  v25 = v24;
                  v26 = OS_LOG_TYPE_DEFAULT;
                  v27 = "%@%s Successfully removed item: %@";
                  v28 = 32;
                  goto LABEL_18;
                }
              }
              else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413058;
                v42 = &stru_1E93913D0;
                v43 = 2080;
                v44 = "-[ANAnnouncementStorageManager _removeDirectoryForEndpointsExcludingEndpointIDs:]";
                v45 = 2112;
                v46 = v17;
                v47 = 2112;
                v48 = v32;
                v25 = v24;
                v26 = OS_LOG_TYPE_ERROR;
                v27 = "%@%s Failed to remove item: %@, Error = %@";
                v28 = 42;
LABEL_18:
                _os_log_impl(&dword_1D23A0000, v25, v26, v27, buf, v28);
              }

              v7 = v20;
            }

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
        }
        while (v14);
      }

      v5 = v30;
      v4 = v31;
      v9 = v32;
      v8 = v29;
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = &stru_1E93913D0;
      v43 = 2112;
      v44 = v9;
      _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_ERROR, "%@Failed to get contents of caches directory: %@", buf, 0x16u);
    }

  }
  else
  {
    ANLogHandleAnnouncementStorageManager();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = &stru_1E93913D0;
      v43 = 2112;
      v44 = (const char *)v6;
      _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_ERROR, "%@Did not find Caches URL %@", buf, 0x16u);
    }
    v9 = (char *)v6;
  }

}

uint64_t __81__ANAnnouncementStorageManager__removeDirectoryForEndpointsExcludingEndpointIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (id)_announcementDataDirectoryForType:(id)a3 endpointID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  int v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[ANAnnouncementStorageManager fileManager](self, "fileManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementStorageManager _baseDirectoryURLForEndpointID:error:](self, "_baseDirectoryURLForEndpointID:error:", v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    ANLogHandleAnnouncementStorageManager();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = *a5;
      v21 = 138412802;
      v22 = &stru_1E93913D0;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_ERROR, "%@Did not find directory for endpoint ID %@, %@", (uint8_t *)&v21, 0x20u);
    }
    goto LABEL_10;
  }
  objc_msgSend(v11, "URLByAppendingPathComponent:", v8);
  v13 = objc_claimAutoreleasedReturnValue();
  -[NSObject absoluteString](v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "fileExistsAtPath:", v14);

  if ((v15 & 1) == 0
    && (objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, a5) & 1) == 0)
  {
    ANLogHandleAnnouncementStorageManager();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *a5;
      v21 = 138412802;
      v22 = &stru_1E93913D0;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1D23A0000, v18, OS_LOG_TYPE_ERROR, "%@Failed to create directory for type: %@, %@", (uint8_t *)&v21, 0x20u);
    }

LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  v13 = v13;
  v16 = v13;
LABEL_11:

  return v16;
}

- (id)_baseDirectoryURLForEndpointID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[ANAnnouncementStorageManager _cachesURLWithError:](self, "_cachesURLWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_cachesURLWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ANAnnouncementStorageManager fileManager](self, "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[ANAnalytics shared](ANAnalytics, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error:", 5011);

  }
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.announce"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 removingItemAtURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[ANAnnouncementStorageManager fileManager](self, "fileManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    ANLogHandleAnnouncementStorageManager();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = &stru_1E93913D0;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@Remove Item At URL Error = %@. Proceeding.", (uint8_t *)&v12, 0x16u);
    }

  }
  return v9 == v8;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
