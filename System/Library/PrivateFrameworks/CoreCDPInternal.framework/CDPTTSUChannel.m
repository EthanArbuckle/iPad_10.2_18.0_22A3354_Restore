@implementation CDPTTSUChannel

- (CDPTTSUChannel)initWithContext:(id)a3
{
  id v5;
  CDPTTSUChannel *v6;
  id v7;
  void *v8;
  uint64_t v9;
  CUMessageSession *sharingSession;

  v5 = a3;
  v6 = -[CDPTTSUChannel init](self, "init");
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE297D0]);
    objc_msgSend(v5, "sharingChannel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithTemplate:", v8);
    sharingSession = v6->_sharingSession;
    v6->_sharingSession = (CUMessageSession *)v9;

    v6->_sentInitialResponse = 0;
    objc_storeStrong((id *)&v6->_cdpContext, a3);
  }

  return v6;
}

- (void)sendPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  CUMessageSession *sharingSession;
  id v22;
  _QWORD v23[5];
  id v24;
  os_signpost_id_t v25;
  uint64_t v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  os_signpost_id_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPSignpostLogSystem();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _CDPSignpostCreate();
  v11 = v10;

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SecureChannelSendPayload", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v9;
    _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SecureChannelSendPayload  enableTelemetry=YES ", buf, 0xCu);
  }

  v15 = (void *)MEMORY[0x24BDBCED8];
  v27 = CFSTR("CDPChannelTTSUPayloadKey");
  v28 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPContext telemetryFlowID](self->_cdpContext, "telemetryFlowID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPContext telemetryDeviceSessionID](self->_cdpContext, "telemetryDeviceSessionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    _CDPLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v20, OS_LOG_TYPE_DEFAULT, "\"CDPTTSUChannel: Flow ID exists on the requesting proxy, attaching to payload.\", buf, 2u);
    }

    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("CDPChannelTTSUTelemetryFlowId"));
  }
  sharingSession = self->_sharingSession;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __41__CDPTTSUChannel_sendPayload_completion___block_invoke;
  v23[3] = &unk_24C81C780;
  v25 = v9;
  v26 = v11;
  v23[4] = self;
  v24 = v7;
  v22 = v7;
  -[CUMessageSession sendRequestID:options:request:responseHandler:](sharingSession, "sendRequestID:options:request:responseHandler:", CFSTR("CDPChannelTTSURequestID"), MEMORY[0x24BDBD1B8], v17, v23);

}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke(_QWORD *a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void (*v28)(void);
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  id v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 138412290;
    v36 = v6;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Response received: %@\", (uint8_t *)&v35, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CDPChannelTTSUPayloadBackupRecordsExistKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "BOOLValue");
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_5(v10, v11);

    *(_BYTE *)(a1[4] + 8) = v10;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CDPChannelTTSUPayloadiCloudKeychainEnabledKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_msgSend(v12, "integerValue");
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_4(v13, v14, v15);

    *(_QWORD *)(a1[4] + 16) = v13;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CDPChannelTTSUPayloadKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
    }

  }
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = a1[6];
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v35) = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v20, OS_SIGNPOST_INTERVAL_END, v21, "SecureChannelSendPayload", ", (uint8_t *)&v35, 2u);
  }

  _CDPSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)a1[6];
    v35 = 134218240;
    v36 = v23;
    v37 = 2048;
    v38 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SecureChannelSendPayload ", (uint8_t *)&v35, 0x16u);
  }

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CDPChannelTTSUPayloadKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    _CDPLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_3(v24, v26);

    v27 = a1[5];
    if (v27)
    {
      v28 = *(void (**)(void))(v27 + 16);
LABEL_33:
      v28();
    }
  }
  else
  {
    _CDPLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v25)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_2((uint64_t)v25, v30, v31);

      v32 = a1[5];
      if (v32)
      {
        v28 = *(void (**)(void))(v32 + 16);
        goto LABEL_33;
      }
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_1(v30);

      v33 = a1[5];
      if (v33)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5320);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v33 + 16))(v33, 0, v34);

      }
    }
  }

}

- (BOOL)approverBackupRecordsExist
{
  return self->_approverBackupRecordsExist;
}

- (unint64_t)approveriCloudKeychainState
{
  return self->_approveriCloudKeychainState;
}

- (void)listenForPayloadsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  CUMessageSession *sharingSession;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *, void *);
  void *v11;
  CDPTTSUChannel *v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Starting to listen for initiating payload...\", buf, 2u);
  }

  sharingSession = self->_sharingSession;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __47__CDPTTSUChannel_listenForPayloadsWithHandler___block_invoke;
  v11 = &unk_24C81C7A8;
  v12 = self;
  v13 = v4;
  v7 = v4;
  -[CUMessageSession registerRequestID:options:handler:](sharingSession, "registerRequestID:options:handler:", CFSTR("CDPChannelTTSURequestID"), MEMORY[0x24BDBD1B8], &v8);
  -[CUMessageSession activate](self->_sharingSession, "activate", v8, v9, v10, v11, v12);

}

void __47__CDPTTSUChannel_listenForPayloadsWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  const __CFString *v26;
  id v27;
  _QWORD v28[3];
  _QWORD v29[3];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Payload received from requestor: %@\", buf, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CDPChannelTTSUPayloadKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CDPChannelTTSUTelemetryFlowId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Flow ID was received from the requesting proxy, setting on the approving proxy.\", buf, 2u);
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CDPChannelTTSUTelemetryFlowId"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  v15 = *(_QWORD *)(a1 + 40);
  v24 = 0;
  v25 = 0;
  (*(void (**)(void))(v15 + 16))();
  v16 = v25;
  v17 = v24;
  if (v16)
  {
    v18 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v18 + 24))
    {
      v26 = CFSTR("CDPChannelTTSUPayloadKey");
      v27 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29[0] = v16;
      v28[0] = CFSTR("CDPChannelTTSUPayloadKey");
      v28[1] = CFSTR("CDPChannelTTSUPayloadBackupRecordsExistKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(v18 + 8));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v20;
      v28[2] = CFSTR("CDPChannelTTSUPayloadiCloudKeychainEnabledKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDBD1B8];
  }
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v19;
    _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "\"Sending response to requestor: %@\", buf, 0xCu);
  }

  if (v17)
    v23 = 0xFFFFFFFFLL;
  else
    v23 = 0;
  v7[2](v7, v23, MEMORY[0x24BDBD1B8], v19);

}

- (void)setApproverBackupRecordsExist:(BOOL)a3
{
  self->_approverBackupRecordsExist = a3;
}

- (void)setApproveriCloudKeychainState:(unint64_t)a3
{
  self->_approveriCloudKeychainState = a3;
}

- (NSString)telemetryFlowIDFromRequester
{
  return self->_telemetryFlowIDFromRequester;
}

- (CUMessageSession)sharingSession
{
  return self->_sharingSession;
}

- (void)setSharingSession:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSession, 0);
  objc_storeStrong((id *)&self->_telemetryFlowIDFromRequester, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20DB2C000, log, OS_LOG_TYPE_FAULT, "@\"CDPTTSUChannel: No response data or error receieved\", v1, 2u);
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, a3, "@\"CDPTTSUChannel: Recieved reply: %@\", (uint8_t *)&v3);
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, v4, "\"CDPTTSUChannel: Received error: %@\", (uint8_t *)&v5);

}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, a3, "\"Setting _approveriCloudKeychainState = %ld\", (uint8_t *)&v3);
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_5(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Setting _approverBackupRecordsExist = %{BOOL}d\", (uint8_t *)v2, 8u);
}

@end
