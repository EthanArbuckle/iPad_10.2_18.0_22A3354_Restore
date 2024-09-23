@implementation _GCNintendoJoyConDevicePending

- (_GCNintendoJoyConDevicePending)initWithHIDService:(id)a3 manager:(id)a4
{
  GCHIDServiceInfo *v7;
  _GCNintendoJoyConDeviceManager *v8;
  _GCNintendoJoyConDevicePending *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  GCHIDServiceInfo *serviceInfo;
  GCHIDServiceInfo *v14;
  _GCNintendoJoyConDeviceManager *manager;
  _GCNintendoJoyConDeviceManager *v16;
  _GCNintendoJoyConDevicePending *v17;
  uint64_t v18;
  GCFuture *deviceFuture;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _GCNintendoJoyConDevicePending *v24;
  objc_super v25;

  v7 = (GCHIDServiceInfo *)a3;
  v8 = (_GCNintendoJoyConDeviceManager *)a4;
  v25.receiver = self;
  v25.super_class = (Class)_GCNintendoJoyConDevicePending;
  v9 = -[_GCNintendoJoyConDevicePending init](&v25, sel_init);
  if (!v7)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("_GCNintendoJoyConDevicePending.m"), 42, CFSTR("Invalid parameter not satisfying: %s"), "serviceInfo != nil");

    if (v8)
      goto LABEL_3;
LABEL_5:
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("_GCNintendoJoyConDevicePending.m"), 43, CFSTR("Invalid parameter not satisfying: %s"), "manager != nil");

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("NintendoJoyConDevice.Pending", v10);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v11;

  serviceInfo = v9->_serviceInfo;
  v9->_serviceInfo = v7;
  v14 = v7;

  manager = v9->_manager;
  v9->_manager = v8;
  v16 = v8;

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __61___GCNintendoJoyConDevicePending_initWithHIDService_manager___block_invoke;
  v23[3] = &unk_24D2B5348;
  v17 = v9;
  v24 = v17;
  unk_254DF7B08(&off_254DF86E8, "futureWithBlock:", v23);
  v18 = objc_claimAutoreleasedReturnValue();
  deviceFuture = v17->_deviceFuture;
  v17->_deviceFuture = (GCFuture *)v18;

  return v17;
}

