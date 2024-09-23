@implementation NPTVPNCollector

- (void)startCollectingWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_queue_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NPTVPNCollector *v28;
  id v29;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDE2758], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTVPNCollector setManager:](self, "setManager:", v6);

  objc_msgSend(MEMORY[0x24BDE26D0], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTVPNCollector setConfigManager:](self, "setConfigManager:", v7);

  v8 = dispatch_queue_create("NPTVPNCollector.backgroundQueue", MEMORY[0x24BDAC9C0]);
  -[NPTVPNCollector setBackgroundQueue:](self, "setBackgroundQueue:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTVPNCollector setCachedMetadata:](self, "setCachedMetadata:", v9);

  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTVPNCollector cachedMetadata](self, "cachedMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("initial_state"));

  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPTVPNCollector cachedMetadata](self, "cachedMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("events"));

  -[NPTVPNCollector manager](self, "manager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke;
  v26[3] = &unk_24C9913B0;
  v27 = v5;
  v28 = self;
  v29 = v4;
  v15 = v4;
  v16 = v5;
  objc_msgSend(v14, "loadFromPreferencesWithCompletionHandler:", v26);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE2758], "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_vpnNotificationReceived_, CFSTR("com.apple.networkextension.statuschanged"), v19);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE2758], "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_vpnNotificationReceived_, CFSTR("NEVPNErrorDomain"), v22);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE2758], "sharedManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "connection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel_vpnNotificationReceived_, CFSTR("com.apple.networkextension.app-configuration-changed"), v25);

}

void __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getVPNStatusAsString:", objc_msgSend(v7, "status"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("vpn_status"));

  objc_msgSend(*(id *)(a1 + 40), "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connectedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, CFSTR("vpn_connected_date"));

  if (v3)
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "cachedMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("initial_state"));

    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v15, "addObject:", v3);
    v16 = *(_QWORD *)(a1 + 48);
    if (v16)
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = (void *)objc_msgSend(v15, "copy");
      (*(void (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, v17, v18);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "configManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "backgroundQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke_2;
    v24[3] = &unk_24C991388;
    v21 = *(id *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    v23 = *(void **)(a1 + 48);
    v25 = v21;
    v26 = v22;
    v27 = v23;
    objc_msgSend(v19, "loadConfigurationsWithCompletionQueue:handler:", v20, v24);

  }
}

void __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  dispatch_semaphore_t v39;
  void *v40;
  NSObject *v41;
  dispatch_time_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  dispatch_semaphore_t v55;
  uint8_t buf[16];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v52 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getVPNStatusAsString:", objc_msgSend(v9, "status"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("vpn_status"));

  objc_msgSend(*(id *)(a1 + 40), "manager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connectedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v6;
  objc_msgSend(v6, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = a1;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("vpn_connected_date"));

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v58 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v21, "VPN");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          +[NPTLogger metadata](NPTLogger, "metadata");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20E71B000, v23, OS_LOG_TYPE_DEFAULT, "VPN Configuration Found", buf, 2u);
          }

          if (!v18
            || (objc_msgSend(v21, "VPN"),
                v24 = (void *)objc_claimAutoreleasedReturnValue(),
                v25 = objc_msgSend(v24, "isEnabled"),
                v24,
                v25))
          {
            v26 = v21;

            v18 = v26;
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(*(id *)(v50 + 40), "setConfig:", v18);
  if (v18)
  {
    objc_msgSend(v18, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v50 + 32), "setObject:forKeyedSubscript:", v27, CFSTR("vpn_name"));

    v28 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v18, "VPN");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithBool:", objc_msgSend(v29, "isEnabled"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v50 + 32), "setObject:forKeyedSubscript:", v30, CFSTR("vpn_enabled"));

    objc_msgSend(v18, "VPN");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "tunnelType") == 1)
      v32 = CFSTR("Packet");
    else
      v32 = CFSTR("AppProxy");
    objc_msgSend(*(id *)(v50 + 32), "setObject:forKeyedSubscript:", v32, CFSTR("vpn_tunnel_type"));

    objc_msgSend(v18, "VPN");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "protocol");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "serverAddress");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v50 + 32), "setObject:forKeyedSubscript:", v35, CFSTR("vpn_protocol_server_address"));

    objc_msgSend(*(id *)(v50 + 40), "manager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "protocolConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v50 + 32), "setObject:forKeyedSubscript:", v38, CFSTR("vpn_protocol"));

    v39 = dispatch_semaphore_create(0);
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke_30;
    v53[3] = &unk_24C991360;
    v40 = *(void **)(v50 + 40);
    v54 = *(id *)(v50 + 32);
    v55 = v39;
    v41 = v39;
    objc_msgSend(v40, "collectVPNAddressesWithCompletion:", v53);
    v42 = dispatch_walltime(0, 500000000);
    dispatch_semaphore_wait(v41, v42);

  }
  v43 = *(_QWORD *)(v50 + 32);
  objc_msgSend(*(id *)(v50 + 40), "cachedMetadata");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("initial_state"));

  v45 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v46 = v45;
  if (v52)
    objc_msgSend(v45, "addObject:", v52);
  v47 = *(_QWORD *)(v50 + 48);
  if (v47)
  {
    v48 = *(_QWORD *)(v50 + 32);
    v49 = (void *)objc_msgSend(v46, "copy");
    (*(void (**)(uint64_t, uint64_t, void *))(v47 + 16))(v47, v48, v49);

  }
}

