@implementation MRIDSCompanionTransportConnection

- (MRIDSCompanionTransportConnection)initWithConnection:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MRIDSCompanionTransportConnection *v15;
  MRIDSCompanionTransportConnection *v16;
  MRIDSCompanionConnection *connection;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MRIDSCompanionTransportConnection;
  v15 = -[MRIDSCompanionTransportConnection init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_connection, a3);
    objc_storeStrong((id *)&v16->_type, a4);
    objc_storeStrong((id *)&v16->_destination, a5);
    objc_storeStrong((id *)&v16->_session, a6);
    objc_initWeak(&location, v16);
    connection = v16->_connection;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __81__MRIDSCompanionTransportConnection_initWithConnection_type_destination_session___block_invoke;
    v19[3] = &unk_1E30C8768;
    objc_copyWeak(&v20, &location);
    -[MRIDSCompanionConnection setMessageHandler:forType:destination:session:](connection, "setMessageHandler:forType:destination:session:", v19, v16->_type, v16->_destination, v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __81__MRIDSCompanionTransportConnection_initWithConnection_type_destination_session___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "ingestData:", v4);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 104, CFSTR("MRIDSCompanionTransportConnection.dealloc"));
  -[MRIDSCompanionTransportConnection closeWithError:](self, "closeWithError:", v3);

  v4.receiver = self;
  v4.super_class = (Class)MRIDSCompanionTransportConnection;
  -[MRIDSCompanionTransportConnection dealloc](&v4, sel_dealloc);
}

- (BOOL)isValid
{
  return -[MRIDSCompanionConnection isConnected](self->_connection, "isConnected");
}

- (id)error
{
  MRIDSCompanionTransportConnection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSError copy](v2->_error, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)runLoop
{
  return 0;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  char v9;
  void *v10;
  unint64_t v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[MRIDSCompanionTransportConnection _idsPriorityFromPriority:](self, "_idsPriorityFromPriority:", objc_msgSend(v6, "priority"));
  v9 = objc_msgSend(v6, "isWaking");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v13 = *MEMORY[0x1E0D34190];
    v14[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MRIDSCompanionConnection sendMessage:type:destination:session:options:priority:](self->_connection, "sendMessage:type:destination:session:options:priority:", v7, self->_type, self->_destination, self->_session, v10, v8);
  v11 = objc_msgSend(v7, "length");

  return v11;
}

