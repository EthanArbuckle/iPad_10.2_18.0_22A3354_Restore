@implementation _DKSync3Coordinator

- (_DKSync3Coordinator)initWithContext:(id)a3
{
  _DKSync3Coordinator *v3;
  _DKSync3Coordinator *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  _DKSync3Coordinator *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DKSync3Coordinator;
  v3 = -[_DKSync2Coordinator initWithContext:](&v12, sel_initWithContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_watchingDeviceTypes = 0xFFFFLL;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE1B1C0];
    objc_msgSend(MEMORY[0x24BE1B128], "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39___DKSync3Coordinator_initWithContext___block_invoke;
    v10[3] = &unk_24DD8C9E0;
    v11 = v4;
    v8 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, v7, v10);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE1B1C0], 0);

  v4.receiver = self;
  v4.super_class = (Class)_DKSync3Coordinator;
  -[_DKSync2Coordinator dealloc](&v4, sel_dealloc);
}

- (void)_syncEnabledToggle
{
  NSObject *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v5.receiver = self;
  v5.super_class = (Class)_DKSync3Coordinator;
  -[_DKSync2Coordinator _syncEnabledToggle](&v5, sel__syncEnabledToggle);
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setRemoteUserContextProxy:", self);

}

- (void)_syncDisabledToggle
{
  NSObject *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)_DKSync3Coordinator;
  -[_DKSync2Coordinator _syncDisabledToggle](&v4, sel__syncDisabledToggle);
}

- (void)setupStorage
{
  NSObject *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  _DKSyncRemoteContextStorage *v8;
  _DKSyncRemoteContextStorage *transportMDCSRapport;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10.receiver = self;
  v10.super_class = (Class)_DKSync3Coordinator;
  -[_DKSync2Coordinator setupStorage](&v10, sel_setupStorage);
  -[_DKSync2Coordinator policyForSyncTransportType:](self, "policyForSyncTransportType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "syncDisabled") & 1) != 0)
  {

    goto LABEL_4;
  }
  v5 = objc_msgSend(MEMORY[0x24BE1B108], "rapportSyncDisabled");

  if ((v5 & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_21AA79000, v6, OS_LOG_TYPE_INFO, "%{public}@: Rapport context store transport disabled by policy", buf, 0xCu);

    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE1B120], "sharedInstance");
    v8 = (_DKSyncRemoteContextStorage *)objc_claimAutoreleasedReturnValue();
    transportMDCSRapport = self->_transportMDCSRapport;
    self->_transportMDCSRapport = v8;

    -[_DKSyncRemoteContextStorage setDelegate:](self->_transportMDCSRapport, "setDelegate:", self);
  }
LABEL_8:

}

- (void)start
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_21AA79000, v1, v2, "%{public}@: Will start transport Rapport for Mutli-Device Context Store", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (id)multiDeviceContextStoreDevices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const __CFString *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B118], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "peersWithActiveTransports:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
        objc_msgSend(v9, "version");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;

        if (v12 > 1.0)
        {
          v13 = objc_alloc(MEMORY[0x24BE1B1A8]);
          objc_msgSend(v9, "sourceDeviceID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "model");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v13, "initWithName:deviceID:model:companion:", &stru_24DD8CBD0, v14, v15, objc_msgSend(v9, "isCompanion"));

          if (v16)
          {
            objc_msgSend(v3, "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v9, "me");
              v19 = CFSTR("pseudo ");
              if (!v18)
                v19 = &stru_24DD8CBD0;
              v28 = v19;
              objc_msgSend(v9, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "model");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = &stru_24DD8CBD0;
              if (v20)
              {
                v26 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v9, "model");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "stringWithFormat:", CFSTR(" (%@)"), v27);
                v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v21 = v25;
              }
              *(_DWORD *)buf = 138544130;
              v36 = v29;
              v37 = 2114;
              v38 = v28;
              v39 = 2114;
              v40 = v30;
              v41 = 2114;
              v42 = v21;
              _os_log_debug_impl(&dword_21AA79000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to convert %{public}@peer %{public}@%{public}@ to device, skipping", buf, 0x2Au);
              if (v20)
              {

              }
            }

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      v6 = v22;
    }
    while (v22);
  }

  return v3;
}

