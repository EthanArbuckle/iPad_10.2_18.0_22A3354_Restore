@implementation ATXExecutableReferenceManager

- (void)markReferencesAsPurgableFromClientModelIdIfPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *context;
  uint64_t v30;
  ATXExecutableReferenceManager *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = self;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = v5;
    v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v28)
    {
      v8 = 0;
      v25 = v5;
      v26 = *(_QWORD *)v37;
      v27 = v7;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(v7);
          v30 = v9;
          v10 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v9);
          context = (void *)MEMORY[0x1A85A4F90]();
          objc_msgSend(v7, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v33 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v16, "clientModelId", v25);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqualToString:", v4);

                if (v18)
                {
                  if ((objc_msgSend(v16, "suggestionIsHidden") & 1) != 0)
                  {
                    if (objc_msgSend(v16, "suggestionIsHidden"))
                    {
                      objc_msgSend(v16, "date");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "timeIntervalSinceDate:", v19);
                      v21 = v20;

                      if (v21 > 0.0)
                      {
                        objc_msgSend(v16, "setShouldPurge:", 1);
                        __atxlog_handle_default();
                        v22 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                        {
                          v23 = (objc_class *)objc_opt_class();
                          NSStringFromClass(v23);
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412546;
                          v41 = v24;
                          v42 = 2112;
                          v43 = v16;
                          _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "%@ - markReferencesAsPurgableFromClientModelIdIfPossible marked hidden reference as purgable: %@", buf, 0x16u);

                        }
                      }
                    }
                    v8 = 1;
                  }
                  else
                  {
                    v8 = 1;
                    objc_msgSend(v16, "setShouldPurge:", 1);
                  }
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            }
            while (v13);
          }

          objc_autoreleasePoolPop(context);
          v9 = v30 + 1;
          v7 = v27;
        }
        while (v30 + 1 != v28);
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v28);

      v5 = v25;
      if ((v8 & 1) != 0)
        -[ATXExecutableReferenceManager _writeReferences:](v31, "_writeReferences:", v27);
    }
    else
    {

    }
  }

}

