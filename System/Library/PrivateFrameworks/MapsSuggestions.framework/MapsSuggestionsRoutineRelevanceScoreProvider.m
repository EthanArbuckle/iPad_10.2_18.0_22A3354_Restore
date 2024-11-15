@implementation MapsSuggestionsRoutineRelevanceScoreProvider

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (MapsSuggestionsRoutineRelevanceScoreProvider)initWithRoutine:(id)a3
{
  id v5;
  MapsSuggestionsRoutineRelevanceScoreProvider *v6;
  double v7;
  uint64_t v8;
  NSDate *fetchEntriesFromDate;
  void *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *innerQueue;
  NSString *v13;
  NSString *name;
  NSArray *v15;
  NSArray *routineLocations;
  dispatch_queue_t v18;
  NSString *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsRoutineRelevanceScoreProvider;
  v6 = -[MapsSuggestionsRoutineRelevanceScoreProvider init](&v20, sel_init);
  if (v6)
  {
    GEOConfigGetDouble();
    MapsSuggestionsNowWithOffset(-v7);
    v8 = objc_claimAutoreleasedReturnValue();
    fetchEntriesFromDate = v6->_fetchEntriesFromDate;
    v6->_fetchEntriesFromDate = (NSDate *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue(&v18, CFSTR("MapsSuggestionsRoutineRelevanceScoreProviderQueue"), v10);
    v11 = v18;
    v18 = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = (OS_dispatch_queue *)v11;

    v13 = v19;
    v19 = 0;
    name = v6->_queue._name;
    v6->_queue._name = v13;

    v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    routineLocations = v6->_routineLocations;
    v6->_routineLocations = v15;

    objc_storeStrong((id *)&v6->_routine, a3);
  }

  return v6;
}

- (char)relevanceScoreForNames:(id)a3 addresses:(id)a4 mapItems:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
      v25 = 1024;
      v26 = 67;
      v27 = 2082;
      v28 = "-[MapsSuggestionsRoutineRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      v29 = 2082;
      v30 = "nil == (completion)";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. nil completion", buf, 0x26u);
    }
    goto LABEL_12;
  }
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[MapsSuggestionsRoutineRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  if (!v12)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "mapItems was nil", buf, 2u);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
      v25 = 1024;
      v26 = 75;
      v27 = 2082;
      v28 = "-[MapsSuggestionsRoutineRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      v29 = 2082;
      v30 = "[mapItems isKindOfClass:[NSMutableArray class]]";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for mapItems results in undefined behaviour", buf, 0x26u);
    }
LABEL_12:

LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  v18 = -[NSObject copy](v12, "copy");

  if (-[NSObject count](v18, "count"))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __101__MapsSuggestionsRoutineRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke;
    v20[3] = &unk_1E4BCE098;
    v21 = v18;
    v22 = v13;
    v12 = v18;
    MSg::Queue::async<MapsSuggestionsRoutineRelevanceScoreProvider>((NSObject **)&self->_queue, self, v20);

    v16 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
      v25 = 1024;
      v26 = 80;
      v27 = 2082;
      v28 = "-[MapsSuggestionsRoutineRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      v29 = 2082;
      v30 = "0u == [mapItems count]";
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. 0 mapItems passed", buf, 0x26u);
    }

    v16 = 0;
    v12 = v18;
  }
LABEL_19:

  return v16;
}

void __101__MapsSuggestionsRoutineRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v10;
  MapsSuggestionsRelevanceScore *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  double v26;
  NSObject *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  id obj;
  id v38;
  NSObject *v39;
  NSObject *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  _BYTE v48[24];
  uint8_t v49[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v35 = *(_QWORD *)(a1 + 40);
  v36 = *(id *)(a1 + 32);
  if (!a2)
  {
    v39 = 0;
    goto LABEL_48;
  }
  v3 = objc_msgSend(*(id *)(a2 + 40), "count");
  if (v3 == objc_msgSend(*(id *)(a2 + 48), "count"))
  {
    v4 = *(id *)(a2 + 40);
    objc_sync_enter(v4);
    if (v3)
    {
      objc_sync_exit(v4);

      v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      obj = v36;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v5)
      {
        v38 = *(id *)v42;
        do
        {
          v6 = 0;
          do
          {
            if (*(id *)v42 != v38)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
            objc_msgSend(MEMORY[0x1E0C99E38], "null", v35);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v7)
              v9 = v8 == v7;
            else
              v9 = 1;
            v10 = v9;

            if (v10)
            {
              v11 = -[MapsSuggestionsRelevanceScore initWithConfidence:]([MapsSuggestionsRelevanceScore alloc], "initWithConfidence:", MapsSuggestionsConfidenceDontKnow());
              -[NSObject addObject:](v40, "addObject:", v11);
            }
            else
            {
              v12 = v7;
              v11 = objc_alloc_init(MapsSuggestionsRelevanceScore);
              objc_msgSend(v12, "geoFenceMapRegionOrNil");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              GEOMapRectForMapRegion();

              v14 = *(id *)(a2 + 40);
              objc_sync_enter(v14);
              v15 = objc_msgSend(*(id *)(a2 + 40), "count");
              if (v15)
              {
                v16 = 0;
                v17 = 0;
                while (1)
                {
                  objc_msgSend(*(id *)(a2 + 40), "objectAtIndexedSubscript:", v17);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v18, "coordinate");
                  objc_msgSend(v18, "coordinate");
                  GEOMapPointForCoordinate();
                  if (GEOMapRectContainsPoint())
                    break;
                  ++v17;
                  v16 = v18;
                  if (v15 == v17)
                    goto LABEL_23;
                }
                GEOFindOrCreateLog();
                v19 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v12, "name");
                  v20 = (char *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "coordinate");
                  v22 = v21;
                  objc_msgSend(v12, "coordinate");
                  *(_DWORD *)buf = 138412802;
                  v46 = v20;
                  v47 = 2048;
                  *(_QWORD *)v48 = v22;
                  *(_WORD *)&v48[8] = 2048;
                  *(_QWORD *)&v48[10] = v23;
                  _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "mapItem %@ , %f , %f was found in CoreRoutine. Setting High Confidence", buf, 0x20u);

                }
                -[MapsSuggestionsRelevanceScore setConfidence:](v11, "setConfidence:", MapsSuggestionsConfidenceDefinitelyTrue());
                v24 = *(id *)(a2 + 48);
                objc_sync_enter(v24);
                if (objc_msgSend(*(id *)(a2 + 48), "count") > v17)
                {
                  objc_msgSend(*(id *)(a2 + 48), "objectAtIndexedSubscript:", v17);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MapsSuggestionsRelevanceScore setLastInteractionTime:](v11, "setLastInteractionTime:", v25);

                }
                objc_sync_exit(v24);

                objc_sync_exit(v14);
              }
              else
              {
                v18 = 0;
LABEL_23:
                objc_sync_exit(v14);

                -[MapsSuggestionsRelevanceScore setConfidence:](v11, "setConfidence:", MapsSuggestionsConfidenceDontKnow());
              }

              -[MapsSuggestionsRelevanceScore confidence](v11, "confidence");
              if (v26 == MapsSuggestionsConfidenceDontKnow())
              {
                if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
                  dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                if (s_verbose)
                {
                  GEOFindOrCreateLog();
                  v27 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v12, "name");
                    v28 = (char *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "coordinate");
                    v30 = v29;
                    objc_msgSend(v12, "coordinate");
                    *(_DWORD *)buf = 138412802;
                    v46 = v28;
                    v47 = 2048;
                    *(_QWORD *)v48 = v30;
                    *(_WORD *)&v48[8] = 2048;
                    *(_QWORD *)&v48[10] = v31;
                    _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_DEBUG, "mapItem %@ , %f , %f was NOT found in CoreRoutine", buf, 0x20u);

                  }
                }
              }
              -[NSObject addObject:](v40, "addObject:", v11);
            }

            ++v6;
          }
          while (v6 != v5);
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        }
        while (v5);
      }

      v32 = -[NSObject count](v40, "count");
      if (v32 == objc_msgSend(obj, "count"))
      {
        v4 = v40;
        v39 = v4;
      }
      else
      {
        GEOFindOrCreateLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v46 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
          v47 = 1024;
          *(_DWORD *)v48 = 145;
          *(_WORD *)&v48[4] = 2082;
          *(_QWORD *)&v48[6] = "-[MapsSuggestionsRoutineRelevanceScoreProvider _confidencesForMapItems:]";
          *(_WORD *)&v48[14] = 2082;
          *(_QWORD *)&v48[16] = "[confidences count] != [mapItems count]";
          _os_log_impl(&dword_1A427D000, v34, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Return count must be same as input count!", buf, 0x26u);
        }

        v39 = 0;
        v4 = v40;
      }
      goto LABEL_47;
    }
    GEOFindOrCreateLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_1A427D000, v33, OS_LOG_TYPE_DEBUG, "No routine locations. Returning nil", v49, 2u);
    }

    objc_sync_exit(v4);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v49 = 136446978;
      v50 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
      v51 = 1024;
      v52 = 124;
      v53 = 2082;
      v54 = "-[MapsSuggestionsRoutineRelevanceScoreProvider _confidencesForMapItems:]";
      v55 = 2082;
      v56 = "locationCount != [_routineVisits count]";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Number of routine locations and visits are different. This is not allowed. Returning nil", v49, 0x26u);
    }
  }
  v39 = 0;
LABEL_47:

LABEL_48:
  (*(void (**)(uint64_t, NSObject *, _QWORD))(v35 + 16))(v35, v39, 0);

}

