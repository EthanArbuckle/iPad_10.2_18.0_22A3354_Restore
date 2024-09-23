@implementation MOPromptManager

+ (id)defaultManager
{
  if (defaultManager_onceToken_0 != -1)
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_8);
  return (id)defaultManager_promptManager;
}

void __33__MOPromptManager_defaultManager__block_invoke()
{
  MOPromptManager *v0;
  void *v1;

  v0 = objc_alloc_init(MOPromptManager);
  v1 = (void *)defaultManager_promptManager;
  defaultManager_promptManager = (uint64_t)v0;

}

- (MOPromptManager)init
{
  MOPromptManager *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOPromptManager;
  v2 = -[MOPromptManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    -[MOPromptManager _initForSoftLinkwithMOEventClass:moEventBundleClass:moXpcContext:](v2, "_initForSoftLinkwithMOEventClass:moEventBundleClass:moXpcContext:", v3, v4, objc_opt_class());
  }
  return v2;
}

- (id)initForSoftLinkwithMOEventClass:(Class)a3 moEventBundleClass:(Class)a4
{
  MOPromptManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOPromptManager;
  v6 = -[MOPromptManager init](&v8, sel_init);
  if (v6)
    -[MOPromptManager _initForSoftLinkwithMOEventClass:moEventBundleClass:moXpcContext:](v6, "_initForSoftLinkwithMOEventClass:moEventBundleClass:moXpcContext:", a3, a4, objc_opt_class());
  return v6;
}

- (void)_initForSoftLinkwithMOEventClass:(Class)a3 moEventBundleClass:(Class)a4 moXpcContext:(Class)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSXPCConnection *v50;
  NSXPCConnection *connection;
  MOPromptManagerXPCProtocol *v52;
  MOPromptManagerXPCProtocol *proxy;
  MOConnection *v54;
  MOConnection *connectionProxy;
  void *v56;
  void *v57;
  NSObject *v58;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF99CD88);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF997EB0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_scheduleDatabaseUpgradeWithContext_andDelegate_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_scheduleDatabaseUpgradeWithContext_andDelegate_, 0, 0);

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, a5, a3, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_storeEvents_withContext_andHandler_, 0, 0);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, a5, a3, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_fetchEventsWithOptions_withContext_andHandler_, 0, 1);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, a5, a4, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_fetchEventBundlesWithOptions_withContext_andHandler_, 0, 1);

  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, a5, a4, v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_printEvergreenBundlesWithSeed_handler_, 0, 1);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, a5, a3, v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler_, 0, 1);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, a5, a3, v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler_, 0, 0);

  v35 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, v37, v38, v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply_, 0, 0);

  v41 = (void *)MEMORY[0x1E0C99E60];
  v42 = objc_opt_class();
  objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_getDiagnosticReporterConfiguration_, 0, 0);

  v44 = (void *)MEMORY[0x1E0C99E60];
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, v46, v47, v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_getMomentsNotificationsSchedule_, 0, 1);

  v50 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.momentsd"), 0);
  connection = self->connection;
  self->connection = v50;

  -[NSXPCConnection setInvalidationHandler:](self->connection, "setInvalidationHandler:", &__block_literal_global_150);
  -[NSXPCConnection setRemoteObjectInterface:](self->connection, "setRemoteObjectInterface:", v8);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_153);
  v52 = (MOPromptManagerXPCProtocol *)objc_claimAutoreleasedReturnValue();
  proxy = self->proxy;
  self->proxy = v52;

  v54 = -[MOConnection initWithName:]([MOConnection alloc], "initWithName:", CFSTR("MOPromptManager"));
  connectionProxy = self->connectionProxy;
  self->connectionProxy = v54;

  -[MOConnection onConnectionInterrupted](self->connectionProxy, "onConnectionInterrupted");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setInterruptionHandler:](self->connection, "setInterruptionHandler:", v56);

  -[NSXPCConnection resume](self->connection, "resume");
  +[MODiagnosticReporter defaultReporter](MODiagnosticReporter, "defaultReporter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "configureWithPromptManager:", self);

  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v58, OS_LOG_TYPE_DEFAULT, "initiate client", buf, 2u);
  }

}

void __84__MOPromptManager__initForSoftLinkwithMOEventClass_moEventBundleClass_moXpcContext___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CAE42000, v0, OS_LOG_TYPE_DEFAULT, "Invalidated", v1, 2u);
  }

}

void __84__MOPromptManager__initForSoftLinkwithMOEventClass_moEventBundleClass_moXpcContext___block_invoke_151(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = CFSTR("Error on remote object proxy");
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1CAE42000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MOPromptManager;
  -[MOPromptManager dealloc](&v3, sel_dealloc);
}