- (id)_loadReferences
{
  uint64_t v3;
  void *v4;
  NSMapTable *cachedExecutableToReferenceMapForBatchUpdates;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  ATXPBExecutableReferenceCache *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  ATXExecutableIdentifier *v22;
  void *v23;
  void *v24;
  ATXAction *v25;
  void *v26;
  ATXAction *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  ATXLinkActionContainer *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  ATXExecutableReference *v41;
  void *v42;
  void *v43;
  _BOOL8 v44;
  _BOOL8 v45;
  ATXExecutableReference *v46;
  void *v48;
  void *v49;
  NSMapTable *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *context;
  uint64_t v55;
  ATXExecutableIdentifier *v56;
  id obj;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[6];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1A85A4F90](self, a2);
  v4 = (void *)v3;
  cachedExecutableToReferenceMapForBatchUpdates = self->__cachedExecutableToReferenceMapForBatchUpdates;
  if (cachedExecutableToReferenceMapForBatchUpdates)
  {
    v50 = cachedExecutableToReferenceMapForBatchUpdates;
  }
  else
  {
    v49 = (void *)v3;
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ATXExecutableReferenceManager _loadReferences].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__22;
    v72 = __Block_byref_object_dispose__22;
    v73 = 0;
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __48__ATXExecutableReferenceManager__loadReferences__block_invoke;
    v67[3] = &unk_1E4D590F8;
    v67[4] = self;
    v67[5] = &v68;
    +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:block:](ATXRunningBoardAssertion, "performWorkWithFinishTaskAssertionName:block:", CFSTR("ATXExecutableReferenceManager"), v67);
    if (objc_msgSend((id)v69[5], "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v50 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1A85A4F90]();
      v15 = [ATXPBExecutableReferenceCache alloc];
      v16 = -[ATXPBExecutableReferenceCache initWithData:](v15, "initWithData:", v69[5]);
      objc_autoreleasePoolPop(v14);
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      -[ATXPBExecutableReferenceCache keys](v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      v48 = (void *)v16;
      if (v18)
      {
        v51 = v17;
        v52 = *(_QWORD *)v64;
        do
        {
          v19 = 0;
          v53 = v18;
          do
          {
            if (*(_QWORD *)v64 != v52)
              objc_enumerationMutation(v17);
            v55 = v19;
            v20 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v19);
            context = (void *)MEMORY[0x1A85A4F90]();
            switch(-[ATXPBExecutableReferenceKey executableType](v20))
            {
              case 1u:
                v21 = (void *)MEMORY[0x1A85A4F90]();
                v22 = [ATXExecutableIdentifier alloc];
                -[ATXPBExecutableReferenceKey executableString](v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = -[ATXExecutableIdentifier initWithString:](v22, "initWithString:", v23);

                objc_autoreleasePoolPop(v21);
                goto LABEL_26;
              case 2u:
                v24 = (void *)MEMORY[0x1A85A4F90]();
                v25 = [ATXAction alloc];
                -[ATXPBExecutableReferenceKey executableAction](v20);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = -[ATXAction initWithProto:](v25, "initWithProto:", v26);

                if (v27)
                  v56 = -[ATXExecutableIdentifier initWithAction:]([ATXExecutableIdentifier alloc], "initWithAction:", v27);
                else
                  v56 = 0;
                goto LABEL_25;
              case 3u:
                v24 = (void *)MEMORY[0x1A85A4F90]();
                v28 = objc_alloc(MEMORY[0x1E0D2FC70]);
                -[ATXPBExecutableReferenceKey executableHeroApp](v20);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = (ATXAction *)objc_msgSend(v28, "initWithProto:", v29);

                if (v27)
                  v56 = -[ATXExecutableIdentifier initWithHeroAppPrediction:]([ATXExecutableIdentifier alloc], "initWithHeroAppPrediction:", v27);
                else
                  v56 = 0;
                goto LABEL_25;
              case 4u:
                v24 = (void *)MEMORY[0x1A85A4F90]();
                v30 = objc_alloc(MEMORY[0x1E0D81150]);
                -[ATXPBExecutableReferenceKey executableInfoSuggestion](v20);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = (ATXAction *)objc_msgSend(v30, "initWithProto:", v31);

                if (v27)
                  v56 = -[ATXExecutableIdentifier initWithInfoSuggestion:]([ATXExecutableIdentifier alloc], "initWithInfoSuggestion:", v27);
                else
                  v56 = 0;
                goto LABEL_25;
              case 5u:
                v24 = (void *)MEMORY[0x1A85A4F90]();
                v32 = [ATXLinkActionContainer alloc];
                -[ATXPBExecutableReferenceKey executableLinkAction](v20);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = -[ATXLinkActionContainer initWithProto:](v32, "initWithProto:", v33);

                if (v27)
                  v56 = -[ATXExecutableIdentifier initWithLinkAction:]([ATXExecutableIdentifier alloc], "initWithLinkAction:", v27);
                else
                  v56 = 0;
LABEL_25:

                objc_autoreleasePoolPop(v24);
LABEL_26:
                if (v56)
                {
                  v34 = objc_opt_new();
                  v61 = 0u;
                  v62 = 0u;
                  v59 = 0u;
                  v60 = 0u;
                  -[ATXPBExecutableReferenceKey references](v20);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
                  v58 = (void *)v34;
                  if (v36)
                  {
                    v37 = *(_QWORD *)v60;
                    obj = v35;
                    do
                    {
                      for (i = 0; i != v36; ++i)
                      {
                        if (*(_QWORD *)v60 != v37)
                          objc_enumerationMutation(obj);
                        v39 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
                        v40 = (void *)MEMORY[0x1A85A4F90]();
                        v41 = [ATXExecutableReference alloc];
                        -[ATXPBExecutableReferenceEntry clientModelId](v39);
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -[ATXPBExecutableReferenceEntry date](v39));
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        v44 = -[ATXPBExecutableReferenceEntry shouldClearOnEngagement](v39);
                        v45 = -[ATXPBExecutableReferenceEntry shouldPurge](v39);
                        v46 = -[ATXExecutableReference initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:](v41, "initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:", v42, v43, v44, v45, -[ATXPBExecutableReferenceEntry suggestionIsHidden](v39));

                        objc_msgSend(v58, "addObject:", v46);
                        objc_autoreleasePoolPop(v40);
                      }
                      v35 = obj;
                      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
                    }
                    while (v36);
                  }

                  -[NSMapTable setObject:forKey:](v50, "setObject:forKey:", v58, v56);
                }
                break;
              default:
                break;
            }
            objc_autoreleasePoolPop(context);
            v17 = v51;
            v19 = v55 + 1;
          }
          while (v55 + 1 != v53);
          v18 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        }
        while (v18);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v50 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v68, 8);

    v4 = v49;
  }
  objc_autoreleasePoolPop(v4);
  return v50;
}

