@implementation CESRSpeechProfileSiteWriter

- (CESRSpeechProfileSiteWriter)initWithSpeechProfileSite:(id)a3 settings:(id)a4
{
  id v7;
  id v8;
  CESRSpeechProfileSiteWriter *v9;
  CESRSpeechProfileSiteWriter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CESRSpeechProfileSiteWriter;
  v9 = -[CESRSpeechProfileSiteWriter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_speechProfileSite, a3);
    objc_storeStrong((id *)&v10->_settings, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CESRSpeechProfileSiteWriter;
  -[CESRSpeechProfileSiteWriter description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_speechProfileSite);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)rebuildWithAllSets:(id)a3 shouldDefer:(id)a4
{
  return -[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:](self, "_updateProfilesWithSets:allSets:shouldDefer:", 0, a3, a4);
}

- (BOOL)_updateProfilesWithSets:(id)a3 allSets:(id)a4 shouldDefer:(id)a5
{
  id v8;
  id v9;
  id v10;
  CESRSpeechProfileSettings *settings;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  settings = self->_settings;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__CESRSpeechProfileSiteWriter__updateProfilesWithSets_allSets_shouldDefer___block_invoke;
  v15[3] = &unk_1E6733C90;
  v15[4] = self;
  v18 = &v19;
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  -[CESRSpeechProfileSettings enumerateRequiredInstances:](settings, "enumerateRequiredInstances:", v15);
  LOBYTE(v8) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v8;
}

- (BOOL)_removeProfileInstance:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  CESRSpeechProfileSite *speechProfileSite;
  BOOL v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  CESRSpeechProfileSite *v15;
  CESRSpeechProfileSite *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  CESRSpeechProfileSite *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CESRSpeechProfileUpdater updaterForInstance:atSpeechProfileSite:](CESRSpeechProfileUpdater, "updaterForInstance:atSpeechProfileSite:", v4, self->_speechProfileSite);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v6 = objc_msgSend(v5, "removeProfile:", &v18);
  v7 = v18;
  if ((v6 & 1) != 0)
  {
    speechProfileSite = self->_speechProfileSite;
    v17 = v7;
    v9 = -[CESRSpeechProfileSite removeInstance:error:](speechProfileSite, "removeInstance:error:", v4, &v17);
    v10 = v17;

    if (v9)
    {
      v11 = 1;
    }
    else
    {
      v13 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        v16 = self->_speechProfileSite;
        *(_DWORD *)buf = 136315906;
        v20 = "-[CESRSpeechProfileSiteWriter _removeProfileInstance:]";
        v21 = 2112;
        v22 = v16;
        v23 = 2112;
        v24 = v4;
        v25 = 2112;
        v26 = v10;
        _os_log_error_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_ERROR, "%s (%@) Failed to remove instance info (%@) error: %@", buf, 0x2Au);
      }
      v11 = 0;
    }
    v7 = v10;
  }
  else
  {
    v12 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v15 = self->_speechProfileSite;
      *(_DWORD *)buf = 136315906;
      v20 = "-[CESRSpeechProfileSiteWriter _removeProfileInstance:]";
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v4;
      v25 = 2112;
      v26 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v12, OS_LOG_TYPE_ERROR, "%s (%@) Failed to remove profile (%@) error: %@", buf, 0x2Au);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_filterSets:(id)a3 supportedByInstance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if (-[CESRSpeechProfileSettings isSupportedSet:instanceOptions:](self->_settings, "isSupportedSet:instanceOptions:", v14, objc_msgSend(v7, "options", (_QWORD)v16)))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)_calculateSets:(id)a3 applicableToGroup:(id)a4 withAllSets:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v28;
  id obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v28 = a5;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
        objc_msgSend(v8, "itemTypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v13, "itemType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "containsObject:", v15);

        if (v16)
          objc_msgSend(v30, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v10);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v28;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v21);
        objc_msgSend(v8, "itemTypes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "itemType"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "containsObject:", v24);

        if (v25)
          objc_msgSend(v30, "addObject:", v22);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v19);
  }

  objc_msgSend(v30, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)_updateProfileInstance:(id)a3 categoryGroup:(id)a4 sets:(id)a5 shouldDefer:(id)a6
{
  id v10;
  __CFString *v11;
  __CFString *v12;
  unsigned int (**v13)(_QWORD);
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  int v22;
  os_log_t *v23;
  void *v24;
  const __CFString *v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  char v30;
  __CFString *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  char v35;
  __CFString *v36;
  NSObject *v37;
  void *v38;
  NSObject *v40;
  void *v41;
  char v42;
  NSObject *v43;
  __CFString *v44;
  __CFString *v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  v13 = (unsigned int (**)(_QWORD))a6;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  objc_msgSend(v14, "numberWithLongLong:", (uint64_t)(v16 * 1000000.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString speechCategories](v11, "speechCategories");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerUpdateForSpeechCategories:version:", v18, v17);

  if (!v13 || !v13[2](v13))
  {
    +[CESRSpeechProfileCategoryGroup all](CESRSpeechProfileCategoryGroup, "all");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[__CFString isEqual:](v11, "isEqual:", v21);

    v23 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v24 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      if (v22)
        v25 = CFSTR("ALL");
      else
        v25 = CFSTR("selected");
      v26 = v24;
      -[__CFString speechCategories](v11, "speechCategories");
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
      v49 = 2112;
      v50 = v10;
      v51 = 2112;
      v52 = v25;
      v53 = 2112;
      v54 = v27;
      _os_log_impl(&dword_1B3E5F000, v26, OS_LOG_TYPE_INFO, "%s (%@) Preparing to rebuild %@ categories: %@ with all applicable sets available", buf, 0x2Au);

      v23 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    }
    if (v22)
    {
      objc_msgSend(v10, "changeRegistry");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "clearAllBookmarks");

    }
    +[CESRSpeechProfileUpdater updaterForInstance:atSpeechProfileSite:](CESRSpeechProfileUpdater, "updaterForInstance:atSpeechProfileSite:", v10, self->_speechProfileSite);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v30 = objc_msgSend(v29, "rebuildCategoryGroup:withSets:version:error:", v11, v12, v17, &v46);
    v31 = (__CFString *)v46;
    if ((v30 & 1) != 0)
    {
      -[__CFString speechCategories](v11, "speechCategories");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordUpdateCompletedForSpeechCategories:version:", v32, v17);

      v33 = *v23;
      if (os_log_type_enabled(*v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
        v49 = 2112;
        v50 = v10;
        v51 = 2112;
        v52 = v11;
        v53 = 2112;
        v54 = v12;
        _os_log_impl(&dword_1B3E5F000, v33, OS_LOG_TYPE_INFO, "%s (%@) Completed Speech Profile update for category group: %@ with sets: %@", buf, 0x2Au);
      }
      objc_msgSend(v10, "changeRegistry");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v31;
      v35 = objc_msgSend(v34, "commitAllBookmarkUpdates:", &v45);
      v36 = v45;

      if ((v35 & 1) != 0)
      {
        v20 = 1;
        v31 = v36;
LABEL_22:

        goto LABEL_23;
      }
      v40 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
        v49 = 2112;
        v50 = v10;
        v51 = 2112;
        v52 = v36;
        _os_log_error_impl(&dword_1B3E5F000, v40, OS_LOG_TYPE_ERROR, "%s (%@) Failed to commit change registry transaction: %@", buf, 0x20u);
      }
      objc_msgSend(v10, "changeRegistry");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v36;
      v42 = objc_msgSend(v41, "clearAllBookmarksAndCommit:", &v44);
      v31 = v44;

      if ((v42 & 1) != 0)
      {
        v20 = 1;
        goto LABEL_22;
      }
      v43 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
        v49 = 2112;
        v50 = v10;
        v51 = 2112;
        v52 = v31;
        _os_log_error_impl(&dword_1B3E5F000, v43, OS_LOG_TYPE_ERROR, "%s (%@) Failed to reset change registry: %@", buf, 0x20u);
      }
    }
    else
    {
      v37 = *v23;
      if (os_log_type_enabled(*v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
        v49 = 2112;
        v50 = v10;
        v51 = 2112;
        v52 = v11;
        v53 = 2112;
        v54 = v12;
        v55 = 2112;
        v56 = v31;
        _os_log_error_impl(&dword_1B3E5F000, v37, OS_LOG_TYPE_ERROR, "%s (%@) Failed to rebuild category group: %@ with sets: %@ error: %@", buf, 0x34u);
      }
      objc_msgSend(v10, "changeRegistry");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "rollbackAllBookmarkUpdates");

    }
    v20 = 0;
    goto LABEL_22;
  }
  v19 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
    v49 = 2112;
    v50 = v10;
    v51 = 2112;
    v52 = v12;
    v53 = 2112;
    v54 = v11;
    _os_log_impl(&dword_1B3E5F000, v19, OS_LOG_TYPE_INFO, "%s (%@) Deferring update for sets: %@ to category group: %@", buf, 0x2Au);
  }
  v20 = 0;