- (id)context
{
  return objc_alloc_init(MOXPCContext);
}

- (BOOL)scheduleDatabaseUpgradeWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  MOConnection *connectionProxy;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling scheduleDatabaseUpgradeWithHandler", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke;
  v12[3] = &unk_1E8543570;
  v12[4] = self;
  v13 = v4;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke_165;
  v10[3] = &unk_1E8541C00;
  v11 = v13;
  v8 = v13;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v12, v10);

  return 1;
}

void __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MODatabaseUpgradeCompletionDelegate *v4;
  id v5;
  MODatabaseUpgradeCompletionDelegate *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, unint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = [MODatabaseUpgradeCompletionDelegate alloc];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke_2;
  v13 = &unk_1E8543548;
  v14 = *(id *)(a1 + 40);
  v15 = v3;
  v5 = v3;
  v6 = -[MODatabaseUpgradeCompletionDelegate initWithHandler:](v4, "initWithHandler:", &v10);
  v7 = *(_QWORD **)(a1 + 32);
  v8 = (void *)v7[2];
  objc_msgSend(v7, "context", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheduleDatabaseUpgradeWithContext:andDelegate:", v9, v6);

}

void __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1CAE42000, v6, OS_LOG_TYPE_DEFAULT, "calling back from scheduleDatabaseUpgradeWithContext with status %@", (uint8_t *)&v11, 0xCu);

  }
  if (a2 <= 4)
  {
    if (a2 == 2)
    {
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, 2, v5);
    }
    else
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
      {
        v8 = *(_QWORD *)(a1 + 32);
        if (v8)
          (*(void (**)(uint64_t, unint64_t, id))(v8 + 16))(v8, a2, v5);
      }
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1CAE42000, v9, OS_LOG_TYPE_DEFAULT, "calling scheduleDatabaseUpgradeWithContext completed", (uint8_t *)&v11, 2u);
      }

    }
  }

}

uint64_t __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke_165(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (BOOL)storeEvents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOConnection *connectionProxy;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling storeEvents", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__MOPromptManager_storeEvents_handler___block_invoke;
  v16[3] = &unk_1E85435C0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __39__MOPromptManager_storeEvents_handler___block_invoke_166;
  v14[3] = &unk_1E8541C00;
  v15 = v18;
  v11 = v18;
  v12 = v6;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v16, v14);

  return 1;
}

void __39__MOPromptManager_storeEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__MOPromptManager_storeEvents_handler___block_invoke_2;
  v9[3] = &unk_1E8543598;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v8 = v3;
  objc_msgSend(v6, "storeEvents:withContext:andHandler:", v5, v7, v9);

}

void __39__MOPromptManager_storeEvents_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling storeEvents completed", v6, 2u);
  }

}

uint64_t __39__MOPromptManager_storeEvents_handler___block_invoke_166(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)fetchEventsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOConnection *connectionProxy;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling fetchEventsWithOption", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke;
  v16[3] = &unk_1E85435C0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke_168;
  v14[3] = &unk_1E8541C00;
  v15 = v18;
  v11 = v18;
  v12 = v6;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v16, v14);

  return 1;
}

void __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke_2;
  v9[3] = &unk_1E85435E8;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v8 = v3;
  objc_msgSend(v6, "fetchEventsWithOptions:withContext:andHandler:", v5, v7, v9);

}

void __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling fetchEventsWithOption completed", v9, 2u);
  }

}

uint64_t __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke_168(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (BOOL)setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents:(id)a3 defaultURL:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  MOConnection *connectionProxy;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "calling setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "infoDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("CFBundleIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  connectionProxy = self->connectionProxy;
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke;
  v25[3] = &unk_1E8543610;
  v25[4] = self;
  v26 = v14;
  v27 = v8;
  v28 = v9;
  v29 = v10;
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke_172;
  v23[3] = &unk_1E8541C00;
  v24 = v29;
  v17 = v29;
  v18 = v9;
  v19 = v8;
  v20 = v14;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v25, v23);
  if (self->connectionProxy)
    v21 = self->proxy != 0;
  else
    v21 = 0;

  return v21;
}

void __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)v4[2];
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke_2;
  v11[3] = &unk_1E8543598;
  v12 = v3;
  v13 = *(id *)(a1 + 64);
  v10 = v3;
  objc_msgSend(v6, "setupPeriodicTimeToWriteMomentsNotificationsForApplication:usingDateComponents:withActionURL:withContext:andHandler:", v5, v7, v8, v9, v11);

}

void __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents completed", v6, 2u);
  }

}

