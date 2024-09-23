@implementation NETunnelProviderSession

- (BOOL)startTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NETunnelProviderSession;
  return -[NEVPNConnection startVPNTunnelWithOptions:andReturnError:](&v5, sel_startVPNTunnelWithOptions_andReturnError_, options, error);
}

- (void)stopTunnel
{
  void *v3;
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (-[NEVPNConnection status](self, "status") && self && self->super._session)
  {
    objc_opt_self();
    v10[0] = 0;
    v10[1] = 0;
    ne_session_get_configuration_id();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v10);
    v4 = (id)wrapperMap;
    objc_sync_enter(v4);
    objc_msgSend((id)wrapperMap, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      v8 = objc_getProperty(v5, v6, 24, 1);
      -[NEIPC stop](v8);

      -[NEIPCWrapper cancel](v7);
    }
    objc_sync_exit(v4);

  }
  v9.receiver = self;
  v9.super_class = (Class)NETunnelProviderSession;
  -[NEVPNConnection stopVPNTunnel](&v9, sel_stopVPNTunnel);
}

- (BOOL)sendProviderMessage:(NSData *)messageData returnError:(NSError *)error responseHandler:(void *)responseHandler
{
  NSData *v8;
  void *v9;
  NSObject *v10;
  NSError *v11;
  void *v12;
  id v13;
  const char *v14;
  NETunnelProviderSession *v15;
  NEIPCWrapper *v16;
  NETunnelProviderSession *v17;
  NETunnelProviderSession *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  void *status;
  NSObject *v22;
  dispatch_queue_t v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  NSObject *Property;
  NETunnelProviderSession *v29;
  BOOL v30;
  id v32;
  _QWORD block[4];
  NETunnelProviderSession *v34;
  NSData *v35;
  id v36;
  uint8_t buf[8];
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  NETunnelProviderSession *v41;
  objc_super v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v8 = messageData;
  v9 = responseHandler;
  if (error)
    *error = 0;
  if (+[NEProvider isRunningInProvider](NEProvider, "isRunningInProvider"))
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "App messages cannot be sent from Network Extension providers", buf, 2u);
    }

    if (error)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 3, 0);
      v11 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v30 = 0;
      *error = v11;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (-[NEVPNConnection status](self, "status") == NEVPNStatusInvalid || !self || !self->super._session)
  {
    if (error)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 1, 0);
      v11 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_25:
    v30 = 0;
    goto LABEL_26;
  }
  objc_opt_self();
  if (sharedWrapperForSession__globals_init != -1)
    dispatch_once(&sharedWrapperForSession__globals_init, &__block_literal_global_21060);
  v43[0] = 0;
  v43[1] = 0;
  ne_session_get_configuration_id();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v43);
  v13 = (id)wrapperMap;
  objc_sync_enter(v13);
  objc_msgSend((id)wrapperMap, "objectForKeyedSubscript:", v12);
  v15 = (NETunnelProviderSession *)objc_claimAutoreleasedReturnValue();
  if (v15)
    goto LABEL_17;
  v16 = [NEIPCWrapper alloc];
  v32 = v12;
  if (v16)
  {
    v42.receiver = v16;
    v42.super_class = (Class)NEIPCWrapper;
    v17 = -[NETunnelProviderSession init](&v42, sel_init);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->super._configManager, v12);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = dispatch_queue_create("NEIPCWrapper IPC queue", v19);
      status = (void *)v18->super._status;
      v18->super._status = (int64_t)v20;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = dispatch_queue_create("NEIPCWrapper send queue", v22);
      v24 = *(void **)&v18->super._installed;
      *(_QWORD *)&v18->super._installed = v23;

      dispatch_suspend(*(dispatch_object_t *)&v18->super._installed);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __43__NEIPCWrapper_initWithSession_identifier___block_invoke;
      v40 = &unk_1E3CC4080;
      v15 = v18;
      v41 = v15;
      ne_session_establish_ipc();

LABEL_17:
      v25 = (void *)wrapperMap;
      v26 = objc_getProperty(v15, v14, 32, 1);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v15, v26);

      goto LABEL_18;
    }
  }

  v15 = 0;
LABEL_18:
  objc_sync_exit(v13);

  if (!v15)
  {
    if (error)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 1, 0);
      v11 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  Property = objc_getProperty(v15, v27, 8, 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke;
  block[3] = &unk_1E3CC3A30;
  v34 = v15;
  v35 = v8;
  v36 = v9;
  v29 = v15;
  dispatch_async(Property, block);

  v30 = 1;
LABEL_26:

  return v30;
}

void __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  id Property;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  SEL v12;
  xpc_object_t v13;
  const char *v14;
  id v15;
  SEL v16;
  _xpc_connection_s *v17;
  void *v18;
  _xpc_connection_s *v19;
  _QWORD v20[4];
  id v21;
  uint64_t handler;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 24, 1))
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
      Property = objc_getProperty(v5, v4, 24, 1);
    else
      Property = 0;
    v7 = *(void **)(a1 + 48);
    v8 = *(id *)(a1 + 40);
    v9 = MEMORY[0x1E0C80D38];
    v10 = v7;
    if (!Property)
      goto LABEL_19;
    v11 = Property;
    objc_sync_enter(v11);
    if (objc_getProperty(v11, v12, 16, 1))
    {
      v13 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v13, "type", 0);
      if (v8)
      {
        v15 = objc_retainAutorelease(v8);
        xpc_dictionary_set_data(v13, "data", (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
      }
      if (v10)
      {
        xpc_dictionary_set_BOOL(v13, "needs-reply", 1);
        v17 = (_xpc_connection_s *)objc_getProperty(v11, v16, 16, 1);
        handler = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke;
        v25 = &unk_1E3CC4240;
        v26 = v10;
        xpc_connection_send_message_with_reply(v17, v13, MEMORY[0x1E0C80D38], &handler);

      }
      else
      {
        v19 = (_xpc_connection_s *)objc_getProperty(v11, v14, 16, 1);
        xpc_connection_send_message(v19, v13);

      }
      -[NEIPC logMessageType:data:actionString:](0, v8, CFSTR("Sent"));
    }
    else
    {
      if (!v10)
      {
LABEL_18:
        objc_sync_exit(v11);

LABEL_19:
        return;
      }
      handler = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke_2;
      v25 = &unk_1E3CC4720;
      v26 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], &handler);
      v13 = v26;
    }

    goto LABEL_18;
  }
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke_2;
    v20[3] = &unk_1E3CC4720;
    v21 = v18;
    dispatch_async(MEMORY[0x1E0C80D38], v20);

  }
}

uint64_t __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
