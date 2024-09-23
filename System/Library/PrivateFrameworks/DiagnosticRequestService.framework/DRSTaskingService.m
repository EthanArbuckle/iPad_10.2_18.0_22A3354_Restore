@implementation DRSTaskingService

+ (id)databaseDirectory
{
  return CFSTR("/private/var/mobile/Library/DiagnosticPipeline");
}

+ (BOOL)serviceIsEnabled
{
  if (serviceIsEnabled_onceToken != -1)
    dispatch_once(&serviceIsEnabled_onceToken, &__block_literal_global_2);
  return serviceIsEnabled_isEnabled;
}

void __37__DRSTaskingService_serviceIsEnabled__block_invoke()
{
  void *v0;
  int v1;
  NSObject *v2;
  uint8_t v3[16];

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isTaskingEnabled");

  if (v1)
  {
    serviceIsEnabled_isEnabled = 0;
    DPLogHandle_ServiceTasking();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v3 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingServiceDisabled", "Tasking Service is disabled due to being Carrier", v3, 2u);
    }

  }
  else
  {
    serviceIsEnabled_isEnabled = 1;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_50);
  return (id)sharedInstance_sharedInstance;
}

void __35__DRSTaskingService_sharedInstance__block_invoke()
{
  DRSTaskingService *v0;
  void *v1;

  DRSRegisterForDeviceUnlockNotification();
  v0 = objc_alloc_init(DRSTaskingService);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[DRSTaskingService deactivateService](self, "deactivateService");
  v3.receiver = self;
  v3.super_class = (Class)DRSTaskingService;
  -[DRSTaskingService dealloc](&v3, sel_dealloc);
}

- (void)deactivateService
{
  NSObject *v3;
  const char *v4;
  const char *v5;
  uint8_t *v6;
  _xpc_connection_s *v7;
  __int16 v8;
  __int16 v9;

  if (-[DRSTaskingService state](self, "state") == 2)
  {
    DPLogHandle_ServiceLifecycle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      v9 = 0;
      v4 = "RedundantTaskingServiceDeactivation";
      v5 = "Tried to deactivate already deactivated service";
      v6 = (uint8_t *)&v9;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v4, v5, v6, 2u);
    }
  }
  else
  {
    self->_state = 2;
    -[DRSTaskingService serviceConnection](self, "serviceConnection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel(v7);

    DPLogHandle_ServiceLifecycle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      v8 = 0;
      v4 = "TaskingServiceDeactivated";
      v5 = (const char *)&unk_1DBC04191;
      v6 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }

}

- (void)_configureInvalidationXPCActivity
{
  NSObject *v3;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  DPLogHandle_ServiceTasking();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfiguringTaskingInvalidationXPCActivity", (const char *)&unk_1DBC04191, buf, 2u);
  }

  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __54__DRSTaskingService__configureInvalidationXPCActivity__block_invoke;
  handler[3] = &unk_1EA3D11E0;
  handler[4] = self;
  xpc_activity_register("com.apple.diagnosticpipeline.tasking_invalidation_activity", v4, handler);
}

void __54__DRSTaskingService__configureInvalidationXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  NSObject *v13;
  _xpc_activity_s *v14;
  xpc_activity_state_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    DPLogHandle_ServiceTasking();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TaskingInvalidationActivity", (const char *)&unk_1DBC04191, buf, 2u);
    }

    if (!DRSDeviceIsUnlocked())
    {
      DPLogHandle_ServiceTasking();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TaskingInvalidationActivityBailing to avoid waiting for device unlock", (const char *)&unk_1DBC04191, buf, 2u);
      }

      v14 = v3;
      v15 = 5;
      goto LABEL_19;
    }
    objc_msgSend(*(id *)(a1 + 32), "_waitForDeviceUnlockAndInitializeServiceState");
    if (xpc_activity_should_defer(v3))
    {
      DPLogHandle_ServiceTasking();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TaskingInvalidationActivityImmediate deferral", (const char *)&unk_1DBC04191, buf, 2u);
      }

      v14 = v3;
      v15 = 3;
LABEL_19:
      xpc_activity_set_state(v14, v15);
      goto LABEL_20;
    }
    objc_msgSend(*(id *)(a1 + 32), "taskingManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v18 = objc_msgSend(v17, "checkConfigsForInvalidation:", &v24);
    v7 = v24;

    DPLogHandle_ServiceTasking();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_enabled(v19);
    if ((v18 & 1) != 0)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        v21 = "Success!";
        v22 = v19;
        v23 = 2;
LABEL_26:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TaskingInvalidationActivity", v21, buf, v23);
      }
    }
    else if (v20)
    {
      *(_DWORD *)buf = 138543362;
      v26 = v7;
      v21 = "Invalidation check failed due to error: %{public}@";
      v22 = v19;
      v23 = 12;
      goto LABEL_26;
    }

    xpc_activity_set_state(v3, 5);
    goto LABEL_15;
  }
  v6 = state;
  if (state)
  {
    DPLogHandle_ServiceTasking();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134217984;
      v26 = v6;
      v8 = "TaskingInvalidationXPCActivityUnknownState";
      v9 = "Unknown XPC activity state %ld";
      v10 = v7;
      v11 = 12;
      goto LABEL_14;
    }
  }
  else
  {
    DPLogHandle_ServiceTasking();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      v8 = "TaskingInvalidationXPCActivityCheckIn";
      v9 = (const char *)&unk_1DBC04191;
      v10 = v7;
      v11 = 2;
LABEL_14:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, buf, v11);
    }
  }
LABEL_15:

LABEL_20:
}

