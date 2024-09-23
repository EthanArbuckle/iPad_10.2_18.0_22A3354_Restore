@implementation FCRecordsFetchOperation

void __43__FCRecordsFetchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  __objc2_class **v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  _QWORD *v12;
  void *v13;
  __objc2_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v26;
    v6 = off_1E4634000;
    *(_QWORD *)&v3 = 138543874;
    v23 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 416);
        if (v9)
          v10 = *(void **)(v9 + 104);
        else
          v10 = 0;
        v11 = objc_msgSend(v10, "cacheContainsKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7), v23);
        v12 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 416);
        if (v11)
        {
          if (v12)
            v12 = (_QWORD *)v12[12];
          objc_msgSend(v12, "objectForKey:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v6[168];
          -[FCFaultableRecord record]((uint64_t)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__objc2_class resultWithStatus:fetchedObject:error:](v14, "resultWithStatus:fetchedObject:error:", 0, v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[FCRecordSource _fetchErrorForKey:](v12, v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[__objc2_class resultWithStatus:fetchedObject:error:](v6[168], "resultWithStatus:fetchedObject:error:", 3, 0, v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)FCRecordSourceLog;
          if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
          {
            v18 = v5;
            v19 = *(void **)(a1 + 40);
            v20 = v17;
            objc_msgSend(v19, "operationID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v23;
            v30 = v21;
            v31 = 2114;
            v32 = v8;
            v33 = 2114;
            v34 = v13;
            _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_INFO, "operation with ID %{public}@ failed to fetch record %{public}@ with error %{public}@", buf, 0x20u);

            v5 = v18;
            v6 = off_1E4634000;

          }
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setMissingObjectDescriptions:", v15);
        }

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
        ++v7;
      }
      while (v4 != v7);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      v4 = v22;
    }
    while (v22);
  }

}

void __43__FCRecordsFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 440), *(id *)(a1 + 40));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 424);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0x1ED0E5000uLL;
    v7 = *(_QWORD *)v29;
    *(_QWORD *)&v4 = 136315906;
    v27 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v8);
        v10 = *(int *)(v6 + 2928);
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v10);
        if (v11)
          v12 = *(void **)(v11 + 104);
        else
          v12 = 0;
        if (objc_msgSend(v12, "cacheContainsKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v8), v27, (_QWORD)v28))
        {
          if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v9))
          {
            v13 = *(void **)(a1 + 56);
LABEL_21:
            objc_msgSend(v13, "addObject:", v9);
            goto LABEL_37;
          }
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v10);
          if (v16)
            v17 = *(void **)(v16 + 96);
          else
            v17 = 0;
          objc_msgSend(v17, "objectForKey:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCFaultableRecord recordBase]((uint64_t)v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          switch(*(_QWORD *)(a1 + 80))
          {
            case 0:
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("record sources must always specify a concrete default cache policy"));
                *(_DWORD *)buf = v27;
                v33 = "-[FCRecordsFetchOperation performOperation]_block_invoke";
                v34 = 2080;
                v35 = "FCRecordSource.m";
                v36 = 1024;
                v37 = 1431;
                v38 = 2114;
                v39 = v25;
                _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

              }
              goto LABEL_26;
            case 1:
              goto LABEL_23;
            case 2:
            case 3:
              if (-[NTPBRecordBase hasExpiredAssetURLs](v18)
                || *(double *)(a1 + 88) != 0.0 && objc_msgSend(v19, "fc_isCachedAgeGreaterThan:"))
              {
                +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 2, 0, 0);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setMissingObjectDescriptions:", v20);
              }
              else
              {
                -[FCFaultableRecord record]((uint64_t)v15);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 0, v20, 0);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_34;
            case 4:
            case 5:
              if (-[NTPBRecordBase needsAssetURLRefresh](v18))
              {
LABEL_23:
                objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
LABEL_26:
                v14 = 0;
              }
              else
              {
                objc_msgSend(v19, "fetchDate");
                v21 = objc_claimAutoreleasedReturnValue();
                if (v21
                  && (v22 = (void *)v21,
                      v23 = objc_msgSend(v19, "fc_isCachedAgeLessThan:", *(double *)(a1 + 88)),
                      v22,
                      !v23))
                {
                  objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
                  v14 = 0;
                }
                else
                {
                  -[FCFaultableRecord record]((uint64_t)v15);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 0, v24, 0);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                }
                v6 = 0x1ED0E5000;
              }
