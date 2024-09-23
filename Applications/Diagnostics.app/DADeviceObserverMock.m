@implementation DADeviceObserverMock

- (DADeviceObserverMock)init
{
  DADeviceObserverMock *v2;
  uint64_t v3;
  NSMutableDictionary *devices;
  uint64_t v5;
  NSMutableDictionary *handlers;
  NSXPCListener *v7;
  NSXPCListener *listener;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DADeviceObserverMock;
  v2 = -[DADeviceObserverMock init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v5;

    v7 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.diagnostics.mock-device-service"));
    listener = v2->_listener;
    v2->_listener = v7;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (void)createDeviceWithSerialNumber:(id)a3 attributes:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  DADeviceMock *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v17));

  objc_sync_exit(v10);
  v13 = (DADeviceMock *)v12;
  if (!v12)
  {
    v13 = -[DADeviceRepresentation initWithSerialNumber:isLocal:attributes:]([DADeviceMock alloc], "initWithSerialNumber:isLocal:attributes:", v17, 1, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
    objc_sync_enter(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v17);

    objc_sync_exit(v14);
    -[DADeviceObserverMock _updateHandlers](self, "_updateHandlers");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12 == 0));
  v9[2](v9, v16);

}

- (void)getDeviceStateWithSerialNumber:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));

  objc_sync_exit(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "state"));
  v6[2](v6, v10);

}

- (void)updateDeviceState:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serialNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

  objc_sync_exit(v7);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "state"));
    objc_msgSend(v11, "updateWithDeviceState:", v13);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10 != 0));
  v6[2](v6, v12);

}

- (void)destroyDeviceWithSerialNumber:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v12));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
    objc_msgSend(v10, "removeObjectForKey:", v12);

    objc_sync_exit(v7);
    -[DADeviceObserverMock _updateHandlers](self, "_updateHandlers");
  }
  else
  {
    objc_sync_exit(v7);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9 != 0));
  v6[2](v6, v11);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSSet *v9;
  void *v10;
  NSSet *v11;
  void *v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.diagnostics.mock-device-service")));
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && objc_msgSend(v6, "BOOLValue"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DADeviceObserverMockProtocol));
    v9 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(DADeviceState));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v10, "updateDeviceState:completion:", 0, 0);

    v11 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(DADeviceState));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v12, "getDeviceStateWithSerialNumber:completion:", 0, 1);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setExportedInterface:", v8);
    objc_msgSend(v5, "setRemoteObjectInterface:", 0);
    objc_msgSend(v5, "resume");

  }
  else
  {
    objc_msgSend(v5, "invalidate");
  }

  return 1;
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock handlers](self, "handlers"));
  objc_sync_enter(v6);
  v7 = objc_retainBlock(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock handlers](self, "handlers"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v5);

  objc_sync_exit(v6);
  -[DADeviceObserverMock _updateHandlers](self, "_updateHandlers");

  return v5;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock handlers](self, "handlers"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock handlers](self, "handlers"));
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (id)_devices
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock devices](self, "devices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return v4;
}

- (void)_updateHandlers
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock _devices](self, "_devices"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock handlers](self, "handlers", 0));
  v5 = objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverMock handlers](self, "handlers"));
        v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

        if (v12)
          ((void (**)(_QWORD, void *))v12)[2](v12, v3);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