uint64_t __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke_172(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)getTimeToWriteNotificationsScheduleWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling getTimeToWriteNotificationsScheduleWithHandler:", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke;
  v12[3] = &unk_1E8541BD8;
  v12[4] = self;
  v13 = v4;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke_174;
  v10[3] = &unk_1E8541C00;
  v11 = v13;
  v8 = v13;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v12, v10);

  return 1;
}

void __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke_2;
  v8[3] = &unk_1E8543638;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v5, "getTimeToWriteNotificationsApplicationScheduleWithContext:andHandler:", v6, v8);

}

void __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id, id, id))(v10 + 16))(v10, v7, v8, v9);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "calling getTimeToWriteNotificationsScheduleWithHandler: completed", v12, 2u);
  }

}

uint64_t __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke_174(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

- (BOOL)setupMomentsNotificationsWithSchedule:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  MOConnection *connectionProxy;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "calling setupMomentsNotificationsWithSchedule:", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke;
  v20[3] = &unk_1E8543660;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_175;
  v18[3] = &unk_1E8541C00;
  v19 = v23;
  v14 = v23;
  v15 = v9;
  v16 = v8;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v20, v18);

  return 1;
}

void __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_2;
  v8[3] = &unk_1E8543598;
  v9 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v5, "setupMomentsNotificationsWithSchedule:options:handler:", v4, v6, v8);

}

void __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling setupMomentsNotificationsWithSchedule: completed", v6, 2u);
  }

}

uint64_t __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_175(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)getMomentsNotificationsSchedule:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling getMomentsNotificationsSchedule:", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke;
  v12[3] = &unk_1E8541BD8;
  v12[4] = self;
  v13 = v4;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke_177;
  v10[3] = &unk_1E8541C00;
  v11 = v13;
  v8 = v13;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v12, v10);

  return 1;
}

void __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke_2;
  v7[3] = &unk_1E8543688;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "getMomentsNotificationsSchedule:", v7);

}

void __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id, id, id))(v10 + 16))(v10, v7, v8, v9);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "calling getMomentsNotificationsSchedule: completed", v12, 2u);
  }

}

uint64_t __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke_177(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

- (BOOL)fetchEventBundlesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOConnection *connectionProxy;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke;
  v16[3] = &unk_1E85435C0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke_178;
  v14[3] = &unk_1E8541C00;
  v15 = v18;
  v11 = v18;
  v12 = v6;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v16, v14);

  return 1;
}

void __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke_2;
  v11[3] = &unk_1E85436B0;
  v14 = v3;
  v15 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v10 = v3;
  objc_msgSend(v6, "fetchEventBundlesWithOptions:withContext:andHandler:", v5, v7, v11);

}

void __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))() && *(_QWORD *)(a1 + 56))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "skipLocalization") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "buildLabelsForEventBundles:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption completed found %@ events", (uint8_t *)&v9, 0xCu);

  }
}

uint64_t __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke_178(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)localizeEventBundles:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling localizeEventBundlesForReplayWithOptions", v6, 2u);
  }

  -[MOPromptManager buildLabelsForEventBundles:](self, "buildLabelsForEventBundles:", v4);
}

- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 respectOnboardingDates:(BOOL)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  MOConnection *connectionProxy;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  MOPromptManager *v30;
  id v31;
  id v32;
  BOOL v33;
  BOOL v34;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v18, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption with source type & onboarding filtering", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v20 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke;
  v27[3] = &unk_1E8543700;
  v33 = a5;
  v28 = v15;
  v29 = v16;
  v30 = self;
  v31 = v14;
  v32 = v17;
  v34 = a7;
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke_181;
  v25[3] = &unk_1E8541C00;
  v26 = v32;
  v21 = v32;
  v22 = v14;
  v23 = v16;
  v24 = v15;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v27, v25);

}

void __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MOEventBundleFetchOptions *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;

  v3 = a2;
  v4 = -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:]([MOEventBundleFetchOptions alloc], "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:", 0, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), 0, 0);
  v5 = *(_QWORD **)(a1 + 48);
  v6 = (void *)v5[2];
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke_2;
  v11[3] = &unk_1E85436D8;
  v14 = v3;
  v15 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  v16 = *(_BYTE *)(a1 + 73);
  v9 = *(_QWORD *)(a1 + 48);
  v12 = v8;
  v13 = v9;
  v10 = v3;
  objc_msgSend(v6, "fetchEventBundlesWithOptions:withContext:andHandler:", v4, v7, v11);

}

void __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))() && *(_QWORD *)(a1 + 56))
  {
    +[MOEventBundleProcessor trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:](MOEventBundleProcessor, "trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:", v5, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "buildLabelsForEventBundles:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption completed found %@ eventBundles", (uint8_t *)&v10, 0xCu);

  }
}

