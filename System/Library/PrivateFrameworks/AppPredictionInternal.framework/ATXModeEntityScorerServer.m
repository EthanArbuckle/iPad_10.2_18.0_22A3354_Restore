@implementation ATXModeEntityScorerServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_23 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_23, &__block_literal_global_132);
  return (id)sharedInstance__pasExprOnceResult_29;
}

void __43__ATXModeEntityScorerServer_sharedInstance__block_invoke()
{
  void *v0;
  ATXModeEntityScorerServer *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = -[ATXModeEntityScorerServer initWithContactStoreProvider:]([ATXModeEntityScorerServer alloc], "initWithContactStoreProvider:", &__block_literal_global_9);
  v2 = (void *)sharedInstance__pasExprOnceResult_29;
  sharedInstance__pasExprOnceResult_29 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id __43__ATXModeEntityScorerServer_sharedInstance__block_invoke_2()
{
  return (id)objc_opt_new();
}

- (ATXModeEntityScorerServer)initWithContactStoreProvider:(id)a3
{
  id v4;
  ATXModeEntityScorerServer *v5;
  uint64_t v6;
  NSXPCListener *listener;
  id v8;
  uint64_t v9;
  _PASLazyPurgeableResult *lazyStableContactRepresentationDataStore;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXModeEntityScorerServer;
  v5 = -[ATXModeEntityScorerServer init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.ModeEntityScorer"));
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v6;

    -[NSXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
    -[NSXPCListener resume](v5->_listener, "resume");
    v8 = objc_alloc(MEMORY[0x1E0D815E0]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__ATXModeEntityScorerServer_initWithContactStoreProvider___block_invoke;
    v12[3] = &unk_1E82E54B0;
    v13 = v4;
    v9 = objc_msgSend(v8, "initWithBlock:idleTimeout:", v12, 3600.0);
    lazyStableContactRepresentationDataStore = v5->_lazyStableContactRepresentationDataStore;
    v5->_lazyStableContactRepresentationDataStore = (_PASLazyPurgeableResult *)v9;

  }
  return v5;
}

ATXStableContactRepresentationDatastore *__58__ATXModeEntityScorerServer_initWithContactStoreProvider___block_invoke(uint64_t a1)
{
  ATXStableContactRepresentationDatastore *v2;
  void *v3;
  ATXStableContactRepresentationDatastore *v4;

  v2 = [ATXStableContactRepresentationDatastore alloc];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXStableContactRepresentationDatastore initWithContactStore:](v2, "initWithContactStore:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXModeEntityScorerServer;
  -[ATXModeEntityScorerServer dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  uint64_t v70;
  ATXModeEntityScorerServer *v72;
  uint8_t buf[16];
  _QWORD v74[6];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[4];

  v93[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.ModeEntityScorer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v72 = self;
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "ATXModeEntityScorerServer Established connection", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF99C1F0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    v93[0] = objc_opt_class();
    v93[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_scoreContacts_mode_reply_, 0, 1);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v92[0] = objc_opt_class();
    v92[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_rankedContactsForMode_reply_, 0, 1);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v91[0] = objc_opt_class();
    v91[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_scoreContacts_mode_reply_, 0, 0);

    v18 = (void *)MEMORY[0x1E0C99E60];
    v90[0] = objc_opt_class();
    v90[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_scoreApps_mode_reply_, 0, 1);

    v21 = (void *)MEMORY[0x1E0C99E60];
    v89[0] = objc_opt_class();
    v89[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedAppsForMode_reply_, 0, 1);

    v24 = (void *)MEMORY[0x1E0C99E60];
    v88[0] = objc_opt_class();
    v88[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_scoreApps_mode_reply_, 0, 0);

    v27 = (void *)MEMORY[0x1E0C99E60];
    v87[0] = objc_opt_class();
    v87[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_scoreAppsForDenyList_mode_reply_, 0, 1);

    v30 = (void *)MEMORY[0x1E0C99E60];
    v86[0] = objc_opt_class();
    v86[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_rankedAppsForDenyListForMode_reply_, 0, 1);

    v33 = (void *)MEMORY[0x1E0C99E60];
    v85[0] = objc_opt_class();
    v85[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWithArray:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_scoreAppsForDenyList_mode_reply_, 0, 0);

    v36 = (void *)MEMORY[0x1E0C99E60];
    v84[0] = objc_opt_class();
    v84[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_scoreContactsForDenyList_mode_reply_, 0, 1);

    v39 = (void *)MEMORY[0x1E0C99E60];
    v83[0] = objc_opt_class();
    v83[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_rankedContactsForDenyListForMode_reply_, 0, 1);

    v42 = (void *)MEMORY[0x1E0C99E60];
    v82[0] = objc_opt_class();
    v82[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithArray:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_rankedContactsForDenyListForMode_options_reply_, 0, 1);

    v45 = (void *)MEMORY[0x1E0C99E60];
    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setWithArray:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_scoreContactsForDenyList_mode_reply_, 0, 0);

    v48 = (void *)MEMORY[0x1E0C99E60];
    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setWithArray:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_rankedWidgetsForMode_reply_, 0, 1);

    v51 = (void *)MEMORY[0x1E0C99E60];
    v79[0] = objc_opt_class();
    v79[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setWithArray:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_scoreNotifications_mode_reply_, 0, 1);

    v54 = (void *)MEMORY[0x1E0C99E60];
    v78[0] = objc_opt_class();
    v78[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setWithArray:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_scoreNotifications_mode_reply_, 0, 0);

    v57 = (void *)MEMORY[0x1E0C99E60];
    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setWithArray:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_rankedNotificationsForMode_reply_, 0, 1);

    v60 = (void *)MEMORY[0x1E0C99E60];
    v76[0] = objc_opt_class();
    v76[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setWithArray:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_rankedAppsForNotificationsForMode_reply_, 0, 1);

    v63 = (void *)MEMORY[0x1E0C99E60];
    v75[0] = objc_opt_class();
    v75[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setWithArray:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_rankedContactsForNotificationsForMode_reply_, 0, 1);

    v66 = (void *)MEMORY[0x1E0C99E60];
    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    v74[2] = objc_opt_class();
    v74[3] = objc_opt_class();
    v67 = 1;
    v74[4] = objc_opt_class();
    v74[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 6);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setWithArray:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply_, 0, 1);

    objc_msgSend(v5, "setExportedInterface:", v8);
    objc_msgSend(v5, "setExportedObject:", v72);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_70);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_72_2);
    objc_msgSend(v5, "resume");
  }
  else
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v8, v70);
    v67 = 0;
  }

  return v67;
}