LABEL_23:

  return v20;
}

- (BOOL)_verifyProfileInstance:(id)a3 withAllSets:(id)a4 shouldDefer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  NSObject *v15;
  __objc2_class **v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  __objc2_class **v28;
  id v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  BOOL v34;
  id v36;
  id v37;
  _QWORD v38[2];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[CESRSpeechProfileUpdater updaterForInstance:atSpeechProfileSite:](CESRSpeechProfileUpdater, "updaterForInstance:atSpeechProfileSite:", v8, self->_speechProfileSite);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = 0;
  v12 = objc_msgSend(v11, "detectCategoriesToRebuild:error:", &v37, &v36);
  v13 = v37;
  v14 = v36;
  v15 = *MEMORY[0x1E0CFE6C0];
  v16 = off_1E672B000;
  v17 = *MEMORY[0x1E0CFE6C0];
  if (!v12)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
      v41 = 2112;
      v42 = v8;
      v43 = 2112;
      v44 = v14;
      _os_log_error_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_ERROR, "%s (%@) Failed to detect categories for rebuild: %@", buf, 0x20u);
    }
    +[CESRSpeechProfileCategoryGroup all](CESRSpeechProfileCategoryGroup, "all");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v13;
LABEL_12:
    v13 = v25;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
    v41 = 2112;
    v42 = v8;
    v43 = 2112;
    v44 = v13;
    _os_log_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_INFO, "%s (%@) Categories with an invalid version: %@", buf, 0x20u);
  }
  objc_msgSend(v11, "categoriesToRebuildForAllSets:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
    v41 = 2112;
    v42 = v8;
    v43 = 2112;
    v44 = v18;
    _os_log_impl(&dword_1B3E5F000, v19, OS_LOG_TYPE_INFO, "%s (%@) Categories with a set update: %@", buf, 0x20u);
  }
  if (v18)
  {
    if (v13)
    {
      v38[0] = v13;
      v38[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v20 = v9;
      v21 = v10;
      v22 = v14;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[CESRSpeechProfileCategoryGroup mergeGroups:](CESRSpeechProfileCategoryGroup, "mergeGroups:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v14 = v22;
      v10 = v21;
      v9 = v20;
      v16 = off_1E672B000;
      v13 = (id)v24;
      goto LABEL_13;
    }
    v25 = v18;
    v18 = v25;
    goto LABEL_12;
  }
LABEL_13:

  v26 = *MEMORY[0x1E0CFE6C0];
  v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
  if (v13)
  {
    v28 = v16;
    v29 = v14;
    if (v27)
    {
      *(_DWORD *)buf = 136315650;
      v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
      v41 = 2112;
      v42 = v8;
      v43 = 2112;
      v44 = v13;
      _os_log_impl(&dword_1B3E5F000, v26, OS_LOG_TYPE_INFO, "%s (%@) Profile instance requires rebuild for category group: %@", buf, 0x20u);
    }
    -[CESRSpeechProfileSiteWriter _filterSets:supportedByInstance:](self, "_filterSets:supportedByInstance:", v9, v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class all](v28[11], "all");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v13, "isEqual:", v31);

    if ((v32 & 1) == 0)
    {
      -[CESRSpeechProfileSiteWriter _calculateSets:applicableToGroup:withAllSets:](self, "_calculateSets:applicableToGroup:withAllSets:", v30, v13, 0);
      v33 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v33;
    }

    v34 = -[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:](self, "_updateProfileInstance:categoryGroup:sets:shouldDefer:", v8, v13, v30, v10);
    v11 = v30;
    v14 = v29;
  }
  else if (v27)
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
    v41 = 2112;
    v42 = v8;
    v34 = 1;
    _os_log_impl(&dword_1B3E5F000, v26, OS_LOG_TYPE_INFO, "%s (%@) Verified profile instance - no rebuild required", buf, 0x16u);
  }
  else
  {
    v34 = 1;
  }

  return v34;
}