- (BOOL)activateService
{
  NSObject *v3;
  _QWORD block[5];

  -[DRSTaskingService _configureXPCActivities](self, "_configureXPCActivities");
  -[DRSTaskingService messageQueue](self, "messageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__DRSTaskingService_activateService__block_invoke;
  block[3] = &unk_1EA3D1208;
  block[4] = self;
  dispatch_sync(v3, block);

  return 1;
}

void __36__DRSTaskingService_activateService__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    DPLogHandle_ServiceTaskingError();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      DRSStringForServiceState(objc_msgSend(*(id *)(a1 + 32), "state"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v3;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RedundantServiceActivation", "Tried to activate while in state: %{public}@", (uint8_t *)&v5, 0xCu);

    }
  }
  else
  {
    DPLogHandle_ServiceTasking();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v5) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingServiceActivation", (const char *)&unk_1DBC04191, (uint8_t *)&v5, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "serviceConnection");
    v2 = objc_claimAutoreleasedReturnValue();
    xpc_connection_activate((xpc_connection_t)v2);
  }

}

- (void)_sendReplyForMessage:(id)a3 replyType:(unint64_t)a4 rejectionReason:(const char *)a5
{
  xpc_object_t reply;
  _xpc_connection_s *v8;
  xpc_object_t xdict;

  xdict = a3;
  reply = xpc_dictionary_create_reply(xdict);
  xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", a4);
  if (a5)
    xpc_dictionary_set_string(reply, "TaskingAdminRequest_RejectionReason", a5);
  xpc_dictionary_get_remote_connection(xdict);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v8, reply);

}

- (void)_handleJSONTaskingSystemMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  const void *data;
  _BOOL8 v12;
  BOOL v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  _BOOL8 v17;
  id v18;
  NSObject *v19;
  void *v20;
  char v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  size_t length;
  uint8_t buf[4];
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "hasAdminEntitlement") & 1) != 0)
  {
    length = 0;
    data = xpc_dictionary_get_data(v8, "JSONData", &length);
    v12 = xpc_dictionary_get_BOOL(v8, "emitCATelemetry");
    if (data)
      v13 = length == 0;
    else
      v13 = 1;
    if (!v13)
    {
      v17 = v12;
      v18 = objc_alloc(MEMORY[0x1E0C99D50]);
      v19 = objc_msgSend(v18, "initWithBytes:length:", data, length);
      -[DRSTaskingService taskingManager](self, "taskingManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "processTaskingSystemMessageJSONData:transaction:shouldEmitCATelemetry:", v19, v10, v17);

      if ((v21 & 1) != 0)
      {
        -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v8, 1, 0);
        DPLogHandle_ServiceTaskingXPC();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v14))
        {
          objc_msgSend(v9, "stateDescription");
          v22 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v22;
          v23 = "TaskingSystemMessage_AcceptedJSON";
          v24 = "Accepted tasking system JSON message from %{public}@";
LABEL_17:
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v23, v24, buf, 0xCu);

        }
      }
      else
      {
        -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v8, 1, "Invalid JSON in message");
        DPLogHandle_ServiceTaskingXPCError();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v14))
        {
          objc_msgSend(v9, "stateDescription");
          v22 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v22;
          v23 = "TaskingSystemMessage_BadJSON";
          v24 = "Rejecting tasking system message from %{public}@ due to incorrect JSON format";
          goto LABEL_17;
        }
      }
LABEL_18:

      goto LABEL_19;
    }
    -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v8, 1, "Invalid data buffer in message");
    DPLogHandle_ServiceTaskingXPCError();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      objc_msgSend(v9, "stateDescription");
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      v15 = "TaskingSystemMessage_BadData";
      v16 = "Rejecting tasking system message from %{public}@ due to bad or missing JSON data field";
LABEL_11:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v15, v16, buf, 0xCu);
      goto LABEL_18;
    }
  }
  else
  {
    -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v8, 1, "Missing required entitlement");
    DPLogHandle_ServiceTaskingXPCError();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      objc_msgSend(v9, "stateDescription");
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      v15 = "TaskingSystemMessage_Rejected";
      v16 = "Rejecting tasking system message from %{public}@ due to missing entitlement";
      goto LABEL_11;
    }
  }
LABEL_19:

}

- (void)_sendConfigStateReplyForMessage:(id)a3 rejectionReason:(const char *)a4 state:(unsigned __int8)a5 completionType:(unint64_t)a6
{
  unsigned int v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  xpc_object_t reply;
  _xpc_connection_s *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v7 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  DPLogHandle_ServiceTaskingXPCError();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    DRConfigStringForState();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = "Accepted";
    if (a4)
      v13 = a4;
    v16 = 138543618;
    v17 = v11;
    v18 = 2082;
    v19 = v13;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigStateReply", "Replying with %{public}@ %{public}s", (uint8_t *)&v16, 0x16u);

  }
  reply = xpc_dictionary_create_reply(v9);
  xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", 2uLL);
  if (a4)
  {
    xpc_dictionary_set_string(reply, "TaskingAdminRequest_RejectionReason", a4);
  }
  else
  {
    xpc_dictionary_set_uint64(reply, "configState", v7);
    xpc_dictionary_set_uint64(reply, "completionType", a6);
  }
  xpc_dictionary_get_remote_connection(v9);
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v15, reply);

}

