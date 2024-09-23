@implementation MapsSuggestionsETARequester

- (MapsSuggestionsETARequester)initWithNetworkRequester:(id)a3 transportModePredictor:(id)a4 requirements:(id)a5
{
  id v9;
  id v10;
  MapsSuggestionsETARequester *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSLock *v15;
  NSLock *waypointsLock;
  MapsSuggestionsPredictor *v17;
  MapsSuggestionsPredictor *transportModePredictor;
  GEOAutomobileOptions *v19;
  GEOAutomobileOptions *automobileOptions;
  GEOAutomobileOptions *v21;
  void *v22;
  void *v23;
  void *v24;
  int AppBooleanValueWithContainer;
  uint64_t v26;
  objc_super v28;
  id location;

  v9 = a3;
  objc_initWeak(&location, a4);
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MapsSuggestionsETARequester;
  v11 = -[MapsSuggestionsETARequester init](&v28, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("MapsSuggestionsETARequester", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    v11->_forcedTransportMode = 4;
    objc_storeStrong((id *)&v11->_networkRequester, a3);
    objc_storeStrong((id *)&v11->_etaRequirements, a5);
    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    waypointsLock = v11->_waypointsLock;
    v11->_waypointsLock = v15;

    if (GEOConfigGetBOOL())
    {
      v17 = (MapsSuggestionsPredictor *)objc_loadWeakRetained(&location);
      transportModePredictor = v11->_transportModePredictor;
      v11->_transportModePredictor = v17;

    }
    v19 = (GEOAutomobileOptions *)objc_alloc_init(MEMORY[0x1E0D26F18]);
    automobileOptions = v11->_automobileOptions;
    v11->_automobileOptions = v19;

    v21 = v11->_automobileOptions;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    AppBooleanValueWithContainer = _CFPreferencesGetAppBooleanValueWithContainer();

    if (AppBooleanValueWithContainer)
      v26 = 1;
    else
      v26 = 3;
    -[GEOAutomobileOptions setTrafficType:](v21, "setTrafficType:", v26);
  }

  objc_destroyWeak(&location);
  return v11;
}

- (void)setAutomobileOptions:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MapsSuggestionsETARequester_setAutomobileOptions___block_invoke;
  block[3] = &unk_1E4BCDB40;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__MapsSuggestionsETARequester_setAutomobileOptions___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v4 = (void *)WeakRetained[10];
    WeakRetained[10] = v3;

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsETARequester.m";
      v8 = 1026;
      v9 = 105;
      v10 = 2082;
      v11 = "-[MapsSuggestionsETARequester setAutomobileOptions:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (BOOL)ETAsFromLocation:(id)a3 toEntries:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *queue;
  id v19;
  id v20;
  BOOL v21;
  NSObject *v22;
  const char *v23;
  _QWORD block[4];
  id v26;
  id v27;
  MapsSuggestionsETARequester *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _BYTE v34[14];
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      v33 = 1024;
      *(_DWORD *)v34 = 114;
      *(_WORD *)&v34[4] = 2082;
      *(_QWORD *)&v34[6] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]";
      v35 = 2082;
      v36 = "nil == (completion)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_13:
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x26u);
    }
LABEL_14:

LABEL_15:
    v21 = 0;
    goto LABEL_16;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      v33 = 1024;
      *(_DWORD *)v34 = 115;
      *(_WORD *)&v34[4] = 2082;
      *(_QWORD *)&v34[6] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]";
      v35 = 2082;
      v36 = "nil == (location)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a current location";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v11 = objc_msgSend(v9, "count");
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      v33 = 1024;
      *(_DWORD *)v34 = 116;
      *(_WORD *)&v34[4] = 2082;
      *(_QWORD *)&v34[6] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]";
      v35 = 2082;
      v36 = "0u == [entries count]";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a least one suggestions entry", buf, 0x26u);
    }

    goto LABEL_15;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsETARequester uniqueName](self, "uniqueName");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v14;
    v33 = 2080;
    *(_QWORD *)v34 = "ETAsFromLocation";
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ETAsFromLocation", ", buf, 2u);
  }

  v16 = (void *)objc_msgSend(v8, "copy");
  v17 = (void *)objc_msgSend(v9, "copy");
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MapsSuggestionsETARequester_ETAsFromLocation_toEntries_completion___block_invoke;
  block[3] = &unk_1E4BCDB90;
  objc_copyWeak(&v30, (id *)buf);
  v26 = v16;
  v28 = self;
  v29 = v10;
  v27 = v17;
  v19 = v17;
  v20 = v16;
  dispatch_async(queue, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
  v21 = 1;
LABEL_16:

  return v21;
}

