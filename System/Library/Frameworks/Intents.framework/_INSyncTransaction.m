@implementation _INSyncTransaction

- (id)_initWithVocabularyManager:(id)a3 syncSlot:(id)a4 deleteExistingVocabulary:(BOOL)a5
{
  id v9;
  id v10;
  _INSyncTransaction *v11;
  uint64_t v12;
  NSString *syncSlot;
  id v14;
  id v15;
  void *v16;
  char v17;
  BOOL v18;
  void *v19;
  _INVocabularyStoreManager *storeManager;
  NSObject *v21;
  void *v22;
  _INSyncTransaction *v23;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)_INSyncTransaction;
  v11 = -[_INSyncTransaction init](&v36, sel_init);
  if (!v11)
    goto LABEL_11;
  v12 = objc_msgSend(v10, "copy");
  syncSlot = v11->_syncSlot;
  v11->_syncSlot = (NSString *)v12;

  objc_storeStrong((id *)&v11->_storeManager, a3);
  v11->_deleteExistingVocabulary = a5;
  -[_INVocabularyStoreManager appBundleID](v11->_storeManager, "appBundleID");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  if (INSyncTransactionCheckVocabularyUpdatesEnabled_onceToken != -1)
    dispatch_once(&INSyncTransactionCheckVocabularyUpdatesEnabled_onceToken, &__block_literal_global_40035);
  objc_msgSend((id)INSyncTransactionCheckVocabularyUpdatesEnabled_vocabularyUpdatesOverrides, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v15);

  v18 = (v17 & 1) != 0
     || +[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:](_INSiriAuthorizationManager, "_siriAuthorizationStatusForAppID:intentSlot:", v14, v15) == 3;

  v11->_vocabularyUpdatesEnabled = v18;
  if (!v11->_vocabularyUpdatesEnabled)
  {
    v19 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      storeManager = v11->_storeManager;
      v21 = v19;
      -[_INVocabularyStoreManager appBundleID](storeManager, "appBundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v38 = "-[_INSyncTransaction _initWithVocabularyManager:syncSlot:deleteExistingVocabulary:]";
      v39 = 2112;
      v40 = v22;
      _os_log_impl(&dword_18BEBC000, v21, OS_LOG_TYPE_INFO, "%s Vocabulary updates disabled for %@", buf, 0x16u);

    }
  }
  if (v11->_deleteExistingVocabulary)
    goto LABEL_11;
  v34 = 0;
  v35 = 0;
  v33 = 0;
  -[_INVocabularyStoreManager getPathToLatestVocabulary:pathDuringReading:sentVocabulary:forIntentSlot:](v11->_storeManager, "getPathToLatestVocabulary:pathDuringReading:sentVocabulary:forIntentSlot:", &v35, &v34, &v33, v11->_syncSlot);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v35;
  v27 = v35;
  v28 = v34;
  v29 = v34;
  v30 = v33;
  v31 = v33;
  if (v25)
  {
    v32 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[_INSyncTransaction _initWithVocabularyManager:syncSlot:deleteExistingVocabulary:]";
      v39 = 2114;
      v40 = v25;
      _os_log_error_impl(&dword_18BEBC000, v32, OS_LOG_TYPE_ERROR, "%s Error accessing intent-slot directory %{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)&v11->_pathToLatestVocabularyDocument, v26);
    objc_storeStrong((id *)&v11->_pathToStagedVocabularyDocument, v28);
    objc_storeStrong((id *)&v11->_pathToSentVocabularyDocument, v30);
  }

  if (v25)
    v23 = 0;
  else
LABEL_11:
    v23 = v11;

  return v23;
}