- (void)handleStatusChangeForPeer:(id)a3 previousTransports:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v21.receiver = self;
  v21.super_class = (Class)_DKSync3Coordinator;
  -[_DKSync2Coordinator handleStatusChangeForPeer:previousTransports:](&v21, sel_handleStatusChangeForPeer_previousTransports_, v6, a4);
  if (!self->_watchingDeviceTypes)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:].cold.1(self, v6, v11);
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BE1B118], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "activeTransportsForPeer:", v6);

  v10 = (v9 & 1) == 0;
  if (((a4 ^ v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v11 = objc_claimAutoreleasedReturnValue();
    if ((a4 & 1) != 0 || (v9 & 1) == 0)
    {
      if ((a4 & v10) == 0)
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:].cold.2(self, v6, v16);

      v17 = objc_alloc(MEMORY[0x24BE1B1A8]);
      objc_msgSend(v6, "sourceDeviceID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "model");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v17, "initWithName:deviceID:model:companion:", &stru_24DD8CBD0, v18, v19, objc_msgSend(v6, "isCompanion"));

      v22[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v14 = objc_claimAutoreleasedReturnValue();
      -[_DKSync2Coordinator deviceUUID](self, "deviceUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject deactivateDevices:remoteUserContextProxySourceDeviceUUID:](v11, "deactivateDevices:remoteUserContextProxySourceDeviceUUID:", v14, v20);

    }
    else
    {
      -[_DKSync3Coordinator multiDeviceContextStoreDevices](self, "multiDeviceContextStoreDevices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15)
          -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:].cold.4();

        -[_DKSync2Coordinator deviceUUID](self, "deviceUUID");
        v14 = objc_claimAutoreleasedReturnValue();
        -[NSObject activateDevices:remoteUserContextProxySourceDeviceUUID:](v11, "activateDevices:remoteUserContextProxySourceDeviceUUID:", v12, v14);
      }
      else if (v15)
      {
        -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:].cold.3();
      }
    }

    goto LABEL_18;
  }
LABEL_19:

}

- (void)handleContextChangedNotification:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __CFString *v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  __CFString *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_DKSync3Coordinator handleContextChangedNotification:].cold.1();

  v34 = v3;
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE1B1D0]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE1B1C8]);
  v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString objectForKeyedSubscript:](v51, "objectForKeyedSubscript:", *MEMORY[0x24BE1B1D8]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(MEMORY[0x24BE1B118], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "peersWithActiveTransports:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v56;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v11), "sourceDeviceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(MEMORY[0x24BE1B118], "sharedInstance");
          v13 = objc_claimAutoreleasedReturnValue();
          -[NSObject existingPeerWithSourceDeviceID:](v13, "existingPeerWithSourceDeviceID:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = -[NSObject activeTransportsForPeer:](v13, "activeTransportsForPeer:", v14);
            objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
            if ((v15 & 1) != 0)
            {
              if (v17)
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v14, "me");
                v29 = CFSTR("pseudo ");
                if (!v28)
                  v29 = &stru_24DD8CBD0;
                v46 = v29;
                objc_msgSend(v14, "identifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "model");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = &stru_24DD8CBD0;
                if (v30)
                {
                  v38 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v14, "model");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "stringWithFormat:", CFSTR(" (%@)"), v40);
                  v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v31 = v37;
                }
                *(_DWORD *)buf = 138544386;
                v61 = v50;
                v62 = 2114;
                v63 = v46;
                v64 = 2114;
                v65 = v48;
                v66 = 2114;
                v67 = v31;
                v68 = 2112;
                v69 = v51;
                _os_log_debug_impl(&dword_21AA79000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Forwarding context changed notification to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
                if (v30)
                {

                }
              }

              v26 = (void *)MEMORY[0x24BDBCF20];
              v59 = v52;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
              v16 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setWithArray:", v16);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DKSync3Coordinator sendContextValuesToPeer:registrationIdentifier:keyPaths:](self, "sendContextValuesToPeer:registrationIdentifier:keyPaths:", v14, v53, v27);

            }
            else if (v17)
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v14, "me");
              v19 = CFSTR("pseudo ");
              if (!v18)
                v19 = &stru_24DD8CBD0;
              v44 = v19;
              objc_msgSend(v14, "identifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "model");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = &stru_24DD8CBD0;
              if (v20)
              {
                v36 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v14, "model");
                v39 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "stringWithFormat:", CFSTR(" (%@)"), v39);
                v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v21 = v35;
              }
              *(_DWORD *)buf = 138544386;
              v61 = v49;
              v62 = 2114;
              v63 = v44;
              v64 = 2114;
              v65 = v47;
              v66 = 2114;
              v67 = v21;
              v68 = 2112;
              v69 = v51;
              _os_log_debug_impl(&dword_21AA79000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Not forwarding context changed notification to unavailable %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
              if (v20)
              {

                v22 = (void *)v39;
                goto LABEL_27;
              }
              goto LABEL_28;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(0, "me");
              v24 = CFSTR("pseudo ");
              if (!v23)
                v24 = &stru_24DD8CBD0;
              v45 = v24;
              objc_msgSend(0, "identifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(0, "model");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = &stru_24DD8CBD0;
              if (v20)
              {
                v42 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(0, "model");
                v43 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "stringWithFormat:", CFSTR(" (%@)"), v43);
                v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v25 = v41;
              }
              *(_DWORD *)buf = 138544386;
              v61 = v49;
              v62 = 2114;
              v63 = v45;
              v64 = 2114;
              v65 = v47;
              v66 = 2114;
              v67 = v25;
              v68 = 2112;
              v69 = v51;
              _os_log_debug_impl(&dword_21AA79000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Not forwarding context changed notification to unknown %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
              if (v20)
              {

                v22 = (void *)v43;
LABEL_27:

              }
LABEL_28:

            }
          }

          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          goto LABEL_33;
        objc_msgSend((id)objc_opt_class(), "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v14;
        v62 = 2112;
        v63 = v51;
        _os_log_debug_impl(&dword_21AA79000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: No need to forward context changed notification: %@", buf, 0x16u);
LABEL_32:

LABEL_33:
        ++v11;
      }
      while (v9 != v11);
      v32 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
      v9 = v32;
    }
    while (v32);
  }

}