void __69__MapsSuggestionsETARequester_ETAsFromLocation_toEntries_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  id *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  double v45;
  dispatch_time_t v46;
  intptr_t v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  uint64_t v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  char *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  NSObject *v92;
  id *v93;
  id v94;
  uint64_t v95;
  _QWORD *v96;
  dispatch_group_t group;
  NSObject *groupa;
  id obj;
  id obja;
  id objb;
  id val;
  _QWORD v103[2];
  void (*v104)(uint64_t, void *);
  void *v105;
  id v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE *v112;
  id v113[2];
  id from;
  _BYTE block[40];
  _BYTE *v116;
  id v117[2];
  uint8_t v118[4];
  uint64_t v119;
  __int16 v120;
  void *v121;
  uint8_t v122[4];
  char *v123;
  __int16 v124;
  _BYTE v125[14];
  __int16 v126;
  const char *v127;
  uint8_t buf[32];
  __int128 v129;
  __int128 v130;
  _BYTE location[24];
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint64_t v135;
  CLLocationCoordinate2D v136;

  v135 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  val = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v95 = a1;
    v5 = *(id *)(a1 + 32);
    if (v5)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)v4 + 1));
      if (*((_QWORD *)v4 + 6) && (objc_msgSend(v5, "isEqual:", *((_QWORD *)v4 + 5)) & 1) != 0)
      {
LABEL_8:
        v93 = v2;

        v17 = *(id *)(v95 + 40);
        objc_msgSend(*((id *)v4 + 8), "lock");
        obj = *((id *)v4 + 7);
        objc_msgSend(*((id *)v4 + 8), "unlock");
        group = (dispatch_group_t)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v17, "count"));
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
        v20 = 0;
        if (v19)
        {
          v21 = *(_QWORD *)v109;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v109 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
              if (objc_msgSend(v23, "containsKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey"))
                && objc_msgSend(v23, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")))
              {
                MapsSuggestionsDestinationKey(v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(obj, "objectForKeyedSubscript:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  -[NSObject setObject:forKeyedSubscript:](group, "setObject:forKeyedSubscript:", v25, v24);
                }
                else
                {
                  GEOFindOrCreateLog();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(obj, "allKeys");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v23;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v27;
                    _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_DEBUG, "No existing waypoint for entry: %@. Existing waypoint identifiers: %@", buf, 0x16u);

                  }
                  v20 = 1;
                }

              }
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
          }
          while (v19);
        }

        objc_msgSend(*((id *)val + 8), "lock");
        v28 = (void *)*((_QWORD *)val + 7);
        *((_QWORD *)val + 7) = group;
        v29 = group;

        objc_msgSend(*((id *)val + 8), "unlock");
        if ((v20 & 1) == 0)
        {
LABEL_71:
          v60 = *(void **)(v95 + 40);
          v103[0] = MEMORY[0x1E0C809B0];
          v103[1] = 3221225472;
          v104 = __69__MapsSuggestionsETARequester_ETAsFromLocation_toEntries_completion___block_invoke_96;
          v105 = &unk_1E4BCDB68;
          objc_copyWeak(&v107, v93);
          v106 = *(id *)(v95 + 56);
          v94 = v60;
          v96 = v103;
          dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
          v61 = objc_alloc(MEMORY[0x1E0D26F18]);
          objc_msgSend(*((id *)val + 10), "data");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objb = (id)objc_msgSend(v61, "initWithData:", v62);

          GEOFindOrCreateLog();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(val, "uniqueName");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)location = 138412546;
            *(_QWORD *)&location[4] = v64;
            *(_WORD *)&location[12] = 2080;
            *(_QWORD *)&location[14] = "_requestETAs";
            _os_log_impl(&dword_1A427D000, v63, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", location, 0x16u);

          }
          GEOFindOrCreateLog();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v65))
          {
            *(_WORD *)location = 0;
            _os_signpost_emit_with_name_impl(&dword_1A427D000, v65, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_requestETAs", ", location, 2u);
          }

          if (*((_QWORD *)val + 6))
          {
            objc_msgSend(*((id *)val + 8), "lock");
            v66 = objc_msgSend(*((id *)val + 7), "count");
            objc_msgSend(*((id *)val + 8), "unlock");
            if (v66)
            {
              objc_initWeak(&from, val);
              *(_QWORD *)location = 0;
              *(_QWORD *)&location[8] = location;
              *(_QWORD *)&location[16] = 0x3032000000;
              v132 = __Block_byref_object_copy_;
              v133 = __Block_byref_object_dispose_;
              v134 = 0;
              v67 = dispatch_group_create();
              memset(buf, 0, sizeof(buf));
              v129 = 0u;
              v130 = 0u;
              v68 = v94;
              v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", buf, v122, 16);
              if (v69)
              {
                v70 = **(_QWORD **)&buf[16];
                do
                {
                  for (j = 0; j != v69; ++j)
                  {
                    if (**(_QWORD **)&buf[16] != v70)
                      objc_enumerationMutation(v68);
                    v72 = *(void **)(*(_QWORD *)&buf[8] + 8 * j);
                    objc_msgSend(*((id *)val + 8), "lock");
                    v73 = (void *)*((_QWORD *)val + 7);
                    MapsSuggestionsDestinationKey(v72);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "objectForKeyedSubscript:", v74);
                    v75 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(*((id *)val + 8), "unlock");
                    if (v75)
                    {
                      dispatch_group_enter(v67);
                      v76 = (void *)*((_QWORD *)val + 5);
                      *(_QWORD *)&v108 = MEMORY[0x1E0C809B0];
                      *((_QWORD *)&v108 + 1) = 3221225472;
                      *(_QWORD *)&v109 = __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke;
                      *((_QWORD *)&v109 + 1) = &unk_1E4BCDCA8;
                      v112 = location;
                      v77 = v67;
                      *(_QWORD *)&v110 = v77;
                      objc_copyWeak(v113, &from);
                      *((_QWORD *)&v110 + 1) = v75;
                      *(_QWORD *)&v111 = objb;
                      *((_QWORD *)&v111 + 1) = v72;
                      if ((-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]((uint64_t)val, v76, v72, &v108) & 1) == 0)
                      {
                        GEOFindOrCreateLog();
                        v78 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                        {
                          v79 = *((_QWORD *)val + 5);
                          *(_DWORD *)v118 = 138412546;
                          v119 = v79;
                          v120 = 2112;
                          v121 = v72;
                          _os_log_impl(&dword_1A427D000, v78, OS_LOG_TYPE_ERROR, "Could not determine transportType for input: %@, %@", v118, 0x16u);
                        }

                        dispatch_group_leave(v77);
                      }

                      objc_destroyWeak(v113);
                    }

                  }
                  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", buf, v122, 16);
                }
                while (v69);
              }

              v80 = *((_QWORD *)val + 1);
              *(_QWORD *)block = MEMORY[0x1E0C809B0];
              *(_QWORD *)&block[8] = 3221225472;
              *(_QWORD *)&block[16] = __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke_124;
              *(_QWORD *)&block[24] = &unk_1E4BCDCD0;
              objc_copyWeak(v117, &from);
              *(_QWORD *)&block[32] = v96;
              v116 = location;
              dispatch_group_notify(v67, v80, block);

              objc_destroyWeak(v117);
              _Block_object_dispose(location, 8);

              objc_destroyWeak(&from);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("Had no Waypoints at all"));
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v104((uint64_t)v96, v89);
              GEOFindOrCreateLog();
              v90 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(val, "uniqueName");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)location = 138412546;
                *(_QWORD *)&location[4] = v91;
                *(_WORD *)&location[12] = 2080;
                *(_QWORD *)&location[14] = "_requestETAs";
                _os_log_impl(&dword_1A427D000, v90, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", location, 0x16u);

              }
              GEOFindOrCreateLog();
              v92 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v92))
              {
                *(_WORD *)location = 0;
                _os_signpost_emit_with_name_impl(&dword_1A427D000, v92, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_requestETAs", ", location, 2u);
              }

            }
          }
          else
          {
            GEOFindOrCreateLog();
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)location = 0;
              _os_log_impl(&dword_1A427D000, v81, OS_LOG_TYPE_DEBUG, "CurrentLocation was nil", location, 2u);
            }

            GEOFindOrCreateLog();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(val, "uniqueName");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)location = 138412546;
              *(_QWORD *)&location[4] = v83;
              *(_WORD *)&location[12] = 2080;
              *(_QWORD *)&location[14] = "_requestETAs";
              _os_log_impl(&dword_1A427D000, v82, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", location, 0x16u);

            }
            GEOFindOrCreateLog();
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v84))
            {
              *(_WORD *)location = 0;
              _os_signpost_emit_with_name_impl(&dword_1A427D000, v84, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_requestETAs", ", location, 2u);
            }

            GEOFindOrCreateLog();
            v85 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(*(id *)(v95 + 48), "uniqueName");
              v86 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v122 = 138412546;
              v123 = v86;
              v124 = 2080;
              *(_QWORD *)v125 = "ETAsFromLocation";
              _os_log_impl(&dword_1A427D000, v85, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", v122, 0x16u);

            }
            GEOFindOrCreateLog();
            v87 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v87))
            {
              *(_WORD *)v122 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A427D000, v87, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ETAsFromLocation", ", v122, 2u);
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("Could not request ETA for this Entry"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(*(_QWORD *)(v95 + 56) + 16))();

          }
          objc_destroyWeak(&v107);
          goto LABEL_109;
        }
        v30 = *(id *)(v95 + 40);
        if (!v30)
        {
          GEOFindOrCreateLog();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)block = 136446978;
            *(_QWORD *)&block[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
            *(_WORD *)&block[12] = 1024;
            *(_DWORD *)&block[14] = 243;
            *(_WORD *)&block[18] = 2082;
            *(_QWORD *)&block[20] = "-[MapsSuggestionsETARequester _requestWaypointsForEntries:]";
            *(_WORD *)&block[28] = 2082;
            *(_QWORD *)&block[30] = "nil == (entries)";
            _os_log_impl(&dword_1A427D000, v57, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestions entries", block, 0x26u);
          }

          goto LABEL_70;
        }
        v31 = v30;
        dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
        GEOFindOrCreateLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(val, "uniqueName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)block = 138412546;
          *(_QWORD *)&block[4] = v33;
          *(_WORD *)&block[12] = 2080;
          *(_QWORD *)&block[14] = "_requestWaypointsForEntries";
          _os_log_impl(&dword_1A427D000, v32, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", block, 0x16u);

        }
        GEOFindOrCreateLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v34))
        {
          *(_WORD *)block = 0;
          _os_signpost_emit_with_name_impl(&dword_1A427D000, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_requestWaypointsForEntries", ", block, 2u);
        }

        groupa = dispatch_group_create();
        objc_initWeak((id *)location, val);
        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        obja = v31;
        v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
        v36 = (id *)val;
        if (v35)
        {
          v37 = *(_QWORD *)v109;
          do
          {
            for (k = 0; k != v35; ++k)
            {
              if (*(_QWORD *)v109 != v37)
                objc_enumerationMutation(obja);
              v39 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
              if ((objc_msgSend(v39, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")) & 1) != 0)
              {
                MapsSuggestionsDestinationKey(v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36[8], "lock");
                objc_msgSend(v36[7], "objectForKeyedSubscript:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36[8], "unlock");
                if (!v41)
                {
                  dispatch_group_enter(groupa);
                  v42 = (void *)*((_QWORD *)val + 2);
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __59__MapsSuggestionsETARequester__requestWaypointsForEntries___block_invoke;
                  *(_QWORD *)&buf[24] = &unk_1E4BCDBB8;
                  v43 = groupa;
                  *(_QWORD *)&v129 = v43;
                  objc_copyWeak((id *)&v130, (id *)location);
                  *((_QWORD *)&v129 + 1) = v40;
                  if ((GEOComposedWaypointFromMapsSuggestionsEntry(v39, v42, buf) & 1) == 0)
                  {
                    GEOFindOrCreateLog();
                    v44 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)block = 136315138;
                      *(_QWORD *)&block[4] = "-[MapsSuggestionsETARequester _requestWaypointsForEntries:]";
                      _os_log_impl(&dword_1A427D000, v44, OS_LOG_TYPE_ERROR, "%s will not call back", block, 0xCu);
                    }

                    dispatch_group_leave(v43);
                  }

                  objc_destroyWeak((id *)&v130);
                }

                v36 = (id *)val;
              }
            }
            v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
          }
          while (v35);
        }

        GEOConfigGetDouble();
        v46 = dispatch_time(0, (uint64_t)(v45 * 1000000000.0));
        v47 = dispatch_group_wait(groupa, v46);
        if (v47)
        {
          GEOFindOrCreateLog();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)block = 0;
            _os_log_impl(&dword_1A427D000, v48, OS_LOG_TYPE_ERROR, "Timeout on getting waypoints", block, 2u);
          }

          GEOFindOrCreateLog();
          v49 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(val, "uniqueName");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)block = 138412546;
            *(_QWORD *)&block[4] = v50;
            *(_WORD *)&block[12] = 2080;
            *(_QWORD *)&block[14] = "_requestWaypointsForEntries";
            _os_log_impl(&dword_1A427D000, v49, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", block, 0x16u);

          }
          GEOFindOrCreateLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v51))
          {
            *(_WORD *)block = 0;
LABEL_68:
            _os_signpost_emit_with_name_impl(&dword_1A427D000, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_requestWaypointsForEntries", ", block, 2u);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v58 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(val, "uniqueName");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)block = 138412546;
            *(_QWORD *)&block[4] = v59;
            *(_WORD *)&block[12] = 2080;
            *(_QWORD *)&block[14] = "_requestWaypointsForEntries";
            _os_log_impl(&dword_1A427D000, v58, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", block, 0x16u);

          }
          GEOFindOrCreateLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v51))
          {
            *(_WORD *)block = 0;
            goto LABEL_68;
          }
        }

        objc_destroyWeak((id *)location);
        if (v47)
        {
LABEL_70:
          v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not make waypoints for all Entries: %@"), *(_QWORD *)(v95 + 40));
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -19, v54);
          v55 = objc_claimAutoreleasedReturnValue();
          goto LABEL_59;
        }
        goto LABEL_71;
      }
      objc_msgSend(v5, "coordinate");
      if (CLLocationCoordinate2DIsValid(v136))
      {
        v6 = v2;
        objc_msgSend(v5, "coordinate");
        v8 = v7;
        objc_msgSend(v5, "coordinate");
        v10 = v9;
        v11 = objc_msgSend(v5, "copy");
        v4 = val;
        v12 = (void *)*((_QWORD *)val + 5);
        *((_QWORD *)val + 5) = v11;

        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithGEOCoordinate:", v8, v10);
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D26FF8]), "initWithLocation:isCurrentLocation:", v13, 1);
          v16 = (void *)*((_QWORD *)val + 6);
          *((_QWORD *)val + 6) = v15;

          v2 = v6;
          goto LABEL_8;
        }