- (void)_handleConfigStateMessage:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  const char *string;
  void *v9;
  void *v10;
  char v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  DRSTaskingService *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  string = xpc_dictionary_get_string(v6, "teamID");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0
      || (xpc_dictionary_get_remote_connection(v6),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v7, "hasTeamIDEntitlement:connection:", v9, v10),
          v10,
          (v11 & 1) != 0))
    {
      v12 = xpc_dictionary_get_string(v6, "configUUID");
      if (v12)
      {
        v13 = v12;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v14);
        if (v15)
        {
          -[DRSTaskingService taskingManager](self, "taskingManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          objc_msgSend(v16, "metadataForConfigUUID:teamID:errorOut:", v15, v9, &v40);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v40;

          if (v18)
          {
            v39 = v17;
            DPLogHandle_ServiceTaskingXPCError();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v19))
            {
              objc_msgSend(v18, "localizedDescription");
              v20 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v42 = v20;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Lookup error %{public}@", buf, 0xCu);

            }
            v21 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v18, "localizedDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("DB lookup error: %@"), v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = objc_retainAutorelease(v23);
            -[DRSTaskingService _sendConfigStateReplyForMessage:rejectionReason:state:completionType:](self, "_sendConfigStateReplyForMessage:rejectionReason:state:completionType:", v6, objc_msgSend(v24, "UTF8String"), 0, 0);

            v17 = v39;
          }
          else
          {
            DPLogHandle_ServiceTaskingXPC();
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = os_signpost_enabled(v30);
            if (v17)
            {
              if (v31)
              {
                objc_msgSend(v17, "state");
                DRConfigStringForState();
                v32 = v17;
                v33 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v42 = v33;
                v43 = 2114;
                v44 = v9;
                v45 = 2114;
                v46 = v15;
                _os_signpost_emit_with_name_impl(&dword_1DBB92000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateMessageSuccess", "Got state '%{public}@' for team ID %{public}@, config UUID %{public}@", buf, 0x20u);

                v17 = v32;
              }

              v34 = objc_msgSend(v17, "state");
              v35 = objc_msgSend(v17, "completionType");
              v36 = self;
              v37 = v6;
              v38 = v34;
            }
            else
            {
              if (v31)
              {
                *(_DWORD *)buf = 138543618;
                v42 = (const char *)v9;
                v43 = 2114;
                v44 = v15;
                _os_signpost_emit_with_name_impl(&dword_1DBB92000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateMessageSuccess", "Unknown state for team ID %{public}@, config UUID %{public}@", buf, 0x16u);
              }

              v36 = self;
              v37 = v6;
              v38 = 0;
              v35 = 0;
            }
            -[DRSTaskingService _sendConfigStateReplyForMessage:rejectionReason:state:completionType:](v36, "_sendConfigStateReplyForMessage:rejectionReason:state:completionType:", v37, 0, v38, v35);
          }

        }
        else
        {
          DPLogHandle_ServiceTaskingXPCError();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v29))
          {
            *(_DWORD *)buf = 136446210;
            v42 = v13;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Invalid UUID string %{public}s", buf, 0xCu);
          }

          -[DRSTaskingService _sendConfigStateReplyForMessage:rejectionReason:state:completionType:](self, "_sendConfigStateReplyForMessage:rejectionReason:state:completionType:", v6, "Invalid config UUID string", 0, 0);
        }

        goto LABEL_33;
      }
      DPLogHandle_ServiceTaskingXPCError();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Missing UUID field", buf, 2u);
      }

      v27 = "No Config UUID";
    }
    else
    {
      DPLogHandle_ServiceTaskingXPCError();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Not properly entitled", buf, 2u);
      }

      v27 = "Not properly entitled";
    }
    -[DRSTaskingService _sendConfigStateReplyForMessage:rejectionReason:state:completionType:](self, "_sendConfigStateReplyForMessage:rejectionReason:state:completionType:", v6, v27, 0, 0);
LABEL_33:

    goto LABEL_34;
  }
  DPLogHandle_ServiceTaskingXPCError();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Missing teamID field", buf, 2u);
  }

  -[DRSTaskingService _sendConfigStateReplyForMessage:rejectionReason:state:completionType:](self, "_sendConfigStateReplyForMessage:rejectionReason:state:completionType:", v6, "No teamID", 0, 0);
LABEL_34:

}

- (void)_sendClearStateReplyForMessage:(id)a3 rejectionReason:(const char *)a4
{
  xpc_object_t reply;
  _xpc_connection_s *v6;
  xpc_object_t xdict;

  xdict = a3;
  reply = xpc_dictionary_create_reply(xdict);
  xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", 3uLL);
  if (a4)
    xpc_dictionary_set_string(reply, "TaskingAdminRequest_RejectionReason", a4);
  xpc_dictionary_get_remote_connection(xdict);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v6, reply);

}

- (void)_handleClearTaskingStateMessage:(id)a3 state:(id)a4
{
  id v6;
  void *v7;
  char v8;
  DRSTaskingService *v9;
  id v10;
  const char *v11;
  uint64_t v12;

  v6 = a3;
  if ((objc_msgSend(a4, "hasAdminEntitlement") & 1) == 0)
  {
    v11 = "Missing required entitlement";
LABEL_6:
    v9 = self;
    v10 = v6;
    goto LABEL_7;
  }
  -[DRSTaskingService taskingManager](self, "taskingManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "clearTaskingHistoryWithErrorOut:", &v12);

  if ((v8 & 1) == 0)
  {
    v11 = "Clear failed";
    goto LABEL_6;
  }
  v9 = self;
  v10 = v6;
  v11 = 0;
LABEL_7:
  -[DRSTaskingService _sendClearStateReplyForMessage:rejectionReason:](v9, "_sendClearStateReplyForMessage:rejectionReason:", v10, v11);

}

- (void)_handleConfigCompletionMessage:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  const char *string;
  const char *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  string = xpc_dictionary_get_string(v6, "teamID");
  if (string)
  {
    v9 = string;
    xpc_dictionary_get_remote_connection(v6);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0
      || (objc_msgSend(v7, "hasTeamIDEntitlement:connection:", v11, v10) & 1) != 0)
    {
      v12 = xpc_dictionary_get_string(v6, "configUUID");
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);

        if (v14)
        {
          v15 = xpc_dictionary_get_BOOL(v6, "isRejected");
          -[DRSTaskingService taskingManager](self, "taskingManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v15)
            objc_msgSend(v16, "clientRejectsConfigUUID:teamID:", v14, v11);
          else
            objc_msgSend(v16, "clientCompletedConfigUUID:teamID:", v14, v11);

          -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 4, 0);
          goto LABEL_17;
        }
      }
      -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 4, "Invalid UUID");
      DPLogHandle_ServiceTaskingXPCError();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        objc_msgSend(v7, "stateDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        v19 = "Invalid UUID from client %{public}@";
LABEL_14:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigCompletionMessageMissingEntitlement", v19, (uint8_t *)&v20, 0xCu);

      }
    }
    else
    {
      -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 4, "Not entitled");
      DPLogHandle_ServiceTaskingXPCError();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        objc_msgSend(v7, "stateDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        v19 = "Insufficient entitlements for client %{public}@";
        goto LABEL_14;
      }
    }
