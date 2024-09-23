@implementation MRMediaRemoteService

- (OS_dispatch_queue)clientCallbackQueue
{
  return self->_clientCallbackQueue;
}

- (void)resolvePlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  id v13;
  _QWORD handler[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  MRCreateXPCMessage(0x200000000000018uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddPlayerPathToXPCMessage(v11, v10);

  -[MRMediaRemoteService connection](self, "connection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __59__MRMediaRemoteService_resolvePlayerPath_queue_completion___block_invoke;
  handler[3] = &unk_1E30C7D98;
  v15 = v8;
  v13 = v8;
  xpc_connection_send_message_with_reply(v12, v11, v9, handler);

}

- (void)setVoiceInputQueue:(id)a3
{
  objc_storeStrong((id *)&self->_voiceInputQueue, a3);
}

- (void)setMrXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_mrXPCConnection, a3);
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setClientCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientCallbackQueue, a3);
}

- (void)setClientCallbackPriorityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientCallbackPriorityQueue, a3);
}

- (void)setBrowsableContentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_browsableContentQueue, a3);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (MRXPCConnection)mrXPCConnection
{
  return self->_mrXPCConnection;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)fetchParticipantsWithRequest:(id)a3 playerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _xpc_connection_s *v13;
  id v14;
  _QWORD handler[4];
  id v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  MRCreateXPCMessage(0x20000000000003CuLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddPlayerPathToXPCMessage(v12, v11);

  -[MRMediaRemoteService connection](self, "connection");
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __81__MRMediaRemoteService_fetchParticipantsWithRequest_playerPath_queue_completion___block_invoke;
  handler[3] = &unk_1E30C7D98;
  v16 = v9;
  v14 = v9;
  xpc_connection_send_message_with_reply(v13, v12, v10, handler);

}

void __81__MRMediaRemoteService_fetchParticipantsWithRequest_playerPath_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t Error;
  void *v6;
  void *v7;
  uint64_t v8;
  UInt8 *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v11 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    Error = MRCreateClientErrorFromXPCMessage(v3);
    if (!Error)
    {
      v9 = (UInt8 *)MRCreateDataFromXPCMessage(v11, "MRXPC_PLAYBACKQUEUE_PARTICIPANTS");
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "msv_compactMap:", &__block_literal_global_23);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = 0;
      }
      else
      {
        v6 = (void *)MRMediaRemoteCreateError(1);
        v7 = 0;
      }

      goto LABEL_9;
    }
  }
  v6 = (void *)Error;
  v7 = 0;
LABEL_9:
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v7, v6);

}

void __68__MRMediaRemoteService_getDeviceInfoForPlayerPath_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;
  void *Error;
  NSObject *v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
    Error = (void *)MRMediaRemoteCreateError(1);
    v6 = 0;
  }
  else
  {
    MRCreateDeviceInfoFromXPCMessage(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    Error = (void *)MRCreateClientErrorFromXPCMessage(*(void **)(a1 + 32));
    if (objc_msgSend(Error, "code") == 3)
    {
      if (MSVDeviceOSIsInternalInstall())
      {
        _MRLogForCategory(0);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          __68__MRMediaRemoteService_getDeviceInfoForPlayerPath_queue_completion___block_invoke_cold_1();

      }
      Error = 0;
    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v6, Error);

}

void __59__MRMediaRemoteService_resolvePlayerPath_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  void *Error;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = (void *)MRMediaRemoteCreateError(1);
    v5 = 0;
  }
  else
  {
    MRCreatePlayerPathFromXPCMessage(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    Error = (void *)MRCreateClientErrorFromXPCMessage(v8);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, Error);
  kdebug_trace();

}

