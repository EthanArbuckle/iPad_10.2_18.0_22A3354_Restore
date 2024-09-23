@implementation RTRoutineManager

uint64_t __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __34__RTRoutineManager_defaultManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = v0;

}

- (RTRoutineManager)init
{
  return -[RTRoutineManager initWithRestorationIdentifier:targertUserSession:](self, "initWithRestorationIdentifier:targertUserSession:", 0, 0);
}

- (RTRoutineManager)initWithRestorationIdentifier:(id)a3 targertUserSession:(BOOL)a4
{
  id v6;
  RTRoutineManager *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  RTRoutineManager *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  RTTokenBucket *v21;
  RTTokenBucket *clientThrottle;
  uint64_t v23;
  RTRoutineManagerRegistrantScenarioTrigger *scenarioTriggerRegistrant;
  NSObject *v25;
  RTRoutineManagerRegistrantPeopleDiscovery *v26;
  RTRoutineManagerRegistrantPeopleDiscovery *peopleDiscoveryRegistrant;
  uint64_t v28;
  NSString *restorationIdentifier;
  RTEventAgentHelper *v30;
  RTEventAgentHelper *eventAgentHelper;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  uint8_t buf[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)RTRoutineManager;
  v7 = -[RTRoutineManager init](&v39, sel_init);
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v34 = v6;
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
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
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
            _rt_log_facility_get_os_log(RTLogFacilityFramework);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v13;
              _os_log_debug_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        }
        while (v10);
      }

      v6 = v34;
    }
    v15 = v7;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (const char *)-[RTRoutineManager UTF8String](objc_retainAutorelease(v15), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v15);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (const char *)objc_msgSend(v18, "UTF8String");

    }
    v19 = dispatch_queue_create(v17, v16);

    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v19;

    v21 = -[RTTokenBucket initWithFillRate:capacity:initialAllocation:]([RTTokenBucket alloc], "initWithFillRate:capacity:initialAllocation:", 10.0, 10.0, 10.0);
    clientThrottle = v15->_clientThrottle;
    v15->_clientThrottle = v21;

    v23 = objc_opt_new();
    scenarioTriggerRegistrant = v15->_scenarioTriggerRegistrant;
    v15->_scenarioTriggerRegistrant = (RTRoutineManagerRegistrantScenarioTrigger *)v23;

    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v6;
      _os_log_impl(&dword_1A5E26000, v25, OS_LOG_TYPE_DEFAULT, "rdar122420473 creating _peopleDiscoveryRegistrant initWithConfigurationIdentifier %@", buf, 0xCu);
    }

    v26 = -[RTRoutineManagerRegistrantPeopleDiscovery initWithConfigurationIdentifier:]([RTRoutineManagerRegistrantPeopleDiscovery alloc], "initWithConfigurationIdentifier:", v6);
    peopleDiscoveryRegistrant = v15->_peopleDiscoveryRegistrant;
    v15->_peopleDiscoveryRegistrant = v26;

    v28 = objc_msgSend(v6, "copy");
    restorationIdentifier = v15->_restorationIdentifier;
    v15->_restorationIdentifier = (NSString *)v28;

    v30 = -[RTEventAgentHelper initWithRestorationIdentifier:]([RTEventAgentHelper alloc], "initWithRestorationIdentifier:", v15->_restorationIdentifier);
    eventAgentHelper = v15->_eventAgentHelper;
    v15->_eventAgentHelper = v30;

    v15->_targetUserSession = a4;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v15, (CFNotificationCallback)onDaemonStartNotification, CFSTR("com.apple.routined.registration"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[RTRoutineManager createConnection](v15, "createConnection");
  }

  return v7;
}

- (void)createConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[RTRoutineManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__RTRoutineManager_createConnection__block_invoke;
  block[3] = &unk_1E4FB0A90;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_proxyForServicingSelector:(SEL)a3 withErrorHandler:(id)a4
{
  return -[RTRoutineManager _proxyForServicingSelector:asynchronous:withErrorHandler:](self, "_proxyForServicingSelector:asynchronous:withErrorHandler:", a3, 1, a4);
}

- (id)_proxyForServicingSelector:(SEL)a3 asynchronous:(BOOL)a4 withErrorHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  SEL v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v5 = a4;
  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __77__RTRoutineManager__proxyForServicingSelector_asynchronous_withErrorHandler___block_invoke;
  v30[3] = &unk_1E4FB0B08;
  v30[4] = self;
  v32 = a3;
  v9 = v8;
  v31 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85B6C24](v30);
  if (!-[RTRoutineManager selectorIsAllowed:](self, "selectorIsAllowed:", a3)
    && !-[RTTokenBucket operationAllowed](self->_clientThrottle, "operationAllowed"))
  {
    v37 = *MEMORY[0x1E0CB2D50];
    v38[0] = CFSTR("Client is exceeding maximum call rate!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 12, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      -[RTTokenBucket dumpStatistics](self->_clientThrottle, "dumpStatistics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v12;
      v35 = 2112;
      v36 = v28;
      _os_log_fault_impl(&dword_1A5E26000, v13, OS_LOG_TYPE_FAULT, "Error: %@, %@", buf, 0x16u);

    }
  }
  -[RTRoutineManager xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  if (!v14)
  {
    v23 = CFSTR("no xpc connection");
LABEL_15:
    RTErrorConnectionCreate(a3, v23, v15, v16, v17, v18, v19, v20, v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v26);

    v25 = 0;
    goto LABEL_16;
  }
  if (v5)
  {
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v10);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5E26000, v24, OS_LOG_TYPE_INFO, "vending synchronous remote object proxy.", buf, 2u);
    }

    objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v22;
  if (!v22)
  {
    v23 = CFSTR("no remote object proxy");
    goto LABEL_15;
  }
LABEL_16:

  return v25;
}

- (BOOL)selectorIsAllowed:(SEL)a3
{
  return sel_isEqual(a3, sel_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler_);
}

- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 withHandler:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(id, _QWORD, id);
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, _QWORD, id);
  _QWORD v22[4];
  void (**v23)(id, _QWORD, id);
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v14 = (void (**)(id, _QWORD, id))a4;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTRoutineManager fetchLocationsOfInterestVisitedSinceDate:withHandler:]";
      v26 = 1024;
      v27 = 1941;
      _os_log_error_impl(&dword_1A5E26000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v7)
      goto LABEL_3;
LABEL_7:
    RTErrorInvalidParameterCreate(a2, CFSTR("sinceDate is required"), v8, v9, v10, v11, v12, v13, v18);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v16);
    goto LABEL_8;
  }
  if (!v7)
    goto LABEL_7;
LABEL_3:
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke;
  v22[3] = &unk_1E4FB0B30;
  v23 = v14;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke_2;
  v19[3] = &unk_1E4FB0BA8;
  v20 = v7;
  v21 = v23;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v22, v19);

  v16 = v23;
LABEL_8:

}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withHandler:(id)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:]";
      v18 = 1024;
      v19 = 1926;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke;
  v14[3] = &unk_1E4FB0B30;
  v15 = v7;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke_2;
  v11[3] = &unk_1E4FB1068;
  v12 = v15;
  v13 = a3;
  v10 = v15;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v14, v11);

}