LABEL_58:
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not make waypoint for location: %@"), *(_QWORD *)(v95 + 32));
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, v54);
        v55 = objc_claimAutoreleasedReturnValue();
LABEL_59:
        v56 = (void *)v55;
        (*(void (**)(void))(*(_QWORD *)(v95 + 56) + 16))();

        goto LABEL_109;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v122 = 136446978;
        v123 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
        v124 = 1024;
        *(_DWORD *)v125 = 214;
        *(_WORD *)&v125[4] = 2082;
        *(_QWORD *)&v125[6] = "-[MapsSuggestionsETARequester _requestWaypointForCurrentLocation:]";
        v126 = 2082;
        v127 = "nil == (location)";
        _os_log_impl(&dword_1A427D000, v53, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", v122, 0x26u);
      }

    }
    goto LABEL_58;
  }
  GEOFindOrCreateLog();
  v52 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v122 = 136446722;
    v123 = "MapsSuggestionsETARequester.m";
    v124 = 1026;
    *(_DWORD *)v125 = 126;
    *(_WORD *)&v125[4] = 2082;
    *(_QWORD *)&v125[6] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v52, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v122, 0x1Cu);
  }

LABEL_109:
}

void __69__MapsSuggestionsETARequester_ETAsFromLocation_toEntries_completion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  char *v11;
  __int16 v12;
  _WORD v13[17];

  *(_QWORD *)&v13[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v7;
      v12 = 2080;
      *(_QWORD *)v13 = "ETAsFromLocation";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ETAsFromLocation", ", (uint8_t *)&v10, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = v5;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsETARequester.m";
      v12 = 1026;
      *(_DWORD *)v13 = 150;
      v13[2] = 2082;
      *(_QWORD *)&v13[3] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

void __59__MapsSuggestionsETARequester__requestWaypointsForEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  id *WeakRetained;
  id *v9;
  NSObject *v10;
  int v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Error fetching waypoint: %@", (uint8_t *)&v11, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained[8], "lock");
      objc_msgSend(v9[7], "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));
      objc_msgSend(v9[8], "unlock");
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
    else
    {
      GEOFindOrCreateLog();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 136446722;
        v12 = "MapsSuggestionsETARequester.m";
        v13 = 1026;
        v14 = 275;
        v15 = 2082;
        v16 = "-[MapsSuggestionsETARequester _requestWaypointsForEntries:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
      }

    }
  }

}

