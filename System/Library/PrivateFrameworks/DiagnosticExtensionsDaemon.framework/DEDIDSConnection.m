@implementation DEDIDSConnection

+ (id)archivedClasses
{
  if (archivedClasses_onceToken_3 != -1)
    dispatch_once(&archivedClasses_onceToken_3, &__block_literal_global_7);
  return (id)archivedClasses__classes_1;
}

void __35__DEDIDSConnection_archivedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[DEDDevice archivedClasses](DEDDevice, "archivedClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v4);

  +[DEDBugSessionConfiguration archivedClasses](DEDBugSessionConfiguration, "archivedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v5);

  +[DEDController archivedClasses](DEDController, "archivedClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v6);

  +[DEDIDSOutbound archivedClasses](DEDIDSOutbound, "archivedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v7);

  +[DEDIDSInbound archivedClasses](DEDIDSInbound, "archivedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v8);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v11);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)archivedClasses__classes_1;
  archivedClasses__classes_1 = v9;

}

+ (id)packPayload:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v10;

  v3 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[DEDIDSConnection packPayload:].cold.1((uint64_t)v3, (uint64_t)v5, v6);

    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (id)unpackProtobuf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "data"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(a1, "archivedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;

    if (v11)
    {
      +[DEDUtils sharedLog](DEDUtils, "sharedLog");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[DEDIDSConnection unpackProtobuf:].cold.2(v5, (uint64_t)v11, v12);

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v13;

  }
  else
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[DEDIDSConnection unpackProtobuf:].cold.1(v5, v14);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (DEDIDSConnection)initWithController:(id)a3
{
  id v4;
  DEDIDSConnection *v5;
  uint64_t v6;
  IDSService *service;
  uint64_t v8;
  IDSService *localService;
  dispatch_queue_t v10;
  OS_dispatch_queue *discovery_queue;
  dispatch_queue_t v12;
  OS_dispatch_queue *run_queue;
  DEDIDSInbound *v14;
  IDSServiceDelegate *incomingDelegate;
  NSObject *v16;
  NSObject *v17;
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
  DEDIDSConnection *v31;
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
  NSObject *v46;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  id v71;
  _QWORD v72[4];
  DEDIDSConnection *v73;
  objc_super v74;
  _QWORD v75[30];
  _QWORD v76[32];

  v76[30] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)DEDIDSConnection;
  v5 = -[DEDIDSConnection init](&v74, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.ded"));
    service = v5->_service;
    v5->_service = (IDSService *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.ded.watch"));
    localService = v5->_localService;
    v5->_localService = (IDSService *)v8;

    if (!v5->_service)
      -[DEDIDSConnection initWithController:].cold.1();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v70 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.diagnosticextensionsd.idsqueue.discovery", v70);
    discovery_queue = v5->_discovery_queue;
    v5->_discovery_queue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.diagnosticextensionsd.idsqueue", 0);
    run_queue = v5->_run_queue;
    v5->_run_queue = (OS_dispatch_queue *)v12;

    v71 = v4;
    v14 = -[DEDIDSInbound initWithConnection:controller:]([DEDIDSInbound alloc], "initWithConnection:controller:", v5, v4);
    incomingDelegate = v5->_incomingDelegate;
    v5->_incomingDelegate = (IDSServiceDelegate *)v14;

    v16 = v5->_run_queue;
    dispatch_get_global_queue(2, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v16, v17);

    -[DEDIDSConnection service](v5, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setProtobufAction:forIncomingRequestsOfType:", sel_logMalformedMessage, 0);

    -[DEDIDSConnection service](v5, "service");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProtobufAction:forIncomingResponsesOfType:", sel_logMalformedMessage, 0);

    -[DEDIDSConnection localService](v5, "localService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setProtobufAction:forIncomingRequestsOfType:", sel_logMalformedMessage, 0);

    -[DEDIDSConnection localService](v5, "localService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setProtobufAction:forIncomingResponsesOfType:", sel_logMalformedMessage, 0);

    v75[0] = &unk_24D202CB0;
    NSStringFromSelector(sel_remote_device_query_request_service_account_fromID_context_);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v69;
    v75[1] = &unk_24D202CC8;
    NSStringFromSelector(sel_remote_list_DE_service_account_fromID_context_);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v68;
    v75[2] = &unk_24D202CE0;
    NSStringFromSelector(sel_device_supports_diagnostic_extensions_service_account_fromID_context_);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v67;
    v75[3] = &unk_24D202CF8;
    NSStringFromSelector(sel_start_diagnostic_with_identifier_service_account_fromID_context_);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v66;
    v75[4] = &unk_24D202D10;
    NSStringFromSelector(sel_finished_diagnostic_with_identifier_service_account_fromID_context_);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v76[4] = v65;
    v75[5] = &unk_24D202D28;
    NSStringFromSelector(sel_start_session_service_account_fromID_context_);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v76[5] = v64;
    v75[6] = &unk_24D202D40;
    NSStringFromSelector(sel_did_start_session_service_account_fromID_context_);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v76[6] = v63;
    v75[7] = &unk_24D202D58;
    NSStringFromSelector(sel_session_ping_service_account_fromID_context_);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v76[7] = v62;
    v75[8] = &unk_24D202D70;
    NSStringFromSelector(sel_session_pong_service_account_fromID_context_);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v76[8] = v61;
    v75[9] = &unk_24D202D88;
    NSStringFromSelector(sel_terminate_diagnostic_with_identifier_service_account_fromID_context_);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v76[9] = v60;
    v75[10] = &unk_24D202DA0;
    NSStringFromSelector(sel_get_session_status_service_account_fromID_context_);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v76[10] = v59;
    v75[11] = &unk_24D202DB8;
    NSStringFromSelector(sel_did_get_session_status_service_account_fromID_context_);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v76[11] = v58;
    v75[12] = &unk_24D202DD0;
    NSStringFromSelector(sel_adopt_files_service_account_fromID_context_);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v76[12] = v57;
    v75[13] = &unk_24D202DE8;
    NSStringFromSelector(sel_did_adopt_files_service_account_fromID_context_);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v76[13] = v56;
    v75[14] = &unk_24D202E00;
    NSStringFromSelector(sel_upload_progress_service_account_fromID_context_);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v76[14] = v55;
    v75[15] = &unk_24D202E18;
    NSStringFromSelector(sel_commit_session_service_account_fromID_context_);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v76[15] = v54;
    v75[16] = &unk_24D202E30;
    NSStringFromSelector(sel_did_commit_session_service_account_fromID_context_);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v76[16] = v53;
    v75[17] = &unk_24D202E48;
    NSStringFromSelector(sel_cancel_session_service_account_fromID_context_);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v76[17] = v52;
    v75[18] = &unk_24D202E60;
    NSStringFromSelector(sel_did_cancel_session_service_account_fromID_context_);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v76[18] = v51;
    v75[19] = &unk_24D202E78;
    NSStringFromSelector(sel_sync_session_status_service_account_fromID_context_);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v76[19] = v50;
    v75[20] = &unk_24D202E90;
    NSStringFromSelector(sel_did_sync_session_status_service_account_fromID_context_);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v76[20] = v49;
    v75[21] = &unk_24D202EA8;
    NSStringFromSelector(sel_get_session_state_service_account_fromID_context_);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v76[21] = v48;
    v75[22] = &unk_24D202EC0;
    NSStringFromSelector(sel_did_get_session_state_service_account_fromID_context_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v76[22] = v22;
    v75[23] = &unk_24D202ED8;
    NSStringFromSelector(sel_schedule_notification_service_account_fromID_context_);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v76[23] = v23;
    v75[24] = &unk_24D202EF0;
    NSStringFromSelector(sel_unschedule_notification_service_account_fromID_context_);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v76[24] = v24;
    v75[25] = &unk_24D202F08;
    NSStringFromSelector(sel_present_notification_on_passthrough_daemon_service_account_fromID_context_);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v76[25] = v25;
    v75[26] = &unk_24D202F20;
    NSStringFromSelector(sel_remove_notification_on_passthrough_daemon_service_account_fromID_context_);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v76[26] = v26;
    v75[27] = &unk_24D202F38;
    NSStringFromSelector(sel_add_session_data_service_account_fromID_context_);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v76[27] = v27;
    v75[28] = &unk_24D202F50;
    NSStringFromSelector(sel_load_extension_text_data_service_account_fromID_context_);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v76[28] = v28;
    v75[29] = &unk_24D202F68;
    NSStringFromSelector(sel_compression_progress_service_account_fromID_context_);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v76[29] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 30);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __39__DEDIDSConnection_initWithController___block_invoke;
    v72[3] = &unk_24D1E56E0;
    v31 = v5;
    v73 = v31;
    objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v72);
    -[DEDIDSConnection service](v31, "service");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setProtobufAction:forIncomingResponsesOfType:", sel_did_present_notification_on_passthrough_daemon_service_account_fromID_context_, 28);

    -[DEDIDSConnection service](v31, "service");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setProtobufAction:forIncomingResponsesOfType:", sel_did_remove_notification_on_passthrough_daemon_service_account_fromID_context_, 29);

    -[DEDIDSConnection service](v31, "service");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setProtobufAction:forIncomingResponsesOfType:", sel_did_load_extension_text_data_service_account_fromID_context_, 31);

    -[DEDIDSConnection service](v31, "service");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setProtobufAction:forIncomingResponsesOfType:", sel_local_device_query_callback_service_account_fromID_context_, 1);

    -[DEDIDSConnection localService](v31, "localService");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setProtobufAction:forIncomingResponsesOfType:", sel_local_device_query_callback_service_account_fromID_context_, 1);

    -[DEDIDSConnection localService](v31, "localService");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setProtobufAction:forIncomingResponsesOfType:", sel_did_present_notification_on_passthrough_daemon_service_account_fromID_context_, 28);

    -[DEDIDSConnection localService](v31, "localService");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setProtobufAction:forIncomingResponsesOfType:", sel_did_remove_notification_on_passthrough_daemon_service_account_fromID_context_, 29);

    -[DEDIDSConnection localService](v31, "localService");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setProtobufAction:forIncomingResponsesOfType:", sel_did_load_extension_text_data_service_account_fromID_context_, 31);

    -[DEDIDSConnection service](v31, "service");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDIDSConnection incomingDelegate](v31, "incomingDelegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDIDSConnection run_queue](v31, "run_queue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addDelegate:queue:", v41, v42);

    -[DEDIDSConnection localService](v31, "localService");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDIDSConnection incomingDelegate](v31, "incomingDelegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDIDSConnection run_queue](v31, "run_queue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addDelegate:queue:", v44, v45);

    DEDIDSConnectionLog();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      -[DEDIDSConnection initWithController:].cold.2(v46);

    v4 = v71;
  }

  return v5;
}

void __39__DEDIDSConnection_initWithController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  NSString *v6;
  id v7;
  void *v8;
  SEL v9;
  uint64_t v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProtobufAction:forIncomingRequestsOfType:", NSSelectorFromString(v6), objc_msgSend(v7, "unsignedShortValue"));

  objc_msgSend(*(id *)(a1 + 32), "localService");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = NSSelectorFromString(v6);

  v10 = objc_msgSend(v7, "unsignedShortValue");
  objc_msgSend(v11, "setProtobufAction:forIncomingRequestsOfType:", v9, v10);

}

- (void)setDeviceCallback:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DEDIDSConnectionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4 == 0;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Setting device status callback. Nil? [%i]", (uint8_t *)v6, 8u);
  }

  -[DEDIDSConnection setDeviceStatusCallback:](self, "setDeviceStatusCallback:", v4);
}

- (BOOL)sendMessage:(int)a3 withData:(id)a4 forIDSDeviceID:(id)a5 isResponse:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  void *v10;
  id v11;
  void *v12;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = a4;
  objc_msgSend(v10, "setWithObject:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = -[DEDIDSConnection sendMessage:withData:forIDSDeviceIDs:isResponse:](self, "sendMessage:withData:forIDSDeviceIDs:isResponse:", v8, v11, v12, v6);

  return v6;
}

- (BOOL)sendMessage:(int)a3 withData:(id)a4 forDevices:(id)a5 isResponse:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)IDSCopyIDForDevice();
        objc_msgSend(v12, "addObject:", v18, v21);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  v19 = -[DEDIDSConnection sendMessage:withData:forIDSDeviceIDs:isResponse:](self, "sendMessage:withData:forIDSDeviceIDs:isResponse:", v8, v10, v12, v6);
  return v19;
}

