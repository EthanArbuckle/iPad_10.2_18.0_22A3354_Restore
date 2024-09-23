@implementation SABundleManager

+ (id)crashDetectionManager
{
  if (crashDetectionManager_onceToken != -1)
    dispatch_once(&crashDetectionManager_onceToken, &__block_literal_global_1);
  return (id)crashDetectionManager_manager;
}

void __31__SABundleManager_approvedApps__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  SABundleManagerApp *v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    tcc_authorization_record_get_subject_identity();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!tcc_identity_get_type() && tcc_authorization_record_get_authorization_right() == 2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", tcc_identity_get_identifier(), 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      tcc_authorization_record_get_subject_attributed_entity();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 == 0;

      v8 = -[SABundleManagerApp initWithBundleId:deviceType:]([SABundleManagerApp alloc], "initWithBundleId:deviceType:", v5, v7);
      -[SABundleManagerApp setAuthorizationDate:](v8, "setAuthorizationDate:", tcc_authorization_record_get_last_modified_date());
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);

    }
    v3 = v9;
  }

}

- (id)approvedApps
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  SABundleManager *v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *);
  void *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v29 = self;
  v58 = *MEMORY[0x24BDAC8D0];
  sa_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[SABundleManager approvedApps].cold.1((uint64_t)v29, v2);

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = (id)objc_opt_new();
  v40 = MEMORY[0x24BDAC760];
  v41 = 3221225472;
  v42 = __31__SABundleManager_approvedApps__block_invoke;
  v43 = &unk_2505B3718;
  v44 = &v45;
  tcc_server_message_get_authorization_records_by_service();
  if (!objc_msgSend((id)v46[5], "count"))
  {
    v27 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_33;
  }
  objc_msgSend((id)v46[5], "sortedArrayUsingComparator:", &__block_literal_global_52);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SAAuthorization SASyncedBundleId](SAAuthorization, "SASyncedBundleId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v5 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend((id)v46[5], "count") - 1);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v6 = 0;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v57, 16);
  if (!v7)
    goto LABEL_18;
  v8 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v37 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      if (!v6)
      {
        v6 = v10;
        continue;
      }
      objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "bundleId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", v31))
      {

LABEL_14:
        objc_msgSend(v5, "addObject:", v6, v29);
        v15 = v10;

        v6 = v15;
        continue;
      }
      objc_msgSend(v10, "bundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SABundleManager pairedDeviceBundleIdForId:](v29, "pairedDeviceBundleIdForId:", v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v14)
        goto LABEL_14;
      objc_msgSend(v5, "addObject:", v6);
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v57, 16);
  }
  while (v7);
LABEL_18:

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v56, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v33;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v19);
        sa_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v20, "bundleId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v53 = "-[SABundleManager approvedApps]";
          v54 = 2112;
          v55 = v25;
          _os_log_fault_impl(&dword_23457A000, v21, OS_LOG_TYPE_FAULT, "%s - Found more than one approved app for service, revoking access for duplicate app, bundleId: %@", buf, 0x16u);

        }
        objc_msgSend(v20, "bundleId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = TCCAccessSetForBundleId() == 0;

        if (v23)
        {
          sa_default_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v20, "bundleId");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v53 = "-[SABundleManager approvedApps]";
            v54 = 2112;
            v55 = v26;
            _os_log_error_impl(&dword_23457A000, v24, OS_LOG_TYPE_ERROR, "%s - Unable to revoke access for duplicate app, bundleId: %@", buf, 0x16u);

          }
        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v56, 16);
    }
    while (v17);
  }

  v51 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  _Block_object_dispose(&v45, 8);

  return v27;
}

void __40__SABundleManager_crashDetectionManager__block_invoke()
{
  SABundleManager *v0;
  uint64_t v1;
  void *v2;

  v0 = [SABundleManager alloc];
  v1 = -[SABundleManager initWithServiceName:](v0, "initWithServiceName:", *MEMORY[0x24BEB3868]);
  v2 = (void *)crashDetectionManager_manager;
  crashDetectionManager_manager = v1;

}

- (SABundleManager)initWithServiceName:(__CFString *)a3
{
  SABundleManager *v3;
  SAPhoneApplicationLauncher *v4;
  SAApplicationLauncher *applicationLauncher;
  uint64_t v6;
  OS_tcc_server *server;
  uint64_t v8;
  OS_tcc_service *service;
  uint64_t v10;
  OS_tcc_message_options *options;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SABundleManager;
  v3 = -[SABundleManager init](&v13, sel_init);
  if (v3)
  {
    v4 = objc_alloc_init(SAPhoneApplicationLauncher);
    applicationLauncher = v3->_applicationLauncher;
    v3->_applicationLauncher = (SAApplicationLauncher *)v4;

    v6 = tcc_server_create();
    server = v3->_server;
    v3->_server = (OS_tcc_server *)v6;

    tcc_service_singleton_for_CF_name();
    v8 = objc_claimAutoreleasedReturnValue();
    service = v3->_service;
    v3->_service = (OS_tcc_service *)v8;

    v10 = tcc_message_options_create();
    options = v3->_options;
    v3->_options = (OS_tcc_message_options *)v10;

    tcc_message_options_set_reply_handler_policy();
    tcc_message_options_set_request_prompt_policy();
  }
  return v3;
}