- (BOOL)transportTypeFromLocation:(id)a3 toEntry:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  NSObject *v12;
  const char *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
    v17 = 1024;
    v18 = 304;
    v19 = 2082;
    v20 = "-[MapsSuggestionsETARequester transportTypeFromLocation:toEntry:completion:]";
    v21 = 2082;
    v22 = "nil == (completion)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x26u);
    goto LABEL_12;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
    v17 = 1024;
    v18 = 305;
    v19 = 2082;
    v20 = "-[MapsSuggestionsETARequester transportTypeFromLocation:toEntry:completion:]";
    v21 = 2082;
    v22 = "nil == (location)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a current location";
    goto LABEL_11;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      v17 = 1024;
      v18 = 306;
      v19 = 2082;
      v20 = "-[MapsSuggestionsETARequester transportTypeFromLocation:toEntry:completion:]";
      v21 = 2082;
      v22 = "nil == (entry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destinationd entry";
      goto LABEL_11;
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  v11 = -[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]((uint64_t)self, v8, v9, v10);
LABEL_13:

  return v11;
}

- (uint64_t)_determineTransportTypeFromOrigin:(void *)a3 toEntry:(void *)a4 completion:
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  NSObject *v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  dispatch_group_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  int v36;
  NSObject *v37;
  char *v38;
  NSObject *v40;
  char *v41;
  NSObject *v42;
  char *v43;
  NSObject *v44;
  char *v45;
  _QWORD block[4];
  id v47;
  dispatch_group_t v48;
  id v49;
  void (**v50)(id, uint64_t, _QWORD);
  id v51[5];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  _BYTE v55[14];
  __int16 v56;
  const char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_26;
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v53 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      v54 = 1024;
      *(_DWORD *)v55 = 319;
      *(_WORD *)&v55[4] = 2082;
      *(_QWORD *)&v55[6] = "-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]";
      v56 = 2082;
      v57 = "nil == (completion)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    goto LABEL_26;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v53 = v12;
    v54 = 2080;
    *(_QWORD *)v55 = "_determineTransportTypeFromOrigin";
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", ", buf, 2u);
  }

  if (v7 && v8)
  {
    if (objc_msgSend(v8, "type") == 11)
    {
      if ((objc_msgSend(v8, "containsKey:", CFSTR("MapsSuggestionsTransportTypeKey")) & 1) == 0)
      {
        GEOFindOrCreateLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "Resume Route should always have a transport type key, falling back to Automobile", buf, 2u);
        }

        objc_msgSend(v8, "setNumber:forKey:", &unk_1E4C09728, CFSTR("MapsSuggestionsTransportTypeKey"));
      }
      GEOFindOrCreateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "Entry type is resume route, using the transport type key.", buf, 2u);
      }

      objc_msgSend(v8, "numberForKey:", CFSTR("MapsSuggestionsTransportTypeKey"));
      v16 = objc_claimAutoreleasedReturnValue();
      v9[2](v9, -[NSObject intValue](v16, "intValue"), 0);
