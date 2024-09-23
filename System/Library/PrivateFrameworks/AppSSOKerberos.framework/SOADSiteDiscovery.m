@implementation SOADSiteDiscovery

- (SOADSiteDiscovery)initWithRealm:(id)a3
{
  id v5;
  SOADSiteDiscovery *v6;
  SOADSiteDiscovery *v7;
  uint64_t v8;
  NSOperationQueue *queue;
  void *v10;
  SODNSSRVQuery *v11;
  SODNSSRVQuery *dns;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SOADSiteDiscovery;
  v6 = -[SOADSiteDiscovery init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_realm, a3);
    v8 = objc_opt_new();
    queue = v7->_queue;
    v7->_queue = (NSOperationQueue *)v8;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.appsso.Kerberos.ldap.%@"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v7->_queue, "setName:", v10);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_queue, "setMaxConcurrentOperationCount:", 1);
    v11 = objc_alloc_init(SODNSSRVQuery);
    dns = v7->_dns;
    v7->_dns = v11;

  }
  return v7;
}

- (void)discoverADInfoUsingSourceAppBundleIdentifier:(id)a3 auditTokenData:(id)a4 requireTLSForLDAP:(BOOL)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD *v23;
  BOOL v24;
  _QWORD v25[5];
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  SO_LOG_SOADSiteDiscovery();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[SOADSiteDiscovery discoverADInfoUsingSourceAppBundleIdentifier:auditTokenData:requireTLSForLDAP:withCompletion:].cold.1(self, v13);

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v26 = 0;
  v14 = (void *)MEMORY[0x24BDD17C8];
  -[SOADSiteDiscovery realm](self, "realm");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("_ldap._tcp.%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOADSiteDiscovery dns](self, "dns");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke;
  v20[3] = &unk_24D3EC130;
  v20[4] = self;
  v18 = v10;
  v24 = a5;
  v21 = v18;
  v23 = v25;
  v19 = v12;
  v22 = v19;
  objc_msgSend(v17, "lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:", v16, v18, v11, v20);

  _Block_object_dispose(v25, 8);
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  SOAsynchronousLDAPOperation *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  SOAsynchronousLDAPOperation *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id obj;
  uint64_t v28;
  _QWORD v29[6];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id location;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SO_LOG_SOADSiteDiscovery();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_3();

  objc_initWeak(&location, *(id *)(a1 + 32));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v28 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v8 = [SOAsynchronousLDAPOperation alloc];
        objc_msgSend(*(id *)(a1 + 32), "realm");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "host");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v7, "port");
        v12 = *(_QWORD *)(a1 + 40);
        v13 = *(_BYTE *)(a1 + 64) != 0;
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_6;
        v29[3] = &unk_24D3EC108;
        v14 = *(_QWORD *)(a1 + 56);
        v29[4] = v7;
        v29[5] = v14;
        objc_copyWeak(&v30, &location);
        v15 = -[SOAsynchronousLDAPOperation initWithRealm:andHost:andPort:andBundleIdentifier:andRequireTLSForLDAP:andCompletion:](v8, "initWithRealm:andHost:andPort:andBundleIdentifier:andRequireTLSForLDAP:andCompletion:", v9, v10, v11, v12, v13, v29);

        objc_msgSend(*(id *)(a1 + 32), "queue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addOperation:", v15);

        objc_destroyWeak(&v30);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "waitUntilAllOperationsAreFinished");

  SO_LOG_SOADSiteDiscovery();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);

  SO_LOG_SOADSiteDiscovery();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_destroyWeak(&location);

}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_6(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;

  v6 = a3;
  SO_LOG_SOADSiteDiscovery();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_6_cold_1((uint64_t)v6, a1, v7);

  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelAllOperations");

  }
}