intptr_t __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke_30(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)collectVPNAddressesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10[0] = 0;
  v10[1] = 0;
  -[NPTVPNCollector config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getUUIDBytes:", v10);

  ne_session_create();
  -[NPTVPNCollector backgroundQueue](self, "backgroundQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v8 = v4;
  ne_session_get_status();

}

uint64_t __53__NPTVPNCollector_collectVPNAddressesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint8_t v6[16];

  if ((int)a2 < 2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  +[NPTLogger metadata](NPTLogger, "metadata");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20E71B000, v4, OS_LOG_TYPE_DEFAULT, "Fetching additional info for VPN", v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "getExtendedStatus:session:completionHandler:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)getExtendedStatus:(int)a3 session:(void *)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v7 = a5;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (a3 == 3)
  {
    -[NPTVPNCollector backgroundQueue](self, "backgroundQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __63__NPTVPNCollector_getExtendedStatus_session_completionHandler___block_invoke;
    v16 = &unk_24C991428;
    v17 = v8;
    v18 = v7;
    ne_session_get_info();

    v10 = v17;
  }
  else
  {
    +[NPTLogger metadata](NPTLogger, "metadata");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20E71B000, v11, OS_LOG_TYPE_DEFAULT, "VPN Session is Not Connected", v12, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

void __63__NPTVPNCollector_getExtendedStatus_session_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *string;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint8_t buf[8];
  _QWORD applier[4];
  id v30;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xpc_dictionary_get_value(v3, "VPN");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "IPv4");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "IPv6");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "DNSServers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x212BC42B4]() == MEMORY[0x24BDACF78])
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __63__NPTVPNCollector_getExtendedStatus_session_completionHandler___block_invoke_2;
      applier[3] = &unk_24C991400;
      v30 = v4;
      xpc_array_apply(v8, applier);

    }
    v27 = v5;
    if (v5)
    {
      string = xpc_dictionary_get_string(v5, "RemoteAddress");
      if (string)
        goto LABEL_6;
      goto LABEL_28;
    }
    xpc_dictionary_get_value(v3, "IPSec");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "PPP");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      v24 = "RemoteAddress";
      v22 = v21;
    }
    else
    {
      if (!v22)
      {
        string = 0;
LABEL_27:

        if (string)
        {
LABEL_6:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
LABEL_7:
            xpc_dictionary_get_value(v6, "Addresses");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11 && xpc_array_get_count(v11) && (v13 = xpc_array_get_string(v12, 0)) != 0)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14 = 0;
            }

            if (v7)
              goto LABEL_16;
            goto LABEL_30;
          }
LABEL_29:
          v14 = 0;
          if (v7)
          {
LABEL_16:
            xpc_dictionary_get_value(v7, "Addresses");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17 && xpc_array_get_count(v17) && (v19 = xpc_array_get_string(v18, 0)) != 0)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v20 = 0;
            }

            goto LABEL_31;
          }
