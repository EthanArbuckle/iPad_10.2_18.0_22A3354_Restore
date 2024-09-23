@implementation GEOOfflineStateManager

+ (BOOL)isCohortAllowed:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *global_queue;
  uint64_t v9;
  void *v10;
  char v11;

  v3 = a3;
  os_unfair_lock_lock(&stru_1ECDBBDBC);
  if (!qword_1ECDBBDD0)
  {
    _getValue(GeoOfflineConfig_CohortAllowList, (uint64_t)off_1EDF4E878, 1, 0, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECDBBDD8;
    qword_1ECDBBDD8 = v4;

    v6 = GeoOfflineConfig_CohortAllowList;
    v7 = off_1EDF4E878;
    global_queue = (void *)geo_get_global_queue();
    _GEOConfigAddBlockListenerForKey(v6, (uint64_t)v7, global_queue, &__block_literal_global_58_0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)qword_1ECDBBDD0;
    qword_1ECDBBDD0 = v9;

  }
  v11 = objc_msgSend((id)qword_1ECDBBDD8, "containsObject:", v3);
  os_unfair_lock_unlock(&stru_1ECDBBDBC);

  return v11;
}

+ (GEOOfflineStateManager)shared
{
  if (qword_1ECDBBDC8 != -1)
    dispatch_once(&qword_1ECDBBDC8, &__block_literal_global_67);
  return (GEOOfflineStateManager *)(id)qword_1ECDBBDC0;
}

- (void)reportResponse:(id)a3 usedInterfaces:(unint64_t)a4 requestMode:(int)a5 forCohortId:(id)a6 duration:(double)a7 error:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;

  v10 = *(_QWORD *)&a5;
  v15 = a6;
  v14 = a8;
  if ((objc_msgSend(v15, "isEqual:", CFSTR("com.apple.Maps")) & 1) != 0
    && shouldCountRequest(*(_QWORD *)&a3, v10))
  {
    -[GEOOfflineStateManager _reportResponse:usedInterfaces:requestMode:forCohortId:duration:error:]((uint64_t)self, *(_QWORD *)&a3, a4, a7, v10, v15, v14);
  }

}

- (void)reportTileResponse:(uint64_t)a3 usedInterfaces:(uint64_t)a4 forCohortId:(uint64_t)a5 duration:(void *)a6 error:(void *)a7
{
  id v12;
  uint64_t v13;
  BOOL v15;
  id v16;
  unsigned int v17;

  v16 = a6;
  v12 = a7;
  v17 = 0;
  if ((GEOTileKeyStyle(a4, &v17) & 1) != 0)
  {
    v13 = v17;
    v15 = v17 - 11 <= 0x3E && ((1 << (v17 - 11)) & 0x43808C0004000205) != 0 || v17 == 1;
    if (v15 && objc_msgSend(v16, "isEqual:", CFSTR("com.apple.Maps")))
      -[GEOOfflineStateManager _reportResponse:usedInterfaces:requestMode:forCohortId:duration:error:](a1, (v13 << 32) | 0x100, a5, a2, 0, v16, v12);
  }

}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)currentStateForCohortId:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v11;
  int v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v4))
  {
    v6 = 0;
    v11 = 0;
    v9 = 0;
    v7 = 0;
    goto LABEL_20;
  }
  v5 = -[GEOOfflineStateManager _stateForCohort:key:](self, v4, CFSTR("currentState"));
  v6 = BYTE3(v5);
  if (v5 - 1 >= 2)
    v7 = 1;
  else
    v7 = v5;
  if (BYTE1(v5) - 1 >= 2)
    v8 = 1;
  else
    v8 = BYTE1(v5);
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
LABEL_18:
      v9 = v8 << 8;
      goto LABEL_19;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v13 = 67109120;
      v14 = v7;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v13, 8u);
    }
  }
  if (v8 < 2)
    goto LABEL_18;
  if (v8 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v13 = 67109120;
      v14 = v8;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v13, 8u);
    }
    goto LABEL_18;
  }
  v9 = 256;
LABEL_19:
  v11 = 0x10000;
LABEL_20:

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)(v11 | (v6 << 24) | v9 | v7);
}

void __32__GEOOfflineStateManager_shared__block_invoke()
{
  GEOOfflineStateManager *v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t UInteger;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSString *v41;
  void *v42;
  void *v43;
  __int16 v44;
  int v45;
  int v46;
  void *v47;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t global_queue;
  void *v64;
  NSObject *v65;
  void *v66;
  const char *v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  id obj;
  id location;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  objc_super v86;
  __int128 handler;
  void (*v88)(uint64_t);
  void *v89;
  id v90[2];
  uint8_t buf[8];
  uint64_t v92;
  uint64_t (*v93)(uint64_t);
  void *v94;
  id v95;
  const __CFString *v96;
  void *v97;
  uint8_t v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    v0 = [GEOOfflineStateManager alloc];
    if (v0)
    {
      v86.receiver = v0;
      v86.super_class = (Class)GEOOfflineStateManager;
      v1 = objc_msgSendSuper2(&v86, sel_init);
      if (v1)
      {
        *((double *)v1 + 15) = GEOConfigGetDouble(GeoOfflineConfig_StateManagerUpdateInterval, (uint64_t)off_1EDF4E918);
        v2 = geo_isolater_create();
        v3 = (void *)*((_QWORD *)v1 + 1);
        *((_QWORD *)v1 + 1) = v2;

        -[GEOOfflineStateManager _loadAcceptableDurations]((uint64_t)v1);
        geo_dispatch_queue_create_with_qos();
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = (void *)*((_QWORD *)v1 + 22);
        *((_QWORD *)v1 + 22) = v4;

        UInteger = GEOConfigGetUInteger(GeoOfflineConfig_StateManagerRingBufferSize, (uint64_t)off_1EDF4E8F8);
        v7 = UInteger;
        v9 = *((_QWORD *)v1 + 4);
        v8 = *((_QWORD *)v1 + 5);
        v10 = 0xCCCCCCCCCCCCCCCDLL * ((v8 - v9) >> 3);
        v11 = UInteger - v10;
        if (UInteger <= v10)
        {
          if (UInteger < v10)
            *((_QWORD *)v1 + 5) = v9 + 40 * UInteger;
        }
        else
        {
          v12 = *((_QWORD *)v1 + 6);
          if (0xCCCCCCCCCCCCCCCDLL * ((v12 - v8) >> 3) >= v11)
          {
            v27 = v8 + 40 * v11;
            v28 = 40 * UInteger - 40 * v10;
            do
            {
              *(_DWORD *)(v8 + 32) = 0;
              *(_OWORD *)v8 = 0uLL;
              *(_OWORD *)(v8 + 16) = 0uLL;
              v8 += 40;
              v28 -= 40;
            }
            while (v28);
            *((_QWORD *)v1 + 5) = v27;
          }
          else
          {
            if (UInteger > 0x666666666666666)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v13 = 0xCCCCCCCCCCCCCCCDLL * ((v12 - v9) >> 3);
            v14 = 2 * v13;
            if (2 * v13 <= UInteger)
              v14 = UInteger;
            if (v13 >= 0x333333333333333)
              v15 = 0x666666666666666;
            else
              v15 = v14;
            v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAARiseTransitSetDetails2>>(v15);
            v18 = &v16[40 * v10];
            v19 = &v16[40 * v7];
            v20 = v18;
            v21 = 40 * v7 - 40 * v10;
            do
            {
              *((_DWORD *)v20 + 8) = 0;
              *(_OWORD *)v20 = 0uLL;
              *((_OWORD *)v20 + 1) = 0uLL;
              v20 += 40;
              v21 -= 40;
            }
            while (v21);
            v22 = &v16[40 * v17];
            v24 = (char *)*((_QWORD *)v1 + 4);
            v23 = (char *)*((_QWORD *)v1 + 5);
            if (v23 != v24)
            {
              do
              {
                v25 = *(_OWORD *)(v23 - 40);
                v26 = *(_OWORD *)(v23 - 24);
                *((_DWORD *)v18 - 2) = *((_DWORD *)v23 - 2);
                *(_OWORD *)(v18 - 24) = v26;
                *(_OWORD *)(v18 - 40) = v25;
                v18 -= 40;
                v23 -= 40;
              }
              while (v23 != v24);
              v23 = (char *)*((_QWORD *)v1 + 4);
            }
            *((_QWORD *)v1 + 4) = v18;
            *((_QWORD *)v1 + 5) = v19;
            *((_QWORD *)v1 + 6) = v22;
            if (v23)
              operator delete(v23);
          }
        }
        *((_DWORD *)v1 + 14) = 0;
        _getValue(GeoOfflineConfig_CohortStates, (uint64_t)off_1EDF4E978, 1, 0, 0, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "mutableCopy");
        v31 = (void *)*((_QWORD *)v1 + 20);
        *((_QWORD *)v1 + 20) = v30;

        GEOGetMonotonicTime();
        v33 = v32;
        objc_msgSend(*((id *)v1 + 20), "objectForKeyedSubscript:", CFSTR("lastUpdated"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v34;
        objc_msgSend(v34, "doubleValue");
        v37 = v35 > v33 || v34 == 0;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        objc_msgSend(*((id *)v1 + 20), "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v83;
          do
          {
            v40 = 0;
            do
            {
              if (*(_QWORD *)v83 != v39)
                objc_enumerationMutation(obj);
              v41 = *(NSString **)(*((_QWORD *)&v82 + 1) + 8 * v40);
              if ((-[NSString isEqual:](v41, "isEqual:", CFSTR("lastUpdated")) & 1) == 0)
              {
                objc_msgSend(*((id *)v1 + 20), "objectForKeyedSubscript:", v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  _migrateState(*((NSDictionary **)v1 + 20), v41, CFSTR("savedState"));
                  _migrateState(*((NSDictionary **)v1 + 20), v41, CFSTR("currentState"));
                  if (v37 || -[GEOOfflineStateManager _shouldDeleteStateForCohort:](v1, v41))
                  {
                    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("currentState"));
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = objc_msgSend(v43, "unsignedIntValue");
                    v45 = v44;
                    if (v44 < 2u)
                      goto LABEL_47;
                    if (v44 != 2)
                    {
                      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                        goto LABEL_47;
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&buf[4] = v45;
                      v50 = MEMORY[0x1E0C81028];
                      v51 = "Unreachable reached: invalid offline mode value %x";
LABEL_55:
                      _os_log_fault_impl(&dword_1885A9000, v50, OS_LOG_TYPE_FAULT, v51, buf, 8u);
                      goto LABEL_47;
                    }
                    v46 = HIBYTE(v44);
                    if (HIBYTE(v44) < 2u)
                      goto LABEL_47;
                    if (HIBYTE(v44) == 2)
                    {
                      v96 = CFSTR("currentState");
                      v97 = v43;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*((id *)v1 + 20), "setObject:forKeyedSubscript:", v47, v41);

                    }
                    else
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)&buf[4] = v46;
                        v50 = MEMORY[0x1E0C81028];
                        v51 = "Unreachable reached: invalid offline reason value %x";
                        goto LABEL_55;
                      }
LABEL_47:
                      objc_msgSend(*((id *)v1 + 20), "setObject:forKeyedSubscript:", 0, v41);
                    }

                  }
                }

              }
              ++v40;
            }
            while (v38 != v40);
            v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
            v38 = v52;
          }
          while (v52);
        }

        v53 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v92 = 3221225472;
        v93 = __41__GEOOfflineStateManager_initForTesting___block_invoke;
        v94 = &unk_1E1C00178;
        v54 = v1;
        v95 = v54;
        geo_isolate_sync();
        GEOGetOfflineStateLog();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v56 = *((_QWORD *)v1 + 20);
          LODWORD(handler) = 138412290;
          *(_QWORD *)((char *)&handler + 4) = v56;
          _os_log_impl(&dword_1885A9000, v55, OS_LOG_TYPE_INFO, "Initialized with states: %@", (uint8_t *)&handler, 0xCu);
        }

        *((_DWORD *)v54 + 42) = -1;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObserver:selector:name:object:", v54, sel__offlineAvailabilityUpdated, CFSTR("GEOOfflineAvailabilityChangedNotification"), 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addObserver:selector:name:object:", v54, sel__receivedHeartbeat_, CFSTR("GEOPeerHeartbeatNotification"), 0);

        if (AppSupportLibraryCore())
        {
          geo_dispatch_queue_create_with_qos();
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = (void *)*((_QWORD *)v54 + 9);
          *((_QWORD *)v54 + 9) = v59;

          v61 = objc_msgSend(objc_alloc((Class)getRadiosPreferencesClass()), "initWithQueue:", *((_QWORD *)v54 + 9));
          v62 = (void *)*((_QWORD *)v54 + 8);
          *((_QWORD *)v54 + 8) = v61;

          objc_msgSend(*((id *)v54 + 8), "setDelegate:", v54);
        }
        else
        {
          global_queue = geo_get_global_queue();
          v64 = (void *)*((_QWORD *)v54 + 9);
          *((_QWORD *)v54 + 9) = global_queue;

          GEOGetOfflineStateLog();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            LOWORD(handler) = 0;
            _os_log_impl(&dword_1885A9000, v65, OS_LOG_TYPE_ERROR, "Unable to load AppSupportLibrary, unable to monitor Airplane Mode", (uint8_t *)&handler, 2u);
          }

        }
        objc_msgSend(v54, "_networkStateChanged");
        +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "addNetworkReachableObserver:selector:", v54, sel__networkStateChanged);

        objc_initWeak(&location, v54);
        v67 = GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;
        v68 = geo_get_global_queue();
        *(_QWORD *)&handler = v53;
        *((_QWORD *)&handler + 1) = 3221225472;
        v88 = __41__GEOOfflineStateManager_initForTesting___block_invoke_51;
        v89 = &unk_1E1C08EB8;
        objc_copyWeak(v90, &location);
        notify_register_dispatch(v67, (int *)v54 + 42, v68, &handler);

        -[GEOOfflineStateManager _updateSubscriptionsCount]((uint64_t)v54);
        objc_destroyWeak(v90);
        objc_destroyWeak(&location);
        v69 = GeoOfflineConfig_RequestTypeAcceptableDurations;
        v70 = off_1EDF4E8E8;
        v71 = (void *)geo_get_global_queue();
        _GEOConfigAddDelegateListenerForKey(v69, (uint64_t)v70, v71, v54);

        v72 = GeoOfflineConfig_CohortStates;
        v73 = off_1EDF4E978;
        v74 = (void *)geo_get_global_queue();
        _GEOConfigAddDelegateListenerForKey(v72, (uint64_t)v73, v74, v54);

        v75 = (void *)geo_get_global_queue();
        GEORegisterPListStateCaptureLegacy();

        v76 = v95;
        v1 = v54;

      }
    }
    else
    {
      v1 = 0;
    }
    v77 = (void *)qword_1ECDBBDC0;
    qword_1ECDBBDC0 = (uint64_t)v1;

    if (!qword_1ECDBBDC0)
    {
      GEOGetOfflineStateLog();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v98 = 0;
        _os_log_impl(&dword_1885A9000, v78, OS_LOG_TYPE_FAULT, "Unable to create shared GEOOfflineStateManager", v98, 2u);
      }

    }
  }
}

