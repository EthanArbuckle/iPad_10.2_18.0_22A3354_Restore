@implementation CLLocationManagerGathering

- (CLLocationManagerGathering)init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  CLLocationManagerGathering *v12;

  v4 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("_CLLocationManagerGatheringProxy, %p"), v2, self);
  v8 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  v9 = dispatch_queue_create(v8, 0);
  v12 = (CLLocationManagerGathering *)objc_msgSend_initWithQueue_(self, v10, (uint64_t)v9, v11);
  dispatch_release(v9);
  return v12;
}

- (CLLocationManagerGathering)initWithQueue:(id)a3
{
  uint64_t v3;
  CLLocationManagerGathering *v6;
  void *v9;
  const char *v10;
  objc_super v11;

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManagerGathering.mm"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
  }
  v11.receiver = self;
  v11.super_class = (Class)CLLocationManagerGathering;
  v6 = -[CLLocationManagerGathering init](&v11, sel_init);
  if (v6)
    v6->_queue = (OS_dispatch_queue *)a3;
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *queue;
  objc_super v12;

  v5 = (void *)objc_msgSend_connection(self, a2, v2, v3);
  objc_msgSend_invalidate(v5, v6, v7, v8);
  objc_msgSend_setConnection_(self, v9, 0, v10);
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)CLLocationManagerGathering;
  -[CLLocationManagerGathering dealloc](&v12, sel_dealloc);
}

- (id)getConnection
{
  id result;
  NSObject *v4;
  id v5;
  const char *v6;
  NSXPCConnection *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSXPCConnection *connection;
  const char *v50;
  uint64_t v51;
  NSXPCConnection *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  char *v60;
  char *v61;
  char *v62;
  _QWORD v63[5];
  id v64;
  id location;
  _QWORD v66[5];
  uint8_t buf[1632];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  result = self->_connection;
  if (!result)
  {
    if (qword_1EE172088 != -1)
      dispatch_once(&qword_1EE172088, &unk_1E2991810);
    v4 = qword_1EE1720A8;
    if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_DEBUG, "Creating new connection...", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172088 != -1)
        dispatch_once(&qword_1EE172088, &unk_1E2991810);
      LOWORD(location) = 0;
      v60 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManagerGathering getConnection]", "CoreLocation: %s\n", v60);
      if (v60 != (char *)buf)
        free(v60);
    }
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v5, v6, (uint64_t)CFSTR("com.apple.locationd.gathering"), 4096);
    self->_connection = v7;
    if (v7)
    {
      objc_msgSend__setQueue_(v7, v8, (uint64_t)self->_queue, v9);
      v12 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v10, (uint64_t)&unk_1EE18FFA8, v11);
      objc_msgSend_setExportedInterface_(self->_connection, v13, v12, v14);
      objc_msgSend_setExportedObject_(self->_connection, v15, (uint64_t)self, v16);
      v19 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v17, (uint64_t)&unk_1EE190008, v18);
      objc_msgSend_setRemoteObjectInterface_(self->_connection, v20, v19, v21);
      v25 = (void *)objc_msgSend_remoteObjectInterface(self->_connection, v22, v23, v24);
      v26 = (void *)MEMORY[0x1E0C99E60];
      v27 = objc_opt_class();
      v28 = objc_opt_class();
      v31 = objc_msgSend_setWithObjects_(v26, v29, v27, v30, v28, 0);
      objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v25, v32, v31, (uint64_t)sel_fetchAdvertisementsWithCompletion_, 0, 1);
      v36 = (void *)objc_msgSend_remoteObjectInterface(self->_connection, v33, v34, v35);
      v37 = (void *)MEMORY[0x1E0C99E60];
      v38 = objc_opt_class();
      v39 = objc_opt_class();
      v42 = objc_msgSend_setWithObjects_(v37, v40, v38, v41, v39, 0);
      objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v36, v43, v42, (uint64_t)sel_fetchAdvertisementsDetailedWithCompletion_, 0, 1);
      v47 = objc_msgSend_serviceName(self->_connection, v44, v45, v46);
      v48 = MEMORY[0x1E0C809B0];
      connection = self->_connection;
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = sub_18F61CAE8;
      v66[3] = &unk_1E2990DE0;
      v66[4] = v47;
      objc_msgSend_setInterruptionHandler_(connection, v50, (uint64_t)v66, v51);
      objc_initWeak(&location, self);
      v52 = self->_connection;
      v63[0] = v48;
      v63[1] = 3221225472;
      v63[2] = sub_18F61CC98;
      v63[3] = &unk_1E2991758;
      v63[4] = v47;
      objc_copyWeak(&v64, &location);
      objc_msgSend_setInvalidationHandler_(v52, v53, (uint64_t)v63, v54);
      objc_msgSend_activate(self->_connection, v55, v56, v57);
      if (qword_1EE172088 != -1)
        dispatch_once(&qword_1EE172088, &unk_1E2991810);
      v58 = qword_1EE1720A8;
      if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v58, OS_LOG_TYPE_DEBUG, "Creating new connection... activated!", buf, 2u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE172088 != -1)
          dispatch_once(&qword_1EE172088, &unk_1E2991810);
        v61 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManagerGathering getConnection]", "CoreLocation: %s\n", v61);
        if (v61 != (char *)buf)
          free(v61);
      }
      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);
      return self->_connection;
    }
    else
    {
      if (qword_1EE172088 != -1)
        dispatch_once(&qword_1EE172088, &unk_1E2991810);
      v59 = qword_1EE1720A8;
      if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v59, OS_LOG_TYPE_DEFAULT, "NSXPCConnection failed to init", buf, 2u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE172088 != -1)
          dispatch_once(&qword_1EE172088, &unk_1E2991810);
        LOWORD(location) = 0;
        v62 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManagerGathering getConnection]", "CoreLocation: %s\n", v62);
        if (v62 != (char *)buf)
          free(v62);
      }
      return 0;
    }
  }
  return result;
}