- (BOOL)_shouldDeferUpdateForInstance:(id)a3 categoryGroup:(id)a4 sets:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  BOOL v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  NSObject *v35;
  double v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  __int128 v43;
  uint64_t v44;
  void *v45;
  id obj;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  _QWORD v62[2];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v56 = 0;
  v11 = +[CESRSpeechProfileUpdater updateModeForSets:speechProfileInstance:speechProfileSite:isAnySetNew:](CESRSpeechProfileUpdater, "updateModeForSets:speechProfileInstance:speechProfileSite:isAnySetNew:", v10, v8, self->_speechProfileSite, &v56);
  if (v56)
  {
    v12 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
      v59 = 2112;
      v60 = v8;
      _os_log_impl(&dword_1B3E5F000, v12, OS_LOG_TYPE_INFO, "%s (%@) No deferral - one or more sets are new", buf, 0x16u);
    }
    v13 = 0;
    goto LABEL_51;
  }
  v14 = v11;
  if (!v11)
  {
    v39 = *MEMORY[0x1E0CFE6C0];
    v13 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
      v59 = 2112;
      v60 = v8;
      v61 = 2112;
      v62[0] = v10;
      _os_log_impl(&dword_1B3E5F000, v39, OS_LOG_TYPE_INFO, "%s (%@) Skipping empty update for sets: %@", buf, 0x20u);
    }
    goto LABEL_51;
  }
  v45 = v9;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(v15);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "itemType") == 49066)
        {
          v38 = *MEMORY[0x1E0CFE6C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
            _os_log_impl(&dword_1B3E5F000, v38, OS_LOG_TYPE_INFO, "%s Overriding deferral for CarPlay #radio — temporary feature for Dawn. This should be removed after Dawn.", buf, 0xCu);
          }

          v13 = 0;
          goto LABEL_50;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v17);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v45, "speechCategories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
  if (!v20)
  {
    v44 = 0;
    v37 = 1;
    goto LABEL_47;
  }
  v22 = v20;
  v44 = 0;
  v47 = *(_QWORD *)v49;
  *(_QWORD *)&v21 = 136315394;
  v43 = v21;
  while (2)
  {
    for (j = 0; j != v22; ++j)
    {
      if (*(_QWORD *)v49 != v47)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
      if (+[CESRSpeechProfileBuilder shouldOverrideDeferralForCategory:updateMode:](CESRSpeechProfileBuilder, "shouldOverrideDeferralForCategory:updateMode:", v24, v14, v43))
      {
        v40 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
          v59 = 2112;
          v60 = v24;
          v61 = 1024;
          LODWORD(v62[0]) = v14;
          _os_log_impl(&dword_1B3E5F000, v40, OS_LOG_TYPE_INFO, "%s No deferral - At least one speech category (%@) qualifies for deferral override with udpateMode: %X", buf, 0x1Cu);
        }
        goto LABEL_46;
      }
      objc_msgSend(v8, "lastCompletedVersionForSpeechCategory:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastRegisteredVersionForSpeechCategory:", v24);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (!v25)
      {
        v41 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v43;
          v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
          v59 = 2112;
          v60 = v24;
          _os_log_impl(&dword_1B3E5F000, v41, OS_LOG_TYPE_INFO, "%s No deferral - At least one speech category (%@) has not completed an update", buf, 0x16u);
        }

LABEL_46:
        v37 = 0;
        goto LABEL_47;
      }
      if (!v26)
      {
        v34 = *MEMORY[0x1E0CFE6C0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
          goto LABEL_32;
        *(_DWORD *)buf = v43;
        v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
        v59 = 2112;
        v60 = v24;
        v32 = v34;
        v33 = "%s No registered update for category (%@)";
        goto LABEL_27;
      }
      v28 = objc_msgSend(v25, "longLongValue");
      v29 = objc_msgSend(v27, "longLongValue");
      v30 = v29 - v28;
      if (v29 < v28)
      {
        v31 = *MEMORY[0x1E0CFE6C0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
          goto LABEL_32;
        *(_DWORD *)buf = v43;
        v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
        v59 = 2112;
        v60 = v24;
        v32 = v31;
        v33 = "%s Unexpected last registered update occurred prior to last completed update (%@)";
LABEL_27:
        _os_log_error_impl(&dword_1B3E5F000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x16u);
        goto LABEL_32;
      }
      if (v30 <= 1799999999)
      {
        v35 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
        {
          v36 = (double)v30 / 1000000.0;
          *(_DWORD *)buf = 136315906;
          v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
          v59 = 2112;
          v60 = v24;
          v61 = 1024;
          LODWORD(v62[0]) = (int)v36 / 60;
          WORD2(v62[0]) = 2048;
          *(double *)((char *)v62 + 6) = v36 - (double)(60 * LODWORD(v62[0]));
          _os_log_impl(&dword_1B3E5F000, v35, OS_LOG_TYPE_INFO, "%s At least one speech category (%@) has completed an update within the deferral window (%i minutes, %lf seconds ago)", buf, 0x26u);
        }
        ++v44;
      }
LABEL_32:

    }
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    v37 = 1;
    if (v22)
      continue;
    break;
  }