LABEL_17:

    goto LABEL_18;
  }
  -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 4, "No teamID provided");
  DPLogHandle_ServiceTaskingXPCError();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigCompletionMessageMissingTeamID", "No team ID provided in message", (uint8_t *)&v20, 2u);
  }
LABEL_18:

}

- (void)_handleBroadcastRequestMessaage:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  const char *string;
  const char *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  string = xpc_dictionary_get_string(v6, "teamID");
  if (string)
  {
    v9 = string;
    xpc_dictionary_get_remote_connection(v6);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0
      || (objc_msgSend(v7, "hasTeamIDEntitlement:connection:", v11, v10) & 1) != 0)
    {
      -[DRSTaskingService eventPublisher](self, "eventPublisher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "publishCurrentConfigForTeamID:", v11);

      -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 5, 0);
      DPLogHandle_ServiceTaskingXPC();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        LOWORD(v15) = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestMessageSuccess", (const char *)&unk_1DBC04191, (uint8_t *)&v15, 2u);
      }
    }
    else
    {
      -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 5, "Not entitled");
      DPLogHandle_ServiceTaskingXPCError();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        objc_msgSend(v7, "stateDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v14;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestMessageMissingEntitlement", "Insufficient entitlements for client %{public}@", (uint8_t *)&v15, 0xCu);

      }
    }

  }
  else
  {
    -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 5, "No teamID provided");
    DPLogHandle_ServiceTaskingXPCError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestMessageMissingTeamID", "No team ID provided in message", (uint8_t *)&v15, 2u);
    }
  }

}

- (void)_handleCloudChannelConfigGet:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  xpc_object_t reply;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  _xpc_connection_s *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0)
  {
    -[DRSTaskingService taskingManager](self, "taskingManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "persistedCloudChannelConfig");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSObject debugDescription](v9, "debugDescription");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("Not subscribed");
    }
    reply = xpc_dictionary_create_reply(v6);
    xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", 6uLL);
    v13 = objc_retainAutorelease(v10);
    xpc_dictionary_set_string(reply, "description", (const char *)-[__CFString UTF8String](v13, "UTF8String"));
    if (v9)
    {
      xpc_dictionary_set_uint64(reply, "platform", -[NSObject platform](v9, "platform"));
      xpc_dictionary_set_uint64(reply, "type", -[NSObject type](v9, "type"));
      xpc_dictionary_set_uint64(reply, "environment", -[NSObject environment](v9, "environment"));
      xpc_dictionary_set_BOOL(reply, "overridesDeviceDefault", -[NSObject overridesDeviceDefault](v9, "overridesDeviceDefault"));
      xpc_dictionary_set_BOOL(reply, "hasConfig", 1);
      -[DRSTaskingService taskingManager](self, "taskingManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_BOOL(reply, "dropsMessages", objc_msgSend(v14, "isTaskingEnabled") != 1);

      -[NSObject populationSliceNumber](v9, "populationSliceNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[NSObject populationSliceNumber](v9, "populationSliceNumber");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_uint64(reply, "populationSliceNumber", objc_msgSend(v16, "unsignedLongLongValue"));

      }
    }
    xpc_dictionary_get_remote_connection(v6);
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v17, reply);

  }
  else
  {
    -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 6, "Not entitled");
    DPLogHandle_ServiceTaskingXPCError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      objc_msgSend(v7, "stateDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigGetMissingEntitlement", "Insufficient entitlements for client %{public}@", (uint8_t *)&v18, 0xCu);

    }
  }

}

