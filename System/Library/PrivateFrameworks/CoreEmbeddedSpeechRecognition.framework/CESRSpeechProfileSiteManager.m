@implementation CESRSpeechProfileSiteManager

- (CESRSpeechProfileSiteManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4 settings:(id)a5
{
  id v9;
  id v10;
  id v11;
  CESRSpeechProfileSiteManager *v12;
  CESRSpeechProfileSiteManager *v13;
  objc_class *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  CESRSpeechProfileSiteCache *v20;
  CESRSpeechProfileSiteCache *speechProfileSiteCache;
  CESRSpeechProfileSiteManager *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CESRSpeechProfileSiteManager;
  v12 = -[CESRSpeechProfileSiteManager init](&v24, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_4;
  objc_storeStrong((id *)&v12->_rootDirectoryURL, a3);
  objc_storeStrong((id *)&v13->_setEnumerator, a4);
  objc_storeStrong((id *)&v13->_settings, a5);
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (const char *)objc_msgSend(v15, "cStringUsingEncoding:", 4);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = dispatch_queue_create(v16, v17);
  queue = v13->_queue;
  v13->_queue = (OS_dispatch_queue *)v18;

  v20 = -[CESRSpeechProfileSiteCache initWithRootDirectoryURL:readOnly:]([CESRSpeechProfileSiteCache alloc], "initWithRootDirectoryURL:readOnly:", v13->_rootDirectoryURL, 0);
  speechProfileSiteCache = v13->_speechProfileSiteCache;
  v13->_speechProfileSiteCache = v20;

  v22 = 0;
  if (-[CESRSpeechProfileSiteManager _loadSpeechProfileSites](v13, "_loadSpeechProfileSites"))
  {
    -[CESRSpeechProfileSiteManager _registerTrialExperimentUpdateHandler](v13, "_registerTrialExperimentUpdateHandler");
LABEL_4:
    v22 = v13;
  }

  return v22;
}

- (CESRSpeechProfileSiteManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4 settings:(id)a5 queue:(id)a6 siteCache:(id)a7 siteWriterCache:(id)a8 managerInfo:(id)a9
{
  id v16;
  id v17;
  CESRSpeechProfileSiteManager *v18;
  CESRSpeechProfileSiteManager *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)CESRSpeechProfileSiteManager;
  v18 = -[CESRSpeechProfileSiteManager init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_rootDirectoryURL, a3);
    objc_storeStrong((id *)&v19->_setEnumerator, a4);
    objc_storeStrong((id *)&v19->_settings, a5);
    objc_storeStrong((id *)&v19->_queue, a6);
    objc_storeStrong((id *)&v19->_speechProfileSiteCache, a7);
    objc_storeStrong((id *)&v19->_speechProfileSiteWriterCache, a8);
    objc_storeStrong((id *)&v19->_managerInfo, a9);
  }

  return v19;
}

- (BOOL)handleUpdatedSets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CESRSpeechProfileSiteManager_handleUpdatedSets___block_invoke;
  block[3] = &unk_1E67339D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)handleSettingsChange
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CESRSpeechProfileSiteManager_handleSettingsChange__block_invoke;
  v5[3] = &unk_1E67339F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)performMaintenance:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CESRSpeechProfileSiteManager_performMaintenance___block_invoke;
  block[3] = &unk_1E6733A20;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)rebuildSpeechProfileSiteWithUserId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CESRSpeechProfileSiteManager_rebuildSpeechProfileSiteWithUserId___block_invoke;
  block[3] = &unk_1E67339D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)rebuildAllSpeechProfilesWithSerializedSets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CESRSpeechProfileSiteManager_rebuildAllSpeechProfilesWithSerializedSets___block_invoke;
  block[3] = &unk_1E67339D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)clearSpeechProfileSiteWithUserId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CESRSpeechProfileSiteManager_clearSpeechProfileSiteWithUserId___block_invoke;
  block[3] = &unk_1E67339D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)clearAllState
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CESRSpeechProfileSiteManager_clearAllState__block_invoke;
  v5[3] = &unk_1E67339F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_performRebuildWithUserId:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CESRSpeechProfileSiteCache *speechProfileSiteCache;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  -[CESRSpeechProfileSiteManager _allSetsSortedBySpeechProfileSite:](self, "_allSetsSortedBySpeechProfileSite:", &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (v5)
  {
    speechProfileSiteCache = self->_speechProfileSiteCache;
    v17 = v6;
    -[CESRSpeechProfileSiteCache speechProfileSiteWithUserId:error:](speechProfileSiteCache, "speechProfileSiteWithUserId:error:", v4, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (v8)
    {
      -[CESRSpeechProfileSiteManager _cachedWriterForSpeechProfileSite:](self, "_cachedWriterForSpeechProfileSite:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "speechProfileSiteURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "rebuildWithAllSets:shouldDefer:", v12, 0);

    }
    else
    {
      v15 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[CESRSpeechProfileSiteManager _performRebuildWithUserId:]";
        v21 = 2112;
        v22 = v9;
        _os_log_error_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile site: %@", buf, 0x16u);
      }
      v13 = 0;
    }

  }
  else
  {
    v14 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CESRSpeechProfileSiteManager _performRebuildWithUserId:]";
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_1B3E5F000, v14, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets: %@", buf, 0x16u);
    }
    v13 = 0;
    v9 = v6;
  }

  return v13;
}

