@implementation DEDSharingInbound

- (DEDSharingInbound)init
{
  DEDSharingInbound *v2;
  void *v3;
  os_log_t v4;
  OS_os_log *log;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DEDSharingInbound;
  v2 = -[DEDSharingInbound init](&v8, sel_init);
  if (v2)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create((const char *)objc_msgSend(v3, "loggingSubsystem"), "sharing-inbound");
    log = v2->_log;
    v2->_log = (OS_os_log *)v4;

    -[DEDSharingInbound log](v2, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[DEDSharingInbound init].cold.1(v6);

  }
  return v2;
}

- (DEDSharingInbound)initWithController:(id)a3 sharingConnection:(id)a4
{
  id v6;
  id v7;
  DEDSharingInbound *v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(DEDSharingInbound);

  if (v8)
  {
    -[DEDSharingInbound setDelegate:](v8, "setDelegate:", v6);
    -[DEDSharingInbound setConnection:](v8, "setConnection:", v7);
  }

  return v8;
}

- (void)handleObject:(id)a3 forSFSession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
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
  int v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[3];
  _QWORD v60[3];
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDSharingInbound log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDSharingInbound handleObject:forSFSession:].cold.7();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("setup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("ready_check"));

  if (v10)
  {
    -[DEDSharingInbound log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("myIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v12;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "received ready_check setup command with identifier [%@]", buf, 0xCu);

    }
    -[DEDSharingInbound log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[DEDSharingInbound handleObject:forSFSession:].cold.1();

    +[DEDDevice currentDeviceWithDaemonInfo](DEDDevice, "currentDeviceWithDaemonInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = CFSTR("ready_device");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("yourIdentifier"), CFSTR("setup"), CFSTR("myIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v15;
    v59[2] = CFSTR("device");
    objc_msgSend(v14, "serialize");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sendWithFlags:object:", 0, v17);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("setup"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("ready_device"));

  if (v19)
  {
    -[DEDSharingInbound log](self, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("myIdentifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v21;
      _os_log_impl(&dword_21469E000, v20, OS_LOG_TYPE_DEFAULT, "received ready_device setup command with identifier [%@]", buf, 0xCu);

    }
    -[DEDSharingInbound log](self, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[DEDSharingInbound handleObject:forSFSession:].cold.1();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("device"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDDevice deviceWithDictionary:](DEDDevice, "deviceWithDictionary:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("myIdentifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAddress:", v25);

    objc_msgSend(v24, "setTransport:", 3);
    objc_msgSend(v24, "setRemoteTransport:", 3);
    objc_msgSend(v7, "peerDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSfDevice:", v26);

    -[DEDSharingInbound log](self, "log");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[DEDSharingInbound handleObject:forSFSession:].cold.4(v24, v27);

    -[DEDSharingInbound connection](self, "connection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "updateControllerWithDevice:andStatus:", v24, objc_msgSend(v24, "status"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("setup"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("start_session"));

  if (v30)
  {
    -[DEDSharingInbound log](self, "log");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("myIdentifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v32;
      _os_log_impl(&dword_21469E000, v31, OS_LOG_TYPE_DEFAULT, "received start_session setup command with identifier [%@]", buf, 0xCu);

    }
    -[DEDSharingInbound log](self, "log");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[DEDSharingInbound handleObject:forSFSession:].cold.1();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("config"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDBugSessionConfiguration secureUnarchiveWithData:](DEDBugSessionConfiguration, "secureUnarchiveWithData:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("callingDevice"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDDevice deviceWithDictionary:](DEDDevice, "deviceWithDictionary:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("targetDevice"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDDevice deviceWithDictionary:](DEDDevice, "deviceWithDictionary:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "setTransport:", 3);
    objc_msgSend(v38, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAddress:", v41);

    -[DEDSharingInbound connection](self, "connection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "identifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addIncomingSFSession:forIdentifier:", v7, v43);

    -[DEDSharingInbound delegate](self, "delegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sharingInbound_startBugSessionWithIdentifier:configuration:caller:target:", v34, v36, v38, v40);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("setup"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("did_start_session"));

  if (v46)
  {
    -[DEDSharingInbound log](self, "log");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("myIdentifier"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v48;
      _os_log_impl(&dword_21469E000, v47, OS_LOG_TYPE_DEFAULT, "received start_session setup command with identifier [%@]", buf, 0xCu);

    }
    -[DEDSharingInbound log](self, "log");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      -[DEDSharingInbound handleObject:forSFSession:].cold.1();

    -[DEDSharingInbound delegate](self, "delegate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "sharingInbound_didStartBugSessionWithInfo:", v6);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("session"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[DEDSharingInbound log](self, "log");
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("myIdentifier"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v53;
      _os_log_impl(&dword_21469E000, v52, OS_LOG_TYPE_DEFAULT, "received session setup command with identifier [%@]", buf, 0xCu);

    }
    -[DEDSharingInbound log](self, "log");
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      -[DEDSharingInbound handleObject:forSFSession:].cold.1();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("callingDevice"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDDevice deviceWithDictionary:](DEDDevice, "deviceWithDictionary:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "setTransport:", 3);
    objc_msgSend(v57, "identifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setAddress:", v58);

    -[DEDSharingInbound handleObject:forSFSession:forBugSession:callingDevice:](self, "handleObject:forSFSession:forBugSession:callingDevice:", v6, v7, v55, v57);
  }

}

- (void)handleObject:(id)a3 forSFSession:(id)a4 forBugSession:(id)a5 callingDevice:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  DEDExtensionIdentifier *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[DEDSharingInbound log](self, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[DEDSharingInbound handleObject:forSFSession:forBugSession:callingDevice:].cold.3();

  -[DEDSharingInbound delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSharingInbound connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addIncomingSFSession:forIdentifier:", v11, v18);

    -[DEDSharingInbound delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sessionForIdentifier:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "isEqualToString:", CFSTR("ping")))
    {
      objc_msgSend(v20, "pingWithCallback:", 0);
LABEL_28:

      goto LABEL_29;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("pong")))
    {
      objc_msgSend(v20, "pong");
      goto LABEL_28;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("listExtensions")))
    {
      objc_msgSend(v20, "listDiagnosticExtensionsWithCompletion:", 0);
      goto LABEL_28;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("startDiagnostic")))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"));
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("parameters"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)v21;
      v23 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v21);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("deferDate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDExtensionIdentifier extensionIdentifier](v23, "extensionIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        v26 = (id)objc_msgSend(v20, "startDiagnosticExtensionWithIdentifier:parameters:deferRunUntil:completion:", v25, v22, v24, 0);
      else
        v36 = (id)objc_msgSend(v20, "startDiagnosticExtensionWithIdentifier:parameters:completion:", v25, v22, 0);

      goto LABEL_28;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("terminateExtension")))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"));
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("info"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "terminateExtension:withInfo:", v27, v28);
    }
    else
    {
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("supportsExtensions")))
      {
        v58 = v20;
        v59 = v13;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extensions"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v62 != v33)
                objc_enumerationMutation(v30);
              +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v35);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
          }
          while (v32);
        }

        v20 = v58;
        objc_msgSend(v58, "supportsDiagnostics:", v29);

        v13 = v59;
        goto LABEL_28;
      }
      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("finishedDiagnostic")))
      {
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("getStatus")))
        {
          objc_msgSend(v20, "getSessionStatusWithCompletion:", 0);
          goto LABEL_28;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("getState")))
        {
          objc_msgSend(v20, "getStateWithCompletion:", 0);
          goto LABEL_28;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("syncStatus")))
        {
          objc_msgSend(v20, "synchronizeSessionStatusWithCompletion:", 0);
          goto LABEL_28;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("didGetStatus")))
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("groups"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "ded_mapWithBlock:", &__block_literal_global_28);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extensions"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "ded_mapWithBlock:", &__block_literal_global_81);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "hasCollected:isCollecting:", v39, v41);
        }
        else
        {
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("didGetState")))
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("state"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "integerValue");

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("info"));
            v27 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "didGetState:info:", v43, v27);
            goto LABEL_16;
          }
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("didSyncStatus")))
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("groups"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "ded_mapWithBlock:", &__block_literal_global_88);
            v27 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extensions"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "ded_mapWithBlock:", &__block_literal_global_89);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifiers"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "ded_mapWithBlock:", &__block_literal_global_92);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "hasCollected:isCollecting:identifiers:", v27, v46, v48);
            goto LABEL_16;
          }
          if (!objc_msgSend(v16, "isEqualToString:", CFSTR("adoptFiles")))
          {
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("didAdoptFiles")))
            {
              objc_msgSend(v10, "objectForKey:", CFSTR("error"));
              v27 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "didAdoptFilesWithError:", v27);
            }
            else
            {
              if (objc_msgSend(v16, "isEqualToString:", CFSTR("uploadProgress")))
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uploaded"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v50, "longLongValue");

                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("total"));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "longLongValue");

                objc_msgSend(v20, "uploadProgress:total:", v51, v53);
                goto LABEL_28;
              }
              if (objc_msgSend(v16, "isEqualToString:", CFSTR("compressionProgress")))
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("compressed"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = objc_msgSend(v54, "unsignedLongLongValue");

                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("total"));
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = objc_msgSend(v56, "unsignedLongLongValue");

                objc_msgSend(v20, "compressionProgress:total:", v55, v57);
                goto LABEL_28;
              }
              if (objc_msgSend(v16, "isEqualToString:", CFSTR("commitSession")))
              {
                objc_msgSend(v20, "commit");
                goto LABEL_28;
              }
              if (objc_msgSend(v16, "isEqualToString:", CFSTR("didCommitSession")))
              {
                objc_msgSend(v20, "didCommit");
                goto LABEL_28;
              }
              if (objc_msgSend(v16, "isEqualToString:", CFSTR("cancelSession")))
              {
                objc_msgSend(v20, "cancel");
                goto LABEL_28;
              }
              if (objc_msgSend(v16, "isEqualToString:", CFSTR("didCancelSession")))
              {
                -[DEDSharingInbound delegate](self, "delegate");
                v27 = objc_claimAutoreleasedReturnValue();
                -[NSObject sharingInbound_didAbortSessionWithID:](v27, "sharingInbound_didAbortSessionWithID:", v12);
              }
              else
              {
                -[DEDSharingInbound log](self, "log");
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  -[DEDSharingInbound handleObject:forSFSession:forBugSession:callingDevice:].cold.2();
              }
            }
            goto LABEL_16;
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("filesForAdopt"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[DEDSharingInbound log](self, "log");
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            -[DEDSharingInbound handleObject:forSFSession:forBugSession:callingDevice:].cold.1(v49);

          objc_msgSend(v20, "adoptFiles:withCompletion:", v39, 0);
        }

        goto LABEL_28;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"));
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("group"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[DEDAttachmentGroup groupWithDictionary:](DEDAttachmentGroup, "groupWithDictionary:", v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "finishedDiagnosticWithIdentifier:result:", v27, v28);
    }

