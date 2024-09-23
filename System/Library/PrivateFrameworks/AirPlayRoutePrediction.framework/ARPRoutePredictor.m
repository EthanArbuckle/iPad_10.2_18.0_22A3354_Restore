@implementation ARPRoutePredictor

+ (NSString)defaultFile
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("AirPlayRoutePrediction/correlations.archive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (double)defaultMicroLocationSimilarityThreshold
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AirPlayRoutePrediction"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("MicroLocationSimilarityThreshold"));
  if (v3 <= 0.0)
    v4 = 0.75;
  else
    v4 = v3;

  return v4;
}

+ (id)routePredictor
{
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(a1, "defaultMicroLocationSimilarityThreshold");
  v6 = v5;
  objc_msgSend(a1, "defaultFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithmicroLocationSimilarityThreshold:file:knowledgeStore:", v7, v3, v6);

  return v8;
}

- (ARPRoutePredictor)initWithmicroLocationSimilarityThreshold:(double)a3 file:(id)a4 knowledgeStore:(id)a5
{
  id v8;
  id v9;
  ARPRoutePredictor *v10;
  ARPRoutePredictor *v11;
  uint64_t v12;
  NSString *file;
  uint64_t v14;
  NSSet *knownOutputDeviceIDs;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  void *v19;
  id v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  ARPRoutePredictor *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD handler[4];
  id v30;
  id location;
  objc_super v32;

  v8 = a4;
  v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)ARPRoutePredictor;
  v10 = -[ARPRoutePredictor init](&v32, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_7:
    v24 = v11;
    goto LABEL_8;
  }
  v10->_microLocationSimilarityThreshold = a3;
  v10->_token = -1;
  v12 = objc_msgSend(v8, "copy");
  file = v11->_file;
  v11->_file = (NSString *)v12;

  objc_storeStrong((id *)&v11->_knowledgeStore, a5);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v14 = objc_claimAutoreleasedReturnValue();
  knownOutputDeviceIDs = v11->_knownOutputDeviceIDs;
  v11->_knownOutputDeviceIDs = (NSSet *)v14;

  v11->_routingSessionTimeout = 10800.0;
  v11->_hasLoadedMicroLocation = 0;
  -[ARPRoutePredictor _reloadPersistedSessions](v11, "_reloadPersistedSessions");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_queue_create("com.apple.AirPlayRoutePrediction.ARPRoutePredictor", v16);
  queue = v11->_queue;
  v11->_queue = (OS_dispatch_queue *)v17;

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.AirPlayRoutePrediction:%s"), objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"));
  objc_initWeak(&location, v11);
  v20 = objc_retainAutorelease(v19);
  v21 = (const char *)objc_msgSend(v20, "UTF8String");
  v22 = v11->_queue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __82__ARPRoutePredictor_initWithmicroLocationSimilarityThreshold_file_knowledgeStore___block_invoke;
  handler[3] = &unk_1EA7D4760;
  objc_copyWeak(&v30, &location);
  v23 = notify_register_dispatch(v21, &v11->_token, v22, handler);
  objc_destroyWeak(&v30);
  if (!v23)
  {
    if (v11->_knowledgeStore)
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", v11, sel__reloadLatestMicroLocationEvent, *MEMORY[0x1E0D15B78], v27);

    }
    objc_destroyWeak(&location);

    goto LABEL_7;
  }
  objc_destroyWeak(&location);

  v24 = 0;
LABEL_8:

  return v24;
}

void __82__ARPRoutePredictor_initWithmicroLocationSimilarityThreshold_file_knowledgeStore___block_invoke(uint64_t a1)
{
  id v1;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "_reloadPersistedSessions");

  objc_destroyWeak(&to);
}

- (void)dealloc
{
  int token;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  token = self->_token;
  if (token != -1)
    notify_cancel(token);
  if (self->_knowledgeStore)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D15B78];
    objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, v5, v7);

  }
  v8.receiver = self;
  v8.super_class = (Class)ARPRoutePredictor;
  -[ARPRoutePredictor dealloc](&v8, sel_dealloc);
}

