@implementation BMComputeSourceServerConnection

- (BMComputeSourceServerConnection)initWithServer:(id)a3 clientProcess:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BMComputeSourceServerConnection *v9;
  BMComputeSourceServerConnection *v10;
  uint64_t v11;
  BMAccessControlPolicy *accessControlPolicy;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v14.receiver = self;
  v14.super_class = (Class)BMComputeSourceServerConnection;
  v9 = -[BMComputeSourceServerConnection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_server, v6);
    objc_storeStrong((id *)&v10->_clientProcess, a4);
    objc_msgSend(MEMORY[0x1E0D01CD0], "policyForProcess:connectionFlags:useCase:", v7, 0, *MEMORY[0x1E0D01CB8]);
    v11 = objc_claimAutoreleasedReturnValue();
    accessControlPolicy = v10->_accessControlPolicy;
    v10->_accessControlPolicy = (BMAccessControlPolicy *)v11;

  }
  return v10;
}

- (void)eventsPrunedWithStreamIdentifier:(id)a3 account:(id)a4 remoteName:(id)a5 reason:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BMComputeSourceServerConnection eventsPrunedWithStreamIdentifier:account:remoteName:reason:].cold.1();

  -[BMComputeSourceServerConnection server](self, "server");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventsPrunedWithStreamIdentifier:account:remoteName:reason:", v10, v12, v11, a6);

}

- (BMComputeSourceServer)server
{
  return (BMComputeSourceServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlPolicy, 0);
  objc_storeStrong((id *)&self->_clientProcess, 0);
  objc_destroyWeak((id *)&self->_server);
}

- (void)sendEventWithStreamIdentifier:(id)a3 timestamp:(id)a4 signpostID:(unint64_t)a5 eventData:(id)a6 eventDataVersion:(unsigned int)a7 account:(id)a8 remoteName:(id)a9
{
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void (**v25)(_QWORD);
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t aBlock;
  uint64_t v55;
  void (*v56)(uint64_t);
  void *v57;
  id v58;
  unint64_t v59;
  _QWORD v60[4];
  id v61;
  _QWORD block[4];
  id v63;

  v10 = *(_QWORD *)&a7;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  -[BMComputeSourceServerConnection server](self, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v21);

  __biome_log_for_category();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:].cold.5((uint64_t)v15);

  v23 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v55 = 3221225472;
  v56 = __132__BMComputeSourceServerConnection_sendEventWithStreamIdentifier_timestamp_signpostID_eventData_eventDataVersion_account_remoteName___block_invoke;
  v57 = &unk_1E2648B50;
  v59 = a5;
  v24 = v15;
  v58 = v24;
  v25 = (void (**)(_QWORD))_Block_copy(&aBlock);
  if (!v24)
  {
    __biome_log_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:].cold.1(v27);
    goto LABEL_12;
  }
  if ((-[BMAccessControlPolicy allowsComputeSourceAccessToStream:](self->_accessControlPolicy, "allowsComputeSourceAccessToStream:", v24) & 1) == 0)
  {
    __biome_log_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:].cold.4((uint64_t)v24, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_12;
  }
  if (!v17)
  {
    v34 = 0;
LABEL_28:
    -[BMComputeSourceServerConnection server](self, "server", v53, aBlock, v55, v56, v57);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "source");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "sendEventWithStreamIdentifier:timestamp:account:remoteName:storeEvent:", v24, v16, v18, v19, v34);

    v25[2](v25);
    goto LABEL_13;
  }
  v26 = v24;
  v53 = v26;
  if (objc_msgSend(v26, "hasSuffix:", CFSTR(":subscriptions"))
    || objc_msgSend(v26, "hasSuffix:", CFSTR(":tombstones"))
    || objc_msgSend(v26, "isEqualToString:", CFSTR("SleepMode"))
    || objc_msgSend(v26, "isEqualToString:", CFSTR("UserFocusComputedMode"))
    || objc_msgSend(v26, "isEqualToString:", CFSTR("CarPlay"))
    || objc_msgSend(v26, "isEqualToString:", CFSTR("DoNotDisturbWhileDriving"))
    || objc_msgSend(v26, "isEqualToString:", CFSTR("AppLaunch"))
    || objc_msgSend(v26, "isEqualToString:", CFSTR("Mindfulness"))
    || objc_msgSend(v26, "isEqualToString:", CFSTR("GameController"))
    || objc_msgSend(v26, "isEqualToString:", CFSTR("Workout")))
  {
    objc_opt_class();
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v26, "isEqualToString:", CFSTR("Device.SilentMode")))
    {
      block[0] = v23;
      block[1] = 3221225472;
      block[2] = __BMEventClassForStreamIdentifier_block_invoke;
      block[3] = &unk_1E2647C48;
      v43 = v26;
      v63 = v43;
      if (BMEventClassForStreamIdentifier_onceToken == -1)
      {
        v44 = v43;
      }
      else
      {
        dispatch_once(&BMEventClassForStreamIdentifier_onceToken, block);
        v44 = v63;
      }
      v45 = (void *)BMEventClassForStreamIdentifier_silentModeEventClass;
    }
    else
    {
      if ((objc_msgSend(v26, "isEqualToString:", CFSTR("SoundAnalysis.AmbientMusicDetection")) & 1) == 0)
      {

LABEL_41:
        __biome_log_for_category();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:].cold.2((uint64_t)v53, v27, v47, v48, v49, v50, v51, v52);
        goto LABEL_12;
      }
      v60[0] = v23;
      v60[1] = 3221225472;
      v60[2] = __BMEventClassForStreamIdentifier_block_invoke_2;
      v60[3] = &unk_1E2647C48;
      v46 = v26;
      v61 = v46;
      if (BMEventClassForStreamIdentifier_onceToken_200 == -1)
      {
        v44 = v46;
      }
      else
      {
        dispatch_once(&BMEventClassForStreamIdentifier_onceToken_200, v60);
        v44 = v61;
      }
      v45 = (void *)BMEventClassForStreamIdentifier_ambientMusicEventClass;
    }
    v35 = v45;

  }
  v36 = v35;
  if (!v36)
    goto LABEL_41;
  v37 = (uint64_t)v36;
  objc_msgSend(v36, "eventWithData:dataVersion:", v17, v10);
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    v40 = objc_alloc(MEMORY[0x1E0D024C8]);
    objc_msgSend(v16, "doubleValue");
    v34 = (void *)objc_msgSend(v40, "initWithEventBody:timestamp:", v39);

    goto LABEL_28;
  }
  __biome_log_for_category();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:].cold.3(v37);