- (BOOL)_rebuildAllSpeechProfilesWithSerializedSets:(id)a3
{
  CCSetEnumerator *v5;
  CCSetEnumerator *v6;
  CCSetEnumerator *setEnumerator;
  BOOL v8;
  CCSetEnumerator *v9;

  v5 = self->_setEnumerator;
  objc_msgSend(MEMORY[0x1E0D0D400], "setEnumeratorWithSerializedSets:", a3);
  v6 = (CCSetEnumerator *)objc_claimAutoreleasedReturnValue();
  setEnumerator = self->_setEnumerator;
  self->_setEnumerator = v6;

  if (-[CESRSpeechProfileSiteManager _resetRootDirectory](self, "_resetRootDirectory"))
    v8 = -[CESRSpeechProfileSiteManager _rebuildAll:](self, "_rebuildAll:", 0);
  else
    v8 = 0;
  v9 = self->_setEnumerator;
  self->_setEnumerator = v5;

  return v8;
}

- (BOOL)_loadSpeechProfileSites
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  uint64_t v11;
  NSURL *v12;
  CESRSpeechProfileSiteCache *speechProfileSiteCache;
  void *v14;
  __CFString *v15;
  os_log_t v16;
  NSObject *v17;
  NSURL *v18;
  os_log_t v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  const __CFString *v27;
  NSURL *rootDirectoryURL;
  __CFString *v30;
  __CFString *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  NSURL *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  SFGetOrCreateDirectoryURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFString *)0;

  if (v3)
  {
    -[CESRSpeechProfileSiteManager _loadOrCreateManagerInfo](self, "_loadOrCreateManagerInfo");
    -[CESRDictionaryLog objectForKey:](self->_managerInfo, "objectForKey:", CFSTR("schemaVersion"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(&unk_1E6744FD0, "isEqual:", v5) & 1) != 0)
    {
      v30 = v5;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      MEMORY[0x1B5E32314](self->_rootDirectoryURL);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (!v7)
        goto LABEL_25;
      v8 = v7;
      v9 = (os_log_t *)MEMORY[0x1E0CFE6C0];
      v10 = *(_QWORD *)v33;
      while (1)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v6);
          v12 = *(NSURL **)(*((_QWORD *)&v32 + 1) + 8 * v11);
          speechProfileSiteCache = self->_speechProfileSiteCache;
          v31 = v4;
          -[CESRSpeechProfileSiteCache speechProfileSiteAtURL:error:](speechProfileSiteCache, "speechProfileSiteAtURL:error:", v12, &v31);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v31;

          if (v14)
          {
LABEL_9:
            v4 = v15;
            goto LABEL_10;
          }
          if (-[CESRSpeechProfileSiteManager _isDataProtectionError:](self, "_isDataProtectionError:", v15))
          {
            if (SFProtectionClassForDataSiteURL() != 6)
              goto LABEL_9;
            v16 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
            {
              v17 = v16;
              -[NSURL path](v12, "path");
              v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
              v40 = 2112;
              v41 = v18;
              _os_log_impl(&dword_1B3E5F000, v17, OS_LOG_TYPE_INFO, "%s Class F speech profile site (%@) is inaccessible - Resetting speech profile site", buf, 0x16u);
LABEL_16:

            }
          }
          else
          {
            v19 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
            {
              v17 = v19;
              -[NSURL path](v12, "path");
              v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
              v40 = 2112;
              v41 = v18;
              v42 = 2112;
              v43 = v15;
              _os_log_error_impl(&dword_1B3E5F000, v17, OS_LOG_TYPE_ERROR, "%s Failed to load speech profile site (%@) due to error: %@", buf, 0x20u);
              goto LABEL_16;
            }
          }
          v20 = SFRemoveItemIfExistsAtURL();
          v4 = v15;

          v21 = *v9;
          v22 = *v9;
          if (v20)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
              v40 = 2112;
              v41 = v12;
              _os_log_impl(&dword_1B3E5F000, v21, OS_LOG_TYPE_INFO, "%s Speech Profile site removed: %@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
            v40 = 2112;
            v41 = v12;
            v42 = 2112;
            v43 = v4;
            _os_log_error_impl(&dword_1B3E5F000, v21, OS_LOG_TYPE_ERROR, "%s Failed to remove speech profile site: %@ error: %@", buf, 0x20u);
          }
LABEL_10:
          ++v11;
        }
        while (v8 != v11);
        v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        v8 = v23;
        if (!v23)
        {
LABEL_25:

          v24 = 1;
          v5 = v30;
          goto LABEL_34;
        }
      }
    }
    v26 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v27 = CFSTR("empty");
      *(_DWORD *)buf = 136315650;
      v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
      v40 = 2112;
      if (v5)
        v27 = v5;
      v41 = (NSURL *)&unk_1E6744FD0;
      v42 = 2112;
      v43 = v27;
      _os_log_impl(&dword_1B3E5F000, v26, OS_LOG_TYPE_INFO, "%s Current schema (expected: %@) not initialized yet (found: %@)", buf, 0x20u);
    }
    v24 = -[CESRSpeechProfileSiteManager _resetRootDirectory](self, "_resetRootDirectory");
