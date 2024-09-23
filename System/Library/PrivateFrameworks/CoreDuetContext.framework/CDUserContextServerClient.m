@implementation CDUserContextServerClient

void __52___CDUserContextServerClient__valueForPath_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;

  +[_CDDevice localDevice](_CDDevice, "localDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    +[_CDContextMonitorManager activateMonitorForKeyPath:](_CDContextMonitorManager, "activateMonitorForKeyPath:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "propertiesForContextualKeyPath:", *(_QWORD *)(a1 + 32));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_valueForRemotePath:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
}

void __56___CDUserContextServerClient__propertiesOfPath_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "value");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastModifiedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __47___CDUserContextServerClient_registerCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;

  v4 = a3;
  v7 = (id)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "performRegistrationCallbackWithRegistration:info:", v6, v4);

}

void __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_130);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_131;
  v6[3] = &unk_1E26D5288;
  v6[4] = &v7;
  objc_msgSend(v2, "handleContextualChange:info:handler:", v3, v4, v6);

  if (*(_QWORD *)(a1 + 40) && *((_BYTE *)v8 + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "persistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteRegistration:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "deregisterCallback:", *(_QWORD *)(a1 + 40));
  }
  _Block_object_dispose(&v7, 8);
}

void __45___CDUserContextServerClient_serverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0D45F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverInterface_serverInterface_0;
  serverInterface_serverInterface_0 = v0;

  v33 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v32, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)serverInterface_serverInterface_0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_addObjects_andRemoveObjects_forArrayAtPath_handler_, 0, 0);
  objc_msgSend((id)serverInterface_serverInterface_0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_addObjects_andRemoveObjects_forArrayAtPath_handler_, 1, 0);
  objc_msgSend((id)serverInterface_serverInterface_0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeObjectsMatchingPredicate_fromArrayAtPath_handler_, 0, 0);
  objc_msgSend((id)serverInterface_serverInterface_0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeObjectsMatchingPredicate_fromArrayAtPath_handler_, 1, 0);
  objc_msgSend((id)serverInterface_serverInterface_0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_removeObjectsMatchingPredicate_fromArrayAtPath_handler_, 0, 1);
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)serverInterface_serverInterface_0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_activateDevices_remoteUserContextProxySourceDeviceUUID_, 0, 0);
  objc_msgSend((id)serverInterface_serverInterface_0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_deactivateDevices_remoteUserContextProxySourceDeviceUUID_, 0, 0);
  v19 = (void *)serverInterface_serverInterface_0;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_setObject_forPath_handler_, 0, 0);

  objc_msgSend((id)serverInterface_serverInterface_0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setObject_forPath_handler_, 1, 0);
  v21 = (void *)serverInterface_serverInterface_0;
  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_valuesForPaths_handler_, 0, 0);

  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v27);

  objc_msgSend((id)serverInterface_serverInterface_0, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_valuesForPaths_handler_, 0, 1);
  v28 = (void *)serverInterface_serverInterface_0;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_setObject_lastModifiedDate_forContextualKeyPath_handler_, 0, 0);

  objc_msgSend((id)serverInterface_serverInterface_0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setObject_lastModifiedDate_forContextualKeyPath_handler_, 1, 0);
  objc_msgSend((id)serverInterface_serverInterface_0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setObject_lastModifiedDate_forContextualKeyPath_handler_, 2, 0);
  objc_msgSend((id)serverInterface_serverInterface_0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_propertiesOfPath_handler_, 0, 0);
  v30 = (void *)serverInterface_serverInterface_0;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_propertiesOfPath_handler_, 0, 1);

  objc_msgSend((id)serverInterface_serverInterface_0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_propertiesOfPath_handler_, 1, 1);
}