- (void)fetchLocationOfInterestAtLocation:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTRoutineManager fetchLocationOfInterestAtLocation:withHandler:]";
      v20 = 1024;
      v21 = 1878;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke_2;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_createConnection
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RTRoutineManagerExportedObject *v12;
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
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  uint64_t v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  uint64_t v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  uint64_t v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  uint64_t v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  uint64_t v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  uint64_t v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  uint64_t v280;
  void *v281;
  void *v282;
  void *v283;
  uint64_t v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  uint64_t v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  _QWORD v304[5];
  _QWORD v305[5];

  -[RTRoutineManager xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.routined.registration"), 4096);
  -[RTRoutineManager setXpcConnection:](self, "setXpcConnection:", v5);

  -[RTRoutineManager xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTRoutineManager queue](self, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setQueue:", v8);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE80C918);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExportedInterface:", v10);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[RTRoutineManagerExportedObject initWithRoutineManager:]([RTRoutineManagerExportedObject alloc], "initWithRoutineManager:", self);
    objc_msgSend(v11, "setExportedObject:", v12);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exportedInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_onVehicleEvents_error_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "exportedInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_onDensityUpdate_error_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "exportedInterface");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_onPlaceInferences_error_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE815A58);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setRemoteObjectInterface:", v29);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "remoteObjectInterface");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_fetchPathToDiagnosticFilesWithOptions_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "remoteObjectInterface");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_fetchLocationsOfInterestWithinDistance_ofLocation_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "remoteObjectInterface");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_fetchLocationsOfInterestOfType_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "remoteObjectInterface");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "remoteObjectInterface");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_fetchAllLocationsOfInterestForSettingsWithReply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "remoteObjectInterface");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)MEMORY[0x1E0C99E60];
    v56 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setClasses:forSelector:argumentIndex:ofReply:", v57, sel_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "remoteObjectInterface");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)MEMORY[0x1E0C99E60];
    v61 = objc_opt_class();
    objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_fetchLocationsOfInterestAssociatedToIdentifier_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "remoteObjectInterface");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)MEMORY[0x1E0C99E60];
    v66 = objc_opt_class();
    objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setClasses:forSelector:argumentIndex:ofReply:", v67, sel_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "remoteObjectInterface");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)MEMORY[0x1E0C99E60];
    v71 = objc_opt_class();
    objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_fetchPredictedLocationsOfInterestOnDate_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "remoteObjectInterface");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)MEMORY[0x1E0C99E60];
    v76 = objc_opt_class();
    objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setClasses:forSelector:argumentIndex:ofReply:", v77, sel_fetchPredictedExitDatesFromLocation_onDate_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "remoteObjectInterface");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)MEMORY[0x1E0C99E60];
    v81 = objc_opt_class();
    objc_msgSend(v80, "setWithObjects:", v81, objc_opt_class(), 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "remoteObjectInterface");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (void *)MEMORY[0x1E0C99E60];
    v86 = objc_opt_class();
    v87 = objc_opt_class();
    objc_msgSend(v85, "setWithObjects:", v86, v87, objc_opt_class(), 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setClasses:forSelector:argumentIndex:ofReply:", v88, sel_performBluePOIQueryLookingBack_lookingAhead_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "remoteObjectInterface");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)MEMORY[0x1E0C99E60];
    v92 = objc_opt_class();
    v93 = objc_opt_class();
    v94 = objc_opt_class();
    v95 = objc_opt_class();
    objc_msgSend(v91, "setWithObjects:", v92, v93, v94, v95, objc_opt_class(), 0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setClasses:forSelector:argumentIndex:ofReply:", v96, sel_performBluePOIQueryLookingBack_lookingAhead_reply_, 1, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "remoteObjectInterface");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (void *)MEMORY[0x1E0C99E60];
    v100 = objc_opt_class();
    objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setClasses:forSelector:argumentIndex:ofReply:", v101, sel_performBluePOIQueryLookingBack_lookingAhead_reply_, 2, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "remoteObjectInterface");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (void *)MEMORY[0x1E0C99E60];
    v105 = objc_opt_class();
    objc_msgSend(v104, "setWithObjects:", v105, objc_opt_class(), 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setClasses:forSelector:argumentIndex:ofReply:", v106, sel_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "remoteObjectInterface");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)MEMORY[0x1E0C99E60];
    v110 = objc_opt_class();
    objc_msgSend(v109, "setWithObjects:", v110, objc_opt_class(), 0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_fetchLastVehicleEventsWithReply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "remoteObjectInterface");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = (void *)MEMORY[0x1E0C99E60];
    v115 = objc_opt_class();
    objc_msgSend(v114, "setWithObjects:", v115, objc_opt_class(), 0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setClasses:forSelector:argumentIndex:ofReply:", v116, sel_fetchLocationOfInterestWithIdentifier_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "remoteObjectInterface");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = (void *)MEMORY[0x1E0C99E60];
    v120 = objc_opt_class();
    objc_msgSend(v119, "setWithObjects:", v120, objc_opt_class(), 0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setClasses:forSelector:argumentIndex:ofReply:", v121, sel_addLocationOfInterestOfType_mapItemStorage_customLabel_reply_, 1, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "remoteObjectInterface");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = (void *)MEMORY[0x1E0C99E60];
    v125 = objc_opt_class();
    objc_msgSend(v124, "setWithObjects:", v125, objc_opt_class(), 0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setClasses:forSelector:argumentIndex:ofReply:", v126, sel_fetchTransitionsBetweenStartDate_endDate_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "remoteObjectInterface");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = (void *)MEMORY[0x1E0C99E60];
    v130 = objc_opt_class();
    objc_msgSend(v129, "setWithObjects:", v130, objc_opt_class(), 0);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setClasses:forSelector:argumentIndex:ofReply:", v131, sel_fetchStoredLocationsWithContext_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "remoteObjectInterface");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = (void *)MEMORY[0x1E0C99E60];
    v135 = objc_opt_class();
    objc_msgSend(v134, "setWithObjects:", v135, objc_opt_class(), 0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "setClasses:forSelector:argumentIndex:ofReply:", v136, sel_fetchStoredLocationsWithContext_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "remoteObjectInterface");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = (void *)MEMORY[0x1E0C99E60];
    v140 = objc_opt_class();
    objc_msgSend(v139, "setWithObjects:", v140, objc_opt_class(), 0);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setClasses:forSelector:argumentIndex:ofReply:", v141, sel_fetchPlaceInferencesWithOptions_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "remoteObjectInterface");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = (void *)MEMORY[0x1E0C99E60];
    v145 = objc_opt_class();
    objc_msgSend(v144, "setWithObjects:", v145, objc_opt_class(), 0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setClasses:forSelector:argumentIndex:ofReply:", v146, sel_fetchFamiliarityIndexResultsWithOptions_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "remoteObjectInterface");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchAuthorizedLocationStatus_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "remoteObjectInterface");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = (void *)MEMORY[0x1E0C99E60];
    v152 = objc_opt_class();
    objc_msgSend(v151, "setWithObjects:", v152, objc_opt_class(), 0);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setClasses:forSelector:argumentIndex:ofReply:", v153, sel_fetchEstimatedLocationAtDate_options_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "remoteObjectInterface");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setClasses:forSelector:argumentIndex:ofReply:", v156, sel_fetchEstimatedLocationAtDate_options_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "remoteObjectInterface");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "setClasses:forSelector:argumentIndex:ofReply:", v159, sel_fetchEstimatedLocationAtDate_options_reply_, 1, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "remoteObjectInterface");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = (void *)MEMORY[0x1E0C99E60];
    v163 = objc_opt_class();
    objc_msgSend(v162, "setWithObjects:", v163, objc_opt_class(), 0);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setClasses:forSelector:argumentIndex:ofReply:", v164, sel_fetchStoredVisitsWithOptions_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "remoteObjectInterface");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = (void *)MEMORY[0x1E0C99E60];
    v168 = objc_opt_class();
    objc_msgSend(v167, "setWithObjects:", v168, objc_opt_class(), 0);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setClasses:forSelector:argumentIndex:ofReply:", v169, sel_fetchTripSegmentsWithOptions_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "remoteObjectInterface");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchLocationsForTripSegmentWithOptions_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "remoteObjectInterface");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = (void *)MEMORY[0x1E0C99E60];
    v175 = objc_opt_class();
    objc_msgSend(v174, "setWithObjects:", v175, objc_opt_class(), 0);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "setClasses:forSelector:argumentIndex:ofReply:", v176, sel_fetchLocationsForTripSegmentWithOptions_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "remoteObjectInterface");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setClasses:forSelector:argumentIndex:ofReply:", v179, sel_deleteTripSegmentWithUUID_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "remoteObjectInterface");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = (void *)MEMORY[0x1E0C99E60];
    v183 = objc_opt_class();
    objc_msgSend(v182, "setWithObjects:", v183, objc_opt_class(), 0);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "setClasses:forSelector:argumentIndex:ofReply:", v184, sel_fetchVehiclesWithOptions_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "remoteObjectInterface");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchTripSegmentMetadataWithOptions_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "remoteObjectInterface");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = (void *)MEMORY[0x1E0C99E60];
    v190 = objc_opt_class();
    objc_msgSend(v189, "setWithObjects:", v190, objc_opt_class(), 0);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setClasses:forSelector:argumentIndex:ofReply:", v191, sel_fetchTripSegmentMetadataWithOptions_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "remoteObjectInterface");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v194 = (void *)MEMORY[0x1E0C99E60];
    v195 = objc_opt_class();
    v196 = objc_opt_class();
    objc_msgSend(v194, "setWithObjects:", v195, v196, objc_opt_class(), 0);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "setClasses:forSelector:argumentIndex:ofReply:", v197, sel_fetchEnumerableObjectsWithOptions_offset_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "remoteObjectInterface");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = (void *)MEMORY[0x1E0C99E60];
    v201 = objc_opt_class();
    v202 = objc_opt_class();
    v203 = objc_opt_class();
    objc_msgSend(v200, "setWithObjects:", v201, v202, v203, objc_opt_class(), 0);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "setClasses:forSelector:argumentIndex:ofReply:", v204, sel_fetchEnumerableObjectsWithOptions_offset_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "remoteObjectInterface");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchEnumerableObjectsWithOptions_offset_reply_, 1, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "remoteObjectInterface");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v209 = (void *)MEMORY[0x1E0C99E60];
    v210 = objc_opt_class();
    objc_msgSend(v209, "setWithObjects:", v210, objc_opt_class(), 0);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "setClasses:forSelector:argumentIndex:ofReply:", v211, sel_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "remoteObjectInterface");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = (void *)MEMORY[0x1E0C99E60];
    v215 = objc_opt_class();
    objc_msgSend(v214, "setWithObjects:", v215, objc_opt_class(), 0);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "setClasses:forSelector:argumentIndex:ofReply:", v216, sel_fetchElevationsWithOptions_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "remoteObjectInterface");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = (void *)MEMORY[0x1E0C99E60];
    v220 = objc_opt_class();
    objc_msgSend(v219, "setWithObjects:", v220, objc_opt_class(), 0);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "setClasses:forSelector:argumentIndex:ofReply:", v221, sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "remoteObjectInterface");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = (void *)MEMORY[0x1E0C99E60];
    v225 = objc_opt_class();
    objc_msgSend(v224, "setWithObjects:", v225, objc_opt_class(), 0);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "setClasses:forSelector:argumentIndex:ofReply:", v226, sel_addBackgroundInertialOdometrySamples_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "remoteObjectInterface");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "setClasses:forSelector:argumentIndex:ofReply:", v229, sel_startMonitoringPlaceInferencesWithOptions_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "remoteObjectInterface");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_startMonitoringForPeopleDiscovery_configuration_reply_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "remoteObjectInterface");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v233, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchOngoingPeopleDensity_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v234, "remoteObjectInterface");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "remoteObjectInterface");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v237, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_, 1, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "remoteObjectInterface");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    v240 = (void *)MEMORY[0x1E0C99E60];
    v241 = objc_opt_class();
    objc_msgSend(v240, "setWithObjects:", v241, objc_opt_class(), 0);
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v239, "setClasses:forSelector:argumentIndex:ofReply:", v242, sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v243, "remoteObjectInterface");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v245 = (void *)MEMORY[0x1E0C99E60];
    v246 = objc_opt_class();
    objc_msgSend(v245, "setWithObjects:", v246, objc_opt_class(), 0);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v244, "setClasses:forSelector:argumentIndex:ofReply:", v247, sel_fetchProximityHistoryFromEventIDs_completionHandler_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v248, "remoteObjectInterface");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = (void *)MEMORY[0x1E0C99E60];
    v251 = objc_opt_class();
    objc_msgSend(v250, "setWithObjects:", v251, objc_opt_class(), 0);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v249, "setClasses:forSelector:argumentIndex:ofReply:", v252, sel_fetchProximityHistoryFromEventIDs_completionHandler_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v253, "remoteObjectInterface");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    v255 = (void *)MEMORY[0x1E0C99E60];
    v256 = objc_opt_class();
    objc_msgSend(v255, "setWithObjects:", v256, objc_opt_class(), 0);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v254, "setClasses:forSelector:argumentIndex:ofReply:", v257, sel_fetchPeopleCountEventsHistory_completionHandler_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "remoteObjectInterface");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    v260 = (void *)MEMORY[0x1E0C99E60];
    v261 = objc_opt_class();
    objc_msgSend(v260, "setWithObjects:", v261, objc_opt_class(), 0);
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "setClasses:forSelector:argumentIndex:ofReply:", v262, sel_fetchPeopleCountEventsHistory_completionHandler_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v263, "remoteObjectInterface");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v264, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v265, "remoteObjectInterface");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_, 1, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "remoteObjectInterface");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    v269 = (void *)MEMORY[0x1E0C99E60];
    v270 = objc_opt_class();
    objc_msgSend(v269, "setWithObjects:", v270, objc_opt_class(), 0);
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "setClasses:forSelector:argumentIndex:ofReply:", v271, sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v272, "remoteObjectInterface");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = (void *)MEMORY[0x1E0C99E60];
    v275 = objc_opt_class();
    objc_msgSend(v274, "setWithObjects:", v275, objc_opt_class(), 0);
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v273, "setClasses:forSelector:argumentIndex:ofReply:", v276, sel_fetchContactScoresFromContactIDs_completionHandler_, 0, 0);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v277, "remoteObjectInterface");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    v279 = (void *)MEMORY[0x1E0C99E60];
    v280 = objc_opt_class();
    objc_msgSend(v279, "setWithObjects:", v280, objc_opt_class(), 0);
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v278, "setClasses:forSelector:argumentIndex:ofReply:", v281, sel_fetchContactScoresFromContactIDs_completionHandler_, 0, 1);

    -[RTRoutineManager xpcConnection](self, "xpcConnection");
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v282, "resume");

    -[RTRoutineManager restorationIdentifier](self, "restorationIdentifier");
    v283 = (void *)objc_claimAutoreleasedReturnValue();

    v284 = MEMORY[0x1E0C809B0];
    if (v283)
    {
      -[RTRoutineManager xpcConnection](self, "xpcConnection");
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      v305[0] = v284;
      v305[1] = 3221225472;
      v305[2] = __37__RTRoutineManager__createConnection__block_invoke;
      v305[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v305[4] = a2;
      objc_msgSend(v285, "remoteObjectProxyWithErrorHandler:", v305);
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTRoutineManager restorationIdentifier](self, "restorationIdentifier");
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v286, "setRestorationIdentifier:", v287);

    }
    -[RTRoutineManager visitHandler](self, "visitHandler");
    v288 = (void *)objc_claimAutoreleasedReturnValue();

    if (v288)
    {
      -[RTRoutineManager visitHandler](self, "visitHandler");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTRoutineManager startMonitoringVisitsWithHandler:](self, "startMonitoringVisitsWithHandler:", v289);

    }
    -[RTRoutineManager leechedVisitHandler](self, "leechedVisitHandler");
    v290 = (void *)objc_claimAutoreleasedReturnValue();

    if (v290)
    {
      -[RTRoutineManager leechedVisitHandler](self, "leechedVisitHandler");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTRoutineManager startLeechingVisitsWithHandler:](self, "startLeechingVisitsWithHandler:", v291);

    }
    -[RTRoutineManager leechedLowConfidenceVisitHandler](self, "leechedLowConfidenceVisitHandler");
    v292 = (void *)objc_claimAutoreleasedReturnValue();

    if (v292)
    {
      -[RTRoutineManager leechedLowConfidenceVisitHandler](self, "leechedLowConfidenceVisitHandler");
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTRoutineManager startLeechingLowConfidenceVisitsWithHandler:](self, "startLeechingLowConfidenceVisitsWithHandler:", v293);

    }
    -[RTRoutineManager placeInferencesHandler](self, "placeInferencesHandler");
    v294 = objc_claimAutoreleasedReturnValue();
    if (v294)
    {
      v295 = (void *)v294;
      -[RTRoutineManager placeInferenceOptions](self, "placeInferenceOptions");
      v296 = (void *)objc_claimAutoreleasedReturnValue();

      if (v296)
      {
        -[RTRoutineManager placeInferenceOptions](self, "placeInferenceOptions");
        v297 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTRoutineManager placeInferencesHandler](self, "placeInferencesHandler");
        v298 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTRoutineManager startMonitoringPlaceInferencesWithOptions:handler:](self, "startMonitoringPlaceInferencesWithOptions:handler:", v297, v298);

      }
    }
    if (-[RTRoutineManagerRegistrantScenarioTrigger registered](self->_scenarioTriggerRegistrant, "registered"))
    {
      -[RTRoutineManagerRegistrantScenarioTrigger scenarioTriggerHandlers](self->_scenarioTriggerRegistrant, "scenarioTriggerHandlers");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      v304[0] = v284;
      v304[1] = 3221225472;
      v304[2] = __37__RTRoutineManager__createConnection__block_invoke_353;
      v304[3] = &unk_1E4FB0A68;
      v304[4] = self;
      objc_msgSend(v299, "enumerateKeysAndObjectsUsingBlock:", v304);

    }
    if (-[RTRoutineManagerRegistrantPeopleDiscovery registered](self->_peopleDiscoveryRegistrant, "registered"))
    {
      -[RTRoutineManagerRegistrantPeopleDiscovery configuration](self->_peopleDiscoveryRegistrant, "configuration");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTRoutineManager peopleDiscoveryErrorHandler](self, "peopleDiscoveryErrorHandler");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTRoutineManager startMonitoringForPeopleDiscovery:handler:](self, "startMonitoringForPeopleDiscovery:handler:", v300, v301);

    }
    -[RTRoutineManager vehicleEventsHandler](self, "vehicleEventsHandler");
    v302 = (void *)objc_claimAutoreleasedReturnValue();

    if (v302)
    {
      -[RTRoutineManager vehicleEventsHandler](self, "vehicleEventsHandler");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTRoutineManager startMonitoringVehicleEventsWithHandler:](self, "startMonitoringVehicleEventsWithHandler:", v303);

    }
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (id)visitHandler
{
  return self->_visitHandler;
}