uint64_t __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke_181(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 respectOnboardingDates:(BOOL)a4 handler:(id)a5
{
  -[MOPromptManager fetchEventBundlesWithAllowedSourceTypes:dateInterval:ascending:limit:respectOnboardingDates:handler:](self, "fetchEventBundlesWithAllowedSourceTypes:dateInterval:ascending:limit:respectOnboardingDates:handler:", a3, 0, 0, 0, a4, a5);
}

- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 respectOnboardingDates:(BOOL)a7 respectLearnFromThisApp:(BOOL)a8 handler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  MOConnection *connectionProxy;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  MOPromptManager *v31;
  id v32;
  id v33;
  BOOL v34;
  BOOL v35;
  BOOL v36;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v19, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption with source type & onboarding filtering", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v21 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke;
  v28[3] = &unk_1E8543750;
  v34 = a5;
  v29 = v16;
  v30 = v17;
  v31 = self;
  v32 = v15;
  v33 = v18;
  v35 = a7;
  v36 = a8;
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke_183;
  v26[3] = &unk_1E8541C00;
  v27 = v33;
  v22 = v33;
  v23 = v15;
  v24 = v17;
  v25 = v16;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v28, v26);

}

void __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MOEventBundleFetchOptions *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  __int16 v16;

  v3 = a2;
  v4 = -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:]([MOEventBundleFetchOptions alloc], "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:", 0, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), 0, 0);
  v5 = *(_QWORD **)(a1 + 48);
  v6 = (void *)v5[2];
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke_2;
  v11[3] = &unk_1E8543728;
  v14 = v3;
  v15 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  v16 = *(_WORD *)(a1 + 73);
  v9 = *(_QWORD *)(a1 + 48);
  v12 = v8;
  v13 = v9;
  v10 = v3;
  objc_msgSend(v6, "fetchEventBundlesWithOptions:withContext:andHandler:", v4, v7, v11);

}

void __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  MOEventBundleProcessorResult *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))() && *(_QWORD *)(a1 + 56))
  {
    +[MOEventBundleProcessor trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:](MOEventBundleProcessor, "trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:", v5, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 65))
    {
      +[MOEventBundleProcessor approvedForLearnFromThisApp:](MOEventBundleProcessor, "approvedForLearnFromThisApp:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = [MOEventBundleProcessorResult alloc];
      v10 = (void *)objc_opt_new();
      v11 = (void *)objc_opt_new();
      v8 = -[MOEventBundleProcessorResult init:sourceAppBundleIds:removedAppBundleIds:](v9, "init:sourceAppBundleIds:removedAppBundleIds:", v7, v10, v11);

    }
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v8, "processedBundles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "buildLabelsForEventBundles:", v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v15;
    _os_log_impl(&dword_1CAE42000, v14, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption completed found %@ eventBundles", (uint8_t *)&v16, 0xCu);

  }
}

uint64_t __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke_183(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 respectOnboardingDates:(BOOL)a4 respectLearnFromThisApp:(BOOL)a5 handler:(id)a6
{
  -[MOPromptManager fetchEventBundlesWithAllowedSourceTypes:dateInterval:ascending:limit:respectOnboardingDates:respectLearnFromThisApp:handler:](self, "fetchEventBundlesWithAllowedSourceTypes:dateInterval:ascending:limit:respectOnboardingDates:respectLearnFromThisApp:handler:", a3, 0, 0, 0, a4, a5, a6);
}

- (BOOL)clearEvents
{
  return -[MOPromptManager clearEventsWithHandler:](self, "clearEventsWithHandler:", &__block_literal_global_184);
}

- (BOOL)collectEvents
{
  return -[MOPromptManager collectEventsWithHandler:](self, "collectEventsWithHandler:", &__block_literal_global_185);
}

- (BOOL)bundleEvents
{
  return -[MOPromptManager bundleEventsWithHandler:](self, "bundleEventsWithHandler:", &__block_literal_global_186);
}

- (BOOL)purgeEvents
{
  return -[MOPromptManager purgeEventsWithHandler:](self, "purgeEventsWithHandler:", &__block_literal_global_187);
}

- (BOOL)runAnalytics
{
  return -[MOPromptManager runAnalyticsWithHandler:](self, "runAnalyticsWithHandler:", &__block_literal_global_188);
}

- (BOOL)clearEventsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling clearEventsWithContext", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke;
  v12[3] = &unk_1E8541BD8;
  v12[4] = self;
  v13 = v4;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_192;
  v10[3] = &unk_1E8541C00;
  v11 = v13;
  v8 = v13;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v12, v10);

  return 1;
}