- (_DKSyncRemoteContextStorage)transportMDCSRapport
{
  return self->_transportMDCSRapport;
}

- (void)setTransportMDCSRapport:(id)a3
{
  objc_storeStrong((id *)&self->_transportMDCSRapport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportMDCSRapport, 0);
  objc_storeStrong((id *)&self->_watchingDevicesTransaction, 0);
}

- (BOOL)remoteContextStorage:(id)a3 hasKnowledgeOfKeyPath:(id)a4
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasKnowledgeOfContextualKeyPath:", v6);
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
        -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:].cold.2();
    }
    else if (v10)
    {
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:].cold.3();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:].cold.1();
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)remoteContextStorage:(id)a3 archivedObjectsForKeyPaths:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
    v7 = objc_claimAutoreleasedReturnValue();
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
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[_DKSync3Coordinator archivedObjectsForKeyPaths:](self, "archivedObjectsForKeyPaths:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:].cold.1();
    v14 = 0;
  }

  return v14;
}

- (void)remoteContextStorage:(id)a3 registrationIdentifier:(id)a4 setArchivedObjects:(id)a5 peer:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;

  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (a4 && v9 && v10)
  {
    -[_DKSync3Coordinator setArchivedObjects:peer:](self, "setArchivedObjects:peer:", v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:].cold.1();

  }
}

