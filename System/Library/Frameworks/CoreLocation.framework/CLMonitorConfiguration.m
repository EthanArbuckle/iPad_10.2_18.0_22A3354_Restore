@implementation CLMonitorConfiguration

+ (CLMonitorConfiguration)configWithMonitorName:(NSString *)name queue:(dispatch_queue_t)queue eventHandler:(void *)eventHandler
{
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  CLMonitorConfiguration *v14;
  const char *v15;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;

  if (eventHandler)
  {
    if (queue)
      goto LABEL_3;
LABEL_6:
    v19 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)name, (uint64_t)queue);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)a1, CFSTR("CLMonitorConfiguration.m"), 51, CFSTR("Monitoring queue is nil"));
    if (name)
      goto LABEL_4;
LABEL_7:
    v21 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)name, (uint64_t)queue);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, (uint64_t)a1, CFSTR("CLMonitorConfiguration.m"), 54, CFSTR("Monitor name is nil"));
    goto LABEL_4;
  }
  v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)name, (uint64_t)queue);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)a1, CFSTR("CLMonitorConfiguration.m"), 48, CFSTR("Monitoring event handler is nil"));
  if (!queue)
    goto LABEL_6;
LABEL_3:
  if (!name)
    goto LABEL_7;
LABEL_4:
  v10 = objc_alloc(MEMORY[0x1E0D44528]);
  v13 = (id)objc_msgSend_initWithUnderlyingQueue_(v10, v11, (uint64_t)queue, v12);
  v14 = [CLMonitorConfiguration alloc];
  return (CLMonitorConfiguration *)(id)objc_msgSend_initWithName_path_onSilo_eventHandler_useMonitorQueueForVendingMonitor_vendingHandler_(v14, v15, (uint64_t)name, 0, v13, eventHandler, 1, 0);
}

+ (id)_configWithMonitorName:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  CLMonitorConfiguration *v10;
  const char *v11;
  void *v15;
  const char *v16;

  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)a1, CFSTR("CLMonitorConfiguration.m"), 68, CFSTR("Monitor name is nil"));
  }
  v5 = objc_msgSend_sharedQueue(CLLocationManager, a2, (uint64_t)a3, v3);
  v6 = objc_alloc(MEMORY[0x1E0D44528]);
  v9 = (id)objc_msgSend_initWithUnderlyingQueue_(v6, v7, v5, v8);
  v10 = [CLMonitorConfiguration alloc];
  return (id)objc_msgSend_initWithName_path_onSilo_eventHandler_useMonitorQueueForVendingMonitor_vendingHandler_(v10, v11, (uint64_t)a3, 0, v9, 0, 1, 0);
}

- (CLMonitorConfiguration)initWithName:(id)a3 path:(id)a4 onSilo:(id)a5 eventHandler:(id)a6 useMonitorQueueForVendingMonitor:(BOOL)a7 vendingHandler:(id)a8
{
  CLMonitorConfiguration *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  os_activity_scope_state_s v26;
  objc_super v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  CLMonitorConfiguration *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)CLMonitorConfiguration;
  v15 = -[CLMonitorConfiguration init](&v27, sel_init);
  if (v15)
  {
    v16 = _os_activity_create(&dword_18F5B3000, "CL: CLMonitorConfiguration #monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v26.opaque[0] = 0;
    v26.opaque[1] = 0;
    os_activity_scope_enter(v16, &v26);

    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990150);
    v17 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290050;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2082;
      v33 = "activity";
      v34 = 2114;
      v35 = v21;
      v36 = 2050;
      v37 = v15;
      v38 = 2114;
      v39 = a3;
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitorConfiguration #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@}", buf, 0x3Au);
    }
    v15->_name = (NSString *)objc_msgSend_copy(a3, v18, v19, v20);
    v15->_path = (NSString *)objc_msgSend_copy(a4, v22, v23, v24);
    v15->_silo = (CLDispatchSilo *)a5;
    v15->_useMonitorQueue = a7;
    if (a6)
      v15->_eventHandler = _Block_copy(a6);
    if (a8)
      v15->_vendingHandler = _Block_copy(a8);
    os_activity_scope_leave(&v26);
  }
  return v15;
}

- (CLMonitorConfiguration)initWithName:(id)a3 path:(id)a4 onQueue:(id)a5 eventHandler:(id)a6 useMonitorQueueForVendingMonitor:(BOOL)a7 vendingHandler:(id)a8
{
  id v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;

  v13 = objc_alloc(MEMORY[0x1E0D44528]);
  v16 = (id)objc_msgSend_initWithUnderlyingQueue_(v13, v14, (uint64_t)a5, v15);
  return (CLMonitorConfiguration *)objc_msgSend_initWithName_path_onSilo_eventHandler_useMonitorQueueForVendingMonitor_vendingHandler_(self, v17, (uint64_t)a3, (uint64_t)a4, v16, a6, 1, 0);
}

- (CLMonitorConfiguration)initWithName:(id)a3 path:(id)a4 onQueue:(id)a5 eventHandler:(id)a6
{
  return (CLMonitorConfiguration *)MEMORY[0x1E0DE7D20](self, sel_initWithName_path_onQueue_eventHandler_useMonitorQueueForVendingMonitor_vendingHandler_, a3, a4);
}

