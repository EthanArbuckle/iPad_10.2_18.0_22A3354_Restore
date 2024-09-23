@implementation ML3UpdateSpotlightIndexOperation

- (unint64_t)type
{
  return 4;
}

- (BOOL)_execute:(id *)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id *v22;
  BOOL v23;
  dispatch_semaphore_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  id *v48;
  _BOOL4 v49;
  id *v50;
  BOOL v51;
  NSObject *v52;
  id *v53;
  _BOOL4 v54;
  id *v55;
  BOOL v56;
  double v57;
  double v58;
  int v59;
  NSObject *v60;
  _BOOL4 v61;
  const char *v62;
  BOOL v63;
  NSObject *v65;
  id *v66;
  _BOOL4 v67;
  id *v68;
  NSObject *v69;
  _BOOL4 v70;
  id *v71;
  BOOL v72;
  id *v73;
  _BOOL4 v74;
  id *v75;
  uint64_t v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  _QWORD v87[4];
  NSObject *v88;
  _BYTE *v89;
  uint64_t *v90;
  uint64_t *v91;
  id obj;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  const __CFString *v104;
  uint8_t v105[4];
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  _BYTE buf[24];
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v99 = 0;
  v100 = &v99;
  v101 = 0x2020000000;
  v102 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__20235;
  v97 = __Block_byref_object_dispose__20236;
  v98 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[ML3DatabaseOperation attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("MLDatabaseOperationAttributeBundleIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3UpdateSpotlightIndexOperation setBundleIdentifier:](self, "setBundleIdentifier:", v8);

  -[ML3UpdateSpotlightIndexOperation bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3UpdateSpotlightIndexOperation setBundle:](self, "setBundle:", _MLDUpdateSpotlightIndexBundleForBundleIdentifier(v9));

  v10 = objc_alloc(MEMORY[0x1E0CA6B38]);
  v11 = -[ML3UpdateSpotlightIndexOperation bundle](self, "bundle");
  if (v11 == 1)
  {
    v12 = CFSTR("Music");
  }
  else if (v11 == 2)
  {
    v12 = CFSTR("Videos");
  }
  else
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Trying create an index name with an unknown bundle", buf, 2u);
    }

    v12 = CFSTR("Unkown bundle index");
  }
  -[ML3UpdateSpotlightIndexOperation bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithName:protectionClass:bundleIdentifier:", v12, *MEMORY[0x1E0CB2AC0], v14);
  -[ML3UpdateSpotlightIndexOperation setIndex:](self, "setIndex:", v15);

  v16 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[ML3UpdateSpotlightIndexOperation bundleIdentifier](self, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v17;
    _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Operation %p started for bundleID %{public}@", buf, 0x16u);

  }
  -[ML3DatabaseOperation attributes](self, "attributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("MLDatabaseOperationAttributeEntityURLsArrayKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v19, "count"))
  {
    v24 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v110 = __Block_byref_object_copy__20235;
    v111 = __Block_byref_object_dispose__20236;
    v112 = 0;
    -[ML3UpdateSpotlightIndexOperation index](self, "index");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __45__ML3UpdateSpotlightIndexOperation__execute___block_invoke;
    v87[3] = &unk_1E5B65778;
    v89 = buf;
    v90 = &v99;
    v91 = &v93;
    v26 = v24;
    v88 = v26;
    objc_msgSend(v25, "fetchLastClientStateWithCompletionHandler:", v87);

    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    if ((-[ML3UpdateSpotlightIndexOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v27 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v105 = 0;
        _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] **The operation was cancelled before the indexed client state was evaluated**", v105, 2u);
      }

      *((_BYTE *)v100 + 24) = 0;
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v103 = *MEMORY[0x1E0CB2D50];
      v104 = CFSTR("The operation was cancelled before the indexed client state was evaluated.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("MLDSpotlightIndexOperationErrorDomain"), 1004, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v94[5];
      v94[5] = v30;

      goto LABEL_37;
    }
    if (v94[5])
    {
LABEL_37:

      _Block_object_dispose(buf, 8);
      goto LABEL_38;
    }
    v32 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (!v32)
    {
      v52 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v105 = 0;
        _os_log_impl(&dword_1AC149000, v52, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] No client state indexed, it's a fresh start. Wiping the index and indexing everything", v105, 2u);
      }

      v53 = (id *)(v94 + 5);
      v79 = (id)v94[5];
      v54 = -[ML3UpdateSpotlightIndexOperation _deleteAllIndexedItemsWithError:](self, "_deleteAllIndexedItemsWithError:", &v79);
      objc_storeStrong(v53, v79);
      *((_BYTE *)v100 + 24) = v54;
      if (v54)
      {
        v55 = (id *)(v94 + 5);
        v78 = (id)v94[5];
        v56 = -[ML3UpdateSpotlightIndexOperation _indexItemsFromLibrarySinceRevision:targetRevision:error:](self, "_indexItemsFromLibrarySinceRevision:targetRevision:error:", 0, 0, &v78);
        objc_storeStrong(v55, v78);
        *((_BYTE *)v100 + 24) = v56;
      }
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v32, 0, 0, 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary())
      goto LABEL_27;
    objc_msgSend(v77, "objectForKey:", CFSTR("libraryID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3DatabaseOperation library](self, "library");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "libraryUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v33, "isEqualToString:", v35);

    if (v36)
    {
      v37 = _MLDUpdateSpotlightIndexVersionForBundle(-[ML3UpdateSpotlightIndexOperation bundle](self, "bundle"));
      objc_msgSend(v77, "objectForKey:", CFSTR("version"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "longLongValue");

      if (v39 == v37)
      {
        objc_msgSend(v77, "objectForKey:", CFSTR("revision"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "longLongValue");

        objc_msgSend(v77, "objectForKey:", CFSTR("targetRevision"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v42, "longLongValue");

        -[ML3DatabaseOperation library](self, "library");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "currentRevision");

        if (v41 == v44)
        {
          _ML3LogCategoryDefault();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v105 = 134217984;
            v106 = v41;
            _os_log_impl(&dword_1AC149000, v45, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed database revision and client library revision (%lld) are the same, no index update needed", v105, 0xCu);
          }

          *((_BYTE *)v100 + 24) = 1;
          v46 = (void *)v94[5];
          v94[5] = 0;

          goto LABEL_32;
        }
        _ML3LogCategoryDefault();
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
        if (v41 < v44)
        {
          if (v70)
          {
            *(_DWORD *)v105 = 134218240;
            v106 = v41;
            v107 = 2048;
            v108 = v44;
            _os_log_impl(&dword_1AC149000, v69, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Revisions differ, indexed:%lld current:%lld, updating index with delta changes", v105, 0x16u);
          }

          v71 = (id *)(v94 + 5);
          v86 = (id)v94[5];
          v72 = -[ML3UpdateSpotlightIndexOperation _indexItemsFromLibrarySinceRevision:targetRevision:error:](self, "_indexItemsFromLibrarySinceRevision:targetRevision:error:", v41, v76, &v86);
          objc_storeStrong(v71, v86);
          *((_BYTE *)v100 + 24) = v72;
          goto LABEL_32;
        }
        if (v70)
        {
          *(_DWORD *)v105 = 134218240;
          v106 = v41;
          v107 = 2048;
          v108 = v44;
          _os_log_impl(&dword_1AC149000, v69, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed client state %lld is invalid (current library state is: %lld), wiping the index and re-indexing everything", v105, 0x16u);
        }

        v73 = (id *)(v94 + 5);
        v85 = (id)v94[5];
        v74 = -[ML3UpdateSpotlightIndexOperation _deleteAllIndexedItemsWithError:](self, "_deleteAllIndexedItemsWithError:", &v85);
        objc_storeStrong(v73, v85);
        *((_BYTE *)v100 + 24) = v74;
        if (!v74)
          goto LABEL_32;
        v75 = (id *)(v94 + 5);
        v84 = (id)v94[5];
        v51 = -[ML3UpdateSpotlightIndexOperation _indexItemsFromLibrarySinceRevision:targetRevision:error:](self, "_indexItemsFromLibrarySinceRevision:targetRevision:error:", 0, 0, &v84);
        objc_storeStrong(v75, v84);
      }
      else
      {
        _ML3LogCategoryDefault();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 134218240;
          v106 = v39;
          v107 = 2048;
          v108 = v37;
          _os_log_impl(&dword_1AC149000, v65, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed client state has an index version (%lld) that's not the current (%lld), wiping the index and re-indexing everything", v105, 0x16u);
        }

        v66 = (id *)(v94 + 5);
        v83 = (id)v94[5];
        v67 = -[ML3UpdateSpotlightIndexOperation _deleteAllIndexedItemsWithError:](self, "_deleteAllIndexedItemsWithError:", &v83);
        objc_storeStrong(v66, v83);
        *((_BYTE *)v100 + 24) = v67;
        if (!v67)
          goto LABEL_32;
        v68 = (id *)(v94 + 5);
        v82 = (id)v94[5];
        v51 = -[ML3UpdateSpotlightIndexOperation _indexItemsFromLibrarySinceRevision:targetRevision:error:](self, "_indexItemsFromLibrarySinceRevision:targetRevision:error:", 0, 0, &v82);
        objc_storeStrong(v68, v82);
      }
    }
    else
    {
LABEL_27:
      v47 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 138543362;
        v106 = (uint64_t)v77;
        _os_log_impl(&dword_1AC149000, v47, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed client state is invalid or indexed library differs from the current library, wiping the index and re-indexing everything. Fetched client state: %{public}@", v105, 0xCu);
      }

      v48 = (id *)(v94 + 5);
      v81 = (id)v94[5];
      v49 = -[ML3UpdateSpotlightIndexOperation _deleteAllIndexedItemsWithError:](self, "_deleteAllIndexedItemsWithError:", &v81);
      objc_storeStrong(v48, v81);
      *((_BYTE *)v100 + 24) = v49;
      if (!v49)
        goto LABEL_32;
      v50 = (id *)(v94 + 5);
      v80 = (id)v94[5];
      v51 = -[ML3UpdateSpotlightIndexOperation _indexItemsFromLibrarySinceRevision:targetRevision:error:](self, "_indexItemsFromLibrarySinceRevision:targetRevision:error:", 0, 0, &v80);
      objc_storeStrong(v50, v80);
    }
    *((_BYTE *)v100 + 24) = v51;
LABEL_32:

    goto LABEL_37;
  }
  v20 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Index update operation will process %lu items for content updates and deletes", buf, 0xCu);
  }

  v22 = (id *)(v94 + 5);
  obj = (id)v94[5];
  v23 = -[ML3UpdateSpotlightIndexOperation _updateIndexedItemsWithIdentifiers:error:](self, "_updateIndexedItemsWithIdentifiers:error:", v19, &obj);
  objc_storeStrong(v22, obj);
  *((_BYTE *)v100 + 24) = v23;
LABEL_38:
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", v76);
  v58 = v57 - v6;
  v59 = *((unsigned __int8 *)v100 + 24);
  v60 = os_log_create("com.apple.amp.medialibrary", "Default");
  v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
  if (v59)
  {
    if (!v61)
      goto LABEL_44;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v58;
    v62 = "[ML3UpdateSpotlightIndexOperation] Index update operation %p finished successfully in %.3f seconds";
  }
  else
  {
    if (!v61)
      goto LABEL_44;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v58;
    v62 = "[ML3UpdateSpotlightIndexOperation] Index update operation %p failed in %.3f seconds";
  }
  _os_log_impl(&dword_1AC149000, v60, OS_LOG_TYPE_DEFAULT, v62, buf, 0x16u);
LABEL_44:

  if (a3)
    *a3 = objc_retainAutorelease((id)v94[5]);
  v63 = *((_BYTE *)v100 + 24) != 0;

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);
  return v63;
}

- (BOOL)_updateIndexedItemsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Checking for updates and deletes for the received identifiers", buf, 2u);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ML3DatabaseOperation library](self, "library");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3Entity entityFromURL:inLibrary:verifyExistence:](ML3Entity, "entityFromURL:inLibrary:verifyExistence:", v12, v13, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "persistentID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((isKindOfClass & 1) != 0)
            v17 = v24;
          else
            v17 = v23;
          objc_msgSend(v17, "addObject:", v16);

        }
        else
        {
          objc_msgSend(v25, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  v28 = 0;
  v18 = -[ML3UpdateSpotlightIndexOperation _deleteIndexedItemsWithEntityStringIDs:error:](self, "_deleteIndexedItemsWithEntityStringIDs:error:", v25, &v28);
  v19 = v28;
  if (!v19)
  {
    v27 = 0;
    v18 = -[ML3UpdateSpotlightIndexOperation _indexTracksWithPersistentIDs:playlistsWithPersistentIDs:error:](self, "_indexTracksWithPersistentIDs:playlistsWithPersistentIDs:error:", v24, v23, &v27);
    v19 = v27;
  }
  v20 = v19;
  if (a4)
    *a4 = objc_retainAutorelease(v19);

  return v18;
}

- (BOOL)_indexItemsFromLibrarySinceRevision:(int64_t)a3 targetRevision:(int64_t)a4 error:(id *)a5
{
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  int64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  NSObject *v27;
  BOOL v28;
  uint8_t v30[8];
  id obj;
  _QWORD v32[12];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  const __CFString *v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Will index items with initial revision %lu target revision %lu", buf, 0x16u);
  }

  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v62 = __Block_byref_object_copy__20235;
  v63 = __Block_byref_object_dispose__20236;
  v64 = 0;
  v10 = (void *)MEMORY[0x1AF43CC0C]();
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__20235;
  v53 = __Block_byref_object_dispose__20236;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__20235;
  v47 = __Block_byref_object_dispose__20236;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__20235;
  v41 = __Block_byref_object_dispose__20236;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseOperation library](self, "library");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "currentRevision");

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = v12;
  if (a4 | a3)
    v13 = a4;
  else
    v13 = v12;
  -[ML3DatabaseOperation library](self, "library");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[ML3Entity revisionTrackingCode](ML3Entity, "revisionTrackingCode");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __93__ML3UpdateSpotlightIndexOperation__indexItemsFromLibrarySinceRevision_targetRevision_error___block_invoke;
  v32[3] = &unk_1E5B657A0;
  v32[4] = self;
  v32[5] = &v49;
  v32[6] = &v43;
  v32[7] = &v37;
  v32[8] = &v55;
  v32[9] = buf;
  v32[10] = &v33;
  v32[11] = v13;
  objc_msgSend(v14, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:", a3, v15, 1, 0, 1, v32);

  if (*((_BYTE *)v56 + 24))
  {
    if ((-[ML3UpdateSpotlightIndexOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] **The operation was cancelled. Skipping searchable item creation.**", v30, 2u);
      }

      *((_BYTE *)v56 + 24) = 0;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2D50];
      v60 = CFSTR("The operation was cancelled on searchable items creation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("MLDSpotlightIndexOperationErrorDomain"), 1004, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v19;

    }
    else
    {
      if (v12 <= v34[3])
        v21 = v34[3];
      else
        v21 = v12;
      v34[3] = v21;
      v22 = v50[5];
      v23 = v44[5];
      v24 = v38[5];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)&buf[8];
      obj = *(id *)(*(_QWORD *)&buf[8] + 40);
      v26 = -[ML3UpdateSpotlightIndexOperation _batchIndexWithTrackPersistentIDsToUpdate:playlistsPersistentIDsToUpdateSet:entityStringsToDelete:currentRevision:targetRevision:error:](self, "_batchIndexWithTrackPersistentIDsToUpdate:playlistsPersistentIDsToUpdateSet:entityStringsToDelete:currentRevision:targetRevision:error:", v22, v23, v24, v18, &unk_1E5BAC438, &obj);
      objc_storeStrong((id *)(v25 + 40), obj);
      *((_BYTE *)v56 + 24) = v26;
    }

    if (*((_BYTE *)v56 + 24))
    {
      v27 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Finished items index batch", v30, 2u);
      }

    }
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  objc_autoreleasePoolPop(v10);
  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v28 = *((_BYTE *)v56 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v55, 8);
  return v28;
}