- (void)remoteContextStorage:(id)a3 subscribeToChangesWithPeer:(id)a4 registrationIdentifier:(id)a5 predicate:(id)a6
{
  void *v6;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  int v32;
  const __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id location;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v11 = a4;
  v12 = a5;
  v42 = a6;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "me"))
      v28 = CFSTR("pseudo ");
    else
      v28 = &stru_24DD8CBD0;
    objc_msgSend(v11, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "model");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v35 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR(" (%@)"), v6);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = &stru_24DD8CBD0;
    }
    *(_DWORD *)buf = 138544642;
    v50 = v27;
    v51 = 2114;
    v52 = v28;
    v53 = 2114;
    v54 = v29;
    v55 = 2114;
    v56 = v31;
    v57 = 2114;
    v58 = v42;
    v59 = 2114;
    v60 = v12;
    _os_log_debug_impl(&dword_21AA79000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Remote context storage has requested that %{public}@peer %{public}@%{public}@ be informed of changes to predicate %{public}@ using identifier %{public}@", buf, 0x3Eu);
    if (v30)
    {

    }
  }

  -[_DKSync3Coordinator registrationIdentifierForPeer:remoteRegistrationIdentifier:](self, "registrationIdentifierForPeer:remoteRegistrationIdentifier:", v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE1B1B0]), "initWithPlistDictionary:", v42);
  v17 = (void *)v16;
  if (v11 && v15 && v16)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v17, "keyPaths");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BE1B190];
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __141___DKSync3Coordinator__DKSyncRemoteContextStorageDelegate__remoteContextStorage_subscribeToChangesWithPeer_registrationIdentifier_predicate___block_invoke;
    v43[3] = &unk_24DD8CA30;
    objc_copyWeak(&v47, &location);
    v43[4] = self;
    v20 = v12;
    v44 = v20;
    v21 = v11;
    v45 = v21;
    v22 = v18;
    v46 = v22;
    objc_msgSend(v19, "registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:callback:", v15, v17, 0, 0, CFSTR("com.apple.coreduetd"), 1, v43);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerCallback:", v23);

    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v21, "me");
      v33 = &stru_24DD8CBD0;
      if (v32)
        v33 = CFSTR("pseudo ");
      v37 = v33;
      objc_msgSend(v21, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "model");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v36 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v21, "model");
        self = (_DKSync3Coordinator *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR(" (%@)"), self);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = &stru_24DD8CBD0;
      }
      *(_DWORD *)buf = 138544642;
      v50 = v39;
      v51 = 2114;
      v52 = v37;
      v53 = 2114;
      v54 = v38;
      v55 = 2114;
      v56 = v34;
      v57 = 2114;
      v58 = v17;
      v59 = 2114;
      v60 = v20;
      _os_log_debug_impl(&dword_21AA79000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully handled remote context storage requested that %{public}@peer %{public}@%{public}@ be informed of changes to predicate %{public}@ using identifier %{public}@", buf, 0x3Eu);
      if (v40)
      {

      }
    }

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:subscribeToChangesWithPeer:registrationIdentifier:predicate:].cold.1();

  }
}

- (void)remoteContextStorage:(id)a3 unsubscribeFromChangesWithPeer:(id)a4 registrationIdentifier:(id)a5 predicate:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  int v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B1B0]), "initWithPlistDictionary:", v11);
  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v9, "me");
    v26 = &stru_24DD8CBD0;
    v27 = CFSTR("pseudo ");
    if (!v25)
      v27 = &stru_24DD8CBD0;
    v34 = v27;
    objc_msgSend(v9, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "model");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "model");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR(" (%@)"), v32);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138544642;
    v38 = v36;
    v39 = 2114;
    v40 = v34;
    v41 = 2114;
    v42 = v28;
    v43 = 2114;
    v44 = v26;
    v45 = 2114;
    v46 = v11;
    v47 = 2114;
    v48 = v10;
    _os_log_debug_impl(&dword_21AA79000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Remote context storage has requested that %{public}@peer %{public}@%{public}@ no longer be informed of changes to predicate %{public}@ using identifier %{public}@", buf, 0x3Eu);
    if (v29)
    {

    }
  }

  -[_DKSync3Coordinator registrationIdentifierForPeer:remoteRegistrationIdentifier:](self, "registrationIdentifierForPeer:remoteRegistrationIdentifier:", v9, v10);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v9 && v15 && v13)
  {
    objc_msgSend(MEMORY[0x24BE1B190], "registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:callback:", v15, v13, 0, 0, CFSTR("com.apple.coreduetd"), 1, &__block_literal_global);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BE1B170], "userContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "deregisterCallback:", v17);

      objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v9, "me");
        v21 = &stru_24DD8CBD0;
        v22 = CFSTR("pseudo ");
        if (!v20)
          v22 = &stru_24DD8CBD0;
        v33 = v22;
        objc_msgSend(v9, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "model");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v31 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v9, "model");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR(" (%@)"), v32);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138544642;
        v38 = v35;
        v39 = 2114;
        v40 = v33;
        v41 = 2114;
        v42 = v23;
        v43 = 2114;
        v44 = v21;
        v45 = 2114;
        v46 = v13;
        v47 = 2114;
        v48 = v10;
        _os_log_debug_impl(&dword_21AA79000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully handled remote context storage requested that %{public}@peer %{public}@%{public}@ no longer be informed of changes to predicate %{public}@ using identifier %{public}@", buf, 0x3Eu);
        if (v24)
        {

        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:unsubscribeFromChangesWithPeer:registrationIdentifier:predicate:].cold.1();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:].cold.1();
  }

}

- (void)subscribeToContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BE1B128];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __128___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_handler___block_invoke;
  v15[3] = &unk_24DD8CA98;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performSyncBlock:", v15);

}