- (void)_loadAcceptableDurations
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  if (a1)
  {
    _getValue(GeoOfflineConfig_RequestTypeAcceptableDurations, (uint64_t)off_1EDF4E8E8, 1, 0, 0, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__GEOOfflineStateManager__loadAcceptableDurations__block_invoke;
    v7[3] = &unk_1E1C08F90;
    v2 = v1;
    v8 = v2;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);
    objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E1E81148);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E1E81160, &unk_1E1E81148);
    v6 = (void *)objc_msgSend(v2, "copy");
    v4 = v6;
    geo_isolate_sync();

  }
}

- (BOOL)_shouldDeleteStateForCohort:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  double Double;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;

  v3 = a2;
  -[GEOOfflineStateManager _stateForCohort:](a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastUpdated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (Double = GEOConfigGetDouble(GeoOfflineConfig_CohortStateTTL, (uint64_t)off_1EDF4E948), Double == 0.0))
  {
    v10 = 0;
  }
  else
  {
    GEOGetMonotonicTime();
    v8 = v7;
    objc_msgSend(v5, "doubleValue");
    v10 = fmin(fmax(Double, 300.0), 2592000.0) + v9 < v8;
  }

  return v10;
}

uint64_t __41__GEOOfflineStateManager_initForTesting___block_invoke(uint64_t a1)
{
  return -[GEOOfflineStateManager _writeCohortStatesIsolated:](*(_QWORD *)(a1 + 32), 0);
}

- (uint64_t)_writeCohortStatesIsolated:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;

  if (result)
  {
    v3 = result;
    geo_assert_isolated();
    if (a2)
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      GEOGetMonotonicTime();
      objc_msgSend(v4, "numberWithUnsignedLongLong:", (unint64_t)v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(*(id *)(v3 + 160), "setObject:forKeyedSubscript:", v6, CFSTR("lastUpdated"));
    if (a2)

    return _setValue(GeoOfflineConfig_CohortStates, (uint64_t)off_1EDF4E978, *(void **)(v3 + 160), 1, 0);
  }
  return result;
}

void __41__GEOOfflineStateManager_initForTesting___block_invoke_51(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOOfflineStateManager _updateSubscriptionsCount]((uint64_t)WeakRetained);

}

- (void)_updateSubscriptionsCount
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *global_queue;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  uint8_t buf[16];

  if (a1)
  {
    +[GEOOfflineStateManager beginMonitoringAvailability]();
    if (_offlineAvailabilityChangedNotifyToken == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_offlineAvailabilityChangedNotifyToken is invalid", buf, 2u);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _offlineAvailabilityChangedNotifyToken != NOTIFY_TOKEN_INVALID", buf, 2u);
      }
    }
    else
    {
      v2 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __51__GEOOfflineStateManager__updateSubscriptionsCount__block_invoke;
      v9[3] = &unk_1E1C08F40;
      v9[4] = a1;
      v3 = (void *)MEMORY[0x18D765024](v9);
      +[GEOMapDataSubscriptionManager sharedManager](GEOMapDataSubscriptionManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      global_queue = (void *)geo_get_global_queue();
      v7[0] = v2;
      v7[1] = 3221225472;
      v7[2] = __51__GEOOfflineStateManager__updateSubscriptionsCount__block_invoke_66;
      v7[3] = &unk_1E1C08F68;
      v6 = v3;
      v8 = v6;
      objc_msgSend(v4, "_fetchFullyDownloadedSubscriptionsOfType:includeOutOfDate:callbackQueue:completionHandler:", 1024, 1, global_queue, v7);

    }
  }
}

- (void)dealloc
{
  NSObject *updateStateTimer;
  OS_dispatch_source *v4;
  void *v5;
  int subscriptionsChangedNotifyToken;
  void *v7;
  objc_super v8;

  updateStateTimer = self->_updateStateTimer;
  if (updateStateTimer)
  {
    dispatch_source_cancel(updateStateTimer);
    v4 = self->_updateStateTimer;
    self->_updateStateTimer = 0;

  }
  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, self);
  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeNetworkReachableObserver:", self);

  subscriptionsChangedNotifyToken = self->_subscriptionsChangedNotifyToken;
  if (subscriptionsChangedNotifyToken != -1)
  {
    notify_cancel(subscriptionsChangedNotifyToken);
    self->_subscriptionsChangedNotifyToken = -1;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)GEOOfflineStateManager;
  -[GEOOfflineStateManager dealloc](&v8, sel_dealloc);
}