- (void)getDeviceInfoForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  MRCreateXPCMessage(0x20000000000002CuLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddPlayerPathToXPCMessage(v11, v10);

  -[MRMediaRemoteService connection](self, "connection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__MRMediaRemoteService_getDeviceInfoForPlayerPath_queue_completion___block_invoke;
  v15[3] = &unk_1E30C7D70;
  v16 = v11;
  v17 = v8;
  v13 = v8;
  v14 = v11;
  xpc_connection_send_message_with_reply(v12, v14, v9, v15);

}

- (id)getActiveSystemEndpointUIDForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  MRCreateXPCMessage(0x300000000000010uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_int64(v5, "MRXPC_ROUTE_OPTIONS_KEY", a3);
  -[MRMediaRemoteService mrXPCConnection](self, "mrXPCConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "sendSyncMessage:error:", v5, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v8)
  {
    _MRServiceLogReplyError();
    v9 = 0;
  }
  else
  {
    MRCreateStringFromXPCMessage(v7, "MRXPC_ROUTE_UID_KEY");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)UIServerEndpoint
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;

  MRCreateXPCMessage(0xB00000000000001uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaRemoteService mrXPCConnection](self, "mrXPCConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "sendSyncMessage:error:", v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    _MRServiceLogReplyError();
    v7 = 0;
  }
  else
  {
    xpc_dictionary_get_value(v5, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
      objc_msgSend(v7, "_setEndpoint:", v8);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)UIServiceRelayEndpoint
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;

  MRCreateXPCMessage(0xB00000000000002uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaRemoteService mrXPCConnection](self, "mrXPCConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "sendSyncMessage:error:", v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    _MRServiceLogReplyError();
    v7 = 0;
  }
  else
  {
    xpc_dictionary_get_value(v5, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
      objc_msgSend(v7, "_setEndpoint:", v8);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)setUIServiceRelayEndpoint:(id)a3
{
  id v4;
  void *v5;
  _xpc_connection_s *v6;
  xpc_object_t xdict;

  v4 = a3;
  -[MRMediaRemoteService setUiServiceEndpoint:](self, "setUiServiceEndpoint:", v4);
  MRCreateXPCMessage(0xB00000000000003uLL);
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_value(xdict, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY", v5);
  -[MRMediaRemoteService connection](self, "connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v6, xdict);

}

- (BOOL)deviceSupportsUISessions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v9;

  MRCreateXPCMessage(0xB00000000000004uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaRemoteService mrXPCConnection](self, "mrXPCConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "sendSyncMessage:error:", v3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (v6)
  {
    _MRServiceLogReplyError();
    v7 = 0;
  }
  else
  {
    v7 = xpc_dictionary_get_BOOL(v5, "MRXPC_BOOL_RESULT_KEY");
  }

  return v7;
}

- (id)groupSessionServerEndpoint
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;

  MRCreateXPCMessage(0xC00000000000001uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaRemoteService mrXPCConnection](self, "mrXPCConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "sendSyncMessage:error:", v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    _MRServiceLogReplyError();
    v7 = 0;
  }
  else
  {
    xpc_dictionary_get_value(v5, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
      objc_msgSend(v7, "_setEndpoint:", v8);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)joinGroupSessionWithToken:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _xpc_connection_s *v13;
  id v14;
  _QWORD handler[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  MRCreateXPCMessage(0xC00000000000002uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  MRAddDataToXPCMessage(v11, v12, "MRXPC_GROUP_SESSION_TOKEN_KEY");
  -[MRMediaRemoteService connection](self, "connection");
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __67__MRMediaRemoteService_joinGroupSessionWithToken_queue_completion___block_invoke;
  handler[3] = &unk_1E30C7D98;
  v16 = v8;
  v14 = v8;
  xpc_connection_send_message_with_reply(v13, v11, v9, handler);

}

void __67__MRMediaRemoteService_joinGroupSessionWithToken_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *Error;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = (void *)MRMediaRemoteCreateError(1);
    v6 = 0;
  }
  else
  {
    Error = (void *)MRCreateClientErrorFromXPCMessage(v3);
    MRCreateStringFromXPCMessage(v8, "MRXPC_GROUP_SESSION_IDENTIFIER_KEY");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, Error);

}

- (void)leaveGroupSessionWithIdentifier:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  id v13;
  _QWORD handler[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  MRCreateXPCMessage(0xC00000000000003uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddStringToXPCMessage(v11, v10, "MRXPC_GROUP_SESSION_IDENTIFIER_KEY");

  -[MRMediaRemoteService connection](self, "connection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __73__MRMediaRemoteService_leaveGroupSessionWithIdentifier_queue_completion___block_invoke;
  handler[3] = &unk_1E30C7D98;
  v15 = v8;
  v13 = v8;
  xpc_connection_send_message_with_reply(v12, v11, v9, handler);

}

void __73__MRMediaRemoteService_leaveGroupSessionWithIdentifier_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t Error;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  v6 = (void *)Error;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

}

- (void)userIdentityForDSID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  id v13;
  _QWORD handler[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  MRCreateXPCMessage(0xC00000000000007uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddStringToXPCMessage(v11, v10, "MRXPC_DSID_KEY");

  -[MRMediaRemoteService connection](self, "connection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __61__MRMediaRemoteService_userIdentityForDSID_queue_completion___block_invoke;
  handler[3] = &unk_1E30C7D98;
  v15 = v8;
  v13 = v8;
  xpc_connection_send_message_with_reply(v12, v11, v9, handler);

}

void __61__MRMediaRemoteService_userIdentityForDSID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t Error;
  void *v6;
  MRUserIdentity *v7;
  uint64_t v8;
  UInt8 *v9;
  id v10;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v10 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    Error = MRCreateClientErrorFromXPCMessage(v3);
    if (!Error)
    {
      v9 = (UInt8 *)MRCreateDataFromXPCMessage(v10, "MRXPC_USER_IDENTITY_KEY");
      if (v9)
      {
        v7 = -[MRUserIdentity initWithProtobufData:]([MRUserIdentity alloc], "initWithProtobufData:", v9);
        v6 = 0;
      }
      else
      {
        v6 = (void *)MRMediaRemoteCreateError(1);
        v7 = 0;
      }

      goto LABEL_9;
    }
  }
  v6 = (void *)Error;
  v7 = 0;
LABEL_9:
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, MRUserIdentity *, void *))(v8 + 16))(v8, v7, v6);

}

- (void)presentProximityCardWithDeviceName:(id)a3 modelIdentifier:(id)a4 color:(id)a5 url:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _xpc_connection_s *v21;
  id v22;
  _QWORD handler[4];
  id v24;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  MRCreateXPCMessage(0xC00000000000008uLL);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddStringToXPCMessage(v20, v19, "deviceName");

  MRAddStringToXPCMessage(v20, v18, "modelIdentifier");
  MRAddStringToXPCMessage(v20, v17, "color");

  MRAddStringToXPCMessage(v20, v16, "url");
  -[MRMediaRemoteService connection](self, "connection");
  v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __102__MRMediaRemoteService_presentProximityCardWithDeviceName_modelIdentifier_color_url_queue_completion___block_invoke;
  handler[3] = &unk_1E30C7D98;
  v24 = v14;
  v22 = v14;
  xpc_connection_send_message_with_reply(v21, v20, v15, handler);

}

void __102__MRMediaRemoteService_presentProximityCardWithDeviceName_modelIdentifier_color_url_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v7 = v3;
  if (v4)
    v5 = 0;
  else
    v5 = (void *)MRCreateClientErrorFromXPCMessage(v3);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

}

- (void)requestGroupSessionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _xpc_connection_s *v6;
  id v7;
  _QWORD handler[4];
  id v9;

  v4 = a3;
  MRCreateXPCMessage(0xC00000000000009uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaRemoteService connection](self, "connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __58__MRMediaRemoteService_requestGroupSessionWithCompletion___block_invoke;
  handler[3] = &unk_1E30C7D98;
  v9 = v4;
  v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, MEMORY[0x1E0C80D38], handler);

}

void __58__MRMediaRemoteService_requestGroupSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v8 = v3;
  if (v4)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    MRCreateStringFromXPCMessage(v3, "MRXPC_GROUP_SESSION_IDENTIFIER_KEY");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MRCreateClientErrorFromXPCMessage(v8);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, v6);

}