- (void)_applyCloudChannelConfig:(id)a3 dueToMessage:(id)a4 state:(id)a5 messageType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  char v30;
  __CFString *v31;
  void *v32;
  char v33;
  __CFString *v34;
  void *v35;
  char v36;
  NSObject *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  id v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  const __CFString *v70;
  const __CFString *v71;
  const char *v72;
  const char *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  uint64_t v79;
  const __CFString *v80;
  const __CFString *v81;
  DRSTaskingService *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  const __CFString *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[DRSTaskingService taskingManager](self, "taskingManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "taskingMessageChannel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v84 = v10;
  if (v10)
  {
    v16 = a6;
    objc_msgSend(v14, "config");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[DRSTaskingService taskingManager](self, "taskingManager");
      v82 = self;
      v19 = v12;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "taskingMessageChannel");
      v21 = v11;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "config");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqual:", v84);

      v11 = v21;
      v12 = v19;
      self = v82;

      a6 = v16;
      if (v24)
      {
        DPLogHandle_ServiceTaskingXPC();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v25))
        {
          objc_msgSend(v12, "stateDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "debugDescription");
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = (uint64_t)v26;
          v90 = 2114;
          v91 = v27;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AlreadySubscribed", "Client %{public}@ requested subscription to %{public}@, but we are already subscribed to that channel", buf, 0x16u);

        }
LABEL_9:

        -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v11, a6, 0);
        goto LABEL_47;
      }
    }
    else
    {

    }
  }
  else
  {

    if (!v15)
    {
      DPLogHandle_ServiceTaskingXPC();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v25))
      {
        objc_msgSend(v12, "stateDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v89 = (uint64_t)v28;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AlreadyNotSubscribed", "Client %{public}@ requested unsubscription, but we are already not subscribed to any channel", buf, 0xCu);

      }
      goto LABEL_9;
    }
  }
  -[DRSTaskingService taskingManager](self, "taskingManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0;
  v30 = objc_msgSend(v29, "unsubscribeFromSubscribedChannelWithErrorOut:", &v87);
  v31 = (__CFString *)v87;

  if ((v30 & 1) != 0)
  {

    -[DRSTaskingService taskingManager](self, "taskingManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0;
    v33 = objc_msgSend(v32, "updatePersistedChannelConfig:errorOut:", v84, &v86);
    v34 = (__CFString *)v86;

    if ((v33 & 1) != 0)
    {

      -[DRSTaskingService taskingManager](self, "taskingManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = 0;
      v36 = objc_msgSend(v35, "subscribeToChannelWithConfig:errorOut:", v84, &v85);
      v34 = (__CFString *)v85;

      if ((v36 & 1) != 0)
      {
        DPLogHandle_ServiceTaskingXPC();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v37))
        {
          -[DRSTaskingService taskingManager](self, "taskingManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "taskingMessageChannel");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "debugDescription");
          v40 = a6;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v89 = (uint64_t)v41;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelSubscriptionUpdateSucceeded", "Subscribe to cloud channel: %{public}@", buf, 0xCu);

          a6 = v40;
        }

        -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v11, a6, 0);
        goto LABEL_46;
      }
      v74 = (void *)MEMORY[0x1E0CB3940];
      -[__CFString localizedDescription](v34, "localizedDescription");
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = (void *)v75;
      if (v75)
        v77 = (const __CFString *)v75;
      else
        v77 = CFSTR("Unknown");
      objc_msgSend(v74, "stringWithFormat:", CFSTR("Subscription failed due to error %@"), v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = objc_retainAutorelease(v78);
      -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v11, a6, objc_msgSend(v66, "UTF8String"));
      DPLogHandle_ServiceTaskingXPCError();
      v67 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v67))
      {
LABEL_45:

LABEL_46:
        goto LABEL_47;
      }
      objc_msgSend(v84, "debugDescription");
      v79 = objc_claimAutoreleasedReturnValue();
      v69 = (void *)v79;
      v80 = CFSTR("(Default)");
      if (v79)
        v80 = (const __CFString *)v79;
      if (v34)
        v81 = v34;
      else
        v81 = CFSTR("Unknown");
      *(_DWORD *)buf = 138543618;
      v89 = (uint64_t)v80;
      v90 = 2114;
      v91 = v81;
      v72 = "CloudChannelSubscriptionFailed";
      v73 = "Failed to subscribe to cloud channel configuration: %{public}@ due to error %{public}@";
    }
    else
    {
      v61 = (void *)MEMORY[0x1E0CB3940];
      -[__CFString localizedDescription](v34, "localizedDescription");
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)v62;
      if (v62)
        v64 = (const __CFString *)v62;
      else
        v64 = CFSTR("Unknown");
      objc_msgSend(v61, "stringWithFormat:", CFSTR("Failed to update persisted cloud channel config due to error %@"), v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = objc_retainAutorelease(v65);
      -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v11, a6, objc_msgSend(v66, "UTF8String"));
      DPLogHandle_ServiceTaskingXPCError();
      v67 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v67))
        goto LABEL_45;
      objc_msgSend(v84, "debugDescription");
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = (void *)v68;
      v70 = CFSTR("(None)");
      if (v68)
        v70 = (const __CFString *)v68;
      if (v34)
        v71 = v34;
      else
        v71 = CFSTR("Unknown");
      *(_DWORD *)buf = 138543618;
      v89 = (uint64_t)v70;
      v90 = 2114;
      v91 = v71;
      v72 = "PersistCloudChannelConfigurationFailed";
      v73 = "Failed to persist cloud channel configuration: %{public}@ due to error %{public}@";
    }
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v67, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v72, v73, buf, 0x16u);

    goto LABEL_45;
  }
  v83 = v12;
  v42 = (void *)MEMORY[0x1E0CB3940];
  -[DRSTaskingService taskingManager](self, "taskingManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "taskingMessageChannel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "config");
  v45 = a6;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "debugDescription");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString localizedDescription](v31, "localizedDescription");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = v11;
  v50 = (void *)v48;
  v51 = CFSTR("Unknown");
  if (v48)
    v51 = (const __CFString *)v48;
  objc_msgSend(v42, "stringWithFormat:", CFSTR("Failed to unsubscribe from cloud channel %@ due to error %@"), v47, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v49;
  v53 = objc_retainAutorelease(v52);
  -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v49, v45, objc_msgSend(v53, "UTF8String"));
  DPLogHandle_ServiceTaskingXPCError();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v54))
  {
    -[DRSTaskingService taskingManager](self, "taskingManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "taskingMessageChannel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "config");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "debugDescription");
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)v58;
    v60 = CFSTR("Unknown");
    if (v31)
      v60 = v31;
    *(_DWORD *)buf = 138543618;
    v89 = v58;
    v90 = 2114;
    v91 = v60;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v54, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnsubscribeFailed", "Failed to unsubscribe from configuration: %{public}@ due to error %{public}@", buf, 0x16u);

  }
  v12 = v83;
LABEL_47:

}