void __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_71()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_71_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void (**v26)(id, id, _QWORD);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = (void (**)(id, id, _QWORD))a5;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = v6;
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v10);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[_PASLazyPurgeableResult result](self->_lazyStableContactRepresentationDataStore, "result");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cnContactId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "rawIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stableContactRepresentationForCnContactId:rawIdentifier:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stableContactIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setStableContactIdentifier:", v17);

      }
      v6 = v10;
      v8 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }
  if (v26)
  {
    -[ATXModeEntityScorerServer scoreEntities:entityTypeIdentifier:mode:](self, "scoreEntities:entityTypeIdentifier:mode:", v6, *MEMORY[0x1E0D80E78], a4);
    v26[2](v26, v6, 0);
  }
  else
  {
    __atxlog_handle_notification_management();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise:format:", v20, CFSTR("No reply handler provided for %@ in %@"), v21, v23);

  }
}

- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v7)
  {
    -[ATXModeEntityScorerServer rankedContactsForMode:](self, "rankedContactsForMode:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("No reply handler provided for %@ in %@"), v12, v14);

  }
}

- (id)rankedContactsForMode:(unint64_t)a3
{
  return -[ATXModeEntityScorerServer rankedContactsForMode:options:](self, "rankedContactsForMode:options:", a3, 0);
}