- (BOOL)_deleteAllIndexedItemsWithError:(id *)a3
{
  NSObject *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  char v9;
  _QWORD v11[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__20235;
  v20 = __Block_byref_object_dispose__20236;
  v21 = 0;
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Deleting all indexed items", buf, 2u);
  }

  v6 = dispatch_semaphore_create(0);
  -[ML3UpdateSpotlightIndexOperation index](self, "index");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__ML3UpdateSpotlightIndexOperation__deleteAllIndexedItemsWithError___block_invoke;
  v11[3] = &unk_1E5B657C8;
  v11[4] = self;
  v13 = &v22;
  v14 = &v16;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "deleteAllSearchableItemsWithCompletionHandler:", v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v9 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v9;
}

- (BOOL)_deleteIndexedItemsWithEntityStringIDs:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  char v11;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint8_t buf[16];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__20235;
  v23 = __Block_byref_object_dispose__20236;
  v24 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Started to delete items", buf, 2u);
    }

    v8 = dispatch_semaphore_create(0);
    -[ML3UpdateSpotlightIndexOperation index](self, "index");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__ML3UpdateSpotlightIndexOperation__deleteIndexedItemsWithEntityStringIDs_error___block_invoke;
    v13[3] = &unk_1E5B657C8;
    v14 = v6;
    v16 = &v25;
    v17 = &v19;
    v10 = v8;
    v15 = v10;
    objc_msgSend(v9, "deleteSearchableItemsWithIdentifiers:completionHandler:", v14, v13);

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v11 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v11;
}