- (void)preLoad
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[MapsSuggestionsRoutineRelevanceScoreProvider preLoad]";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__MapsSuggestionsRoutineRelevanceScoreProvider_preLoad__block_invoke;
  v4[3] = &unk_1E4BCE0E8;
  v4[4] = self;
  MSg::Queue::async<MapsSuggestionsRoutineRelevanceScoreProvider>((NSObject **)&self->_queue, self, v4);
}

void __55__MapsSuggestionsRoutineRelevanceScoreProvider_preLoad__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  dispatch_time_t v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id location;
  uint8_t buf[8];
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, void *);
  void *v24;
  _QWORD *v25;
  id v26[2];
  id from;

  v3 = a2;
  v4 = dispatch_semaphore_create(0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__MapsSuggestionsRoutineRelevanceScoreProvider_preLoad__block_invoke_2;
  v17[3] = &unk_1E4BCE0C0;
  v6 = v4;
  v18 = v6;
  objc_copyWeak(&v19, &location);
  v7 = v17;
  if (v3)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Calling CoreRoutine SPI", buf, 2u);
      }

    }
    objc_initWeak(&from, v3);
    objc_msgSend(MEMORY[0x1E0D272A8], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEnabledForSubTestWithName:", CFSTR("MSGPPTTest_Insights_ACRanking_RoutineCall"));

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("MSGPPTTest_Insights_ACRanking_RoutineCallBEGIN"), 0);

    }
    v12 = (void *)v3[4];
    v13 = v3[1];
    *(_QWORD *)buf = v5;
    v22 = 3221225472;
    v23 = __71__MapsSuggestionsRoutineRelevanceScoreProvider__fetchLOIsWithCallback___block_invoke;
    v24 = &unk_1E4BCE110;
    objc_copyWeak(v26, &from);
    v25 = v7;
    objc_msgSend(v12, "fetchLocationsSinceDate:handler:", v13, buf);

    objc_destroyWeak(v26);
    objc_destroyWeak(&from);
  }

  GEOConfigGetDouble();
  v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  if (dispatch_semaphore_wait(v6, v15))
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "RoutineRelevanceScoreProvider preload timed out", buf, 2u);
    }

  }
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __55__MapsSuggestionsRoutineRelevanceScoreProvider_preLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  id *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  int v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v11 = WeakRetained;
    if (WeakRetained)
    {
      v12 = WeakRetained[5];
      objc_sync_enter(v12);
      v13 = objc_msgSend(v7, "copy");
      v14 = v11[5];
      v11[5] = (id)v13;

      objc_sync_exit(v12);
      v15 = v11[6];
      objc_sync_enter(v15);
      v16 = objc_msgSend(v8, "copy");
      v17 = v11[6];
      v11[6] = (id)v16;

      objc_sync_exit(v15);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
    else
    {
      GEOFindOrCreateLog();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = 136446722;
        v20 = "MapsSuggestionsRoutineRelevanceScoreProvider.mm";
        v21 = 1026;
        v22 = 103;
        v23 = 2082;
        v24 = "-[MapsSuggestionsRoutineRelevanceScoreProvider preLoad]_block_invoke_2";
        _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v19, 0x1Cu);
      }

    }
  }

}

void __71__MapsSuggestionsRoutineRelevanceScoreProvider__fetchLOIsWithCallback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  char *v8;
  char *v9;
  void *v10;
  int v11;
  void *v12;
  id WeakRetained;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D272A8], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabledForSubTestWithName:", CFSTR("MSGPPTTest_Insights_ACRanking_RoutineCall"));

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MSGPPTTest_Insights_ACRanking_RoutineCallEND"), 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9)
    {
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = v9;
        _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "Error while fetching locations: %@", (uint8_t *)&v19, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      GEOFindOrCreateLog();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v19 = 67109120;
        LODWORD(v20) = objc_msgSend(v7, "count");
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "CoreRoutine returned %u locations", (uint8_t *)&v19, 8u);
      }

      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v19 = 138412290;
          v20 = (char *)v7;
          _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "Locations: %@", (uint8_t *)&v19, 0xCu);
        }

        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = 138412290;
          v20 = v8;
          _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_DEBUG, "Visits: %@", (uint8_t *)&v19, 0xCu);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446722;
      v20 = "MapsSuggestionsRoutineRelevanceScoreProvider.mm";
      v21 = 1026;
      v22 = 192;
      v23 = 2082;
      v24 = "-[MapsSuggestionsRoutineRelevanceScoreProvider _fetchLOIsWithCallback:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v19, 0x1Cu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineVisits, 0);
  objc_storeStrong((id *)&self->_routineLocations, 0);
  objc_storeStrong((id *)&self->_routine, 0);

  objc_storeStrong((id *)&self->_fetchEntriesFromDate, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
