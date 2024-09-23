@implementation ATXModeEntityScorerClient

- (ATXModeEntityScorerClient)init
{
  ATXModeEntityScorerClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  objc_super v67;
  _QWORD v68[6];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
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
  _QWORD v87[4];

  v87[2] = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)ATXModeEntityScorerClient;
  v2 = -[ATXModeEntityScorerClient init](&v67, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ModeEntityScorer"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE795290);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v87[0] = objc_opt_class();
    v87[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_scoreContacts_mode_reply_, 0, 1);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v86[0] = objc_opt_class();
    v86[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_rankedContactsForMode_reply_, 0, 1);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v85[0] = objc_opt_class();
    v85[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_scoreContacts_mode_reply_, 0, 0);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v84[0] = objc_opt_class();
    v84[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_scoreApps_mode_reply_, 0, 1);

    v18 = (void *)MEMORY[0x1E0C99E60];
    v83[0] = objc_opt_class();
    v83[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_rankedAppsForMode_reply_, 0, 1);

    v21 = (void *)MEMORY[0x1E0C99E60];
    v82[0] = objc_opt_class();
    v82[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_scoreApps_mode_reply_, 0, 0);

    v24 = (void *)MEMORY[0x1E0C99E60];
    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_scoreAppsForDenyList_mode_reply_, 0, 1);

    v27 = (void *)MEMORY[0x1E0C99E60];
    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_rankedAppsForDenyListForMode_reply_, 0, 1);

    v30 = (void *)MEMORY[0x1E0C99E60];
    v79[0] = objc_opt_class();
    v79[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_scoreAppsForDenyList_mode_reply_, 0, 0);

    v33 = (void *)MEMORY[0x1E0C99E60];
    v78[0] = objc_opt_class();
    v78[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWithArray:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_scoreContactsForDenyList_mode_reply_, 0, 1);

    v36 = (void *)MEMORY[0x1E0C99E60];
    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_rankedContactsForDenyListForMode_reply_, 0, 1);

    v39 = (void *)MEMORY[0x1E0C99E60];
    v76[0] = objc_opt_class();
    v76[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_rankedContactsForDenyListForMode_options_reply_, 0, 1);

    v42 = (void *)MEMORY[0x1E0C99E60];
    v75[0] = objc_opt_class();
    v75[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithArray:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_scoreContactsForDenyList_mode_reply_, 0, 0);

    v45 = (void *)MEMORY[0x1E0C99E60];
    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setWithArray:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_rankedWidgetsForMode_reply_, 0, 1);

    v48 = (void *)MEMORY[0x1E0C99E60];
    v73[0] = objc_opt_class();
    v73[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setWithArray:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_scoreNotifications_mode_reply_, 0, 1);

    v51 = (void *)MEMORY[0x1E0C99E60];
    v72[0] = objc_opt_class();
    v72[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setWithArray:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_scoreNotifications_mode_reply_, 0, 0);

    v54 = (void *)MEMORY[0x1E0C99E60];
    v71[0] = objc_opt_class();
    v71[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setWithArray:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_rankedNotificationsForMode_reply_, 0, 1);

    v57 = (void *)MEMORY[0x1E0C99E60];
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setWithArray:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_rankedAppsForNotificationsForMode_reply_, 0, 1);

    v60 = (void *)MEMORY[0x1E0C99E60];
    v69[0] = objc_opt_class();
    v69[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setWithArray:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_rankedContactsForNotificationsForMode_reply_, 0, 1);

    v63 = (void *)MEMORY[0x1E0C99E60];
    v68[0] = objc_opt_class();
    v68[1] = objc_opt_class();
    v68[2] = objc_opt_class();
    v68[3] = objc_opt_class();
    v68[4] = objc_opt_class();
    v68[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 6);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setWithArray:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);
    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_22);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_56);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");

  }
  return v2;
}

void __33__ATXModeEntityScorerClient_init__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __33__ATXModeEntityScorerClient_init__block_invoke_cold_1(v0);

}

void __33__ATXModeEntityScorerClient_init__block_invoke_55()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_INFO, "ATXModeEntityScorer invalidation handler called", v1, 2u);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXModeEntityScorerClient;
  -[ATXModeEntityScorerClient dealloc](&v3, sel_dealloc);
}

- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9;
  id v10;
  NSXPCConnection *xpcConnection;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v12 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke;
      v27[3] = &unk_1E4D58D78;
      v27[4] = self;
      v27[5] = a2;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_67;
      v25[3] = &unk_1E4D57208;
      v26 = v10;
      objc_msgSend(v13, "scoreContacts:mode:reply:", v9, a4, v25);

    }
    else
    {
      __atxlog_handle_notification_management();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0CB2D98];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Missing entitlement for mode entity scoring.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 1, v23);

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v24);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No reply handler provided for %@ in %@"), v17, v19);

  }
}

void __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();

}

uint64_t __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  NSXPCConnection *xpcConnection;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  SEL v25;
  _QWORD v26[5];
  id v27;
  SEL v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v9 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __57__ATXModeEntityScorerClient_rankedContactsForMode_reply___block_invoke;
      v26[3] = &unk_1E4D57A00;
      v28 = a2;
      v26[4] = self;
      v10 = v7;
      v27 = v10;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __57__ATXModeEntityScorerClient_rankedContactsForMode_reply___block_invoke_69;
      v23[3] = &unk_1E4D58DA0;
      v25 = a2;
      v24 = v10;
      objc_msgSend(v11, "rankedContactsForMode:reply:", a3, v23);

    }
    else
    {
      __atxlog_handle_notification_management();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB2D98];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("Missing entitlement for mode entity scoring.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 1, v21);

      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, MEMORY[0x1E0C9AA60], v22);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("No reply handler provided for %@ in %@"), v15, v17);

  }
}

void __57__ATXModeEntityScorerClient_rankedContactsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__ATXModeEntityScorerClient_rankedContactsForMode_reply___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with contacts:%@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9;
  id v10;
  NSXPCConnection *xpcConnection;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v12 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __50__ATXModeEntityScorerClient_scoreApps_mode_reply___block_invoke;
      v27[3] = &unk_1E4D58D78;
      v27[4] = self;
      v27[5] = a2;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __50__ATXModeEntityScorerClient_scoreApps_mode_reply___block_invoke_70;
      v25[3] = &unk_1E4D57208;
      v26 = v10;
      objc_msgSend(v13, "scoreApps:mode:reply:", v9, a4, v25);

    }
    else
    {
      __atxlog_handle_notification_management();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0CB2D98];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Missing entitlement for mode entity scoring.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 1, v23);

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v24);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No reply handler provided for %@ in %@"), v17, v19);

  }
}

void __50__ATXModeEntityScorerClient_scoreApps_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();

}

uint64_t __50__ATXModeEntityScorerClient_scoreApps_mode_reply___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  NSXPCConnection *xpcConnection;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  SEL v25;
  _QWORD v26[5];
  id v27;
  SEL v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v9 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __53__ATXModeEntityScorerClient_rankedAppsForMode_reply___block_invoke;
      v26[3] = &unk_1E4D57A00;
      v28 = a2;
      v26[4] = self;
      v10 = v7;
      v27 = v10;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __53__ATXModeEntityScorerClient_rankedAppsForMode_reply___block_invoke_71;
      v23[3] = &unk_1E4D58DA0;
      v25 = a2;
      v24 = v10;
      objc_msgSend(v11, "rankedAppsForMode:reply:", a3, v23);

    }
    else
    {
      __atxlog_handle_notification_management();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB2D98];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("Missing entitlement for mode entity scoring.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 1, v21);

      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, MEMORY[0x1E0C9AA60], v22);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("No reply handler provided for %@ in %@"), v15, v17);

  }
}