- (id)vehicleEventsHandler
{
  return self->_vehicleEventsHandler;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSString)restorationIdentifier
{
  return self->_restorationIdentifier;
}

- (id)leechedVisitHandler
{
  return self->_leechedVisitHandler;
}

- (id)leechedLowConfidenceVisitHandler
{
  return self->_leechedLowConfidenceVisitHandler;
}

+ (id)defaultManager
{
  if (qword_1ECF931C8 != -1)
    dispatch_once(&qword_1ECF931C8, &__block_literal_global);
  return (id)_MergedGlobals_7;
}

uint64_t __36__RTRoutineManager_createConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createConnection");
}

- (void)fetchPlaceInferencesWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_7;
  }
  if (!v7)
  {
    RTErrorInvalidParameterCreate(a2, CFSTR("options is required"), v9, v10, v11, v12, v13, v14, v18);
    v17 = objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, NSObject *))v15)[2](v15, 0, v17);
LABEL_7:

    goto LABEL_8;
  }
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__RTRoutineManager_fetchPlaceInferencesWithOptions_handler___block_invoke;
  v22[3] = &unk_1E4FB0B30;
  v23 = v8;
  v19[0] = v16;
  v19[1] = 3221225472;
  v19[2] = __60__RTRoutineManager_fetchPlaceInferencesWithOptions_handler___block_invoke_2;
  v19[3] = &unk_1E4FB0BA8;
  v20 = v7;
  v21 = v23;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v22, v19);

LABEL_8:
}

uint64_t __60__RTRoutineManager_fetchPlaceInferencesWithOptions_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)routineModeToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("Tourist");
  if (a3 == 1)
    return CFSTR("Local");
  else
    return (id)v3;
}

+ (id)modeOfTransportationToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_1E4FB1320[a3 - 1];
}

- (RTRoutineManager)initWithRestorationIdentifier:(id)a3
{
  return -[RTRoutineManager initWithRestorationIdentifier:targertUserSession:](self, "initWithRestorationIdentifier:targertUserSession:", a3, 0);
}

- (RTRoutineManager)initWithTargetUserSession:(BOOL)a3
{
  return -[RTRoutineManager initWithRestorationIdentifier:targertUserSession:](self, "initWithRestorationIdentifier:targertUserSession:", 0, a3);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[RTRoutineManager xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)RTRoutineManager;
  -[RTRoutineManager dealloc](&v5, sel_dealloc);
}

void __37__RTRoutineManager__createConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  RTErrorConnectionCreate(*(const char **)(a1 + 32), CFSTR("%@"), a3, a4, a5, a6, a7, a8, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
  }

}

void __37__RTRoutineManager__createConnection__block_invoke_353(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "startMonitoringScenarioTriggerOfType:withHandler:", objc_msgSend(a2, "unsignedIntegerValue"), v5);

}

- (void)launchTaskWithSelector:(SEL)a3 remainingAttempts:(unint64_t)a4 proxyErrorHandler:(id)a5 taskBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  SEL v18;
  unint64_t v19;

  v10 = a5;
  v11 = a6;
  -[RTRoutineManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__RTRoutineManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke;
  block[3] = &unk_1E4FB0AB8;
  v18 = a3;
  v19 = a4;
  block[4] = self;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

uint64_t __89__RTRoutineManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_launchTaskWithSelector:(SEL)a3 remainingAttempts:(unint64_t)a4 proxyErrorHandler:(id)a5 taskBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  id v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  SEL v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__RTRoutineManager__launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke;
  v19[3] = &unk_1E4FB0AE0;
  v22 = a4;
  v23 = a3;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v12 = (void (**)(id, void *))v11;
  v13 = v10;
  -[RTRoutineManager _proxyForServicingSelector:withErrorHandler:](self, "_proxyForServicingSelector:withErrorHandler:", a3, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v17;
    v26 = 2112;
    v27 = v18;
    _os_log_impl(&dword_1A5E26000, v15, OS_LOG_TYPE_INFO, "%@, %@, running task block", buf, 0x16u);

  }
  v12[2](v12, v14);

}

void __90__RTRoutineManager__launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != CFSTR("RTErrorDomain"))
  {

LABEL_8:
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = (uint64_t)v3;
      _os_log_error_impl(&dword_1A5E26000, v12, OS_LOG_TYPE_ERROR, "%@, %@, running proxy error handler, %@", (uint8_t *)&v16, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_11;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != 8 || !*(_QWORD *)(a1 + 56))
    goto LABEL_8;
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56) - 1;
    v16 = 138412802;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    _os_log_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_INFO, "%@ retrying, %@, count, %lu", (uint8_t *)&v16, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_11:

}

void __77__RTRoutineManager__proxyForServicingSelector_asynchronous_withErrorHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  RTErrorConnectionCreate(*(const char **)(a1 + 48), CFSTR("%@"), a3, a4, a5, a6, a7, a8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_error_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);

}

- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(id, _QWORD, id);
  uint64_t v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  uint64_t v22[4];
  id v23;
  id v24;
  void (**v25)(id, _QWORD, id);
  _QWORD v26[4];
  void (**v27)(id, _QWORD, id);
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v17 = (void (**)(id, _QWORD, id))a5;
  if (v17)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    v21 = CFSTR("startDate is required");
LABEL_10:
    RTErrorInvalidParameterCreate(a2, v21, v11, v12, v13, v14, v15, v16, v22[0]);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v19);
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[RTRoutineManager fetchTransitionsBetweenStartDate:endDate:handler:]";
    v30 = 1024;
    v31 = 819;
    _os_log_error_impl(&dword_1A5E26000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
    goto LABEL_8;
LABEL_3:
  if (!v10)
  {
    v21 = CFSTR("endDate is required");
    goto LABEL_10;
  }
  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
  v26[3] = &unk_1E4FB0B30;
  v27 = v17;
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = (uint64_t)__69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_2;
  v22[3] = (uint64_t)&unk_1E4FB0B80;
  v23 = v9;
  v24 = v10;
  v25 = v27;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v26, v22);

  v19 = v27;
LABEL_11:

}

uint64_t __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_3;
  v5[3] = &unk_1E4FB0B58;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "fetchTransitionsBetweenStartDate:endDate:reply:", v3, v4, v5);

}

uint64_t __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTRoutineManager fetchTripSegmentsWithOptions:handler:]";
      v21 = 1024;
      v22 = 845;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchTripSegmentsWithOptions.", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke;
  v17[3] = &unk_1E4FB0B30;
  v18 = v8;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke_2;
  v14[3] = &unk_1E4FB0BA8;
  v15 = v7;
  v16 = v18;
  v12 = v18;
  v13 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

}

uint64_t __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchTripSegmentsWithOptions:reply:", v3, v4);

}

uint64_t __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationsCountForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTRoutineManager fetchLocationsCountForTripSegmentWithOptions:handler:]";
      v21 = 1024;
      v22 = 866;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchLocationsForTripSegment.", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke;
  v17[3] = &unk_1E4FB0B30;
  v18 = v8;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke_2;
  v14[3] = &unk_1E4FB0BA8;
  v15 = v7;
  v16 = v18;
  v12 = v18;
  v13 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

}

uint64_t __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0BD0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchLocationsCountForTripSegmentWithOptions:reply:", v3, v4);

}

uint64_t __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationsForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTRoutineManager fetchLocationsForTripSegmentWithOptions:handler:]";
      v21 = 1024;
      v22 = 885;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchLocationsForTripSegmentWithOptions.", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke;
  v17[3] = &unk_1E4FB0B30;
  v18 = v8;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke_2;
  v14[3] = &unk_1E4FB0BA8;
  v15 = v7;
  v16 = v18;
  v12 = v18;
  v13 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

}

uint64_t __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchLocationsForTripSegmentWithOptions:reply:", v3, v4);

}

uint64_t __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTRoutineManager deleteTripSegmentWithUUID:handler:]";
      v21 = 1024;
      v22 = 903;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked deleteTripSegmentWithUUID.", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke;
  v17[3] = &unk_1E4FB0B30;
  v18 = v8;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke_2;
  v14[3] = &unk_1E4FB0BA8;
  v15 = v7;
  v16 = v18;
  v12 = v18;
  v13 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

}

uint64_t __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B30;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "deleteTripSegmentWithUUID:reply:", v3, v4);

}

uint64_t __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTripSegmentMetadataWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTRoutineManager fetchTripSegmentMetadataWithOptions:handler:]";
      v21 = 1024;
      v22 = 920;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchTripSegmentMetadataWithOptions.", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke;
  v17[3] = &unk_1E4FB0B30;
  v18 = v8;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke_2;
  v14[3] = &unk_1E4FB0BA8;
  v15 = v7;
  v16 = v18;
  v12 = v18;
  v13 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

}

uint64_t __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0BF8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchTripSegmentMetadataWithOptions:reply:", v3, v4);

}

uint64_t __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchVehiclesWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTRoutineManager fetchVehiclesWithOptions:handler:]";
      v21 = 1024;
      v22 = 938;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchVehiclesWithOptions.", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke;
  v17[3] = &unk_1E4FB0B30;
  v18 = v8;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke_2;
  v14[3] = &unk_1E4FB0BA8;
  v15 = v7;
  v16 = v18;
  v12 = v18;
  v13 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

}

uint64_t __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchVehiclesWithOptions:reply:", v3, v4);

}

uint64_t __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchRoutineEnabledWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTRoutineManager fetchRoutineEnabledWithHandler:]";
      v15 = 1024;
      v16 = 954;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke;
  v11[3] = &unk_1E4FB0B30;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke_372;
  v9[3] = &unk_1E4FB0C48;
  v10 = v12;
  v8 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

void __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Unable to determine if CoreRoutine is enabled, returning enabled, NO, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke_372(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke_2;
  v3[3] = &unk_1E4FB0C20;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchRoutineEnabledWithReply:", v3);

}

uint64_t __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchRoutineStateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTRoutineManager fetchRoutineStateWithHandler:]";
      v15 = 1024;
      v16 = 968;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke;
  v11[3] = &unk_1E4FB0B30;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke_374;
  v9[3] = &unk_1E4FB0C48;
  v10 = v12;
  v8 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

void __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Unable to determine CoreRoutine's state, returning state, RTRoutineStateUnknown, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke_374(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke_2;
  v3[3] = &unk_1E4FB0C20;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchRoutineEnabledWithReply:", v3);

}

uint64_t __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 2;
  else
    v3 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, 0);
}

- (void)setRoutineEnabled:(BOOL)a3
{
  -[RTRoutineManager setRoutineEnabled:withHandler:](self, "setRoutineEnabled:withHandler:", a3, 0);
}

- (void)setRoutineEnabled:(BOOL)a3 withHandler:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  _QWORD v13[4];
  id v14;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke;
  v13[3] = &unk_1E4FB0B30;
  v14 = v7;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke_2;
  v10[3] = &unk_1E4FB0C70;
  v12 = a3;
  v11 = v14;
  v9 = v14;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v13, v10);

}

uint64_t __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke_3;
  v4[3] = &unk_1E4FB0B30;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setRoutineEnabled:reply:", v3, v4);

}

void __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("RTErrorDomain")))
    objc_msgSend(v6, "code");

  v4 = *(_QWORD *)(a1 + 32);
  v5 = v6;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
    v5 = v6;
  }

}

- (void)clearRoutineWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__RTRoutineManager_clearRoutineWithHandler___block_invoke;
  v10[3] = &unk_1E4FB0B30;
  v11 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __44__RTRoutineManager_clearRoutineWithHandler___block_invoke_2;
  v8[3] = &unk_1E4FB0C48;
  v9 = v11;
  v7 = v11;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v10, v8);

}

uint64_t __44__RTRoutineManager_clearRoutineWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __44__RTRoutineManager_clearRoutineWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__RTRoutineManager_clearRoutineWithHandler___block_invoke_3;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "clearRoutineWithReply:", v3);

}

void __44__RTRoutineManager_clearRoutineWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("RTErrorDomain")))
    objc_msgSend(v6, "code");

  v4 = *(_QWORD *)(a1 + 32);
  v5 = v6;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
    v5 = v6;
  }

}

- (void)fetchCloudSyncAuthorizationState:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTRoutineManager fetchCloudSyncAuthorizationState:]";
      v15 = 1024;
      v16 = 1029;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke;
  v11[3] = &unk_1E4FB0B30;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke_2;
  v9[3] = &unk_1E4FB0C48;
  v10 = v12;
  v8 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke_3;
  v3[3] = &unk_1E4FB0C98;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchCloudSyncAuthorizationStateWithReply:", v3);

}

void __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("RTErrorDomain")))
    objc_msgSend(v8, "code");

  v6 = *(_QWORD *)(a1 + 32);
  v7 = v8;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
    v7 = v8;
  }

}