LABEL_34:

  }
  else
  {
    v25 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      rootDirectoryURL = self->_rootDirectoryURL;
      *(_DWORD *)buf = 136315650;
      v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
      v40 = 2112;
      v41 = rootDirectoryURL;
      v42 = 2112;
      v43 = v4;
      _os_log_error_impl(&dword_1B3E5F000, v25, OS_LOG_TYPE_ERROR, "%s Failed to resolve / create root directory: %@ error: %@", buf, 0x20u);
    }
    v24 = 0;
  }

  return v24;
}

- (BOOL)_isDataProtectionError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqual:", CFSTR("com.apple.siri.speech-dictionary-log")))
  {
    v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 == 7)
  {
    objc_msgSend(v3, "underlyingErrors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB28A8]))
      v8 = objc_msgSend(v4, "code") == 257;
    else
      v8 = 0;

    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (void)_registerTrialExperimentUpdateHandler
{
  NSObject *v3;
  TRIClient *v4;
  TRIClient *trialClient;
  TRIClient *v6;
  id v7;
  _QWORD v8[4];
  __CFString *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_trialClient)
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[CESRSpeechProfileSiteManager _registerTrialExperimentUpdateHandler]";
      v13 = 2112;
      v14 = CFSTR("SIRI_SPEECH_SV_SPEECH_PROFILE");
      _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s Registering trial experiment update handler for %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 111);
    v4 = (TRIClient *)objc_claimAutoreleasedReturnValue();
    trialClient = self->_trialClient;
    self->_trialClient = v4;

    objc_initWeak((id *)buf, self);
    v6 = self->_trialClient;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__CESRSpeechProfileSiteManager__registerTrialExperimentUpdateHandler__block_invoke;
    v8[3] = &unk_1E6733A48;
    objc_copyWeak(&v10, (id *)buf);
    v9 = CFSTR("SIRI_SPEECH_SV_SPEECH_PROFILE");
    v7 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v6, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("SIRI_SPEECH_SV_SPEECH_PROFILE"), v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_loadOrCreateManagerInfo
{
  CESRDictionaryLog *v3;
  NSURL *rootDirectoryURL;
  CESRDictionaryLog *v5;
  id v6;
  CESRDictionaryLog *managerInfo;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = [CESRDictionaryLog alloc];
  rootDirectoryURL = self->_rootDirectoryURL;
  v9 = 0;
  v5 = -[CESRDictionaryLog initWithFilename:protectionClass:directory:readOnly:create:error:](v3, "initWithFilename:protectionClass:directory:readOnly:create:error:", CFSTR("Manager"), 4, rootDirectoryURL, 0, 1, &v9);
  v6 = v9;
  managerInfo = self->_managerInfo;
  self->_managerInfo = v5;

  if (!self->_managerInfo)
  {
    v8 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[CESRSpeechProfileSiteManager _loadOrCreateManagerInfo]";
      v12 = 2112;
      v13 = v6;
      _os_log_error_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_ERROR, "%s Failed to load manager info: %@", buf, 0x16u);
    }
  }

}