- (void)performLDAPPingUsingSite:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5 requireTLSForLDAP:(BOOL)a6 inBackground:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;

  v9 = a7;
  v10 = a6;
  v13 = a3;
  v14 = a8;
  v15 = a4;
  SO_LOG_SOADSiteDiscovery();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[SOADSiteDiscovery performLDAPPingUsingSite:bundleIdentifier:auditTokenData:requireTLSForLDAP:inBackground:completion:].cold.2(self, v16);

  v17 = (void *)MEMORY[0x24BDD17C8];
  -[SOADSiteDiscovery realm](self, "realm");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v13)
    objc_msgSend(v17, "stringWithFormat:", CFSTR("_ldap._tcp.%@._sites.%@"), v13, v18);
  else
    objc_msgSend(v17, "stringWithFormat:", CFSTR("_ldap._tcp.%@"), v18, v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  SO_LOG_SOADSiteDiscovery();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[SOADSiteDiscovery performLDAPPingUsingSite:bundleIdentifier:auditTokenData:requireTLSForLDAP:inBackground:completion:].cold.1();

  v22 = (void *)objc_opt_new();
  v23 = (void *)MEMORY[0x24BDD17C8];
  -[SOADSiteDiscovery realm](self, "realm");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("(&(DnsDomain=%@)(NtVer=\\06\\00\\00\\00))"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke;
  v31[3] = &unk_24D3EC180;
  v32 = v20;
  v33 = v22;
  v34 = v25;
  v35 = v14;
  v26 = v14;
  v27 = v25;
  v28 = v22;
  v29 = v20;
  objc_msgSend(v28, "connectToLDAPService:requireTLSForLDAP:bundleIdentifier:inBackground:completion:", v29, v10, v15, v9, v31);

}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  SO_LOG_SOADSiteDiscovery();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v7)
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_cold_1();

    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_18;
    v10[3] = &unk_24D3EC158;
    v11 = v8;
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v11, "queryforBaseDN:andScope:andAttributes:withFilter:completion:", &stru_24D3EC758, 0, &unk_24D3F2C58, v9, v10);

  }
  else
  {
    if (v7)
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "disconnect");
  }

}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_18(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "disconnect");
  if (a2)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("netlogon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SO_LOG_SOADSiteDiscovery();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_18_cold_2();

    +[SONetLogonParser parseNetLoginUsingData:](SONetLogonParser, "parseNetLoginUsingData:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    SO_LOG_SOADSiteDiscovery();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_18_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    SO_LOG_SOADSiteDiscovery();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_18_cold_3();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)performNetworkConnectionUsingService:(id)a3 orHost:(id)a4 port:(unsigned __int16)a5 inBackground:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  NSObject *secure_tcp;
  NSObject *srv;
  nw_connection_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD handler[4];
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a6;
  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a7;
  v13 = v12;
  if (v10 | v11)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy_;
    v31 = __Block_byref_object_dispose_;
    v32 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0880], (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0870]);
    if (v8)
      nw_parameters_set_traffic_class();
    if (v10)
    {
      objc_msgSend(objc_retainAutorelease((id)v10), "UTF8String");
      srv = nw_endpoint_create_srv();
    }
    else
    {
      objc_msgSend(objc_retainAutorelease((id)v11), "UTF8String");
      srv = nw_endpoint_create_host_with_numeric_port();
    }
    v16 = nw_connection_create(srv, secure_tcp);
    v17 = (void *)v28[5];
    v28[5] = (uint64_t)v16;

    v18 = v28[5];
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    nw_connection_set_queue(v18, v19);

    v20 = v28[5];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke;
    handler[3] = &unk_24D3EC1A8;
    v23 = v25;
    v24 = &v27;
    v22 = v13;
    nw_connection_set_state_changed_handler(v20, handler);
    nw_connection_start((nw_connection_t)v28[5]);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v27, 8);

  }
  else
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

void __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke(_QWORD *a1, unsigned int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void (*v10)(void);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  SO_LOG_SOADSiteDiscovery();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_4(a2, v6);

  if (a2 <= 1)
    goto LABEL_10;
  switch(a2)
  {
    case 3u:
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      nw_connection_cancel(*(nw_connection_t *)(*(_QWORD *)(a1[6] + 8) + 40));
      v11 = *(_QWORD *)(a1[6] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = 0;

      v10 = *(void (**)(void))(a1[4] + 16);
      goto LABEL_12;
    case 5u:
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = 0;

      SO_LOG_SOADSiteDiscovery();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke_cold_2(v15, v16, v17, v18, v19, v20, v21, v22);

      v23 = *(_QWORD *)(a1[5] + 8);
      if (!*(_BYTE *)(v23 + 24))
      {
        *(_BYTE *)(v23 + 24) = 1;
        goto LABEL_11;
      }
      break;
    case 4u:
      SO_LOG_SOADSiteDiscovery();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke_cold_1();

LABEL_10:
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      nw_connection_cancel(*(nw_connection_t *)(*(_QWORD *)(a1[6] + 8) + 40));
      v8 = *(_QWORD *)(a1[6] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

LABEL_11:
      v10 = *(void (**)(void))(a1[4] + 16);
LABEL_12:
      v10();
      break;
  }

}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
  objc_storeStrong((id *)&self->_realm, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SODNSSRVQuery)dns
{
  return (SODNSSRVQuery *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDns:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dns, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_realm, 0);
}

- (void)discoverADInfoUsingSourceAppBundleIdentifier:(void *)a1 auditTokenData:(NSObject *)a2 requireTLSForLDAP:withCompletion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "realm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "Start of discoverADInfoWithCompletion: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "using site code: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, a1, a3, "all LDAP operations complete", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "responses for LDAP: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_6_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a2 + 32), "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_215A1B000, a3, OS_LOG_TYPE_DEBUG, "received new site code: %@, from server: %@", (uint8_t *)&v6, 0x16u);

}

- (void)performLDAPPingUsingSite:bundleIdentifier:auditTokenData:requireTLSForLDAP:inBackground:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "Start of ldap operation for service: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performLDAPPingUsingSite:(void *)a1 bundleIdentifier:(NSObject *)a2 auditTokenData:requireTLSForLDAP:inBackground:completion:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "realm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "Start of performLDAPPingUsingSite: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "response from service: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_215A1B000, v0, v1, "error with ldap connection for service: %@, %@");
  OUTLINED_FUNCTION_2();
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "netlogon response: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_18_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "response from ldap: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_18_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_215A1B000, v0, v1, "error with netlogon ping for service: %{public}@, %{public}@");
  OUTLINED_FUNCTION_2();
}

void __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_215A1B000, v0, OS_LOG_TYPE_ERROR, "tcp error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, a1, a3, "connection cancelled", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