- (void)_purgeReferencesIfPossibleInMap:(id)a3 forceWrite:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double minDurationForTrackedReferencesToStayAround;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *context;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v31 = v6;
  v8 = (void *)objc_msgSend(v6, "copy");
  v29 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (!v29)
  {

    if (!v4)
      goto LABEL_26;
    goto LABEL_25;
  }
  v26 = v4;
  v9 = 0;
  v27 = *(_QWORD *)v39;
  v28 = v8;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v39 != v27)
        objc_enumerationMutation(v8);
      v33 = v10;
      v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v10);
      context = (void *)MEMORY[0x1A85A4F90]();
      v30 = v11;
      objc_msgSend(v31, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v13 = (void *)objc_msgSend(v12, "copy");
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v18, "shouldPurge"))
            {
              objc_msgSend(v18, "date");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "timeIntervalSinceDate:", v19);
              v21 = v20;
              minDurationForTrackedReferencesToStayAround = self->_minDurationForTrackedReferencesToStayAround;

              if (v21 >= minDurationForTrackedReferencesToStayAround)
              {
                objc_msgSend(v12, "removeObject:", v18);
                if (objc_msgSend(v18, "suggestionIsHidden"))
                {
                  __atxlog_handle_default();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    v24 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v24);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v43 = v25;
                    v44 = 2112;
                    v45 = v18;
                    _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "%@ - purged hidden reference: %@", buf, 0x16u);

                  }
                }
                v9 = 1;
              }
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        }
        while (v15);
      }

      if (!objc_msgSend(v12, "count"))
      {
        objc_msgSend(v31, "removeObjectForKey:", v30);
        v9 = 1;
      }

      objc_autoreleasePoolPop(context);
      v10 = v33 + 1;
      v8 = v28;
    }
    while (v33 + 1 != v29);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  }
  while (v29);

  if (((v9 | v26) & 1) != 0)
LABEL_25:
    -[ATXExecutableReferenceManager _writeReferences:](self, "_writeReferences:", v31);
LABEL_26:

}

- (void)purgeReferencesIfPossible
{
  id v3;

  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXExecutableReferenceManager _purgeReferencesIfPossibleInMap:forceWrite:](self, "_purgeReferencesIfPossibleInMap:forceWrite:", v3, 0);

}

- (id)_readData
{
  int v2;
  int v3;
  NSObject *v4;
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = open(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), 0);
  if (v2 == -1)
  {
    v6 = *__error();
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "No recently engaged cache references file found.", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[ATXExecutableReferenceManager _readData].cold.1();
    }

    v5 = 0;
  }
  else
  {
    v3 = v2;
    ATXCacheFileRead();
    if ((v3 & 0x80000000) == 0)
      close(v3);
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = CFSTR("ATXExecutableReferenceCache.pb");
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "Successfully read data from cache file: %@", buf, 0xCu);
    }

    v5 = 0;
  }
  return v5;
}