LABEL_45:

      goto LABEL_46;
    }
    if (*(_DWORD *)(a1 + 72) != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNumber:forKey:", v34, CFSTR("MapsSuggestionsTransportTypeKey"));

      v9[2](v9, *(unsigned int *)(a1 + 72), 0);
      GEOFindOrCreateLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v36 = *(_DWORD *)(a1 + 72);
        *(_DWORD *)buf = 67109120;
        LODWORD(v53) = v36;
        _os_log_impl(&dword_1A427D000, v35, OS_LOG_TYPE_DEBUG, "Forcing transport type: %d", buf, 8u);
      }

      GEOFindOrCreateLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "uniqueName");
        v38 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = v38;
        v54 = 2080;
        *(_QWORD *)v55 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A427D000, v37, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", ", buf, 2u);
      }
      goto LABEL_45;
    }
    objc_msgSend(v7, "coordinate");
    v22 = v21;
    objc_msgSend(v7, "coordinate");
    if (v23 < -180.0 || (v24 = v23, v23 > 180.0) || *(double *)&v22 < -90.0 || *(double *)&v22 > 90.0)
    {
      GEOFindOrCreateLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "uniqueName");
        v41 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = v41;
        v54 = 2080;
        *(_QWORD *)v55 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A427D000, v40, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v19))
        goto LABEL_25;
      *(_WORD *)buf = 0;
    }
    else if (objc_msgSend(v8, "containsKey:", CFSTR("MapsSuggestionsLatitudeKey"))
           && (objc_msgSend(v8, "containsKey:", CFSTR("MapsSuggestionsLongitudeKey")) & 1) != 0)
    {
      objc_msgSend(v8, "numberForKey:", CFSTR("MapsSuggestionsLatitudeKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;
      objc_msgSend(v8, "numberForKey:", CFSTR("MapsSuggestionsLongitudeKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;

      if (*(double *)&v30 >= -180.0 && *(double *)&v30 <= 180.0 && *(double *)&v27 >= -90.0 && *(double *)&v27 <= 90.0)
      {
        v31 = dispatch_group_create();
        objc_initWeak((id *)buf, (id)a1);
        v32 = *(NSObject **)(a1 + 8);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke;
        block[3] = &unk_1E4BCDC58;
        objc_copyWeak(v51, (id *)buf);
        v51[1] = v22;
        v51[2] = *(id *)&v24;
        v51[3] = v27;
        v51[4] = v30;
        v47 = v8;
        v50 = v9;
        v48 = v31;
        v49 = v7;
        v33 = v31;
        dispatch_async(v32, block);

        objc_destroyWeak(v51);
        objc_destroyWeak((id *)buf);
LABEL_46:
        v20 = 1;
        goto LABEL_47;
      }
      GEOFindOrCreateLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "uniqueName");
        v45 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = v45;
        v54 = 2080;
        *(_QWORD *)v55 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A427D000, v44, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v19))
        goto LABEL_25;
      *(_WORD *)buf = 0;
    }
    else
    {
      GEOFindOrCreateLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "uniqueName");
        v43 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = v43;
        v54 = 2080;
        *(_QWORD *)v55 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v19))
        goto LABEL_25;
      *(_WORD *)buf = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v18;
      v54 = 2080;
      *(_QWORD *)v55 = "_determineTransportTypeFromOrigin";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v19))
      goto LABEL_25;
    *(_WORD *)buf = 0;
  }
  _os_signpost_emit_with_name_impl(&dword_1A427D000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", ", buf, 2u);