+ (id)approvedBundleIdsForService:(__CFString *)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  sa_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[SABundleManager approvedBundleIdsForService:].cold.1();

  v4 = (void *)objc_opt_new();
  v5 = (void *)TCCAccessCopyInformation();
  if (v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      v10 = (_QWORD *)MEMORY[0x24BEB3810];
      v11 = (_QWORD *)MEMORY[0x24BEB3818];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", *v10, (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            CFBundleGetIdentifier((CFBundleRef)v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", *v11);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "BOOLValue");

            if (v17)
              objc_msgSend(v4, "addObject:", v15);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

  }
  objc_msgSend(v4, "allObjects", (_QWORD)v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __31__SABundleManager_approvedApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "authorizationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authorizationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)bundleURLForCurrentConnection
{
  void *v2;
  void *v3;
  void *v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v7 = 0u;
  v8 = 0u;
  if (v2)
    objc_msgSend(v2, "auditToken");
  v6[0] = v7;
  v6[1] = v8;
  +[SABundleManager bundleURLForAuditToken:](SABundleManager, "bundleURLForAuditToken:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bundleURLForAuditToken:(id *)a3
{
  __int128 v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _OWORD v12[2];
  id v13;

  v13 = 0;
  v3 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v3;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", v12, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7
    && (objc_msgSend(v4, "bundleIdentifier"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    objc_msgSend(v4, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sa_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SABundleManager bundleURLForAuditToken:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (void)wakeApprovedAppsWithReason:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  sa_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SABundleManager wakeApprovedAppsWithReason:completion:].cold.1((uint64_t)self, a3, v7);

  -[SABundleManager approvedApps](self, "approvedApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v8;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (!v10)
      goto LABEL_18;
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        sa_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v14, "bundleId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v24 = "-[SABundleManager wakeApprovedAppsWithReason:completion:]";
          v25 = 2112;
          v26 = v17;
          _os_log_debug_impl(&dword_23457A000, v15, OS_LOG_TYPE_DEBUG, "%s - Need to wake app, app: %@", buf, 0x16u);

        }
        if ((unint64_t)a3 >= 2)
        {
          if (a3 != 2)
            goto LABEL_16;
          objc_msgSend(v14, "bundleId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SABundleManager openApplicationInForegroundWithBundleId:withReason:completion:](self, "openApplicationInForegroundWithBundleId:withReason:completion:", v16, 2, v6);
        }
        else
        {
          objc_msgSend(v14, "bundleId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SABundleManager openApplicationInBackgroundWithBundleId:withReason:completion:](self, "openApplicationInBackgroundWithBundleId:withReason:completion:", v16, a3, v6);
        }

LABEL_16:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (!v11)
      {
LABEL_18:

        v8 = v18;
        goto LABEL_21;
      }
    }
  }
  if (v6)
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_21:

}

- (void)openApplicationInBackgroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a3;
  v9 = a5;
  sa_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SABundleManager openApplicationInBackgroundWithBundleId:withReason:completion:].cold.1();

  -[SAApplicationLauncher openApplicationInBackgroundWithBundleId:withReason:completion:](self->_applicationLauncher, "openApplicationInBackgroundWithBundleId:withReason:completion:", v8, a4, v9);
}

- (void)openApplicationInForegroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sa_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SABundleManager openApplicationInForegroundWithBundleId:withReason:completion:].cold.1();

  objc_msgSend((id)objc_opt_class(), "reasonToAttributeName:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v16[0] = CFSTR("__LaunchOrigin");
  v16[1] = CFSTR("__PromptUnlockDevice");
  v17[0] = v8;
  v17[1] = &unk_2505B78B0;
  v16[2] = CFSTR("__UnlockDevice ");
  v17[2] = &unk_2505B78B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrontBoardOptions:", v10);

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__SABundleManager_openApplicationInForegroundWithBundleId_withReason_completion___block_invoke;
  v13[3] = &unk_2505B3780;
  v14 = v6;
  v15 = a4;
  v12 = v6;
  objc_msgSend(v11, "openApplicationWithBundleIdentifier:usingConfiguration:completionHandler:", v12, v9, v13);

}

void __81__SABundleManager_openApplicationInForegroundWithBundleId_withReason_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sa_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 136315650;
      v11 = "-[SABundleManager openApplicationInForegroundWithBundleId:withReason:completion:]_block_invoke";
      v12 = 2112;
      v13 = v8;
      v14 = 2048;
      v15 = v9;
      _os_log_impl(&dword_23457A000, v7, OS_LOG_TYPE_DEFAULT, "%s - Successfully launched bundle application in foreground, bundleId: %@, reason: %lu", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __81__SABundleManager_openApplicationInForegroundWithBundleId_withReason_completion___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }

}

+ (void)getRemoteApplicationNameWithBundleId:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getActivePairedDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__SABundleManager_getRemoteApplicationNameWithBundleId_withCompletion___block_invoke;
    v10[3] = &unk_2505B37A8;
    v11 = v5;
    v12 = v6;
    objc_msgSend(v9, "fetchApplicationOnPairedDevice:withBundleID:completion:", v8, v11, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __71__SABundleManager_getRemoteApplicationNameWithBundleId_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    sa_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__SABundleManager_getRemoteApplicationNameWithBundleId_withCompletion___block_invoke_cold_1(a1);

  }
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "applicationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

+ (id)remoteApplicationWithBundleId:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  SABundleManagerApp *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getActivePairedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v8, "applicationOnPairedDevice:withBundleID:error:", v7, v5, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;
    v11 = v18;

    if (v11 && objc_msgSend(v11, "code") != 19)
    {
      sa_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[SABundleManager remoteApplicationWithBundleId:error:].cold.1((uint64_t)v5);

      objc_storeStrong(a4, v10);
    }
    if (v9)
    {
      v13 = -[SABundleManagerApp initWithBundleId:deviceType:]([SABundleManagerApp alloc], "initWithBundleId:deviceType:", v5, 1);
      objc_msgSend(v9, "companionAppBundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SABundleManagerApp setPairedBundleId:](v13, "setPairedBundleId:", v14);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *a4;
    *a4 = v15;

    v13 = 0;
  }

  return v13;
}

+ (id)locationBundle
{
  if (locationBundle_onceToken != -1)
    dispatch_once(&locationBundle_onceToken, &__block_literal_global_73);
  return (id)locationBundle___bundle;
}

void __33__SABundleManager_locationBundle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForDirectory:inDomains:", 5, 8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("LocationBundles"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Emergency SOS.bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)locationBundle___bundle;
  locationBundle___bundle = v4;

}

