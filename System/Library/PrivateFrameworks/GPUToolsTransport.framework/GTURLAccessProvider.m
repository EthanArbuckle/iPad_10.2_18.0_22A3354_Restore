@implementation GTURLAccessProvider

- (GTURLAccessProvider)initWithServiceProvider:(id)a3 connectionProvider:(id)a4 serviceVendor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  GTURLAccessProvider *v13;
  GTURLAccessProvider *v14;
  os_log_t v15;
  OS_os_log *log;
  uint64_t v17;
  NSMutableDictionary *registeredURLs;
  uint64_t v19;
  NSString *deviceUDID;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    v22.receiver = self;
    v22.super_class = (Class)GTURLAccessProvider;
    v14 = -[GTURLAccessProvider init](&v22, sel_init);
    if (v14)
    {
      v15 = os_log_create("com.apple.gputools.transport", "URLAccessProvider");
      log = v14->_log;
      v14->_log = (OS_os_log *)v15;

      v17 = objc_opt_new();
      registeredURLs = v14->_registeredURLs;
      v14->_registeredURLs = (NSMutableDictionary *)v17;

      +[GTDeviceProperties uniqueDeviceID](GTDeviceProperties, "uniqueDeviceID");
      v19 = objc_claimAutoreleasedReturnValue();
      deviceUDID = v14->_deviceUDID;
      v14->_deviceUDID = (NSString *)v19;

      objc_storeStrong((id *)&v14->_serviceProvider, a3);
      objc_storeStrong((id *)&v14->_connectionProvider, a4);
      objc_storeStrong((id *)&v14->_serviceVendor, a5);
    }
    self = v14;
    v13 = self;
  }

  return v13;
}