- (id)rankedContactsForMode:(unint64_t)a3 options:(unint64_t)a4
{
  return -[ATXModeEntityScorerServer rankedEntitiesForMode:entityTypeIdentifier:options:](self, "rankedEntitiesForMode:entityTypeIdentifier:options:", a3, *MEMORY[0x1E0D80E78], a4);
}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9;
  void (**v10)(id, id, _QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v9 = a3;
  v10 = (void (**)(id, id, _QWORD))a5;
  if (v10)
  {
    -[ATXModeEntityScorerServer scoreEntities:entityTypeIdentifier:mode:](self, "scoreEntities:entityTypeIdentifier:mode:", v9, *MEMORY[0x1E0D80E70], a4);
    v10[2](v10, v9, 0);
  }
  else
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("No reply handler provided for %@ in %@"), v14, v16);

  }
}

- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v7)
  {
    -[ATXModeEntityScorerServer rankedAppsForMode:](self, "rankedAppsForMode:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("No reply handler provided for %@ in %@"), v12, v14);

  }
}

- (id)rankedAppsForMode:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  v10 = (void *)objc_msgSend(v5, "initWithArray:", v9);
  -[ATXModeEntityScorerServer rankedEntitiesForMode:entityTypeIdentifier:options:](self, "rankedEntitiesForMode:entityTypeIdentifier:options:", a3, *MEMORY[0x1E0D80E70], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__ATXModeEntityScorerServer_rankedAppsForMode___block_invoke;
  v15[3] = &unk_1E82E5518;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "_pas_filteredArrayWithTest:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __47__ATXModeEntityScorerServer_rankedAppsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CF8CE8];
  objc_msgSend(v3, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInstalledAndNotRestrictedForBundle:", v5))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7) ^ 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v7)
  {
    -[ATXModeEntityScorerServer rankedWidgetsForMode:](self, "rankedWidgetsForMode:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("No reply handler provided for %@ in %@"), v12, v14);

  }
}

- (id)rankedWidgetsForMode:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[ATXModeEntityScorerServer rankedEntitiesForMode:entityTypeIdentifier:options:](self, "rankedEntitiesForMode:entityTypeIdentifier:options:", a3, *MEMORY[0x1E0D80EE0], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_filteredArrayWithTest:", &__block_literal_global_79_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __50__ATXModeEntityScorerServer_rankedWidgetsForMode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "widget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((ATXBundleIdIsFakeContainerBundleId() & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(MEMORY[0x1E0CF8CE8], "isInstalledAndNotRestrictedForBundle:", v4);

  return v5;
}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, id, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, id, _QWORD))a5;
  if (v9)
  {
    v10 = *MEMORY[0x1E0D80EC0];
    ATXModeToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXModeEntityScorerServer modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          -[ATXModeEntityScorerServer scoreNotificationModeEntity:modeEntityScores:](self, "scoreNotificationModeEntity:modeEntityScores:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v12);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    v9[2](v9, v13, 0);
  }
  else
  {
    __atxlog_handle_notification_management();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise:format:", v20, CFSTR("No reply handler provided for %@ in %@"), v12, v22);

  }
}

- (void)scoreNotificationModeEntity:(id)a3 modeEntityScores:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  objc_msgSend(v23, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "scoreMetadata");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v21 = (id)v9;
    objc_msgSend(v23, "setScoreMetadata:", v9);
    goto LABEL_12;
  }
  objc_msgSend(v23, "appEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "contactEntity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || !v11)
  {
    -[ATXModeEntityScorerServer emptyModeEntityScore](self, "emptyModeEntityScore");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[ATXModeEntityScorerServer scoredNotificationEntityForAppFromNotificationEntity:notificationScores:](self, "scoredNotificationEntityForAppFromNotificationEntity:notificationScores:", v23, v6);
  v12 = objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityScorerServer scoredNotificationEntityForContactFromNotificationEntity:notificationScores:](self, "scoredNotificationEntityForContactFromNotificationEntity:notificationScores:", v23, v6);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 | v13)
  {
    if (!v12)
      goto LABEL_8;
    objc_msgSend((id)v12, "scoreMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "score");
    v16 = v15;
    objc_msgSend((id)v13, "scoreMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "score");
    v19 = v18;

    v20 = (void *)v12;
    if (v16 < v19)
LABEL_8:
      v20 = (void *)v13;
    v21 = v20;
    objc_msgSend(v21, "scoreMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ATXModeEntityScorerServer emptyModeEntityScore](self, "emptyModeEntityScore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
  }
  objc_msgSend(v23, "setScoreMetadata:", v22);

LABEL_12:
}

- (id)emptyModeEntityScore
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CF8F50]);
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(v2, "initWithScore:featureVector:uuid:", 0, v3, 0.0);

  return v4;
}