void __53__ATXModeEntityScorerClient_rankedAppsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __53__ATXModeEntityScorerClient_rankedAppsForMode_reply___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with apps:%@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  NSXPCConnection *xpcConnection;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  SEL v25;
  _QWORD v26[5];
  id v27;
  SEL v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v9 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __56__ATXModeEntityScorerClient_rankedWidgetsForMode_reply___block_invoke;
      v26[3] = &unk_1E4D57A00;
      v28 = a2;
      v26[4] = self;
      v10 = v7;
      v27 = v10;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __56__ATXModeEntityScorerClient_rankedWidgetsForMode_reply___block_invoke_72;
      v23[3] = &unk_1E4D58DA0;
      v25 = a2;
      v24 = v10;
      objc_msgSend(v11, "rankedWidgetsForMode:reply:", a3, v23);

    }
    else
    {
      __atxlog_handle_modes();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB2D98];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("Missing entitlement for mode entity scoring.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 1, v21);

      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, MEMORY[0x1E0C9AA60], v22);
    }
  }
  else
  {
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("No reply handler provided for %@ in %@"), v15, v17);

  }
}

void __56__ATXModeEntityScorerClient_rankedWidgetsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __56__ATXModeEntityScorerClient_rankedWidgetsForMode_reply___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  __atxlog_handle_modes();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with widgets:%@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9;
  id v10;
  NSXPCConnection *xpcConnection;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v12 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __59__ATXModeEntityScorerClient_scoreNotifications_mode_reply___block_invoke;
      v27[3] = &unk_1E4D58D78;
      v27[4] = self;
      v27[5] = a2;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __59__ATXModeEntityScorerClient_scoreNotifications_mode_reply___block_invoke_73;
      v25[3] = &unk_1E4D57208;
      v26 = v10;
      objc_msgSend(v13, "scoreNotifications:mode:reply:", v9, a4, v25);

    }
    else
    {
      __atxlog_handle_notification_management();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0CB2D98];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Missing entitlement for mode entity scoring.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 1, v23);

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v24);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No reply handler provided for %@ in %@"), v17, v19);

  }
}

void __59__ATXModeEntityScorerClient_scoreNotifications_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();

}

uint64_t __59__ATXModeEntityScorerClient_scoreNotifications_mode_reply___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  NSXPCConnection *xpcConnection;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  SEL v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v9 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __62__ATXModeEntityScorerClient_rankedNotificationsForMode_reply___block_invoke;
      v25[3] = &unk_1E4D57A00;
      v27 = a2;
      v25[4] = self;
      v10 = v7;
      v26 = v10;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __62__ATXModeEntityScorerClient_rankedNotificationsForMode_reply___block_invoke_74;
      v23[3] = &unk_1E4D57208;
      v24 = v10;
      objc_msgSend(v11, "rankedNotificationsForMode:reply:", a3, v23);

    }
    else
    {
      __atxlog_handle_notification_management();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB2D98];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Missing entitlement for mode entity scoring.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 1, v21);

      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, MEMORY[0x1E0C9AA60], v22);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("No reply handler provided for %@ in %@"), v15, v17);

  }
}

void __62__ATXModeEntityScorerClient_rankedNotificationsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __62__ATXModeEntityScorerClient_rankedNotificationsForMode_reply___block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  NSXPCConnection *xpcConnection;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  SEL v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v9 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __69__ATXModeEntityScorerClient_rankedAppsForNotificationsForMode_reply___block_invoke;
      v25[3] = &unk_1E4D57A00;
      v27 = a2;
      v25[4] = self;
      v10 = v7;
      v26 = v10;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __69__ATXModeEntityScorerClient_rankedAppsForNotificationsForMode_reply___block_invoke_75;
      v23[3] = &unk_1E4D57208;
      v24 = v10;
      objc_msgSend(v11, "rankedAppsForNotificationsForMode:reply:", a3, v23);

    }
    else
    {
      __atxlog_handle_notification_management();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB2D98];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Missing entitlement for mode entity scoring.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 1, v21);

      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, MEMORY[0x1E0C9AA60], v22);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("No reply handler provided for %@ in %@"), v15, v17);

  }
}

void __69__ATXModeEntityScorerClient_rankedAppsForNotificationsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __69__ATXModeEntityScorerClient_rankedAppsForNotificationsForMode_reply___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  NSXPCConnection *xpcConnection;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  SEL v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v9 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __73__ATXModeEntityScorerClient_rankedContactsForNotificationsForMode_reply___block_invoke;
      v25[3] = &unk_1E4D57A00;
      v27 = a2;
      v25[4] = self;
      v10 = v7;
      v26 = v10;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __73__ATXModeEntityScorerClient_rankedContactsForNotificationsForMode_reply___block_invoke_76;
      v23[3] = &unk_1E4D57208;
      v24 = v10;
      objc_msgSend(v11, "rankedContactsForNotificationsForMode:reply:", a3, v23);

    }
    else
    {
      __atxlog_handle_notification_management();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB2D98];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Missing entitlement for mode entity scoring.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 1, v21);

      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, MEMORY[0x1E0C9AA60], v22);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("No reply handler provided for %@ in %@"), v15, v17);

  }
}