void __42__MOPromptManager_clearEventsWithHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_2;
  v6[3] = &unk_1E8543818;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v3, "clearEventsWithContext:andRefreshVariant:andHandler:", v4, 0xFFFFLL, v6);

}

void __42__MOPromptManager_clearEventsWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v2, OS_LOG_TYPE_DEFAULT, "calling purgeEventsWithContext", buf, 2u);
  }

  v3 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 24);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_189;
  v10[3] = &unk_1E8541BD8;
  v10[4] = v4;
  v11 = v5;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_191;
  v8[3] = &unk_1E8541C00;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "callBlock:onInterruption:", v10, v8);
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "calling clearEventsWithContext completed", buf, 2u);
  }

}

void __42__MOPromptManager_clearEventsWithHandler___block_invoke_189(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_2_190;
  v8[3] = &unk_1E8543598;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v5, "purgeEventsWithContext:andRefreshVariant:andHandler:", v6, 0xFFFFLL, v8);

}

void __42__MOPromptManager_clearEventsWithHandler___block_invoke_2_190(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling purgeEventsWithContext completed", v6, 2u);
  }

}

uint64_t __42__MOPromptManager_clearEventsWithHandler___block_invoke_191(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __42__MOPromptManager_clearEventsWithHandler___block_invoke_192(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)collectEventsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling collectEventsWithContext", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__MOPromptManager_collectEventsWithHandler___block_invoke;
  v12[3] = &unk_1E8541BD8;
  v12[4] = self;
  v13 = v4;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __44__MOPromptManager_collectEventsWithHandler___block_invoke_193;
  v10[3] = &unk_1E8541C00;
  v11 = v13;
  v8 = v13;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v12, v10);

  return 1;
}

void __44__MOPromptManager_collectEventsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__MOPromptManager_collectEventsWithHandler___block_invoke_2;
  v8[3] = &unk_1E8543598;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v5, "collectEventsWithContext:andRefreshVariant:andHandler:", v6, 768, v8);

}

void __44__MOPromptManager_collectEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling collectEventsWithContext completed", v6, 2u);
  }

}

uint64_t __44__MOPromptManager_collectEventsWithHandler___block_invoke_193(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)bundleEventsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling bundleEventsWithContext", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__MOPromptManager_bundleEventsWithHandler___block_invoke;
  v12[3] = &unk_1E8541BD8;
  v12[4] = self;
  v13 = v4;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __43__MOPromptManager_bundleEventsWithHandler___block_invoke_194;
  v10[3] = &unk_1E8541C00;
  v11 = v13;
  v8 = v13;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v12, v10);

  return 1;
}

void __43__MOPromptManager_bundleEventsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__MOPromptManager_bundleEventsWithHandler___block_invoke_2;
  v8[3] = &unk_1E8543598;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v5, "bundleEventsWithContext:andRefreshVariant:andHandler:", v6, 768, v8);

}

void __43__MOPromptManager_bundleEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling bundleEventsWithContext completed", v6, 2u);
  }

}

uint64_t __43__MOPromptManager_bundleEventsWithHandler___block_invoke_194(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)purgeEventsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling purgeEventsWithContext", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__MOPromptManager_purgeEventsWithHandler___block_invoke;
  v12[3] = &unk_1E8541BD8;
  v12[4] = self;
  v13 = v4;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __42__MOPromptManager_purgeEventsWithHandler___block_invoke_195;
  v10[3] = &unk_1E8541C00;
  v11 = v13;
  v8 = v13;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v12, v10);

  return 1;
}

void __42__MOPromptManager_purgeEventsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__MOPromptManager_purgeEventsWithHandler___block_invoke_2;
  v8[3] = &unk_1E8543598;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v5, "purgeEventsWithContext:andRefreshVariant:andHandler:", v6, 768, v8);

}

void __42__MOPromptManager_purgeEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling purgeEventsWithContext completed", v6, 2u);
  }

}

uint64_t __42__MOPromptManager_purgeEventsWithHandler___block_invoke_195(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)runAnalyticsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling runAnalyticsWithContext", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__MOPromptManager_runAnalyticsWithHandler___block_invoke;
  v12[3] = &unk_1E8541BD8;
  v12[4] = self;
  v13 = v4;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __43__MOPromptManager_runAnalyticsWithHandler___block_invoke_196;
  v10[3] = &unk_1E8541C00;
  v11 = v13;
  v8 = v13;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v12, v10);

  return 1;
}

void __43__MOPromptManager_runAnalyticsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__MOPromptManager_runAnalyticsWithHandler___block_invoke_2;
  v8[3] = &unk_1E8543598;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v5, "runAnalyticsWithContext:andRefreshVariant:andHandler:", v6, 768, v8);

}