LABEL_47:

  if (v44)
    v13 = v37;
  else
    v13 = 0;
LABEL_50:
  v9 = v45;
LABEL_51:

  return v13;
}

- (BOOL)_refreshRankedItemCaches:(id)a3
{
  unsigned int (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  CESRSpeechProfileSite *speechProfileSite;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  CESRSpeechProfileSite *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(_QWORD))a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CESRSpeechProfileSite instances](self->_speechProfileSite, "instances", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v4 && v4[2](v4))
        {
          v13 = *MEMORY[0x1E0CFE6C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
          {
            speechProfileSite = self->_speechProfileSite;
            *(_DWORD *)buf = 136315394;
            v21 = "-[CESRSpeechProfileSiteWriter _refreshRankedItemCaches:]";
            v22 = 2112;
            v23 = speechProfileSite;
            _os_log_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_INFO, "%s (%@) Aborting update due to deferral signal", buf, 0x16u);
          }
          v12 = 0;
          goto LABEL_14;
        }
        +[CESRSpeechProfileUpdater updaterForInstance:atSpeechProfileSite:](CESRSpeechProfileUpdater, "updaterForInstance:atSpeechProfileSite:", v10, self->_speechProfileSite);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "refreshRankedItemCaches");

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)_verifyProfilesWithAllSets:(id)a3 shouldDefer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CESRSpeechProfileSettings *settings;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  os_log_t *v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  BOOL v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  CESRSpeechProfileSiteWriter *v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  -[CESRSpeechProfileSite instances](self->_speechProfileSite, "instances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CESRSpeechProfileSiteWriter _sortInstancesByLocale:](self, "_sortInstancesByLocale:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  settings = self->_settings;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __70__CESRSpeechProfileSiteWriter__verifyProfilesWithAllSets_shouldDefer___block_invoke;
  v29[3] = &unk_1E6733CB8;
  v11 = v9;
  v30 = v11;
  v31 = self;
  v12 = v6;
  v32 = v12;
  v13 = v7;
  v33 = v13;
  v34 = &v35;
  -[CESRSpeechProfileSettings enumerateRequiredInstances:](settings, "enumerateRequiredInstances:", v29);
  v23 = v13;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = v11;
  objc_msgSend(v11, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v26;
    v17 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v20 = *v17;
        if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v40 = "-[CESRSpeechProfileSiteWriter _verifyProfilesWithAllSets:shouldDefer:]";
          v41 = 2112;
          v42 = v19;
          _os_log_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_INFO, "%s Profile Instance (%@) is no longer required following settings refresh", buf, 0x16u);
        }
        -[CESRSpeechProfileSiteWriter _removeProfileInstance:](self, "_removeProfileInstance:", v19);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
    }
    while (v15);
  }

  v21 = *((_BYTE *)v36 + 24) != 0;
  _Block_object_dispose(&v35, 8);

  return v21;
}