- (BOOL)_indexTracksWithPersistentIDs:(id)a3 playlistsWithPersistentIDs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id *v11;
  NSObject *v12;
  id *v13;
  id *v14;
  char v15;
  _QWORD v17[7];
  id v18;
  _QWORD v19[7];
  id obj;
  uint8_t buf[16];
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__20235;
  v26 = __Block_byref_object_dispose__20236;
  v27 = 0;
  if (objc_msgSend(v8, "count") && !v23[5])
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Started to index track items", buf, 2u);
    }

    v11 = v23;
    obj = v23[5];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke;
    v19[3] = &unk_1E5B65818;
    v19[4] = self;
    v19[5] = &v28;
    v19[6] = &v22;
    -[ML3UpdateSpotlightIndexOperation _enumerateSearchableItemsWithPersistentIDs:entityType:error:usingBlock:](self, "_enumerateSearchableItemsWithPersistentIDs:entityType:error:usingBlock:", v8, 0, &obj, v19);
    objc_storeStrong(v11 + 5, obj);
  }
  if (-[ML3UpdateSpotlightIndexOperation bundle](self, "bundle") == 1 && objc_msgSend(v9, "count") && !v23[5])
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Started to index playlists", buf, 2u);
    }

    v13 = v23;
    v18 = v23[5];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_34;
    v17[3] = &unk_1E5B65818;
    v17[4] = self;
    v17[5] = &v28;
    v17[6] = &v22;
    -[ML3UpdateSpotlightIndexOperation _enumerateSearchableItemsWithPersistentIDs:entityType:error:usingBlock:](self, "_enumerateSearchableItemsWithPersistentIDs:entityType:error:usingBlock:", v9, 1, &v18, v17);
    objc_storeStrong(v13 + 5, v18);
  }
  v14 = v23;
  if (v23[5])
    *((_BYTE *)v29 + 24) = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v14[5]);
  v15 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