- (void)performBatchUpdateOfReferencesWithBlock:(id)a3
{
  NSMapTable *cachedExecutableToReferenceMapForBatchUpdates;
  void *v5;
  void *v6;
  void *v7;
  NSMapTable *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  cachedExecutableToReferenceMapForBatchUpdates = self->__cachedExecutableToReferenceMapForBatchUpdates;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  if (cachedExecutableToReferenceMapForBatchUpdates)
  {
    v9[2]();
  }
  else
  {
    -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->__cachedExecutableToReferenceMapNeedsWrite = 0;
    objc_storeStrong((id *)&self->__cachedExecutableToReferenceMapForBatchUpdates, v6);
    v7 = (void *)MEMORY[0x1A85A4F90]();
    v9[2]();
    objc_autoreleasePoolPop(v7);
    v8 = self->__cachedExecutableToReferenceMapForBatchUpdates;
    self->__cachedExecutableToReferenceMapForBatchUpdates = 0;

    if (self->__cachedExecutableToReferenceMapNeedsWrite)
      -[ATXExecutableReferenceManager _writeReferences:](self, "_writeReferences:", v6);
    self->__cachedExecutableToReferenceMapNeedsWrite = 0;

  }
  objc_autoreleasePoolPop(v5);

}

- (void)purgeReferencesForSuggestions:(id)a3 clientModelId:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  ATXExecutableReferenceManager *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v9)
  {
    v10 = v9;
    v31 = self;
    v11 = 0;
    v12 = *(_QWORD *)v44;
    v32 = *(_QWORD *)v44;
    v33 = v8;
    do
    {
      v13 = 0;
      v34 = v10;
      do
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v8);
        v38 = v13;
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v13);
        v37 = MEMORY[0x1A85A4F90]();
        ATXAllowedEngagementRecordManagerClasses();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "executableSpecification");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "executableClassString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "containsObject:", v17);

        if (v18)
        {
          ATXExecutableIdentifierForSuggestion(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v35, "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "count"))
            {
              v36 = v19;
              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              v21 = (void *)objc_msgSend(v20, "copy");
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v40;
                do
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v40 != v24)
                      objc_enumerationMutation(v21);
                    v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                    if (objc_msgSend(v26, "shouldPurge", v31))
                    {
                      objc_msgSend(v26, "clientModelId");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v28 = objc_msgSend(v27, "isEqualToString:", v7);

                      if (v28)
                      {
                        objc_msgSend(v20, "removeObject:", v26);
                        v11 = 1;
                      }
                    }
                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
                }
                while (v23);
              }

              v12 = v32;
              v8 = v33;
              v10 = v34;
              v19 = v36;
              if (!objc_msgSend(v20, "count"))
              {
                objc_msgSend(v35, "removeObjectForKey:", v36);
                v11 = 1;
              }
            }

          }
          v30 = (void *)v37;
          v29 = v38;

        }
        else
        {
          v30 = (void *)v37;
          v29 = v38;
        }
        objc_autoreleasePoolPop(v30);
        v13 = v29 + 1;
      }
      while (v13 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v10);

    if ((v11 & 1) != 0)
      -[ATXExecutableReferenceManager _writeReferences:](v31, "_writeReferences:", v35);
  }
  else
  {

  }
}

- (void)addReferencesForSuggestions:(id)a3 clientModelId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A85A4F90]();
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXExecutableReferenceManager _executablePairsForSuggestions:clientModelId:](self, "_executablePairsForSuggestions:clientModelId:", v10, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[ATXExecutableReferenceManager _addExecutablePairs:toMap:](self, "_addExecutablePairs:toMap:", v9, v8);
    -[ATXExecutableReferenceManager _writeReferences:](self, "_writeReferences:", v8);
  }

  objc_autoreleasePoolPop(v7);
}