- (BOOL)_verifyProfileInstance:(id)a3 locale:(id)a4 options:(unsigned __int8)a5 allSets:(id)a6 shouldDefer:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  NSObject **v17;
  NSObject *v18;
  _BOOL4 v19;
  BOOL v20;
  os_log_t *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  CESRSpeechProfileSite *speechProfileSite;
  id v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  char v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v9 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!v12)
  {
    v21 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v22 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      objc_msgSend(v13, "localeIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
      v44 = 2112;
      v45 = v24;
      _os_log_impl(&dword_1B3E5F000, v23, OS_LOG_TYPE_INFO, "%s No profile instance exists with locale: %@", buf, 0x16u);

    }
    speechProfileSite = self->_speechProfileSite;
    v41 = 0;
    -[CESRSpeechProfileSite instanceWithLocale:options:error:](speechProfileSite, "instanceWithLocale:options:error:", v13, v9, &v41);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v41;
    if (v12)
      goto LABEL_17;
    v27 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      v28 = v27;
      objc_msgSend(v13, "localeIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      CESRSpeechProfileInstanceOptionsDescription(v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
      v44 = 2112;
      v45 = v29;
      v46 = 2112;
      v47 = v30;
      v48 = 2112;
      v49 = v26;
      _os_log_impl(&dword_1B3E5F000, v28, OS_LOG_TYPE_INFO, "%s Failed create instance with locale: %@ options: %@ error: %@", buf, 0x2Au);

    }
    v12 = 0;
    goto LABEL_20;
  }
  v16 = objc_msgSend(v12, "options");
  v17 = (NSObject **)MEMORY[0x1E0CFE6C0];
  v18 = *MEMORY[0x1E0CFE6C0];
  v19 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
  if (v16 != (_DWORD)v9)
  {
    if (v19)
    {
      v31 = v18;
      CESRSpeechProfileInstanceOptionsDescription(v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
      v44 = 2112;
      v45 = v12;
      v46 = 2112;
      v47 = v32;
      _os_log_impl(&dword_1B3E5F000, v31, OS_LOG_TYPE_INFO, "%s Profile instance (%@) requires new options [%@] following settings refresh", buf, 0x20u);

    }
    v40 = 0;
    v33 = objc_msgSend(v12, "updateOptions:error:", v9, &v40);
    v26 = v40;
    v34 = *v17;
    v35 = *v17;
    if ((v33 & 1) != 0)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
        v44 = 2112;
        v45 = v12;
        _os_log_impl(&dword_1B3E5F000, v34, OS_LOG_TYPE_INFO, "%s Profile instance (%@) options updated", buf, 0x16u);
      }
LABEL_17:
      +[CESRSpeechProfileCategoryGroup all](CESRSpeechProfileCategoryGroup, "all");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:](self, "_updateProfileInstance:categoryGroup:sets:shouldDefer:", v12, v36, v14, v15);