- (BOOL)_batchIndexWithTrackPersistentIDsToUpdate:(id)a3 playlistsPersistentIDsToUpdateSet:(id)a4 entityStringsToDelete:(id)a5 currentRevision:(id)a6 targetRevision:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id *v22;
  BOOL v23;
  id *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  unint64_t v32;
  uint64_t v33;
  dispatch_semaphore_t v34;
  void *v35;
  NSObject *v36;
  BOOL v37;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  ML3UpdateSpotlightIndexOperation *v43;
  NSObject *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  id v48;
  id obj;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _QWORD v60[4];
  _QWORD v61[4];
  uint8_t buf[4];
  unint64_t v63;
  __int16 v64;
  ML3UpdateSpotlightIndexOperation *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v40 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 1;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__20235;
  v54 = __Block_byref_object_dispose__20236;
  v55 = 0;
  ++self->_batchCount;
  v17 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = -[ML3UpdateSpotlightIndexOperation batchCount](self, "batchCount");
    *(_DWORD *)buf = 134218240;
    v63 = v18;
    v64 = 2048;
    v65 = self;
    _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┏ Beginning Core Spotlight index batch %lu for operation %p", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v20 = v19;
  -[ML3UpdateSpotlightIndexOperation index](self, "index");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "beginIndexBatch");

  v22 = (id *)(v51 + 5);
  obj = (id)v51[5];
  v23 = -[ML3UpdateSpotlightIndexOperation _deleteIndexedItemsWithEntityStringIDs:error:](self, "_deleteIndexedItemsWithEntityStringIDs:error:", v14, &obj);
  objc_storeStrong(v22, obj);
  *((_BYTE *)v57 + 24) = v23;
  v24 = (id *)(v51 + 5);
  if (!v51[5])
  {
    v48 = 0;
    v25 = -[ML3UpdateSpotlightIndexOperation _indexTracksWithPersistentIDs:playlistsWithPersistentIDs:error:](self, "_indexTracksWithPersistentIDs:playlistsWithPersistentIDs:error:", v39, v40, &v48);
    objc_storeStrong(v24, v48);
    *((_BYTE *)v57 + 24) = v25;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _MLDUpdateSpotlightIndexVersionForBundle(-[ML3UpdateSpotlightIndexOperation bundle](self, "bundle")));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v51[5])
  {
    v61[0] = v15;
    v60[0] = CFSTR("revision");
    v60[1] = CFSTR("libraryID");
    -[ML3DatabaseOperation library](self, "library");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "libraryUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v28;
    v61[2] = v26;
    v60[2] = CFSTR("version");
    v60[3] = CFSTR("targetRevision");
    v61[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v29, 200, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = -[ML3UpdateSpotlightIndexOperation batchCount](self, "batchCount");
      v33 = objc_msgSend(v30, "length");
      *(_DWORD *)buf = 134218240;
      v63 = v32;
      v64 = 2048;
      v65 = (ML3UpdateSpotlightIndexOperation *)v33;
      _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Updating indexed client state and fininshing index batch %lu with client state data size: %lu", buf, 0x16u);
    }

    v34 = dispatch_semaphore_create(0);
    -[ML3UpdateSpotlightIndexOperation index](self, "index");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __171__ML3UpdateSpotlightIndexOperation__batchIndexWithTrackPersistentIDsToUpdate_playlistsPersistentIDsToUpdateSet_entityStringsToDelete_currentRevision_targetRevision_error___block_invoke;
    v41[3] = &unk_1E5B65840;
    v47 = v20;
    v42 = v29;
    v43 = self;
    v45 = &v56;
    v46 = &v50;
    v36 = v34;
    v44 = v36;
    objc_msgSend(v35, "endIndexBatchWithClientState:completionHandler:", v30, v41);

    dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a8)
    *a8 = objc_retainAutorelease((id)v51[5]);
  v37 = *((_BYTE *)v57 + 24) != 0;

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  return v37;
}

- (BOOL)_enumerateSearchableItemsWithPersistentIDs:(id)a3 entityType:(int64_t)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10;
  void (**v11)(id, NSObject *);
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_log_t v21;
  NSObject *v22;
  _BOOL4 v23;
  BOOL v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v28;
  id *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, NSObject *))a6;
  if (v11)
  {
    v12 = (void *)MEMORY[0x1AF43CC0C]();
    v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Evaluating the need of batching for database fetch", buf, 2u);
    }

    if ((unint64_t)objc_msgSend(v10, "count") < 0x321)
    {
      v30 = 0;
      -[ML3UpdateSpotlightIndexOperation _createSearchableItemsWithPersistentIDs:entityType:error:](self, "_createSearchableItemsWithPersistentIDs:entityType:error:", v10, a4, &v30);
      v19 = objc_claimAutoreleasedReturnValue();
      v21 = (os_log_t)v30;
      v25 = os_log_create("com.apple.amp.medialibrary", "Default");
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v26)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to create searchable items", buf, 2u);
        }

        v24 = 1;
        goto LABEL_34;
      }
      v28 = v12;
      v29 = a5;
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Created searchable items batch", buf, 2u);
      }

      v11[2](v11, v19);
    }
    else
    {
      v28 = v12;
      v29 = a5;
      v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v33 = 800;
        _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Library fetch batching is needed, fetching from the DB in chuncks of %lu", buf, 0xCu);
      }

      if (objc_msgSend(v10, "count"))
      {
        v15 = 0;
        v16 = 0;
        while (1)
        {
          v17 = objc_msgSend(v10, "count", v28, v29);
          v18 = (unint64_t)(v17 + v15) >= 0x320 ? 800 : v17 + v15;
          objc_msgSend(v10, "subarrayWithRange:", v16, v18);
          v19 = objc_claimAutoreleasedReturnValue();
          v31 = 0;
          -[ML3UpdateSpotlightIndexOperation _createSearchableItemsWithPersistentIDs:entityType:error:](self, "_createSearchableItemsWithPersistentIDs:entityType:error:", v19, a4, &v31);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (os_log_t)v31;
          v22 = os_log_create("com.apple.amp.medialibrary", "Default");
          v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if (v21)
            break;
          if (v23)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Created searchable items batch with library fetch batching", buf, 2u);
          }

          v11[2](v11, v20);
          v16 += 800;
          v15 -= 800;
          if (v16 >= objc_msgSend(v10, "count"))
            goto LABEL_27;
        }
        if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to create searchable items batch with library fetch batching", buf, 2u);
        }

        v24 = 1;
        goto LABEL_33;
      }
    }