LABEL_34:

              break;
            default:
              goto LABEL_26;
          }
        }
        else
        {
          if (*(_QWORD *)(a1 + 80) != 3)
          {
            v13 = *(void **)(a1 + 64);
            goto LABEL_21;
          }
          +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 2, 0, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setMissingObjectDescriptions:", v15);
        }

        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 72), "addObject:", v14);

        }
LABEL_37:
        ++v8;
      }
      while (v5 != v8);
      v26 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      v5 = v26;
    }
    while (v26);
  }

}

- (void)operationWillFinishWithError:(id)a3
{
  NSDictionary *holdTokens;
  FCInterestToken *fetchToken;
  FCInterestToken *refreshToken;

  holdTokens = self->_holdTokens;
  self->_holdTokens = 0;

  fetchToken = self->_fetchToken;
  self->_fetchToken = 0;

  refreshToken = self->_refreshToken;
  self->_refreshToken = 0;

}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "fetchedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v16, "fetchedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)a1[4];
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v4, v7);

  }
  if ((unint64_t)objc_msgSend(v16, "status") < *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v16, "status");
  if (objc_msgSend(v16, "status") == 3)
  {
    objc_msgSend(v16, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v16;
    if (!v8)
      goto LABEL_10;
    objc_msgSend(v16, "error");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }
  else
  {
    v13 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;
  }

  v9 = v16;
LABEL_10:
  if (objc_msgSend(v9, "status"))
  {
    v14 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(v16, "missingObjectDescriptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fc_safelyUnionSet:", v15);

  }
}