- (id)urlForPath:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_registeredURLs;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (BOOL)_sharesFileSystemWith:(id)a3 remoteConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  GTServiceVendor *serviceVendor;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (-[NSString isEqualToString:](self->_deviceUDID, "isEqualToString:", v6))
    {
      v9 = 1;
    }
    else
    {
      -[GTServiceProvider allServices](self->_serviceProvider, "allServices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      filteredArrayByService(v10, (Protocol *)&unk_255D60690);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      serviceVendor = self->_serviceVendor;
      objc_msgSend(v12, "serviceProperties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GTServiceVendor getSimulatorDeviceBrowserService:](serviceVendor, "getSimulatorDeviceBrowserService:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v15, "isSimulatorDevice:", v6);
    }
  }

  return v9;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *log;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  GTURLAccessProviderXPCProxy *v32;
  void *v33;
  GTURLAccessProviderXPCProxy *v34;
  id *v35;
  id v36;
  id *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  NSString *deviceUDID;
  _QWORD v48[5];
  id v49;
  void (**v50)(id, void *);
  _QWORD v51[5];
  id v52;
  void (**v53)(id, void *);
  _QWORD v54[5];
  id v55;
  void (**v56)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = v6;
  if (!v8)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("gtsandboxid"));

  if (v10 && (objc_msgSend(v8, "host"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:].cold.6();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

        log = self->_log;
        if (v17)
        {
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:].cold.4();
          v7[2](v7, v14);
LABEL_37:

          goto LABEL_17;
        }
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:].cold.5();

        -[NSMutableDictionary removeObjectForKey:](self->_registeredURLs, "removeObjectForKey:", v8);
      }
      objc_msgSend(v8, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GTConnectionProvider connectionForDeviceUDID:](self->_connectionProvider, "connectionForDeviceUDID:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        allServicesForDeviceUDID(v27, v14);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        filteredArrayByService(v29, (Protocol *)&unk_255D647A0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = [GTURLAccessProviderXPCProxy alloc];
          objc_msgSend(v31, "serviceProperties");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[GTURLAccessProviderXPCProxy initWithConnection:remoteProperties:](v32, "initWithConnection:remoteProperties:", v28, v33);

          if (-[GTURLAccessProvider _sharesFileSystemWith:remoteConnection:](self, "_sharesFileSystemWith:remoteConnection:", v14, v28))
          {
            v54[0] = MEMORY[0x24BDAC760];
            v54[1] = 3221225472;
            v54[2] = __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke;
            v54[3] = &unk_24F827AB0;
            v54[4] = self;
            v35 = &v55;
            v36 = v8;
            v55 = v36;
            v37 = (id *)&v56;
            v56 = v7;
            -[GTURLAccessProviderXPCProxy securityScopedURLFromSandboxID:completionHandler:](v34, "securityScopedURLFromSandboxID:completionHandler:", v36, v54);
          }
          else
          {
            v46 = objc_opt_respondsToSelector();
            deviceUDID = self->_deviceUDID;
            if ((v46 & 1) != 0)
            {
              v51[0] = MEMORY[0x24BDAC760];
              v51[1] = 3221225472;
              v51[2] = __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_2;
              v51[3] = &unk_24F827AD8;
              v51[4] = self;
              v35 = (id *)&v53;
              v53 = v7;
              v37 = &v52;
              v52 = v8;
              -[GTURLAccessProviderXPCProxy copyIdentifier:toDevice:completionHandler:](v34, "copyIdentifier:toDevice:completionHandler:", v52, deviceUDID, v51);
            }
            else
            {
              v48[0] = MEMORY[0x24BDAC760];
              v48[1] = 3221225472;
              v48[2] = __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_36;
              v48[3] = &unk_24F827B00;
              v48[4] = self;
              v35 = (id *)&v50;
              v50 = v7;
              v37 = &v49;
              v49 = v8;
              -[GTURLAccessProviderXPCProxy transferIdentifier:toDevice:completionHandler:](v34, "transferIdentifier:toDevice:completionHandler:", v49, deviceUDID, v48);
            }
          }

        }
        else
        {
          v38 = self->_log;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);
          v7[2](v7, 0);
        }

      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:].cold.2();
        v7[2](v7, 0);
      }

      goto LABEL_37;
    }
  }
  else
  {
LABEL_13:

  }
  v19 = self->_log;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  v7[2](v7, 0);