- (void)_reloadLatestMicroLocationEvent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD793000, v0, v1, "Error fetching latest microlocation %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __52__ARPRoutePredictor__reloadLatestMicroLocationEvent__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)_reloadPersistedSessions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD793000, v0, v1, "Error reading persisted routing sessions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

BOOL __45__ARPRoutePredictor__reloadPersistedSessions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "outputDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "interval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v2, "microLocationProbabilityVector");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)predictionsForContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  unint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  ARPRoutePrediction *v44;
  void *v45;
  ARPRoutePrediction *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  double v51;
  uint64_t j;
  ARPRoutePrediction *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  __int128 v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *context;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  NSObject *oslog;
  NSObject *v69;
  _QWORD v70[4];
  NSObject *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  ARPRoutePredictor *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[4];
  id v95;
  _QWORD block[5];
  _BYTE v97[128];
  _BYTE state[22];
  __int16 v99;
  const __CFString *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  const __CFString *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  _BYTE v109[128];
  _QWORD v110[4];

  v110[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1DD793000, "Duet: ARPRoutePredictor predictionsForContext:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)&state[8] = 0;
  *(_QWORD *)state = 0;
  os_activity_scope_enter(v5, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  context = (void *)MEMORY[0x1DF0DB988]();
  ARPLog();
  v6 = objc_claimAutoreleasedReturnValue();
  oslog = v6;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ARPRoutePredictor predictionsForContext:].cold.4();

  -[ARPRoutePredictor sessions](self, "sessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    -[ARPRoutePredictor queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__ARPRoutePredictor_predictionsForContext___block_invoke;
    block[3] = &unk_1EA7D4590;
    block[4] = self;
    dispatch_sync(v9, block);

  }
  -[ARPRoutePredictor sessions](self, "sessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3880];
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __43__ARPRoutePredictor_predictionsForContext___block_invoke_2;
  v94[3] = &unk_1EA7D47E8;
  v12 = v4;
  v95 = v12;
  objc_msgSend(v11, "predicateWithBlock:", v94);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v13);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARPRoutePredictor routingSessionTimeout](self, "routingSessionTimeout");
  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0x7FFFFFFFFFFFFFFFLL;
  v86 = 0;
  v87 = &v86;
  v88 = 0x2020000000;
  v89 = 0;
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __43__ARPRoutePredictor_predictionsForContext___block_invoke_3;
  v80[3] = &unk_1EA7D4810;
  v85 = v14;
  v67 = v12;
  v81 = v67;
  v82 = self;
  v83 = &v86;
  v84 = &v90;
  objc_msgSend(v64, "enumerateObjectsUsingBlock:", v80);
  v15 = v6;
  if (v91[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[ARPRoutePredictor predictionsForContext:].cold.2(v6);
      v15 = v6;
    }

    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v69 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = v87[3];
    if (v18 >= objc_msgSend(v64, "count"))
    {
      v24 = 0;
    }
    else
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v19 = v87[3];
      v20 = objc_msgSend(v64, "count");
      objc_msgSend(v64, "subarrayWithRange:", v19, v20 - v87[3]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v109, 16);
      v24 = 0;
      if (v22)
      {
        v66 = *(_QWORD *)v77;
        *(_QWORD *)&v23 = 138413826;
        v58 = v23;
        v59 = v21;
        v60 = v17;
        do
        {
          v65 = v22;
          for (i = 0; i != v65; ++i)
          {
            if (*(_QWORD *)v77 != v66)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            objc_msgSend(v67, "microLocationProbabilityVector", v58);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "microLocationProbabilityVector");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = ARPMicroLocationSimilarity(v27, v28);

            -[ARPRoutePredictor microLocationSimilarityThreshold](self, "microLocationSimilarityThreshold");
            v31 = v30;
            v32 = oslog;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v26, "interval");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "outputDeviceID");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29 < v31)
                v38 = CFSTR("not ");
              else
                v38 = &stru_1EA7D4DC0;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29 < v31)
                v40 = CFSTR("less");
              else
                v40 = CFSTR("greater");
              v41 = (void *)MEMORY[0x1E0CB37E8];
              -[ARPRoutePredictor microLocationSimilarityThreshold](self, "microLocationSimilarityThreshold");
              objc_msgSend(v41, "numberWithDouble:");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "microLocationProbabilityVector");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)state = v58;
              *(_QWORD *)&state[4] = v62;
              *(_WORD *)&state[12] = 2112;
              *(_QWORD *)&state[14] = v61;
              v99 = 2112;
              v100 = v38;
              v101 = 2112;
              v102 = v39;
              v103 = 2112;
              v104 = v40;
              v105 = 2112;
              v106 = v42;
              v107 = 2112;
              v108 = v43;
              _os_log_debug_impl(&dword_1DD793000, oslog, OS_LOG_TYPE_DEBUG, "Session from %@ with route %@ is %@included in predictions because microlocation similarity %@ is %@ than threshold (%@), microLocationProbabilityVector: %@", state, 0x48u);

              v21 = v59;
              v17 = v60;

              v32 = oslog;
            }

            if (v29 >= v31)
            {
              objc_msgSend(v26, "outputDeviceID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v33);
              -[NSObject objectForKey:](v69, "objectForKey:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34 == 0;

              if (v35)
              {
                objc_msgSend(v26, "interval");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "endDate");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setObject:forKeyedSubscript:](v69, "setObject:forKeyedSubscript:", v37, v33);

              }
              ++v24;
            }
            if (v24 == 2)
            {
              if (objc_msgSend(v17, "count") == 1)
              {
                v24 = 2;
                goto LABEL_37;
              }
            }
            else if (v24 > 4)
            {
              goto LABEL_37;
            }
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v109, 16);
        }
        while (v22);
      }