- (id)scoredNotificationEntityForAppFromNotificationEntity:(id)a3 notificationScores:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "appEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8FC0]), "initWithAppEntity:", v6);
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)scoredNotificationEntityForContactFromNotificationEntity:(id)a3 notificationScores:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "contactEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8FC0]), "initWithContactEntity:", v6);
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v7)
  {
    -[ATXModeEntityScorerServer rankedNotificationsForMode:](self, "rankedNotificationsForMode:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("No reply handler provided for %@ in %@"), v12, v14);

  }
}

- (id)rankedNotificationsForMode:(unint64_t)a3
{
  return -[ATXModeEntityScorerServer rankedEntitiesForMode:entityTypeIdentifier:options:](self, "rankedEntitiesForMode:entityTypeIdentifier:options:", a3, *MEMORY[0x1E0D80EC0], 0);
}

- (id)rankedNotificationsForMode:(unint64_t)a3 options:(unint64_t)a4
{
  return -[ATXModeEntityScorerServer rankedEntitiesForMode:entityTypeIdentifier:options:](self, "rankedEntitiesForMode:entityTypeIdentifier:options:", a3, *MEMORY[0x1E0D80EC0], a4);
}

- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  void (**v7)(id, id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  _QWORD v16[4];
  id v17;

  v7 = (void (**)(id, id, _QWORD))a4;
  if (v7)
  {
    -[ATXModeEntityScorerServer rankedEntitiesForMode:entityTypeIdentifier:options:](self, "rankedEntitiesForMode:entityTypeIdentifier:options:", a3, *MEMORY[0x1E0D80EC0], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_83);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_opt_new();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__ATXModeEntityScorerServer_rankedAppsForNotificationsForMode_reply___block_invoke_2;
    v16[3] = &unk_1E82E55C0;
    v17 = v10;
    v11 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
    v7[2](v7, v11, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("No reply handler provided for %@ in %@"), v9, v11);
  }

}

BOOL __69__ATXModeEntityScorerServer_rankedAppsForNotificationsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  objc_msgSend(a2, "contactEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 == 0;
}