void __43__MOPromptManager_runAnalyticsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling runAnalyticsWithContext completed", v6, 2u);
  }

}

uint64_t __43__MOPromptManager_runAnalyticsWithHandler___block_invoke_196(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)analyzeTrendsInEvents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOConnection *connectionProxy;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling analyzeTrendsInEvents", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke;
  v16[3] = &unk_1E85435C0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke_197;
  v14[3] = &unk_1E8541C00;
  v15 = v18;
  v11 = v18;
  v12 = v6;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v16, v14);

  return 1;
}

void __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke_2;
  v9[3] = &unk_1E85435E8;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v8 = v3;
  objc_msgSend(v6, "analyzeTrendsInEvents:withContext:andRefreshVariant:andHandler:", v5, v7, 768, v9);

}

void __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling analyzeTrendsInEvents compeleted", v9, 2u);
  }

}

uint64_t __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke_197(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (BOOL)refreshEventsWithHandler:(id)a3
{
  return -[MOPromptManager refreshEventsWithRefreshVariant:andHandler:](self, "refreshEventsWithRefreshVariant:andHandler:", 768, a3);
}

- (BOOL)refreshEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6;
  NSObject *v7;
  MOConnection *connectionProxy;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  uint8_t buf[16];

  v6 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "calling refreshEventsWithRefreshVariant", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke;
  v14[3] = &unk_1E8543840;
  v14[4] = self;
  v16 = a3;
  v15 = v6;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke_198;
  v12[3] = &unk_1E8541C00;
  v13 = v15;
  v10 = v15;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v14, v12);

  return 1;
}

void __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke_2;
  v9[3] = &unk_1E8543598;
  v10 = v3;
  v7 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v8 = v3;
  objc_msgSend(v5, "refreshEventsWithContext:andRefreshVariant:andHandler:", v6, v7, v9);

}

void __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling refreshEventsWithRefreshVariant completed", v6, 2u);
  }

}

uint64_t __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke_198(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)softRefreshEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6;
  NSObject *v7;
  MOConnection *connectionProxy;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  uint8_t buf[16];

  v6 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "calling softRefreshEventsWithRefreshVariant", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__MOPromptManager_softRefreshEventsWithRefreshVariant_andHandler___block_invoke;
  v14[3] = &unk_1E8543840;
  v14[4] = self;
  v16 = a3;
  v15 = v6;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __66__MOPromptManager_softRefreshEventsWithRefreshVariant_andHandler___block_invoke_199;
  v12[3] = &unk_1E8541C00;
  v13 = v15;
  v10 = v15;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v14, v12);

  return 1;
}

void __66__MOPromptManager_softRefreshEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__MOPromptManager_softRefreshEventsWithRefreshVariant_andHandler___block_invoke_2;
  v9[3] = &unk_1E8543598;
  v10 = v3;
  v7 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v8 = v3;
  objc_msgSend(v5, "softRefreshEventsWithContext:andRefreshVariant:andHandler:", v6, v7, v9);

}

void __66__MOPromptManager_softRefreshEventsWithRefreshVariant_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling softRefreshEventsWithRefreshVariant completed", v6, 2u);
  }

}

uint64_t __66__MOPromptManager_softRefreshEventsWithRefreshVariant_andHandler___block_invoke_199(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)uploadFeedbackWithDBStateToServer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOConnection *connectionProxy;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling dataDumpAndUploadWithFeedback", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke;
  v16[3] = &unk_1E85435C0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke_201;
  v14[3] = &unk_1E8541C00;
  v15 = v18;
  v11 = v18;
  v12 = v6;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v16, v14);

  return 1;
}

void __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke_2;
  v7[3] = &unk_1E8541BB0;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "checkElegibilityAndRequestDataExportForTrigger:withFeedback:requestUpload:reply:", 5, v4, 1, v7);

}

void __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CAE42000, v6, OS_LOG_TYPE_DEFAULT, "calling dataDumpAndUploadWithFeedback completed", v7, 2u);
  }

}