- (void)_handleCloudChannelConfigSet:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  NSObject *p_super;
  NSObject *v9;
  unsigned __int8 uint64;
  unsigned __int8 v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  DRSCloudChannelConfig *v16;
  DRSCloudChannelConfig *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  int v23;
  NSObject *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0)
  {
    if (xpc_dictionary_get_BOOL(v6, "noSubscription"))
    {
      p_super = -[DRSCloudChannelConfig initNoSubscriptionConfig:]([DRSCloudChannelConfig alloc], "initNoSubscriptionConfig:", 1);
LABEL_15:
      -[DRSTaskingService _applyCloudChannelConfig:dueToMessage:state:messageType:](self, "_applyCloudChannelConfig:dueToMessage:state:messageType:", p_super, v6, v7, 7);
      goto LABEL_16;
    }
    uint64 = xpc_dictionary_get_uint64(v6, "platform");
    v11 = xpc_dictionary_get_uint64(v6, "type");
    v12 = xpc_dictionary_get_uint64(v6, "environment");
    xpc_dictionary_get_value(v6, "populationSliceNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v6, "populationSliceNumber"));
      p_super = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[DRSCloudChannelConfig sliceCountForPlatform:channelType:](DRSCloudChannelConfig, "sliceCountForPlatform:channelType:", uint64, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", +[DRSCloudChannelConfig populationSliceForDevice:](DRSCloudChannelConfig, "populationSliceForDevice:", objc_msgSend(v14, "unsignedShortValue")));
        p_super = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        p_super = 0;
      }

    }
    v16 = -[DRSCloudChannelConfig initWithValidPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:]([DRSCloudChannelConfig alloc], "initWithValidPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:", uint64, v11, v12, p_super, 1);
    if (v16)
    {
      v17 = v16;

      p_super = &v17->super;
      goto LABEL_15;
    }
    -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 7, "Invalid or unsupported channel configuration");
    DPLogHandle_ServiceTaskingXPCError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      DRSSystemProfilePlatformStringForPlatform(uint64);
      v18 = objc_claimAutoreleasedReturnValue();
      +[DRSCloudChannelConfig stringForEnvironment:](DRSCloudChannelConfig, "stringForEnvironment:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[DRSCloudChannelConfig stringForChannelType:](DRSCloudChannelConfig, "stringForChannelType:", v11);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v23 = 138544130;
      v22 = CFSTR("None");
      v24 = v18;
      if (p_super)
        v22 = (const __CFString *)p_super;
      v25 = 2114;
      v26 = v19;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v22;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetCloudChannelConfigurationInvalid", "Invalid cloud channel configuration: %{public}@ %{public}@ %{public}@ %{public}@", (uint8_t *)&v23, 0x2Au);

    }
    goto LABEL_6;
  }
  -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 7, "Not entitled");
  DPLogHandle_ServiceTaskingXPCError();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(p_super))
  {
    objc_msgSend(v7, "stateDescription");
    v9 = objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, p_super, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigSetMissingEntitlement", "Insufficient entitlements for client %{public}@", (uint8_t *)&v23, 0xCu);
LABEL_6:

  }
LABEL_16:

}

- (void)_handleCloudChannelConfigReset:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0)
  {
    +[DRSCloudChannelConfig staticSnapshotDeviceDefaultCloudChannelConfig](DRSCloudChannelConfig, "staticSnapshotDeviceDefaultCloudChannelConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTaskingService _applyCloudChannelConfig:dueToMessage:state:messageType:](self, "_applyCloudChannelConfig:dueToMessage:state:messageType:", v8, v6, v7, 8);

  }
  else
  {
    -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v6, 8, "Not entitled");
    DPLogHandle_ServiceTaskingXPCError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      objc_msgSend(v7, "stateDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigResetMissingEntitlement", "Insufficient entitlements for client %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (void)_handleInvalidMessage:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  xpc_object_t reply;
  _xpc_connection_s *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  DPLogHandle_ServiceTaskingXPCError();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    objc_msgSend(v5, "stateDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRequest", "Received invalid message from client %{public}@", (uint8_t *)&v11, 0xCu);

  }
  reply = xpc_dictionary_create_reply(v6);
  xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", 0);
  xpc_dictionary_set_string(reply, "TaskingAdminRequest_RejectionReason", "Unknown, missing, or invalid client message type");
  xpc_dictionary_get_remote_connection(v6);
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v10, reply);
}

- (void)handleRequest:(id)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  xpc_object_t xdict;

  xdict = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1DF0B6DC4]();
  v8 = (void *)os_transaction_create();
  switch(xpc_dictionary_get_uint64(xdict, "TaskingClientMessageType"))
  {
    case 0uLL:
      -[DRSTaskingService _handleInvalidMessage:state:](self, "_handleInvalidMessage:state:", xdict, v6);
      break;
    case 1uLL:
      -[DRSTaskingService _handleJSONTaskingSystemMessage:state:transaction:](self, "_handleJSONTaskingSystemMessage:state:transaction:", xdict, v6, v8);
      break;
    case 2uLL:
      -[DRSTaskingService _handleConfigStateMessage:state:](self, "_handleConfigStateMessage:state:", xdict, v6);
      break;
    case 3uLL:
      -[DRSTaskingService _handleClearTaskingStateMessage:state:](self, "_handleClearTaskingStateMessage:state:", xdict, v6);
      break;
    case 4uLL:
      -[DRSTaskingService _handleConfigCompletionMessage:state:](self, "_handleConfigCompletionMessage:state:", xdict, v6);
      break;
    case 5uLL:
      -[DRSTaskingService _handleBroadcastRequestMessaage:state:](self, "_handleBroadcastRequestMessaage:state:", xdict, v6);
      break;
    case 6uLL:
      -[DRSTaskingService _handleCloudChannelConfigGet:state:](self, "_handleCloudChannelConfigGet:state:", xdict, v6);
      break;
    case 7uLL:
      -[DRSTaskingService _handleCloudChannelConfigSet:state:](self, "_handleCloudChannelConfigSet:state:", xdict, v6);
      break;
    case 8uLL:
      -[DRSTaskingService _handleCloudChannelConfigReset:state:](self, "_handleCloudChannelConfigReset:state:", xdict, v6);
      break;
    default:
      break;
  }

  objc_autoreleasePoolPop(v7);
}

