@implementation DSTCCStorePassThrough

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSTCCStore");
    v3 = (void *)DSLog_7;
    DSLog_7 = (uint64_t)v2;

  }
}

- (BOOL)isServiceGranted:(id)a3 forApp:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DSHealth")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("DSLocalNetwork")))
  {
    v8 = DSLog_7;
    if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_FAULT))
      -[DSTCCStorePassThrough isServiceGranted:forApp:].cold.1(v8);
    v9 = 0;
  }
  else
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DSLocationAlways")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("DSLocationWhenInUse")))
    {
      -[DSTCCStorePassThrough appsWithLocationService](self, "appsWithLocationService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
        v9 = -[DSTCCStorePassThrough locationAuthorizationForApp:](self, "locationAuthorizationForApp:", v11) != 0;
      else
        v9 = 0;
    }
    else
    {
      v12 = (void *)TCCAccessCopyInformationForBundleId();
      v13 = v6;
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("DSContacts")))
      {
        v14 = (id)*MEMORY[0x24BEB3830];

        v13 = v14;
      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v12;
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v11);
            v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v19, "valueForKey:", CFSTR("kTCCInfoGranted"), (_QWORD)v24);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "BOOLValue");

            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kTCCInfoService"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v20) = objc_msgSend(v22, "isEqualToString:", v13);

            if ((_DWORD)v20 && (v21 & 1) != 0)
            {
              v9 = 1;
              goto LABEL_24;
            }
          }
          v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v16)
            continue;
          break;
        }
      }
      v9 = 0;
LABEL_24:

    }
  }

  return v9;
}

- (void)appsWithPermissionGrantedForService:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a5;
  v8 = (void *)tcc_server_create();
  tcc_service_singleton_for_CF_name();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v13;
  tcc_server_message_get_authorization_records_by_service();

}

void __85__DSTCCStorePassThrough_appsWithPermissionGrantedForService_queue_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t authorization_right;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5)
  {
    tcc_authorization_record_get_subject_identity();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    authorization_right = tcc_authorization_record_get_authorization_right();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", tcc_identity_get_identifier(), 4);
    if (v8)
      v9 = (authorization_right & 0xFFFFFFFFFFFFFFFELL) == 2;
    else
      v9 = 0;
    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

  }
  else
  {
    v10 = DSLog_7;
    if (a3)
    {
      if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR))
        __85__DSTCCStorePassThrough_appsWithPermissionGrantedForService_queue_completionHandler___block_invoke_cold_1(a1, a3, v10);
      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSError errorWithCode:appName:serviceName:underlyingErrors:](DSError, "errorWithCode:appName:serviceName:underlyingErrors:", 3, 0, CFSTR("DSHealth"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v13);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 40);
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_227D24000, v10, OS_LOG_TYPE_INFO, "Finished getting authorization for service: %@", (uint8_t *)&v15, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

- (id)appsWithLocationService
{
  return (id)CLCopyAppsUsingLocation();
}

- (BOOL)isEntityClassApplication:(id)a3
{
  return objc_msgSend(MEMORY[0x24BDBFA88], "primaryEntityClassForLocationDictionary:", a3) == 1;
}

- (unint64_t)locationAuthorizationForApp:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x24BDBFA88], "entityAuthorizationForLocationDictionary:", a3);
  if (v3 == 4)
    return 2;
  else
    return v3 == 2;
}

- (void)healthAuthorizationForApp:(id)a3 andAuthorizationStore:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a5;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __95__DSTCCStorePassThrough_healthAuthorizationForApp_andAuthorizationStore_withCompletionHandler___block_invoke;
  v16 = &unk_24F081FC0;
  v17 = v7;
  v18 = v8;
  v9 = v8;
  v10 = v7;
  v11 = a4;
  v12 = (void *)MEMORY[0x22E2A849C](&v13);
  objc_msgSend(v11, "fetchAuthorizationRecordsForBundleIdentifier:completion:", v10, v12, v13, v14, v15, v16);

}

