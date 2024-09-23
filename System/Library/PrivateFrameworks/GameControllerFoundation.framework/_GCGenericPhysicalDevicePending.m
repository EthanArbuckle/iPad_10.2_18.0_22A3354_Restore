@implementation _GCGenericPhysicalDevicePending

- (_GCGenericPhysicalDevicePending)initWithHIDService:(id)a3 manager:(id)a4
{
  GCHIDServiceInfo *v7;
  _GCGenericDeviceManager *v8;
  _GCGenericPhysicalDevicePending *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  GCHIDServiceInfo *serviceInfo;
  GCHIDServiceInfo *v14;
  _GCGenericDeviceManager *manager;
  _GCGenericDeviceManager *v16;
  _GCGenericPhysicalDevicePending *v17;
  uint64_t v18;
  GCFuture *deviceFuture;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _GCGenericPhysicalDevicePending *v24;
  objc_super v25;

  v7 = (GCHIDServiceInfo *)a3;
  v8 = (_GCGenericDeviceManager *)a4;
  v25.receiver = self;
  v25.super_class = (Class)_GCGenericPhysicalDevicePending;
  v9 = -[_GCGenericPhysicalDevicePending init](&v25, sel_init);
  if (!v7)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("_GCGenericPhysicalDevicePending.m"), 48, CFSTR("Invalid parameter not satisfying: %s"), "serviceInfo != nil");

    if (v8)
      goto LABEL_3;
LABEL_5:
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("_GCGenericPhysicalDevicePending.m"), 49, CFSTR("Invalid parameter not satisfying: %s"), "manager != nil");

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("GenericDevice.Pending", v10);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v11;

  serviceInfo = v9->_serviceInfo;
  v9->_serviceInfo = v7;
  v14 = v7;

  manager = v9->_manager;
  v9->_manager = v8;
  v16 = v8;

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __62___GCGenericPhysicalDevicePending_initWithHIDService_manager___block_invoke;
  v23[3] = &unk_1EA4D4748;
  v17 = v9;
  v24 = v17;
  +[GCFuture futureWithBlock:](GCFuture, "futureWithBlock:", v23);
  v18 = objc_claimAutoreleasedReturnValue();
  deviceFuture = v17->_deviceFuture;
  v17->_deviceFuture = (GCFuture *)v18;

  return v17;
}