LABEL_30:
          v20 = 0;
LABEL_31:
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("vpn_dns_addresses"));
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("vpn_ipv4_address"));
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, CFSTR("vpn_ipv6_address"));
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("vpn_remote_address"));
          v25 = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

          goto LABEL_32;
        }
LABEL_28:
        v10 = 0;
        if (v6)
          goto LABEL_7;
        goto LABEL_29;
      }
      v24 = "CommRemoteAddress";
    }
    string = xpc_dictionary_get_string(v22, v24);
    goto LABEL_27;
  }
  +[NPTLogger metadata](NPTLogger, "metadata");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E71B000, v15, OS_LOG_TYPE_DEFAULT, "Extended session could not be populated", buf, 2u);
  }

  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v14);
LABEL_32:

}

uint64_t __63__NPTVPNCollector_getExtendedStatus_session_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (MEMORY[0x212BC42B4]() == MEMORY[0x24BDACFF0])
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_string_get_string_ptr(v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return 1;
}

- (void)vpnNotificationReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NPTMetadataEvent *v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  NSObject *v24;
  dispatch_time_t v25;
  void *v26;
  NPTVPNCollector *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  uint64_t v33;
  uint64_t v34;
  intptr_t (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  dispatch_semaphore_t v38;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(NPTMetadataEvent);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "name");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 == CFSTR("com.apple.networkextension.app-configuration-changed"))
  {
    v11 = 4;
  }
  else
  {
    objc_msgSend(v4, "name");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v10 == CFSTR("com.apple.networkextension.statuschanged"))
      v11 = 5;
    else
      v11 = 6;
  }
  -[NPTMetadataEvent setEventType:](v7, "setEventType:", v11);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetadataEvent setTimeStamp:](v7, "setTimeStamp:", v12);

  -[NPTMetadataEvent setCollectorType:](v7, "setCollectorType:", objc_opt_class());
  v13 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v13, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("vpn_enabled"));

  objc_msgSend(v6, "protocolConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("vpn_protocol"));

  objc_msgSend(v6, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTVPNCollector getVPNStatusAsString:](self, "getVPNStatusAsString:", objc_msgSend(v17, "status"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("vpn_status"));

  objc_msgSend(v6, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "connectedDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("vpn_connected_date"));

  -[NPTVPNCollector config](self, "config");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = dispatch_semaphore_create(0);
    v33 = MEMORY[0x24BDAC760];
    v34 = 3221225472;
    v35 = __43__NPTVPNCollector_vpnNotificationReceived___block_invoke;
    v36 = &unk_24C991360;
    v37 = v8;
    v38 = v23;
    v24 = v23;
    -[NPTVPNCollector collectVPNAddressesWithCompletion:](self, "collectVPNAddressesWithCompletion:", &v33);
    v25 = dispatch_walltime(0, 500000000);
    dispatch_semaphore_wait(v24, v25);

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8, v33, v34, v35, v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetadataEvent setData:](v7, "setData:", v26);

  v27 = self;
  objc_sync_enter(v27);
  -[NPTVPNCollector cachedMetadata](v27, "cachedMetadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("events"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetadataEvent asDictionary](v7, "asDictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v30);

  objc_sync_exit(v27);
  -[NPTVPNCollector metadataDidChangeHandler](v27, "metadataDidChangeHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[NPTVPNCollector metadataDidChangeHandler](v27, "metadataDidChangeHandler");
    v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NPTMetadataEvent *, _QWORD))v32)[2](v32, v7, 0);

  }
}

intptr_t __43__NPTVPNCollector_vpnNotificationReceived___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)stopCollecting
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[NPTVPNCollector setManager:](self, "setManager:", 0);
}

+ (id)collectorName
{
  return CFSTR("vpn");
}

- (id)getVPNStatusAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("Unknown");
  else
    return off_24C991448[a3];
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NEVPNManager)manager
{
  return (NEVPNManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NEConfigurationManager)configManager
{
  return (NEConfigurationManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NEConfiguration)config
{
  return (NEConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)backgroundQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBackgroundQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)eventsToMonitor
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEventsToMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsToMonitor, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);
  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end