void __42__GEOOfflineStateManager_isCohortAllowed___block_invoke()
{
  uint64_t v0;
  void *v1;

  os_unfair_lock_lock(&stru_1ECDBBDBC);
  _getValue(GeoOfflineConfig_CohortAllowList, (uint64_t)off_1EDF4E878, 1, 0, 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECDBBDD8;
  qword_1ECDBBDD8 = v0;

  os_unfair_lock_unlock(&stru_1ECDBBDBC);
}

+ (void)beginMonitoringAvailability
{
  const char *v0;
  NSObject *global_queue;
  uint32_t v2;
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (_offlineAvailabilityChangedNotifyToken == -1)
  {
    v0 = (const char *)GEOOfflineAvailabilityChangedDarwinNotification;
    global_queue = geo_get_global_queue();
    v2 = notify_register_dispatch(v0, &_offlineAvailabilityChangedNotifyToken, global_queue, &__block_literal_global_59);

    if (_offlineAvailabilityChangedNotifyToken == -1)
    {
      GEOGetOfflineStateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5[0] = 67109120;
        v5[1] = v2;
        _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Unable to install offline availability monitor: %u", (uint8_t *)v5, 8u);
      }

    }
    else
    {
      __53__GEOOfflineStateManager_beginMonitoringAvailability__block_invoke(v3, _offlineAvailabilityChangedNotifyToken);
    }
  }
}

void __53__GEOOfflineStateManager_beginMonitoringAvailability__block_invoke(int a1, int token)
{
  uint32_t state;
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  _QWORD v18[2];
  uint64_t (*v19)(uint64_t);
  void *v20;
  char v21;
  _BYTE buf[24];
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  state = notify_get_state(token, &v17);
  GEOGetOfflineStateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (state)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = state;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Unable to get subscription count state: %u", buf, 8u);
    }
LABEL_24:

    return;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v17;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEFAULT, "Got new subscription count state: %llu", buf, 0xCu);
  }

  qword_1ECDBBDE0 = 0;
  v5 = v17 != 0;
  objc_opt_self();
  if (_MergedGlobals_223 != v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v19 = __50__GEOOfflineStateManager__setOfflineAvailability___block_invoke;
    v20 = &__block_descriptor_33_e5_v8__0l;
    v21 = v5;
    v4 = v18;
    v7 = (void *)objc_opt_self();
    v8 = objc_msgSend(v7, "isOfflineAvailable");
    v9 = objc_msgSend(v7, "isOfflineAvailableLocally");
    v19((uint64_t)v4);
    v10 = objc_msgSend(v7, "isOfflineAvailable");
    v11 = objc_msgSend(v7, "isOfflineAvailableLocally");
    GEOGetOfflineStateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "NO";
      if (v8)
        v14 = "YES";
      else
        v14 = "NO";
      if (v10)
        v15 = "YES";
      else
        v15 = "NO";
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = v14;
      if (v9)
        v16 = "YES";
      else
        v16 = "NO";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2082;
      v23 = v16;
      if (v11)
        v13 = "YES";
      v24 = 2082;
      v25 = v13;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEFAULT, "Offline availability changing from general: %{public}s -> %{public}s / local: %{public}s -> %{public}s", buf, 0x2Au);
    }

    if (v8 != v10 || v9 != v11)
    {
      *(_QWORD *)buf = v6;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __46__GEOOfflineStateManager__updateAvailability___block_invoke;
      v23 = (const char *)&__block_descriptor_36_e5_v8__0l;
      LOBYTE(v24) = v10;
      HIBYTE(v24) = v8;
      LOBYTE(v25) = v11;
      BYTE1(v25) = v9;
      dispatch_async(MEMORY[0x1E0C80D38], buf);
    }
    goto LABEL_24;
  }
}

void __46__GEOOfflineStateManager__updateAvailability___block_invoke(unsigned __int8 *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("overall");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[32]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("overall_changed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[33] != a1[32]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("local");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[34]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  v8[3] = CFSTR("local_changed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[35] != a1[34]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("GEOOfflineAvailabilityChangedNotification"), 0, v7);

}

uint64_t __50__GEOOfflineStateManager__setOfflineAvailability___block_invoke(uint64_t result)
{
  _MergedGlobals_223 = *(_BYTE *)(result + 32);
  return result;
}

+ (BOOL)isOfflineAvailable
{
  _BOOL4 v2;
  uint8_t v4[16];
  uint8_t buf[16];

  +[GEOOfflineStateManager beginMonitoringAvailability]();
  if (_offlineAvailabilityChangedNotifyToken == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_offlineAvailabilityChangedNotifyToken is invalid", buf, 2u);
    }
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v2)
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _offlineAvailabilityChangedNotifyToken != NOTIFY_TOKEN_INVALID", v4, 2u);
      LOBYTE(v2) = 0;
    }
  }
  else
  {
    LOBYTE(v2) = _MergedGlobals_223 != 0;
  }
  return v2;
}

+ (BOOL)isOfflineAvailableLocally
{
  _BOOL4 v2;
  uint8_t v4[16];
  uint8_t buf[16];

  +[GEOOfflineStateManager beginMonitoringAvailability]();
  if (_offlineAvailabilityChangedNotifyToken == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_offlineAvailabilityChangedNotifyToken is invalid", buf, 2u);
    }
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v2)
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _offlineAvailabilityChangedNotifyToken != NOTIFY_TOKEN_INVALID", v4, 2u);
      LOBYTE(v2) = 0;
    }
  }
  else
  {
    LOBYTE(v2) = _MergedGlobals_223 != 0;
  }
  return v2;
}

void __51__GEOOfflineStateManager__updateSubscriptionsCount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  int v14;
  uint32_t v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    GEOGetOfflineStateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23[0] = v7;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Unable to fetch subscriptions: %@", buf, 0xCu);
    }

  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = 0;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v9 += ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dataTypes", (_QWORD)v18) >> 10) & 1;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v10);
    }

    GEOGetOfflineStateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 67109376;
      LODWORD(v23[0]) = v14;
      WORD2(v23[0]) = 1024;
      *(_DWORD *)((char *)v23 + 6) = v9;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEFAULT, "Got %d subscriptions & %d usable", buf, 0xEu);
    }

    qword_1ECDBBDE8 = objc_msgSend(v8, "count");
    if (v9 != qword_1ECDBBDE0)
    {
      qword_1ECDBBDE0 = v9;
      v15 = notify_set_state(_offlineAvailabilityChangedNotifyToken, v9);
      if (v15)
      {
        GEOGetOfflineStateLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v23[0]) = v15;
          _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "Unable to set subscription count state: %u", buf, 8u);
        }

      }
      else
      {
        notify_post((const char *)GEOOfflineAvailabilityChangedDarwinNotification);
      }
      -[GEOOfflineStateManager _setNeedsStateUpdate](*(_QWORD *)(a1 + 32));
    }
  }

}

- (uint64_t)_setNeedsStateUpdate
{
  if (result)
  {
    if (!*(_BYTE *)(result + 128))
      return geo_isolate_sync();
  }
  return result;
}

uint64_t __51__GEOOfflineStateManager__updateSubscriptionsCount__block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *v5;
  NSObject *v6;
  uint8_t buf[16];

  if (a3.var0 == (_DWORD)GeoOfflineConfig_RequestTypeAcceptableDurations && a3.var1 == off_1EDF4E8E8)
  {
    -[GEOOfflineStateManager _loadAcceptableDurations]((uint64_t)self);
  }
  else if (a3.var0 == (_DWORD)GeoOfflineConfig_CohortStates && a3.var1 == off_1EDF4E978)
  {
    _getValue(GeoOfflineConfig_CohortStates, (uint64_t)off_1EDF4E978, 1, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      GEOGetOfflineStateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "States cleared externally", buf, 2u);
      }

      geo_isolate_sync_data();
    }

  }
}

void __54__GEOOfflineStateManager_valueChangedForGEOConfigKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 160);
  *(_QWORD *)(v3 + 160) = v2;

}

void __50__GEOOfflineStateManager__loadAcceptableDurations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((objc_msgSend(v5, "isEqual:", CFSTR("default")) & 1) != 0)
    {
      LODWORD(v7) = 0;
      v8 = 0;
LABEL_12:
      v11 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 | v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v12);

      goto LABEL_13;
    }
    if (objc_msgSend(v5, "hasSuffix:", CFSTR("*")))
    {
      objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v10;
    }
    v7 = GEODataRequestKindFromString(v5);
    if ((_DWORD)v7)
    {
      v8 = HIDWORD(v7);
      goto LABEL_12;
    }
    GEOGetOfflineStateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Unrecognized request type \"%@\", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    GEOGetOfflineStateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_FAULT, "RequestTypeAcceptableDurations key (%@) is not of type string or value (%@) is not of type number", (uint8_t *)&v13, 0x16u);
    }
  }

LABEL_13:
}