LABEL_16:
    goto LABEL_28;
  }
LABEL_29:

}

DEDAttachmentGroup *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:](DEDAttachmentGroup, "groupWithDictionary:", a2);
}

DEDExtension *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

DEDAttachmentGroup *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:](DEDAttachmentGroup, "groupWithDictionary:", a2);
}

DEDExtension *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

DEDExtensionIdentifier *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  DEDExtensionIdentifier *v3;

  v2 = a2;
  v3 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v2);

  return v3;
}

- (void)handleRequest:(id)a3 forSFSession:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __assert_rtn("-[DEDSharingInbound handleRequest:forSFSession:completion:]", "DEDSharingInbound.m", 252, "false");
}

- (DEDController)delegate
{
  return (DEDController *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DEDSharingConnection)connection
{
  return (DEDSharingConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21469E000, log, OS_LOG_TYPE_DEBUG, "DEDSharingInbound initialized.", v1, 2u);
}

- (void)handleObject:forSFSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleObject:(void *)a1 forSFSession:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2048;
  v9 = objc_msgSend(a1, "status");
  OUTLINED_FUNCTION_13(&dword_21469E000, a2, v5, "checkReadiness callback for %@ (status %ld)", (uint8_t *)&v6);

}

- (void)handleObject:forSFSession:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_13(&dword_21469E000, v0, v1, "%s:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)handleObject:(os_log_t)log forSFSession:forBugSession:callingDevice:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "adoptFiles not supported via Sharing", v1, 2u);
}

- (void)handleObject:forSFSession:forBugSession:callingDevice:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_21469E000, v0, OS_LOG_TYPE_ERROR, "Unknown command given [%{public}@]", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)handleObject:forSFSession:forBugSession:callingDevice:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_13(&dword_21469E000, v0, v1, "%s bugSession:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

@end