- (BOOL)sendMessage:(int)a3 withData:(id)a4 forIDSDeviceIDs:(id)a5 isResponse:(BOOL)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  DEDIDSConnection *v28;
  _BOOL4 v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v30 = a6;
  v46 = *MEMORY[0x24BDAC8D0];
  v31 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
  v28 = self;
  -[DEDIDSConnection localService](self, "localService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "devices");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    v34 = v10;
    v35 = v9;
    v32 = v12;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
        if (objc_msgSend(v17, "hasPrefix:", CFSTR("device")) && !objc_msgSend(v10, "count"))
        {
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v18 = v33;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v37;
            while (2)
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v37 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                v24 = (void *)IDSCopyIDForDevice();
                if (objc_msgSend(v17, "isEqualToString:", v24))
                {
                  if (objc_msgSend(v23, "isActive") && objc_msgSend(v23, "isConnected"))
                  {
                    objc_msgSend(v34, "addObject:", v24);
                    v9 = v35;
                  }
                  else
                  {
                    v9 = v35;
                    objc_msgSend(v35, "addObject:", v17);
                  }

                  goto LABEL_25;
                }

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              v9 = v35;
              if (v20)
                continue;
              break;
            }
          }
LABEL_25:

          v10 = v34;
          v12 = v32;
        }
        else
        {
          objc_msgSend(v9, "addObject:", v17);
        }
        ++v16;
      }
      while (v16 != v14);
      v25 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      v14 = v25;
    }
    while (v25);
  }

  v26 = -[DEDIDSConnection sendMessage:withData:forIDSDeviceIDs:localIDSDeviceIDs:isResponse:](v28, "sendMessage:withData:forIDSDeviceIDs:localIDSDeviceIDs:isResponse:", a3, v31, v9, v10, v30);
  return v26;
}