void __69__ATXModeEntityScorerServer_rankedAppsForNotificationsForMode_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "appEntity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scoreMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setScoreMetadata:", v4);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  -[ATXModeEntityScorerServer rankedContactsForNotificationsForMode:options:reply:](self, "rankedContactsForNotificationsForMode:options:reply:", a3, 0, a4);
}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  void (**v9)(id, id, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  _QWORD v18[4];
  id v19;

  v9 = (void (**)(id, id, _QWORD))a5;
  if (v9)
  {
    -[ATXModeEntityScorerServer rankedEntitiesForMode:entityTypeIdentifier:options:](self, "rankedEntitiesForMode:entityTypeIdentifier:options:", a3, *MEMORY[0x1E0D80EC0], a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_pas_filteredArrayWithTest:", &__block_literal_global_86);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__ATXModeEntityScorerServer_rankedContactsForNotificationsForMode_options_reply___block_invoke_2;
    v18[3] = &unk_1E82E55C0;
    v19 = v12;
    v13 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);
    v9[2](v9, v13, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No reply handler provided for %@ in %@"), v11, v13);
  }

}

BOOL __81__ATXModeEntityScorerServer_rankedContactsForNotificationsForMode_options_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  objc_msgSend(a2, "appEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 == 0;
}

void __81__ATXModeEntityScorerServer_rankedContactsForNotificationsForMode_options_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "contactEntity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scoreMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setScoreMetadata:", v4);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9;
  void (**v10)(id, id, _QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v9 = a3;
  v10 = (void (**)(id, id, _QWORD))a5;
  if (v10)
  {
    -[ATXModeEntityScorerServer scoreEntitiesForDenyList:entityTypeIdentifier:mode:](self, "scoreEntitiesForDenyList:entityTypeIdentifier:mode:", v9, *MEMORY[0x1E0D80E70], a4);
    v10[2](v10, v9, 0);
  }
  else
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("No reply handler provided for %@ in %@"), v14, v16);

  }
}

- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v7)
  {
    -[ATXModeEntityScorerServer rankedAppsForDenyListForMode:](self, "rankedAppsForDenyListForMode:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("No reply handler provided for %@ in %@"), v12, v14);

  }
}

- (id)rankedAppsForDenyListForMode:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  v10 = (void *)objc_msgSend(v5, "initWithArray:", v9);
  -[ATXModeEntityScorerServer rankedEntitiesForDenyListForMode:entityTypeIdentifier:options:](self, "rankedEntitiesForDenyListForMode:entityTypeIdentifier:options:", a3, *MEMORY[0x1E0D80E70], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__ATXModeEntityScorerServer_rankedAppsForDenyListForMode___block_invoke;
  v15[3] = &unk_1E82E5518;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "_pas_filteredArrayWithTest:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __58__ATXModeEntityScorerServer_rankedAppsForDenyListForMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CF8CE8];
  objc_msgSend(v3, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInstalledAndNotRestrictedForBundle:", v5))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7) ^ 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9;
  void (**v10)(id, id, _QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v9 = a3;
  v10 = (void (**)(id, id, _QWORD))a5;
  if (v10)
  {
    -[ATXModeEntityScorerServer scoreEntitiesForDenyList:entityTypeIdentifier:mode:](self, "scoreEntitiesForDenyList:entityTypeIdentifier:mode:", v9, *MEMORY[0x1E0D80E78], a4);
    v10[2](v10, v9, 0);
  }
  else
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("No reply handler provided for %@ in %@"), v14, v16);

  }
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  -[ATXModeEntityScorerServer rankedContactsForDenyListForMode:options:reply:](self, "rankedContactsForDenyListForMode:options:reply:", a3, 0, a4);
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  void (**v9)(id, void *, _QWORD);
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v9 = (void (**)(id, void *, _QWORD))a5;
  if (v9)
  {
    -[ATXModeEntityScorerServer rankedContactsForDenyListForMode:options:](self, "rankedContactsForDenyListForMode:options:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("No reply handler provided for %@ in %@"), v14, v16);

  }
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3
{
  return -[ATXModeEntityScorerServer rankedContactsForDenyListForMode:options:](self, "rankedContactsForDenyListForMode:options:", a3, 0);
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4
{
  return -[ATXModeEntityScorerServer rankedEntitiesForDenyListForMode:entityTypeIdentifier:options:](self, "rankedEntitiesForDenyListForMode:entityTypeIdentifier:options:", a3, *MEMORY[0x1E0D80E78], a4);
}

- (void)scoreEntities:(id)a3 entityTypeIdentifier:(id)a4 mode:(unint64_t)a5 modeConfigurationType:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  ATXModeToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityScorerServer modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v10, v11, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v20, "scoreMetadata");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = objc_alloc(MEMORY[0x1E0CF8F50]);
          v23 = (void *)objc_opt_new();
          v21 = (void *)objc_msgSend(v22, "initWithScore:featureVector:uuid:", 0, v23, 0.0);

        }
        objc_msgSend(v18, "setScoreMetadata:", v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

}

- (void)scoreEntities:(id)a3 entityTypeIdentifier:(id)a4 mode:(unint64_t)a5
{
  -[ATXModeEntityScorerServer scoreEntities:entityTypeIdentifier:mode:modeConfigurationType:](self, "scoreEntities:entityTypeIdentifier:mode:modeConfigurationType:", a3, a4, a5, 0);
}

- (void)scoreEntitiesForDenyList:(id)a3 entityTypeIdentifier:(id)a4 mode:(unint64_t)a5
{
  -[ATXModeEntityScorerServer scoreEntities:entityTypeIdentifier:mode:modeConfigurationType:](self, "scoreEntities:entityTypeIdentifier:mode:modeConfigurationType:", a3, a4, a5, 1);
}

- (id)rankedEntitiesForMode:(unint64_t)a3 entityTypeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5 options:(unint64_t)a6
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  _PASLazyPurgeableResult *lazyStableContactRepresentationDataStore;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  id obj;
  ATXModeEntityScorerServer *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[8];
  void *v48;
  void *v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v6 = a6;
  v52 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  ATXModeToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = self;
  -[ATXModeEntityScorerServer modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D80E78]))
  {
    if ((v6 & 1) == 0)
    {
      lazyStableContactRepresentationDataStore = self->_lazyStableContactRepresentationDataStore;
      v13 = v11;
      -[_PASLazyPurgeableResult result](lazyStableContactRepresentationDataStore, "result");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "refreshCnContactIdsGivenContactEntities:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    __atxlog_handle_notification_management();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v30 = "Skipping contact id refresh because option was specified for ranked contact entities.";
    goto LABEL_20;
  }
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D80EC0]))
    goto LABEL_22;
  if ((v6 & 1) != 0)
  {
    __atxlog_handle_notification_management();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v30 = "Skipping contact id refresh because option was specified for ranked notification entities.";
LABEL_20:
    _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
    goto LABEL_21;
  }
  v40 = v9;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v39 = v11;
  objc_msgSend(v39, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v19, "contactEntity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[_PASLazyPurgeableResult result](v42->_lazyStableContactRepresentationDataStore, "result");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "contactEntity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v23;
          objc_msgSend(v19, "contactEntity");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "refreshCnContactIdsGivenContactEntities:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "allValues");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setContactEntity:", v28);

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v16);
  }

  v11 = v39;
  v9 = v40;