- (id)applicationUserIdentity
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MRUserIdentity *v7;
  const UInt8 *v8;
  UInt8 *v9;
  uint64_t v11;

  MRCreateXPCMessage(0xC00000000000005uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaRemoteService mrXPCConnection](self, "mrXPCConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "sendSyncMessage:error:", v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v6)
  {
    _MRServiceLogReplyError();
  }
  else
  {
    v8 = MRCreateDataFromXPCMessage(v5, "MRXPC_USER_IDENTITY_KEY");
    if (v8)
    {
      v9 = (UInt8 *)v8;
      v7 = -[MRUserIdentity initWithProtobufData:]([MRUserIdentity alloc], "initWithProtobufData:", v8);

      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:

  return v7;
}

MRPlaybackQueueParticipant *__81__MRMediaRemoteService_fetchParticipantsWithRequest_playerPath_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MRPlaybackQueueParticipant *v3;

  v2 = a2;
  v3 = -[MRPlaybackQueueParticipant initWithProtobufData:]([MRPlaybackQueueParticipant alloc], "initWithProtobufData:", v2);

  return v3;
}

- (id)createTokenWithInvitationData:(id)a3 equivalentMediaIdentifier:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  const void *v13;
  size_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MRGroupSessionToken *v18;
  UInt8 *v19;
  uint64_t v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  MRCreateXPCMessage(0xC00000000000006uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_retainAutorelease(v10);
  v13 = (const void *)objc_msgSend(v12, "bytes");
  v14 = objc_msgSend(v12, "length");

  xpc_dictionary_set_data(v11, "MRXPC_GROUP_SESSION_INVITATION_DATA_KEY", v13, v14);
  if (v8)
    xpc_dictionary_set_string(v11, "MRXPC_GROUP_SESSION_EQUIVALENT_MEDIA_ID_KEY", (const char *)objc_msgSend(objc_retainAutorelease(v8), "cStringUsingEncoding:", 4));
  if (v9)
    xpc_dictionary_set_int64(v11, "MRXPC_GROUP_SESSION_VERSION_KEY", (int)objc_msgSend(v9, "intValue"));
  -[MRMediaRemoteService mrXPCConnection](self, "mrXPCConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v15, "sendSyncMessage:error:", v11, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v21;

  if (v17)
  {
    _MRServiceLogReplyError();
    v18 = 0;
  }
  else
  {
    v19 = (UInt8 *)MRCreateDataFromXPCMessage(v16, "MRXPC_GROUP_SESSION_TOKEN_KEY");
    v18 = -[MRGroupSessionToken initWithData:]([MRGroupSessionToken alloc], "initWithData:", v19);

  }
  return v18;
}

- (void)sendEvent:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  id v13;
  _QWORD handler[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  MRCreateXPCMessage(0xC00000000000004uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddPropertyListToXPCMessage(v11, (uint64_t)v10, "MRXPC_GROUP_SESSION_EVENT_KEY");

  -[MRMediaRemoteService connection](self, "connection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __51__MRMediaRemoteService_sendEvent_queue_completion___block_invoke;
  handler[3] = &unk_1E30C7D98;
  v15 = v8;
  v13 = v8;
  xpc_connection_send_message_with_reply(v12, v11, v9, handler);

}

void __51__MRMediaRemoteService_sendEvent_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t Error;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  v6 = (void *)Error;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

}

- (CGSize)imageDimensionsForArtworkData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  CGSize result;

  v4 = a3;
  MRCreateXPCMessage(0x20000000000003BuLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddDataToXPCMessage(v5, v4, "MRXPC_ARTWORK_DATA_KEY");

  -[MRMediaRemoteService mrXPCConnection](self, "mrXPCConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "sendSyncMessage:error:", v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v8)
  {
    _MRServiceLogReplyError();
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v9 = xpc_dictionary_get_double(v7, "MRXPC_ARTWORK_DIMENSION_WIDTH_KEY");
    v10 = xpc_dictionary_get_double(v7, "MRXPC_ARTWORK_DIMENSION_HEIGHT_KEY");
  }

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)suspendDisconnectionPauseForConfiguration:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  _xpc_connection_s *v11;
  id v12;
  _QWORD handler[4];
  id v14;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "XPCMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaRemoteService connection](self, "connection");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __83__MRMediaRemoteService_suspendDisconnectionPauseForConfiguration_queue_completion___block_invoke;
  handler[3] = &unk_1E30C7D98;
  v14 = v8;
  v12 = v8;
  xpc_connection_send_message_with_reply(v11, v10, v9, handler);

}

void __83__MRMediaRemoteService_suspendDisconnectionPauseForConfiguration_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t Error;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  v6 = (void *)Error;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

}

- (OS_dispatch_queue)clientCallbackPriorityQueue
{
  return self->_clientCallbackPriorityQueue;
}

- (OS_dispatch_queue)browsableContentQueue
{
  return self->_browsableContentQueue;
}

- (OS_dispatch_queue)voiceInputQueue
{
  return self->_voiceInputQueue;
}

- (OS_dispatch_queue)televisionQueue
{
  return self->_televisionQueue;
}

- (void)setTelevisionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_televisionQueue, a3);
}

- (OS_dispatch_queue)agentQueue
{
  return self->_agentQueue;
}

- (void)setAgentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_agentQueue, a3);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (NSXPCListenerEndpoint)uiServiceEndpoint
{
  return self->_uiServiceEndpoint;
}

- (void)setUiServiceEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_uiServiceEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiServiceEndpoint, 0);
  objc_storeStrong((id *)&self->_agentQueue, 0);
  objc_storeStrong((id *)&self->_televisionQueue, 0);
  objc_storeStrong((id *)&self->_voiceInputQueue, 0);
  objc_storeStrong((id *)&self->_browsableContentQueue, 0);
  objc_storeStrong((id *)&self->_clientCallbackPriorityQueue, 0);
  objc_storeStrong((id *)&self->_clientCallbackQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_mrXPCConnection, 0);
}

void __68__MRMediaRemoteService_getDeviceInfoForPlayerPath_queue_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_193827000, v0, v1, "Missing entitlement <com.apple.mediaremote.device-info> to fetch deviceInfo. Please file a radar for this process to obtain this entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