LABEL_37:

    }
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v46 = (ARPRoutePrediction *)v17;
    v48 = -[ARPRoutePrediction countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v72, v97, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v73;
      v50 = 2;
      if (v24 > 2)
        v50 = v24;
      v51 = (double)v50;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v73 != v49)
            objc_enumerationMutation(v46);
          v53 = -[ARPRoutePrediction initWithOutputDeviceID:confidence:]([ARPRoutePrediction alloc], "initWithOutputDeviceID:confidence:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j), (double)(unint64_t)-[ARPRoutePrediction countForObject:](v46, "countForObject:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j))/ v51);
          v54 = objc_msgSend(v16, "count");
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __43__ARPRoutePredictor_predictionsForContext___block_invoke_94;
          v70[3] = &unk_1EA7D4838;
          v71 = v69;
          v55 = objc_msgSend(v16, "indexOfObject:inSortedRange:options:usingComparator:", v53, 0, v54, 1024, v70);
          if (v55 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v16, "insertObject:atIndex:", v53, v55);

        }
        v48 = -[ARPRoutePrediction countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v72, v97, 16);
      }
      while (v48);
    }

    v56 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      -[ARPRoutePredictor predictionsForContext:].cold.1();
      v56 = oslog;
    }

    v47 = (void *)objc_msgSend(v16, "copy");
    v6 = v69;
  }
  else
  {
    objc_msgSend(v64, "objectAtIndexedSubscript:");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v44 = [ARPRoutePrediction alloc];
    objc_msgSend(v16, "outputDeviceID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[ARPRoutePrediction initWithOutputDeviceID:confidence:](v44, "initWithOutputDeviceID:confidence:", v45, 1.0);

    v110[0] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ARPRoutePredictor predictionsForContext:].cold.3();
  }

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);

  objc_autoreleasePoolPop(context);
  return v47;
}

uint64_t __43__ARPRoutePredictor_predictionsForContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadPersistedSessions");
}

BOOL __43__ARPRoutePredictor_predictionsForContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "predictionDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "compare:", v6) == 1;

  return v7;
}