- (void)updateCloudSyncProvisionedForAccount:(BOOL)a3 handler:(id)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[RTRoutineManager updateCloudSyncProvisionedForAccount:handler:]";
      v18 = 1024;
      v19 = 1051;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke;
  v14[3] = &unk_1E4FB0B30;
  v15 = v7;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_2;
  v11[3] = &unk_1E4FB0C70;
  v13 = a3;
  v12 = v15;
  v10 = v15;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v14, v11);

}

uint64_t __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B30;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "updateCloudSyncProvisionedForAccount:reply:", v3, v4);

}

void __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("RTErrorDomain")))
    objc_msgSend(v6, "code");

  v4 = *(_QWORD *)(a1 + 32);
  v5 = v6;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
    v5 = v6;
  }

}

- (void)fetchRemoteStatusWithHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke;
    v10[3] = &unk_1E4FB0B30;
    v11 = v5;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke_2;
    v8[3] = &unk_1E4FB0C48;
    v9 = v11;
    -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v10, v8);

  }
}

uint64_t __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke_3;
  v3[3] = &unk_1E4FB0C98;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchRemoteStatusWithReply:", v3);

}

uint64_t __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchLookbackWindowStartDateWithLocation:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTRoutineManager fetchLookbackWindowStartDateWithLocation:handler:]";
      v20 = 1024;
      v21 = 1093;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

void __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    v4 = a2;
    objc_msgSend(v3, "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v4);

  }
}

void __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0CC0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchLookbackWindowStartDateWithLocation:reply:", v3, v4);

}

uint64_t __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchLookbackWindowStartDateWithHandler:(id)a3
{
  -[RTRoutineManager fetchLookbackWindowStartDateWithLocation:handler:](self, "fetchLookbackWindowStartDateWithLocation:handler:", 0, a3);
}

- (void)enumerateObjectsWithOptions:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  SEL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  if (v8)
  {
    if (v7)
    {
      -[RTRoutineManager queue](self, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke;
      block[3] = &unk_1E4FB0D38;
      block[4] = self;
      v24 = a2;
      v22 = v8;
      v23 = &v25;
      v21 = v7;
      dispatch_sync(v9, block);

    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30 = CFSTR("options is required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 7, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v19;
        v33 = 2112;
        v34 = v16;
        _os_log_error_impl(&dword_1A5E26000, v17, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      (*((void (**)(id, _QWORD, void *, uint64_t *))v8 + 2))(v8, 0, v16, v26 + 3);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36[0] = CFSTR("block is required");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v18;
      v33 = 2112;
      v34 = v12;
      _os_log_error_impl(&dword_1A5E26000, v13, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
  }
  _Block_object_dispose(&v25, 8);

}

void __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  char v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *aClass;
  _QWORD v24[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  uint8_t buf[4];
  objc_class *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];

  v51[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke_2;
  v41[3] = &unk_1E4FB0CE8;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v42 = v4;
  v43 = v5;
  objc_msgSend(v2, "_proxyForServicingSelector:asynchronous:withErrorHandler:", v3, 0, v41);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    v51[0] = CFSTR("daemonProxy was nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_22;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  aClass = (objc_class *)objc_msgSend(*(id *)(a1 + 40), "enumeratedType");
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  do
  {
    v7 = (void *)MEMORY[0x1A85B6AB0]();
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromClass(aClass);
      v16 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(*(id *)(a1 + 40), "batchSize");
      v18 = v26[3];
      *(_DWORD *)buf = 138412802;
      v45 = v16;
      v46 = 2048;
      v47 = v17;
      v48 = 2048;
      v49 = v18;
      _os_log_debug_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_DEBUG, "iterating objects of type, %@, batch size, %lu, offset, %lu", buf, 0x20u);

    }
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke_383;
    v24[3] = &unk_1E4FB0D10;
    v24[4] = &v35;
    v24[5] = &v29;
    v24[6] = &v25;
    objc_msgSend(v6, "fetchEnumerableObjectsWithOptions:offset:reply:", v9, v10, v24);

    if (v30[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v19 = v30[5];
        *(_DWORD *)buf = 138412546;
        v45 = aClass;
        v46 = 2112;
        v47 = v19;
        _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "received error while fetching stored of type %@, %@, breaking out.", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_17;
    }
    if (!objc_msgSend((id)v36[5], "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = aClass;
        v13 = v12;
        v14 = "no more stored objects of type %@ to enumerate, breaking out.";
        goto LABEL_15;
      }
LABEL_16:

LABEL_17:
      v15 = 0;
      goto LABEL_18;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = aClass;
        v13 = v12;
        v14 = "client set stop bit while enumerating stored objects of type %@, breaking out.";
LABEL_15:
        _os_log_impl(&dword_1A5E26000, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    v15 = 1;
LABEL_18:
    objc_autoreleasePoolPop(v7);
  }
  while ((v15 & 1) != 0);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
LABEL_22:

}

void __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "received error while getting synchronous proxy to enumerate stored locations, %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke_383(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
  if (v8)
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v8, "unsignedIntegerValue");

}

- (void)enumerateStoredLocationsWithOptions:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTRoutineManager queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__RTRoutineManager_enumerateStoredLocationsWithOptions_usingBlock___block_invoke;
    block[3] = &unk_1E4FB0D60;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_sync(v8, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTRoutineManager enumerateStoredLocationsWithOptions:usingBlock:]";
      v20 = 1024;
      v21 = 1209;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block (in %s:%d)", buf, 0x12u);
    }

    v16 = *MEMORY[0x1E0CB2D50];
    v17 = CFSTR("An enumeration block is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 7, v10);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_error_impl(&dword_1A5E26000, v12, OS_LOG_TYPE_ERROR, "An enumeration block is a required parameter, %@", buf, 0xCu);
    }

  }
}

uint64_t __67__RTRoutineManager_enumerateStoredLocationsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateStoredLocationsWithOptions:usingBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_enumerateStoredLocationsWithOptions:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  RTRoutineManager *v15;
  id v16;
  _BYTE *v17;
  SEL v18;
  _QWORD v19[4];
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTRoutineManager _enumerateStoredLocationsWithOptions:usingBlock:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1229;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block (in %s:%d)", buf, 0x12u);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke;
  v19[3] = &unk_1E4FB0CE8;
  v20 = v8;
  v21 = buf;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_387;
  v13[3] = &unk_1E4FB0DB0;
  v11 = v7;
  v14 = v11;
  v15 = self;
  v17 = buf;
  v18 = a2;
  v12 = v20;
  v16 = v12;
  -[RTRoutineManager _launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v19, v13);

  _Block_object_dispose(buf, 8);
}

void __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "received error while getting asynchronous proxy to enumerate stored locations, %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_387(uint64_t a1, void *a2)
{
  NSObject *v3;
  const char *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  dispatch_semaphore_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  dispatch_time_t v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  const char *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  RTStoredLocationEnumerationContext *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  dispatch_queue_t v81;
  uint64_t v82;
  id v83;
  RTStoredLocationEnumerationContext *v84;
  uint64_t v85;
  _QWORD v86[7];
  _QWORD v87[7];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  id *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _BYTE buf[12];
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  _BYTE v107[24];
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  _QWORD v111[4];

  v111[1] = *MEMORY[0x1E0C80C00];
  v83 = a2;
  v85 = a1;
  v84 = -[RTStoredLocationEnumerationContext initWithEnumerationOptions:]([RTStoredLocationEnumerationContext alloc], "initWithEnumerationOptions:", *(_QWORD *)(a1 + 32));
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (const char *)objc_msgSend(CFSTR("fetchLocationsHelperQueue"), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), CFSTR("fetchLocationsHelperQueue"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v5, "UTF8String");

  }
  v81 = dispatch_queue_create(v4, v3);

  objc_msgSend(*(id *)(v85 + 40), "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v85 + 40), "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(v85 + 64));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v107 = 138412802;
      *(_QWORD *)&v107[4] = v73;
      *(_WORD *)&v107[12] = 2080;
      *(_QWORD *)&v107[14] = "-[RTRoutineManager _enumerateStoredLocationsWithOptions:usingBlock:]_block_invoke";
      *(_WORD *)&v107[22] = 1024;
      LODWORD(v108) = 1246;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "%@ XPC Connection wasn't to use self.queue. (in %s:%d)", v107, 0x1Cu);

    }
  }
  objc_msgSend(*(id *)(v85 + 40), "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setQueue:", v81);

  *(_QWORD *)v107 = 0;
  *(_QWORD *)&v107[8] = v107;
  *(_QWORD *)&v107[16] = 0x3032000000;
  v108 = __Block_byref_object_copy_;
  v109 = __Block_byref_object_dispose_;
  v110 = 0;
  v94 = 0;
  v95 = (id *)&v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy_;
  v98 = __Block_byref_object_dispose_;
  v99 = 0;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy_;
  v92 = __Block_byref_object_dispose_;
  v93 = 0;
  if ((objc_msgSend(*(id *)(v85 + 32), "downsampleRequired") & 1) == 0)
  {
    v30 = 0;
    v82 = *MEMORY[0x1E0CB2D50];
    while (1)
    {
      v31 = (void *)MEMORY[0x1A85B6AB0]();
      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        -[RTStoredLocationEnumerationContext options](v84, "options");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "dateInterval");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTStoredLocationEnumerationContext options](v84, "options");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "horizontalAccuracy");
        v65 = v64;
        -[RTStoredLocationEnumerationContext options](v84, "options");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "batchSize");
        v68 = -[RTStoredLocationEnumerationContext offset](v84, "offset");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v62;
        v101 = 2048;
        v102 = v65;
        v103 = 2048;
        v104 = v67;
        v105 = 2048;
        v106 = v68;
        _os_log_debug_impl(&dword_1A5E26000, v32, OS_LOG_TYPE_DEBUG, "iterating stored locations between %@, horizontal accuracy, %lf, batch size, %lu, offset, %lu", buf, 0x2Au);

      }
      v33 = dispatch_semaphore_create(0);
      v34 = (void *)v89[5];
      v89[5] = (uint64_t)v33;

      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_391;
      v86[3] = &unk_1E4FB0D88;
      v86[4] = v107;
      v86[5] = &v94;
      v86[6] = &v88;
      objc_msgSend(v83, "fetchStoredLocationsWithContext:reply:", v84, v86);
      v35 = (id)v89[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = dispatch_time(0, 5000000000);
      v38 = v30;
      if (dispatch_semaphore_wait(v35, v37))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "timeIntervalSinceDate:", v36);
        v41 = v40;
        v42 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_662);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "filteredArrayUsingPredicate:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "submitToCoreAnalytics:type:duration:", v46, 1, v41);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1A5E26000, v47, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v48 = (void *)MEMORY[0x1E0CB35C8];
        v111[0] = v82;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v111, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 15, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = v30;
        if (v50)
        {
          v38 = objc_retainAutorelease(v50);

        }
      }

      v51 = v38;
      if (v51)
      {
        _rt_log_facility_get_os_log(RTLogFacilityFramework);
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v51;
          _os_log_error_impl(&dword_1A5E26000, v52, OS_LOG_TYPE_ERROR, "XPC timeout error while waiting for stored locations, %@.", buf, 0xCu);
        }

        objc_storeStrong(v95 + 5, v38);
      }
      (*(void (**)(void))(*(_QWORD *)(v85 + 48) + 16))();
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v85 + 56) + 8) + 24))
      {
        _rt_log_facility_get_os_log(RTLogFacilityFramework);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v54 = v53;
          v55 = "client set stop bit while enumerating stored locations, breaking out.";
LABEL_31:
          _os_log_impl(&dword_1A5E26000, v54, OS_LOG_TYPE_INFO, v55, buf, 2u);
        }
      }
      else
      {
        if (v95[5])
        {
          _rt_log_facility_get_os_log(RTLogFacilityFramework);
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v69 = v95[5];
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v69;
            _os_log_error_impl(&dword_1A5E26000, v53, OS_LOG_TYPE_ERROR, "received error while fetching stored locations, %@, breaking out.", buf, 0xCu);
          }
          goto LABEL_35;
        }
        if (objc_msgSend(*(id *)(*(_QWORD *)&v107[8] + 40), "count"))
        {
          v57 = -[RTStoredLocationEnumerationContext offset](v84, "offset");
          v58 = objc_msgSend(*(id *)(*(_QWORD *)&v107[8] + 40), "count");
          v59 = [RTStoredLocationEnumerationContext alloc];
          -[RTStoredLocationEnumerationContext options](v84, "options");
          v53 = objc_claimAutoreleasedReturnValue();
          v60 = -[RTStoredLocationEnumerationContext initWithEnumerationOptions:offset:](v59, "initWithEnumerationOptions:offset:", v53, v58 + v57);

          v56 = 1;
          v84 = (RTStoredLocationEnumerationContext *)v60;
          goto LABEL_36;
        }
        _rt_log_facility_get_os_log(RTLogFacilityFramework);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v54 = v53;
          v55 = "no more stored locations to enumerate, breaking out.";
          goto LABEL_31;
        }
      }