LABEL_25:

LABEL_26:
  v20 = 0;
LABEL_47:

  return v20;
}

void __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _BYTE *v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  _BYTE *v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint8_t v35[4];
  void *v36;
  __int16 v37;
  const char *v38;
  _BYTE buf[28];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    *(_DWORD *)&buf[24] = 4;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 4;
    v5 = objc_msgSend(MEMORY[0x1E0D270E8], "idealTransportTypeForOrigin:destination:mapType:", objc_msgSend(WeakRetained, "mapType"), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    if ((unint64_t)(v5 - 1) > 3)
      v6 = 0;
    else
      v6 = dword_1A43B3170[v5 - 1];
    *((_DWORD *)v32 + 6) = v6;
    if ((GEOConfigGetBOOL() & 1) != 0)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v8 = (void *)v4[3];
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "coordinate");
      v11 = v10;
      v13 = v12;
      v14 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_111;
      v27[3] = &unk_1E4BCDC08;
      objc_copyWeak(&v30, v2);
      v28 = *(id *)(a1 + 40);
      v29 = buf;
      objc_msgSend(v8, "predictedTransportModeForDestinationEntry:originCoordinate:handler:", v9, v27, v11, v13);
      v15 = v4[1];
      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_114;
      v22[3] = &unk_1E4BCDC30;
      v25 = buf;
      v26 = &v31;
      v22[4] = v4;
      v16 = *(NSObject **)(a1 + 40);
      v23 = *(id *)(a1 + 32);
      v24 = *(id *)(a1 + 56);
      dispatch_group_notify(v16, v15, v22);

      objc_destroyWeak(&v30);
    }
    else
    {
      v17 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v32 + 6));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNumber:forKey:", v18, CFSTR("MapsSuggestionsTransportTypeKey"));

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      GEOFindOrCreateLog();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "uniqueName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v35 = 138412546;
        v36 = v20;
        v37 = 2080;
        v38 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", v35, 0x16u);

      }
      GEOFindOrCreateLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)v35 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", ", v35, 2u);
      }

    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsETARequester.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 373;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_112;
    v13[3] = &unk_1E4BCDBE0;
    v14 = v6;
    v15 = v5;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v16 = v10;
    v17 = v11;
    dispatch_async(v9, v13);

    v12 = v14;
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "MapsSuggestionsETARequester.m";
      v20 = 1026;
      v21 = 395;
      v22 = 2082;
      v23 = "-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_112(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || !objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_ERROR, "Could not predict transport mode. Error: %@", (uint8_t *)&v9, 0xCu);

    }