- (void)_saveAndCleanup
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  _INVocabularyGenerationDocument *latest;
  NSString *pathToSentVocabularyDocument;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  _INVocabularyStoreManager *storeManager;
  NSString *syncSlot;
  NSObject *v15;
  NSString *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSString *pathToStagedVocabularyDocument;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[_INVocabularyGenerationDocument vocabularyItems](self->_latest, "vocabularyItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = INSiriLogContextIntents;
  v6 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      latest = self->_latest;
      pathToSentVocabularyDocument = self->_pathToSentVocabularyDocument;
      v21 = 136315650;
      v22 = "-[_INSyncTransaction _saveAndCleanup]";
      v23 = 2112;
      v24 = latest;
      v25 = 2112;
      v26 = pathToSentVocabularyDocument;
      _os_log_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_INFO, "%s Saving latest vocab %@ to %@", (uint8_t *)&v21, 0x20u);
    }
    -[_INVocabularyGenerationDocument writeToFile:createIntermediateDirectories:](self->_latest, "writeToFile:createIntermediateDirectories:", self->_pathToSentVocabularyDocument, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v21 = 136315394;
        v22 = "-[_INSyncTransaction _saveAndCleanup]";
        v23 = 2114;
        v24 = v10;
        v12 = "%s Error writing sent file %{public}@";
LABEL_19:
        _os_log_error_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v21, 0x16u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (v6)
    {
      syncSlot = self->_syncSlot;
      storeManager = self->_storeManager;
      v15 = v5;
      -[_INVocabularyStoreManager appBundleID](storeManager, "appBundleID");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v21 = 136315650;
      v22 = "-[_INSyncTransaction _saveAndCleanup]";
      v23 = 2112;
      v24 = syncSlot;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_INFO, "%s Removing the sent file, because it is now empty %@ %@", (uint8_t *)&v21, 0x20u);

    }
    -[_INVocabularyStoreManager deleteVocabularyStoreItemAt:](self->_storeManager, "deleteVocabularyStoreItemAt:", self->_pathToSentVocabularyDocument);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v21 = 136315394;
        v22 = "-[_INSyncTransaction _saveAndCleanup]";
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_18BEBC000, v18, OS_LOG_TYPE_ERROR, "%s Error removing empty sent vocab file %{public}@", (uint8_t *)&v21, 0x16u);
      }
    }

  }
  v19 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    pathToStagedVocabularyDocument = self->_pathToStagedVocabularyDocument;
    v21 = 136315394;
    v22 = "-[_INSyncTransaction _saveAndCleanup]";
    v23 = 2112;
    v24 = pathToStagedVocabularyDocument;
    _os_log_impl(&dword_18BEBC000, v19, OS_LOG_TYPE_INFO, "%s Removing staged vocabulary at %@", (uint8_t *)&v21, 0x16u);
  }
  -[_INVocabularyStoreManager deleteVocabularyStoreItemAt:](self->_storeManager, "deleteVocabularyStoreItemAt:", self->_pathToStagedVocabularyDocument);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315394;
      v22 = "-[_INSyncTransaction _saveAndCleanup]";
      v23 = 2114;
      v24 = v10;
      v12 = "%s Error cleaning up user vocabulary %{public}@";
      goto LABEL_19;
    }
  }
LABEL_17:

}

- (void)endTransactionWithFinalAnchor:(id)a3
{
  id v4;
  _BOOL8 vocabularyUpdatesEnabled;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _INVocabularyGenerationDocument *latest;
  _INVocabularyGenerationDocument *sent;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INVocabularyGenerationDocument setThisGeneration:](self->_latest, "setThisGeneration:", v4);
  -[_INVocabularyGenerationDocument setResetOnNextSync:](self->_latest, "setResetOnNextSync:", 0);
  vocabularyUpdatesEnabled = 0;
  if (!self->_deleteExistingVocabulary)
    vocabularyUpdatesEnabled = self->_vocabularyUpdatesEnabled;
  v6 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = v6;
    objc_msgSend(v7, "numberWithBool:", vocabularyUpdatesEnabled);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[_INSyncTransaction endTransactionWithFinalAnchor:]";
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s finalAnchor = '%@' cleaning up=%@", (uint8_t *)&v12, 0x20u);

  }
  if (vocabularyUpdatesEnabled)
    -[_INSyncTransaction _saveAndCleanup](self, "_saveAndCleanup");
  latest = self->_latest;
  self->_latest = 0;

  sent = self->_sent;
  self->_sent = 0;

}

