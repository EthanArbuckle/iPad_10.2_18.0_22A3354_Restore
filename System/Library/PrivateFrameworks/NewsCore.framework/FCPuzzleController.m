@implementation FCPuzzleController

uint64_t __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchPuzzlesForPuzzleIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  id v34;
  void *v35;
  NSObject *v36;
  _QWORD block[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[6];
  uint8_t v48[128];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleIDs != nil");
    *(_DWORD *)buf = 136315906;
    v50 = "-[FCPuzzleController _fetchPuzzlesForPuzzleIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
    v51 = 2080;
    v52 = "FCPuzzleController.m";
    v53 = 1024;
    v54 = 226;
    v55 = 2114;
    v56 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v14)
    {
LABEL_4:
      if (v15)
      {
        if (objc_msgSend(v12, "count"))
        {
          v35 = v15;
          v36 = v14;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v12);
            v18 = v17;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v34 = v12;
            v18 = v12;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
            if (v19)
            {
              v20 = v19;
              v33 = a5;
              v21 = *(_QWORD *)v44;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v44 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
                  -[FCPuzzleController fastCache](self, "fastCache");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "objectForKey:", v23);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v25)
                    objc_msgSend(v16, "setObject:forKey:", v25, v23);
                  else
                    objc_msgSend(v17, "addObject:", v23);

                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
              }
              while (v20);
              v13 = 0;
              v12 = v34;
              a5 = v33;
            }
          }

          v14 = v36;
          if (objc_msgSend(v17, "count"))
          {
            -[FCPuzzleController _fetchOperationForPuzzleWithIDs:](self, "_fetchOperationForPuzzleWithIDs:", v17);
            v26 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setQualityOfService:", a5);
            v15 = v35;
            if (a5 == 9)
              v27 = -1;
            else
              v27 = a5 == 33 || a5 == 25;
            objc_msgSend(v26, "setRelativePriority:", v27);
            objc_msgSend(v26, "setCachePolicy:", objc_msgSend(v13, "cachePolicy"));
            objc_msgSend(v13, "maximumCachedAge");
            objc_msgSend(v26, "setMaximumCachedAge:");
            objc_msgSend(v26, "setFetchCompletionQueue:", v36);
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_4;
            v40[3] = &unk_1E463B768;
            v41 = v16;
            v42 = v35;
            v28 = v16;
            objc_msgSend(v26, "setFetchCompletionBlock:", v40);
            objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addOperation:", v26);

          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_6;
            block[3] = &unk_1E463B2D0;
            v15 = v35;
            v38 = v16;
            v39 = v35;
            v26 = v16;
            dispatch_async(v36, block);

            v28 = v39;
          }

        }
        else
        {
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
          v47[3] = &unk_1E463B2D0;
          v47[4] = v14;
          v47[5] = v15;
          __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2((uint64_t)v47);
        }
        goto LABEL_36;
      }
      goto LABEL_34;
    }
  }
  else if (v14)
  {
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "callbackQueue != nil");
    *(_DWORD *)buf = 136315906;
    v50 = "-[FCPuzzleController _fetchPuzzlesForPuzzleIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
    v51 = 2080;
    v52 = "FCPuzzleController.m";
    v53 = 1024;
    v54 = 227;
    v55 = 2114;
    v56 = v31;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v15)
  {
LABEL_34:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
      *(_DWORD *)buf = 136315906;
      v50 = "-[FCPuzzleController _fetchPuzzlesForPuzzleIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
      v51 = 2080;
      v52 = "FCPuzzleController.m";
      v53 = 1024;
      v54 = 228;
      v55 = 2114;
      v56 = v32;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
LABEL_36:

}

void __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E463B598;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

- (FCPuzzleController)initWithContentDatabase:(id)a3 assetManager:(id)a4 puzzleTypeController:(id)a5 puzzleRecordSource:(id)a6 configurationManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FCPuzzleController *v17;
  FCPuzzleController *v18;
  NSCache *v19;
  NSCache *fastCache;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetManager != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPuzzleController initWithContentDatabase:assetManager:puzzleTypeController:puzzleRecordSource:configurationManager:]";
    v27 = 2080;
    v28 = "FCPuzzleController.m";
    v29 = 1024;
    v30 = 54;
    v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleRecordSource != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPuzzleController initWithContentDatabase:assetManager:puzzleTypeController:puzzleRecordSource:configurationManager:]";
    v27 = 2080;
    v28 = "FCPuzzleController.m";
    v29 = 1024;
    v30 = 55;
    v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)FCPuzzleController;
  v17 = -[FCPuzzleController init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetManager, a4);
    objc_storeStrong((id *)&v18->_puzzleRecordSource, a6);
    objc_storeStrong((id *)&v18->_puzzleTypeController, a5);
    v19 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    fastCache = v18->_fastCache;
    v18->_fastCache = v19;

    objc_storeStrong((id *)&v18->_configurationManager, a7);
    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v18->_fastCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
  }

  return v18;
}