LABEL_27:
    v19 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Searchable item creation is done", buf, 2u);
    }
    v24 = 0;
    v21 = 0;
LABEL_33:
    v12 = v28;
    a5 = v29;
LABEL_34:

    objc_autoreleasePoolPop(v12);
    if (a5)
    {
      v21 = objc_retainAutorelease(v21);
      *a5 = v21;
    }
    goto LABEL_36;
  }
  v21 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Attempted to enumerate searchable items without block, returning", buf, 2u);
  }
  v24 = 1;
LABEL_36:

  return v24;
}

- (id)_createSearchableItemsWithPersistentIDs:(id)a3 entityType:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ML3UpdateSpotlightIndexOperation *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  ML3UpdateSpotlightIndexOperation *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  __int128 v54;
  id v55;
  id *v56;
  ML3UpdateSpotlightIndexOperation *v57;
  id v59;
  id v60;
  id v61;
  _QWORD v62[2];
  __int128 buf;
  void *v64;
  void *v65;
  _QWORD v66[2];
  uint64_t v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!a4)
  {
    v19 = -[ML3UpdateSpotlightIndexOperation bundle](self, "bundle");
    if (v19 == 2)
    {
      v57 = self;
      +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("media_type"), &unk_1E5BAC480, 10);
      v28 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = v28;
      +[ML3PropertyPredicate predicateWithProperty:](ML3PropertyPredicate, "predicateWithProperty:", CFSTR("in_my_library"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&buf + 1) = v30;
      +[ML3PropertyPredicate predicateWithProperty:](ML3PropertyPredicate, "predicateWithProperty:", CFSTR("(item.base_location_id OR item.remote_location_id)"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v29;
      +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("item.is_music_show"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v19 != 1)
      {
        v28 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Trying to build searchable items with an unknown bundle id", (uint8_t *)&buf, 2u);
        }
        v18 = 0;
        goto LABEL_13;
      }
      v57 = self;
      +[ML3PropertyPredicate predicateWithProperty:](ML3PropertyPredicate, "predicateWithProperty:", CFSTR("in_my_library"));
      *(_QWORD *)&v54 = objc_claimAutoreleasedReturnValue();
      +[ML3PropertyPredicate predicateWithProperty:](ML3PropertyPredicate, "predicateWithProperty:", CFSTR("(item.base_location_id OR item.remote_location_id)"));
      *((_QWORD *)&v54 + 1) = objc_claimAutoreleasedReturnValue();
      buf = v54;
      +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("media_type"), &unk_1E5BAC468, 10);
      v53 = objc_claimAutoreleasedReturnValue();
      v67 = v53;
      +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("media_type"), &unk_1E5BAC450, 10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v20;
      +[ML3PropertyPredicate predicateWithProperty:](ML3PropertyPredicate, "predicateWithProperty:", CFSTR("item.is_music_show"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v52);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v23);
      v24 = a5;
      v25 = v9;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v54;
      v9 = v25;
      a5 = v24;
      v29 = (void *)v53;

      v30 = (void *)*((_QWORD *)&v54 + 1);
    }

    self = v57;
LABEL_13:

    goto LABEL_14;
  }
  if (a4 == 1)
  {
    v55 = v8;
    v56 = a5;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("smart_is_folder"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v10;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("is_hidden"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&buf + 1) = v11;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("contained_media_type"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (uint64_t)v12;
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("contained_media_type"), &unk_1E5BAC468, 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v13;
    v14 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    self = v14;
    v9 = v55;
    a5 = v56;

  }
  else
  {
    v18 = 0;
  }
LABEL_14:
  if (objc_msgSend(v9, "count") && v18)
  {
    v62[0] = v18;
    +[ML3PersistentIDsPredicate predicateWithPersistentIDs:shouldContain:](ML3PersistentIDsPredicate, "predicateWithPersistentIDs:shouldContain:", v9, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v32);
    v33 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v33;
  }
  if (a4)
  {
    if (a4 != 1)
    {
      v36 = 0;
LABEL_39:
      v49 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1AC149000, v49, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Finished searchable items creation", (uint8_t *)&buf, 2u);
      }

      v37 = 0;
      if (a5)
        goto LABEL_36;
      goto LABEL_37;
    }
    -[ML3DatabaseOperation library](self, "library");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity unrestrictedQueryWithLibrary:predicate:orderingTerms:](ML3Container, "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v34, v18, MEMORY[0x1E0C9AA60]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 0;
    -[ML3UpdateSpotlightIndexOperation _createSearchableItemsForPlaylistsWithQuery:error:](self, "_createSearchableItemsForPlaylistsWithQuery:error:", v35, &v60);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v60;
    if (!v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3UpdateSpotlightIndexOperation.m"), 566, CFSTR("_createSearchableItemsForPlaylistsWithQuery must return an array of CSSearchableItems."));

    }
    if (-[ML3UpdateSpotlightIndexOperation bundle](self, "bundle") == 1)
    {
      v38 = objc_msgSend(v36, "count");
      if (v38 != objc_msgSend(v9, "count") && !v37)
      {
        v39 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1AC149000, v39, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Some playlists might contain Music Shows & Movies items only, investigating...", (uint8_t *)&buf, 2u);
        }

        v40 = v9;
        -[ML3UpdateSpotlightIndexOperation _queryForPlaylistsContainingMusicShowsMissedByQuery:inContainerPIDs:](self, "_queryForPlaylistsContainingMusicShowsMissedByQuery:inContainerPIDs:", v35, v9);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0;
        -[ML3UpdateSpotlightIndexOperation _createSearchableItemsForPlaylistsWithQuery:error:](self, "_createSearchableItemsForPlaylistsWithQuery:error:", v41, &v59);
        v42 = self;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v59;
        if (!v43)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v42, CFSTR("ML3UpdateSpotlightIndexOperation.m"), 575, CFSTR("_createSearchableItemsForPlaylistsWithQuery must return an array of CSSearchableItems."));

        }
        if (objc_msgSend(v43, "count"))
        {
          v44 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v45 = objc_msgSend(v43, "count");
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v45;
            _os_log_impl(&dword_1AC149000, v44, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Found %ld playlists with Music Shows & Movies items only. Adding them to the searchable items array", (uint8_t *)&buf, 0xCu);
          }

          objc_msgSend(v36, "arrayByAddingObjectsFromArray:", v43);
          v46 = objc_claimAutoreleasedReturnValue();

          v36 = (void *)v46;
        }

        v9 = v40;
      }
    }
  }
  else
  {
    -[ML3DatabaseOperation library](self, "library");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity unrestrictedQueryWithLibrary:predicate:orderingTerms:](ML3Track, "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v47, v18, MEMORY[0x1E0C9AA60]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = 0;
    -[ML3UpdateSpotlightIndexOperation _createSearchableItemsForTracksWithQuery:error:](self, "_createSearchableItemsForTracksWithQuery:error:", v35, &v61);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v61;
  }

  if (!v37)
    goto LABEL_39;
  if (a5)