- (id)_executablePairsForSuggestions:(id)a3 clientModelId:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  ATXExecutableReference *v17;
  void *v18;
  ATXExecutableReference *v19;
  void *v20;
  ATXExecutableReferencePair *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = a4;
  v24 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        ATXAllowedEngagementRecordManagerClasses();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "executableSpecification");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "executableClassString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "containsObject:", v15);

        if (v16)
        {
          v17 = [ATXExecutableReference alloc];
          objc_msgSend(v12, "uiSpecification");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[ATXExecutableReference initWithClientModelId:date:shouldClearOnEngagement:](v17, "initWithClientModelId:date:shouldClearOnEngagement:", v23, v6, objc_msgSend(v18, "shouldClearOnEngagement"));

          ATXExecutableIdentifierForSuggestion(v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[ATXExecutableReferencePair initWithReference:executable:]([ATXExecutableReferencePair alloc], "initWithReference:executable:", v19, v20);
          objc_msgSend(v24, "addObject:", v21);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  return v24;
}

- (ATXExecutableReferenceManager)init
{
  void *v3;
  ATXExecutableReferenceManager *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXExecutableReferenceManager initWithCacheDirectory:minDurationForTrackedReferencesToStayAround:](self, "initWithCacheDirectory:minDurationForTrackedReferencesToStayAround:", v3, 900.0);

  return v4;
}

- (ATXExecutableReferenceManager)initWithCacheDirectory:(id)a3 minDurationForTrackedReferencesToStayAround:(double)a4
{
  id v6;
  ATXExecutableReferenceManager *v7;
  uint64_t v8;
  NSString *path;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXExecutableReferenceManager;
  v7 = -[ATXExecutableReferenceManager init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ATXExecutableReferenceCache.pb"));
    v8 = objc_claimAutoreleasedReturnValue();
    path = v7->_path;
    v7->_path = (NSString *)v8;

    v7->_minDurationForTrackedReferencesToStayAround = a4;
  }

  return v7;
}

- (id)jsonDict
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v21 = (void *)objc_opt_new();
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v4)
  {
    v5 = v4;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "debugTitle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v3, "objectForKey:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "jsonDict");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
          }
          while (v12);
        }

        objc_msgSend(v21, "setObject:forKeyedSubscript:", v9, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v5);
  }
  v30[0] = CFSTR("type");
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = CFSTR("references");
  v31[0] = v17;
  v31[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(obj);
        v18 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("> References for executable: %@\n"), v5);
        objc_msgSend(obj, "objectForKey:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v20 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
              objc_msgSend(v11, "clientModelId");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "date");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "appendFormat:", CFSTR("  - %@ on %@; shouldPurge: %d clearOnEngagement: %d\n"),
                v12,
                v13,
                objc_msgSend(v11, "shouldPurge"),
                objc_msgSend(v11, "shouldClearOnEngagement"));

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v8);
        }
        objc_msgSend(v3, "appendString:", CFSTR("\n"));

        v4 = v18 + 1;
      }
      while (v18 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v16);
  }

  return v3;
}

- (BOOL)_writeData:(id)a3
{
  id v4;
  int v5;
  int v6;
  char v7;
  NSObject *v8;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = open(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), 514, 384);
  if (v5 == -1)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXEngagementRecordManager _writeData:].cold.1();
    v7 = 0;
  }
  else
  {
    v6 = v5;
    v7 = ATXCacheFileWrite();
    if ((v6 & 0x80000000) == 0)
      close(v6);
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = CFSTR("ATXExecutableReferenceCache.pb");
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "Successfully wrote data to cache file: %@", buf, 0xCu);
    }
  }

  return v7;
}