void __50__GEOOfflineStateManager__loadAcceptableDurations__block_invoke_75(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)_reportResponse:(uint64_t)a3 usedInterfaces:(double)a4 requestMode:(uint64_t)a5 forCohortId:(void *)a6 duration:(void *)a7 error:
{
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  NSObject *v21;
  char *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  _BYTE v30[12];
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = a6;
  v12 = a7;
  v13 = v12;
  if (a1 && (_DWORD)a2)
  {
    if (v12)
    {
      if ((objc_msgSend(v12, "_geo_isNetworkError") & 1) == 0)
        goto LABEL_17;
      v14 = 3;
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v28 = __Block_byref_object_copy__33;
      v29 = __Block_byref_object_dispose__33;
      *(_QWORD *)v30 = 0;
      geo_isolate_sync();
      v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(a2) | a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_9;
      v18 = *(void **)(*(_QWORD *)&buf[8] + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17
        || (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKeyedSubscript:", &unk_1E1E81148),
            (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
LABEL_9:
        objc_msgSend(v17, "doubleValue");
      }
      else
      {
        v20 = 10.0;
      }
      if (v20 >= a4)
        v14 = 1;
      else
        v14 = 2;

      _Block_object_dispose(buf, 8);
    }
    GEOGetOfflineStateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = off_1E1C09100[v14 - 1];
      GEODataRequestKindAsString(a2);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      GEORequestCounterInterfaceTypesToStrings(a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136447490;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2114;
      v28 = v26;
      strcpy((char *)&v29, "p\bhash");
      HIBYTE(v29) = 0;
      *(_DWORD *)v30 = 138412032;
      *(_QWORD *)&v30[4] = v23;
      v31 = 2114;
      v32 = v25;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "Tracking %{public}s (%.02fs) request from %{public}@ of type %{mask.hash}@ using: %{public}@", buf, 0x3Eu);

    }
    -[GEOOfflineStateManager _track:forRequest:usedInterfaces:requestMode:]();
  }
LABEL_17:

}

void __96__GEOOfflineStateManager__reportResponse_usedInterfaces_requestMode_forCohortId_duration_error___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (uint64_t)_track:forRequest:usedInterfaces:requestMode:
{
  return geo_isolate_sync();
}

- (void)airplaneModeChanged
{
  NSObject *radioPrefsQueue;
  _QWORD block[5];

  radioPrefsQueue = self->_radioPrefsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__GEOOfflineStateManager_airplaneModeChanged__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(radioPrefsQueue, block);
}

void __45__GEOOfflineStateManager_airplaneModeChanged__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "refresh");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "airplaneMode");
  v3 = *(_QWORD *)(a1 + 32);
  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOOfflineStateManager _reportNetworkUp:airplaneMode:](v3, objc_msgSend(v4, "isNetworkReachable"), v2);

}

- (uint64_t)_reportNetworkUp:(int)a3 airplaneMode:
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  int v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = 5;
    if (a3)
      v3 = 6;
    if (a2)
      v4 = 4;
    else
      v4 = v3;
    GEOGetOfflineStateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = off_1E1C09118[v4 - 4];
      v7 = 136446210;
      v8 = v6;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEFAULT, "Tracking network state change to: %{public}s", (uint8_t *)&v7, 0xCu);
    }

    return -[GEOOfflineStateManager _track:forRequest:usedInterfaces:requestMode:]();
  }
  return result;
}

- (void)_networkStateChanged
{
  NSObject *radioPrefsQueue;
  _QWORD block[5];

  radioPrefsQueue = self->_radioPrefsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__GEOOfflineStateManager__networkStateChanged__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(radioPrefsQueue, block);
}

void __46__GEOOfflineStateManager__networkStateChanged__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "refresh");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "airplaneMode");
  v3 = *(_QWORD *)(a1 + 32);
  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOOfflineStateManager _reportNetworkUp:airplaneMode:](v3, objc_msgSend(v4, "isNetworkReachable"), v2);

}

void __71__GEOOfflineStateManager__track_forRequest_usedInterfaces_requestMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v8;
  uint64_t v9;

  GEOGetMonotonicTime();
  v4 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_DWORD *)(a1 + 64);
  if (v5 >= 4 && v5 != 7)
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v9 + 80) = v2;
    *(_QWORD *)(v9 + 88) = v3;
    *(_QWORD *)(v9 + 96) = v5;
    *(_QWORD *)(v9 + 104) = v4;
    *(_DWORD *)(v9 + 112) = v6;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 56);
  *(_QWORD *)v8 = v2;
  *(_QWORD *)(v8 + 8) = v3;
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v4;
  *(_DWORD *)(v8 + 32) = v6;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) + 1)
                                           % (0xCCCCCCCCCCCCCCCDLL
                                            * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)
                                                       - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)) >> 3));
  -[GEOOfflineStateManager _setNeedsStateUpdateIsolated](*(_QWORD *)(a1 + 32));
}

- (void)_setNeedsStateUpdateIsolated
{
  uint64_t v2;
  NSObject *global_queue;
  dispatch_source_t v4;
  void *v5;
  NSObject *v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  BOOL v11;
  double v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (a1 && !*(_BYTE *)(a1 + 128))
  {
    *(_BYTE *)(a1 + 128) = 1;
    v2 = *(_QWORD *)(a1 + 144);
    if (!v2)
    {
      global_queue = geo_get_global_queue();
      v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
      v5 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = v4;

      objc_initWeak(&location, (id)a1);
      v6 = *(NSObject **)(a1 + 144);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __54__GEOOfflineStateManager__setNeedsStateUpdateIsolated__block_invoke;
      v14[3] = &unk_1E1C00650;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_event_handler(v6, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    GEOGetMonotonicTime();
    v8 = *(double *)(a1 + 120) - (v7 - *(double *)(a1 + 136));
    v9 = v8 * 1000000000.0;
    v10 = *(NSObject **)(a1 + 144);
    v11 = v8 < 0.2;
    v12 = 200000000.0;
    if (!v11)
      v12 = v9;
    v13 = dispatch_time(0, (uint64_t)v12);
    dispatch_source_set_timer(v10, v13, 0xFFFFFFFFFFFFFFFFLL, 0x30D40uLL);
    if (!v2)
      dispatch_activate(*(dispatch_object_t *)(a1 + 144));
  }
}

- (void)waitForTransitionToActiveState:(id)a3 forCohortId:(id)a4 timeout:(double)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v11;
  id v12;
  NSObject *v13;
  void (**v14)(id, uint64_t);
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void (**v21)(id, uint64_t);
  uint64_t v22;
  void *v23;
  double Double;
  dispatch_time_t v25;
  _QWORD block[4];
  id v27;
  void (**v28)(id, uint64_t);
  __int128 *v29;
  uint64_t *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  void (**v34)(id, uint64_t);
  uint64_t *v35;
  __int128 *p_buf;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  id location;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  uint64_t (*v48)();
  const char *v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(id, uint64_t))a7;
  GEOGetOfflineStateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Asked to wait for cohort %{public}@ to enter desired state", (uint8_t *)&buf, 0xCu);
  }

  if ((*((unsigned int (**)(id, _QWORD))v11 + 2))(v11, -[GEOOfflineStateManager activeStateForCohortId:](self, "activeStateForCohortId:", v12)))
  {
    GEOGetOfflineStateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "Cohort is already in desired state", (uint8_t *)&buf, 2u);
    }

    v14[2](v14, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v46 = 0x3812000000;
    v47 = __Block_byref_object_copy__78;
    v48 = __Block_byref_object_dispose__79;
    v49 = "";
    v50 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__33;
    v42 = __Block_byref_object_dispose__33;
    v43 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v19 = GeoOfflineConfig_CohortStates;
    v18 = off_1EDF4E978;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke;
    v31[3] = &unk_1E1C08FE0;
    v31[4] = self;
    v20 = v12;
    v32 = v20;
    v33 = v11;
    v35 = &v38;
    p_buf = &buf;
    objc_copyWeak(&v37, &location);
    v21 = v14;
    v34 = v21;
    _GEOConfigAddBlockListenerForKey(v19, (uint64_t)v18, v13, v31);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v39[5];
    v39[5] = v22;

    Double = GEOConfigGetDouble(GeoOfflineConfig_OnlineOfflineFailoverTimeout, (uint64_t)off_1EDF4EB38);
    v25 = dispatch_time(0, (uint64_t)(Double * 1000000000.0));
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_81;
    block[3] = &unk_1E1C09030;
    v29 = &buf;
    v30 = &v38;
    v27 = v20;
    v28 = v21;
    dispatch_after(v25, v13, block);

    objc_destroyWeak(&v37);
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&location);
  }

}

void __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  if ((*(unsigned int (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "activeStateForCohortId:", *(_QWORD *)(a1 + 40))))
  {
    GEOConfigRemoveBlockListener(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_2;
    v5[3] = &unk_1E1C08FB8;
    objc_copyWeak(&v8, (id *)(a1 + 80));
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 56);
    GEOOnce(v4, v5);

    objc_destroyWeak(&v8);
  }
}

void __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    GEOGetOfflineStateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Cohort %{public}@ has entered desired state", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_81(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_2_82;
  v4[3] = &unk_1E1C09008;
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48;
  v4[1] = 3221225472;
  v7 = v2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  GEOOnce(v3, v4);

}

uint64_t __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_2_82(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOConfigRemoveBlockListener(*(void **)(*(_QWORD *)(a1[6] + 8) + 40));
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  GEOGetOfflineStateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Timed out waiting for cohort '%{public}@' failed to transition to offline mode", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)checkConnectivityForPeer:(id)a3
{
  id v4;
  NSObject *connectivityCheckQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectivityCheckQueue = self->_connectivityCheckQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__GEOOfflineStateManager_checkConnectivityForPeer___block_invoke;
  v7[3] = &unk_1E1BFFF48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectivityCheckQueue, v7);

}