void __73__ATXModeEntityScorerClient_rankedContactsForNotificationsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73__ATXModeEntityScorerClient_rankedContactsForNotificationsForMode_reply___block_invoke_76(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9;
  id v10;
  NSXPCConnection *xpcConnection;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v12 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __61__ATXModeEntityScorerClient_scoreAppsForDenyList_mode_reply___block_invoke;
      v27[3] = &unk_1E4D58D78;
      v27[4] = self;
      v27[5] = a2;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __61__ATXModeEntityScorerClient_scoreAppsForDenyList_mode_reply___block_invoke_79;
      v25[3] = &unk_1E4D57208;
      v26 = v10;
      objc_msgSend(v13, "scoreAppsForDenyList:mode:reply:", v9, a4, v25);

    }
    else
    {
      __atxlog_handle_notification_management();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0CB2D98];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Missing entitlement for mode entity scoring of apps for the deny list.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 1, v23);

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v24);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No reply handler provided for %@ in %@"), v17, v19);

  }
}

void __61__ATXModeEntityScorerClient_scoreAppsForDenyList_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();

}

uint64_t __61__ATXModeEntityScorerClient_scoreAppsForDenyList_mode_reply___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  NSXPCConnection *xpcConnection;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  SEL v25;
  _QWORD v26[5];
  id v27;
  SEL v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v9 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __64__ATXModeEntityScorerClient_rankedAppsForDenyListForMode_reply___block_invoke;
      v26[3] = &unk_1E4D57A00;
      v28 = a2;
      v26[4] = self;
      v10 = v7;
      v27 = v10;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __64__ATXModeEntityScorerClient_rankedAppsForDenyListForMode_reply___block_invoke_80;
      v23[3] = &unk_1E4D58DA0;
      v25 = a2;
      v24 = v10;
      objc_msgSend(v11, "rankedAppsForDenyListForMode:reply:", a3, v23);

    }
    else
    {
      __atxlog_handle_notification_management();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB2D98];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("Missing entitlement for mode entity scoring of apps for the deny list.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 1, v21);

      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, MEMORY[0x1E0C9AA60], v22);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("No reply handler provided for %@ in %@"), v15, v17);

  }
}

void __64__ATXModeEntityScorerClient_rankedAppsForDenyListForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__ATXModeEntityScorerClient_rankedAppsForDenyListForMode_reply___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with apps:%@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9;
  id v10;
  NSXPCConnection *xpcConnection;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v12 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __65__ATXModeEntityScorerClient_scoreContactsForDenyList_mode_reply___block_invoke;
      v27[3] = &unk_1E4D58D78;
      v27[4] = self;
      v27[5] = a2;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __65__ATXModeEntityScorerClient_scoreContactsForDenyList_mode_reply___block_invoke_83;
      v25[3] = &unk_1E4D57208;
      v26 = v10;
      objc_msgSend(v13, "scoreContactsForDenyList:mode:reply:", v9, a4, v25);

    }
    else
    {
      __atxlog_handle_notification_management();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0CB2D98];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Missing entitlement for mode entity scoring of contacts for the deny list.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 1, v23);

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v24);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No reply handler provided for %@ in %@"), v17, v19);

  }
}

void __65__ATXModeEntityScorerClient_scoreContactsForDenyList_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();

}