LABEL_12:

  v25[2](v25);
LABEL_13:

}

void __132__BMComputeSourceServerConnection_sendEventWithStreamIdentifier_timestamp_signpostID_eventData_eventDataVersion_account_remoteName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(*(_QWORD *)(a1 + 40) + 1) >= 2)
  {
    __biome_log_for_category();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_18D810000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SendEvent", "StreamIdentifier=%@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (NSString)description
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<BMComputeSource server: %@ clientProcess: %@ >"), WeakRetained, self->_clientProcess);

  return (NSString *)v5;
}

- (BMProcess)clientProcess
{
  return self->_clientProcess;
}

- (BMAccessControlPolicy)accessControlPolicy
{
  return self->_accessControlPolicy;
}

- (void)sendEventWithStreamIdentifier:(os_log_t)log timestamp:signpostID:eventData:eventDataVersion:account:remoteName:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "BMComputeSourceServerConnection dropping sendEventWithStreamIdentifier due to nil stream", v1, 2u);
}

- (void)sendEventWithStreamIdentifier:(uint64_t)a3 timestamp:(uint64_t)a4 signpostID:(uint64_t)a5 eventData:(uint64_t)a6 eventDataVersion:(uint64_t)a7 account:(uint64_t)a8 remoteName:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "No event body class for stream %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)sendEventWithStreamIdentifier:(uint64_t)a1 timestamp:signpostID:eventData:eventDataVersion:account:remoteName:.cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v1, v2, "Error initializing event body of type %@ for stream %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

- (void)sendEventWithStreamIdentifier:(uint64_t)a3 timestamp:(uint64_t)a4 signpostID:(uint64_t)a5 eventData:(uint64_t)a6 eventDataVersion:(uint64_t)a7 account:(uint64_t)a8 remoteName:.cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "Rejecting sendEvent due to lacking write entitlements for stream %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)sendEventWithStreamIdentifier:(uint64_t)a1 timestamp:signpostID:eventData:eventDataVersion:account:remoteName:.cold.5(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_18D810000, v1, (uint64_t)v1, "BMComputeSourceServerConnection send event with identifier %@, event %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_5();
}

- (void)eventsPrunedWithStreamIdentifier:account:remoteName:reason:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_4(&dword_18D810000, v0, (uint64_t)v0, "BMComputeSourceServerConnection events pruned for stream identifier %@ with reason: %lu", v1);
  OUTLINED_FUNCTION_5();
}

@end