- (BOOL)sendMessage:(int)a3 withData:(id)a4 forIDSDeviceIDs:(id)a5 localIDSDeviceIDs:(id)a6 isResponse:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  const char *v30;
  BOOL v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  _BOOL4 v57;
  _QWORD v58[2];
  _QWORD v59[3];

  v7 = a7;
  v59[2] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = *MEMORY[0x24BE4FB30];
  v59[0] = &unk_24D202F80;
  v15 = *MEMORY[0x24BE4FAA8];
  v58[0] = v14;
  v58[1] = v15;
  v16 = (void *)MEMORY[0x24BDD16E0];
  v17 = a4;
  objc_msgSend(v16, "numberWithBool:", a3 == 17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FE40]), "initWithProtobufData:type:isResponse:", v17, (unsigned __int16)a3, v7);
  v47 = (void *)v19;
  if (objc_msgSend(v12, "count"))
  {
    -[DEDIDSConnection service](self, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v51 = 0;
    objc_msgSend(v21, "sendProtobuf:toDestinations:priority:options:identifier:error:", v20, v12, 300, v19, &v51, &v50);
    v22 = v51;
    v23 = v50;

    DEDIDSConnectionLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = DEDIDSCommandString(a3);
      *(_DWORD *)buf = 136446722;
      v53 = v25;
      v54 = 2114;
      v55 = v22;
      v56 = 1024;
      v57 = v7;
      _os_log_impl(&dword_21469E000, v24, OS_LOG_TYPE_DEFAULT, "Sending IDS command: [%{public}s] with guid: [%{public}@] is response? [%i]", buf, 0x1Cu);
    }

  }
  else
  {
    v23 = 0;
    v22 = 0;
  }
  if (objc_msgSend(v13, "count"))
  {
    -[DEDIDSConnection localService](self, "localService");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v49 = 0;
    objc_msgSend(v26, "sendProtobuf:toDestinations:priority:options:identifier:error:", v20, v13, 300, v47, &v49, &v48);
    v27 = v49;
    v28 = v48;

    DEDIDSConnectionLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = DEDIDSCommandString(a3);
      *(_DWORD *)buf = 136446722;
      v53 = v30;
      v54 = 2114;
      v55 = v27;
      v56 = 1024;
      v57 = v7;
      _os_log_impl(&dword_21469E000, v29, OS_LOG_TYPE_DEFAULT, "Sending IDS command: [%{public}s] with guid: [%{public}@] is response? [%i] (local service)", buf, 0x1Cu);
    }

  }
  else
  {
    v28 = 0;
    v27 = 0;
  }
  if (objc_msgSend(v12, "count") && !objc_msgSend(v22, "length"))
  {
    v31 = 0;
    if (!v23)
      goto LABEL_22;
  }
  else if (objc_msgSend(v13, "count"))
  {
    v31 = objc_msgSend(v27, "length") != 0;
    if (!v23)
      goto LABEL_22;
  }
  else
  {
    v31 = 1;
    if (!v23)
      goto LABEL_22;
  }
  DEDIDSConnectionLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    -[DEDIDSConnection sendMessage:withData:forIDSDeviceIDs:localIDSDeviceIDs:isResponse:].cold.2((uint64_t)v23, v32, v33, v34, v35, v36, v37, v38);

  v31 = 0;