- (BOOL)_resetRootDirectory
{
  os_log_t *v3;
  NSObject *v4;
  NSURL *rootDirectoryURL;
  char v6;
  NSURL *v7;
  NSMutableDictionary *speechProfileSiteWriterCache;
  void *v9;
  NSURL *v10;
  CESRDictionaryLog *managerInfo;
  BOOL v12;
  NSObject *v13;
  BOOL v14;
  const char *v15;
  NSObject *v16;
  id v18[3];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NSURL *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    rootDirectoryURL = self->_rootDirectoryURL;
    *(_DWORD *)buf = 136315394;
    v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
    v21 = 2112;
    v22 = rootDirectoryURL;
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Clearing root directory: %@", buf, 0x16u);
  }
  v18[2] = 0;
  v6 = SFRemoveItemIfExistsAtURL();
  v7 = (NSURL *)0;
  if ((v6 & 1) == 0)
  {
    v13 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
      v21 = 2112;
      v22 = v7;
      v15 = "%s Failed to remove root directory: %@";
LABEL_15:
      _os_log_error_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0x16u);
    }
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  -[CESRSpeechProfileSiteCache clear](self->_speechProfileSiteCache, "clear");
  speechProfileSiteWriterCache = self->_speechProfileSiteWriterCache;
  self->_speechProfileSiteWriterCache = 0;

  v18[1] = v7;
  SFGetOrCreateDirectoryURL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;

  if (v9)
  {
    -[CESRSpeechProfileSiteManager _loadOrCreateManagerInfo](self, "_loadOrCreateManagerInfo");
    managerInfo = self->_managerInfo;
    v18[0] = v10;
    v12 = -[CESRDictionaryLog writeUpdatedObject:forKey:error:](managerInfo, "writeUpdatedObject:forKey:error:", &unk_1E6744FD0, CFSTR("schemaVersion"), v18);
    v7 = (NSURL *)v18[0];

    v13 = *v3;
    if (v12)
    {
      v14 = 1;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
        v21 = 2112;
        v22 = (NSURL *)&unk_1E6744FD0;
        _os_log_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_INFO, "%s Root directory initialized with schema version: %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
      v21 = 2112;
      v22 = v7;
      v15 = "%s Failed to record schema version: %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v16 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
    v21 = 2112;
    v22 = v10;
    _os_log_error_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_ERROR, "%s Failed to create root directory: %@", buf, 0x16u);
  }
  v14 = 0;
  v7 = v10;
LABEL_17:

  return v14;
}