LABEL_4:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = (id)objc_opt_class();
      v8 = v10;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_ERROR, "Unexpected class type for predicted transport mode. Error: %@", (uint8_t *)&v9, 0xCu);

    }
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v6, "intValue");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_114(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsLogPredictedTransportModeForEntry(v2, v3, v5, *(void **)(a1 + 40));

  if (GEOConfigGetBOOL())
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315138;
      v15 = "-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Using MSg PTM in %s", (uint8_t *)&v14, 0xCu);
    }

    v7 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if ((_DWORD)v7 == 4)
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "Could not set predicted transport mode.", (uint8_t *)&v14, 2u);
      }

      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24);
      v7 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumber:forKey:", v10, CFSTR("MapsSuggestionsTransportTypeKey"));

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 2080;
    v17 = "_determineTransportTypeFromOrigin";
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v14, 0x16u);

  }
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", ", (uint8_t *)&v14, 2u);
  }

}

void __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char *v6;
  NSObject *v7;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  int v24;
  uint8_t buf[4];
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Could not determine transportType: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = (char *)*((_QWORD *)WeakRetained + 5);
        *(_DWORD *)buf = 138412290;
        v26 = v11;
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Sending ETA Request (current location: %@)", buf, 0xCu);
      }

      v12 = *((id *)WeakRetained + 6);
      v13 = (void *)objc_msgSend(*((id *)WeakRetained + 5), "copy");
      v18 = (void *)*((_QWORD *)WeakRetained + 2);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke_118;
      v19[3] = &unk_1E4BCDC80;
      objc_copyWeak(&v23, (id *)(a1 + 72));
      v16 = *(_QWORD *)(a1 + 64);
      v19[4] = *(_QWORD *)(a1 + 56);
      v22 = v16;
      v20 = *(id *)(a1 + 32);
      v24 = a2;
      v17 = v13;
      v21 = v17;
      objc_msgSend(v18, "ETAFromWaypoint:toWaypoint:transportType:automobileOptions:completion:", v12, v14, a2, v15, v19);

      objc_destroyWeak(&v23);
    }
    else
    {
      v17 = v9;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v26 = "MapsSuggestionsETARequester.m";
        v27 = 1026;
        v28 = 496;
        v29 = 2082;
        v30 = "-[MapsSuggestionsETARequester _requestETAsToEntries:completion:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }
      v12 = v17;
    }

  }
}