LABEL_35:
      v56 = 0;
LABEL_36:

      objc_autoreleasePoolPop(v31);
      v30 = v51;
      if ((v56 & 1) == 0)
      {
        objc_msgSend(*(id *)(v85 + 40), "xpcConnection");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v85 + 40), "queue");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "_setQueue:", v71);
        goto LABEL_48;
      }
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[RTStoredLocationEnumerationContext options](v84, "options");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "dateInterval");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTStoredLocationEnumerationContext options](v84, "options");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "horizontalAccuracy");
    v78 = v77;
    -[RTStoredLocationEnumerationContext options](v84, "options");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "batchSize");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v75;
    v101 = 2048;
    v102 = v78;
    v103 = 2048;
    v104 = v80;
    _os_log_debug_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_DEBUG, "fetching downsampled locations between %@, horizontal accuracy, %lf, output size, %lu", buf, 0x20u);

  }
  v12 = dispatch_semaphore_create(0);
  v13 = (void *)v89[5];
  v89[5] = (uint64_t)v12;

  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_390;
  v87[3] = &unk_1E4FB0D88;
  v87[4] = v107;
  v87[5] = &v94;
  v87[6] = &v88;
  objc_msgSend(v83, "fetchStoredLocationsWithContext:reply:", v84, v87);
  v14 = (id)v89[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 5000000000);
  if (!dispatch_semaphore_wait(v14, v16))
    goto LABEL_42;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v15);
  v19 = v18;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_662);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1A5E26000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v26 = (void *)MEMORY[0x1E0CB35C8];
  v111[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v111, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 15, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_retainAutorelease(v28);

  }
  else
  {
LABEL_42:
    v29 = 0;
  }

  v51 = v29;
  if (v51)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v51;
      _os_log_error_impl(&dword_1A5E26000, v72, OS_LOG_TYPE_ERROR, "XPC timeout error while waiting for stored locations, %@.", buf, 0xCu);
    }

    objc_storeStrong(v95 + 5, v29);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v85 + 56) + 8) + 24) = 1;
  (*(void (**)(void))(*(_QWORD *)(v85 + 48) + 16))();
  objc_msgSend(*(id *)(v85 + 40), "xpcConnection");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v85 + 40), "queue");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "_setQueue:", v71);
LABEL_48:

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);

  _Block_object_dispose(v107, 8);
}

void __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_390(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_391(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)fetchRoutineModeFromLocation:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTRoutineManager fetchRoutineModeFromLocation:withHandler:]";
      v20 = 1024;
      v21 = 1331;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke_2;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

uint64_t __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke_3;
  v4[3] = &unk_1E4FB0C98;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchRoutineModeFromLocation:reply:", v3, v4);

}

uint64_t __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchEstimatedLocationAtDate:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTRoutineManager fetchEstimatedLocationAtDate:handler:]";
    v22 = 1024;
    v23 = 1348;
    _os_log_error_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTRoutineManager fetchEstimatedLocationAtDate:handler:]";
      v22 = 1024;
      v23 = 1349;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke;
  v18[3] = &unk_1E4FB0B30;
  v19 = v9;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke_2;
  v15[3] = &unk_1E4FB0BA8;
  v16 = v7;
  v17 = v19;
  v13 = v19;
  v14 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

}

uint64_t __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0DD8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchEstimatedLocationAtDate:options:reply:", v3, 0, v4);

}

uint64_t __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[RTRoutineManager fetchEstimatedLocationAtDate:options:handler:]";
    v27 = 1024;
    v28 = 1370;
    _os_log_error_impl(&dword_1A5E26000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTRoutineManager fetchEstimatedLocationAtDate:options:handler:]";
      v27 = 1024;
      v28 = 1371;
      _os_log_error_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke;
  v23[3] = &unk_1E4FB0B30;
  v24 = v12;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke_2;
  v19[3] = &unk_1E4FB0B80;
  v20 = v9;
  v21 = v10;
  v22 = v24;
  v16 = v24;
  v17 = v10;
  v18 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v23, v19);

}

uint64_t __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke_3;
  v5[3] = &unk_1E4FB0DD8;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "fetchEstimatedLocationAtDate:options:reply:", v3, v4, v5);

}

uint64_t __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchNextPredictedLocationsOfInterestWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[RTRoutineManager fetchNextPredictedLocationsOfInterestWithHandler:]";
      v8 = 1024;
      v9 = 1392;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

  }
  -[RTRoutineManager fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:](self, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:", 0, 0, v4, -1.0);

}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  double v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTRoutineManager fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:]";
      v28 = 1024;
      v29 = 1405;
      _os_log_error_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __105__RTRoutineManager_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler___block_invoke;
  v24[3] = &unk_1E4FB0B30;
  v25 = v13;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __105__RTRoutineManager_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler___block_invoke_2;
  v19[3] = &unk_1E4FB0E00;
  v20 = v11;
  v21 = v12;
  v23 = a5;
  v22 = v25;
  v16 = v25;
  v17 = v12;
  v18 = v11;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v24, v19);

}

uint64_t __105__RTRoutineManager_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __105__RTRoutineManager_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)fetchPredictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 withHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[RTRoutineManager fetchPredictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:withHandler:]";
      v30 = 1024;
      v31 = 1423;
      _os_log_error_impl(&dword_1A5E26000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v16 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke;
  v26[3] = &unk_1E4FB0B30;
  v27 = v14;
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke_2;
  v21[3] = &unk_1E4FB0E28;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v25 = v27;
  v17 = v27;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v26, v21);

}

uint64_t __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke_3;
  v6[3] = &unk_1E4FB0B58;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(a2, "fetchPredictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:reply:", v3, v4, v5, v6);

}

uint64_t __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTRoutineManager fetchPredictedLocationsOfInterestOnDate:withHandler:]";
      v20 = 1024;
      v21 = 1440;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke_2;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

uint64_t __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke_3;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchPredictedLocationsOfInterestOnDate:reply:", v3, v4);

}

uint64_t __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startMonitoringVisitsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTRoutineManager startMonitoringVisitsWithHandler:]";
      v14 = 1024;
      v15 = 1456;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTRoutineManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke;
  block[3] = &unk_1E4FB0E50;
  block[4] = self;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setVisitHandler:", *(_QWORD *)(a1 + 40));
  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_2;
  v7[3] = &unk_1E4FB0B30;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_3;
  v5[3] = &unk_1E4FB0C48;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v4, 3, v7, v5);

}

uint64_t __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_4;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "startMonitoringVisitsWithReply:", v3);

}

uint64_t __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopMonitoringVisits
{
  NSObject *v4;
  _QWORD v5[6];

  -[RTRoutineManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__RTRoutineManager_stopMonitoringVisits__block_invoke;
  v5[3] = &unk_1E4FB0E78;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __40__RTRoutineManager_stopMonitoringVisits__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "visitHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setVisitHandler:", 0);
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__RTRoutineManager_stopMonitoringVisits__block_invoke_2;
  v9[3] = &unk_1E4FB0B30;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __40__RTRoutineManager_stopMonitoringVisits__block_invoke_394;
  v7[3] = &unk_1E4FB0C48;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v3, 3, v9, v7);

}

void __40__RTRoutineManager_stopMonitoringVisits__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  }

}

void __40__RTRoutineManager_stopMonitoringVisits__block_invoke_394(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__RTRoutineManager_stopMonitoringVisits__block_invoke_2_395;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "stopMonitoringVisitsWithReply:", v3);

}

void __40__RTRoutineManager_stopMonitoringVisits__block_invoke_2_395(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  }

}

- (void)onVisit:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[RTRoutineManager visitHandler](self, "visitHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTRoutineManager visitHandler](self, "visitHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)startLeechingVisitsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTRoutineManager startLeechingVisitsWithHandler:]";
      v14 = 1024;
      v15 = 1507;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTRoutineManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke;
  block[3] = &unk_1E4FB0E50;
  block[4] = self;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setLeechedVisitHandler:", *(_QWORD *)(a1 + 40));
  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_2;
  v7[3] = &unk_1E4FB0B30;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_3;
  v5[3] = &unk_1E4FB0C48;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v4, 3, v7, v5);

}

uint64_t __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_4;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "startLeechingVisitsWithReply:", v3);

}

uint64_t __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopLeechingVisits
{
  NSObject *v4;
  _QWORD v5[6];

  -[RTRoutineManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__RTRoutineManager_stopLeechingVisits__block_invoke;
  v5[3] = &unk_1E4FB0E78;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __38__RTRoutineManager_stopLeechingVisits__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "leechedVisitHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLeechedVisitHandler:", 0);
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__RTRoutineManager_stopLeechingVisits__block_invoke_2;
  v9[3] = &unk_1E4FB0B30;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __38__RTRoutineManager_stopLeechingVisits__block_invoke_396;
  v7[3] = &unk_1E4FB0C48;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v3, 3, v9, v7);

}

void __38__RTRoutineManager_stopLeechingVisits__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping leeching visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  }

}

void __38__RTRoutineManager_stopLeechingVisits__block_invoke_396(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__RTRoutineManager_stopLeechingVisits__block_invoke_2_397;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "stopLeechingVisitsWithReply:", v3);

}

void __38__RTRoutineManager_stopLeechingVisits__block_invoke_2_397(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping leeching visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  }

}

- (void)onLeechedVisit:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[RTRoutineManager leechedVisitHandler](self, "leechedVisitHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTRoutineManager leechedVisitHandler](self, "leechedVisitHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)startLeechingLowConfidenceVisitsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTRoutineManager startLeechingLowConfidenceVisitsWithHandler:]";
      v14 = 1024;
      v15 = 1559;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTRoutineManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke;
  block[3] = &unk_1E4FB0E50;
  block[4] = self;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setLeechedLowConfidenceVisitHandler:", *(_QWORD *)(a1 + 40));
  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_2;
  v7[3] = &unk_1E4FB0B30;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_3;
  v5[3] = &unk_1E4FB0C48;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v4, 3, v7, v5);

}

uint64_t __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_4;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "startLeechingLowConfidenceVisitsWithReply:", v3);

}

uint64_t __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopLeechingLowConfidenceVisits
{
  NSObject *v4;
  _QWORD v5[6];

  -[RTRoutineManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke;
  v5[3] = &unk_1E4FB0E78;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "leechedLowConfidenceVisitHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLeechedLowConfidenceVisitHandler:", 0);
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_2;
  v9[3] = &unk_1E4FB0B30;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_398;
  v7[3] = &unk_1E4FB0C48;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v3, 3, v9, v7);

}

void __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping leeching low confidence visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  }

}

void __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_398(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_2_399;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "stopLeechingLowConfidenceVisitsWithReply:", v3);

}

void __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_2_399(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping leeching low confidence visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  }

}

- (void)onLeechedLowConfidenceVisit:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[RTRoutineManager leechedLowConfidenceVisitHandler](self, "leechedLowConfidenceVisitHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTRoutineManager leechedLowConfidenceVisitHandler](self, "leechedLowConfidenceVisitHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)startMonitoringPlaceInferencesWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTRoutineManager startMonitoringPlaceInferencesWithOptions:handler:]";
      v19 = 1024;
      v20 = 1614;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTRoutineManager queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke;
  v13[3] = &unk_1E4FB0EA0;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v16 = a2;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, v13);

}

void __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setPlaceInferenceOptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPlaceInferencesHandler:", *(_QWORD *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_2;
  v8[3] = &unk_1E4FB0B30;
  v4 = *(_QWORD *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_400;
  v5[3] = &unk_1E4FB0BA8;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v4, 3, v8, v5);

}

void __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while starting to monitor place inferences, error, %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_400(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_2_401;
  v4[3] = &unk_1E4FB0B30;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "startMonitoringPlaceInferencesWithOptions:reply:", v3, v4);

}

void __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_2_401(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while starting to monitor place inferences, error, %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)stopMonitoringPlaceInferences
{
  NSObject *v4;
  _QWORD v5[6];

  -[RTRoutineManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke;
  v5[3] = &unk_1E4FB0E78;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "placeInferencesHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlaceInferencesHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceInferenceOptions:", 0);
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_2;
  v9[3] = &unk_1E4FB0B30;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_402;
  v7[3] = &unk_1E4FB0C48;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v3, 3, v9, v7);

}

void __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping to monitor place inferences, error, %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  }

}

void __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_402(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_2_403;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "stopMonitoringPlaceInferencesWithReply:", v3);

}

void __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_2_403(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping to monitor place inferences, error, %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  }

}

- (void)onPlaceInferences:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[RTRoutineManager placeInferencesHandler](self, "placeInferencesHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTRoutineManager placeInferencesHandler](self, "placeInferencesHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)fetchStoredVisitsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke;
  v15[3] = &unk_1E4FB0B30;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke_2;
  v12[3] = &unk_1E4FB0EC8;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

uint64_t __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchStoredVisitsWithOptions:reply:", v3, v4);

}