- (void)unsubscribeFromContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BE1B128];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __132___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_handler___block_invoke;
  v15[3] = &unk_24DD8CA98;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performSyncBlock:", v15);

}

- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:(unint64_t)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BE1B128];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __116___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToDeviceStatusChangeNotificationsForDeviceTypes_handler___block_invoke;
  v9[3] = &unk_24DD8CAC0;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performSyncBlock:", v9);

}

- (BOOL)subscribeToContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DKSyncRemoteContextStorage *transportMDCSRapport;
  void *v19;
  void *v20;
  NSObject *v21;
  id v23;
  NSObject *obj;
  void *v25;
  _QWORD v26[6];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) subscribeToContextValueChangeNotificationsWithRegistration:deviceIDs:error:].cold.3();

  if (objc_msgSend(v7, "isMultiDeviceRegistration"))
  {
    v23 = v8;
    -[_DKSync3Coordinator peersForContextStoreDeviceIDs:](self, "peersForContextStoreDeviceIDs:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v11;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v16);
          transportMDCSRapport = self->_transportMDCSRapport;
          objc_msgSend(v7, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "plistDictionary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke;
          v26[3] = &unk_24DD8CAE8;
          v26[4] = self;
          v26[5] = v17;
          v27 = v7;
          v28 = v25;
          -[_DKSyncRemoteContextStorage subscribeToContextValueChangeNotificationsFromPeer:registrationIdentifier:predicate:highPriority:completion:](transportMDCSRapport, "subscribeToContextValueChangeNotificationsFromPeer:registrationIdentifier:predicate:highPriority:completion:", v17, v19, v20, 1, v26);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
    }

    v8 = v23;
    if (!-[NSObject count](obj, "count"))
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[_DKSync3Coordinator(_CDRemoteUserContextServer) subscribeToContextValueChangeNotificationsWithRegistration:deviceIDs:error:].cold.1();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[_DKSync3Coordinator(_CDRemoteUserContextServer) subscribeToContextValueChangeNotificationsWithRegistration:deviceIDs:error:].cold.2();
  }

  return 1;
}

- (BOOL)unsubscribeFromContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DKSyncRemoteContextStorage *transportMDCSRapport;
  void *v19;
  void *v20;
  NSObject *v21;
  id v23;
  NSObject *obj;
  _QWORD v25[6];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) unsubscribeFromContextValueChangeNotificationsWithRegistration:deviceIDs:error:].cold.3();

  if (objc_msgSend(v7, "isMultiDeviceRegistration"))
  {
    v23 = v8;
    -[_DKSync3Coordinator peersForContextStoreDeviceIDs:](self, "peersForContextStoreDeviceIDs:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v11;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16);
          transportMDCSRapport = self->_transportMDCSRapport;
          objc_msgSend(v7, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "plistDictionary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke;
          v25[3] = &unk_24DD8CB10;
          v25[4] = self;
          v25[5] = v17;
          v26 = v7;
          -[_DKSyncRemoteContextStorage unsubscribeFromContextValueChangeNotificationsFromPeer:registrationIdentifier:predicate:highPriority:completion:](transportMDCSRapport, "unsubscribeFromContextValueChangeNotificationsFromPeer:registrationIdentifier:predicate:highPriority:completion:", v17, v19, v20, 1, v25);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v14);
    }

    if (!-[NSObject count](obj, "count"))
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[_DKSync3Coordinator(_CDRemoteUserContextServer) unsubscribeFromContextValueChangeNotificationsWithRegistration:deviceIDs:error:].cold.1();

    }
    v8 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[_DKSync3Coordinator(_CDRemoteUserContextServer) unsubscribeFromContextValueChangeNotificationsWithRegistration:deviceIDs:error:].cold.2();
  }

  return 1;
}

- (BOOL)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:(unint64_t)a3 error:(id *)a4
{
  NSObject *v6;
  NSObject *v7;
  unint64_t watchingDeviceTypes;
  OS_os_transaction *v9;
  OS_os_transaction *watchingDevicesTransaction;

  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) subscribeToDeviceStatusChangeNotificationsForDeviceTypes:error:].cold.1();

  watchingDeviceTypes = self->_watchingDeviceTypes;
  if (a3)
  {
    if (!watchingDeviceTypes)
    {
      v9 = (OS_os_transaction *)os_transaction_create();
      watchingDevicesTransaction = self->_watchingDevicesTransaction;
      self->_watchingDevicesTransaction = v9;
LABEL_8:

    }
  }
  else if (watchingDeviceTypes)
  {
    watchingDevicesTransaction = self->_watchingDevicesTransaction;
    self->_watchingDevicesTransaction = 0;
    goto LABEL_8;
  }
  self->_watchingDeviceTypes = a3;
  return 1;
}