+ (id)reasonToAttributeName:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_2505B37E8[a3];
}

- (id)pairedDeviceBundleIdForId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getActivePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "locallyAvailableApplicationWithBundleID:forPairedDevice:error:", v3, v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    sa_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SABundleManager remoteApplicationWithBundleId:error:].cold.1((uint64_t)v3);

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_applicationLauncher, 0);
}

+ (void)approvedBundleIdsForService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23457A000, v0, v1, "%s, service: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

- (void)approvedApps
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  tcc_service_get_CF_name();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23457A000, a2, v3, "%s, service: %@", (uint8_t *)v4);
}

+ (void)bundleURLForAuditToken:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_23457A000, v0, OS_LOG_TYPE_ERROR, "%s - unable to get bundle information for audit token, error: %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)wakeApprovedAppsWithReason:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t CF_name;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 136315650;
  v5 = "-[SABundleManager wakeApprovedAppsWithReason:completion:]";
  v6 = 2048;
  v7 = a2;
  v8 = 2112;
  CF_name = tcc_service_get_CF_name();
  _os_log_debug_impl(&dword_23457A000, a3, OS_LOG_TYPE_DEBUG, "%s, reason: %lu, service: %@", (uint8_t *)&v4, 0x20u);
}

- (void)openApplicationInBackgroundWithBundleId:withReason:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23457A000, v0, v1, "%s - attempting to launch app in background, bundleId: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

- (void)openApplicationInForegroundWithBundleId:withReason:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23457A000, v0, v1, "%s - attempting to launch app in foreground, bundleId: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __81__SABundleManager_openApplicationInForegroundWithBundleId_withReason_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 136315906;
  v6 = "-[SABundleManager openApplicationInForegroundWithBundleId:withReason:completion:]_block_invoke";
  v7 = 2112;
  v8 = v3;
  v9 = 2048;
  v10 = v4;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_23457A000, log, OS_LOG_TYPE_ERROR, "%s - Unable to launch bundle application in foreground, bundleId: %@, reason: %lu, error: %@", (uint8_t *)&v5, 0x2Au);
}

void __71__SABundleManager_getRemoteApplicationNameWithBundleId_withCompletion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_23457A000, v1, v2, "Unable to get remote app for fromBundleId: %@, error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

+ (void)remoteApplicationWithBundleId:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_23457A000, v1, v2, "Unable to get remote app for fromBundleId: %@, error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