- (BOOL)_removeSiteWithUserId:(id)a3
{
  id v4;
  CESRSpeechProfileSiteCache *speechProfileSiteCache;
  void *v6;
  id v7;
  CESRSpeechProfileSiteCache *v8;
  BOOL v9;
  id v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  speechProfileSiteCache = self->_speechProfileSiteCache;
  v18 = 0;
  -[CESRSpeechProfileSiteCache speechProfileSiteWithUserId:error:](speechProfileSiteCache, "speechProfileSiteWithUserId:error:", v4, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v6)
  {
    v8 = self->_speechProfileSiteCache;
    v17 = v7;
    v9 = -[CESRSpeechProfileSiteCache removeSpeechProfileSite:error:](v8, "removeSpeechProfileSite:error:", v6, &v17);
    v10 = v17;

    if (v9)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_speechProfileSiteWriterCache, "removeObjectForKey:", v6);
      v11 = 1;
    }
    else
    {
      v13 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v20 = "-[CESRSpeechProfileSiteManager _removeSiteWithUserId:]";
        v21 = 2112;
        v22 = v6;
        v23 = 2112;
        v24 = v10;
        _os_log_error_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_ERROR, "%s Failed to remove speech profile site (%@) error: %@", buf, 0x20u);
      }
      v11 = 0;
    }
    v7 = v10;
  }
  else
  {
    v12 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v15 = v12;
      SFUserDescription();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v20 = "-[CESRSpeechProfileSiteManager _removeSiteWithUserId:]";
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile site (%@) error: %@", buf, 0x20u);

    }
    v11 = 0;
  }

  return v11;
}

- (id)_cachedWriterAtSpeechProfileSiteURL:(id)a3
{
  id v4;
  CESRSpeechProfileSiteCache *speechProfileSiteCache;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  speechProfileSiteCache = self->_speechProfileSiteCache;
  v11 = 0;
  -[CESRSpeechProfileSiteCache speechProfileSiteAtURL:error:](speechProfileSiteCache, "speechProfileSiteAtURL:error:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    -[CESRSpeechProfileSiteManager _cachedWriterForSpeechProfileSite:](self, "_cachedWriterForSpeechProfileSite:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[CESRSpeechProfileSiteManager _cachedWriterAtSpeechProfileSiteURL:]";
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile site (%@) error: %@", buf, 0x20u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)_cachedWriterForSpeechProfileSite:(id)a3
{
  id v4;
  void *v5;
  CESRSpeechProfileSiteWriter *v6;
  NSMutableDictionary *speechProfileSiteWriterCache;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_speechProfileSiteWriterCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = -[CESRSpeechProfileSiteWriter initWithSpeechProfileSite:settings:]([CESRSpeechProfileSiteWriter alloc], "initWithSpeechProfileSite:settings:", v4, self->_settings);
    if (v6)
    {
      v5 = v6;
      speechProfileSiteWriterCache = self->_speechProfileSiteWriterCache;
      if (!speechProfileSiteWriterCache)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = self->_speechProfileSiteWriterCache;
        self->_speechProfileSiteWriterCache = v8;

        speechProfileSiteWriterCache = self->_speechProfileSiteWriterCache;
      }
      -[NSMutableDictionary setObject:forKey:](speechProfileSiteWriterCache, "setObject:forKey:", v5, v4);
    }
    else
    {
      v10 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "-[CESRSpeechProfileSiteManager _cachedWriterForSpeechProfileSite:]";
        v14 = 2112;
        v15 = v4;
        _os_log_error_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_ERROR, "%s Failed to initialize writer for speech profile site: %@", (uint8_t *)&v12, 0x16u);
      }
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_didHandleUpdatedSets:(id)a3 shouldDefer:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v9 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[CESRSpeechProfileSiteManager _didHandleUpdatedSets:shouldDefer:]";
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_INFO, "%s Handling update(s) to set(s): %@", buf, 0x16u);
  }
  v20 = 0;
  -[CESRSpeechProfileSiteManager _sortBySpeechProfileSite:error:](self, "_sortBySpeechProfileSite:error:", v6, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  if (!v10)
  {
    v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "-[CESRSpeechProfileSiteManager _didHandleUpdatedSets:shouldDefer:]";
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v11;
      _os_log_error_impl(&dword_1B3E5F000, v17, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile sites for set(s): %@ error: %@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "count"))
  {
    if (-[CESRSpeechProfileSiteManager _processUpdatesToSets:shouldDefer:](self, "_processUpdatesToSets:shouldDefer:", v10, v7))
    {
      v12 = *v8;
      v13 = 1;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[CESRSpeechProfileSiteManager _didHandleUpdatedSets:shouldDefer:]";
        v14 = "%s Finished processing all set updates";
        v15 = v12;
        v16 = 12;
LABEL_13:
        _os_log_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
LABEL_10:
    v13 = 0;
    goto LABEL_14;
  }
  v18 = *v8;
  v13 = 1;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[CESRSpeechProfileSiteManager _didHandleUpdatedSets:shouldDefer:]";
    v23 = 2112;
    v24 = v6;
    v14 = "%s No applicable speech profile sites for set(s): %@";
    v15 = v18;
    v16 = 22;
    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

- (id)_sortBySpeechProfileSite:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (-[CESRSpeechProfileSettings isUserExclusiveSet:](self->_settings, "isUserExclusiveSet:", v11))
        {
          objc_msgSend(v11, "account");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "accountIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = 0;
        }
        -[CESRSpeechProfileSiteCache speechProfileSiteWithUserId:error:](self->_speechProfileSiteCache, "speechProfileSiteWithUserId:error:", v13, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

          v19 = obj;
          v20 = 0;
          goto LABEL_16;
        }
        v15 = v14;
        objc_msgSend(v14, "speechProfileSiteURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v15, "speechProfileSiteURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v17, v18);

        }
        objc_msgSend(v17, "addObject:", v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
        continue;
      break;
    }
  }
  v19 = obj;

  v20 = v6;
