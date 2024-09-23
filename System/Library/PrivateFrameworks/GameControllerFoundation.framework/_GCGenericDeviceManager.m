@implementation _GCGenericDeviceManager

- (_GCGenericDeviceManager)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  IONotificationPortRef v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_GCGenericDeviceManager;
  v2 = -[_GCGenericDeviceManager init](&v16, sel_init);
  v3 = dispatch_queue_create("GenericDevice.Manager", 0);
  v4 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v3;

  v5 = objc_alloc_init((Class)&off_1F03A7460);
  v6 = (void *)*((_QWORD *)v2 + 5);
  *((_QWORD *)v2 + 5) = v5;

  v7 = objc_opt_new();
  v8 = (void *)*((_QWORD *)v2 + 6);
  *((_QWORD *)v2 + 6) = v7;

  v9 = objc_opt_new();
  v10 = (void *)*((_QWORD *)v2 + 7);
  *((_QWORD *)v2 + 7) = v9;

  v11 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  *((_QWORD *)v2 + 2) = v11;
  if (v11)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -10);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("GenericDevice.HIDMatching", v12);
    v14 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v13;

    IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v2 + 2), *((dispatch_queue_t *)v2 + 3));
  }
  else
  {
    _gc_log_generic_device();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[_GCGenericDeviceManager init].cold.1(v12);
  }

  return (_GCGenericDeviceManager *)v2;
}

- (void)dealloc
{
  io_object_t ioHIDDeviceIterator;
  IONotificationPort *ioNotificationPort;
  objc_super v5;

  ioHIDDeviceIterator = self->_ioHIDDeviceIterator;
  if (ioHIDDeviceIterator)
  {
    IOObjectRelease(ioHIDDeviceIterator);
    self->_ioHIDDeviceIterator = 0;
  }
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_GCGenericDeviceManager;
  -[_GCGenericDeviceManager dealloc](&v5, sel_dealloc);
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  return 0;
}

- (NSObject)identifier
{
  return CFSTR("GenericDeviceManager");
}

- (void)setDeviceRegistry:(id)a3
{
  NSObject *ioNotificationQueue;
  _QWORD block[5];

  objc_storeWeak((id *)&self->_deviceRegistry, a3);
  ioNotificationQueue = self->_ioNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___GCGenericDeviceManager_setDeviceRegistry___block_invoke;
  block[3] = &unk_1EA4D2DB8;
  block[4] = self;
  dispatch_async(ioNotificationQueue, block);
}

- (id)matchHIDService:(id)a3
{
  void *v3;
  int v4;
  id *v5;
  id v6;

  v3 = (void *)IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)objc_msgSend(a3, "service"), CFSTR("GameControllerSupportedHIDDevice"));
  v4 = objc_msgSend(v3, "BOOLValue");
  v5 = (id *)&GCPhysicalDeviceProbeScoreNoMatch;
  if (v4)
    v5 = (id *)&GCPhysicalDeviceProbeScoreLowPriority;
  v6 = *v5;

  return v6;
}

- (void)_onqueue_registerDefaultConfigurationForDevice:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [NSString_0 alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSString initWithFormat:](v5, "initWithFormat:", CFSTR("LOGICAL_DEVICE(%@)"), v6);

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCGenericDeviceManager identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_GCDeviceConfiguration configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:](_GCMutableDeviceConfiguration, "configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:", v7, 10, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if ((v4 & 1) != 0)
    objc_msgSend(v11, "setTransient:", 1);
  -[_GCGenericDeviceManager deviceRegistry](self, "deviceRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceConfigurationRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConfiguration:replaceExisting:", v11, 1);

}