- (FCPuzzleController)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPuzzleController init]";
    v9 = 2080;
    v10 = "FCPuzzleController.m";
    v11 = 1024;
    v12 = 45;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCPuzzleController init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)createPuzzleForPuzzleType:(id)a3 identifier:(id)a4 title:(id)a5 subtitle:(id)a6 puzzleDescription:(id)a7 dataResourceID:(id)a8 authors:(id)a9 behaviorFlags:(int64_t)a10 publishDate:(id)a11 isPaid:(BOOL)a12 difficulty:(int64_t)a13 difficultyDescription:(id)a14 thumbnailLargeURL:(id)a15 loadDate:(id)a16 teaserClue:(id)a17 teaserAnswer:(id)a18 teaserInfo:(id)a19 teaserDirection:(id)a20 teaserNumber:(id)a21 language:(id)a22 blockedStorefrontIDs:(id)a23 allowedStorefrontIDs:(id)a24 minimumNewsVersion:(id)a25 isDeprecated:(BOOL)a26 isDraft:(BOOL)a27 lastModifiedDate:(id)a28
{
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  FCPuzzle *v51;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  id v74;

  v74 = a3;
  v34 = a4;
  v57 = a5;
  v72 = a6;
  v71 = a7;
  v35 = a8;
  v70 = a9;
  v36 = a11;
  v56 = a14;
  v37 = a15;
  v69 = a16;
  v68 = a17;
  v67 = a18;
  v66 = a19;
  v65 = a20;
  v64 = a21;
  v63 = a22;
  v62 = a23;
  v61 = a24;
  v60 = a25;
  v38 = a28;
  v73 = v34;
  -[FCPuzzleController fastCachedPuzzleForID:](self, "fastCachedPuzzleForID:", v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  v58 = v37;
  v59 = v36;
  if (v39
    && (objc_msgSend(v39, "lastModifiedDate"), v41 = (void *)objc_claimAutoreleasedReturnValue(), v41, v38)
    && v41
    && (objc_msgSend(v40, "lastModifiedDate"),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        v43 = objc_msgSend(v38, "fc_isLaterThan:withPrecision:", v42, 2),
        v42,
        (v43 & 1) == 0))
  {
    v49 = v56;
    v51 = v40;
    v50 = v57;
  }
  else
  {
    objc_msgSend(v74, "thumbnailDirectory");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "smallThumbnailForDate:", v36);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCPuzzleController assetManager](self, "assetManager");
    v46 = v36;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "assetHandleForCKAssetURLString:lifetimeHint:", v37, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    BYTE3(v55) = a27;
    BYTE2(v55) = a26;
    BYTE1(v55) = (a10 & 2) != 0;
    LOBYTE(v55) = a10 & 1;
    v49 = v56;
    LOBYTE(v54) = a12;
    v53 = v46;
    v50 = v57;
    v51 = -[FCPuzzle initWithIdentifier:title:subtitle:puzzleDescription:puzzleType:dataResourceID:authors:publishDate:isPaid:difficulty:difficultyDescription:thumbnailSmallImageAssetHandle:thumbnailLargeImageAssetHandle:loadDate:teaserClue:teaserAnswer:teaserInfo:teaserDirection:teaserNumber:language:blockedStorefrontIDs:allowedStorefrontIDs:minimumNewsVersion:showInfoModalOnFirstPlay:ignoreFromStatsAndStreaks:isDeprecated:isDraft:lastModifiedDate:]([FCPuzzle alloc], "initWithIdentifier:title:subtitle:puzzleDescription:puzzleType:dataResourceID:authors:publishDate:isPaid:difficulty:difficultyDescription:thumbnailSmallImageAssetHandle:thumbnailLargeImageAssetHandle:loadDate:teaserClue:teaserAnswer:teaserInfo:teaserDirection:teaserNumber:language:blockedStorefrontIDs:allowedStorefrontIDs:minimumNewsVersion:showInfoModalOnFirstPlay:ignoreFromStatsAndStreaks:isDeprecated:isDraft:lastModifiedDate:", v73, v57, v72, v71, v74, v35, v70, v53, v54, a13, v56, v45, v48, v69,
            v68,
            v67,
            v66,
            v65,
            v64,
            v63,
            v62,
            v61,
            +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v60), v55, v38);
    if (v51)
      -[FCPuzzleController savePuzzleToCache:](self, "savePuzzleToCache:", v51);

  }
  return v51;
}

