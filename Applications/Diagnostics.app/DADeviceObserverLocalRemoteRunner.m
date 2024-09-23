@implementation DADeviceObserverLocalRemoteRunner

- (DADeviceObserverLocalRemoteRunner)init
{
  DADeviceObserverLocalRemoteRunner *v2;
  uint64_t v3;
  NSMutableDictionary *devices;
  uint64_t v5;
  NSMutableDictionary *handlers;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DADeviceObserverLocalRemoteRunner;
  v2 = -[DADeviceObserverLocalRemoteRunner init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "createDeviceNotification:", CFSTR("DARemoteRunnerDeviceCreatedNotification"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "destroyDeviceNotification:", CFSTR("DARemoteRunnerDeviceDestroyedNotification"), 0);

  }
  return v2;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner handlers](self, "handlers"));
  objc_sync_enter(v6);
  v7 = objc_retainBlock(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner handlers](self, "handlers"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v5);

  objc_sync_exit(v6);
  -[DADeviceObserverLocalRemoteRunner _updateHandlers](self, "_updateHandlers");

  return v5;
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner handlers](self, "handlers"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner handlers](self, "handlers"));
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)createDeviceNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "object"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "object"));
    v7 = objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___DADevice);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "object"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[DADeviceDecoratorWithUI decorateWithDevice:](DADeviceDecoratorWithUI, "decorateWithDevice:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner devices](self, "devices"));
      objc_sync_enter(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner devices](self, "devices"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "state"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serialNumber"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v13);

      objc_sync_exit(v10);
      -[DADeviceObserverLocalRemoteRunner _updateHandlers](self, "_updateHandlers");

    }
  }

}

- (void)destroyDeviceNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "object"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "object"));
    v7 = objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___DADevice);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "object"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner devices](self, "devices"));
      objc_sync_enter(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner devices](self, "devices"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "state"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serialNumber"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v12));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner devices](self, "devices"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "state"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serialNumber"));
        objc_msgSend(v14, "removeObjectForKey:", v16);

        objc_sync_exit(v9);
        -[DADeviceObserverLocalRemoteRunner _updateHandlers](self, "_updateHandlers");
      }
      else
      {
        objc_sync_exit(v9);

      }
    }
  }

}

- (id)_devices
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner devices](self, "devices"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner _devices](self, "_devices"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner handlers](self, "handlers", 0));
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
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalRemoteRunner handlers](self, "handlers"));
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
}

@end