LABEL_36:
    *a5 = objc_retainAutorelease(v37);
LABEL_37:

  return v36;
}

- (id)_createSearchableItemsForTracksWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint8_t buf[16];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[22];

  v23[21] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20235;
  v21 = __Block_byref_object_dispose__20236;
  v22 = 0;
  v23[0] = CFSTR("media_type");
  v23[1] = CFSTR("item_extra.title");
  v23[2] = CFSTR("item_extra.copyright");
  v23[3] = CFSTR("date_added");
  v23[4] = CFSTR("item_extra.total_time_ms");
  v23[5] = CFSTR("(item.remote_location_id >= 50 AND item.remote_location_id < 300)");
  v23[6] = CFSTR("item_stats.user_rating");
  v23[7] = CFSTR("item_stats.play_count_user");
  v23[8] = CFSTR("item_video.movie_info");
  v23[9] = CFSTR("genre.genre");
  v23[10] = CFSTR("(item.base_location_id >= 250)");
  v23[11] = CFSTR("(item_extra.content_rating == 1)");
  v23[12] = CFSTR("composer.composer");
  v23[13] = CFSTR("album.album");
  v23[14] = CFSTR("item_artist.item_artist");
  v23[15] = CFSTR("track_number");
  v23[16] = CFSTR("item_store.subscription_store_item_id");
  v23[17] = CFSTR("item_store.store_item_id");
  v23[18] = CFSTR("item_extra.content_rating_level");
  v23[19] = CFSTR("item_extra.sort_title");
  v23[20] = CFSTR("item_stats.date_played");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Creating searchable items for tracks", buf, 2u);
  }

  v10 = (void *)MEMORY[0x1AF43CC0C]();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__ML3UpdateSpotlightIndexOperation__createSearchableItemsForTracksWithQuery_error___block_invoke;
  v13[3] = &unk_1E5B65910;
  v15 = &v17;
  v13[4] = self;
  v11 = v8;
  v14 = v11;
  objc_msgSend(v6, "enumeratePersistentIDsAndProperties:usingBlock:", v7, v13);

  objc_autoreleasePoolPop(v10);
  if (v18[5])
  {

    v11 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)_createSearchableItemsForPlaylistsWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint8_t buf[16];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20235;
  v21 = __Block_byref_object_dispose__20236;
  v22 = 0;
  v23[0] = CFSTR("name");
  v23[1] = CFSTR("description");
  v23[2] = CFSTR("play_count_user");
  v23[3] = CFSTR("date_created");
  v23[4] = CFSTR("date_played_local");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Creating searchable items for playlists", buf, 2u);
  }

  v10 = (void *)MEMORY[0x1AF43CC0C]();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__ML3UpdateSpotlightIndexOperation__createSearchableItemsForPlaylistsWithQuery_error___block_invoke;
  v13[3] = &unk_1E5B65910;
  v15 = &v17;
  v13[4] = self;
  v11 = v8;
  v14 = v11;
  objc_msgSend(v6, "enumeratePersistentIDsAndProperties:usingBlock:", v7, v13);

  objc_autoreleasePoolPop(v10);
  if (v18[5])
  {

    v11 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)_queryForPlaylistsContainingMusicShowsMissedByQuery:(id)a3 inContainerPIDs:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __104__ML3UpdateSpotlightIndexOperation__queryForPlaylistsContainingMusicShowsMissedByQuery_inContainerPIDs___block_invoke;
  v36[3] = &unk_1E5B65960;
  v7 = v6;
  v37 = v7;
  v28 = v5;
  objc_msgSend(v5, "enumeratePersistentIDsUsingBlock:", v36);
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("container_item.container_pid"), objc_msgSend(v12, "longLongValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v13;
        +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("media_type"), &unk_1E5BAC450, 10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = v14;
        +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item.is_music_show"), 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v39[2] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[ML3DatabaseOperation library](self, "library");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3Entity unrestrictedQueryWithLibrary:predicate:orderingTerms:](ML3Track, "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v18, v17, MEMORY[0x1E0C9AA60]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "hasEntities"))
          objc_msgSend(v29, "addObject:", v12);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v29, "count"))
  {
    +[ML3PersistentIDsPredicate predicateWithPersistentIDs:shouldContain:](ML3PersistentIDsPredicate, "predicateWithPersistentIDs:shouldContain:", v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v20;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("smart_is_folder"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v21;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("is_hidden"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[ML3DatabaseOperation library](self, "library");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity unrestrictedQueryWithLibrary:predicate:orderingTerms:](ML3Container, "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v25, v24, MEMORY[0x1E0C9AA60]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ML3UpdateSpotlightIndexOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v10, sel__verifyLibraryConnectionAndAttributesProperties_))return 0;
  -[ML3DatabaseOperation attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MLDatabaseOperationAttributeBundleIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _MLDUpdateSpotlightIndexBundleForBundleIdentifier(v6);
  v8 = v7 != 0;
  if (a3 && !v7)
  {
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 500, CFSTR("ML3UpdateSpotlightIndexOperation requires a bundleID attribute"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_storeStrong((id *)&self->_index, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (unint64_t)bundle
{
  return self->_bundle;
}

- (void)setBundle:(unint64_t)a3
{
  self->_bundle = a3;
}

- (unint64_t)batchCount
{
  return self->_batchCount;
}

- (void)setBatchCount:(unint64_t)a3
{
  self->_batchCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

void __104__ML3UpdateSpotlightIndexOperation__queryForPlaylistsContainingMusicShowsMissedByQuery_inContainerPIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

}

void __86__ML3UpdateSpotlightIndexOperation__createSearchableItemsForPlaylistsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *context;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v8 = MEMORY[0x1AF43CC0C]();
    v9 = *a3;
    v10 = a3[1];
    v11 = a3[2];
    v12 = a3[3];
    objc_msgSend(v12, "doubleValue");
    v37 = v12;
    if (fabs(v13) <= 0.00000011920929)
    {
      v15 = 0;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v22 = a3[4];
    objc_msgSend(v22, "doubleValue");
    context = (void *)v8;
    if (fabs(v23) <= 0.00000011920929)
    {
      v25 = 0;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v22, "doubleValue");
      objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = objc_alloc(MEMORY[0x1E0CA6B50]);
    v27 = (void *)objc_msgSend(v26, "initWithContentType:", *MEMORY[0x1E0CEC598]);
    objc_msgSend(v27, "setDisplayName:", v9);
    objc_msgSend(v27, "setTitle:", v9);
    objc_msgSend(v27, "setInformation:", v10);
    objc_msgSend(v27, "setPlayCount:", v11);
    objc_msgSend(v27, "setContentCreationDate:", v15);
    objc_msgSend(v27, "setLastUsedDate:", v25);
    objc_msgSend(*(id *)(a1 + 32), "library");
    v35 = v10;
    v36 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "libraryUID");
    v29 = (void *)v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity URLForEntityWithPersistentID:libraryUID:](ML3Container, "URLForEntityWithPersistentID:libraryUID:", a2, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "absoluteString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v32, 0, v27);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v33);

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("Failed to create CSSearchable playlist items from the library.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("MLDSpotlightIndexOperationErrorDomain"), 1003, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    *a5 = 1;
  }
}

void __83__ML3UpdateSpotlightIndexOperation__createSearchableItemsForTracksWithQuery_error___block_invoke(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  __int16 v9;
  __int16 v10;
  id *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id *v22;
  id v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  double v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint8_t buf[4];
  id v83;
  uint64_t v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v84 = *MEMORY[0x1E0CB2D50];
    v85[0] = CFSTR("Failed to create CSSearchable track items from the library.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("MLDSpotlightIndexOperationErrorDomain"), 1003, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    *a5 = 1;
    return;
  }
  v8 = (void *)MEMORY[0x1AF43CC0C]();
  v9 = objc_msgSend(*a3, "unsignedIntValue");
  v10 = v9;
  if ((v9 & 0x2E00) != 0)
  {
    v11 = (id *)MEMORY[0x1E0CEC640];
  }
  else
  {
    if ((v9 & 8) == 0)
    {
      v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Skipping library item with invalid media type", buf, 2u);
      }
      goto LABEL_49;
    }
    v11 = (id *)MEMORY[0x1E0CEC450];
  }
  objc_msgSend(*v11, "identifier");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = v19;
    if ((v10 & 0x400) != 0)
    {
      v22 = (id *)MEMORY[0x1E0CA5ED8];
    }
    else if ((v10 & 0x800) != 0)
    {
      v22 = (id *)MEMORY[0x1E0CA5ED0];
    }
    else if ((v10 & 0x2000) != 0)
    {
      v22 = (id *)MEMORY[0x1E0CA5EC8];
    }
    else if ((v10 & 0x200) != 0)
    {
      v22 = (id *)MEMORY[0x1E0CA5EE8];
    }
    else
    {
      if ((v10 & 8) == 0)
      {
        v21 = 0;
        goto LABEL_22;
      }
      v22 = (id *)MEMORY[0x1E0CA5EE0];
    }
    v21 = *v22;
LABEL_22:
    v78 = a3[1];
    v77 = a3[2];
    v23 = a3[3];
    objc_msgSend(v23, "doubleValue");
    v60 = v8;
    v58 = a1;
    if (fabs(v24) <= 0.00000011920929)
    {
      v76 = 0;
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v23, "doubleValue");
      objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3[4], "unsignedIntValue") / 0x3E8uLL);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = a3[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3[6], "unsignedIntValue") / 0x14uLL);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = a3[7];
    v26 = a3[8];
    v56 = v26;
    v57 = v23;
    if (!objc_msgSend(v26, "length"))
    {
      v69 = 0;
      v70 = 0;
      v71 = 0;
LABEL_35:
      v35 = a3[9];
      v36 = v35;
      if ((v10 & 8) != 0)
        v68 = v35;
      else
        v68 = 0;
      v67 = a3[10];
      v66 = a3[11];
      v65 = a3[12];
      v64 = a3[13];
      v63 = a3[14];
      v62 = a3[15];
      v37 = a3[16];
      if (!objc_msgSend(v37, "longLongValue"))
      {
        v38 = a3[17];

        v37 = v38;
      }
      v61 = a3[18];
      v39 = a3[19];
      v40 = a3[20];
      objc_msgSend(v40, "doubleValue");
      if (fabs(v41) <= 0.00000011920929)
      {
        v45 = 0;
      }
      else
      {
        v42 = v20;
        v43 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v40, "doubleValue");
        v44 = v43;
        v20 = v42;
        objc_msgSend(v44, "dateWithTimeIntervalSinceReferenceDate:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v59 = v20;
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", v20);
      objc_msgSend(v46, "setDisplayName:", v78);
      objc_msgSend(v46, "setTitle:", v78);
      objc_msgSend(v46, "setCopyright:", v77);
      objc_msgSend(v46, "setContentCreationDate:", v76);
      objc_msgSend(v46, "setDuration:", v75);
      if (v21)
      {
        v81 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setMediaTypes:", v47);

      }
      else
      {
        objc_msgSend(v46, "setMediaTypes:", MEMORY[0x1E0C9AA60]);
      }
      objc_msgSend(v46, "setStreamable:", v74);
      objc_msgSend(v46, "setRating:", v73);
      objc_msgSend(v46, "setPlayCount:", v72);
      objc_msgSend(v46, "setDirector:", v70);
      objc_msgSend(v46, "setProducer:", v69);
      v55 = v36;
      objc_msgSend(v46, "setGenre:", v36);
      objc_msgSend(v46, "setPerformers:", v71);
      objc_msgSend(v46, "setLocal:", v67);
      objc_msgSend(v46, "setContentRating:", v66);
      objc_msgSend(v46, "setComposer:", v65);
      objc_msgSend(v46, "setAlbum:", v64);
      objc_msgSend(v46, "setArtist:", v63);
      objc_msgSend(v46, "setAudioTrackNumber:", v62);
      objc_msgSend(v46, "setMusicalGenre:", v68);
      objc_msgSend(v37, "stringValue");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setAdamID:", v48);

      objc_msgSend(v46, "setExtendedContentRating:", v61);
      if (objc_msgSend(v39, "length"))
      {
        v80 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setAlternateNames:", v49);

      }
      objc_msgSend(v46, "setLastUsedDate:", v45);
      objc_msgSend(*(id *)(v58 + 32), "library");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "libraryUID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3Entity URLForEntityWithPersistentID:libraryUID:](ML3Track, "URLForEntityWithPersistentID:libraryUID:", a2, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "absoluteString");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v53, 0, v46);
      objc_msgSend(*(id *)(v58 + 40), "addObject:", v54);

      v18 = v59;
      v8 = v60;
LABEL_49:

      goto LABEL_50;
    }
    v27 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v26, "dataUsingEncoding:", 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    objc_msgSend(v27, "propertyListWithData:options:format:error:", v28, 0, 0, &v79);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v79;

    if (v30)
    {
      v31 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v83 = v30;
        _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to decode movie info plist with error: %{public}@", buf, 0xCu);
      }
      v70 = 0;
      v71 = 0;
      v69 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v70 = 0;
        v71 = 0;
        v69 = 0;
        goto LABEL_34;
      }
      objc_msgSend(v29, "valueForKeyPath:", CFSTR("cast.name"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "valueForKeyPath:", CFSTR("directors.name"));
      v31 = objc_claimAutoreleasedReturnValue();
      -[NSObject firstObject](v31, "firstObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "valueForKeyPath:", CFSTR("producers.name"));
      v32 = v21;
      v33 = v20;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v33;
      v21 = v32;
    }

LABEL_34:
    goto LABEL_35;
  }
LABEL_50:
  objc_autoreleasePoolPop(v8);
}

void __171__ML3UpdateSpotlightIndexOperation__batchIndexWithTrackPersistentIDsToUpdate_playlistsPersistentIDsToUpdateSet_entityStringsToDelete_currentRevision_targetRevision_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  double v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  int v18;
  double v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Failed to update client state", (uint8_t *)&v18, 2u);
    }

    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v5 - *(double *)(a1 + 72);
      v18 = 134217984;
      v19 = v9;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┗ FAILED Core Spotlight batch operation in %.3f seconds", (uint8_t *)&v18, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = v3;
    v12 = *(NSObject **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("revision"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("targetRevision"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("version"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = *(double *)&v13;
      v20 = 2114;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Client state updated with revision:%{public}@, target revision:%{public}@, version:%{public}@", (uint8_t *)&v18, 0x20u);

    }
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v5 - *(double *)(a1 + 72);
      v17 = *(void **)(a1 + 40);
      v18 = 134218240;
      v19 = v16;
      v20 = 2048;
      v21 = v17;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┗ Successfully finished Core Spotlight batch operation in %.3f seconds for operation %p", (uint8_t *)&v18, 0x16u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  __int128 v13;

  v3 = a2;
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_2;
  v9[3] = &unk_1E5B657F0;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v6;
  v13 = *(_OWORD *)(a1 + 40);
  v12 = v4;
  v7 = v4;
  v8 = v3;
  objc_msgSend(v5, "indexSearchableItems:completionHandler:", v8, v9);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  __int128 v13;

  v3 = a2;
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_2_35;
  v9[3] = &unk_1E5B657F0;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v6;
  v13 = *(_OWORD *)(a1 + 40);
  v12 = v4;
  v7 = v4;
  v8 = v3;
  objc_msgSend(v5, "indexSearchableItems:completionHandler:", v8, v9);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_2_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to index spotlight playlists", (uint8_t *)&v10, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = v3;
    v4 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Updated %lu playlists in spotlight index with bundle ID:%{public}@", (uint8_t *)&v10, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to index spotlight track items", (uint8_t *)&v10, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = v3;
    v4 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Updated %lu track items in spotlight index with bundle ID:%@", (uint8_t *)&v10, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __81__ML3UpdateSpotlightIndexOperation__deleteIndexedItemsWithEntityStringIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to delete spotlight items", (uint8_t *)&v9, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = v3;
    v4 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = 134217984;
    v10 = v8;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Successfully deleted %lu spotlight index items", (uint8_t *)&v9, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __68__ML3UpdateSpotlightIndexOperation__deleteAllIndexedItemsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Failed to delete spotlight items", (uint8_t *)&v9, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = v3;
    v4 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Delete all called in spotlight index for bundle ID %{public}@ called", (uint8_t *)&v9, 0xCu);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __93__ML3UpdateSpotlightIndexOperation__indexItemsFromLibrarySinceRevision_targetRevision_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unint64_t a6, _BYTE *a7)
{
  void *v11;
  __objc2_class *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *context;
  uint8_t buf[16];
  id obj;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  if (a6 > 1)
    goto LABEL_26;
  if (!a5)
  {
    if (a6)
      v13 = *(_QWORD *)(a1 + 48);
    else
      v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(*(_QWORD *)(v13 + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 88) < a3)
  {
    v11 = *(void **)(a1 + 32);
    if (a6)
      v12 = ML3Container;
    else
      v12 = ML3Track;
    objc_msgSend(v11, "library");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "libraryUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class URLForEntityWithPersistentID:libraryUID:](v12, "URLForEntityWithPersistentID:libraryUID:", a2, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_14;
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
LABEL_13:
    objc_msgSend(v16, "addObject:", v15);
LABEL_14:

  }
  v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  v21 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") + v20;
  if ((unint64_t)(v21 + objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count")) >= 0x320)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
    {
      v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] **The operation was cancelled. Stopping searchable item creation**", buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      v40[0] = CFSTR("The operation was cancelled while batching searchable item creation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("MLDSpotlightIndexOperationErrorDomain"), 1004, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
    else
    {
      context = (void *)MEMORY[0x1AF43CC0C]();
      if (*(_QWORD *)(a1 + 88) <= a3)
        v28 = 0;
      else
        v28 = *(_QWORD *)(a1 + 88);
      v29 = *(void **)(a1 + 32);
      v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      obj = *(id *)(v35 + 40);
      LOBYTE(v29) = objc_msgSend(v29, "_batchIndexWithTrackPersistentIDsToUpdate:playlistsPersistentIDsToUpdateSet:entityStringsToDelete:currentRevision:targetRevision:error:", v30, v31, v32, v33, v34, &obj);
      objc_storeStrong((id *)(v35 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (_BYTE)v29;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeAllObjects");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAllObjects");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeAllObjects");
      objc_autoreleasePoolPop(context);
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    *a7 = 1;
LABEL_26:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a3;
}

void __45__ML3UpdateSpotlightIndexOperation__execute___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed client state fetch failed, failing the operation.", v10, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v9 = a1 + 56;
  }
  else
  {
    v9 = a1 + 40;
    a3 = a2;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