- (void)fetchPropertiesOfRemoteKeyPaths:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE1B128];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91___DKSync3Coordinator__CDRemoteUserContextServer__fetchPropertiesOfRemoteKeyPaths_handler___block_invoke;
  v11[3] = &unk_24DD8CB60;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performSyncBlock:", v11);

}

- (void)_fetchPropertiesOfRemoteKeyPaths:(id)a3 handler:(id)a4
{
  id v5;
  void (**v6)(id, id);
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _DKSyncRemoteContextStorage *transportMDCSRapport;
  id v23;
  id v24;
  NSObject *v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void (**v44)(id, id);
  uint64_t v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void (**v53)(id, id);
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) _fetchPropertiesOfRemoteKeyPaths:handler:].cold.1((uint64_t)self, v5, v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v13);
    goto LABEL_29;
  }
  v43 = v9;
  v44 = v6;
  v33 = v5;
  -[_DKSync3Coordinator keyPathsByDeviceIDFromRemoteKeyPaths:](self, "keyPathsByDeviceIDFromRemoteKeyPaths:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(MEMORY[0x24BE1B118], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
  if (!v14)
    goto LABEL_27;
  v15 = v14;
  v45 = *(_QWORD *)v55;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v55 != v45)
        objc_enumerationMutation(v13);
      v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v16);
      objc_msgSend(v46, "existingPeerWithSourceDeviceID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v18, "me");
          v27 = &stru_24DD8CBD0;
          v28 = CFSTR("pseudo ");
          if (!v26)
            v28 = &stru_24DD8CBD0;
          v36 = v28;
          objc_msgSend(v18, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "model");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v29 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v18, "model");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR(" (%@)"), v35);
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v27 = v34;
          }
          _CDPrettyPrintCollection();
          v30 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v59 = v41;
          v60 = 2112;
          v61 = v40;
          v62 = 2114;
          v63 = v36;
          v64 = 2114;
          v65 = v39;
          v66 = 2114;
          v67 = v27;
          v68 = 2114;
          v37 = (void *)v30;
          v69 = v30;
          _os_log_debug_impl(&dword_21AA79000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching properties of %@ key paths from %{public}@peer %{public}@%{public}@: %{public}@", buf, 0x3Eu);
          if (v38)
          {

          }
        }

        transportMDCSRapport = self->_transportMDCSRapport;
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __92___DKSync3Coordinator__CDRemoteUserContextServer___fetchPropertiesOfRemoteKeyPaths_handler___block_invoke;
        v47[3] = &unk_24DD8CB88;
        v47[4] = self;
        v48 = v20;
        v23 = v18;
        v49 = v23;
        v50 = v43;
        v51 = v12;
        v52 = v17;
        v53 = v44;
        v24 = v20;
        -[_DKSyncRemoteContextStorage fetchContextValuesFromPeer:forKeyPaths:highPriority:completion:](transportMDCSRapport, "fetchContextValuesFromPeer:forKeyPaths:highPriority:completion:", v23, v24, 1, v47);

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v31;
        v60 = 2114;
        v61 = v17;
        _os_log_error_impl(&dword_21AA79000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch properties of key paths due to unknown peer: %{public}@", buf, 0x16u);

      }
      objc_msgSend(v12, "removeObject:", v17);
      if (!objc_msgSend(v12, "count"))
      {
        objc_msgSend(v43, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v44[2](v44, v19);
LABEL_12:

      }
      ++v16;
    }
    while (v15 != v16);
    v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    v15 = v32;
  }
  while (v32);
LABEL_27:

  v5 = v33;
  v9 = v43;
  v6 = v44;
LABEL_29:

}

- (void)requestActivateDevicesWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE1B128];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __85___DKSync3Coordinator__CDRemoteUserContextServer__requestActivateDevicesWithHandler___block_invoke;
  v7[3] = &unk_24DD8CBB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsyncBlock:", v7);

}