LABEL_22:
  if (v28)
  {
    DEDIDSConnectionLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[DEDIDSConnection sendMessage:withData:forIDSDeviceIDs:localIDSDeviceIDs:isResponse:].cold.1((uint64_t)v28, v39, v40, v41, v42, v43, v44, v45);

    v31 = 0;
  }

  return v31;
}

- (void)ids_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20[0] = CFSTR("targetDevice");
  v20[1] = CFSTR("sessionID");
  v21[0] = a6;
  v21[1] = a3;
  v20[2] = CFSTR("config");
  v20[3] = CFSTR("callingDevice");
  v21[2] = a4;
  v21[3] = a5;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v11, "address");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDIDSConnection sendMessage:withData:forIDSDeviceIDs:isResponse:](self, "sendMessage:withData:forIDSDeviceIDs:isResponse:", 8, v16, v19, 0);
}

- (void)ids_didStartBugSessionWithInfo:(id)a3 forID:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDIDSConnection sendMessage:withData:forIDSDeviceIDs:isResponse:](self, "sendMessage:withData:forIDSDeviceIDs:isResponse:", 9, v8, v7, 0);
}

- (void)discoverDevicesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DEDIDSConnection discovery_queue](self, "discovery_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__DEDIDSConnection_discoverDevicesWithCompletion___block_invoke;
  v7[3] = &unk_24D1E4EC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__DEDIDSConnection_discoverDevicesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  DEDIDSConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "Sending device pings", buf, 2u);
  }

  v37 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  objc_msgSend(*(id *)(a1 + 32), "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = a1;
    objc_msgSend(*(id *)(a1 + 32), "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "devices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    v8 = (void *)v37;
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          DEDAddressForIDSDevice();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[DEDDevice idsDeviceWithDevice:address:](DEDDevice, "idsDeviceWithDevice:address:", v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          DEDIDSConnectionLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "idsIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478339;
            v43 = v16;
            v44 = 2113;
            v45 = v13;
            v46 = 2114;
            v47 = v17;
            _os_log_impl(&dword_21469E000, v15, OS_LOG_TYPE_DEFAULT, "Ping sent: device name: %{private}@ targetID: %{private}@ | [%{public}@]", buf, 0x20u);

            v8 = (void *)v37;
          }

          objc_msgSend(v8, "addObject:", v14);
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v9);
    }

    v18 = v8;
    v19 = *(void **)(v36 + 32);
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(v36 + 32), "service");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "devices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sendMessage:withData:forDevices:isResponse:", 1, v20, v24, 0);

    v25 = *(_QWORD *)(v36 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
  }
  else
  {
    DEDIDSConnectionLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __50__DEDIDSConnection_discoverDevicesWithCompletion___block_invoke_cold_1(v27, v28, v29, v30, v31, v32, v33, v34);

    v35 = *(_QWORD *)(a1 + 40);
    v26 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v26);
    v18 = (void *)v37;
  }

}