void __51__GEOOfflineStateManager_checkConnectivityForPeer___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  double Double;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  GEODataRequest *v16;
  void *v17;
  GEODataRequest *v18;
  void *v19;
  uint64_t v20;
  id *v21;
  void *v22;
  uint8_t v23[8];
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, _BYTE *, double);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t v36[4];
  uint64_t v37;
  __int16 v38;
  double v39;
  __int128 buf;
  uint64_t (*v41)(uint64_t);
  void *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 176));
    if (*(_QWORD *)(v1 + 184))
    {
      GEOGetOfflineStateLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Refusing to check connectivity, still performing previous check", (uint8_t *)&buf, 2u);
      }
      goto LABEL_32;
    }
    objc_msgSend(v2, "auditToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "offlineCohortId");
    v3 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject length](v3, "length"))
    {
      if (+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v3))
      {
        if ((unsigned __int16)objc_msgSend((id)v1, "currentStateForCohortId:", v3) == 258)
        {
          v32 = 0;
          v33 = &v32;
          v34 = 0x2020000000;
          v35 = 0;
          v5 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v41 = __52__GEOOfflineStateManager__checkConnectivityForPeer___block_invoke;
          v42 = &unk_1E1C05DC0;
          v43 = v1;
          v44 = &v32;
          geo_isolate_sync();
          if (*((_BYTE *)v33 + 24))
          {
            GEOGetOfflineStateLog();
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v23 = 0;
              _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Refusing to check connectivity, network is down", v23, 2u);
            }
          }
          else
          {
            Double = GEOConfigGetDouble(GeoOfflineConfig_CheckConnectivityInterval, (uint64_t)off_1EDF4EB98);
            if (Double != 0.0)
            {
              v9 = fmin(fmax(Double, 30.0), 3600.0)
                 - (GEOConfigGetDouble(GeoOfflineConfig_CheckConnectivityTimeout, (uint64_t)off_1EDF4EBA8)
                  + 1.0);
              v28 = 0;
              v29 = (double *)&v28;
              v30 = 0x2020000000;
              v31 = 0;
              *(_QWORD *)v23 = v5;
              v24 = 3221225472;
              v25 = __52__GEOOfflineStateManager__checkConnectivityForPeer___block_invoke_83;
              v26 = &unk_1E1C09058;
              v27 = &v28;
              -[GEOOfflineStateManager _enumerateResultsInLast:options:withBlock:](v1, 2, v23, v9 + 0.5);
              v10 = v29[3];
              if (v10 == 0.0 || v10 >= v9)
              {
                GEOGetURLWithSource(64, 0);
                v11 = objc_claimAutoreleasedReturnValue();
                +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "auditToken");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "requestCounterTicketForType:auditToken:traits:", 2860, v14, 0);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                v16 = [GEODataRequest alloc];
                objc_msgSend(v2, "auditToken");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:](v16, "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", 2860, v11, v17, 0, 0, 0, GEOConfigGetDouble(GeoOfflineConfig_CheckConnectivityTimeout, (uint64_t)off_1EDF4EBA8), 0, 0, v15, 0, 0, 0, 2);

                +[GEODataURLSession sharedDataURLSession](GEODataURLSession, "sharedDataURLSession");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "taskWithRequest:delegate:delegateQueue:", v18, v1, *(_QWORD *)(v1 + 176));
                v20 = objc_claimAutoreleasedReturnValue();
                v22 = *(void **)(v1 + 184);
                v21 = (id *)(v1 + 184);
                *v21 = (id)v20;

                objc_msgSend(*v21, "start");
              }
              else
              {
                GEOGetOfflineStateLog();
                v11 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
                {
                  v12 = *((_QWORD *)v29 + 3);
                  *(_DWORD *)v36 = 134218240;
                  v37 = v12;
                  v38 = 2048;
                  v39 = v9;
                  _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEFAULT, "Refusing to check connectivity, only %f of %f seconds have elapsed since last check / online event", v36, 0x16u);
                }
              }

              _Block_object_dispose(&v28, 8);
              goto LABEL_31;
            }
            GEOGetOfflineStateLog();
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v23 = 0;
              _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Refusing to check connectivity, disabled", v23, 2u);
            }
          }

LABEL_31:
          _Block_object_dispose(&v32, 8);
          goto LABEL_32;
        }
        GEOGetOfflineStateLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v3;
          _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Refusing to check connectivity, cohort %@ is not in OfflineAuto state", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        GEOGetOfflineStateLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v3;
          _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_FAULT, "Refusing to check connectivity for invalid cohort: %@.", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      GEOGetOfflineServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v2;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_FAULT, "Refusing to check connectivity for: %@", (uint8_t *)&buf, 0xCu);
      }
    }

LABEL_32:
  }

}

uint64_t __52__GEOOfflineStateManager__checkConnectivityForPeer___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(double *)(v1 + 80) != 0.0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = (*(_QWORD *)(v1 + 96) > 7uLL) | (0x60u >> *(_QWORD *)(v1 + 96)) & 1;
  return result;
}

uint64_t __52__GEOOfflineStateManager__checkConnectivityForPeer___block_invoke_83(uint64_t result, uint64_t a2, _BYTE *a3, double a4)
{
  unint64_t v4;

  if ((*(_BYTE *)(a2 + 25) & 1) == 0)
  {
    v4 = *(_QWORD *)(a2 + 16);
    if (v4 < 4 || v4 == 7)
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a4;
      *a3 = 1;
    }
  }
  return result;
}

- (void)_enumerateResultsInLast:(void *)a3 options:(double)a4 withBlock:
{
  void (**v7)(_QWORD, __n128);
  double v8;
  double v9;
  __n128 v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  double *v15;
  uint64_t v17;
  unint64_t v18;
  double *v19;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  __n128 (*v30)(__n128 *, __n128 *);
  void (*v31)(uint64_t);
  const char *v32;
  void *v33;
  void *v34;
  uint64_t v35;

  v7 = a3;
  if (a1)
  {
    GEOGetMonotonicTime();
    v9 = v8;
    v27 = 0;
    v28 = &v27;
    v29 = 0x4812000000;
    v30 = __Block_byref_object_copy__88_0;
    v31 = __Block_byref_object_dispose__89_0;
    v32 = "";
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    geo_isolate_sync();
    v11 = 0xCCCCCCCCCCCCCCCDLL * ((v28[7] - v28[6]) >> 3);
    v12 = *((_DWORD *)v24 + 6);
    if ((a2 & 2) != 0)
    {
      v18 = (v12 + 1) % v11;
      do
      {
        v19 = (double *)(v28[6] + 40 * v12);
        v10.n128_f64[0] = v9 - *v19;
        if (*v19 != 0.0 && v10.n128_f64[0] < a4)
          v7[2](v7, v10);
        v21 = v12;
        if (v12)
          v22 = v12;
        else
          v22 = v11;
        v12 = v22 - 1;
      }
      while (v18 != v21);
    }
    else
    {
      if (v12)
        v13 = *((unsigned int *)v24 + 6);
      else
        v13 = 0xCCCCCCCCCCCCCCCDLL * ((v28[7] - v28[6]) >> 3);
      v14 = v13 - 1;
      do
      {
        v15 = (double *)(v28[6] + 40 * v12);
        v10.n128_f64[0] = v9 - *v15;
        if (*v15 != 0.0 && v10.n128_f64[0] < a4)
          v7[2](v7, v10);
        v17 = v12;
        v12 = (v12 + 1) % v11;
      }
      while (v14 != v17);
    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
    if (v33)
    {
      v34 = v33;
      operator delete(v33);
    }
  }

}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v6;
  GEODataURLSessionTask *v7;
  GEODataURLSessionTask *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = (GEODataURLSessionTask *)a4;
  v8 = v7;
  if (self->_connectivityCheckTask == v7)
  {
    self->_connectivityCheckTask = 0;

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: task == _connectivityCheckTask", v9, 2u);
  }

}

- (unint64_t)subscriptionCount
{
  return qword_1ECDBBDE0;
}

void __68__GEOOfflineStateManager__enumerateResultsInLast_options_withBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  _QWORD *v10;
  void *v11;

  v2 = a1[4];
  v4 = *(_BYTE **)(v2 + 32);
  v3 = *(_BYTE **)(v2 + 40);
  v5 = v3 - v4;
  if (v3 == v4)
  {
    v8 = 0;
    v9 = 0;
    v6 = 0;
  }
  else
  {
    if (0xCCCCCCCCCCCCCCCDLL * (v5 >> 3) >= 0x666666666666667)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAARiseTransitSetDetails2>>(0xCCCCCCCCCCCCCCCDLL * (v5 >> 3));
    v8 = &v6[40 * v7];
    memmove(v6, v4, v5 - 4);
    v9 = &v6[8 * (v5 >> 3)];
  }
  v10 = *(_QWORD **)(a1[5] + 8);
  v11 = (void *)v10[6];
  if (v11)
  {
    v10[7] = v11;
    operator delete(v11);
  }
  v10[6] = v6;
  v10[7] = v9;
  v10[8] = v8;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_DWORD *)(a1[4] + 56);
}

uint64_t __45__GEOOfflineStateManager__lastEventTimestamp__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 56);
  v3 = *(_QWORD *)(v1 + 32);
  if (!v2)
    v2 = -858993459 * ((unint64_t)(*(_QWORD *)(v1 + 40) - v3) >> 3);
  v4 = *(double *)(v3 + 40 * (v2 - 1));
  if (v4 != 0.0)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v4;
    v1 = *(_QWORD *)(result + 32);
  }
  v5 = *(double *)(v1 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (v5 > *(double *)(v6 + 24))
    *(double *)(v6 + 24) = v5;
  return result;
}

- (void)_updateCohortLastUpdatedTimestampIfNecessary:(double)a3 timestamp:
{
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v11 = a2;
  if (a1)
  {
    GEOGetMonotonicTime();
    if (a1[19] + 240.0 < v5)
    {
      -[GEOOfflineStateManager _stateForCohort:](a1, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastUpdated"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      if (v8 < a3)
      {
        v9 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("lastUpdated"));

        v12 = v11;
        v13 = v9;
        geo_isolate_sync_data();

      }
    }
  }

}

- (id)_stateForCohort:(id)a1
{
  id v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v3 = a2;
  if (a1)
  {
    geo_assert_not_isolated();
    if (+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v3))
    {
      v6 = 0;
      v7 = &v6;
      v8 = 0x3032000000;
      v9 = __Block_byref_object_copy__33;
      v10 = __Block_byref_object_dispose__33;
      v11 = 0;
      v5 = v3;
      geo_isolate_sync_data();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        a1 = (id)v7[5];
      else
        a1 = 0;

      _Block_object_dispose(&v6, 8);
    }
    else
    {
      a1 = (id)MEMORY[0x1E0C9AA70];
    }
  }

  return a1;
}

uint64_t __81__GEOOfflineStateManager__updateCohortLastUpdatedTimestampIfNecessary_timestamp___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  return -[GEOOfflineStateManager _writeCohortStatesIsolated:](*(_QWORD *)(a1 + 32), 1);
}