LABEL_21:
      goto LABEL_22;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v38 = v34;
      CESRSpeechProfileInstanceOptionsDescription(v9);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
      v44 = 2112;
      v45 = v39;
      v46 = 2112;
      v47 = v12;
      v48 = 2112;
      v49 = v26;
      _os_log_error_impl(&dword_1B3E5F000, v38, OS_LOG_TYPE_ERROR, "%s Failed to update options [%@] for profile instance (%@) error: %@", buf, 0x2Au);

    }
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if (v19)
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
    v44 = 2112;
    v45 = v12;
    _os_log_impl(&dword_1B3E5F000, v18, OS_LOG_TYPE_INFO, "%s Verifying profile instance (%@)", buf, 0x16u);
  }
  v20 = -[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:](self, "_verifyProfileInstance:withAllSets:shouldDefer:", v12, v14, v15);
LABEL_22:

  return v20;
}

- (id)_sortInstancesByLocale:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "locale", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_speechProfileSite, 0);
}

void __70__CESRSpeechProfileSiteWriter__verifyProfilesWithAllSets_shouldDefer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = (void *)MEMORY[0x1B5E32668]();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v7);
  if ((objc_msgSend(*(id *)(a1 + 40), "_verifyProfileInstance:locale:options:allSets:shouldDefer:", v6, v7, a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)) & 1) == 0)*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

  objc_autoreleasePoolPop(v5);
}