- (void)_checkForDefaultSubscriptionUpdate
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1DBB92000, v0, v1, "ERROR: Failed to unsubscribe to channel due to error %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_waitForDeviceUnlockAndInitializeServiceState
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke;
  block[3] = &unk_1EA3D1208;
  block[4] = self;
  if (_waitForDeviceUnlockAndInitializeServiceState_onceToken != -1)
    dispatch_once(&_waitForDeviceUnlockAndInitializeServiceState_onceToken, block);
}

void __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DRSTaskingDecisionMaker *v7;
  void *v8;
  DRSTaskingDecisionMaker *v9;
  id v10;
  void *v11;
  DRSTaskingManager *v12;
  uint64_t v13;
  void *v14;
  DRSTaskingEventPublisher *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  char v28;
  __CFString *v29;
  NSObject *v30;
  const __CFString *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  _QWORD aBlock[4];
  id v43;
  id location;
  id v45;
  uint8_t buf[4];
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  DRSWaitForDeviceUnlock();
  objc_msgSend((id)objc_opt_class(), "databaseDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DPLogHandle_ServiceTasking();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DPLogHandle_ServiceTaskingError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DRSConfirmDirectoryIsInitialized(v2, v3, v4);

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "isInternal");

  if ((_DWORD)v3)
  {
    +[DRSTaskingCloudKitHelper prodContainerHelper](DRSTaskingCloudKitHelper, "prodContainerHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = [DRSTaskingDecisionMaker alloc];
  objc_msgSend((id)objc_opt_class(), "databaseDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  BYTE2(v40) = 1;
  LOWORD(v40) = 1;
  v9 = -[DRSTaskingDecisionMaker initWithTimezone:limitingParameters:dbWorkingDirectoryPath:cloudKitHelper:enforceDate:enforceBuild:enforceSampling:enforceTeamHysteresis:enforceGlobalHysteresisAndCap:errorOut:](v7, "initWithTimezone:limitingParameters:dbWorkingDirectoryPath:cloudKitHelper:enforceDate:enforceBuild:enforceSampling:enforceTeamHysteresis:enforceGlobalHysteresisAndCap:errorOut:", 0, 0, v8, v6, 1, 1, v40, &v45);
  v10 = v45;

  if (!v9)
  {
    DPLogHandle_ServiceTaskingError();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v33))
    {
      objc_msgSend(v10, "localizedDescription");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      v36 = CFSTR("Unknown");
      if (v34)
        v36 = (const __CFString *)v34;
      *(_DWORD *)buf = 138543362;
      v47 = v36;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingDecisionMakerCreationFailure", "FATAL ERROR: Failed to create tasking decision maker due to error: %{public}@", buf, 0xCu);

    }
    DPLogHandle_ServiceTaskingError();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_1(v10, v37);

    exit(1);
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_93;
  aBlock[3] = &unk_1EA3D1230;
  objc_copyWeak(&v43, &location);
  v11 = _Block_copy(aBlock);
  v12 = -[DRSTaskingManager initWithDecisionMaker:cloudKitHelper:configStateChangeBlock:]([DRSTaskingManager alloc], "initWithDecisionMaker:cloudKitHelper:configStateChangeBlock:", v9, v6, v11);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 32);
  *(_QWORD *)(v13 + 32) = v12;

  v15 = [DRSTaskingEventPublisher alloc];
  -[DRSTaskingDecisionMaker configStore](v9, "configStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[DRSTaskingEventPublisher initWithConfigStore:](v15, "initWithConfigStore:", v16);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 48);
  *(_QWORD *)(v18 + 48) = v17;

  objc_msgSend(*(id *)(a1 + 32), "eventPublisher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = v20 == 0;

  if ((_DWORD)v16)
  {
    DPLogHandle_ServiceTaskingError();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventPublisherInitFailure", "FATAL ERROR: Failed to create event publisher", buf, 2u);
    }

    DPLogHandle_ServiceTaskingError();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_2(v39);

    exit(1);
  }
  objc_msgSend(*(id *)(a1 + 32), "taskingManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "persistedCloudChannelConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  DPLogHandle_ServiceTasking();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v23))
  {
    objc_msgSend(v22, "debugDescription");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = CFSTR("MISSING");
    if (v24)
      v26 = (const __CFString *)v24;
    *(_DWORD *)buf = 138543362;
    v47 = v26;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistedCloudChannelConfig", "Existing persisted cloud channel config %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "taskingManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v28 = objc_msgSend(v27, "subscribeToChannelWithConfig:errorOut:", v22, &v41);
  v29 = (__CFString *)v41;

  if ((v28 & 1) != 0)
  {

    objc_msgSend(*(id *)(a1 + 32), "_checkForDefaultSubscriptionUpdate");
  }
  else
  {
    DPLogHandle_ServiceTaskingError();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v30))
    {
      v31 = CFSTR("Unknown");
      if (v29)
        v31 = v29;
      *(_DWORD *)buf = 138543362;
      v47 = v31;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelSubscriptionError", "ERROR: Failed to subscribe to channel due to error %{public}@", buf, 0xCu);
    }

    DPLogHandle_ServiceTaskingError();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      -[DRSTaskingService _checkForDefaultSubscriptionUpdate].cold.1();

  }
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

}