- (id)getRemoteObjectProxy
{
  uint64_t v2;
  uint64_t v3;
  void *Connection;
  const char *v5;
  uint64_t v6;

  Connection = (void *)objc_msgSend_getConnection(self, a2, v2, v3);
  return (id)objc_msgSend_remoteObjectProxyWithErrorHandler_(Connection, v5, (uint64_t)&unk_1E2990350, v6);
}

- (void)fetchAdvertisementsWithHandler:(id)a3
{
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *queue;
  char *v11;
  void *v12;
  const char *v13;
  _QWORD block[6];
  __int16 v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172088 != -1)
    dispatch_once(&qword_1EE172088, &unk_1E2991810);
  v6 = qword_1EE1720A8;
  if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEBUG, "fetchAdvertisementsWithHandler", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172088 != -1)
      dispatch_once(&qword_1EE172088, &unk_1E2991810);
    v15 = 0;
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManagerGathering fetchAdvertisementsWithHandler:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  queue = self->_queue;
  if (!queue)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManagerGathering.mm"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_queue"));
    queue = self->_queue;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F61D384;
  block[3] = &unk_1E2990F20;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)fetchAdvertisementsDetailedWithHandler:(id)a3
{
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *queue;
  char *v11;
  void *v12;
  const char *v13;
  _QWORD block[6];
  __int16 v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172088 != -1)
    dispatch_once(&qword_1EE172088, &unk_1E2991810);
  v6 = qword_1EE1720A8;
  if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEBUG, "fetchAdvertisementsDetailedWithHandler", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172088 != -1)
      dispatch_once(&qword_1EE172088, &unk_1E2991810);
    v15 = 0;
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManagerGathering fetchAdvertisementsDetailedWithHandler:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  queue = self->_queue;
  if (!queue)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManagerGathering.mm"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_queue"));
    queue = self->_queue;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F61D8A4;
  block[3] = &unk_1E2990F20;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)configure:(id)a3 withCompletionHandler:(id)a4
{
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *queue;
  char *v13;
  void *v14;
  const char *v15;
  _QWORD block[7];
  __int16 v17;
  uint8_t buf[1640];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172088 != -1)
    dispatch_once(&qword_1EE172088, &unk_1E2991810);
  v8 = qword_1EE1720A8;
  if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEBUG, "configure:withCompletionHandler:", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172088 != -1)
      dispatch_once(&qword_1EE172088, &unk_1E2991810);
    v17 = 0;
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManagerGathering configure:withCompletionHandler:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  queue = self->_queue;
  if (!queue)
  {
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManagerGathering.mm"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_queue"));
    queue = self->_queue;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F61DDEC;
  block[3] = &unk_1E29917F0;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(queue, block);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