- (void)_receivedHeartbeat:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "auditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offlineCohortId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v5))
  {
    GEOGetMonotonicTime();
    -[GEOOfflineStateManager _updateCohortLastUpdatedTimestampIfNecessary:timestamp:]((double *)self, v5, v6);
  }

}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  void *v4;
  void *v5;
  double Current;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[4];
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__33;
  v29 = __Block_byref_object_dispose__33;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __53__GEOOfflineStateManager_captureStatePlistWithHints___block_invoke;
  v24[3] = &unk_1E1C09058;
  v24[4] = &v25;
  -[GEOOfflineStateManager _enumerateResultsInLast:options:withBlock:]((uint64_t)self, 0, v24, 1.79769313e308);
  v4 = (void *)v26[5];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  Current = CFAbsoluteTimeGetCurrent();
  GEOGetMonotonicTime();
  v8 = v7;
  v38[0] = v26[5];
  v37[0] = CFSTR("results");
  v37[1] = CFSTR("time");
  v35[0] = CFSTR("cf_time");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Current);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = CFSTR("monotonic");
  v36[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v11;
  v37[2] = CFSTR("listeners");
  if (_offlineAvailabilityChangedNotifyToken == -1)
    v12 = CFSTR("NO");
  else
    v12 = CFSTR("YES");
  v33[0] = CFSTR("availability");
  v33[1] = CFSTR("subscriptions");
  if (self->_subscriptionsChangedNotifyToken == -1)
    v13 = CFSTR("NO");
  else
    v13 = CFSTR("YES");
  v34[0] = v12;
  v34[1] = v13;
  v33[2] = CFSTR("radioPreferences");
  if (self->_radiosPrefs)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v34[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v15;
  v37[3] = CFSTR("states");
  v31[0] = CFSTR("totalSubscriptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", qword_1ECDBBDE8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  v31[1] = CFSTR("usableSubscriptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", qword_1ECDBBDE0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (_MergedGlobals_223)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v32[1] = v17;
  v32[2] = v19;
  v31[2] = CFSTR("isAvailable");
  v31[3] = CFSTR("isEnabled");
  v31[4] = CFSTR("needsUpdate");
  if (self->_needsStateUpdate)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v32[3] = CFSTR("YES");
  v32[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v25, 8);
  return v22;
}

void __53__GEOOfflineStateManager_captureStatePlistWithHints___block_invoke(uint64_t a1, _anonymous_namespace_::Result *this)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

uint64_t __46__GEOOfflineStateManager__setNeedsStateUpdate__block_invoke(uint64_t a1)
{
  return -[GEOOfflineStateManager _setNeedsStateUpdateIsolated](*(_QWORD *)(a1 + 32));
}

void __54__GEOOfflineStateManager__setNeedsStateUpdateIsolated__block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  double Double;
  double v7;
  unint64_t UInteger;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  BOOL v16;
  BOOL v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  BOOL v25;
  unint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  __int128 *WeakRetained;
  uint64_t v31;
  uint8_t buf[8];
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 *v36;
  const __CFString *v37;
  unsigned int *v38;
  uint64_t *v39;
  char *v40;
  double v41;
  unint64_t v42;
  char v43;
  unsigned int v44;
  __int128 v45;
  __int128 v46;
  int v47;
  __int128 v48;
  __int128 v49;
  int v50;
  _BYTE v51[24];
  uint64_t v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  WeakRetained = (__int128 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_99;
  v1 = MEMORY[0x1E0C809B0];
  v31 = MEMORY[0x1E0C809B0];
  geo_isolate_sync();
  *(_QWORD *)v51 = 0;
  *(_QWORD *)&v51[8] = v51;
  *(_QWORD *)&v51[16] = 0x2020000000;
  v52 = 0;
  *(_QWORD *)buf = v1;
  v33 = 3221225472;
  v34 = __45__GEOOfflineStateManager__lastEventTimestamp__block_invoke;
  v35 = &unk_1E1C05DC0;
  v36 = WeakRetained;
  v37 = (const __CFString *)v51;
  geo_isolate_sync();
  v2 = *(double *)(*(_QWORD *)&v51[8] + 24);
  _Block_object_dispose(v51, 8);
  -[GEOOfflineStateManager _updateCohortLastUpdatedTimestampIfNecessary:timestamp:]((double *)WeakRetained, CFSTR("com.apple.Maps"), v2);
  v3 = CFSTR("com.apple.Maps");
  if (-[GEOOfflineStateManager _shouldDeleteStateForCohort:](WeakRetained, CFSTR("com.apple.Maps")))
  {
    v4 = CFSTR("com.apple.Maps");
    if (+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", CFSTR("com.apple.Maps")))
    {
      *(_QWORD *)buf = v1;
      v33 = 3221225472;
      v34 = __47__GEOOfflineStateManager__clearStateForCohort___block_invoke;
      v35 = &unk_1E1BFFF48;
      v36 = WeakRetained;
      v5 = CFSTR("com.apple.Maps");
      v37 = CFSTR("com.apple.Maps");
      geo_isolate_sync_data();

    }
  }

  Double = GEOConfigGetDouble(GeoOfflineConfig_StateManagerExamineInterval, (uint64_t)off_1EDF4E908);
  v7 = GEOConfigGetDouble(GeoOfflineConfig_StateManagerMinimumFailureAge, (uint64_t)off_1EDF4E928);
  UInteger = GEOConfigGetUInteger(GeoOfflineConfig_StateManagerVerbosity, (uint64_t)off_1EDF4E938);
  v9 = *((_QWORD *)WeakRetained + 12);
  if (v9 != 6)
  {
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
    v47 = 0;
    v45 = 0u;
    v46 = 0u;
    v44 = 0;
    v60 = 0;
    v61 = 0;
    v63 = 0;
    v62 = 0;
    v43 = 0;
    *(_QWORD *)buf = v1;
    v33 = 3321888768;
    v34 = __38__GEOOfflineStateManager__updateState__block_invoke;
    v35 = &__block_descriptor_88_ea8_32c51_ZTSKZ38__GEOOfflineStateManager__updateState_E3__0_e41_v32__0r__Result_d___i___iii__QQi_8d16_B24l;
    v36 = &v48;
    v37 = (const __CFString *)&v45;
    v38 = &v44;
    v39 = &v60;
    v40 = &v43;
    v41 = v7;
    v42 = UInteger;
    -[GEOOfflineStateManager _enumerateResultsInLast:options:withBlock:]((uint64_t)WeakRetained, 0, buf, Double);
    if (UInteger >= 2)
    {
      GEOGetOfflineStateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v51 = 67110912;
        *(_DWORD *)&v51[4] = v44;
        *(_WORD *)&v51[8] = 2048;
        *(double *)&v51[10] = Double;
        *(_WORD *)&v51[18] = 1024;
        *(_DWORD *)&v51[20] = HIDWORD(v60);
        LOWORD(v52) = 1024;
        *(_DWORD *)((char *)&v52 + 2) = v61;
        HIWORD(v52) = 1024;
        v53 = HIDWORD(v61);
        v54 = 1024;
        v55 = v62;
        v56 = 1024;
        v57 = HIDWORD(v62);
        v58 = 1024;
        v59 = v63;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Read %u events from the last %.02fs with success: %u, slow: %u, failed: %u. Network status up: %u down: %u airplane: %u", v51, 0x36u);
      }

    }
    if (v44 && !v61 && !v43)
    {
      if (!UInteger)
      {
        v13 = 1;
        v14 = 1;
        goto LABEL_39;
      }
      GEOGetOfflineStateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "All clear, suggesting online", v51, 2u);
      }
      v13 = 1;
LABEL_23:

      v14 = v13;
LABEL_39:
      -[GEOOfflineStateManager _setSuggestedState:reason:forCohortId:](WeakRetained, v13, v14);
      goto LABEL_99;
    }
    v15 = *(double *)&v48;
    if (v43)
      v16 = 1;
    else
      v16 = (_QWORD)v49 == 3;
    v17 = v16 || *(double *)&v48 == 0.0;
    if (v17 && *(double *)&v45 != 0.0 && (unint64_t)(v46 - 3) >= 5 && (_QWORD)v46)
    {
      GEOGetOfflineStateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 2;
        goto LABEL_23;
      }
      *(_WORD *)v51 = 0;
      v19 = "Last event successfully failed-over to offline, suggesting offline";
      v13 = 2;
      v20 = v12;
      v21 = OS_LOG_TYPE_INFO;
      goto LABEL_66;
    }
    if (*(double *)&v48 != 0.0)
    {
      switch((uint64_t)v49)
      {
        case 0:
        case 4:
        case 5:
        case 6:
        case 7:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v51 = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid network event found in lastResult", v51, 2u);
          }
          goto LABEL_72;
        case 1:
          if (!HIDWORD(v60) && v61 < 2)
            goto LABEL_72;
          if (!UInteger)
            goto LABEL_89;
          GEOGetOfflineStateLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            goto LABEL_56;
          *(_WORD *)v51 = 0;
          v22 = "Conditions improving, suggesting online";
          goto LABEL_55;
        case 2:
          if (v44 < 2)
            goto LABEL_72;
          if (HIDWORD(v61) <= (HIDWORD(v60) + v61))
          {
            if (v9 != 4)
              goto LABEL_72;
            if (!UInteger)
            {
LABEL_89:
              v14 = 1;
              goto LABEL_90;
            }
            GEOGetOfflineStateLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v51 = 0;
              v22 = "Conditions slow with few failures and network is up, suggesting online";
LABEL_55:
              _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, v22, v51, 2u);
            }
LABEL_56:
            v14 = 1;
            goto LABEL_45;
          }
          if (!UInteger)
          {
            v13 = 2;
            v14 = 2;
            goto LABEL_39;
          }
          GEOGetOfflineStateLog();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = 2;
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            goto LABEL_23;
          *(_WORD *)v51 = 0;
          v19 = "Conditions slow with little success, suggesting offline";
LABEL_65:
          v13 = 2;
          v20 = v12;
          v21 = OS_LOG_TYPE_DEBUG;
          break;
        case 3:
          if ((v61 + HIDWORD(v61)) < 2)
            goto LABEL_72;
          GEOGetOfflineStateLog();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = 2;
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            goto LABEL_23;
          *(_WORD *)v51 = 0;
          v19 = "Conditions degrading, suggesting offline";
          goto LABEL_65;
        default:
          goto LABEL_72;
      }