- (void)incomingDeviceReceived:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DEDIDSConnectionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "publicLogDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "Got device ping for device [%{public}@] identifier: [%{public}@]", (uint8_t *)&v17, 0x16u);

  }
  -[DEDIDSConnection deviceStatusCallback](self, "deviceStatusCallback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DEDIDSConnection deviceStatusCallback](self, "deviceStatusCallback");
    v9 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, v4, 1);
  }
  else
  {
    DEDIDSConnectionLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      -[DEDIDSConnection incomingDeviceReceived:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (DEDClientProtocol)remoteSideDelegate
{
  return (DEDClientProtocol *)objc_loadWeakRetained((id *)&self->_remoteSideDelegate);
}

- (void)setRemoteSideDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_remoteSideDelegate, a3);
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (IDSService)localService
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)run_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRun_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)discovery_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDiscovery_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (IDSServiceDelegate)incomingDelegate
{
  return (IDSServiceDelegate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIncomingDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)deviceStatusCallback
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceStatusCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceStatusCallback, 0);
  objc_storeStrong((id *)&self->_incomingDelegate, 0);
  objc_storeStrong((id *)&self->_discovery_queue, 0);
  objc_storeStrong((id *)&self->_run_queue, 0);
  objc_storeStrong((id *)&self->_localService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_remoteSideDelegate);
}