void __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  MapsSuggestionsETA *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MapsSuggestionsETA *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      if (objc_msgSend(v6, "code") == -8
        && (objc_msgSend(v6, "domain"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            GEOErrorDomain(),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v18, "isEqualToString:", v19),
            v19,
            v18,
            v20))
      {
        GEOFindOrCreateLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_INFO, "No ETA/Route available", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsRoutingNotAvailableKey"));
        objc_msgSend(*(id *)(a1 + 32), "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
      }
      else
      {
        GEOFindOrCreateLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v6;
          _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "ETA request failed: %@", buf, 0xCu);
        }

      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "containsKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey"))
           && objc_msgSend(*(id *)(a1 + 32), "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")))
    {
      if ((objc_msgSend(v5, "isSuccess") & 1) != 0)
      {
        objc_msgSend(v5, "seconds");
        v9 = v8;
        objc_msgSend(v5, "shortTrafficString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "longTrafficString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "writtenRouteName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "spokenRouteName");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = [MapsSuggestionsETA alloc];
        v13 = *(unsigned int *)(a1 + 72);
        v28 = *(_QWORD *)(a1 + 48);
        MapsSuggestionsNow();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)v11;
        v16 = -[MapsSuggestionsETA initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:](v12, "initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:", v30, v29, v10, v11, v13, v28, v9, v14);

        objc_msgSend(*(id *)(a1 + 32), "setETA:forKey:", v16, CFSTR("MapsSuggestionsETAKey"));
      }
      else
      {
        GEOFindOrCreateLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = *(char **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v32 = v24;
          _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "ETA Request failed specificantly for %@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "setETA:forKey:", 0, CFSTR("MapsSuggestionsETAKey"));
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Failed significantly in the result"));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v32 = "MapsSuggestionsETARequester.m";
      v33 = 1026;
      v34 = 508;
      v35 = 2082;
      v36 = "-[MapsSuggestionsETARequester _requestETAsToEntries:completion:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke_124(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v5;
      v10 = 2080;
      *(_QWORD *)v11 = "_requestETAs";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_requestETAs", ", (uint8_t *)&v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsETARequester.m";
      v10 = 1026;
      *(_DWORD *)v11 = 569;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsETARequester _requestETAsToEntries:completion:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (void)forceTransportType:(int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  int v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MapsSuggestionsETARequester_forceTransportType___block_invoke;
  v4[3] = &unk_1E4BCDCF8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __50__MapsSuggestionsETARequester_forceTransportType___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 72) = *(_DWORD *)(result + 40);
  return result;
}

- (id)networkRequester
{
  return self->_networkRequester;
}

- (int)mapType
{
  return self->_mapType;
}

- (void)setMapType:(int)a3
{
  self->_mapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_waypointsLock, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_currentLocationWaypoint, 0);
  objc_storeStrong((id *)&self->_currentLocationUsed, 0);
  objc_storeStrong((id *)&self->_etaRequirements, 0);
  objc_storeStrong((id *)&self->_transportModePredictor, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