LABEL_22:
  objc_msgSend(v11, "allValues");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");
  v33 = v32;
  if (v32)
    v34 = v32;
  else
    v34 = (id)objc_opt_new();
  v35 = v34;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("scoreMetadata.score"), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sortUsingDescriptors:", v37);

  return v35;
}

- (id)rankedEntitiesForMode:(unint64_t)a3 entityTypeIdentifier:(id)a4 options:(unint64_t)a5
{
  return -[ATXModeEntityScorerServer rankedEntitiesForMode:entityTypeIdentifier:modeConfigurationType:options:](self, "rankedEntitiesForMode:entityTypeIdentifier:modeConfigurationType:options:", a3, a4, 0, a5);
}

- (id)rankedEntitiesForDenyListForMode:(unint64_t)a3 entityTypeIdentifier:(id)a4 options:(unint64_t)a5
{
  return -[ATXModeEntityScorerServer rankedEntitiesForMode:entityTypeIdentifier:modeConfigurationType:options:](self, "rankedEntitiesForMode:entityTypeIdentifier:modeConfigurationType:options:", a3, a4, 1, a5);
}

- (id)pathForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v7 = (void *)MEMORY[0x1E0CF94D8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "modeCachesRootDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), v9, v8);

  objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 1)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringForATXModeConfigurationType();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithFormat:", CFSTR("%@_%@"), v12, v14);

    v12 = (void *)v15;
  }
  return v12;
}