LABEL_17:

}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v3, a1[5]);
  (*(void (**)(void))(a1[6] + 16))();

}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("gtsandboxid"));

    if (v8)
      objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", v5);
    else
      LocalArchiveURLFromRemoteURL(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v10, a1[5]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    v9 = *(NSObject **)(a1[4] + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_2_cold_1(v9, v6);
    (*(void (**)(void))(a1[6] + 16))();
  }

}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_36(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    LocalArchiveURLFromRemoteURL(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v5, a1[5]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    v6 = *(NSObject **)(a1[4] + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_36_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (id)makeURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  ++makeURL__urlNumber;
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@/%@?id=%u"), CFSTR("gtsandboxid"), self->_deviceUDID, v7, makeURL__urlNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredURLs, "setObject:forKeyedSubscript:", v4, v9);

  return v9;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__GTURLAccessProvider_transferIdentifier_toDevice_completionHandler___block_invoke;
  v10[3] = &unk_24F827B28;
  v11 = v8;
  v9 = v8;
  -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:](self, "copyIdentifier:toDevice:allowLocalURL:completionHandler:", a3, a4, 0, v10);

}

uint64_t __69__GTURLAccessProvider_transferIdentifier_toDevice_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:](self, "copyIdentifier:toDevice:allowLocalURL:completionHandler:", a3, a4, 1, a5);
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 allowLocalURL:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  GTURLAccessProvider *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  GTURLAccessProvider *v18;
  void *v19;
  GTFileWriterServiceXPCProxy *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  GTFileEntry *v39;
  GTFileEntry *v40;
  id v41;
  void *v42;
  id v43;
  GTFileEntry *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSString *deviceUDID;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  GTURLAccessProvider *v66;
  void *v67;
  void *v68;
  GTFileWriterServiceXPCProxy *v69;
  _BOOL4 v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id obj;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  _BYTE v99[128];
  _QWORD v100[6];

  v70 = a5;
  v100[3] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = v10;
  v13 = a6;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:].cold.5();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_DEBUG))
    -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:].cold.4();
  -[GTConnectionProvider connectionForDeviceUDID:](v11->_connectionProvider, "connectionForDeviceUDID:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v15;
  if (v15)
  {
    v16 = v15;
    FindRemoteGTFileWriterService(v15, v12, v11->_connectionProvider);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v11;
    v67 = (void *)v17;
    v68 = v14;
    if (v17)
    {
      v19 = (void *)v17;
      v65 = v9;
      v66 = v18;
      v63 = v13;
      v64 = v12;
      v20 = [GTFileWriterServiceXPCProxy alloc];
      objc_msgSend(v19, "serviceProperties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[GTFileWriterServiceXPCProxy initWithConnection:remoteProperties:](v20, "initWithConnection:remoteProperties:", v16, v21);

      if ((objc_msgSend(v14, "startAccessingSecurityScopedResource") & 1) == 0
        && os_log_type_enabled((os_log_t)v66->_log, OS_LOG_TYPE_DEBUG))
      {
        -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:].cold.3();
      }
      v22 = v14;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *MEMORY[0x24BDBCC60];
      v25 = *MEMORY[0x24BDBCC48];
      v100[0] = *MEMORY[0x24BDBCC60];
      v100[1] = v25;
      v73 = v25;
      v75 = *MEMORY[0x24BDBCCA0];
      v100[2] = *MEMORY[0x24BDBCCA0];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v22, v26, 0, &__block_literal_global);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      obj = v27;
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v92;
        v72 = v24;
        v74 = *(_QWORD *)v92;
        do
        {
          v31 = 0;
          v77 = v29;
          do
          {
            if (*(_QWORD *)v92 != v30)
              objc_enumerationMutation(obj);
            v32 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v31);
            v33 = (void *)MEMORY[0x22E30C9D4]();
            v89 = 0;
            v90 = 0;
            objc_msgSend(v32, "getResourceValue:forKey:error:", &v90, v24, &v89);
            v34 = v90;
            v35 = v89;
            if ((objc_msgSend(v34, "BOOLValue") & 1) == 0)
            {
              v87 = 0;
              v88 = 0;
              objc_msgSend(v32, "getResourceValue:forKey:error:", &v88, v75, &v87);
              v36 = v88;
              v79 = v87;

              GetPathRelativeToBase(v32, v22);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v36, "BOOLValue"))
              {
                objc_msgSend(v32, "URLByResolvingSymlinksInPath");
                v38 = (id)objc_claimAutoreleasedReturnValue();
                GetPathRelativeToBase(v38, v22);
                v39 = (GTFileEntry *)objc_claimAutoreleasedReturnValue();
                v40 = -[GTFileEntry initWithLink:destination:]([GTFileEntry alloc], "initWithLink:destination:", v37, v39);
                objc_msgSend(v76, "addObject:", v40);

              }
              else
              {
                v85 = 0;
                v86 = 0;
                objc_msgSend(v32, "getResourceValue:forKey:error:", &v86, v73, &v85);
                v41 = v22;
                v42 = v86;
                v38 = v85;
                v43 = v42;
                v44 = [GTFileEntry alloc];
                v45 = objc_msgSend(v43, "unsignedIntegerValue");

                v46 = v45;
                v22 = v41;
                v24 = v72;
                v39 = -[GTFileEntry initWithPath:fileSize:](v44, "initWithPath:fileSize:", v37, v46);
                objc_msgSend(v76, "addObject:", v39);
              }

              v35 = v79;
              v29 = v77;
              v30 = v74;
            }

            objc_autoreleasePoolPop(v33);
            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
        }
        while (v29);
      }

      v47 = (void *)objc_msgSend(v76, "copy");
      objc_msgSend(v22, "stopAccessingSecurityScopedResource");
      v48 = (void *)objc_opt_new();
      if (v70 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v22, "path");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        deviceUDID = v66->_deviceUDID;
        v83[0] = MEMORY[0x24BDAC760];
        v83[1] = 3221225472;
        v83[2] = __79__GTURLAccessProvider_copyIdentifier_toDevice_allowLocalURL_completionHandler___block_invoke;
        v83[3] = &unk_24F827B28;
        v51 = &v84;
        v13 = v63;
        v84 = v63;
        -[GTFileWriterServiceXPCProxy startTransfer:basePath:fromDevice:options:completionHandler:](v69, "startTransfer:basePath:fromDevice:options:completionHandler:", v47, v49, deviceUDID, v48, v83);
      }
      else
      {
        objc_msgSend(v22, "path");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v66->_deviceUDID;
        v80[0] = MEMORY[0x24BDAC760];
        v80[1] = 3221225472;
        v80[2] = __79__GTURLAccessProvider_copyIdentifier_toDevice_allowLocalURL_completionHandler___block_invoke_2;
        v80[3] = &unk_24F827B50;
        v51 = &v82;
        v13 = v63;
        v82 = v63;
        v81 = v22;
        -[GTFileWriterServiceXPCProxy initiateTransfer:basePath:fromDevice:options:completionHandler:](v69, "initiateTransfer:basePath:fromDevice:options:completionHandler:", v47, v57, v58, v48, v80);

        v49 = v81;
      }

      v12 = v64;
      v9 = v65;
      v59 = v69;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_ERROR))
        -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:].cold.2();
      v60 = (void *)MEMORY[0x24BDD1540];
      v95 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing file writer service for device: %@"), v12);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v61;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.urlaccessprovider"), 1, v62);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v59);
    }

    v56 = v67;
    v52 = v68;
  }
  else
  {
    v52 = v14;
    if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_ERROR))
      -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:].cold.1();
    v53 = (void *)MEMORY[0x24BDD1540];
    v97 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing connection for device: %@"), v12);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v54;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.urlaccessprovider"), 0, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v56);
  }

}