void __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_93(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, unint64_t a6, int a7)
{
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  DPLogHandle_ServiceTasking();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    DRConfigStringForState();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    DRSTaskingStringForTaskingStateChangeReason(a6);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v23 = 138544386;
    v21 = &stru_1EA3D37D0;
    v24 = v13;
    if (a7)
      v21 = CFSTR(" (Notified clients)");
    v25 = 2114;
    v26 = v14;
    v27 = 2114;
    v28 = v18;
    v29 = 2114;
    v30 = v19;
    v31 = 2112;
    v32 = v21;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigStateChange", "%{public}@: Config %{public}@ moved to %{public}@ for reason %{public}@%@", (uint8_t *)&v23, 0x34u);

  }
  if (a7)
  {
    objc_msgSend(WeakRetained, "eventPublisher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "publishConfigUpdateForTeamID:state:config:", v13, a5, v15);

  }
}

- (DRSTaskingService)init
{
  DRSTaskingService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *messageQueue;
  NSObject *v5;
  xpc_connection_t mach_service;
  OS_xpc_object *serviceConnection;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *serviceDeactivatedSem;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  DRSTaskingService *v13;
  _xpc_connection_s *v14;
  DRSTaskingService *v15;
  NSObject *v16;
  _QWORD handler[4];
  id v19;
  id location;
  _QWORD block[4];
  DRSTaskingService *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)DRSTaskingService;
  v2 = -[DRSTaskingService init](&v23, sel_init);
  if (!v2)
    goto LABEL_4;
  v3 = dispatch_queue_create("com.apple.diagnosticpipeline tasking service message queue", 0);
  messageQueue = v2->_messageQueue;
  v2->_messageQueue = (OS_dispatch_queue *)v3;

  -[DRSTaskingService messageQueue](v2, "messageQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service("com.apple.diagnosticpipeline.tasking.service", v5, 1uLL);
  serviceConnection = v2->_serviceConnection;
  v2->_serviceConnection = mach_service;

  v8 = dispatch_semaphore_create(0);
  serviceDeactivatedSem = v2->_serviceDeactivatedSem;
  v2->_serviceDeactivatedSem = (OS_dispatch_semaphore *)v8;

  -[DRSTaskingService serviceConnection](v2, "serviceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = dispatch_queue_create("DRSTaskingService Initializing Queue", 0);
    v12 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__DRSTaskingService_init__block_invoke;
    block[3] = &unk_1EA3D1208;
    v13 = v2;
    v22 = v13;
    dispatch_async(v11, block);
    objc_initWeak(&location, v13);
    -[DRSTaskingService serviceConnection](v13, "serviceConnection");
    v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = v12;
    handler[1] = 3221225472;
    handler[2] = __25__DRSTaskingService_init__block_invoke_2;
    handler[3] = &unk_1EA3D1258;
    objc_copyWeak(&v19, &location);
    xpc_connection_set_event_handler(v14, handler);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

LABEL_4:
    v15 = v2;
    goto LABEL_8;
  }
  DPLogHandle_ServiceTaskingError();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v16))
  {
    LOWORD(location) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedTaskingServiceLaunch", "Could not create connection for mach service", (uint8_t *)&location, 2u);
  }

  v15 = 0;
LABEL_8:

  return v15;
}

uint64_t __25__DRSTaskingService_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_waitForDeviceUnlockAndInitializeServiceState");
}

void __25__DRSTaskingService_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  DRSTaskingClientConnectionState *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (MEMORY[0x1DF0B73D0](v3) == MEMORY[0x1E0C812E0])
  {
    v8 = -[DRSTaskingClientConnectionState initWithConnection:service:]([DRSTaskingClientConnectionState alloc], "initWithConnection:service:", v3, WeakRetained);
    DPLogHandle_ServiceTasking();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      -[DRSTaskingClientConnectionState stateDescription](v8, "stateDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewTaskingClientConnection", "New connection from client %{public}@", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(WeakRetained, "_waitForDeviceUnlockAndInitializeServiceState");
    goto LABEL_17;
  }
  if (v3 == (id)MEMORY[0x1E0C81260])
  {
    DPLogHandle_ServiceTasking();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingServiceConnectionInvalidated", (const char *)&unk_1DBC04191, (uint8_t *)&v13, 2u);
    }

    v8 = (DRSTaskingClientConnectionState *)objc_loadWeakRetained(v4);
    v8->_hasAdminEntitlement = 2;
    -[DRSTaskingClientConnectionState serviceDeactivatedSem](v8, "serviceDeactivatedSem");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v12);

    goto LABEL_17;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    DPLogHandle_ServiceTasking();
    v8 = (DRSTaskingClientConnectionState *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(&v8->super))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, &v8->super, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingServiceConnectionInterrupted", (const char *)&unk_1DBC04191, (uint8_t *)&v13, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (MEMORY[0x1DF0B73D0](v3) != MEMORY[0x1E0C812F8])
  {
    v6 = (void *)MEMORY[0x1DF0B72BC](v3);
    DPLogHandle_ServiceLifecycle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      v13 = 136446210;
      v14 = v6;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMessageType", "Invalid message type unexpected: %{public}s", (uint8_t *)&v13, 0xCu);
    }

    if (v6)
      free(v6);
  }
LABEL_18:

}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (OS_xpc_object)serviceConnection
{
  return self->_serviceConnection;
}

- (unsigned)state
{
  return self->_state;
}

- (DRSTaskingManager)taskingManager
{
  return self->_taskingManager;
}

- (OS_dispatch_semaphore)serviceDeactivatedSem
{
  return self->_serviceDeactivatedSem;
}

- (DRSTaskingEventPublisher)eventPublisher
{
  return self->_eventPublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPublisher, 0);
  objc_storeStrong((id *)&self->_serviceDeactivatedSem, 0);
  objc_storeStrong((id *)&self->_taskingManager, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
}

void __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1DBB92000, a2, v4, "FATAL ERROR: Could not instantiate the tasking decision maker for the service due to error %{public}@", v5);

}

void __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DBB92000, log, OS_LOG_TYPE_FAULT, "FATAL ERROR: Could not instantiate the tasking event publisher for the service", v1, 2u);
}

@end