void __48__ATXExecutableReferenceManager__loadReferences__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_readData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_writeReferences:(id)a3
{
  NSMapTable *v4;
  NSMapTable *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  ATXPBExecutableReferenceKey *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  ATXPBExecutableReferenceEntry *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  NSObject *v31;
  ATXExecutableReferenceManager *v32;
  void *v33;
  NSMapTable *v34;
  uint64_t v35;
  ATXPBExecutableReferenceCache *v36;
  uint64_t v37;
  NSMapTable *obj;
  void *context;
  _QWORD v40[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = (NSMapTable *)a3;
  v5 = v4;
  if (v4)
  {
    if (self->__cachedExecutableToReferenceMapForBatchUpdates == v4)
    {
      self->__cachedExecutableToReferenceMapNeedsWrite = 1;
    }
    else
    {
      v32 = self;
      __atxlog_handle_default();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[ATXExecutableReferenceManager _writeReferences:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);

      v33 = (void *)MEMORY[0x1A85A4F90]();
      v36 = objc_alloc_init(ATXPBExecutableReferenceCache);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v34 = v5;
      obj = v5;
      v37 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v37)
      {
        v35 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v47 != v35)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            context = (void *)MEMORY[0x1A85A4F90]();
            v16 = objc_alloc_init(ATXPBExecutableReferenceKey);
            switch(objc_msgSend(v15, "type"))
            {
              case 0:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v16, 1);
                objc_msgSend(v15, "object");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[ATXPBExecutableReferenceKey setExecutableString:]((uint64_t)v16, v17);
                goto LABEL_17;
              case 1:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v16, 2);
                objc_msgSend(v15, "object");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "proto");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[ATXPBExecutableReferenceKey setExecutableAction:]((uint64_t)v16, v18);
                goto LABEL_16;
              case 2:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v16, 3);
                objc_msgSend(v15, "object");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "proto");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[ATXPBExecutableReferenceKey setExecutableHeroApp:]((uint64_t)v16, v18);
                goto LABEL_16;
              case 3:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v16, 4);
                objc_msgSend(v15, "object");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "proto");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[ATXPBExecutableReferenceKey setExecutableInfoSuggestion:]((uint64_t)v16, v18);
                goto LABEL_16;
              case 4:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v16, 5);
                objc_msgSend(v15, "object");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "proto");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[ATXPBExecutableReferenceKey setExecutableLinkAction:]((uint64_t)v16, v18);
LABEL_16:

LABEL_17:
                break;
              default:
                break;
            }
            -[NSMapTable objectForKey:](obj, "objectForKey:", v15, v32, v33);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v43;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v43 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
                  v25 = objc_alloc_init(ATXPBExecutableReferenceEntry);
                  objc_msgSend(v24, "clientModelId");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ATXPBExecutableReferenceEntry setClientModelId:]((uint64_t)v25, v26);

                  objc_msgSend(v24, "date");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "timeIntervalSinceReferenceDate");
                  -[ATXPBExecutableReferenceEntry setDate:]((uint64_t)v25, v28);

                  -[ATXPBExecutableReferenceEntry setShouldClearOnEngagement:]((uint64_t)v25, objc_msgSend(v24, "shouldClearOnEngagement"));
                  -[ATXPBExecutableReferenceEntry setShouldPurge:]((uint64_t)v25, objc_msgSend(v24, "shouldPurge"));
                  -[ATXPBExecutableReferenceEntry setSuggestionIsHidden:]((uint64_t)v25, objc_msgSend(v24, "suggestionIsHidden"));
                  -[ATXPBExecutableReferenceKey addReferences:]((uint64_t)v16, v25);

                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              }
              while (v21);
            }
            -[ATXPBExecutableReferenceCache addKeys:]((uint64_t)v36, v16);

            objc_autoreleasePoolPop(context);
          }
          v37 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v37);
      }

      -[ATXPBExecutableReferenceCache data](v36, "data");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __50__ATXExecutableReferenceManager__writeReferences___block_invoke;
        v40[3] = &unk_1E4D57258;
        v40[4] = v32;
        v41 = v29;
        +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:block:](ATXRunningBoardAssertion, "performWorkWithFinishTaskAssertionName:block:", CFSTR("ATXExecutableReferenceManager"), v40);

      }
      else
      {
        __atxlog_handle_default();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[ATXExecutableReferenceManager _writeReferences:].cold.1(v31);

      }
      v5 = v34;

      objc_autoreleasePoolPop(v33);
    }
  }

}