LABEL_16:

  return v20;
}

- (id)_allSetsSortedBySpeechProfileSite:(id *)a3
{
  void *v5;
  void *v6;

  -[CCSetEnumerator allSets:](self->_setEnumerator, "allSets:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CESRSpeechProfileSiteManager _sortBySpeechProfileSite:error:](self, "_sortBySpeechProfileSite:error:", v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_processUpdatesToSets:(id)a3 shouldDefer:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  v28 = 0;
  -[CESRSpeechProfileSiteManager _allSetsSortedBySpeechProfileSite:](self, "_allSetsSortedBySpeechProfileSite:", &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;
  if (v7)
  {
    if (!v6)
      v6 = v7;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v7, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    if (v10)
    {
      v11 = v10;
      v22 = v8;
      v12 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v14, v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            -[CESRSpeechProfileSiteManager _cachedWriterAtSpeechProfileSiteURL:](self, "_cachedWriterAtSpeechProfileSiteURL:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "processUpdatesToSets:allSets:shouldDefer:", v15, v16, v23) & 1) == 0)
            {
              v20 = *MEMORY[0x1E0CFE6C0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v30 = "-[CESRSpeechProfileSiteManager _processUpdatesToSets:shouldDefer:]";
                v31 = 2112;
                v32 = v17;
                v33 = 2112;
                v34 = v15;
                _os_log_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_INFO, "%s Did not update default speech profile site (%@) with sets: %@", buf, 0x20u);
              }

              v18 = 0;
              goto LABEL_21;
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
        if (v11)
          continue;
        break;
      }
      v18 = 1;
LABEL_21:
      v8 = v22;
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v19 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CESRSpeechProfileSiteManager _processUpdatesToSets:shouldDefer:]";
      v31 = 2112;
      v32 = v8;
      _os_log_error_impl(&dword_1B3E5F000, v19, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets: %@", buf, 0x16u);
    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)_rebuildAll:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  -[CESRSpeechProfileSiteManager _allSetsSortedBySpeechProfileSite:](self, "_allSetsSortedBySpeechProfileSite:", &v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v23;
  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "allKeys", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CESRSpeechProfileSiteManager _cachedWriterAtSpeechProfileSiteURL:](self, "_cachedWriterAtSpeechProfileSiteURL:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "rebuildWithAllSets:shouldDefer:", v13, v4) & 1) == 0)
          {
            v16 = *MEMORY[0x1E0CFE6C0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v25 = "-[CESRSpeechProfileSiteManager _rebuildAll:]";
              v26 = 2112;
              v27 = v14;
              v28 = 2112;
              v29 = v13;
              _os_log_error_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_ERROR, "%s Failed to rebuild Default speech profile site (%@) with sets: %@", buf, 0x20u);
            }

            v15 = 0;
            goto LABEL_14;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
        if (v9)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_14:

  }
  else
  {
    v17 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CESRSpeechProfileSiteManager _rebuildAll:]";
      v26 = 2112;
      v27 = v6;
      _os_log_error_impl(&dword_1B3E5F000, v17, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets: %@", buf, 0x16u);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)_didPerformVerification:(id)a3
{
  NSObject **v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSMutableDictionary *v15;
  CESRSpeechProfileSiteCache *speechProfileSiteCache;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSMutableDictionary *v23;
  char v24;
  NSObject *v25;
  BOOL v26;
  NSMutableDictionary *speechProfileSiteWriterCache;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  __int128 v32;
  id obj;
  id v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  NSMutableDictionary *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  NSMutableDictionary *v46;
  __int16 v47;
  NSMutableDictionary *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v4 = (NSObject **)MEMORY[0x1E0CFE6C0];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
    _os_log_impl(&dword_1B3E5F000, v5, OS_LOG_TYPE_INFO, "%s Refreshing Settings", buf, 0xCu);
  }
  -[CESRSpeechProfileSettings refresh](self->_settings, "refresh");
  v42 = 0;
  -[CESRSpeechProfileSiteManager _allSetsSortedBySpeechProfileSite:](self, "_allSetsSortedBySpeechProfileSite:", &v42);
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = (NSMutableDictionary *)v42;
  v8 = *v4;
  v35 = v6;
  v9 = *v4;
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
      v45 = 2112;
      v46 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets: %@", buf, 0x16u);
    }
    v26 = 0;
    goto LABEL_33;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
    v45 = 2112;
    v46 = v6;
    _os_log_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_INFO, "%s Performing verification with all sets: %@", buf, 0x16u);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[NSMutableDictionary allKeys](v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (!v10)
    goto LABEL_19;
  v12 = v10;
  v13 = *(_QWORD *)v39;
  *(_QWORD *)&v11 = 136315394;
  v32 = v11;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v39 != v13)
        objc_enumerationMutation(obj);
      v15 = *(NSMutableDictionary **)(*((_QWORD *)&v38 + 1) + 8 * i);
      speechProfileSiteCache = self->_speechProfileSiteCache;
      v37 = v7;
      -[CESRSpeechProfileSiteCache speechProfileSiteAtURL:error:](speechProfileSiteCache, "speechProfileSiteAtURL:error:", v15, &v37, v32);
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v18 = v37;

      if (!v17)
      {
        v28 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
          v45 = 2112;
          v46 = v15;
          v47 = 2112;
          v48 = v18;
          _os_log_error_impl(&dword_1B3E5F000, v28, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile site (%@) error: %@", buf, 0x20u);
        }
        goto LABEL_32;
      }
      -[NSMutableDictionary speechProfileSiteURL](v17, "speechProfileSiteURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v35, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v21 = *MEMORY[0x1E0CFE6C0];
        v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
        v20 = (void *)MEMORY[0x1E0C9AA60];
        if (v22)
        {
          *(_DWORD *)buf = v32;
          v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
          v45 = 2112;
          v46 = v17;
          _os_log_impl(&dword_1B3E5F000, v21, OS_LOG_TYPE_INFO, "%s No available sets at speech profile site: %@", buf, 0x16u);
        }
      }
      -[CESRSpeechProfileSiteManager _cachedWriterForSpeechProfileSite:](self, "_cachedWriterForSpeechProfileSite:", v17);
      v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      if ((-[NSMutableDictionary performVerificationWithAllSets:shouldDefer:](v23, "performVerificationWithAllSets:shouldDefer:", v20, v34) & 1) == 0)
      {
        v29 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v32;
          v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
          v45 = 2112;
          v46 = v23;
          _os_log_error_impl(&dword_1B3E5F000, v29, OS_LOG_TYPE_ERROR, "%s Maintenance incomplete at speech profile site: %@", buf, 0x16u);
        }
LABEL_31:

LABEL_32:
        v26 = 0;
        v7 = v18;
        goto LABEL_33;
      }
      v36 = v18;
      v24 = -[NSMutableDictionary recordMaintenance:](v17, "recordMaintenance:", &v36);
      v7 = v36;

      if ((v24 & 1) == 0)
      {
        v30 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
          v45 = 2112;
          v46 = v17;
          v47 = 2112;
          v48 = v7;
          _os_log_error_impl(&dword_1B3E5F000, v30, OS_LOG_TYPE_ERROR, "%s Failed to record maintenance at speech profile site: %@ error: %@", buf, 0x20u);
        }
        v18 = v7;
        goto LABEL_31;
      }

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    v4 = (NSObject **)MEMORY[0x1E0CFE6C0];
    if (v12)
      continue;
    break;
  }