void __95__DSTCCStorePassThrough_healthAuthorizationForApp_andAuthorizationStore_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[3];
  char v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:appName:serviceName:underlyingErrors:](DSError, "errorWithCode:appName:serviceName:underlyingErrors:", 3, v7, CFSTR("DSHealth"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v5, "count"))
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __95__DSTCCStorePassThrough_healthAuthorizationForApp_andAuthorizationStore_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_24F081F98;
    v10[4] = v11;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _Block_object_dispose(v11, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __95__DSTCCStorePassThrough_healthAuthorizationForApp_andAuthorizationStore_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "status");
  if ((unint64_t)(result - 101) <= 2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (void)loadConfigurations:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDE26D0];
  v8 = a3;
  objc_msgSend(v7, "sharedManagerForAllUsers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__DSTCCStorePassThrough_loadConfigurations_handler___block_invoke;
  v11[3] = &unk_24F081FE8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "loadConfigurationsWithCompletionQueue:handler:", v8, v11);

}

void __52__DSTCCStorePassThrough_loadConfigurations_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR))
    __52__DSTCCStorePassThrough_loadConfigurations_handler___block_invoke_cold_1();
  objc_msgSend(MEMORY[0x24BDE26D0], "networkPrivacyConfigurationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "name", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", v7) & 1) != 0)
        {
          objc_msgSend(v13, "pathController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(*(id *)(a1 + 32), "setPathControllerConfiguration:", v13);
        }
        else
        {

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DSTCCStorePassThrough pathControllerConfiguration](self, "pathControllerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v8, "pathRules", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "matchSigningIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if (v16)
        {
          v17 = v14;
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (v4)
  {
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE2708]), "initWithSigningIdentifier:", v6);
    objc_msgSend(v8, "pathRules");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v8, "pathRules");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObject:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPathRules:", v19);

    }
    else
    {
      v25 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPathRules:", v9);
    }
LABEL_13:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)allAppsWithLocalNetworkAccess:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  DSTCCStorePassThrough *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x24BDBCEF0];
  v11 = a4;
  v12 = objc_alloc_init(v10);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__DSTCCStorePassThrough_allAppsWithLocalNetworkAccess_queue_handler___block_invoke;
  v16[3] = &unk_24F082010;
  v17 = v8;
  v18 = self;
  v19 = v12;
  v20 = v9;
  v13 = v9;
  v14 = v12;
  v15 = v8;
  -[DSTCCStorePassThrough loadConfigurations:handler:](self, "loadConfigurations:handler:", v11, v16);

}

void __69__DSTCCStorePassThrough_allAppsWithLocalNetworkAccess_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR))
      __69__DSTCCStorePassThrough_allAppsWithLocalNetworkAccess_queue_handler___block_invoke_cold_1();
    +[DSError errorWithCode:](DSError, "errorWithCode:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "pathRuleForBundleID:create:", v10, 0, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "multicastPreferenceSet") && (objc_msgSend(v11, "denyMulticast") & 1) == 0)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)deleteApp:(id)a3 forTest:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BE51FC0]);
  objc_msgSend(v6, "setRequestUserConfirmation:", !v4);
  objc_msgSend(v6, "setWaitForDeletion:", 1);
  v7 = (void *)MEMORY[0x24BE51F70];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51F78]), "initWithBundleIdentifier:", v5);
  v12 = 0;
  objc_msgSend(v7, "uninstallAppWithIdentity:options:disposition:error:", v8, v6, 0, &v12);
  v9 = v12;

  if (v9)
  {
    if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR))
      -[DSTCCStorePassThrough deleteApp:forTest:].cold.1();
    v10 = v9;
  }

  return v9;
}