uint64_t __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke_201(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)buildLabelsForEventBundles:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  dispatch_once_t *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  dispatch_once_t *v35;
  void *v36;
  void *v37;
  void *context;
  uint64_t v39;
  id obj;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  MOEventBundleLabelFormatter *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1D1798EEC]();
  v46 = objc_alloc_init(MOEventBundleLabelFormatter);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v48;
    v7 = 0x1E8540000uLL;
    v8 = MOLogFacilityFramework;
    do
    {
      v9 = 0;
      v39 = v5;
      do
      {
        if (*(_QWORD *)v48 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v9);
        objc_msgSend(*(id *)(v7 + 3936), "buildMetaDataForEventBundle:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMetaData:", v11);

        objc_msgSend(v10, "metaData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        _mo_log_facility_get_os_log(v8);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "getBundleType");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v52 = (uint64_t)v15;
            v53 = 2112;
            v54 = v10;
            _os_log_impl(&dword_1CAE42000, v14, OS_LOG_TYPE_INFO, "build labels, bundleType, %@, event bundle, %@", buf, 0x16u);

          }
          _mo_log_facility_get_os_log(v8);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "metaData");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "allKeys");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v52 = (uint64_t)v18;
            _os_log_impl(&dword_1CAE42000, v16, OS_LOG_TYPE_INFO, "build labels, meta data, %@", buf, 0xCu);

          }
          objc_msgSend(v10, "metaData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "getBundleType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOEventBundleLabelFormatter formattedBundleLabelsForMetaData:bundleType:](v46, "formattedBundleLabelsForMetaData:bundleType:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setLabels:", v21);

          objc_msgSend(v10, "metaData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "getBundleType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOEventBundleLabelFormatter formattedBundlePromptsForMetaData:bundleType:](v46, "formattedBundlePromptsForMetaData:bundleType:", v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setPromptLanguages:", v24);

          objc_msgSend(v10, "labels");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v26)
          {
            objc_msgSend(v10, "labels");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "firstObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setPromptLanguage:", v28);

          }
          _mo_log_facility_get_os_log(v8);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "labels");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v45, "count");
            objc_msgSend(v10, "labels");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "firstObject");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "mask");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "promptLanguages");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v7;
            v31 = v6;
            v32 = objc_msgSend(v42, "count");
            objc_msgSend(v10, "promptLanguages");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "firstObject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "mask");
            v35 = v8;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            v52 = v41;
            v53 = 2112;
            v54 = v29;
            v55 = 2048;
            v56 = v32;
            v6 = v31;
            v7 = v30;
            v5 = v39;
            v57 = 2112;
            v58 = v36;
            _os_log_impl(&dword_1CAE42000, v14, OS_LOG_TYPE_INFO, "build labels, labels, %lu, label, %@, prompts, %lu, prompt, %@", buf, 0x2Au);

            v8 = v35;
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "getBundleType");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v52 = (uint64_t)v10;
          v53 = 2112;
          v54 = v37;
          _os_log_error_impl(&dword_1CAE42000, v14, OS_LOG_TYPE_ERROR, "build labels, nil meta data, event bundle, %@, bundleType, %@", buf, 0x16u);

        }
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(context);
}

- (void)printEvergreenBundlesWithSeed:(unint64_t)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  MOPromptManagerXPCProtocol *proxy;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "calling printEvergreenBundlesWithSeed:handler", buf, 2u);
  }

  proxy = self->proxy;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__MOPromptManager_printEvergreenBundlesWithSeed_handler___block_invoke;
  v10[3] = &unk_1E8543868;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[MOPromptManagerXPCProtocol printEvergreenBundlesWithSeed:handler:](proxy, "printEvergreenBundlesWithSeed:handler:", a3, v10);

}

void __57__MOPromptManager_printEvergreenBundlesWithSeed_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "calling printEvergreenBundlesWithSeed:handler completed", v8, 2u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "buildLabelsForEventBundles:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (BOOL)getDiagnosticReporterConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  MOPromptManagerXPCProtocol *proxy;
  id v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling getDiagnosticReporterConfiguration:handler", buf, 2u);
  }

  proxy = self->proxy;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__MOPromptManager_getDiagnosticReporterConfiguration___block_invoke;
  v9[3] = &unk_1E8543890;
  v10 = v4;
  v7 = v4;
  -[MOPromptManagerXPCProtocol getDiagnosticReporterConfiguration:](proxy, "getDiagnosticReporterConfiguration:", v9);

  return 1;
}

void __54__MOPromptManager_getDiagnosticReporterConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "calling getDiagnosticReporterConfiguration:handler completed", v9, 2u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)dumpDBStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling dataDumpWithFeedback", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__MOPromptManager_dumpDBStateWithHandler___block_invoke;
  v11[3] = &unk_1E8541BD8;
  v11[4] = self;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __42__MOPromptManager_dumpDBStateWithHandler___block_invoke_205;
  v9[3] = &unk_1E8541C00;
  v10 = v12;
  v8 = v12;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v11, v9);

}

void __42__MOPromptManager_dumpDBStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MOPromptManager_dumpDBStateWithHandler___block_invoke_2;
  v7[3] = &unk_1E8541BB0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "checkElegibilityAndRequestDataExportForTrigger:withFeedback:requestUpload:reply:", 1, 0, 0, v7);

}