LABEL_19:

  v25 = *v4;
  v26 = 1;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    speechProfileSiteWriterCache = self->_speechProfileSiteWriterCache;
    *(_DWORD *)buf = 136315394;
    v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
    v45 = 2112;
    v46 = speechProfileSiteWriterCache;
    _os_log_impl(&dword_1B3E5F000, v25, OS_LOG_TYPE_INFO, "%s Completed maintenance at all speech profile sites: %@", buf, 0x16u);
  }
LABEL_33:

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_speechProfileSiteWriterCache, 0);
  objc_storeStrong((id *)&self->_speechProfileSiteCache, 0);
  objc_storeStrong((id *)&self->_managerInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
}

void __69__CESRSpeechProfileSiteManager__registerTrialExperimentUpdateHandler__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v10 = "-[CESRSpeechProfileSiteManager _registerTrialExperimentUpdateHandler]_block_invoke";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s Trial updates detected to %@. Rebuilding speech profile for personalization experiments.", buf, 0x16u);
  }
  v5 = WeakRetained[4];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CESRSpeechProfileSiteManager__registerTrialExperimentUpdateHandler__block_invoke_15;
  block[3] = &unk_1E6734990;
  v8 = WeakRetained;
  v6 = WeakRetained;
  dispatch_sync(v5, block);

}

