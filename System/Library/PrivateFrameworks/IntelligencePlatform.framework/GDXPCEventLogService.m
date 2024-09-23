@implementation GDXPCEventLogService

- (GDXPCEventLogService)init
{
  const char *v2;
  GDXPCEventLogService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDXPCEventLogService;
  v3 = -[GDXPCEventLogService init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE28A90);
    v4 = objc_claimAutoreleasedReturnValue();
    serverInterface = v3->_serverInterface;
    v3->_serverInterface = (NSXPCInterface *)v4;

  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_invalidate(self->_connection, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)GDXPCEventLogService;
  -[GDXPCEventLogService dealloc](&v4, sel_dealloc);
}

- (void)locked_establishConnection
{
  NSObject *v3;
  id v4;
  const char *v5;
  NSXPCConnection *v6;
  NSXPCConnection *connection;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[8];

  if (!self->_connection)
  {
    GDXPCLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCEventLogService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.EventLog"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DD9C50);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE915BE8;
    v13[3] = &unk_1E5DDA118;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend_setInvalidationHandler_(self->_connection, v10, (uint64_t)v13);
    objc_msgSend_resume(self->_connection, v11, v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  GDXPCEventLogService *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_locked_establishConnection(v5, v6, v7);
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5->_connection, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v9;
}

- (BOOL)logStartWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  BOOL v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[16];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v12 = a4;
  v13 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1AE91593C;
  v29 = sub_1AE91594C;
  v30 = 0;
  GDXPCLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v14, OS_LOG_TYPE_DEFAULT, "GDXPCEventLogService: logStartWithId called.", buf, 2u);
  }

  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1AE915B0C;
  v23[3] = &unk_1E5DDA190;
  v23[4] = &v25;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = sub_1AE915BD4;
  v22[3] = &unk_1E5DD9CA8;
  v22[4] = &v25;
  objc_msgSend_logStartWithId_timestamp_name_parent_completion_(v17, v18, a3, v12, v13, a6, v22);

  if (a7 && (v19 = (void *)v26[5]) != 0)
  {
    v20 = 0;
    *a7 = objc_retainAutorelease(v19);
  }
  else
  {
    v20 = 1;
  }
  _Block_object_dispose(&v25, 8);

  return v20;
}

- (BOOL)logEndWithId:(int64_t)a3 timestamp:(id)a4 dependencies:(id)a5 payloadType:(id)a6 payloadVariant:(id)a7 payload:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  BOOL v26;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[16];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1AE91593C;
  v35 = sub_1AE91594C;
  v36 = 0;
  GDXPCLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v20, OS_LOG_TYPE_DEFAULT, "GDXPCEventLogService: logEndWithId called.", buf, 2u);
  }

  v21 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1AE915A30;
  v29[3] = &unk_1E5DDA190;
  v29[4] = &v31;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v22, (uint64_t)v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  v28[1] = 3221225472;
  v28[2] = sub_1AE915AF8;
  v28[3] = &unk_1E5DD9CA8;
  v28[4] = &v31;
  objc_msgSend_logEndWithId_timestamp_dependencies_payloadType_payloadVariant_payload_completion_(v23, v24, a3, v15, v16, v17, v18, v19, v28);

  if (a9 && (v25 = (void *)v32[5]) != 0)
  {
    v26 = 0;
    *a9 = objc_retainAutorelease(v25);
  }
  else
  {
    v26 = 1;
  }
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (BOOL)logInstantWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 dependencies:(id)a7 payloadType:(id)a8 payloadVariant:(id)a9 payload:(id)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  BOOL v28;
  _QWORD v31[5];
  _QWORD v32[5];
  uint8_t buf[8];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1AE91593C;
  v38 = sub_1AE91594C;
  v39 = 0;
  GDXPCLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v22, OS_LOG_TYPE_DEFAULT, "GDXPCEventLogService: logInstantWithId called.", buf, 2u);
  }

  v23 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1AE915954;
  v32[3] = &unk_1E5DDA190;
  v32[4] = &v34;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v24, (uint64_t)v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = sub_1AE915A1C;
  v31[3] = &unk_1E5DD9CA8;
  v31[4] = &v34;
  objc_msgSend_logInstantWithId_timestamp_name_parent_dependencies_payloadType_payloadVariant_payload_completion_(v25, v26, a3, v16, v17, a6, v18, v19, v20, v21, v31);

  if (a11 && (v27 = (void *)v35[5]) != 0)
  {
    v28 = 0;
    *a11 = objc_retainAutorelease(v27);
  }
  else
  {
    v28 = 1;
  }
  _Block_object_dispose(&v34, 8);

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