+ (void)packPayload:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "error archiving payload [%{public}@] with error: [%{public}@]", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)unpackProtobuf:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "type");
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "failed to unpack protobuf [%hu] with error: protobuf or protobuf data is nil ", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

+ (void)unpackProtobuf:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5[0] = 67109378;
  v5[1] = objc_msgSend(a1, "type");
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_21469E000, a3, OS_LOG_TYPE_ERROR, "failed to unpack protobuf data [%hu] with error [%{public}@]", (uint8_t *)v5, 0x12u);
}

- (void)initWithController:.cold.1()
{
  __assert_rtn("-[DEDIDSConnection initWithController:]", "DEDIDSConnection.m", 167, "_service");
}

- (void)initWithController:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21469E000, log, OS_LOG_TYPE_DEBUG, "IDSService on DEDIDSConnection initialized.", v1, 2u);
  OUTLINED_FUNCTION_2_3();
}

- (void)sendMessage:(uint64_t)a3 withData:(uint64_t)a4 forIDSDeviceIDs:(uint64_t)a5 localIDSDeviceIDs:(uint64_t)a6 isResponse:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "Error sending protobuf locally: [%{public}@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendMessage:(uint64_t)a3 withData:(uint64_t)a4 forIDSDeviceIDs:(uint64_t)a5 localIDSDeviceIDs:(uint64_t)a6 isResponse:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "Error sending protobuf: [%{public}@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __50__DEDIDSConnection_discoverDevicesWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "No IDS service configured", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_3();
}

- (void)incomingDeviceReceived:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "device discovery callback block is nil, DED will miss device updates", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_3();
}

@end