- (void)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5 reply:(id)a6
{
  void (**v11)(id, void *, _QWORD);
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;

  v11 = (void (**)(id, void *, _QWORD))a6;
  if (v11)
  {
    -[ATXModeEntityScorerServer modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", a3, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v12, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise:format:", v15, CFSTR("No reply handler provided for %@ in %@"), v16, v18);

  }
}

- (id)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *context;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  NSObject *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1CAA48B6C]();
  -[ATXModeEntityScorerServer pathForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "pathForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v11, 1, &v40);
  v13 = v40;
  v14 = v13;
  if (v12)
    v15 = v13 == 0;
  else
    v15 = 0;
  if (v15)
  {
    v31 = v11;
    v32 = v10;
    v33 = v9;
    v34 = v8;
    v18 = MEMORY[0x1CAA48B6C]();
    v37 = (void *)MEMORY[0x1E0CB3710];
    v38 = (void *)v18;
    context = (void *)MEMORY[0x1CAA48B6C]();
    v35 = objc_alloc(MEMORY[0x1E0C99E60]);
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = (void *)objc_msgSend(v35, "initWithObjects:", v19, v20, v21, v22, v23, v24, v25, v26, objc_opt_class(), 0);
    objc_autoreleasePoolPop(context);
    v39 = 0;
    objc_msgSend(v37, "unarchivedObjectOfClasses:fromData:error:", v27, v12, &v39);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v39;

    objc_autoreleasePoolPop(v38);
    if (!v28 || v16)
    {
      __atxlog_handle_notification_management();
      v29 = objc_claimAutoreleasedReturnValue();
      v9 = v33;
      v8 = v34;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v42 = v34;
        v43 = 2112;
        v44 = v33;
        v45 = 2112;
        v46 = v16;
        _os_log_error_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_ERROR, "Couldn't deserialized cached model results for EntityType: %@, Mode: %@. Error: %@", buf, 0x20u);
      }

      v17 = 0;
    }
    else
    {
      v17 = v28;
      v9 = v33;
      v8 = v34;
    }
    v11 = v31;
    v10 = v32;

  }
  else
  {
    __atxlog_handle_notification_management();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v42 = v8;
      v43 = 2112;
      v44 = v9;
      v45 = 2112;
      v46 = v14;
      _os_log_error_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_ERROR, "Couldn't find any cached model results for EntityType: %@, Mode: %@. Error: %@", buf, 0x20u);
    }
    v17 = 0;
  }

  objc_autoreleasePoolPop(v10);
  return v17;
}

- (id)dataFromFileHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  if (!a3)
    return 0;
  v15 = 0;
  objc_msgSend(a3, "readDataToEndOfFileAndReturnError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  v5 = v4;
  if (!v3 || v4)
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer dataFromFileHandle:].cold.1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);

    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (void)assignModeEntityScores:(unint64_t)a3 entityTypeIdentifier:(id)a4 entityIdentifier:(id)a5 score:(double)a6 modeConfigurationType:(int64_t)a7 reply:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, _BOOL8, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  NSObject *v38;
  uint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, _BOOL8, _QWORD))a8;
  if (v16)
  {
    ATXModeToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXModeEntityScorerServer modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v14, v17, a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    v20 = v19;
    if (v19)
      v21 = v19;
    else
      v21 = (id)objc_opt_new();
    v25 = v21;

    objc_msgSend(v25, "objectForKeyedSubscript:", v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", v15);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "scoreMetadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setScore:", a6);

    }
    else
    {
      __atxlog_handle_notification_management();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315395;
        v41 = "-[ATXModeEntityScorerServer assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigu"
              "rationType:reply:]";
        v42 = 2117;
        v43 = v15;
        _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "%s: Entity with identifier: '%{sensitive}@' was not in the cache. Creating a new entry.", buf, 0x16u);
      }

      if (objc_msgSend(v14, "isEqual:", CFSTR("apps")))
      {
        v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8CC0]), "initWithBundleId:", v15);
      }
      else
      {
        if (!objc_msgSend(v14, "isEqual:", CFSTR("contacts")))
        {
          __atxlog_handle_notification_management();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[ATXModeEntityScorerServer assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:].cold.2((uint64_t)v14, v38, v39);

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s: Unsupported entity type '%@'"), "-[ATXModeEntityScorerServer assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:]", v14);
          goto LABEL_18;
        }
        v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D48]), "initWithDisplayName:rawIdentifier:cnContactId:", v15, v15, v15);
      }
      v29 = (void *)v32;
      v33 = objc_alloc(MEMORY[0x1E0CF8F50]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithScore:featureVector:uuid:", 0, v34, a6);
      objc_msgSend(v29, "setScoreMetadata:", v35);

      objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, v15);
    }