- (_GCGenericPhysicalDevicePending)init
{
  -[_GCGenericPhysicalDevicePending doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[GCPromise cancel](self->_devicePromise, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_GCGenericPhysicalDevicePending;
  -[_GCGenericPhysicalDevicePending dealloc](&v3, sel_dealloc);
}

- (_GCDeviceDriverConnection)driverConnection
{
  return (_GCDeviceDriverConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDriverConnection:(id)a3
{
  -[_GCGenericPhysicalDevicePending setDriverConnection:invalidatingPrevious:](self, "setDriverConnection:invalidatingPrevious:", a3, 1);
}

- (void)setDriverConnection:(id)a3 invalidatingPrevious:(BOOL)a4
{
  id v7;
  _GCGenericPhysicalDevicePending *v8;
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
    -[_GCGenericPhysicalDevicePending willChangeValueForKey:](v8, "willChangeValueForKey:", CFSTR("driverConnection"));
    objc_setProperty_atomic(v8, a2, v7, 48);
    -[_GCGenericPhysicalDevicePending didChangeValueForKey:](v8, "didChangeValueForKey:", CFSTR("driverConnection"));
    objc_sync_exit(v8);

    queue = v8->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76___GCGenericPhysicalDevicePending_setDriverConnection_invalidatingPrevious___block_invoke;
    v12[3] = &unk_1EA4D4770;
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
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  os_activity_scope_state_s state;
  _BYTE v38[32];
  _BYTE v39[32];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v4 = _os_activity_create(&dword_1DC79E000, "[Generic Physical Device (Pending)] Prepare Device", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    if (!v3)
    {
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__onqueue_prepareDeviceWithConnection_, a1, CFSTR("_GCGenericPhysicalDevicePending.m"), 164, CFSTR("Invalid parameter not satisfying: %s"), "connection != nil");
      goto LABEL_16;
    }
    if ((objc_msgSend(v3, "isInvalid") & 1) != 0 || (objc_msgSend(*(id *)(a1 + 24), "isCancelled") & 1) != 0)
      goto LABEL_17;
    _gc_log_generic_device();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.10();

    +[_GCDeviceDriverServiceConnection connectionToServiceInDriver:withClient:](_GCGenericDeviceDriverConfigurationServiceConnection, "connectionToServiceInDriver:withClient:", v3, a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v36 = 0;
    v7 = objc_msgSend(v6, "waitForResult:error:", &v36, &v35);
    v8 = v36;
    v9 = v35;

    if (!v7)
      goto LABEL_14;
    if (v7 == 1)
    {
      _gc_log_generic_device();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.9();
      v11 = 0;
      goto LABEL_12;
    }
    if ((objc_msgSend(*(id *)(a1 + 24), "isCancelled") & 1) != 0)
    {
LABEL_14:
      v11 = 0;
      goto LABEL_15;
    }
    _gc_log_generic_device();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.8();

    objc_msgSend(v8, "fetchDeviceSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v34 = 0;
    v14 = objc_msgSend(v13, "waitForResult:error:", &v34, &v33);
    v11 = v34;
    v15 = v33;

    if (!v14)
      goto LABEL_26;
    if (v14 == 1)
    {
      _gc_log_generic_device();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.7();
      goto LABEL_42;
    }
    if ((objc_msgSend(*(id *)(a1 + 24), "isCancelled") & 1) != 0)
    {
LABEL_26:
      v9 = v15;
      goto LABEL_15;
    }
    GCLookupService(*(void **)(a1 + 32), (objc_class *)&unk_1F03A4588, 0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      _gc_log_generic_device();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v11, "debugDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.6(a1, v17, (uint64_t)v39);
      }

      objc_msgSend(v29, "preparedModelForDevice:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v32 = 0;
      v19 = objc_msgSend(v18, "waitForResult:error:", &v32, &v31);
      v10 = v32;
      v20 = v31;

      if (v19)
      {
        if (v19 == 1)
        {
          _gc_log_generic_device();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.5();
          v15 = v20;
LABEL_38:

LABEL_41:
LABEL_42:
          v9 = v15;
LABEL_12:

LABEL_15:
LABEL_16:

LABEL_17:
          os_activity_scope_leave(&state);

          goto LABEL_18;
        }
        if ((objc_msgSend(*(id *)(a1 + 24), "isCancelled") & 1) == 0)
        {
          _gc_log_generic_device();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject driver](v10, "driver");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.4(a1, v23, (uint64_t)v38);
          }

          -[NSObject driver](v10, "driver");
          v24 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "applyConfiguration:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v26 = objc_msgSend(v25, "waitForResult:error:", 0, &v30);
          v28 = (void *)v24;
          v15 = v30;

          if (!v26)
            goto LABEL_41;
          if (v26 == 1)
          {
            _gc_log_generic_device();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.3();
          }
          else
          {
            objc_msgSend((id)a1, "_onqueue_createDeviceWithModel:service:", v10, *(_QWORD *)(a1 + 56));
            v21 = objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
                -[NSObject setDriverConnection:](v21, "setDriverConnection:", *(_QWORD *)(a1 + 48));
              if ((objc_opt_respondsToSelector() & 1) != 0 && *(_QWORD *)(a1 + 40))
                -[NSObject setFilterConnection:](v21, "setFilterConnection:");
              objc_msgSend(*(id *)(a1 + 24), "succeedWithResult:", v21);
            }
            else
            {
              _gc_log_generic_device();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.2();

            }
          }
          goto LABEL_38;
        }
      }
      v15 = v20;
      goto LABEL_41;
    }
    _gc_log_generic_device();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.1();
    v10 = 0;
    goto LABEL_38;
  }
LABEL_18:

}

- (_GCDeviceDriverConnection)filterConnection
{
  return (_GCDeviceDriverConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilterConnection:(id)a3
{
  -[_GCGenericPhysicalDevicePending setFilterConnection:invalidatingPrevious:](self, "setFilterConnection:invalidatingPrevious:", a3, 1);
}

- (void)setFilterConnection:(id)a3 invalidatingPrevious:(BOOL)a4
{
  id v7;
  _GCGenericPhysicalDevicePending *v8;
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
    -[_GCGenericPhysicalDevicePending willChangeValueForKey:](v8, "willChangeValueForKey:", CFSTR("filterConnection"));
    objc_setProperty_atomic(v8, a2, v7, 40);
    -[_GCGenericPhysicalDevicePending didChangeValueForKey:](v8, "didChangeValueForKey:", CFSTR("filterConnection"));
    objc_sync_exit(v8);

    queue = v8->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76___GCGenericPhysicalDevicePending_setFilterConnection_invalidatingPrevious___block_invoke;
    v12[3] = &unk_1EA4D4770;
    v12[4] = v8;
    v13 = v7;
    v14 = v9;
    v15 = a4;
    v11 = v9;
    dispatch_async(queue, v12);

  }
}

- (id)_onqueue_createDeviceWithModel:(id)a3 service:(id)a4
{
  return 0;
}

- (GCFuture)device
{
  return (GCFuture *)objc_getProperty(self, a2, 16, 1);
}

- (GCHIDServiceInfo)serviceInfo
{
  return (GCHIDServiceInfo *)objc_getProperty(self, a2, 56, 1);
}

- (_GCGenericDeviceManager)manager
{
  return (_GCGenericDeviceManager *)objc_getProperty(self, a2, 32, 1);
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

- (void)_onqueue_prepareDeviceWithConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_3(&dword_1DC79E000, v0, v1, "%@ No device DB.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_6();
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_3(&dword_1DC79E000, v0, v1, "%@ Failed to create device with model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_6();
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_1DC79E000, v0, v1, "%@ Failed to configure driver: %@");
  OUTLINED_FUNCTION_2_6();
}

- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a3 .cold.4(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_4(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3_4(&dword_1DC79E000, "%@ Configuring driver with model: %@", v4, v5);

}

- (void)_onqueue_prepareDeviceWithConnection:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_1DC79E000, v0, v1, "%@ Failed to retrieve device model: %@");
  OUTLINED_FUNCTION_2_6();
}

- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a3 .cold.6(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_4(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3_4(&dword_1DC79E000, "%@ Fetching HID device model for snapshot %@", v4, v5);

}

- (void)_onqueue_prepareDeviceWithConnection:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_1DC79E000, v0, v1, "%@ Failed to fetch HID device snapshot: %@");
  OUTLINED_FUNCTION_2_6();
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5_3(&dword_1DC79E000, v0, v1, "%@ Fetching HID device snapshot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_6();
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.9()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_1DC79E000, v0, v1, "%@ Failed to connect to GCGenericDeviceDriverConfigurationService: %@");
  OUTLINED_FUNCTION_2_6();
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5_3(&dword_1DC79E000, v0, v1, "%@ Connect to GCGenericDeviceDriverConfigurationService", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_6();
}

@end
