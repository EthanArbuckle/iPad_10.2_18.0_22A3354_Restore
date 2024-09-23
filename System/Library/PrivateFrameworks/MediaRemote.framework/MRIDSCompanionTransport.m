@implementation MRIDSCompanionTransport

- (MRIDSCompanionTransport)initWithOutputDevice:(id)a3
{
  id v5;
  MRIDSCompanionTransport *v6;
  MRIDSCompanionTransport *v7;
  MRDeviceInfo *v8;
  void *v9;
  void *v10;
  MRDeviceInfo *deviceInfo;
  MRDeviceInfo *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRIDSCompanionTransport;
  v6 = -[MRIDSCompanionTransport init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDevice, a3);
    v8 = objc_alloc_init(MRDeviceInfo);
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setName:](v8, "setName:", v9);

    objc_msgSend(v5, "primaryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setDeviceUID:](v8, "setDeviceUID:", v10);

    deviceInfo = v7->_deviceInfo;
    v7->_deviceInfo = v8;
    v12 = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__handleDeviceConnected_, CFSTR("MRIDSCompanionConnectionDeviceDidConnect"), v14);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel__handleDeviceDisconnected_, CFSTR("MRIDSCompanionConnectionDeviceDidDisconnect"), v16);

  }
  return v7;
}

- (id)name
{
  void *v2;
  void *v3;

  -[MRIDSCompanionTransport deviceInfo](self, "deviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hostname
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (id)uid
{
  void *v2;
  void *v3;

  -[MRIDSCompanionTransport deviceInfo](self, "deviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "WHAIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)error
{
  MRIDSCompanionTransport *v2;
  NSError *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_error;
  objc_sync_exit(v2);

  return v3;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  id v4;
  MRIDSCompanionTransport *v5;
  void *v6;
  MRIDSCompanionTransportConnection *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int64_t v21;
  dispatch_time_t v22;
  intptr_t v23;
  void *v24;
  MRIDSCompanionTransportConnection *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  MRIDSCompanionTransportConnection *connection;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRIDSCompanionTransport sessionUID](v5, "sessionUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_2;
  -[MRIDSCompanionTransport _generateSessionUID](v5, "_generateSessionUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIDSCompanionTransport setSessionUID:](v5, "setSessionUID:", v8);

  +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isConnected");

  if (!v10)
  {
LABEL_11:
    objc_sync_exit(v5);

    v7 = 0;
    goto LABEL_12;
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__20;
  v40 = __Block_byref_object_dispose__20;
  v41 = 0;
  +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIDSCompanionTransport uid](v5, "uid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIDSCompanionTransport sessionUID](v5, "sessionUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMessageHandler:forType:destination:session:", &__block_literal_global_51, CFSTR("Protobuf"), v12, v13);

  v14 = dispatch_semaphore_create(0);
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v35;
  +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIDSCompanionTransport uid](v5, "uid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIDSCompanionTransport sessionUID](v5, "sessionUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __56__MRIDSCompanionTransport_createConnectionWithUserInfo___block_invoke_3;
  v32[3] = &unk_1E30CA838;
  v34 = &v36;
  v20 = v14;
  v33 = v20;
  objc_msgSend(v17, "sendMessage:type:destination:session:options:priority:response:", v15, CFSTR("ConnectRemoteControl"), v18, v19, 0, 300, v32);

  if (v5->_shouldUseSystemAuthenticationPrompt)
    v21 = 90000000000;
  else
    v21 = 14000000000;
  v22 = dispatch_time(0, v21);
  v23 = dispatch_semaphore_wait(v20, v22);
  v24 = (void *)v37[5];
  if (v23 || v24)
  {
    objc_storeStrong((id *)&v5->_error, v24);

    _Block_object_dispose(&v36, 8);
    goto LABEL_11;
  }

  _Block_object_dispose(&v36, 8);
  v25 = [MRIDSCompanionTransportConnection alloc];
  +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIDSCompanionTransport uid](v5, "uid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIDSCompanionTransport sessionUID](v5, "sessionUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[MRIDSCompanionTransportConnection initWithConnection:type:destination:session:](v25, "initWithConnection:type:destination:session:", v26, CFSTR("RemoteControl"), v27, v28);
  connection = v5->_connection;
  v5->_connection = (MRIDSCompanionTransportConnection *)v29;

LABEL_2:
  objc_sync_exit(v5);

  v7 = v5->_connection;
LABEL_12:

  return v7;
}

void __56__MRIDSCompanionTransport_createConnectionWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = a2;
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  +[MRProtocolMessage protocolMessageWithProtobufData:error:](MRProtocolMessage, "protocolMessageWithProtobufData:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;

  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "workerQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v4;
      v9 = (void *)MRGetSharedService();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __56__MRIDSCompanionTransport_createConnectionWithUserInfo___block_invoke_2;
      v10[3] = &unk_1E30C7FC8;
      v11 = v2;
      MRMediaRemoteServicePromptRouteAuthorization(v9, v8, v7, v10);

    }
  }

}

void __56__MRIDSCompanionTransport_createConnectionWithUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "protobufData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replyWithData:priority:", v3, 300);

}

void __56__MRIDSCompanionTransport_createConnectionWithUserInfo___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    +[MRProtocolMessage protocolMessageWithProtobufData:error:](MRProtocolMessage, "protocolMessageWithProtobufData:error:", v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;

    objc_msgSend(v6, "error");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)resetWithError:(id)a3
{
  MRIDSCompanionTransport *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MRIDSCompanionTransport _synchronized_setSessionUID:](v4, "_synchronized_setSessionUID:", 0);
  -[MRIDSCompanionTransportConnection closeWithError:](v4->_connection, "closeWithError:", v5);
  objc_sync_exit(v4);

}