uint64_t __79__GTURLAccessProvider_copyIdentifier_toDevice_allowLocalURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__GTURLAccessProvider_copyIdentifier_toDevice_allowLocalURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceVendor, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_registeredURLs, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)securityScopedURLFromSandboxID:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_22D095000, a1, a3, "Invalid sandbox ID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)securityScopedURLFromSandboxID:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22D095000, v0, v1, "Missing remote connection for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)securityScopedURLFromSandboxID:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_22D095000, a1, a3, "Failed to find URL access provider", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)securityScopedURLFromSandboxID:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22D095000, v0, v1, "File found locally %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)securityScopedURLFromSandboxID:completionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22D095000, v0, v1, "File should exist locally at %@ but can't be found on disk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)securityScopedURLFromSandboxID:completionHandler:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22D095000, v0, v1, "securityScopedURLFromSandboxID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22D095000, v3, OS_LOG_TYPE_ERROR, "Failed to transfer archive, %@", v5, 0xCu);

}

void __72__GTURLAccessProvider_securityScopedURLFromSandboxID_completionHandler___block_invoke_36_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_22D095000, a1, a3, "Failed to transfer archive", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22D095000, v0, v1, "No remote connection for device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22D095000, v0, v1, "Failed to find remote file writer service for device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22D095000, v0, v1, "Failed to consume sandbox extension for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22D095000, v0, v1, "currentURL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copyIdentifier:toDevice:allowLocalURL:completionHandler:.cold.5()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_5(&dword_22D095000, v1, (uint64_t)v1, "transferIdentifier %@ to device %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