- (void)claimHIDService:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  _GCGenericDeviceManager *v13;
  SEL v14;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = _os_activity_create(&dword_1DC79E000, "[Generic Device Manager] Claim HID Service", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  _gc_log_generic_device();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_GCGenericDeviceManager claimHIDService:].cold.1((uint64_t)self);

  if (-[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v5))
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGenericDeviceManager.m"), 157, CFSTR("%@ has already claimed %@"), self, v5);

  }
  -[NSMutableSet addObject:](self->_claimedServices, "addObject:", v5);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___GCGenericDeviceManager_claimHIDService___block_invoke;
  block[3] = &unk_1EA4D2E30;
  v12 = v5;
  v13 = self;
  v14 = a2;
  v9 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (void)_onqueue_relinquishHIDService:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      _gc_log_generic_device();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[_GCGenericDeviceManager _onqueue_relinquishHIDService:].cold.2(a1);

      objc_msgSend((id)a1, "deviceRegistry");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceManager:deviceDidDisconnect:", a1, v4);

      objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", v3);
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      _gc_log_generic_device();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[_GCGenericDeviceManager _onqueue_relinquishHIDService:].cold.1(a1);

      objc_msgSend(v7, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancel");

      objc_msgSend(v7, "setFilterConnection:invalidatingPrevious:", 0, 1);
      objc_msgSend(v7, "setDriverConnection:invalidatingPrevious:", 0, 1);
      objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", v3);
    }

  }
}

- (void)relinquishHIDService:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = _os_activity_create(&dword_1DC79E000, "[Generic Device Manager] Relinquish HID Service", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  _gc_log_generic_device();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_GCGenericDeviceManager relinquishHIDService:].cold.1((uint64_t)self);

  if ((-[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v5) & 1) == 0)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGenericDeviceManager.m"), 245, CFSTR("%@ has not claimed %@"), self, v5);

  }
  -[NSMutableSet removeObject:](self->_claimedServices, "removeObject:", v5);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___GCGenericDeviceManager_relinquishHIDService___block_invoke;
  block[3] = &unk_1EA4D2E58;
  block[4] = self;
  v12 = v5;
  v9 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (BOOL)acceptDriverConnection:(id)a3 forHIDService:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  char v10;
  NSObject *queue;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  os_activity_scope_state_s state;

  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_1DC79E000, "[Generic Device Manager] Accept HID Driver Connection", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = -[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v8);
  if ((v10 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke;
    block[3] = &unk_1EA4D2E80;
    block[4] = self;
    v15 = v8;
    v16 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGenericDeviceManager.m"), 257, CFSTR("Unclaimed service: %@"), v8);

  }
  os_activity_scope_leave(&state);

  return v10;
}

- (BOOL)acceptFilterConnection:(id)a3 forHIDService:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  char v10;
  NSObject *queue;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  SEL v17;
  os_activity_scope_state_s state;

  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_1DC79E000, "[Generic Device Manager] Accept HID Filter Connection", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = -[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v8);
  if ((v10 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke;
    block[3] = &unk_1EA4D2EA8;
    block[4] = self;
    v15 = v8;
    v16 = v7;
    v17 = a2;
    dispatch_async(queue, block);

  }
  else
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGenericDeviceManager.m"), 281, CFSTR("Unclaimed service: %@"), v8);

  }
  os_activity_scope_leave(&state);

  return v10;
}

- (void)_onioqueue_setupHIDMatching
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1DC79E000, a2, OS_LOG_TYPE_FAULT, "Failed to setup IOHIDDevice service matching: %{mach.errno}d.  Game controller discovery may be impacted.", (uint8_t *)v2, 8u);
}

- (_GCPhysicalDeviceRegistry)deviceRegistry
{
  return (_GCPhysicalDeviceRegistry *)objc_loadWeakRetained((id *)&self->_deviceRegistry);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceRegistry);
  objc_storeStrong((id *)&self->_physicalDevices, 0);
  objc_storeStrong((id *)&self->_pendingDevices, 0);
  objc_storeStrong((id *)&self->_claimedServices, 0);
  objc_storeStrong((id *)&self->_ioNotificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DC79E000, log, OS_LOG_TYPE_FAULT, "Failed to create IONotificationPort.  Game controller discovery may be impacted.", v1, 2u);
}

- (void)claimHIDService:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC79E000, v1, v2, "%@: Asked to claim %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

- (void)_onqueue_relinquishHIDService:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC79E000, v1, v2, "%@: Removing %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

- (void)_onqueue_relinquishHIDService:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC79E000, v1, v2, "%@: Removing %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

- (void)relinquishHIDService:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC79E000, v1, v2, "%@: Asked to relinquish %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

@end