- (id)calculateDiff
{
  if (-[_INSyncTransaction fullResetRequired](self, "fullResetRequired"))
    -[_INVocabularyGenerationDocument setResetOnNextSync:](self->_latest, "setResetOnNextSync:", 1);
  -[_INVocabularyGenerationDocument assignMissingSiriIDsForOptimalDiffFromPreviousDocument:](self->_latest, "assignMissingSiriIDsForOptimalDiffFromPreviousDocument:", self->_sent);
  return -[_INVocabularyGenerationDocument diffFromPreviousDocument:](self->_latest, "diffFromPreviousDocument:", self->_sent);
}

- (_INVocabularyGenerationDocument)sentVocabularyDocument
{
  return self->_sent;
}

- (id)_emptySentDocument
{
  _INVocabularyGenerationDocument *v3;
  void *v4;

  v3 = objc_alloc_init(_INVocabularyGenerationDocument);
  -[_INVocabularyStoreManager appBundleID](self->_storeManager, "appBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyGenerationDocument setAppBundleID:](v3, "setAppBundleID:", v4);

  -[_INVocabularyGenerationDocument setVocabularyItems:](v3, "setVocabularyItems:", MEMORY[0x1E0C9AA60]);
  -[_INVocabularyGenerationDocument setIntentSlot:](v3, "setIntentSlot:", self->_syncSlot);
  return v3;
}

- (void)_deleteInvalidSavedData
{
  void *v3;
  _INVocabularyStoreManager *storeManager;
  NSString *syncSlot;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    syncSlot = self->_syncSlot;
    storeManager = self->_storeManager;
    v6 = v3;
    -[_INVocabularyStoreManager appBundleID](storeManager, "appBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[_INSyncTransaction _deleteInvalidSavedData]";
    v13 = 2112;
    v14 = syncSlot;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Removing all vocabulary of type %@ for %@", (uint8_t *)&v11, 0x20u);

  }
  -[_INVocabularyStoreManager deleteIntentSlot:](self->_storeManager, "deleteIntentSlot:", self->_syncSlot);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v10 = self->_syncSlot;
      v11 = 136315650;
      v12 = "-[_INSyncTransaction _deleteInvalidSavedData]";
      v13 = 2114;
      v14 = v10;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_ERROR, "%s Error cleaning up %{public}@ %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }

}

- (BOOL)_isMissingLatestFileError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CB28A8]);

  if (!v6)
    goto LABEL_6;
  v7 = objc_msgSend(v4, "code");
  v8 = 1;
  if (v7 != 4 && v7 != 260)
  {
    if (v7 == 512)
    {
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[_INSyncTransaction _isMissingLatestFileError:](self, "_isMissingLatestFileError:", v10);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (void)_beginTransaction
{
  _INVocabularyGenerationDocument *v3;
  _INVocabularyGenerationDocument *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  _INVocabularyGenerationDocument *latest;
  _INVocabularyGenerationDocument *v17;
  _INVocabularyGenerationDocument *sent;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_deleteExistingVocabulary)
  {
    -[_INSyncTransaction _deleteInvalidSavedData](self, "_deleteInvalidSavedData");
    v3 = 0;
LABEL_3:
    -[_INSyncTransaction _emptySentDocument](self, "_emptySentDocument");
    v4 = (_INVocabularyGenerationDocument *)objc_claimAutoreleasedReturnValue();
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[_INSyncTransaction _beginTransaction]";
      _os_log_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_INFO, "%s No sent vocabulary at all, forcing a sync up once.", buf, 0xCu);
    }
    -[_INVocabularyGenerationDocument setResetOnNextSync:](v4, "setResetOnNextSync:", 1);
    goto LABEL_20;
  }
  v6 = 16;
  if (!self->_vocabularyUpdatesEnabled)
    v6 = 24;
  v7 = *(id *)((char *)&self->super.isa + v6);
  v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[_INSyncTransaction _beginTransaction]";
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s staging at %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_pathToLatestVocabularyDocument);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = objc_msgSend(v9, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v10, v11, 0, 0, 0, &v19);
  v13 = v19;

  if ((v12 & 1) == 0)
  {
    v14 = -[_INSyncTransaction _isMissingLatestFileError:](self, "_isMissingLatestFileError:", v13);
    v15 = INSiriLogContextIntents;
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[_INSyncTransaction _beginTransaction]";
        _os_log_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_INFO, "%s No latest vocabulary file", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[_INSyncTransaction _beginTransaction]";
      v22 = 2114;
      v23 = v13;
      _os_log_error_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_ERROR, "%s Error reading latest vocabulary file: %{public}@", buf, 0x16u);
    }
  }
  if (self->_vocabularyUpdatesEnabled)
  {
    v4 = -[_INVocabularyGenerationDocument initWithContentsOfFile:]([_INVocabularyGenerationDocument alloc], "initWithContentsOfFile:", self->_pathToSentVocabularyDocument);
    v3 = -[_INVocabularyGenerationDocument initWithContentsOfFile:]([_INVocabularyGenerationDocument alloc], "initWithContentsOfFile:", self->_pathToStagedVocabularyDocument);
  }
  else
  {
    -[_INSyncTransaction _emptySentDocument](self, "_emptySentDocument");
    v4 = (_INVocabularyGenerationDocument *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
  }

  if (!v4)
    goto LABEL_3;
LABEL_20:
  if (!v3)
    v3 = (_INVocabularyGenerationDocument *)-[_INVocabularyGenerationDocument copy](v4, "copy");
  latest = self->_latest;
  self->_latest = v3;
  v17 = v3;

  sent = self->_sent;
  self->_sent = v4;

}