uint64_t __65__ATXModeEntityScorerClient_scoreContactsForDenyList_mode_reply___block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  -[ATXModeEntityScorerClient rankedContactsForDenyListForMode:options:reply:](self, "rankedContactsForDenyListForMode:options:reply:", a3, 0, a4);
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v9;
  NSXPCConnection *xpcConnection;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  SEL v27;
  _QWORD v28[5];
  id v29;
  SEL v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (v9)
  {
    if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.ModeEntityScorer"), 0) & 1) != 0)
    {
      xpcConnection = self->_xpcConnection;
      v11 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __76__ATXModeEntityScorerClient_rankedContactsForDenyListForMode_options_reply___block_invoke;
      v28[3] = &unk_1E4D57A00;
      v30 = a2;
      v28[4] = self;
      v12 = v9;
      v29 = v12;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v11;
      v25[1] = 3221225472;
      v25[2] = __76__ATXModeEntityScorerClient_rankedContactsForDenyListForMode_options_reply___block_invoke_84;
      v25[3] = &unk_1E4D58DA0;
      v27 = a2;
      v26 = v12;
      objc_msgSend(v13, "rankedContactsForDenyListForMode:options:reply:", a3, a4, v25);

    }
    else
    {
      __atxlog_handle_notification_management();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.2();

      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0CB2D98];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("Missing entitlement for mode entity scoring of contacts for the deny list.  Not calling XPC service.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 1, v23);

      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, MEMORY[0x1E0C9AA60], v24);
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No reply handler provided for %@ in %@"), v17, v19);

  }
}

void __76__ATXModeEntityScorerClient_rankedContactsForDenyListForMode_options_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __76__ATXModeEntityScorerClient_rankedContactsForDenyListForMode_options_reply___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with contacts:%@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5 reply:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSXPCConnection *xpcConnection;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  SEL v29;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    xpcConnection = self->_xpcConnection;
    v16 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __125__ATXModeEntityScorerClient_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply___block_invoke;
    v27[3] = &unk_1E4D57A00;
    v29 = a2;
    v27[4] = self;
    v17 = v13;
    v28 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __125__ATXModeEntityScorerClient_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply___block_invoke_85;
    v25[3] = &unk_1E4D58DC8;
    v26 = v17;
    objc_msgSend(v18, "modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:reply:", v11, v12, a5, v25);

  }
  else
  {
    __atxlog_handle_notification_management();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "raise:format:", v21, CFSTR("No reply handler provided for %@ in %@"), v22, v24);

  }
}

void __125__ATXModeEntityScorerClient_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __125__ATXModeEntityScorerClient_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply___block_invoke_85(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)assignModeEntityScores:(unint64_t)a3 entityTypeIdentifier:(id)a4 entityIdentifier:(id)a5 score:(double)a6 modeConfigurationType:(int64_t)a7 reply:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  NSXPCConnection *xpcConnection;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  id v32;
  SEL v33;

  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = v17;
  if (v17)
  {
    xpcConnection = self->_xpcConnection;
    v20 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __124__ATXModeEntityScorerClient_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType_reply___block_invoke;
    v31[3] = &unk_1E4D57A00;
    v33 = a2;
    v31[4] = self;
    v21 = v17;
    v32 = v21;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __124__ATXModeEntityScorerClient_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType_reply___block_invoke_87;
    v29[3] = &unk_1E4D58DF0;
    v30 = v21;
    objc_msgSend(v22, "assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:", a3, v15, v16, a7, v29, a6);

  }
  else
  {
    __atxlog_handle_notification_management();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:].cold.1();

    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "raise:format:", v25, CFSTR("No reply handler provided for %@ in %@"), v26, v28);

  }
}

void __124__ATXModeEntityScorerClient_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __124__ATXModeEntityScorerClient_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType_reply___block_invoke_87(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __33__ATXModeEntityScorerClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXModeEntityScorer interruption handler called", v1, 2u);
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

  OUTLINED_FUNCTION_9();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v4, v5, "No reply handler provided for %@ in %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_0();
}

- (void)scoreContacts:mode:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const __CFString *v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7_1();
  v3 = CFSTR("com.apple.ModeEntityScorer");
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v0, v1, "Not attempting XPC service call on connection %@ without entitlement %@", v2);
  OUTLINED_FUNCTION_2();
}

void __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  const char *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_8();
  v2 = (const char *)OUTLINED_FUNCTION_15(v1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)OUTLINED_FUNCTION_6_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_1A49EF000, v5, v6, "%@ in %@ xpc error:%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_5();
}

@end