uint64_t __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processHindsightVisitsWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__RTRoutineManager_processHindsightVisitsWithHandler___block_invoke;
  v10[3] = &unk_1E4FB0B30;
  v11 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __54__RTRoutineManager_processHindsightVisitsWithHandler___block_invoke_2;
  v8[3] = &unk_1E4FB0EF0;
  v9 = v11;
  v7 = v11;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v10, v8);

}

uint64_t __54__RTRoutineManager_processHindsightVisitsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54__RTRoutineManager_processHindsightVisitsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processHindsightVisitsWithReply:", *(_QWORD *)(a1 + 32));
}

uint64_t __60__RTRoutineManager_fetchPlaceInferencesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchPlaceInferencesWithOptions:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fetchFormattedPostalAddressesFromMeCard:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__RTRoutineManager_fetchFormattedPostalAddressesFromMeCard___block_invoke;
    v11[3] = &unk_1E4FB0B30;
    v12 = v5;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __60__RTRoutineManager_fetchFormattedPostalAddressesFromMeCard___block_invoke_2;
    v9[3] = &unk_1E4FB0C48;
    v10 = v12;
    -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

    v8 = v12;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

uint64_t __60__RTRoutineManager_fetchFormattedPostalAddressesFromMeCard___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__RTRoutineManager_fetchFormattedPostalAddressesFromMeCard___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchFormattedPostalAddressesFromMeCard:", *(_QWORD *)(a1 + 32));
}

- (void)fetchPathToDiagnosticFilesWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTRoutineManager fetchPathToDiagnosticFilesWithOptions:handler:]";
      v20 = 1024;
      v21 = 1739;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke_2;
  v13[3] = &unk_1E4FB0EC8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

uint64_t __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0F18;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchPathToDiagnosticFilesWithOptions:reply:", v3, v4);

}

void __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = a2;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("RTErrorDomain")))
    objc_msgSend(v5, "code");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 withHandler:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  SEL v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTRoutineManager startMonitoringScenarioTriggerOfType:withHandler:]";
      v17 = 1024;
      v18 = 1760;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTRoutineManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke;
  v11[3] = &unk_1E4FB0F90;
  v11[4] = self;
  v12 = v7;
  v13 = a3;
  v14 = a2;
  v10 = v7;
  dispatch_async(v9, v11);

}

void __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id)objc_msgSend(*(id *)(a1[4] + 120), "startMonitoringForScenarioTriggerTypes:handler:", a1[6], a1[5]);
  v3 = a1[7];
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_2;
  v11[3] = &unk_1E4FB0F40;
  v5 = (void *)a1[5];
  v12 = (id)a1[4];
  v13 = v5;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_3;
  v8[3] = &unk_1E4FB0F68;
  v6 = (void *)a1[5];
  v7 = a1[4];
  v10 = a1[6];
  v8[4] = v7;
  v9 = v6;
  objc_msgSend(v12, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v3, 3, v11, v8);

}

void __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "registered"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_4;
  v5[3] = &unk_1E4FB0F40;
  v3 = (void *)a1[5];
  v4 = a1[6];
  v5[4] = a1[4];
  v6 = v3;
  objc_msgSend(a2, "startMonitoringScenarioTriggerOfType:reply:", v4, v5);

}

void __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_4(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "registered");
  v4 = v5;
  if (v5 && v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = v5;
  }

}

- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3
{
  NSObject *v6;
  _QWORD block[7];

  -[RTRoutineManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke;
  block[3] = &unk_1E4FB1018;
  block[4] = self;
  block[5] = a3;
  block[6] = a2;
  dispatch_async(v6, block);

}

uint64_t __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  v2 = (id)objc_msgSend(*(id *)(a1[4] + 120), "stopMonitoringForScenarioTriggerTypes:", a1[5]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke_406;
  v6[3] = &__block_descriptor_40_e8_v16__0_8l;
  v3 = (void *)a1[4];
  v4 = a1[6];
  v6[4] = a1[5];
  return objc_msgSend(v3, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v4, 3, &__block_literal_global_405, v6);
}

void __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1A5E26000, v3, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for scenario triggers, error, %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

uint64_t __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke_406(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopMonitoringScenarioTriggerOfType:reply:", *(_QWORD *)(a1 + 32), &__block_literal_global_408);
}

void __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke_2_407(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1A5E26000, v3, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for scenario triggers, error, %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)onScenarioTrigger:(id)a3 withError:(id)a4
{
  RTRoutineManagerRegistrantScenarioTrigger *scenarioTriggerRegistrant;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    scenarioTriggerRegistrant = self->_scenarioTriggerRegistrant;
    v10 = a3;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = a4;
    v8 = a3;
    objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTRoutineManagerRegistrantScenarioTrigger onScenarioTriggers:error:](scenarioTriggerRegistrant, "onScenarioTriggers:error:", v9, v7, v10, v11);

  }
}

- (void)fetchMonitoredScenarioTriggerTypesWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTRoutineManager fetchMonitoredScenarioTriggerTypesWithHandler:]";
      v15 = 1024;
      v16 = 1811;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke;
  v11[3] = &unk_1E4FB0B30;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke_2;
  v9[3] = &unk_1E4FB0C48;
  v10 = v12;
  v8 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke_3;
  v3[3] = &unk_1E4FB0BD0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchMonitoredScenarioTriggerTypesWithReply:", v3);

}

uint64_t __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTRoutineManager fetchPredictedExitDatesFromLocation:onDate:withHandler:]";
      v25 = 1024;
      v26 = 1828;
      _os_log_error_impl(&dword_1A5E26000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke;
  v21[3] = &unk_1E4FB0B30;
  v22 = v11;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_2;
  v17[3] = &unk_1E4FB0B80;
  v18 = v9;
  v19 = v10;
  v20 = v22;
  v14 = v22;
  v15 = v10;
  v16 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v21, v17);

}

uint64_t __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_3;
  v5[3] = &unk_1E4FB0B58;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "fetchPredictedExitDatesFromLocation:onDate:reply:", v3, v4, v5);

}

uint64_t __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 withHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTRoutineManager fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:]";
      v25 = 1024;
      v26 = 1845;
      _os_log_error_impl(&dword_1A5E26000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke;
  v21[3] = &unk_1E4FB0B30;
  v22 = v11;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke_2;
  v17[3] = &unk_1E4FB0B80;
  v18 = v9;
  v19 = v10;
  v20 = v22;
  v14 = v22;
  v15 = v10;
  v16 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v21, v17);

}

uint64_t __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke_3;
  v5[3] = &unk_1E4FB0B58;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "fetchPredictedLocationsOfInterestBetweenStartDate:endDate:reply:", v3, v4, v5);

}

uint64_t __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTRoutineManager fetchLocationOfInterestWithIdentifier:withHandler:]";
      v20 = 1024;
      v21 = 1863;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke_2;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

uint64_t __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke_3;
  v4[3] = &unk_1E4FB1040;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchLocationOfInterestWithIdentifier:reply:", v3, v4);

}

uint64_t __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke_3;
  v4[3] = &unk_1E4FB1040;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchLocationOfInterestAtLocation:reply:", v3, v4);

}

- (void)fetchLocationOfInterestForRegion:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTRoutineManager fetchLocationOfInterestForRegion:withHandler:]";
      v20 = 1024;
      v21 = 1893;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke_2;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

uint64_t __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke_3;
  v4[3] = &unk_1E4FB1040;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchLocationOfInterestForRegion:reply:", v3, v4);

}

uint64_t __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withHandler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  double v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:]";
      v23 = 1024;
      v24 = 1910;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke;
  v19[3] = &unk_1E4FB0B30;
  v20 = v10;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke_2;
  v15[3] = &unk_1E4FB0F68;
  v18 = a3;
  v16 = v9;
  v17 = v20;
  v13 = v20;
  v14 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v19, v15);

}

uint64_t __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(double *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke_3;
  v5[3] = &unk_1E4FB0B58;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchLocationsOfInterestWithinDistance:ofLocation:reply:", v4, v5, v3);

}

uint64_t __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke_3;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchLocationsOfInterestOfType:reply:", v3, v4);

}

void __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a2;
  objc_msgSend(v4, "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke_3;
  v7[3] = &unk_1E4FB0B58;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:reply:", v3, v6, v7);

}

- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 withHandler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __CFString *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v17 = a5;
  if (v17)
  {
    if (v9)
      goto LABEL_3;
LABEL_9:
    v18 = CFSTR("startDate is required");
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[RTRoutineManager fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:]";
    v30 = 1024;
    v31 = 1963;
    _os_log_error_impl(&dword_1A5E26000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
    goto LABEL_9;
LABEL_3:
  if (v10)
  {
    if (objc_msgSend(v9, "compare:", v10) != 1)
    {
      v21 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke;
      v26[3] = &unk_1E4FB0B30;
      v27 = v17;
      v22[0] = v21;
      v22[1] = 3221225472;
      v22[2] = (uint64_t)__88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke_2;
      v22[3] = (uint64_t)&unk_1E4FB0B80;
      v23 = v9;
      v24 = v10;
      v25 = v27;
      -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v26, v22);

      v20 = v27;
      goto LABEL_12;
    }
    v18 = CFSTR("endDate must be greater than or equal to startDate");
  }
  else
  {
    v18 = CFSTR("endDate is required");
  }
LABEL_11:
  RTErrorInvalidParameterCreate(a2, v18, v11, v12, v13, v14, v15, v16, v22[0]);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v20);
LABEL_12:

}

uint64_t __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke_3;
  v5[3] = &unk_1E4FB0B58;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:reply:", v3, v4, v5);

}

uint64_t __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllLocationsOfInterestForSettingsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTRoutineManager fetchAllLocationsOfInterestForSettingsWithHandler:]";
      v15 = 1024;
      v16 = 1993;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke;
  v11[3] = &unk_1E4FB0B30;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke_2;
  v9[3] = &unk_1E4FB0C48;
  v10 = v12;
  v8 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke_3;
  v3[3] = &unk_1E4FB0B58;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchAllLocationsOfInterestForSettingsWithReply:", v3);

}

void __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = a2;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("RTErrorDomain")))
    objc_msgSend(v5, "code");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTRoutineManager fetchLocationsOfInterestAssociatedToIdentifier:withHandler:]";
      v20 = 1024;
      v21 = 2011;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_2;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

uint64_t __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_3;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchLocationsOfInterestAssociatedToIdentifier:reply:", v3, v4);

}

uint64_t __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addLocationOfInterestOfType:(int64_t)a3 mapItem:(id)a4 customLabel:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  int64_t v22;
  _QWORD v23[4];
  id v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke;
  v23[3] = &unk_1E4FB0B30;
  v24 = v13;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke_2;
  v18[3] = &unk_1E4FB0E00;
  v19 = v11;
  v20 = v12;
  v21 = v24;
  v22 = a3;
  v15 = v24;
  v16 = v12;
  v17 = v11;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v23, v18);

}

uint64_t __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = (void *)MEMORY[0x1E0D271E8];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v4, "mapItemStorageForGEOMapItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke_3;
  v9[3] = &unk_1E4FB1040;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v6, "addLocationOfInterestOfType:mapItemStorage:customLabel:reply:", v3, v7, v8, v9);

}

uint64_t __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 mapItem:(id)a5 customLabel:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;
  _QWORD v28[4];
  id v29;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke;
  v28[3] = &unk_1E4FB0B30;
  v29 = v16;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke_2;
  v22[3] = &unk_1E4FB1090;
  v26 = v29;
  v27 = a4;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v18 = v29;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v28, v22);

}

uint64_t __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v3 = *(_QWORD *)(a1 + 64);
  v4 = (void *)MEMORY[0x1E0D271E8];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v4, "mapItemStorageForGEOMapItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke_3;
  v10[3] = &unk_1E4FB1040;
  v9 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v7, "updateLocationOfInterestWithIdentifier:type:mapItemStorage:customLabel:reply:", v5, v3, v8, v9, v10);

}

uint64_t __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 mapItem:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke;
  v20[3] = &unk_1E4FB0B30;
  v21 = v11;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke_2;
  v16[3] = &unk_1E4FB0B80;
  v17 = v9;
  v18 = v10;
  v19 = v21;
  v13 = v21;
  v14 = v10;
  v15 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v20, v16);

}

uint64_t __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0D271E8];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "mapItemStorageForGEOMapItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke_3;
  v8[3] = &unk_1E4FB0B30;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "updateLocationOfInterestWithIdentifier:mapItemStorage:reply:", v4, v7, v8);

}

uint64_t __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 handler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[RTRoutineManager updateLocationOfInterestWithIdentifier:type:handler:]";
      v23 = 1024;
      v24 = 2091;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

  }
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke;
  v19[3] = &unk_1E4FB0B30;
  v20 = v10;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke_2;
  v15[3] = &unk_1E4FB0F68;
  v17 = v20;
  v18 = a4;
  v16 = v9;
  v13 = v20;
  v14 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v19, v15);

}

uint64_t __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke_3;
  v5[3] = &unk_1E4FB0B30;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "updateLocationOfInterestWithIdentifier:type:reply:", v3, v4, v5);

}