void __45___CDUserContextServerClient_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0D37D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface_clientInterface_0;
  clientInterface_clientInterface_0 = v0;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v4);

  objc_msgSend((id)clientInterface_clientInterface_0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleContextualChange_info_handler_, 0, 0);
  objc_msgSend((id)clientInterface_clientInterface_0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_handleContextualChange_info_handler_, 1, 0);
  objc_msgSend((id)clientInterface_clientInterface_0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleRegistrationCompleted_handler_, 0, 0);

}

void __71___CDUserContextServerClient_initForService_withConnection_andContext___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __71___CDUserContextServerClient_initForService_withConnection_andContext___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5 && WeakRetained)
  {
    objc_msgSend(v5, "deregisterAllCallbacks:", 0);
    objc_msgSend(v6, "wakingRegistrations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v6, "wakingRegistrations", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(WeakRetained, "addOpenRegistration:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    objc_sync_exit(v7);
    objc_msgSend(WeakRetained, "clientWasInterrupted:", v6);
  }

}

uint64_t __57___CDUserContextServerClient_hasKnowledgeOfPath_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hasKnowledgeOfPath:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __58___CDUserContextServerClient__hasKnowledgeOfPath_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  +[_CDDevice localDevice](_CDDevice, "localDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    +[_CDContextMonitorManager activateMonitorForKeyPath:](_CDContextMonitorManager, "activateMonitorForKeyPath:", *(_QWORD *)(a1 + 32));
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "hasKnowledgeOfContextualKeyPath:", *(_QWORD *)(a1 + 32)));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58___CDUserContextServerClient__hasKnowledgeOfPath_handler___block_invoke_2;
    v8[3] = &unk_1E26D5688;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "_valueForRemotePath:handler:", v7, v8);

  }
}

uint64_t __58___CDUserContextServerClient__hasKnowledgeOfPath_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

uint64_t __55___CDUserContextServerClient_propertiesOfPath_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_propertiesOfPath:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __61___CDUserContextServerClient_propertiesOfRemotePath_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_propertiesOfRemotePath:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __62___CDUserContextServerClient__propertiesOfRemotePath_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "value");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastModifiedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  v8[2] = __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2;
  v8[3] = &unk_1E26D4BF0;
  v8[1] = 3221225472;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

void __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2_cold_2(v2, v3, v4);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "propertiesForContextualKeyPath:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2_cold_1((void **)(a1 + 48), v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_120_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_121;
  v5[3] = &unk_1E26D5768;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "handleContextualChange:info:handler:", v3, v4, v5);

}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2_cold_1();

}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_121(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  char v12;
  _QWORD block[4];
  id v14;
  id v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2_122;
  v10[3] = &unk_1E26D5740;
  v12 = a2;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v7 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_1E26D4F60;
  v14 = v7;
  v15 = v8;
  v9 = v7;
  dispatch_async(v4, block);

}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2_122(uint64_t a1)
{
  int v2;
  id *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "registerCallback:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v3[3], "persistence");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteRegistration:", *(_QWORD *)(a1 + 40));

  }
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        +[_CDContextMonitorManager activateMonitorForKeyPath:](_CDContextMonitorManager, "activateMonitorForKeyPath:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "persistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveRegistration:", *(_QWORD *)(a1 + 32));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "persistence");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "propertiesForContextualKeyPath:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "saveValue:forKeyPath:", v18, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "registerCallback:", *(_QWORD *)(a1 + 32));
  v19 = *(void **)(a1 + 32);
  v20 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __47___CDUserContextServerClient_registerCallback___block_invoke_3;
  v23[3] = &unk_1E26D5220;
  v24 = v19;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(*v2, "identifier");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleRegistrationCompleted:handler:", v22, &__block_literal_global_127);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __47___CDUserContextServerClient_registerCallback___block_invoke_2_cold_1(v2, v22);
  }

}

void __47___CDUserContextServerClient_registerCallback___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __47___CDUserContextServerClient_registerCallback___block_invoke_3_cold_1();

}