- (void)_requestActivateDevicesWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;

  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) _requestActivateDevicesWithHandler:].cold.3();

  -[_DKSync3Coordinator multiDeviceContextStoreDevices](self, "multiDeviceContextStoreDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:].cold.4();

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v9 = objc_claimAutoreleasedReturnValue();
    -[_DKSync2Coordinator deviceUUID](self, "deviceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject activateDevices:remoteUserContextProxySourceDeviceUUID:](v9, "activateDevices:remoteUserContextProxySourceDeviceUUID:", v7, v11);

  }
  else if (v10)
  {
    -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:].cold.3();
  }

  if (v4)
    v4[2](v4, 0);

}

- (id)keyPathsByDeviceIDFromRemoteKeyPaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "deviceID", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
          }
          objc_msgSend(v10, "key");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)archivedObjectsForKeyPaths:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  void *v23;
  id obj;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) archivedObjectsForKeyPaths:].cold.1((uint64_t)self, v3);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
  if (v6)
  {
    v25 = *(_QWORD *)v29;
    *(_QWORD *)&v7 = 138412290;
    v21 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v5, "objectForContextualKeyPath:", v9, v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastModifiedDateForContextualKeyPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v27 = 0;
          objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v27);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v27;
          if (v14)
          {
            objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "domain");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v14, "code");
              *(_DWORD *)buf = 138544386;
              v33 = v23;
              v34 = 2112;
              v35 = v12;
              v36 = 2114;
              v37 = v18;
              v38 = 2048;
              v39 = v19;
              v40 = 2112;
              v41 = v14;
              _os_log_error_impl(&dword_21AA79000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to archive context object for %@: %{public}@:%lld (%@)", buf, 0x34u);

            }
          }

        }
        else
        {
          v13 = 0;
        }
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13)
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("object"));
        if (v11)
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, CFSTR("modified"));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    }
    while (v6);
  }

  return v26;
}

- (void)setArchivedObjects:(id)a3 peer:(id)a4
{
  void *v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  __CFString *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v37 = a4;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "me"))
      v30 = CFSTR("pseudo ");
    else
      v30 = &stru_24DD8CBD0;
    objc_msgSend(v37, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "model");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v34 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v37, "model");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR(" (%@)"), v4);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = &stru_24DD8CBD0;
    }
    *(_DWORD *)buf = 138544386;
    v48 = v28;
    v49 = 2112;
    v50 = (uint64_t)v29;
    v51 = 2114;
    v52 = v30;
    v53 = 2114;
    v54 = (uint64_t)v31;
    v55 = 2114;
    v56 = v33;
    _os_log_debug_impl(&dword_21AA79000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Setting %@ archived objects from %{public}@peer %{public}@%{public}@", buf, 0x34u);
    if (v32)
    {

    }
  }

  objc_msgSend(MEMORY[0x24BE1B188], "supportedContextValueClasses");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v39)
  {
    v9 = 0;
    goto LABEL_25;
  }
  v9 = 0;
  v38 = *(_QWORD *)v43;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v43 != v38)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v10);
      objc_msgSend(obj, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("object"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("modified"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v15 = 0;
LABEL_13:
        objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", v11);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x24BE1B198];
        objc_msgSend(v37, "sourceDeviceID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "remoteKeyPathForKeyPath:forDeviceID:", v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "setObject:lastModifiedDate:forContextualKeyPath:", v15, v14, v21);
        goto LABEL_14;
      }
      v41 = v9;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v35, v13, &v41);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v16 = v41;

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString domain](v16, "domain");
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v24 = -[__CFString code](v16, "code");
          *(_DWORD *)buf = 138544386;
          v48 = v22;
          v49 = 2112;
          v50 = (uint64_t)v11;
          v51 = 2114;
          v52 = v23;
          v53 = 2048;
          v54 = v24;
          v55 = 2112;
          v56 = v16;
          _os_log_error_impl(&dword_21AA79000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive context object for %@: %{public}@:%lld (%@)", buf, 0x34u);

        }
        v9 = v16;
        goto LABEL_13;
      }
      if (-[__CFString conformsToProtocol:](v15, "conformsToProtocol:", &unk_25510F868)
        && (-[__CFString conformsToProtocol:](v15, "conformsToProtocol:", &unk_25510F910) & 1) != 0)
      {
        v9 = 0;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v48 = v25;
        v49 = 2114;
        v50 = v26;
        v51 = 2112;
        v52 = v15;
        _os_log_error_impl(&dword_21AA79000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Rejecting invalid object of class %{public}@ for not implementing protocols: %@", buf, 0x20u);

      }
      v9 = 0;
LABEL_14:

      ++v10;
    }
    while (v39 != v10);
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    v39 = v27;
  }
  while (v27);
