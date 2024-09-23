@implementation _CLLocationSmootherProxy

- (_CLLocationSmootherProxy)initWithCLLocationSmoother:(id)a3
{
  const char *v4;
  uint64_t v5;
  _CLLocationSmootherProxy *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_CLLocationSmootherProxy;
  v6 = -[_CLLocationSmootherProxy init](&v17, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("_CLLocationSmootherProxy, %p"), v5, v6);
    v11 = (const char *)objc_msgSend_UTF8String(v7, v8, v9, v10);
    v6->_queue = (OS_dispatch_queue *)dispatch_queue_create(v11, 0);
    objc_msgSend_createConnection(v6, v12, v13, v14);
    v6->_locationManagerSmoother = (CLLocationSmoother *)a3;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_18F610BF4, CFSTR("com.apple.locationd.smoother"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v6;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *queue;
  objc_super v11;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend_setLocationManagerSmoother_(self, v4, 0, v5);
  objc_msgSend_setDelegate_(self, v6, 0, v7);
  objc_msgSend_setConnection_(self, v8, 0, v9);
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)_CLLocationSmootherProxy;
  -[_CLLocationSmootherProxy dealloc](&v11, sel_dealloc);
}

- (void)didSmoothLocations:(id)a3 ofType:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F610D24;
  block[3] = &unk_1E29911F8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)createConnection
{
  NSXPCConnection *connection;
  id v4;
  const char *v5;
  NSXPCConnection *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSXPCConnection *v36;
  const char *v37;
  uint64_t v38;
  NSXPCConnection *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  _QWORD v46[5];

  connection = self->_connection;
  if (connection)
  {

    self->_connection = 0;
  }
  v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.locationd.smoother"), 4096);
  self->_connection = v6;
  if (v6)
  {
    v9 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v7, (uint64_t)&unk_1EE179C68, v8);
    objc_msgSend_setExportedInterface_(self->_connection, v10, v9, v11);
    objc_msgSend_setExportedObject_(self->_connection, v12, (uint64_t)self, v13);
    v17 = (void *)objc_msgSend_exportedInterface(self->_connection, v14, v15, v16);
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v24 = objc_msgSend_setWithObjects_(v18, v22, v19, v23, v20, v21, 0);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v17, v25, v24, (uint64_t)sel_didSmoothLocations_ofType_, 0, 0);
    v28 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v26, (uint64_t)&unk_1EE18FF48, v27);
    objc_msgSend_setRemoteObjectInterface_(self->_connection, v29, v28, v30);
    v34 = objc_msgSend_serviceName(self->_connection, v31, v32, v33);
    v35 = MEMORY[0x1E0C809B0];
    v36 = self->_connection;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = sub_18F610F3C;
    v46[3] = &unk_1E2990DE0;
    v46[4] = v34;
    objc_msgSend_setInterruptionHandler_(v36, v37, (uint64_t)v46, v38);
    v39 = self->_connection;
    v45[0] = v35;
    v45[1] = 3221225472;
    v45[2] = sub_18F610F68;
    v45[3] = &unk_1E2990DE0;
    v45[4] = v34;
    objc_msgSend_setInvalidationHandler_(v39, v40, (uint64_t)v45, v41);
    objc_msgSend_resume(self->_connection, v42, v43, v44);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CLLocationSmootherDelegate)delegate
{
  return (CLLocationSmootherDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CLLocationSmoother)locationManagerSmoother
{
  return self->_locationManagerSmoother;
}

- (void)setLocationManagerSmoother:(id)a3
{
  self->_locationManagerSmoother = (CLLocationSmoother *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