uint64_t __69__CESRSpeechProfileSiteManager__registerTrialExperimentUpdateHandler__block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rebuildAll:", 0);
}

uint64_t __45__CESRSpeechProfileSiteManager_clearAllState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_resetRootDirectory");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __65__CESRSpeechProfileSiteManager_clearSpeechProfileSiteWithUserId___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeSiteWithUserId:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __75__CESRSpeechProfileSiteManager_rebuildAllSpeechProfilesWithSerializedSets___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_rebuildAllSpeechProfilesWithSerializedSets:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __67__CESRSpeechProfileSiteManager_rebuildSpeechProfileSiteWithUserId___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_performRebuildWithUserId:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __51__CESRSpeechProfileSiteManager_performMaintenance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_didPerformVerification:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __52__CESRSpeechProfileSiteManager_handleSettingsChange__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_didPerformVerification:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __50__CESRSpeechProfileSiteManager_handleUpdatedSets___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_didHandleUpdatedSets:shouldDefer:", *(_QWORD *)(a1 + 40), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

+ (id)defaultManager
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc((Class)objc_opt_class());
  SFSpeechProfileRootDirectoryURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0D408], "setEnumeratorWithUseCase:", CFSTR("SpeechProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechProfileSettings defaultSettings](CESRSpeechProfileSettings, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithRootDirectoryURL:setEnumerator:settings:", v3, v4, v5);

  return v6;
}

@end