uint64_t __50__ATXExecutableReferenceManager__writeReferences___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeData:", *(_QWORD *)(a1 + 40));
}

- (void)recordExecutable:(id)a3 clientModelId:(id)a4 shouldClearEngagement:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  ATXExecutableReference *v10;
  void *v11;
  ATXExecutableReference *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [ATXExecutableReference alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXExecutableReference initWithClientModelId:date:shouldClearOnEngagement:](v10, "initWithClientModelId:date:shouldClearOnEngagement:", v8, v11, v5);

  objc_msgSend(v9, "objectForKey:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "addObject:", v12);
  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v12, 0);
    objc_msgSend(v9, "setObject:forKey:", v15, v16);

  }
  -[ATXExecutableReferenceManager _writeReferences:](self, "_writeReferences:", v9);

}

- (id)_pairsForClientModelId:(id)a3 map:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  ATXExecutableReferencePair *v18;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v23 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v8);
        objc_msgSend(obj, "objectForKey:", v9, v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v15, "clientModelId");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", v5);

              if (v17)
              {
                v18 = -[ATXExecutableReferencePair initWithReference:executable:]([ATXExecutableReferencePair alloc], "initWithReference:executable:", v15, v9);
                objc_msgSend(v7, "addObject:", v18);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v12);
        }

        v8 = v23 + 1;
      }
      while (v23 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v21);
  }

  return v7;
}

- (void)updateReferencesForProactiveSuggestions:(id)a3 clientModelId:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double minDurationForTrackedReferencesToStayAround;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  objc_class *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v8 = objc_claimAutoreleasedReturnValue();
  -[ATXExecutableReferenceManager _pairsForClientModelId:map:](self, "_pairsForClientModelId:map:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v7;
  v57 = v6;
  -[ATXExecutableReferenceManager _executablePairsForSuggestions:clientModelId:](self, "_executablePairsForSuggestions:clientModelId:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v11, "intersectSet:", v10);
  v53 = v10;
  v12 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v12, "minusSet:", v11);
  v54 = v9;
  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  v51 = v11;
  objc_msgSend(v13, "minusSet:", v11);
  v14 = objc_msgSend(v12, "count");
  v15 = v14 != 0;
  if (v14)
    -[ATXExecutableReferenceManager _addExecutablePairs:toMap:](self, "_addExecutablePairs:toMap:", v12, v8);
  v52 = v12;
  v55 = (void *)v8;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v13;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v65 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v20, "reference");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "shouldPurge");

        if ((v22 & 1) == 0)
        {
          objc_msgSend(v20, "reference");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 1;
          objc_msgSend(v23, "setShouldPurge:", 1);

          objc_msgSend(v20, "reference");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "suggestionIsHidden");

          if (v25)
          {
            __atxlog_handle_default();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = (objc_class *)objc_opt_class();
              NSStringFromClass(v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "reference");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v70 = v28;
              v71 = 2112;
              v72 = v29;
              _os_log_impl(&dword_1A49EF000, v26, OS_LOG_TYPE_DEFAULT, "%@ - updateReferencesForProactiveSuggestions marked hidden reference as purgable: %@", buf, 0x16u);

            }
          }
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    }
    while (v17);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v30 = v51;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v61;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v61 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v34);
        objc_msgSend(v35, "reference");
        v36 = objc_claimAutoreleasedReturnValue();
        if (!-[NSObject shouldPurge](v36, "shouldPurge"))
          goto LABEL_27;
        objc_msgSend(v35, "reference");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "date");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "timeIntervalSinceDate:", v38);
        v40 = v39;
        minDurationForTrackedReferencesToStayAround = self->_minDurationForTrackedReferencesToStayAround;

        if (v40 < minDurationForTrackedReferencesToStayAround)
        {
          objc_msgSend(v35, "reference");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "shouldPurge");

          if (v43)
          {
            objc_msgSend(v35, "reference");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setShouldPurge:", 0);

            objc_msgSend(v35, "reference");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "suggestionIsHidden");

            if (v46)
            {
              __atxlog_handle_default();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                v47 = (objc_class *)objc_opt_class();
                NSStringFromClass(v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "reference");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v70 = v48;
                v71 = 2112;
                v72 = v49;
                _os_log_impl(&dword_1A49EF000, v36, OS_LOG_TYPE_DEFAULT, "%@ - updateReferencesForProactiveSuggestions unmarked hidden reference as purgable: %@", buf, 0x16u);

              }
              v15 = 1;