void __43__ARPRoutePredictor_predictionsForContext___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "predictionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v10);
  v12 = v11;
  v13 = *(double *)(a1 + 64);

  if (v12 > v13)
    goto LABEL_5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 + 1;
  objc_msgSend(v7, "microLocationProbabilityVector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "microLocationProbabilityVector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = ARPMicroLocationSimilarity(v14, v15);

  objc_msgSend(*(id *)(a1 + 40), "microLocationSimilarityThreshold");
  v18 = v17;
  ARPLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "interval");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outputDeviceID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("less");
    if (v16 < v18)
      v23 = CFSTR("not ");
    else
      v23 = &stru_1EA7D4DC0;
    if (v16 >= v18)
      v22 = CFSTR("greater");
    v27 = v23;
    v28 = v22;
    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "microLocationSimilarityThreshold");
    objc_msgSend(v24, "numberWithDouble:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "microLocationProbabilityVector");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v31 = v20;
    v32 = 2112;
    v33 = v29;
    v34 = 2112;
    v35 = v27;
    v36 = 2112;
    v37 = v21;
    v38 = 2112;
    v39 = v28;
    v40 = 2112;
    v41 = v25;
    v42 = 2112;
    v43 = v26;
    _os_log_debug_impl(&dword_1DD793000, v19, OS_LOG_TYPE_DEBUG, "Session from %@ with route %@ is %@eligible for session continuity because microlocation similarity %@ is %@ than threshold (%@), microLocationProbabilityVector: %@", buf, 0x48u);

  }
  if (v16 >= v18)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
LABEL_5:
    *a4 = 1;
  }

}

uint64_t __43__ARPRoutePredictor_predictionsForContext___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "confidence");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "confidence");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "compare:", v10);

  if (!v11)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v5, "outputDeviceID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v6, "outputDeviceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v17, "compare:", v14);
  }

  return v11;
}

- (id)predictionsWithCurrentContext:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ARPPredictionContext *v11;
  ARPPredictionContext *v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];

  if (!-[ARPRoutePredictor hasLoadedMicroLocation](self, "hasLoadedMicroLocation"))
    -[ARPRoutePredictor _reloadLatestMicroLocationEvent](self, "_reloadLatestMicroLocationEvent");
  -[ARPRoutePredictor latestMicroLocationEvent](self, "latestMicroLocationEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A88], "probabilityVector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[ARPPredictionContext initWithPredictionDate:microLocationEventDate:microLocationProbabilityVector:]([ARPPredictionContext alloc], "initWithPredictionDate:microLocationEventDate:microLocationProbabilityVector:", v6, v7, v10);
    v12 = v11;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
    -[ARPRoutePredictor predictionsForContext:](self, "predictionsForContext:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ARPLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1DD793000, v14, OS_LOG_TYPE_DEFAULT, "No microlocation event to predict airplay routes", v16, 2u);
    }

    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (id)predictionsForCurrentContext
{
  return -[ARPRoutePredictor predictionsWithCurrentContext:](self, "predictionsWithCurrentContext:", 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ARPRoutePredictor file](self, "file");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPRoutePredictor knownOutputDeviceIDs](self, "knownOutputDeviceIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> file: %@, knownOutputDeviceIDs: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSSet)knownOutputDeviceIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKnownOutputDeviceIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)longFormVideoFilter
{
  return self->_longFormVideoFilter;
}

- (void)setLongFormVideoFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int)token
{
  return self->_token;
}

- (NSString)file
{
  return self->_file;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_DKEvent)latestMicroLocationEvent
{
  return (_DKEvent *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLatestMicroLocationEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)sessions
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)routingSessionTimeout
{
  return self->_routingSessionTimeout;
}

- (void)setRoutingSessionTimeout:(double)a3
{
  self->_routingSessionTimeout = a3;
}

- (BOOL)hasLoadedMicroLocation
{
  return self->_hasLoadedMicroLocation;
}

- (void)setHasLoadedMicroLocation:(BOOL)a3
{
  self->_hasLoadedMicroLocation = a3;
}

- (double)microLocationSimilarityThreshold
{
  return self->_microLocationSimilarityThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_latestMicroLocationEvent, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_longFormVideoFilter, 0);
  objc_storeStrong((id *)&self->_knownOutputDeviceIDs, 0);
}

- (void)predictionsForContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DD793000, v0, v1, "Predicted AirPlay routes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)predictionsForContext:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD793000, log, OS_LOG_TYPE_DEBUG, "No previous routing session matched for session continuity.", v1, 2u);
}

- (void)predictionsForContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DD793000, v0, v1, "Predicted AirPlay routes based on session continuity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)predictionsForContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DD793000, v0, v1, "Predicting airplay routes for context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