LABEL_66:
      _os_log_impl(&dword_1885A9000, v20, v21, v19, v51, 2u);
      goto LABEL_23;
    }
    if (v9 == 4)
    {
      if (UInteger)
      {
        GEOGetOfflineStateLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "No events available but network is up, suggesting online", v51, 2u);
        }
        v14 = 3;
LABEL_45:

      }
      else
      {
        v14 = 3;
      }
LABEL_90:
      v29 = -[GEOOfflineStateManager _stateForCohort:key:](WeakRetained, CFSTR("com.apple.Maps"), CFSTR("reason"));
      if (v43)
        -[GEOOfflineStateManager _setNeedsStateUpdate]((uint64_t)WeakRetained);
      v13 = 1;
      if (v14 == 1 || v29 != 2)
        goto LABEL_39;
      if (!UInteger)
        goto LABEL_99;
      GEOGetOfflineStateLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v51 = 0;
        v24 = "Last suggestion was due to failing requests, supressing online suggestion";
        goto LABEL_97;
      }
      goto LABEL_98;
    }
LABEL_72:
    if (!objc_msgSend(WeakRetained, "currentSuggestedStateForCohortId:", CFSTR("com.apple.Maps"), v15, WeakRetained, v31, 3221225472, __54__GEOOfflineStateManager__setNeedsStateUpdateIsolated__block_invoke_2, &unk_1E1C00178, WeakRetained))
    {
      v25 = v9 == 4;
      if (v9 == 4)
        v26 = 1;
      else
        v26 = 2 * (v9 == 5);
      if (v25)
        v14 = 3;
      else
        v14 = 4;
      if (UInteger)
      {
        GEOGetOfflineStateLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          GEOOfflineSuggestedStateAsString(v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v51 = 138412290;
          *(_QWORD *)&v51[4] = v28;
          _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_DEBUG, "Conditions indeterminite, no new or previous suggestion, using current network state to suggest %@", v51, 0xCu);

        }
      }
      if (v26 == 1)
        goto LABEL_90;
      if (v26)
      {
        v13 = 2;
        goto LABEL_39;
      }
    }
    if (!UInteger)
      goto LABEL_99;
    GEOGetOfflineStateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v51 = 0;
      v24 = "Conditions indeterminite, no new suggestion";
LABEL_97:
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, v24, v51, 2u);
    }
LABEL_98:

    goto LABEL_99;
  }
  if (UInteger)
  {
    GEOGetOfflineStateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "Device is in Airplane Mode, suggesting offline", buf, 2u);
    }

  }
  -[GEOOfflineStateManager _setSuggestedState:reason:forCohortId:](WeakRetained, 2uLL, 4);
LABEL_99:

}

uint64_t __54__GEOOfflineStateManager__setNeedsStateUpdateIsolated__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  result = GEOGetMonotonicTime();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = v3;
  return result;
}

- (void)_setSuggestedState:(void *)a1 reason:(unint64_t)a2 forCohortId:(uint64_t)a3
{
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("com.apple.Maps");
  -[GEOOfflineStateManager _updateState:forKey:inCohort:](a1, a3, CFSTR("reason"), CFSTR("com.apple.Maps"));
  -[GEOOfflineStateManager _updateState:forKey:inCohort:](a1, a2, CFSTR("suggestedState"), CFSTR("com.apple.Maps"));
  GEOGetOfflineStateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    GEOOfflineSuggestedStateAsString(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if ((unint64_t)(a3 - 1) > 3)
      v10 = "Invalid(?)";
    else
      v10 = off_1E1C09130[a3 - 1];
    *(_DWORD *)buf = 138543874;
    v17 = CFSTR("com.apple.Maps");
    v18 = 2114;
    v19 = v8;
    v20 = 2082;
    v21 = v10;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "Updating \"%{public}@\" suggestion: %{public}@ with reason: %{public}s", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2, CFSTR("GEOOfflineCurrentSuggestedState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("GEOOfflineSuggestedStateChangedNotification"), CFSTR("com.apple.Maps"), v13);

}

void __38__GEOOfflineStateManager__updateState__block_invoke(uint64_t a1, __int128 *a2, double a3)
{
  uint64_t v5;
  NSObject *v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSObject *v12;
  unint64_t v13;
  const char *v14;
  NSObject *v15;
  unint64_t v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)a2 + 25) & 1) != 0)
  {
    if (*((_DWORD *)a2 + 8) == 1)
    {
      v10 = *(_QWORD *)(a1 + 40);
LABEL_28:
      v18 = *a2;
      v19 = a2[1];
      *(_DWORD *)(v10 + 32) = *((_DWORD *)a2 + 8);
      *(_OWORD *)v10 = v18;
      *(_OWORD *)(v10 + 16) = v19;
    }
  }
  else
  {
    v5 = *((_QWORD *)a2 + 2);
    switch(v5)
    {
      case 0:
      case 7:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          LOWORD(v20) = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid network event found events", (uint8_t *)&v20, 2u);
        }
        return;
      case 1:
      case 2:
        goto LABEL_16;
      case 3:
        GEOGetMonotonicTime();
        if (v11 - *(double *)a2 >= *(double *)(a1 + 72))
        {
LABEL_16:
          if (*(_QWORD *)(a1 + 80) >= 3uLL)
          {
            GEOGetOfflineStateLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v16 = *((_QWORD *)a2 + 2);
              if (v16 > 6)
                v17 = "invalid";
              else
                v17 = off_1E1C09150[v16];
              v20 = 136446722;
              v21 = v17;
              v22 = 1024;
              v23 = v16;
              v24 = 2048;
              v25 = a3;
              _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Counting ResultStatus %{public}s(%d) from %.02f ago", (uint8_t *)&v20, 0x1Cu);
            }

          }
          ++**(_DWORD **)(a1 + 48);
          ++*(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * *((_QWORD *)a2 + 2));
          v10 = *(_QWORD *)(a1 + 32);
          goto LABEL_28;
        }
        if (*(_QWORD *)(a1 + 80) >= 3uLL)
        {
          GEOGetOfflineStateLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v13 = *((_QWORD *)a2 + 2);
            if (v13 > 6)
              v14 = "invalid";
            else
              v14 = off_1E1C09150[v13];
            v20 = 136446722;
            v21 = v14;
            v22 = 1024;
            v23 = v13;
            v24 = 2048;
            v25 = a3;
            _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "NOT counting ResultStatus %{public}s(%d) from %.02f ago", (uint8_t *)&v20, 0x1Cu);
          }

        }
        **(_BYTE **)(a1 + 64) = 1;
        break;
      case 4:
      case 5:
      case 6:
        if (*(_QWORD *)(a1 + 80) >= 3uLL)
        {
          GEOGetOfflineStateLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            v8 = *((_QWORD *)a2 + 2);
            if (v8 > 6)
              v9 = "invalid";
            else
              v9 = off_1E1C09150[v8];
            v20 = 136446722;
            v21 = v9;
            v22 = 1024;
            v23 = v8;
            v24 = 2048;
            v25 = a3;
            _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Counting ResultStatus %{public}s(%d) from %.02f ago", (uint8_t *)&v20, 0x1Cu);
          }

          v5 = *((_QWORD *)a2 + 2);
        }
        ++*(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v5);
        return;
      default:
        return;
    }
  }
}

- (uint64_t)_stateForCohort:(void *)a3 key:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[GEOOfflineStateManager _stateForCohort:](a1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __42__GEOOfflineStateManager__stateForCohort___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 160), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    GEOGetOfflineStateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[5];
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEFAULT, "Cohort %@ had no previous state, using defaults", (uint8_t *)&v10, 0xCu);
    }

    defaultCohortState();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1[4] + 160), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
  }
}

- (BOOL)_updateState:(void *)a3 forKey:(void *)a4 inCohort:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a1)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  if (!+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v8))
  {
    GEOGetOfflineStateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v7;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_INFO, "Ignoring %@ change for \"%@\", buf, 0x16u);
    }

    goto LABEL_9;
  }
  -[GEOOfflineStateManager _stateForCohort:](a1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  v12 = v11 == a2;
  v13 = v11 != a2;
  if (!v12)
  {
    v14 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v7);

    v16 = (void *)MEMORY[0x1E0CB37E8];
    GEOGetMonotonicTime();
    objc_msgSend(v16, "numberWithUnsignedLongLong:", (unint64_t)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("lastUpdated"));

    v21 = v8;
    v22 = v14;
    geo_isolate_sync_data();

  }
LABEL_10:

  return v13;
}

uint64_t __55__GEOOfflineStateManager__updateState_forKey_inCohort___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  return -[GEOOfflineStateManager _writeCohortStatesIsolated:](*(_QWORD *)(a1 + 32), 1);
}

void __47__GEOOfflineStateManager__clearStateForCohort___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  -[GEOOfflineStateManager _writeCohortStatesIsolated:](*(_QWORD *)(a1 + 32), 1);
  GEOGetOfflineStateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEFAULT, "Cleared state for cohort %@", (uint8_t *)&v4, 0xCu);
  }

}