void __75__CESRSpeechProfileSiteWriter__updateProfilesWithSets_allSets_shouldDefer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  __int128 v41;
  _BYTE v42[10];
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1B5E32668]();
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v35 = 0;
  objc_msgSend(v7, "instanceWithLocale:options:error:", v5, a3, &v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v35;
  if (v8)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "_filterSets:supportedByInstance:", v10, v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      if (!v12)
      {
        v29 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
          v38 = 2112;
          v39 = v8;
          _os_log_impl(&dword_1B3E5F000, v29, OS_LOG_TYPE_INFO, "%s (%@) No applicable sets", buf, 0x16u);
        }
        v14 = 0;
        goto LABEL_22;
      }
      v13 = v12;
      +[CESRSpeechProfileCategoryGroup groupForSets:](CESRSpeechProfileCategoryGroup, "groupForSets:", v11);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_calculateSets:applicableToGroup:withAllSets:", v11, v14, *(_QWORD *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "count");
      v17 = *MEMORY[0x1E0CFE6C0];
      v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
      if (!v16)
      {
        if (v18)
        {
          *(_DWORD *)buf = 136315650;
          v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
          v38 = 2112;
          v39 = v8;
          v40 = 2112;
          *(_QWORD *)&v41 = v14;
          _os_log_impl(&dword_1B3E5F000, v17, OS_LOG_TYPE_INFO, "%s (%@) No applicable sets after mapping to category group: %@", buf, 0x20u);
        }
        v11 = v15;
        goto LABEL_22;
      }
      if (v18)
      {
        v19 = v17;
        v20 = objc_msgSend(v15, "count");
        v21 = objc_msgSend(*(id *)(a1 + 40), "count");
        *(_DWORD *)buf = 136316674;
        v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
        v38 = 2112;
        v39 = v8;
        v40 = 1024;
        LODWORD(v41) = v20;
        WORD2(v41) = 1024;
        *(_DWORD *)((char *)&v41 + 6) = v13;
        WORD5(v41) = 1024;
        HIDWORD(v41) = v21;
        *(_WORD *)v42 = 2112;
        *(_QWORD *)&v42[2] = v14;
        v43 = 2112;
        v44 = v15;
        _os_log_impl(&dword_1B3E5F000, v19, OS_LOG_TYPE_INFO, "%s (%@) Calculated %u total sets from %u applicable out of %u updated sets to category group: %@ sets: %@", buf, 0x3Cu);

      }
      v11 = v15;
    }
    else
    {
      +[CESRSpeechProfileCategoryGroup all](CESRSpeechProfileCategoryGroup, "all");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v11 = *(id *)(a1 + 48);
      v23 = (void *)*MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        v24 = v23;
        v25 = objc_msgSend(v11, "count");
        *(_DWORD *)buf = 136316162;
        v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
        v38 = 2112;
        v39 = v8;
        v40 = 1024;
        LODWORD(v41) = v25;
        WORD2(v41) = 2112;
        *(_QWORD *)((char *)&v41 + 6) = v14;
        HIWORD(v41) = 2112;
        *(_QWORD *)v42 = v11;
        _os_log_impl(&dword_1B3E5F000, v24, OS_LOG_TYPE_INFO, "%s (%@) Rebuilding with %u total sets with category group: %@ sets: %@", buf, 0x30u);

      }
    }
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __75__CESRSpeechProfileSiteWriter__updateProfilesWithSets_allSets_shouldDefer___block_invoke_6;
    v30[3] = &unk_1E6733C68;
    v26 = *(void **)(a1 + 32);
    v27 = *(id *)(a1 + 40);
    v28 = *(_QWORD *)(a1 + 32);
    v31 = v27;
    v32 = v28;
    v33 = v8;
    v14 = v14;
    v34 = v14;
    if ((objc_msgSend(v26, "_updateProfileInstance:categoryGroup:sets:shouldDefer:", v33, v14, v11, v30) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

LABEL_22:
    goto LABEL_23;
  }
  v22 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
    v38 = 2112;
    v39 = v9;
    _os_log_error_impl(&dword_1B3E5F000, v22, OS_LOG_TYPE_ERROR, "%s Failed to resolve / create instance: %@", buf, 0x16u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_23:

  objc_autoreleasePoolPop(v6);
}

uint64_t __75__CESRSpeechProfileSiteWriter__updateProfilesWithSets_allSets_shouldDefer___block_invoke_6(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_shouldDeferUpdateForInstance:categoryGroup:sets:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    return 0;
}

@end