- (_GCNintendoJoyConDevicePending)init
{
  -[_GCNintendoJoyConDevicePending doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[GCPromise cancel](self->_devicePromise, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_GCNintendoJoyConDevicePending;
  -[_GCNintendoJoyConDevicePending dealloc](&v3, sel_dealloc);
}

- (_GCDeviceDriverConnection)driverConnection
{
  return (_GCDeviceDriverConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDriverConnection:(id)a3
{
  -[_GCNintendoJoyConDevicePending setDriverConnection:invalidatingPrevious:](self, "setDriverConnection:invalidatingPrevious:", a3, 1);
}

- (void)setDriverConnection:(id)a3 invalidatingPrevious:(BOOL)a4
{
  id v7;
  _GCNintendoJoyConDevicePending *v8;
  _GCDeviceDriverConnection *v9;
  NSObject *queue;
  _GCDeviceDriverConnection *v11;
  _QWORD v12[5];
  id v13;
  _GCDeviceDriverConnection *v14;
  BOOL v15;

  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  if (objc_msgSend(v7, "isEqual:", v8->_driverConnection))
  {
    objc_sync_exit(v8);

  }
  else
  {
    v9 = v8->_driverConnection;
    -[_GCNintendoJoyConDevicePending willChangeValueForKey:](v8, "willChangeValueForKey:", CFSTR("driverConnection"));
    objc_setProperty_atomic(v8, a2, v7, 48);
    -[_GCNintendoJoyConDevicePending didChangeValueForKey:](v8, "didChangeValueForKey:", CFSTR("driverConnection"));
    objc_sync_exit(v8);

    queue = v8->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75___GCNintendoJoyConDevicePending_setDriverConnection_invalidatingPrevious___block_invoke;
    v12[3] = &unk_24D2B5370;
    v12[4] = v8;
    v13 = v7;
    v14 = v9;
    v15 = a4;
    v11 = v9;
    dispatch_async(queue, v12);

  }
}

- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _GCNintendoJoyConDevice *v7;
  os_activity_scope_state_s state;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v4 = _os_activity_create(&dword_215181000, "[JoyCon Physical Device (Pending)] Prepare Device", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    if (v3)
    {
      if ((objc_msgSend(v3, "isInvalid") & 1) != 0 || (objc_msgSend(*(id *)(a1 + 24), "isCancelled") & 1) != 0)
        goto LABEL_18;
      objc_msgSend(*(id *)(a1 + 56), "stringPropertyForKey:", CFSTR("JoyConControllerType"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Joy-Con (L)")) & 1) != 0)
        {
          v6 = 1;
LABEL_10:

          v7 = -[_GCNintendoJoyConDevice initWithHIDDevice:manager:type:]([_GCNintendoJoyConDevice alloc], "initWithHIDDevice:manager:type:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), v6);
LABEL_11:
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[_GCNintendoJoyConDevice setDriverConnection:](v7, "setDriverConnection:", *(_QWORD *)(a1 + 48));
          if ((objc_opt_respondsToSelector() & 1) != 0 && *(_QWORD *)(a1 + 40))
            -[_GCNintendoJoyConDevice setFilterConnection:](v7, "setFilterConnection:");
          objc_msgSend(*(id *)(a1 + 24), "succeedWithResult:", v7);
          goto LABEL_17;
        }
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Joy-Con (R)")) & 1) != 0)
        {
          v6 = 2;
          goto LABEL_10;
        }
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Pro Controller")) & 1) != 0
          || (objc_msgSend(v5, "isEqualToString:", CFSTR("NES Controller (L)")) & 1) != 0
          || (objc_msgSend(v5, "isEqualToString:", CFSTR("NES Controller (R)")) & 1) != 0
          || (objc_msgSend(v5, "isEqualToString:", CFSTR("SNES Controller")) & 1) != 0
          || (objc_msgSend(v5, "isEqualToString:", CFSTR("N64 Controller")) & 1) != 0)
        {

          v7 = -[_GCDefaultPhysicalDevice initWithHIDDevice:manager:]([_GCDefaultPhysicalDevice alloc], "initWithHIDDevice:manager:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
          -[_GCNintendoJoyConDevice setDelegate:](v7, "setDelegate:", objc_opt_class());
          goto LABEL_11;
        }
      }

      if (!gc_isInternalBuild())
        goto LABEL_18;
      getGCLogger();
      v7 = (_GCNintendoJoyConDevice *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
        -[_GCNintendoJoyConDevicePending _onqueue_prepareDeviceWithConnection:].cold.1(a1, &v7->super);
    }
    else
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v7 = (_GCNintendoJoyConDevice *)objc_claimAutoreleasedReturnValue();
      -[_GCNintendoJoyConDevice handleFailureInMethod:object:file:lineNumber:description:](v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__onqueue_prepareDeviceWithConnection_, a1, CFSTR("_GCNintendoJoyConDevicePending.m"), 158, CFSTR("Invalid parameter not satisfying: %s"), "connection != nil");
    }
LABEL_17:

LABEL_18:
    os_activity_scope_leave(&state);

  }
}

- (_GCDeviceDriverConnection)filterConnection
{
  return (_GCDeviceDriverConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilterConnection:(id)a3
{
  -[_GCNintendoJoyConDevicePending setFilterConnection:invalidatingPrevious:](self, "setFilterConnection:invalidatingPrevious:", a3, 1);
}

- (void)setFilterConnection:(id)a3 invalidatingPrevious:(BOOL)a4
{
  id v7;
  _GCNintendoJoyConDevicePending *v8;
  _GCDeviceDriverConnection *v9;
  NSObject *queue;
  _GCDeviceDriverConnection *v11;
  _QWORD v12[5];
  id v13;
  _GCDeviceDriverConnection *v14;
  BOOL v15;

  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  if (objc_msgSend(v7, "isEqual:", v8->_filterConnection))
  {
    objc_sync_exit(v8);

  }
  else
  {
    v9 = v8->_filterConnection;
    -[_GCNintendoJoyConDevicePending willChangeValueForKey:](v8, "willChangeValueForKey:", CFSTR("filterConnection"));
    objc_setProperty_atomic(v8, a2, v7, 40);
    -[_GCNintendoJoyConDevicePending didChangeValueForKey:](v8, "didChangeValueForKey:", CFSTR("filterConnection"));
    objc_sync_exit(v8);

    queue = v8->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75___GCNintendoJoyConDevicePending_setFilterConnection_invalidatingPrevious___block_invoke;
    v12[3] = &unk_24D2B5370;
    v12[4] = v8;
    v13 = v7;
    v14 = v9;
    v15 = a4;
    v11 = v9;
    dispatch_async(queue, v12);

  }
}

- (GCFuture)device
{
  return (GCFuture *)objc_getProperty(self, a2, 16, 1);
}

- (GCHIDServiceInfo)serviceInfo
{
  return (GCHIDServiceInfo *)objc_getProperty(self, a2, 56, 1);
}

- (_GCNintendoJoyConDeviceManager)manager
{
  return (_GCNintendoJoyConDeviceManager *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceInfo, 0);
  objc_storeStrong((id *)&self->_driverConnection, 0);
  objc_storeStrong((id *)&self->_filterConnection, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_devicePromise, 0);
  objc_storeStrong((id *)&self->_deviceFuture, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215181000, a2, OS_LOG_TYPE_ERROR, "%@ Missing controller type", (uint8_t *)&v2, 0xCu);
}

@end