- (unint64_t)currentSuggestedStateForCohortId:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;

  v4 = a3;
  if (+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v4))
  {
    v5 = -[GEOOfflineStateManager _stateForCohort:key:](self, v4, CFSTR("suggestedState"));
    if (v5 >= 3)
      v6 = 0;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)cohortId:(id)a3 shouldAttemptFailoverForRequest:(id)a4
{
  id v6;
  BOOL v7;
  __int16 v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double Double;
  uint64_t v14;
  unint64_t v15;
  int v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((a4.var0 - 672) < 2)
    goto LABEL_25;
  if (a4.var0 != 768)
    goto LABEL_21;
  v7 = 0;
  if (a4.var1.var0 <= 0x3Cu && ((1 << SLOBYTE(a4.var1.var0)) & 0x1004108000881E86) != 0)
  {
LABEL_25:
    if (!shouldCountRequest(*(_QWORD *)&a4, 1))
      goto LABEL_21;
    if (!+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v6))
      goto LABEL_21;
    if (!+[GEOOfflineStateManager isOfflineAvailable](GEOOfflineStateManager, "isOfflineAvailable"))
      goto LABEL_21;
    v8 = (__int16)-[GEOOfflineStateManager activeStateForCohortId:](self, "activeStateForCohortId:", v6);
    v9 = v8;
    if (v8 < 2u)
      goto LABEL_21;
    if (v8 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v18 = 67109120;
        v19 = v9;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v18, 8u);
      }
      goto LABEL_21;
    }
    v10 = HIBYTE(v8);
    if (HIBYTE(v8) >= 2u)
    {
      if (HIBYTE(v8) == 2)
        goto LABEL_21;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v18 = 67109120;
        v19 = v10;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v18, 8u);
      }
    }
    if (self->_lastNetworkState.status == 4)
    {
      GEOGetMonotonicTime();
      v12 = v11;
      Double = GEOConfigGetDouble(GeoOfflineConfig_AutoFailoverAttemptInterval, (uint64_t)off_1EDF4EAD8);
      v14 = -[GEOOfflineStateManager _stateForCohort:key:](self, v6, CFSTR("failoverAttempt"));
      v15 = (unint64_t)v12;
      if (!v14 || v14 + (unint64_t)Double <= v15)
      {
        -[GEOOfflineStateManager _updateState:forKey:inCohort:](self, v15, CFSTR("failoverAttempt"), v6);
        v7 = 1;
        goto LABEL_22;
      }
    }
LABEL_21:
    v7 = 0;
  }
LABEL_22:

  return v7;
}

- (void)setState:(id)a3 savedState:(id)a4 forCohortId:(id)a5
{
  id v8;
  unint64_t var0;
  unsigned int var1;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  var0 = a3.var0;
  if (-[GEOOfflineStateManager _updateState:forKey:inCohort:](self, a3.var0, CFSTR("currentState"), v8))
  {
    -[GEOOfflineStateManager _updateState:forKey:inCohort:](self, a4.var0, CFSTR("savedState"), v8);
    if (a3.var1.var0 < 2u)
      goto LABEL_14;
    if (a3.var1.var0 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v18 = 67109120;
        LODWORD(v19) = a3.var1.var0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v18, 8u);
      }
      goto LABEL_14;
    }
    var1 = a3.var1.var1;
    if (var1 >= 2)
    {
      if (var1 == 2)
        goto LABEL_14;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v18 = 67109120;
        LODWORD(v19) = var1;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v18, 8u);
      }
    }
    GEOGetMonotonicTime();
    -[GEOOfflineStateManager _updateState:forKey:inCohort:](self, (unint64_t)v11, CFSTR("failoverAttempt"), v8);
LABEL_14:
    GEOGetOfflineStateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      GEOOfflineStateAsString(var0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GEOOfflineStateAsString(a4.var0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v8;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "Set \"%@\" state: %@ savedState %@", (uint8_t *)&v18, 0x20u);

    }
    goto LABEL_16;
  }
  GEOGetOfflineStateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    GEOOfflineStateAsString(a3.var0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GEOOfflineStateAsString(a4.var0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v8;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Did not set \"%@\" state: %@ savedState: %@", (uint8_t *)&v18, 0x20u);

  }
LABEL_16:

}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)activeStateForCohortId:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v11;
  int v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v4)
    || !+[GEOOfflineStateManager isOfflineAvailable](GEOOfflineStateManager, "isOfflineAvailable"))
  {
    v6 = 0;
    v11 = 0;
    v7 = 1;
    v9 = 512;
    goto LABEL_21;
  }
  v5 = -[GEOOfflineStateManager _stateForCohort:key:](self, v4, CFSTR("currentState"));
  v6 = BYTE3(v5);
  if (v5 - 1 >= 2)
    v7 = 1;
  else
    v7 = v5;
  if (BYTE1(v5) - 1 >= 2)
    v8 = 1;
  else
    v8 = BYTE1(v5);
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
LABEL_19:
      v9 = v8 << 8;
      goto LABEL_20;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v13 = 67109120;
      v14 = v7;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v13, 8u);
    }
  }
  if (v8 < 2)
    goto LABEL_19;
  if (v8 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v13 = 67109120;
      v14 = v8;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v13, 8u);
    }
    goto LABEL_19;
  }
  v9 = 256;
LABEL_20:
  v11 = 0x10000;
LABEL_21:

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)(v11 | (v6 << 24) | v9 | v7);
}

+ ($BD055F43A5DF7FBAA8066526AB28D3ED)activeStateForCohortId:(id)a3
{
  id v3;
  id v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  int v26;
  _QWORD v28[3];
  uint8_t buf[8];
  void *v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v3)
    || !+[GEOOfflineStateManager isOfflineAvailable](GEOOfflineStateManager, "isOfflineAvailable"))
  {
    v21 = 0;
    v26 = 0;
    v22 = 1;
    v24 = 512;
    goto LABEL_37;
  }
  v4 = v3;
  v5 = CFSTR("currentState");
  objc_opt_self();
  v6 = v4;
  v7 = (void *)objc_opt_self();
  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: !GEOPlatform.isRunningInGeod", buf, 2u);
    }
    objc_msgSend(v7, "shared");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOOfflineStateManager _stateForCohort:](v10, v6);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v6))
  {
    +[GEOEntitlements currentProcessEntitlement:](GEOEntitlements, "currentProcessEntitlement:", CFSTR("com.apple.geoservices.offline.cohort-id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_msgSend(v6, "isEqual:", v10) & 1) != 0
      || +[GEOEntitlements currentProcessIsEntitled:](GEOEntitlements, "currentProcessIsEntitled:", CFSTR("com.apple.private.network.socket-delegate")))
    {
      _getValue(GeoOfflineConfig_CohortStates, (uint64_t)off_1EDF4E978, 1, 0, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        defaultCohortState();
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;

      goto LABEL_18;
    }
    GEOGetOfflineStateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_FAULT, "Attempt to read cohort state for another process without proper entitlment", buf, 2u);
    }

    v28[0] = CFSTR("currentState");
    v28[1] = CFSTR("savedState");
    *(_QWORD *)buf = &unk_1E1E81178;
    v30 = &unk_1E1E81178;
    v28[2] = CFSTR("suggestedState");
    v31 = &unk_1E1E81190;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v28, 3);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v16 = (void *)v18;
LABEL_18:

    goto LABEL_19;
  }
  v16 = (void *)MEMORY[0x1E0C9AA70];
LABEL_19:

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("currentState"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntValue");

  v21 = HIBYTE(v20);
  if (v20 - 1 >= 2)
    v22 = 1;
  else
    v22 = v20;
  if (BYTE1(v20) - 1 >= 2)
    v23 = 1;
  else
    v23 = BYTE1(v20);
  if (v22 >= 2)
  {
    if (v22 == 2)
    {
LABEL_35:
      v24 = v23 << 8;
      goto LABEL_36;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v22;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
    }
  }
  if (v23 < 2)
    goto LABEL_35;
  if (v23 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v23;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", buf, 8u);
    }
    goto LABEL_35;
  }
  v24 = 256;
LABEL_36:
  v26 = 0x10000;
LABEL_37:

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)(v26 | (v21 << 24) | v24 | v22);
}

- (void)setSavedState:(id)a3 forCohortId:(id)a4
{
  -[GEOOfflineStateManager _updateState:forKey:inCohort:](self, a3.var0, CFSTR("savedState"), a4);
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedStateForCohortId:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v11;
  int v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[GEOOfflineStateManager isCohortAllowed:](GEOOfflineStateManager, "isCohortAllowed:", v4))
  {
    v6 = 0;
    v11 = 0;
    v9 = 0;
    v7 = 0;
    goto LABEL_20;
  }
  v5 = -[GEOOfflineStateManager _stateForCohort:key:](self, v4, CFSTR("savedState"));
  v6 = BYTE3(v5);
  if (v5 - 1 >= 2)
    v7 = 1;
  else
    v7 = v5;
  if (BYTE1(v5) - 1 >= 2)
    v8 = 1;
  else
    v8 = BYTE1(v5);
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
LABEL_18:
      v9 = v8 << 8;
      goto LABEL_19;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v13 = 67109120;
      v14 = v7;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v13, 8u);
    }
  }
  if (v8 < 2)
    goto LABEL_18;
  if (v8 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v13 = 67109120;
      v14 = v8;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v13, 8u);
    }
    goto LABEL_18;
  }
  v9 = 256;
LABEL_19:
  v11 = 0x10000;
LABEL_20:

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)(v11 | (v6 << 24) | v9 | v7);
}

- (void).cxx_destruct
{
  Result *begin;

  objc_storeStrong((id *)&self->_connectivityCheckTask, 0);
  objc_storeStrong((id *)&self->_connectivityCheckQueue, 0);
  objc_storeStrong((id *)&self->_statesByCohortId, 0);
  objc_storeStrong((id *)&self->_updateStateTimer, 0);
  objc_storeStrong((id *)&self->_radioPrefsQueue, 0);
  objc_storeStrong((id *)&self->_radiosPrefs, 0);
  begin = self->_trackedRequests.__begin_;
  if (begin)
  {
    self->_trackedRequests.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_acceptableDurations, 0);
  objc_storeStrong((id *)&self->_isolator, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_DWORD *)self + 28) = 0;
  return self;
}

@end