void __42__MOPromptManager_dumpDBStateWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  MODataExportResults *v9;
  void *v10;
  void *v11;
  MODataExportResults *v12;
  uint64_t v13;
  uint8_t v14[16];

  v5 = a2;
  v6 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "calling dataDumpWithFeedback completed", v14, 2u);
  }

  if (v5
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kMODataDumpFilePath")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v9 = [MODataExportResults alloc];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kMODataDumpFilePath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kMODataDumpKVPairs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MODataExportResults initWithFilePath:kvPairs:](v9, "initWithFilePath:kvPairs:", v10, v11);

  }
  else
  {
    v12 = 0;
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, MODataExportResults *, id))(v13 + 16))(v13, v12, v6);
  }

}

uint64_t __42__MOPromptManager_dumpDBStateWithHandler___block_invoke_205(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)getSnapshotDictionaryForAnalyticsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling getSnapshotDictionaryForAnalyticsWithHandler", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke;
  v11[3] = &unk_1E8541BD8;
  v11[4] = self;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_206;
  v9[3] = &unk_1E8541C00;
  v10 = v12;
  v8 = v12;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v11, v9);

}

void __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_2;
  v7[3] = &unk_1E8541BB0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "getSnapshotDictionaryForAnalyticsWithHandler:", v7);

}

void __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "calling getSnapshotDictionaryForAnalyticsWithHandler completed", v8, 2u);
  }

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_206(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (BOOL)printSettingValue:(id)a3 withType:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  MOConnection *connectionProxy;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "calling printSettingValue", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__MOPromptManager_printSettingValue_withType_handler___block_invoke;
  v20[3] = &unk_1E8543660;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __54__MOPromptManager_printSettingValue_withType_handler___block_invoke_207;
  v18[3] = &unk_1E8541C00;
  v19 = v23;
  v14 = v23;
  v15 = v9;
  v16 = v8;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v20, v18);

  return 1;
}

void __54__MOPromptManager_printSettingValue_withType_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MOPromptManager_printSettingValue_withType_handler___block_invoke_2;
  v8[3] = &unk_1E8543598;
  v9 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v5, "printSettingValue:withType:handler:", v4, v6, v8);

}

void __54__MOPromptManager_printSettingValue_withType_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling printSettingValue completed", v6, 2u);
  }

}

uint64_t __54__MOPromptManager_printSettingValue_withType_handler___block_invoke_207(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)printOnboardingStatusAnalytics:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  MOConnection *connectionProxy;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling printOnboardingStatusAnalytics", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke;
  v11[3] = &unk_1E8541BD8;
  v11[4] = self;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke_208;
  v9[3] = &unk_1E8541C00;
  v10 = v12;
  v8 = v12;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v11, v9);

}

void __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke_2;
  v7[3] = &unk_1E8543598;
  v8 = v4;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "printOnboardingStatusAnalytics:", v7);

}

void __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v4, OS_LOG_TYPE_DEFAULT, "calling printOnboardingStatusAnalytics completed", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke_208(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)localizedStringForKey:(id)a3
{
  if (!a3)
    return 0;
  +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedString:(id)a3 withTable:(id)a4
{
  if (!a3)
    return 0;
  +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:withTable:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)testMomentsNotificationsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOConnection *connectionProxy;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling testMomentsNotifications", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke;
  v15[3] = &unk_1E85435C0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke_210;
  v13[3] = &unk_1E8541C00;
  v14 = v17;
  v11 = v17;
  v12 = v6;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v15, v13);

}

void __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke_2;
  v7[3] = &unk_1E8543598;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "testMomentsNotificationsWithOptions:handler:", v4, v7);

}

void __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling testMomentsNotifications completed", v6, 2u);
  }

}

uint64_t __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke_210(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)triggerFeedbackAssistantFlow:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOConnection *connectionProxy;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "calling triggerFeedbackAssistantFlow:%@", buf, 0xCu);
  }

  connectionProxy = self->connectionProxy;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke;
  v15[3] = &unk_1E85435C0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke_211;
  v13[3] = &unk_1E8541C00;
  v14 = v17;
  v11 = v17;
  v12 = v6;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v15, v13);

}

void __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke_2;
  v7[3] = &unk_1E8543598;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "triggerFeedbackAssistantFlow:handler:", v4, v7);

}

void __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "calling triggerFeedbackAssistantFlow completed", v6, 2u);
  }

}

uint64_t __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke_211(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connectionProxy, 0);
  objc_storeStrong((id *)&self->proxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

@end