- (BOOL)supportsIdleDisconnection
{
  return 0;
}

- (void)setSessionUID:(id)a3
{
  MRIDSCompanionTransport *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MRIDSCompanionTransport _synchronized_setSessionUID:](v4, "_synchronized_setSessionUID:", v5);
  objc_sync_exit(v4);

}

- (void)_synchronized_setSessionUID:(id)a3
{
  id v5;
  NSString **p_sessionUID;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id location;

  v5 = a3;
  p_sessionUID = &self->_sessionUID;
  if (self->_sessionUID)
  {
    +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRIDSCompanionTransport uid](self, "uid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeMessageHandlerForType:destination:session:", CFSTR("DisconnectRemoteControl"), v8, *p_sessionUID);

    +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRIDSCompanionTransport uid](self, "uid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeMessageHandlerForType:destination:session:", CFSTR("Protobuf"), v10, *p_sessionUID);

  }
  objc_storeStrong((id *)&self->_sessionUID, a3);
  if (*p_sessionUID)
  {
    objc_initWeak(&location, self);
    +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v14, &location);
    -[MRIDSCompanionTransport uid](self, "uid", v13, 3221225472, __55__MRIDSCompanionTransport__synchronized_setSessionUID___block_invoke, &unk_1E30C8768);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessageHandler:forType:destination:session:", &v13, CFSTR("DisconnectRemoteControl"), v12, *p_sessionUID);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __55__MRIDSCompanionTransport__synchronized_setSessionUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    +[MRProtocolMessage protocolMessageWithProtobufData:error:](MRProtocolMessage, "protocolMessageWithProtobufData:error:", v5, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "resetWithError:", v7);

  }
}

- (id)_generateSessionUID
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@-%d"), v4, ++_generateSessionUID_sessionUID_0);

  return v5;
}

- (void)_handleDeviceConnected:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 105, CFSTR("IDSConnection Reset"));
  -[MRIDSCompanionTransport resetWithError:](self, "resetWithError:", v4);

}

- (void)_handleDeviceDisconnected:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 105, CFSTR("IDSConnection Disconnected"));
  -[MRIDSCompanionTransport resetWithError:](self, "resetWithError:", v4);

}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  return self->_shouldUseSystemAuthenticationPrompt;
}

- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3
{
  self->_shouldUseSystemAuthenticationPrompt = a3;
}

- (id)deviceInfo
{
  return self->_deviceInfo;
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
}

@end