uint64_t __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTRoutineManager updateLocationOfInterestWithIdentifier:customLabel:handler:]";
      v25 = 1024;
      v26 = 2112;
      _os_log_error_impl(&dword_1A5E26000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

  }
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke;
  v21[3] = &unk_1E4FB0B30;
  v22 = v11;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_2;
  v17[3] = &unk_1E4FB0B80;
  v18 = v9;
  v19 = v10;
  v20 = v22;
  v14 = v22;
  v15 = v10;
  v16 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v21, v17);

}

uint64_t __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_3;
  v5[3] = &unk_1E4FB0B30;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "updateLocationOfInterestWithIdentifier:customLabel:reply:", v3, v4, v5);

}

uint64_t __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 customLabel:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTRoutineManager updateLocationOfInterestWithIdentifier:type:customLabel:handler:]";
      v28 = 1024;
      v29 = 2134;
      _os_log_error_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

  }
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke;
  v24[3] = &unk_1E4FB0B30;
  v25 = v13;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_2;
  v19[3] = &unk_1E4FB0E00;
  v20 = v11;
  v21 = v12;
  v22 = v25;
  v23 = a4;
  v16 = v25;
  v17 = v12;
  v18 = v11;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v24, v19);

}

uint64_t __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_3;
  v6[3] = &unk_1E4FB0B30;
  v5 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "updateLocationOfInterestWithIdentifier:type:customLabel:reply:", v3, v5, v4, v6);

}

uint64_t __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a3;
  v8 = a4;
  v15 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke;
    v22[3] = &unk_1E4FB0B30;
    v23 = v8;
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke_2;
    v19[3] = &unk_1E4FB0BA8;
    v20 = v7;
    v21 = v23;
    -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v22, v19);

  }
  else if (v8)
  {
    RTErrorInvalidParameterCreate(a2, CFSTR("Identifier must not be nil."), v9, v10, v11, v12, v13, v14, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v17);

  }
}

uint64_t __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B30;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "removeLocationOfInterestWithIdentifier:reply:", v3, v4);

}

uint64_t __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke;
  v15[3] = &unk_1E4FB0B30;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_2;
  v12[3] = &unk_1E4FB0BA8;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

uint64_t __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchDedupedLocationOfInterestIdentifiersWithIdentifier:reply:", v3, v4);

}

uint64_t __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 withHandler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;
  _QWORD v18[4];
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke;
  v18[3] = &unk_1E4FB0B30;
  v19 = v10;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke_2;
  v14[3] = &unk_1E4FB0F68;
  v16 = v19;
  v17 = a3;
  v15 = v9;
  v12 = v19;
  v13 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v14);

}

uint64_t __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke_3;
  v5[3] = &unk_1E4FB10B8;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "setHintForRegionState:significantRegion:reply:", v4, v3, v5);

}

uint64_t __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a3;
  v8 = a4;
  v15 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke;
    v22[3] = &unk_1E4FB0B30;
    v23 = v8;
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke_2;
    v19[3] = &unk_1E4FB0BA8;
    v20 = v7;
    v21 = v23;
    -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v22, v19);

  }
  else if (v8)
  {
    RTErrorInvalidParameterCreate(a2, CFSTR("Visit identifier must not be nil"), v9, v10, v11, v12, v13, v14, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v17);

  }
}

uint64_t __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B30;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "removeVisitWithIdentifier:reply:", v3, v4);

}

uint64_t __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)extendLifetimeOfVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a3;
  v8 = a4;
  v15 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke;
    v22[3] = &unk_1E4FB0B30;
    v23 = v8;
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke_2;
    v19[3] = &unk_1E4FB0BA8;
    v20 = v7;
    v21 = v23;
    -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v22, v19);

  }
  else if (v8)
  {
    RTErrorInvalidParameterCreate(a2, CFSTR("visitIdentifier is required"), v9, v10, v11, v12, v13, v14, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v17);

  }
}

uint64_t __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke_3;
  v7[3] = &unk_1E4FB0B30;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "extendLifetimeOfVisitsWithIdentifiers:reply:", v6, v7);

}

uint64_t __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(_QWORD, _QWORD);
  _QWORD v22[4];
  void (**v23)(_QWORD, _QWORD);

  v7 = a3;
  v8 = a4;
  v15 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v16 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke;
      v22[3] = &unk_1E4FB0B30;
      v23 = v15;
      v19[0] = v16;
      v19[1] = 3221225472;
      v19[2] = __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke_2;
      v19[3] = &unk_1E4FB0BA8;
      v20 = v7;
      v21 = v23;
      -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v22, v19);

    }
    else if (v15)
    {
      v15[2](v15, 0);
    }
  }
  else if (v8)
  {
    RTErrorInvalidParameterCreate(a2, CFSTR("visitIdentifiers is required"), v9, v10, v11, v12, v13, v14, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v17);

  }
}

uint64_t __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B30;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "extendLifetimeOfVisitsWithIdentifiers:reply:", v3, v4);

}

uint64_t __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchFamiliarityIndexResultsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTRoutineManager fetchFamiliarityIndexResultsWithOptions:handler:]";
    v22 = 1024;
    v23 = 2300;
    _os_log_error_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTRoutineManager fetchFamiliarityIndexResultsWithOptions:handler:]";
      v22 = 1024;
      v23 = 2301;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke;
  v18[3] = &unk_1E4FB0B30;
  v19 = v9;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_2;
  v15[3] = &unk_1E4FB0BA8;
  v16 = v7;
  v17 = v19;
  v13 = v19;
  v14 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

}

uint64_t __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchFamiliarityIndexResultsWithOptions:reply:", v3, v4);

}

uint64_t __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchAuthorizedLocationStatus:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTRoutineManager fetchAuthorizedLocationStatus:]";
      v15 = 1024;
      v16 = 2322;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke;
  v11[3] = &unk_1E4FB0B30;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke_2;
  v9[3] = &unk_1E4FB0C48;
  v10 = v12;
  v8 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke_3;
  v3[3] = &unk_1E4FB10E0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchAuthorizedLocationStatus:", v3);

}

uint64_t __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchLastVehicleEventsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTRoutineManager fetchLastVehicleEventsWithHandler:]";
      v15 = 1024;
      v16 = 2342;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke;
  v11[3] = &unk_1E4FB0B30;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke_2;
  v9[3] = &unk_1E4FB0C48;
  v10 = v12;
  v8 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke_3;
  v3[3] = &unk_1E4FB0B58;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchLastVehicleEventsWithReply:", v3);

}

uint64_t __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4
{
  -[RTRoutineManager vehicleEventAtLocation:notes:handler:](self, "vehicleEventAtLocation:notes:handler:", a3, a4, 0);
}

- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke;
  v20[3] = &unk_1E4FB0B30;
  v21 = v11;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke_2;
  v16[3] = &unk_1E4FB0B80;
  v17 = v9;
  v18 = v10;
  v19 = v21;
  v13 = v21;
  v14 = v10;
  v15 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v20, v16);

}

uint64_t __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke_3;
  v5[3] = &unk_1E4FB0B30;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "vehicleEventAtLocation:notes:reply:", v3, v4, v5);

}

uint64_t __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearAllVehicleEvents
{
  -[RTRoutineManager clearAllVehicleEventsWithHandler:](self, "clearAllVehicleEventsWithHandler:", 0);
}

- (void)clearAllVehicleEventsWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;
  _QWORD v11[4];
  id v12;
  SEL v13;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke;
  v11[3] = &unk_1E4FB1108;
  v13 = a2;
  v12 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke_426;
  v8[3] = &unk_1E4FB1068;
  v9 = v12;
  v10 = a2;
  v7 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v8);

}

void __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "%@ return error, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke_426(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke_2;
  v5[3] = &unk_1E4FB1108;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "clearAllVehicleEventsWithReply:", v5);

}

void __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "%@ return error, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)clearAllVehicleEvents:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__RTRoutineManager_clearAllVehicleEvents___block_invoke;
  v10[3] = &unk_1E4FB0B30;
  v11 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __42__RTRoutineManager_clearAllVehicleEvents___block_invoke_2;
  v8[3] = &unk_1E4FB0C48;
  v9 = v11;
  v7 = v11;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v10, v8);

}

uint64_t __42__RTRoutineManager_clearAllVehicleEvents___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __42__RTRoutineManager_clearAllVehicleEvents___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__RTRoutineManager_clearAllVehicleEvents___block_invoke_3;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "clearAllVehicleEventsWithReply:", v3);

}

uint64_t __42__RTRoutineManager_clearAllVehicleEvents___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateVehicleEventWithIdentifier:(id)a3 notes:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__RTRoutineManager_updateVehicleEventWithIdentifier_notes___block_invoke_2;
  v11[3] = &unk_1E4FB1170;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, &__block_literal_global_427, v11);

}

uint64_t __59__RTRoutineManager_updateVehicleEventWithIdentifier_notes___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateVehicleEventWithIdentifier:notes:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_428);
}

- (void)updateVehicleEventWithIdentifier:(id)a3 photo:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__RTRoutineManager_updateVehicleEventWithIdentifier_photo___block_invoke_2;
  v11[3] = &unk_1E4FB1170;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, &__block_literal_global_429, v11);

}

uint64_t __59__RTRoutineManager_updateVehicleEventWithIdentifier_photo___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateVehicleEventWithIdentifier:photo:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_430);
}

- (void)updateVehicleEventWithIdentifier:(id)a3 geoMapItem:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__RTRoutineManager_updateVehicleEventWithIdentifier_geoMapItem___block_invoke_2;
  v11[3] = &unk_1E4FB1170;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, &__block_literal_global_431, v11);

}

void __64__RTRoutineManager_updateVehicleEventWithIdentifier_geoMapItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D271E8];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "mapItemStorageForGEOMapItem:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateVehicleEventWithIdentifier:geoMapItem:reply:", *(_QWORD *)(a1 + 40), v6, &__block_literal_global_432);

}

- (void)updateVehicleEventWithIdentifier:(id)a3 location:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__RTRoutineManager_updateVehicleEventWithIdentifier_location___block_invoke_2;
  v11[3] = &unk_1E4FB1170;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, &__block_literal_global_433, v11);

}

uint64_t __62__RTRoutineManager_updateVehicleEventWithIdentifier_location___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateVehicleEventWithIdentifier:location:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_434);
}

- (void)engageInVehicleEventWithIdentifier:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__RTRoutineManager_engageInVehicleEventWithIdentifier___block_invoke_2;
  v7[3] = &unk_1E4FB1218;
  v8 = v5;
  v6 = v5;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, &__block_literal_global_435, v7);

}

uint64_t __55__RTRoutineManager_engageInVehicleEventWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "engageInVehicleEventWithIdentifier:reply:", *(_QWORD *)(a1 + 32), &__block_literal_global_436);
}

- (void)onVehicleEvents:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[RTRoutineManager vehicleEventsHandler](self, "vehicleEventsHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTRoutineManager vehicleEventsHandler](self, "vehicleEventsHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)startMonitoringVehicleEventsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTRoutineManager startMonitoringVehicleEventsWithHandler:]";
      v14 = 1024;
      v15 = 2497;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTRoutineManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTRoutineManager_startMonitoringVehicleEventsWithHandler___block_invoke;
  block[3] = &unk_1E4FB0E50;
  block[4] = self;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __60__RTRoutineManager_startMonitoringVehicleEventsWithHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setVehicleEventsHandler:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", *(_QWORD *)(a1 + 48), 3, &__block_literal_global_437, &__block_literal_global_438);
}

uint64_t __60__RTRoutineManager_startMonitoringVehicleEventsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startMonitoringVehicleEventsWithReply:", &__block_literal_global_439);
}

- (void)stopMonitoringVehicleEvents
{
  NSObject *v4;
  _QWORD v5[6];

  -[RTRoutineManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__RTRoutineManager_stopMonitoringVehicleEvents__block_invoke;
  v5[3] = &unk_1E4FB0E78;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

uint64_t __47__RTRoutineManager_stopMonitoringVehicleEvents__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setVehicleEventsHandler:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", *(_QWORD *)(a1 + 40), 3, &__block_literal_global_440, &__block_literal_global_441);
}

uint64_t __47__RTRoutineManager_stopMonitoringVehicleEvents__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopMonitoringVehicleEventsWithReply:", &__block_literal_global_442);
}

- (void)fetchAutomaticVehicleEventDetectionSupportedWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTRoutineManager fetchAutomaticVehicleEventDetectionSupportedWithHandler:]";
      v15 = 1024;
      v16 = 2527;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke;
  v11[3] = &unk_1E4FB0B30;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke_2;
  v9[3] = &unk_1E4FB0C48;
  v10 = v12;
  v8 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke_3;
  v3[3] = &unk_1E4FB10B8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchAutomaticVehicleEventDetectionSupportedWithReply:", v3);

}