- (_INVocabularyGenerationDocument)latestVocabularyDocument
{
  return self->_latest;
}

- (BOOL)fullResetRequired
{
  return self->_fullResetRequired;
}

- (void)setFullResetRequired:(BOOL)a3
{
  self->_fullResetRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sent, 0);
  objc_storeStrong((id *)&self->_latest, 0);
  objc_storeStrong((id *)&self->_storeManager, 0);
  objc_storeStrong((id *)&self->_syncSlot, 0);
  objc_storeStrong((id *)&self->_pathToSentVocabularyDocument, 0);
  objc_storeStrong((id *)&self->_pathToStagedVocabularyDocument, 0);
  objc_storeStrong((id *)&self->_pathToLatestVocabularyDocument, 0);
}

+ (id)beginTransactionForBundleID:(id)a3 bundlePath:(id)a4 syncSlot:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, int);
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_INVocabularyStoreManager managerForBundleID:bundlePath:](_INVocabularyStoreManager, "managerForBundleID:bundlePath:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 1;
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __70___INSyncTransaction_beginTransactionForBundleID_bundlePath_syncSlot___block_invoke;
    v24 = &unk_1E228C990;
    v28 = &v29;
    v13 = v8;
    v25 = v13;
    v14 = v10;
    v26 = v14;
    v15 = v12;
    v27 = v15;
    objc_msgSend(v11, "checkIfSyncSlot:isAllowedWithCompletion:", v14, &v21);
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v16 = *((unsigned __int8 *)v30 + 24);
    if (!*((_BYTE *)v30 + 24))
    {
      v17 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v34 = "+[_INSyncTransaction beginTransactionForBundleID:bundlePath:syncSlot:]";
        v35 = 2114;
        v36 = v14;
        v37 = 2114;
        v38 = v13;
        v39 = 2114;
        v40 = v9;
        _os_log_error_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_ERROR, "%s Sync slot %{public}@ is not valid for %{public}@ at %{public}@", buf, 0x2Au);
      }
      notify_post("INVoocabularyChangedNotification");
    }
    v18 = objc_alloc((Class)a1);
    v19 = (void *)objc_msgSend(v18, "_initWithVocabularyManager:syncSlot:deleteExistingVocabulary:", v11, v14, v16 == 0, v21, v22, v23, v24);
    objc_msgSend(v19, "_beginTransaction");

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