- (id)fastCachedPuzzleForID:(id)a3
{
  return -[FCPuzzleController _cachedPuzzleForPuzzleID:fastCacheOnly:](self, "_cachedPuzzleForPuzzleID:fastCacheOnly:", a3, 1);
}

- (id)slowCachedPuzzleForID:(id)a3
{
  return -[FCPuzzleController _cachedPuzzleForPuzzleID:fastCacheOnly:](self, "_cachedPuzzleForPuzzleID:fastCacheOnly:", a3, 0);
}

- (void)savePuzzleToCache:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCPuzzleController fastCache](self, "fastCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (void)_fetchPuzzleForPuzzleID:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    v23 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __107__FCPuzzleController__fetchPuzzleForPuzzleID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke;
    v21[3] = &unk_1E463B570;
    v17 = &v22;
    v22 = v15;
    -[FCPuzzleController _fetchPuzzlesForPuzzleIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:](self, "_fetchPuzzlesForPuzzleIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:", v16, v13, a5, v14, v21);

LABEL_6:
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPuzzleController _fetchPuzzleForPuzzleID:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
    v26 = 2080;
    v27 = "FCPuzzleController.m";
    v28 = 1024;
    v29 = 202;
    v30 = 2114;
    v31 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v15)
      goto LABEL_7;
    goto LABEL_5;
  }
  if (v15)
  {
LABEL_5:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__FCPuzzleController__fetchPuzzleForPuzzleID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1E463B598;
    v17 = &v20;
    v20 = v15;
    dispatch_async(v14, block);
    goto LABEL_6;
  }
LABEL_7:

}

void __107__FCPuzzleController__fetchPuzzleForPuzzleID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "allValues");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v6, v5);

  }
}

uint64_t __107__FCPuzzleController__fetchPuzzleForPuzzleID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!objc_msgSend(v8, "status"))
  {
    objc_msgSend(v8, "fetchedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_23_0);
  v6 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(v6 + 8);
  if (objc_msgSend(v4, "count"))
  {
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    objc_msgSend(v8, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v7);

  }
}

uint64_t __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "puzzleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:", v3) ^ 1;

  return v4;
}

uint64_t __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)_cachedPuzzleForPuzzleID:(id)a3 fastCacheOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPuzzleController _cachedPuzzlesForPuzzleIDs:fastCacheOnly:](self, "_cachedPuzzlesForPuzzleIDs:fastCacheOnly:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleID != nil");
      *(_DWORD *)buf = 136315906;
      v16 = "-[FCPuzzleController _cachedPuzzleForPuzzleID:fastCacheOnly:]";
      v17 = 2080;
      v18 = "FCPuzzleController.m";
      v19 = 1024;
      v20 = 299;
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v11 = 0;
  }

  return v11;
}