- (void)closeWithError:(id)a3
{
  MRIDSCompanionTransportConnection *v4;
  MRIDSCompanionConnection *connection;
  void *v6;
  MRIDSCompanionConnection *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  connection = v4->_connection;
  if (connection)
  {
    -[MRIDSCompanionConnection removeMessageHandlerForType:destination:session:](connection, "removeMessageHandlerForType:destination:session:", v4->_type, v4->_destination, v4->_session);
    v6 = v8;
    if (!v8)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 104);
    v8 = v6;
    objc_storeStrong((id *)&v4->_error, v6);
    v7 = v4->_connection;
    v4->_connection = 0;

    objc_sync_exit(v4);
    -[MRExternalDeviceTransportConnection _notifyDelegateDidCloseWithError:](v4, "_notifyDelegateDidCloseWithError:", v8);
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (id)exportEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MRAVDistantEndpoint *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  MRIDSCompanionTransportConnection *v19;
  id v20;

  v4 = a3;
  if ((objc_msgSend(v4, "isLocalEndpoint") & 1) != 0)
  {
    objc_msgSend(v4, "groupLeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRIDSCompanionTransportConnection _exportDescriptorForOutputDevice:endpoint:remoteControl:](self, "_exportDescriptorForOutputDevice:endpoint:remoteControl:", v5, v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "outputDevices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __52__MRIDSCompanionTransportConnection_exportEndpoint___block_invoke;
      v18 = &unk_1E30C8790;
      v19 = self;
      v8 = v4;
      v20 = v8;
      objc_msgSend(v7, "mr_compactMap:", &v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy", v15, v16, v17, v18, v19);

      objc_msgSend(v10, "addObject:", v6);
      objc_msgSend(v8, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDesignatedGroupLeader:", v6);
      objc_msgSend(v11, "setOutputDevices:", v10);
      v12 = -[MRAVDistantEndpoint initWithDescriptor:]([MRAVDistantEndpoint alloc], "initWithDescriptor:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "designatedGroupLeader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uid");
    v12 = (MRAVDistantEndpoint *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v12 = (MRAVDistantEndpoint *)v4;
  }

  return v12;
}

id __52__MRIDSCompanionTransportConnection_exportEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isLocalDevice") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_exportDescriptorForOutputDevice:endpoint:remoteControl:", v3, *(_QWORD *)(a1 + 40), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)exportOutputDevice:(id)a3 endpoint:(id)a4
{
  void *v4;
  MRAVDistantOutputDevice *v5;

  -[MRIDSCompanionTransportConnection _exportDescriptorForOutputDevice:endpoint:remoteControl:](self, "_exportDescriptorForOutputDevice:endpoint:remoteControl:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v4);

  return v5;
}

- (int64_t)_idsPriorityFromPriority:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 100;
  else
    return qword_193AD9630[a3];
}

- (id)_exportDescriptorForOutputDevice:(id)a3 endpoint:(id)a4 remoteControl:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTransportType:", 3);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRDeviceInfoRequest deviceInfoForOrigin:](MRDeviceInfoRequest, "deviceInfoForOrigin:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v7, "uid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "containsOutputDeviceWithUID:", v13);

  }
  if (objc_msgSend(v7, "isLocalDevice"))
  {
    objc_msgSend(v9, "setHostDeviceClass:", _MRDeviceInfoMessageProtobuf_DeviceClassFromModel(objc_msgSend(v11, "deviceClass")));
    objc_msgSend(v11, "WHAIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrimaryUID:", v14);

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v11, "groupUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setGroupID:", v15);

      objc_msgSend(v9, "setGroupContainsGroupLeader:", 1);
      objc_msgSend(v9, "setIsRemoteControllable:", 1);
      objc_msgSend(v9, "setIsGroupLeader:", 1);
      objc_msgSend(v9, "setIsLocalDevice:", 0);
      objc_msgSend(v8, "outputDevices");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIsProxyGroupPlayer:", objc_msgSend(v16, "mr_any:", &__block_literal_global_30));

    }
    else
    {
      objc_msgSend(v9, "setGroupID:", 0);
      objc_msgSend(v9, "setGroupContainsGroupLeader:", 0);
      objc_msgSend(v9, "setIsRemoteControllable:", 0);
      objc_msgSend(v9, "setIsGroupLeader:", 0);
      objc_msgSend(v9, "setIsLocalDevice:", 0);
      objc_msgSend(v9, "setIsProxyGroupPlayer:", 0);
    }
    if (objc_msgSend(v7, "deviceType") == 4)
    {
      objc_msgSend(v7, "sourceInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "multipleBuiltInDevices");

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v11, "localizedModelName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setName:", v21);

        objc_msgSend(v11, "modelID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setModelID:", v22);

      }
    }
    if (v5)
    {
      objc_msgSend(v11, "WHAIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUniqueIdentifier:", v23);

      objc_msgSend(v11, "localizedModelName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setName:", v18);
      goto LABEL_16;
    }
  }
  else if ((objc_msgSend(v8, "isLocalEndpoint") & v12) == 1)
  {
    objc_msgSend(v9, "setIsRemoteControllable:", 1);
    objc_msgSend(v9, "setIsGroupLeader:", 0);
    objc_msgSend(v7, "groupID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v11, "groupUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setGroupID:", v18);
LABEL_16:

    }
  }

  return v9;
}

BOOL __93__MRIDSCompanionTransportConnection__exportDescriptorForOutputDevice_endpoint_remoteControl___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceType") == 1;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)destination
{
  return self->_destination;
}

- (NSString)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
