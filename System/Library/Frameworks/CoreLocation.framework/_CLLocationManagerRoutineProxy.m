@implementation _CLLocationManagerRoutineProxy

- (void)didUpdateLocations:(id)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172078 != -1)
    dispatch_once(&qword_1EE172078, &unk_1E2990170);
  v5 = qword_1EE172080;
  if (os_log_type_enabled((os_log_t)qword_1EE172080, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine sendLocations to RT, didUpdateLocations)\"}", buf, 0x12u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18F5B6EE0;
  v7[3] = &unk_1E2991118;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

- (id)delegate
{
  return self->_delegate;
}

- (CLLocationManagerRoutine)locationManagerRoutine
{
  return self->_locationManagerRoutine;
}

- (_CLLocationManagerRoutineProxy)initWithQueue:(id)a3 locationManagerRoutine:(id)a4
{
  _CLLocationManagerRoutineProxy *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  objc_super v18;

  if (!a3)
  {
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManagerRoutine.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
    if (a4)
      return 0;
LABEL_7:
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManagerRoutine.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationManagerRoutine"));
    return 0;
  }
  if (!a4)
    goto LABEL_7;
  v18.receiver = self;
  v18.super_class = (Class)_CLLocationManagerRoutineProxy;
  v8 = -[_CLLocationManagerRoutineProxy init](&v18, sel_init);
  if (v8)
  {
    v8->_queue = (OS_dispatch_queue *)a3;
    objc_msgSend_createConnection(v8, v9, v10, v11);
    v8->_locationManagerRoutine = (CLLocationManagerRoutine *)a4;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)sub_18F5D6E70, CFSTR("com.apple.locationd.routine"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v8;
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
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *queue;
  objc_super v18;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend_setLocationManagerRoutine_(self, v4, 0, v5);
  objc_msgSend_setDelegate_(self, v6, 0, v7);
  v11 = (void *)objc_msgSend_connection(self, v8, v9, v10);
  objc_msgSend_invalidate(v11, v12, v13, v14);
  objc_msgSend_setConnection_(self, v15, 0, v16);
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)_CLLocationManagerRoutineProxy;
  -[_CLLocationManagerRoutineProxy dealloc](&v18, sel_dealloc);
}

- (void)didUpdateLocations:(id)a3 withReply:(id)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *queue;
  _QWORD block[7];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172078 != -1)
    dispatch_once(&qword_1EE172078, &unk_1E2990170);
  v7 = qword_1EE172080;
  if (os_log_type_enabled((os_log_t)qword_1EE172080, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine sendLocations to RT, didUpdateLocations:withReply\"}", buf, 0x12u);
  }
  if (a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F5D708C;
    block[3] = &unk_1E2991140;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(queue, block);
  }
  else
  {
    objc_msgSend_didUpdateLocations_(self, v8, (uint64_t)a3, v9);
  }
}

- (void)didUpdateInertialData:(id)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172078 != -1)
    dispatch_once(&qword_1EE172078, &unk_1E2990170);
  v5 = qword_1EE172080;
  if (os_log_type_enabled((os_log_t)qword_1EE172080, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine sendInertial to RT, didUpdateInertialData\"}", buf, 0x12u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18F5D72F8;
  v7[3] = &unk_1E2991118;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

- (void)createConnection
{
  uint64_t v2;
  uint64_t v3;
  NSXPCConnection *connection;
  id v6;
  const char *v7;
  NSXPCConnection *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSXPCConnection *v63;
  const char *v64;
  uint64_t v65;
  NSXPCConnection *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[5];
  _QWORD v84[5];
  uint8_t buf[4];
  int v86;
  __int16 v87;
  const char *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (connection)
  {
    objc_msgSend_invalidate(connection, a2, v2, v3);

    self->_connection = 0;
  }
  v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v8 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v6, v7, (uint64_t)CFSTR("com.apple.locationd.routine"), 4096);
  self->_connection = v8;
  if (v8)
  {
    if (qword_1EE172078 != -1)
      dispatch_once(&qword_1EE172078, &unk_1E2990170);
    v12 = qword_1EE172080;
    if (os_log_type_enabled((os_log_t)qword_1EE172080, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v86 = 0;
      v87 = 2082;
      v88 = "";
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine createConnection\"}", buf, 0x12u);
    }
    v15 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v13, (uint64_t)&unk_1EE173A98, v14);
    objc_msgSend_setExportedInterface_(self->_connection, v16, v15, v17);
    objc_msgSend_setExportedObject_(self->_connection, v18, (uint64_t)self, v19);
    v23 = (void *)objc_msgSend_exportedInterface(self->_connection, v20, v21, v22);
    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v29 = objc_msgSend_setWithObjects_(v24, v27, v25, v28, v26, 0);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v23, v30, v29, (uint64_t)sel_didUpdateLocations_, 0, 0);
    v34 = (void *)objc_msgSend_exportedInterface(self->_connection, v31, v32, v33);
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    v40 = objc_msgSend_setWithObjects_(v35, v38, v36, v39, v37, 0);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v34, v41, v40, (uint64_t)sel_didUpdateLocations_withReply_, 0, 0);
    v45 = (void *)objc_msgSend_exportedInterface(self->_connection, v42, v43, v44);
    v46 = (void *)MEMORY[0x1E0C99E60];
    v47 = objc_opt_class();
    v48 = objc_opt_class();
    v51 = objc_msgSend_setWithObjects_(v46, v49, v47, v50, v48, 0);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v45, v52, v51, (uint64_t)sel_didUpdateInertialData_, 0, 0);
    v55 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v53, (uint64_t)&unk_1EE18FE28, v54);
    objc_msgSend_setRemoteObjectInterface_(self->_connection, v56, v55, v57);
    v61 = objc_msgSend_serviceName(self->_connection, v58, v59, v60);
    v62 = MEMORY[0x1E0C809B0];
    v63 = self->_connection;
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = sub_18F5D773C;
    v84[3] = &unk_1E2990DE0;
    v84[4] = v61;
    objc_msgSend_setInterruptionHandler_(v63, v64, (uint64_t)v84, v65);
    v66 = self->_connection;
    v83[0] = v62;
    v83[1] = 3221225472;
    v83[2] = sub_18F5D7768;
    v83[3] = &unk_1E2990DE0;
    v83[4] = v61;
    objc_msgSend_setInvalidationHandler_(v66, v67, (uint64_t)v83, v68);
    objc_msgSend_resume(self->_connection, v69, v70, v71);
  }
  if (objc_msgSend_updating(self, v9, v10, v11))
  {
    v75 = (void *)objc_msgSend_connection(self, v72, v73, v74);
    v79 = (void *)objc_msgSend_remoteObjectProxy(v75, v76, v77, v78);
    objc_msgSend_startUpdatingLocation(v79, v80, v81, v82);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)inertialDelegate
{
  return self->_inertialDelegate;
}

- (void)setInertialDelegate:(id)a3
{
  self->_inertialDelegate = a3;
}

- (void)setLocationManagerRoutine:(id)a3
{
  self->_locationManagerRoutine = (CLLocationManagerRoutine *)a3;
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

@end