void __47___CDUserContextServerClient_registerCallback___block_invoke_126(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __47___CDUserContextServerClient_registerCallback___block_invoke_126_cold_1();

  }
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_128()
{
  NSObject *v0;

  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __47___CDUserContextServerClient_registerCallback___block_invoke_128_cold_1();

}

void __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_2_cold_1();

}

uint64_t __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_131(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 ^ 1;
  return result;
}

void __70___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v3 == objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v4 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

void __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a3)
  {
    if (v5)
      __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_2();
  }
  else if (v5)
  {
    __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_1();
  }

}

void __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a3)
  {
    if (v5)
      __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_2();
  }
  else if (v5)
  {
    __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_1();
  }

}

void __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke_cold_1();
  }

}

uint64_t __53___CDUserContextServerClient_valuesForPaths_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_valuesForPaths:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (uint64_t)(a1 + 5);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_cold_1((uint64_t)a1, v2, v3);

    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "copy");
    (*(void (**)(void))(a1[4] + 16))();
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(_QWORD *)(v7 + 40) = 0;

  }
}

void __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9[2];
  _QWORD block[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_2;
  block[3] = &unk_1E26D5900;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v6 = *(_QWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a1 + 64);
  v16 = v6;
  *(_OWORD *)v9 = *(_OWORD *)(a1 + 48);
  v7 = *(NSObject **)(v4 + 8);
  v8 = v9[0];
  v13 = *(_OWORD *)v9;
  v15 = *(_QWORD *)(a1 + 72);
  v9[0] = v3;
  dispatch_sync(v7, block);

}

void __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = a1[4];
  if (v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setObject:forKeyedSubscript:", v2, a1[5]);
  if (++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) == a1[10])
  {
    v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "copy");
    (*(void (**)(void))(a1[6] + 16))();
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    v5 = *(_QWORD *)(a1[9] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __71___CDUserContextServerClient_initForService_withConnection_andContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_10(&dword_18DD73000, v0, v1, "CDUserContext: client connection interrupted or invalidated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

void __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2_cold_1(void **a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  _CDRedactedObjectForKeyPath(*a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_3(&dword_18DD73000, v3, v4, "CDUserContext: GET %@ = %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5(&dword_18DD73000, a2, a3, "Unable to fetch properties of remote key path: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, v0, v1, "Error communicating with client for handlePreviouslyFiredRegistration: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, a2, v4, "Failed to get remote proxy to send registration completed for registration %@", v5);

  OUTLINED_FUNCTION_3();
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_3_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_19();
  objc_msgSend(*(id *)(v0 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14_0(&dword_18DD73000, v2, v3, "Failed to send registration completed for registration %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_126_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_12_0(&dword_18DD73000, v0, v1, "Unable to receive client acknowledgement for completed registration", v2);
  OUTLINED_FUNCTION_13();
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_128_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_10(&dword_18DD73000, v0, v1, "Requested active devices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

void __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, v0, v1, "Error communicating with client for performRegistrationCallbackWithRegistration: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_1(&dword_18DD73000, v1, v2, "Fetched properties of remote key paths: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

void __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, v0, v1, "Failed to fetch properties of remote key paths: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_1(&dword_18DD73000, v1, v2, "Subscribed to user context value notifications on remote devices: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

void __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_1(&dword_18DD73000, v1, v2, "Failed to subscribe to user context value notifications on remote devices: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

void __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_3(&dword_18DD73000, v1, v2, "Unsubscribed from user context value notifications on devices %{public}@ with registration %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_1();
}

void __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_3(&dword_18DD73000, v1, v2, "Failed to unsubscribe from user context value notifications on devices %{public}@ with registration: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_1();
}

void __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_10(&dword_18DD73000, v0, v1, "Subscribed to device status change notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

void __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, v0, v1, "Failed to subscribe to device status change notifications: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56) - objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, a3, v5, "CDUserContext: Failed to get %@ values", v6);

  OUTLINED_FUNCTION_1_1();
}

@end