- (id)resetTCCCategory:(id)a3 forApp:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = MEMORY[0x24BDBD1A8];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if (!TCCAccessResetForBundleId())
        {
          +[DSError errorWithCode:appName:serviceName:underlyingErrors:](DSError, "errorWithCode:appName:serviceName:underlyingErrors:", 4, v6, v14, v12, (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)resetTCCPermission:(id)a3 forApp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("DSContacts")))
  {
    +[DSUtilities contactsServices](DSUtilities, "contactsServices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTCCStorePassThrough resetTCCCategory:forApp:](self, "resetTCCCategory:forApp:", v8, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (+[DSApp skipTCCCheck:](DSApp, "skipTCCCheck:", v6))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (TCCAccessResetForBundleId())
      goto LABEL_7;
    +[DSError errorWithCode:appName:serviceName:underlyingErrors:](DSError, "errorWithCode:appName:serviceName:underlyingErrors:", 4, v7, v6, MEMORY[0x24BDBD1A8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);
  }

LABEL_7:
  return v9;
}

- (void)resetLocationPermissionForApp:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DSTCCStorePassThrough appsWithLocationService](self, "appsWithLocationService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(MEMORY[0x24BDBFA88], "setEntityAuthorization:forLocationDictionary:", 0, v5);

}

- (void)resetHealthPermissionsForApp:(id)a3 withAuthorizationStore:(id)a4 andCompletionHandler:(id)a5
{
  objc_msgSend(a4, "resetAuthorizationStatusForBundleIdentifier:completion:", a3, a5);
}

- (void)saveConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[DSTCCStorePassThrough pathControllerConfiguration](self, "pathControllerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE26D0], "sharedManagerForAllUsers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__DSTCCStorePassThrough_saveConfiguration_handler___block_invoke;
  v12[3] = &unk_24F082038;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "saveConfiguration:withCompletionQueue:handler:", v11, v7, v12);

}

void __51__DSTCCStorePassThrough_saveConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NEConfigurationErrorDomain")) & 1) != 0)
    {
      v6 = objc_msgSend(v3, "code");

      if (v6 != 9)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v3, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[DSError errorWithCode:appName:serviceName:underlyingErrors:](DSError, "errorWithCode:appName:serviceName:underlyingErrors:", 4, 0, CFSTR("DSLocalNetwork"), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v8);

        if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR))
          __51__DSTCCStorePassThrough_saveConfiguration_handler___block_invoke_cold_1();
      }
    }
    else
    {

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)resetLocalNetworkPermissionForApp:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__DSTCCStorePassThrough_resetLocalNetworkPermissionForApp_queue_handler___block_invoke;
  v12[3] = &unk_24F082060;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[DSTCCStorePassThrough loadConfigurations:handler:](self, "loadConfigurations:handler:", a4, v12);

}

void __73__DSTCCStorePassThrough_resetLocalNetworkPermissionForApp_queue_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pathRuleForBundleID:create:", *(_QWORD *)(a1 + 40), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "multicastPreferenceSet"))
  {
    objc_msgSend(v2, "setDenyMulticast:", 1);
    objc_msgSend(v2, "setMulticastPreferenceSet:", 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (NEConfiguration)pathControllerConfiguration
{
  return self->_pathControllerConfiguration;
}

- (void)setPathControllerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_pathControllerConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathControllerConfiguration, 0);
}

- (void)isServiceGranted:(os_log_t)log forApp:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_227D24000, log, OS_LOG_TYPE_FAULT, "DSTCCStore isServiceGranted:forApp: should not be used to check non-restricted permissions", v1, 2u);
}

void __85__DSTCCStorePassThrough_appsWithPermissionGrantedForService_queue_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_227D24000, a2, a3, "Error when requesting TCC for service: %@ error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

void __52__DSTCCStorePassThrough_loadConfigurations_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_227D24000, v0, v1, "Failed to load NE configuration with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__DSTCCStorePassThrough_allAppsWithLocalNetworkAccess_queue_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_227D24000, v0, v1, "Fetching apps with local network access failed with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)deleteApp:forTest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_227D24000, v0, v1, "Error deleting app %{public}@: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

void __51__DSTCCStorePassThrough_saveConfiguration_handler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_227D24000, v0, v1, "NE configuration save error %@ for %@");
  OUTLINED_FUNCTION_1_0();
}

@end