uint64_t __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5
{
  -[RTRoutineManager userInteractionWithPredictedLocationOfInterest:interaction:feedback:geoMapItem:handler:](self, "userInteractionWithPredictedLocationOfInterest:interaction:feedback:geoMapItem:handler:", a3, a4, a5, 0, 0);
}

- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5 geoMapItem:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  _QWORD v28[4];
  id v29;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke;
  v28[3] = &unk_1E4FB0B30;
  v29 = v16;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke_2;
  v22[3] = &unk_1E4FB1090;
  v26 = v29;
  v27 = a4;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v18 = v29;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v28, v22);

}

uint64_t __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)MEMORY[0x1E0D271E8];
  v7 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  objc_msgSend(v6, "mapItemStorageForGEOMapItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke_3;
  v10[3] = &unk_1E4FB0B30;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v8, "userInteractionWithPredictedLocationOfInterest:interaction:feedback:geoMapItem:reply:", v4, v3, v5, v9, v10);

}

uint64_t __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)startMonitoringForPeopleDiscovery:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[RTRoutineManager startMonitoringForPeopleDiscovery:handler:]";
    v21 = 1024;
    v22 = 2583;
    _os_log_error_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTRoutineManager startMonitoringForPeopleDiscovery:handler:]";
      v21 = 1024;
      v22 = 2584;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTRoutineManager setPeopleDiscoveryErrorHandler:](self, "setPeopleDiscoveryErrorHandler:", v9);
  -[RTRoutineManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke;
  v15[3] = &unk_1E4FB0EA0;
  v15[4] = self;
  v16 = v7;
  v17 = v9;
  v18 = a2;
  v13 = v9;
  v14 = v7;
  dispatch_async(v12, v15);

}

void __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "startMonitoringForPeopleDiscovery:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v2;
      _os_log_error_impl(&dword_1A5E26000, v3, OS_LOG_TYPE_ERROR, "Encountered error while starting monitoring for people discovery service, error, %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "configurationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_DEFAULT, "rdar122420473 _peopleDiscoveryRegistrant %@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    v8 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_443;
    v18[3] = &unk_1E4FB0F40;
    v18[4] = v7;
    v9 = *(_QWORD *)(a1 + 56);
    v19 = *(id *)(a1 + 48);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_2;
    v13[3] = &unk_1E4FB0E28;
    v14 = v4;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v15 = v10;
    v16 = v11;
    v17 = *(id *)(a1 + 48);
    v12 = v4;
    objc_msgSend(v7, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v9, 3, v18, v13);

  }
}

void __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_443(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "registered"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_3;
  v6[3] = &unk_1E4FB0F40;
  v5 = (void *)a1[7];
  v6[4] = a1[6];
  v7 = v5;
  objc_msgSend(a2, "startMonitoringForPeopleDiscovery:configuration:reply:", v3, v4, v6);

}

void __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "registered"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)stopMonitoringForPeopleDiscoveryWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTRoutineManager stopMonitoringForPeopleDiscoveryWithHandler:]";
      v14 = 1024;
      v15 = 2616;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTRoutineManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke;
  block[3] = &unk_1E4FB0E50;
  block[4] = self;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "stopMonitoringForPeopleDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v2;
      _os_log_error_impl(&dword_1A5E26000, v3, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for people discovery service, error, %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_444;
    v9[3] = &unk_1E4FB0B30;
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_445;
    v7[3] = &unk_1E4FB0C48;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "_launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", v6, 3, v9, v7);

  }
}

void __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_444(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for people discovery service, error, %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_445(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_2;
  v3[3] = &unk_1E4FB0B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "stopMonitoringForPeopleDiscoveryWithReply:", v3);

}

void __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for people discovery service, error, %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)onDensityUpdate:(id)a3 error:(id)a4
{
  if (a3)
    -[RTRoutineManagerRegistrantPeopleDiscovery onDensityUpdate:error:](self->_peopleDiscoveryRegistrant, "onDensityUpdate:error:", a3, a4);
}

- (void)fetchCurrentPeopleDensity:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTRoutineManager fetchCurrentPeopleDensity:]";
      v15 = 1024;
      v16 = 2656;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completionHandler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke;
  v11[3] = &unk_1E4FB0B30;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke_2;
  v9[3] = &unk_1E4FB0C48;
  v10 = v12;
  v8 = v12;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke_3;
  v3[3] = &unk_1E4FB12C0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchOngoingPeopleDensity:", v3);

}

uint64_t __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v20[3] = &unk_1E4FB0B30;
  v21 = v11;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_447;
  v16[3] = &unk_1E4FB0B80;
  v17 = v9;
  v18 = v10;
  v19 = v21;
  v13 = v21;
  v14 = v10;
  v15 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v20, v16);

}

void __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, MEMORY[0x1E0C9AA60], v3);

}

void __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_447(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4FB0B58;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", v3, v4, v5);

}

void __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_DEFAULT, "fetchProximityHistoryFromStartDate called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke;
  v15[3] = &unk_1E4FB0B30;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_448;
  v12[3] = &unk_1E4FB0BA8;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

void __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, MEMORY[0x1E0C9AA60], v3);

}

void __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_448(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_2;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchProximityHistoryFromEventIDs:completionHandler:", v3, v4);

}

void __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_DEFAULT, "fetchProximityHistoryFromEventIDs called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPeopleCountEventsHistory:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke;
  v15[3] = &unk_1E4FB0B30;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke_449;
  v12[3] = &unk_1E4FB0BA8;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

void __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, MEMORY[0x1E0C9AA60], v3);

}

void __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke_449(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke_2;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchPeopleCountEventsHistory:completionHandler:", v3, v4);

}

void __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_DEFAULT, "fetchPeopleCountEventsHistory called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v20[3] = &unk_1E4FB0B30;
  v21 = v11;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_450;
  v16[3] = &unk_1E4FB0B80;
  v17 = v9;
  v18 = v10;
  v19 = v21;
  v13 = v21;
  v14 = v10;
  v15 = v9;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v20, v16);

}

void __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, MEMORY[0x1E0C9AA60], v3);

}

void __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_450(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4FB0B58;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", v3, v4, v5);

}

void __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_DEFAULT, "fetchPeopleDensityHistoryFromStartDate called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke;
  v15[3] = &unk_1E4FB0B30;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke_451;
  v12[3] = &unk_1E4FB0BA8;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

void __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, MEMORY[0x1E0C9AA60], v3);

}

void __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke_451(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke_2;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchContactScoresFromContactIDs:completionHandler:", v3, v4);

}

void __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_DEFAULT, "fetchContactScoresFromContactIDs called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addElevations:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityElevation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked addElevations.", buf, 2u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__RTRoutineManager_addElevations_handler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __42__RTRoutineManager_addElevations_handler___block_invoke_452;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

void __42__RTRoutineManager_addElevations_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityElevation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_DEBUG, "RTRoutineManager: error from addElevations:handler:.", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __42__RTRoutineManager_addElevations_handler___block_invoke_452(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__RTRoutineManager_addElevations_handler___block_invoke_2;
  v4[3] = &unk_1E4FB0B30;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "addElevations:handler:", v3, v4);

}

uint64_t __42__RTRoutineManager_addElevations_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchElevationsWithOptions:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityElevation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchElevationsWithOptions:reply:.", buf, 2u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke_453;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

void __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityElevation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_DEBUG, "RTRoutineManager: error from fetchElevationsWithOptions:reply:.", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke_453(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke_2;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchElevationsWithOptions:reply:", v3, v4);

}

void __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityElevation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_debug_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_DEBUG, "RTRoutineManager: replying from fetchElevationsWithOptions:reply:.", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchBackgroundInertialOdometrySamplesWithOptions:handler:.", buf, 2u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke_454;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

void __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "RTRoutineManager: error from fetchBackgroundInertialOdometrySamplesWithOptions:handler:, %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke_454(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke_2;
  v4[3] = &unk_1E4FB0B58;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "fetchBackgroundInertialOdometrySamplesWithOptions:reply:", v3, v4);

}

void __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_INFO, "RTRoutineManager: replying from fetchBackgroundInertialOdometrySamplesWithOptions:handler:.", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67174657;
    v19 = objc_msgSend(v7, "count");
    _os_log_debug_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked addBackgroundInertialOdometrySamples:handler: with %{private}d samples.", buf, 8u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke;
  v16[3] = &unk_1E4FB0B30;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke_455;
  v13[3] = &unk_1E4FB0BA8;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[RTRoutineManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

void __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "RTRoutineManager: error from addBackgroundInertialOdometrySamples:handler:, %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke_455(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke_2;
  v4[3] = &unk_1E4FB0B30;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "addBackgroundInertialOdometrySamples:reply:", v3, v4);

}

void __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_INFO, "RTRoutineManager: replying from addBackgroundInertialOdometrySamples:handler:.", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setVisitHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLeechedVisitHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLeechedLowConfidenceVisitHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (RTPlaceInferenceOptions)placeInferenceOptions
{
  return self->_placeInferenceOptions;
}

- (void)setPlaceInferenceOptions:(id)a3
{
  objc_storeStrong((id *)&self->_placeInferenceOptions, a3);
}

- (id)placeInferencesHandler
{
  return self->_placeInferencesHandler;
}

- (void)setPlaceInferencesHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setVehicleEventsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)peopleDiscoveryErrorHandler
{
  return self->_peopleDiscoveryErrorHandler;
}

- (void)setPeopleDiscoveryErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setRestorationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_restorationIdentifier, a3);
}

- (RTEventAgentHelper)eventAgentHelper
{
  return self->_eventAgentHelper;
}

- (void)setEventAgentHelper:(id)a3
{
  objc_storeStrong((id *)&self->_eventAgentHelper, a3);
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (RTTokenBucket)clientThrottle
{
  return self->_clientThrottle;
}

- (void)setClientThrottle:(id)a3
{
  objc_storeStrong((id *)&self->_clientThrottle, a3);
}

- (RTRoutineManagerRegistrantAction)actionRegistrant
{
  return self->_actionRegistrant;
}

- (void)setActionRegistrant:(id)a3
{
  objc_storeStrong((id *)&self->_actionRegistrant, a3);
}

- (RTRoutineManagerRegistrantPeopleDiscovery)peopleDiscoveryRegistrant
{
  return self->_peopleDiscoveryRegistrant;
}

- (void)setPeopleDiscoveryRegistrant:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryRegistrant, a3);
}

- (RTRoutineManagerRegistrantScenarioTrigger)scenarioTriggerRegistrant
{
  return self->_scenarioTriggerRegistrant;
}

- (void)setScenarioTriggerRegistrant:(id)a3
{
  objc_storeStrong((id *)&self->_scenarioTriggerRegistrant, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerRegistrant, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryRegistrant, 0);
  objc_storeStrong((id *)&self->_actionRegistrant, 0);
  objc_storeStrong((id *)&self->_clientThrottle, 0);
  objc_storeStrong((id *)&self->_eventAgentHelper, 0);
  objc_storeStrong((id *)&self->_restorationIdentifier, 0);
  objc_storeStrong(&self->_peopleDiscoveryErrorHandler, 0);
  objc_storeStrong(&self->_vehicleEventsHandler, 0);
  objc_storeStrong(&self->_placeInferencesHandler, 0);
  objc_storeStrong((id *)&self->_placeInferenceOptions, 0);
  objc_storeStrong(&self->_leechedLowConfidenceVisitHandler, 0);
  objc_storeStrong(&self->_leechedVisitHandler, 0);
  objc_storeStrong(&self->_visitHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)fetchCurrentPredictedLocationsOfInterestLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  double v15;
  double v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (v9)
  {
    -[RTRoutineManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke;
    block[3] = &unk_1E4FB16C0;
    block[4] = self;
    v14 = a2;
    v13 = v9;
    v15 = a3;
    v16 = a4;
    dispatch_async(v10, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTRoutineManager(Skyline) fetchCurrentPredictedLocationsOfInterestLookingBack:lookingAhead:handler:]";
      v19 = 1024;
      v20 = 21;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

void __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke_2;
  v10[3] = &unk_1E4FB0B30;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_proxyForServicingSelector:withErrorHandler:", v4, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke_3;
  v8[3] = &unk_1E4FB0B58;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "fetchCurrentPredictedLocationsOfInterestLookingBack:lookingAhead:reply:", v8, v6, v7);

}

uint64_t __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  double v15;
  double v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (v9)
  {
    -[RTRoutineManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke;
    block[3] = &unk_1E4FB16C0;
    block[4] = self;
    v14 = a2;
    v13 = v9;
    v15 = a3;
    v16 = a4;
    dispatch_async(v10, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTRoutineManager(Skyline) performBluePOIQueryLookingBack:lookingAhead:handler:]";
      v19 = 1024;
      v20 = 40;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

void __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_2;
  v10[3] = &unk_1E4FB0B30;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_proxyForServicingSelector:withErrorHandler:", v4, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_3;
  v8[3] = &unk_1E4FB16E8;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "performBluePOIQueryLookingBack:lookingAhead:reply:", v8, v6, v7);

}

uint64_t __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