LABEL_18:
    ATXModeToString();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[ATXModeEntityScorerServer saveScoredEntitiesToDisk:mode:modeEntityTypeIdentifier:modeConfigurationType:](self, "saveScoredEntitiesToDisk:mode:modeEntityTypeIdentifier:modeConfigurationType:", v25, v36, v14, a7);

    v16[2](v16, v37, 0);
    goto LABEL_19;
  }
  __atxlog_handle_notification_management();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[ATXModeEntityScorerServer scoreContacts:mode:reply:].cold.1();

  v23 = (void *)MEMORY[0x1E0C99DA0];
  v24 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "raise:format:", v24, CFSTR("No reply handler provided for %@ in %@"), v25, v27);

LABEL_19:
}

- (BOOL)saveScoredEntitiesToDisk:(id)a3 mode:(id)a4 modeEntityTypeIdentifier:(id)a5 modeConfigurationType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  NSObject *v26;
  BOOL v27;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1CAA48B6C]();
  -[ATXModeEntityScorerServer pathForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:](self, "pathForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", v12, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1CAA48B6C]();
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;
  objc_autoreleasePoolPop(v15);
  if (v17)
  {
    __atxlog_handle_notification_management();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerServer saveScoredEntitiesToDisk:mode:modeEntityTypeIdentifier:modeConfigurationType:].cold.1((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_10:
    v27 = 0;
    goto LABEL_11;
  }
  v29 = 0;
  v25 = objc_msgSend(v16, "writeToFile:options:error:", v14, 1073741825, &v29);
  v17 = v29;
  __atxlog_handle_notification_management();
  v26 = objc_claimAutoreleasedReturnValue();
  v18 = v26;
  if ((v25 & 1) == 0)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v12;
      v33 = 2112;
      v34 = v14;
      v35 = 2112;
      v36 = v17;
      _os_log_fault_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_FAULT, "FAILURE: Unable to write mode entity scores for mode entity type: %@ to path: %@. Error: %@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v12;
    v33 = 2112;
    v34 = v14;
    _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "SUCCESS: Finished writing mode entity scores for mode entity type: %@ to path: %@.", buf, 0x16u);
  }
  v27 = 1;
LABEL_11:

  objc_autoreleasePoolPop(v13);
  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyStableContactRepresentationDataStore, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = CFSTR("com.apple.ModeEntityScorer");
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a2, a3, "Rejecting connection %@ without entitlement %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Unexpected interruption on mode entity scorer server", a5, a6, a7, a8, 0);
}

void __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_71_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Connection invalidated on mode entity scorer server. Client went away.", a5, a6, a7, a8, 0);
}

- (void)scoreContacts:mode:reply:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v4, v5, "No reply handler provided for %@ in %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)dataFromFileHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)assignModeEntityScores:(uint64_t)a3 entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "-[ATXModeEntityScorerServer assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a2, a3, "%s: Unsupported entity type '%@'", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)saveScoredEntitiesToDisk:(uint64_t)a3 mode:(uint64_t)a4 modeEntityTypeIdentifier:(uint64_t)a5 modeConfigurationType:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not convert scoredEntities dictionary to NSData object due to err: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