- (void)performOperation
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  FCRecordSource *recordSource;
  NSArray *recordIdentifiers;
  FCRecordSource *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  FCRecordSource *v18;
  FCCacheCoordinator *cacheCoordinator;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  FCRecordSourceFetchContext *v25;
  FCRecordSourceFetchContext *v26;
  FCRecordSource *v27;
  FCRecordSource *v28;
  FCInterestToken *v29;
  FCInterestToken *fetchToken;
  id v31;
  void *v32;
  FCRecordSourceFetchContext *v33;
  FCRecordSourceFetchContext *v34;
  FCRecordSource *v35;
  FCRecordSource *v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  FCInterestToken *v40;
  FCInterestToken *refreshToken;
  id *v42;
  id *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  FCRecordSource *v49;
  uint64_t v50;
  int64_t v51;
  uint64_t v52;
  id v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  FCHeldRecords *v60;
  id v61;
  _QWORD block[4];
  id v63;
  id v64;
  id v65;
  id v66;
  FCRecordsFetchOperation *v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  _QWORD v71[5];
  id v72;
  id v73;
  id v74;
  NSObject *v75;
  uint64_t v76;
  _QWORD aBlock[5];
  id v78;
  id v79;
  NSObject *v80;
  _QWORD v81[5];
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  double v88;

  if (-[NSArray count](self->_recordIdentifiers, "count"))
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self->_recordSource);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    FCDispatchQueueForQualityOfService(-[FCRecordsFetchOperation qualityOfService](self, "qualityOfService"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    recordSource = self->_recordSource;
    if (recordSource)
      recordSource = (FCRecordSource *)recordSource->_cacheCoordinator;
    recordIdentifiers = self->_recordIdentifiers;
    v9 = recordSource;
    -[FCRecordSource holdTokensForKeys:](v9, "holdTokensForKeys:", recordIdentifiers);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[FCFetchOperation cachePolicy](self, "cachePolicy"))
    {
      v11 = -[FCFetchOperation cachePolicy](self, "cachePolicy");
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultCachePolicy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "cachePolicy");

    }
    if (-[FCFetchOperation cachePolicy](self, "cachePolicy"))
    {
      -[FCFetchOperation maximumCachedAge](self, "maximumCachedAge");
      v14 = v13;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultCachePolicy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "maximumCachedAge");
      v14 = v16;

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_ignoreCacheForRecordIDs);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_recordSource;
    if (v18)
      cacheCoordinator = v18->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke;
    v81[3] = &unk_1E463C8F0;
    v81[4] = self;
    v53 = v10;
    v82 = v53;
    v55 = v17;
    v83 = v55;
    v61 = v6;
    v84 = v61;
    v87 = v11;
    v88 = v14;
    v20 = v5;
    v85 = v20;
    v21 = v4;
    v86 = v21;
    -[FCCacheCoordinator performCacheRead:](cacheCoordinator, "performCacheRead:", v81);
    v22 = dispatch_group_create();
    v56 = v20;
    v54 = v3;
    if (objc_msgSend(v20, "count"))
    {
      dispatch_group_enter(v22);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_280;
      aBlock[3] = &unk_1E463C918;
      aBlock[4] = self;
      v23 = v20;
      v78 = v23;
      v79 = v58;
      v80 = v22;
      v24 = _Block_copy(aBlock);
      v25 = objc_alloc_init(FCRecordSourceFetchContext);
      v26 = v25;
      if (v25)
        v25->_refresh = 0;
      v27 = self->_recordSource;
      if (v27)
        v27 = (FCRecordSource *)v27->_fetchCoordinator;
      v28 = v27;
      -[FCRecordSource fetchKeys:context:qualityOfService:relativePriority:completionQueue:completion:](v28, "fetchKeys:context:qualityOfService:relativePriority:completionQueue:completion:", v23, v26, -[FCRecordsFetchOperation qualityOfService](self, "qualityOfService"), -[FCOperation relativePriority](self, "relativePriority"), v54, v24);
      v29 = (FCInterestToken *)objc_claimAutoreleasedReturnValue();
      fetchToken = self->_fetchToken;
      self->_fetchToken = v29;

      v3 = v54;
    }
    if (objc_msgSend(v61, "count"))
    {
      dispatch_group_enter(v22);
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_281;
      v71[3] = &unk_1E463C968;
      v71[4] = self;
      v31 = v61;
      v72 = v31;
      v76 = v11;
      v73 = v59;
      v74 = v57;
      v75 = v22;
      v32 = _Block_copy(v71);
      v33 = objc_alloc_init(FCRecordSourceFetchContext);
      v34 = v33;
      if (v33)
      {
        v33->_refresh = 1;
        v33->_cachePolicy = v11;
        v33->_maxCachedAge = v14;
      }
      if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1 || objc_msgSend(v55, "count"))
      {
        v35 = self->_recordSource;
        if (v35)
          v35 = (FCRecordSource *)v35->_fetchCoordinator;
        v36 = v35;
        v37 = -[FCRecordsFetchOperation qualityOfService](self, "qualityOfService");
        v38 = -[FCOperation relativePriority](self, "relativePriority");
        v39 = v37;
        v3 = v54;
        -[FCRecordSource fetchKeysUnconditionally:context:qualityOfService:relativePriority:completionQueue:completion:](v36, "fetchKeysUnconditionally:context:qualityOfService:relativePriority:completionQueue:completion:", v31, v34, v39, v38, v54, v32);
        v40 = (FCInterestToken *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = self->_recordSource;
        if (v49)
          v49 = (FCRecordSource *)v49->_fetchCoordinator;
        v36 = v49;
        v50 = -[FCRecordsFetchOperation qualityOfService](self, "qualityOfService");
        v51 = -[FCOperation relativePriority](self, "relativePriority");
        v52 = v50;
        v3 = v54;
        -[FCRecordSource fetchKeys:context:qualityOfService:relativePriority:completionQueue:completion:](v36, "fetchKeys:context:qualityOfService:relativePriority:completionQueue:completion:", v31, v34, v52, v51, v54, v32);
        v40 = (FCInterestToken *)objc_claimAutoreleasedReturnValue();
      }
      refreshToken = self->_refreshToken;
      self->_refreshToken = v40;

    }
    if (FCDispatchGroupIsEmpty(v22))
    {
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_285;
      v68[3] = &unk_1E463C840;
      v42 = &v69;
      v69 = v21;
      v43 = (id *)v70;
      v44 = v58;
      v70[0] = v58;
      v45 = v57;
      v46 = v57;
      v47 = v21;
      v48 = v53;
      v70[1] = v46;
      v70[2] = v53;
      v70[3] = self;
      __43__FCRecordsFetchOperation_performOperation__block_invoke_285((uint64_t)v68);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_3;
      block[3] = &unk_1E463C840;
      v42 = &v63;
      v63 = v21;
      v43 = &v64;
      v44 = v58;
      v64 = v58;
      v45 = v57;
      v65 = v57;
      v47 = v21;
      v48 = v53;
      v66 = v53;
      v67 = self;
      dispatch_group_notify(v22, v3, block);

      v46 = v65;
    }

  }
  else
  {
    v60 = objc_alloc_init(FCHeldRecords);
    -[FCFetchOperation finishExecutingWithFetchedObject:](self, "finishExecutingWithFetchedObject:", v60);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_fetchToken, 0);
  objc_storeStrong((id *)&self->_holdTokens, 0);
  objc_storeStrong((id *)&self->_ignoreCacheForRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordSource, 0);
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  FCHeldRecords *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__FCRecordsFetchOperation_performOperation__block_invoke_4;
  v11 = &unk_1E463C990;
  v3 = v2;
  v12 = v3;
  v13 = &v28;
  v14 = &v22;
  v15 = &v16;
  v4 = _Block_copy(&v8);
  objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", v4, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 40), "enumerateObjectsUsingBlock:", v4);
  objc_msgSend(*(id *)(a1 + 48), "enumerateObjectsUsingBlock:", v4);
  v5 = v29[3];
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[FCHeldRecords initWithRecordsByID:interestTokensByID:]([FCHeldRecords alloc], "initWithRecordsByID:interestTokensByID:", v3, *(_QWORD *)(a1 + 56));
    v5 = v29[3];
  }
  +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", v5, v6, v23[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMissingObjectDescriptions:", v17[5]);
  objc_msgSend(*(id *)(a1 + 64), "finishExecutingWithResult:", v7);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_280(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416);
  if (v2)
    v3 = *(void **)(v2 + 104);
  else
    v3 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_2;
  v6[3] = &unk_1E463B228;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "performCacheRead:", v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_281(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416);
  if (v2)
    v3 = *(void **)(v2 + 104);
  else
    v3 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_2_282;
  v6[3] = &unk_1E463C940;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v11 = *(_QWORD *)(a1 + 72);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "performCacheRead:", v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_2_282(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v2)
  {
    v4 = v2;
    v25 = *(_QWORD *)v27;
    *(_QWORD *)&v3 = 136315906;
    v23 = v3;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v5);
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 416);
        if (v7)
          v8 = *(void **)(v7 + 96);
        else
          v8 = 0;
        objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v5), v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFaultableRecord recordBase]((uint64_t)v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
        {
          v12 = 1;
          switch(*(_QWORD *)(a1 + 64))
          {
            case 0:
            case 3:
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't get here"));
                *(_DWORD *)buf = v23;
                v31 = "-[FCRecordsFetchOperation performOperation]_block_invoke_2";
                v32 = 2080;
                v33 = "FCRecordSource.m";
                v34 = 1024;
                v35 = 1545;
                v36 = 2114;
                v37 = v13;
                _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

                v12 = 1;
              }
              break;
            case 1:
            case 5:
              v16 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v10, "fetchDate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "dateWithPBDate:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v18, "fc_isLaterThan:", *(_QWORD *)(a1 + 48));

              break;
            default:
              break;
          }
          if (!-[NTPBRecordBase hasExpiredAssetURLs](v11) && v12 != 0)
          {
            -[FCFaultableRecord record]((uint64_t)v9);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 0, v21, 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
          -[FCRecordSource _fetchErrorForKey:](*(id *)(*(_QWORD *)(a1 + 40) + 416), v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 3, 0, v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[FCRecordSource _fetchErrorForKey:](*(id *)(*(_QWORD *)(a1 + 40) + 416), v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 3, 0, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setMissingObjectDescriptions:", v21);
LABEL_21:

        objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
        ++v5;
      }
      while (v4 != v5);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      v4 = v22;
    }
    while (v22);
  }

}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_285(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  FCHeldRecords *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__FCRecordsFetchOperation_performOperation__block_invoke_2_286;
  v11 = &unk_1E463C990;
  v3 = v2;
  v12 = v3;
  v13 = &v28;
  v14 = &v22;
  v15 = &v16;
  v4 = _Block_copy(&v8);
  objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", v4, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 40), "enumerateObjectsUsingBlock:", v4);
  objc_msgSend(*(id *)(a1 + 48), "enumerateObjectsUsingBlock:", v4);
  v5 = v29[3];
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[FCHeldRecords initWithRecordsByID:interestTokensByID:]([FCHeldRecords alloc], "initWithRecordsByID:interestTokensByID:", v3, *(_QWORD *)(a1 + 56));
    v5 = v29[3];
  }
  +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", v5, v6, v23[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMissingObjectDescriptions:", v17[5]);
  objc_msgSend(*(id *)(a1 + 64), "finishExecutingWithResult:", v7);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_2_286(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "fetchedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v16, "fetchedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)a1[4];
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v4, v7);

  }
  if ((unint64_t)objc_msgSend(v16, "status") < *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v16, "status");
  if (objc_msgSend(v16, "status") == 3)
  {
    objc_msgSend(v16, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v16;
    if (!v8)
      goto LABEL_10;
    objc_msgSend(v16, "error");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }
  else
  {
    v13 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;
  }

  v9 = v16;
LABEL_10:
  if (objc_msgSend(v9, "status"))
  {
    v14 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(v16, "missingObjectDescriptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fc_safelyUnionSet:", v15);

  }
}

@end