- (void)dealloc
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  objc_super v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  CLMonitorConfiguration *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLMonitorConfiguration #monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990150);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = "activity";
    v21 = 2114;
    v22 = v6;
    v23 = 2050;
    v24 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitorConfiguration #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }

  self->_name = 0;
  self->_path = 0;

  self->_silo = 0;
  _Block_release(self->_eventHandler);
  self->_eventHandler = 0;
  _Block_release(self->_vendingHandler);
  self->_vendingHandler = 0;
  objc_msgSend_setIdentityToken_(self, v7, 0, v8);
  objc_msgSend_setStorageToken_(self, v9, 0, v10);
  objc_msgSend_setManager_(self, v11, 0, v12);
  v13.receiver = self;
  v13.super_class = (Class)CLMonitorConfiguration;
  -[CLMonitorConfiguration dealloc](&v13, sel_dealloc);
  os_activity_scope_leave(&state);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_name(self, a2, v2, v3);
  return objc_msgSend_hash(v4, v5, v6, v7);
}

- (void)vendMonitorWithIdentityAndAuthorizationAttributes:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *global_queue;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  CLMonitorConfiguration *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLMonitorConfiguration #monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990150);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2082;
    v29 = "activity";
    v30 = 2114;
    v31 = v11;
    v32 = 2050;
    v33 = self;
    v34 = 2113;
    v35 = a3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitorConfiguration #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"vendingAttributes\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  v12 = (void *)objc_msgSend_manager(self, v8, v9, v10);
  objc_msgSend_removeIdentifiableClient_(v12, v13, (uint64_t)self, v14);
  global_queue = objc_msgSend_queue(self->_silo, v15, v16, v17);
  if ((objc_msgSend_useMonitorQueue(self, v19, v20, v21) & 1) == 0)
    global_queue = dispatch_get_global_queue(17, 0);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_18F5D692C;
  v22[3] = &unk_1E2991118;
  v22[4] = self;
  v22[5] = a3;
  dispatch_async(global_queue, v22);
  os_activity_scope_leave(&state);
}

- (dispatch_queue_t)queue
{
  uint64_t v2;
  uint64_t v3;

  return (dispatch_queue_t)objc_msgSend_queue(self->_silo, a2, v2, v3);
}

- (void)setVendingHandler:(id)a3
{
  void *v4;
  id vendingHandler;

  v4 = _Block_copy(a3);
  objc_sync_enter(self);
  vendingHandler = self->_vendingHandler;
  if (vendingHandler)
    _Block_release(vendingHandler);
  self->_vendingHandler = v4;
  objc_sync_exit(self);
}

- (id)vendingHandler
{
  id vendingHandler;

  objc_sync_enter(self);
  vendingHandler = self->_vendingHandler;
  objc_sync_exit(self);
  return vendingHandler;
}

- (void)setEventHandler:(id)a3
{
  void *v4;
  id eventHandler;

  v4 = _Block_copy(a3);
  objc_sync_enter(self);
  eventHandler = self->_eventHandler;
  if (eventHandler)
    _Block_release(eventHandler);
  self->_eventHandler = v4;
  objc_sync_exit(self);
}

- (void)eventHandler
{
  id eventHandler;

  objc_sync_enter(self);
  eventHandler = self->_eventHandler;
  objc_sync_exit(self);
  return eventHandler;
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD v31[2];
  __int16 v32;
  const char *v33;
  __int16 v34;
  CLMonitorConfiguration *v35;
  __int16 v36;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  objc_msgSend_setIdentityToken_(self, v7, (uint64_t)a3, v8);
  objc_msgSend_setStorageToken_(self, v9, (uint64_t)a4, v10);
  if (objc_msgSend_identityToken(self, v11, v12, v13) && objc_msgSend_storageToken(self, v14, v15, v16))
  {
    v38[0] = CFSTR("kCLMonitorIdentityTokenKey");
    v38[1] = CFSTR("kCLMonitorLedgerAccessKey");
    v39[0] = objc_msgSend_identityToken(self, v17, v18, v19);
    v39[1] = objc_msgSend_storageToken(self, v20, v21, v22);
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v39, (uint64_t)v38, 2);
    objc_msgSend_vendMonitorWithIdentityAndAuthorizationAttributes_(self, v25, v24, v26);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990150);
    v27 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v31[0] = 68289538;
      v31[1] = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2114;
      v35 = self;
      v36 = 2114;
      v37 = objc_msgSend_name(self, v28, v29, v30);
      _os_log_impl(&dword_18F5B3000, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor completion handler called\", \"self\":%{public, location:escape_only}@, \"monitor\":%{public, location:escape_only}@}", (uint8_t *)v31, 0x26u);
    }
  }
  objc_sync_exit(self);
}

- (NSString)identityToken
{
  return self->identityToken;
}

- (void)setIdentityToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSData)storageToken
{
  return self->storageToken;
}

- (void)setStorageToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CLLocationManager)manager
{
  return self->manager;
}

- (void)setManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (id)weakClient
{
  return objc_loadWeak(&self->weakClient);
}

- (void)setWeakClient:(id)a3
{
  objc_storeWeak(&self->weakClient, a3);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)useMonitorQueue
{
  return self->_useMonitorQueue;
}

- (void)setUseMonitorQueue:(BOOL)a3
{
  self->_useMonitorQueue = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->weakClient);
}

@end