LABEL_27:

              goto LABEL_28;
            }
            v15 = 1;
          }
        }
LABEL_28:
        ++v34;
      }
      while (v32 != v34);
      v50 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      v32 = v50;
    }
    while (v50);
  }

  -[ATXExecutableReferenceManager _purgeReferencesIfPossibleInMap:forceWrite:](self, "_purgeReferencesIfPossibleInMap:forceWrite:", v55, v15);
}

- (unint64_t)referenceCountForExecutable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (id)clientModelIdsForExecutable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "clientModelId", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "clientModelId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)canExecutableClearOnEngagement:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "shouldClearOnEngagement", (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)isExecutableHidden:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "suggestionIsHidden", (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)referencesForClientModelId:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "clientModelId");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqualToString:", v4);

              if (v14)
                objc_msgSend(v5, "addObject:", v7);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v10);
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }

  return v5;
}

- (void)updateDateOfReferenceForExecutable:(id)a3 clientModelId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  ATXExecutableReferenceManager *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v21 = v9;
      v22 = v8;
      v23 = self;
      v24 = v6;
      v13 = 0;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1A85A4F90]();
          objc_msgSend(v16, "clientModelId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v7);

          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "updateDateTo:", v20);

            v13 = 1;
          }
          objc_autoreleasePoolPop(v17);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);

      v6 = v24;
      v9 = v21;
      v8 = v22;
      if ((v13 & 1) != 0)
        -[ATXExecutableReferenceManager _writeReferences:](v23, "_writeReferences:", v22);
    }
    else
    {

    }
  }

}

- (void)markReferenceAsHiddenForExecutable:(id)a3 clientModelId:(id)a4 untilDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  ATXExecutableReferenceManager *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v26 = a5;
  -[ATXExecutableReferenceManager _loadReferences](self, "_loadReferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v22 = v11;
      v23 = v10;
      v24 = self;
      v25 = v8;
      v15 = 0;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1A85A4F90]();
          objc_msgSend(v18, "clientModelId");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v9);

          if (v21)
          {
            objc_msgSend(v18, "updateDateTo:", v26);
            v15 = 1;
            objc_msgSend(v18, "setSuggestionIsHidden:", 1);
          }
          objc_autoreleasePoolPop(v19);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v14);

      v8 = v25;
      v11 = v22;
      v10 = v23;
      if ((v15 & 1) != 0)
        -[ATXExecutableReferenceManager _writeReferences:](v24, "_writeReferences:", v23);
    }
    else
    {

    }
  }

}

- (void)_addExecutablePairs:(id)a3 toMap:(id)a4
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
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "executable");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "reference");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);
        }
        else
        {
          v15 = objc_alloc(MEMORY[0x1E0C99E20]);
          objc_msgSend(v11, "reference");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "initWithObjects:", v14, 0);
          objc_msgSend(v11, "executable");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v16, v17);

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedExecutableToReferenceMapForBatchUpdates, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_readData
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_17(&dword_1A49EF000, v1, v2, "Couldn't open recently engaged cache references file: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)_loadReferences
{
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, a1, a3, "Loading recently engaged references from disk", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_writeReferences:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Could not archive references with error", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_writeReferences:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, a1, a3, "Writing recently engaged cache references", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