LABEL_25:

}

- (void)sendContextValuesToPeer:(id)a3 registrationIdentifier:(id)a4 keyPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _DKSyncRemoteContextStorage *transportMDCSRapport;
  int v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  int v23;
  __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  __CFString *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BE1B128], "underlyingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "me");
    v17 = &stru_24DD8CBD0;
    v18 = CFSTR("pseudo ");
    if (!v16)
      v18 = &stru_24DD8CBD0;
    v33 = v18;
    objc_msgSend(v8, "identifier");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "model");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "model");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR(" (%@)"), v31);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "valueForKey:", CFSTR("key"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPrettyPrintCollection();
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v43 = v37;
    v44 = 2114;
    v45 = v33;
    v46 = 2114;
    v47 = v35;
    v48 = 2114;
    v49 = v17;
    v50 = 2114;
    v51 = v22;
    _os_log_debug_impl(&dword_21AA79000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Sending context values to %{public}@peer %{public}@%{public}@ for key paths: %{public}@", buf, 0x34u);

    if (v19)
    {

    }
  }

  if (v8 && v9 && objc_msgSend(v10, "count"))
  {
    -[_DKSync3Coordinator archivedObjectsForKeyPaths:](self, "archivedObjectsForKeyPaths:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSObject count](v13, "count"));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v8, "me");
      v24 = &stru_24DD8CBD0;
      v25 = CFSTR("pseudo ");
      if (!v23)
        v25 = &stru_24DD8CBD0;
      v32 = v25;
      objc_msgSend(v8, "identifier");
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "model");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v8, "model");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR(" (%@)"), v30);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "valueForKey:", CFSTR("key"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _CDPrettyPrintCollection();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v43 = v38;
      v44 = 2112;
      v45 = v36;
      v46 = 2114;
      v47 = v32;
      v48 = 2114;
      v49 = v34;
      v50 = 2114;
      v51 = v24;
      v52 = 2114;
      v53 = v29;
      _os_log_debug_impl(&dword_21AA79000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ context values to send to %{public}@peer %{public}@%{public}@ for key paths: %{public}@", buf, 0x3Eu);

      if (v26)
      {

      }
    }

    transportMDCSRapport = self->_transportMDCSRapport;
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke;
    v39[3] = &unk_24DD8CB10;
    v39[4] = self;
    v40 = v8;
    v41 = v10;
    -[_DKSyncRemoteContextStorage sendContextValuesToPeer:registrationIdentifier:archivedObjects:highPriority:completion:](transportMDCSRapport, "sendContextValuesToPeer:registrationIdentifier:archivedObjects:highPriority:completion:", v40, v9, v13, 1, v39);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_DKSync3Coordinator(_CDRemoteUserContextServer) sendContextValuesToPeer:registrationIdentifier:keyPaths:].cold.1();
  }

}

- (id)registrationIdentifierForPeer:(id)a3 remoteRegistrationIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sourceDeviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v6 && v7)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "sourceDeviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ for device %@"), v6, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)peersForContextStoreDeviceIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B118], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    v11 = 0x24BE1A000uLL;
    *(_QWORD *)&v8 = 138543618;
    v18 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "existingPeerWithSourceDeviceID:", v13, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v4, "addObject:", v14);
        }
        else
        {
          objc_msgSend(*(id *)(v11 + 4040), "syncChannel");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v18;
            v24 = v16;
            v25 = 2112;
            v26 = v13;
            _os_log_error_impl(&dword_21AA79000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unknown peer context store device id: %@", buf, 0x16u);

            v11 = 0x24BE1A000;
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v9);
  }

  return v4;
}

- (void)handleStatusChangeForPeer:previousTransports:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_21AA79000, v1, v2, "%{public}@: No devices to activate via client context", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)handleStatusChangeForPeer:previousTransports:.cold.4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_12();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKeyPath:", CFSTR("deviceID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  _CDPrettyPrintCollection();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21AA79000, v4, v5, "%{public}@: Will activate devices via client context: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)handleContextChangedNotification:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0(&dword_21AA79000, v1, v2, "%{public}@: Received context changed notification: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