- (id)_cachedPuzzlesForPuzzleIDs:(id)a3 fastCacheOnly:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  _QWORD v27[5];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleIDs != nil");
    *(_DWORD *)buf = 136315906;
    v36 = "-[FCPuzzleController _cachedPuzzlesForPuzzleIDs:fastCacheOnly:]";
    v37 = 2080;
    v38 = "FCPuzzleController.m";
    v39 = 1024;
    v40 = 306;
    v41 = 2114;
    v42 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[FCPuzzleController fastCache](self, "fastCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v6, "setObject:forKey:", v15, v13);
        else
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count") && !a4)
  {
    -[FCPuzzleController configurationManager](self, "configurationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "puzzlesConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "difficultyDescriptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPuzzleController puzzleRecordSource](self, "puzzleRecordSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cachedRecordsWithIDs:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __63__FCPuzzleController__cachedPuzzlesForPuzzleIDs_fastCacheOnly___block_invoke;
    v27[3] = &unk_1E463F8D0;
    v27[4] = self;
    v28 = v19;
    v29 = v6;
    v22 = v19;
    objc_msgSend(v21, "enumerateRecordsAndInterestTokensWithBlock:", v27);

  }
  objc_msgSend(v6, "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_28_0);
  objc_msgSend(v6, "allValues");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleController _refreshPuzzlesBasedOnAgeForPuzzles:](self, "_refreshPuzzlesBasedOnAgeForPuzzles:", v23);

  return v6;
}

void __63__FCPuzzleController__cachedPuzzlesForPuzzleIDs_fastCacheOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  FCPuzzle *v9;
  void *v10;
  FCPuzzle *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v14, "puzzleTypeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedPuzzleTypeForID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [FCPuzzle alloc];
    objc_msgSend(*(id *)(a1 + 32), "assetManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCPuzzle initWithPuzzleRecord:puzzleType:assetManager:interestToken:difficultyDescriptions:](v9, "initWithPuzzleRecord:puzzleType:assetManager:interestToken:difficultyDescriptions:", v14, v8, v10, v5, *(_QWORD *)(a1 + 40));

    v12 = *(void **)(a1 + 48);
    -[FCPuzzle identifier](v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

  }
}

uint64_t __63__FCPuzzleController__cachedPuzzlesForPuzzleIDs_fastCacheOnly___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "puzzleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:", v3) ^ 1;

  return v4;
}

- (void)_refreshPuzzlesBasedOnAgeForPuzzles:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  FCPuzzleController *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = self;
  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "loadDate", v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dateByAddingTimeInterval:", 3600.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "fc_isEarlierThan:", v12);

        if (v13)
        {
          objc_msgSend(v9, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[FCPuzzleController _fetchOperationForPuzzleWithIDs:](v16, "_fetchOperationForPuzzleWithIDs:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setQualityOfService:", 17);
    objc_msgSend(v15, "setRelativePriority:", -1);
    objc_msgSend(v15, "setCachePolicy:", 1);
    objc_msgSend(v15, "start");

  }
}

- (void)_savePuzzlesToCache:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__FCPuzzleController__savePuzzlesToCache___block_invoke;
  v3[3] = &unk_1E463F8F8;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __42__FCPuzzleController__savePuzzlesToCache___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "savePuzzleToCache:", a2);
}

- (id)jsonEncodableObject
{
  void *v2;
  void *v3;

  -[FCPuzzleController puzzleRecordSource](self, "puzzleRecordSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonEncodableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_fetchOperationForPuzzleWithIDs:(id)a3
{
  id v4;
  FCPuzzleFetchOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FCPuzzleFetchOperation *v10;

  v4 = a3;
  v5 = [FCPuzzleFetchOperation alloc];
  -[FCPuzzleController puzzleTypeController](self, "puzzleTypeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleController puzzleRecordSource](self, "puzzleRecordSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleController assetManager](self, "assetManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleController configurationManager](self, "configurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCPuzzleFetchOperation initWithPuzzleIDs:puzzleTypeController:puzzleRecordSource:assetManager:configurationManager:delegate:](v5, "initWithPuzzleIDs:puzzleTypeController:puzzleRecordSource:assetManager:configurationManager:delegate:", v4, v6, v7, v8, v9, self);

  return v10;
}

- (void)puzzleFetchOperation:(id)a3 didFetchPuzzles:(id)a4
{
  -[FCPuzzleController _savePuzzlesToCache:](self, "_savePuzzlesToCache:", a4);
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (FCPuzzleRecordSource)puzzleRecordSource
{
  return self->_puzzleRecordSource;
}

- (void)setPuzzleRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleRecordSource, a3);
}

- (FCPuzzleTypeController)puzzleTypeController
{
  return self->_puzzleTypeController;
}

- (void)setPuzzleTypeController:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleTypeController, a3);
}

- (NSCache)fastCache
{
  return self->_fastCache;
}

- (void)setFastCache:(id)a3
{
  objc_storeStrong((id *)&self->_fastCache, a3);
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_fastCache, 0);
  objc_storeStrong((id *)&self->_puzzleTypeController, 0);
  objc_storeStrong((id *)&self->_puzzleRecordSource, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end
