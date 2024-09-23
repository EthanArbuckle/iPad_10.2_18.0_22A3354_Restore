@implementation GDXPCInternalService

- (GDXPCInternalService)init
{
  const char *v2;
  GDXPCInternalService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  NSXPCInterface *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  NSXPCInterface *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)GDXPCInternalService;
  v3 = -[GDXPCInternalService init](&v28, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE28C70);
    v4 = objc_claimAutoreleasedReturnValue();
    serverInterface = v3->_serverInterface;
    v3->_serverInterface = (NSXPCInterface *)v4;

    v6 = v3->_serverInterface;
    v7 = (void *)MEMORY[0x1AF45451C]();
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v16 = (void *)objc_msgSend_initWithObjects_(v8, v15, v9, v10, v11, v12, v13, v14, 0);
    objc_autoreleasePoolPop(v7);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v6, v17, (uint64_t)v16, sel_statsWithCompletion_, 0, 1);

    v18 = v3->_serverInterface;
    v19 = (void *)MEMORY[0x1AF45451C]();
    v20 = objc_alloc(MEMORY[0x1E0C99E60]);
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v25 = (void *)objc_msgSend_initWithObjects_(v20, v24, v21, v22, v23, 0);
    objc_autoreleasePoolPop(v19);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v18, v26, (uint64_t)v25, sel_featureKeys_, 0, 1);

  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_invalidate(self->_connection, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)GDXPCInternalService;
  -[GDXPCInternalService dealloc](&v4, sel_dealloc);
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
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.Internal"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DD9D40);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE91F534;
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
  GDXPCInternalService *v5;
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

- (id)statusWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1AE91CD7C;
  v26 = sub_1AE91CD8C;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: status called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91F3D8;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91F4C0;
  v13[3] = &unk_1E5DDA098;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_statusWithCompletion_(v8, v9, (uint64_t)v13);

  v10 = (void *)v23[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = (void *)v23[5];
  }
  v11 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (BOOL)clearStatusWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  int v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: clearStatus called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91F2D8;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91F3B8;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_clearStatusWithCompletion_(v8, v9, (uint64_t)v13);

  v10 = *((unsigned __int8 *)v23 + 24);
  if (a3 && !*((_BYTE *)v23 + 24))
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = *((unsigned __int8 *)v23 + 24);
  }
  v11 = v10 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (id)statsWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1AE91CD7C;
  v26 = sub_1AE91CD8C;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: stats called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91F19C;
  v14[3] = &unk_1E5DDA190;
  v14[4] = &v16;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91F264;
  v13[3] = &unk_1E5DDA098;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_statsWithCompletion_(v8, v9, (uint64_t)v13);

  v10 = (void *)v23[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = (void *)v23[5];
  }
  v11 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (id)triplesQueryWithQuery:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;
  _QWORD v11[5];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1AE91CD7C;
  v17 = sub_1AE91CD8C;
  v18 = 0;
  v18 = (id)objc_opt_new();
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: triplesQuery called.", buf, 2u);
  }

  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)&unk_1E5DD9D80);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1AE91F090;
  v11[3] = &unk_1E5DD9DA8;
  v11[4] = &v13;
  objc_msgSend_triplesQueryWithQuery_completion_(v7, v8, (uint64_t)v4, v11);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (BOOL)stopPipelineWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  int v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: stopPipeline called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91EF90;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91F070;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_stopPipelineWithCompletion_(v8, v9, (uint64_t)v13);
  v10 = *((unsigned __int8 *)v23 + 24);
  if (a3 && !*((_BYTE *)v23 + 24))
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = *((unsigned __int8 *)v23 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

- (BOOL)runDeltaUpdatePipelineWithSource:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  int v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint8_t buf[16];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1AE91CD7C;
  v22 = sub_1AE91CD8C;
  v23 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: runDeltaUpdatePipeline called.", buf, 2u);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE91EE90;
  v16[3] = &unk_1E5DDA140;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE91EF70;
  v15[3] = &unk_1E5DDA168;
  v15[4] = &v24;
  v15[5] = &v18;
  objc_msgSend_runDeltaUpdatePipelineWithSource_completion_(v10, v11, (uint64_t)v6, v15);

  v12 = *((unsigned __int8 *)v25 + 24);
  if (a4 && !*((_BYTE *)v25 + 24))
  {
    *a4 = objc_retainAutorelease((id)v19[5]);
    v12 = *((unsigned __int8 *)v25 + 24);
  }
  v13 = v12 != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (BOOL)runToMatchingPipelineWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  int v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: runToMatchingPipeline called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91ED90;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91EE70;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_runToMatchingPipelineWithCompletion_(v8, v9, (uint64_t)v13);

  v10 = *((unsigned __int8 *)v23 + 24);
  if (a3 && !*((_BYTE *)v23 + 24))
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = *((unsigned __int8 *)v23 + 24);
  }
  v11 = v10 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (BOOL)benchmarkWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  int v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: benchmark called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91EC90;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91ED70;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_benchmarkWithCompletion_(v8, v9, (uint64_t)v13);

  v10 = *((unsigned __int8 *)v23 + 24);
  if (a3 && !*((_BYTE *)v23 + 24))
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = *((unsigned __int8 *)v23 + 24);
  }
  v11 = v10 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (id)validateGraph:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1AE91CD7C;
  v26 = sub_1AE91CD8C;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: validateGraph called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91EB34;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91EC1C;
  v13[3] = &unk_1E5DDA040;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_validateGraphWithCompletion_(v8, v9, (uint64_t)v13);

  v10 = (void *)v23[5];
  if (a3 && v10)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = (void *)v23[5];
  }
  v11 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (id)vectorSearchBenchmarkWithConfigFilePath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint8_t buf[16];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1AE91CD7C;
  v28 = sub_1AE91CD8C;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1AE91CD7C;
  v22 = sub_1AE91CD8C;
  v23 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: vectorSearchBenchmark called.", buf, 2u);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE91E9D8;
  v16[3] = &unk_1E5DDA140;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE91EAC0;
  v15[3] = &unk_1E5DDA098;
  v15[4] = &v24;
  v15[5] = &v18;
  objc_msgSend_vectorSearchBenchmarkWithConfigFilePath_completion_(v10, v11, (uint64_t)v6, v15);

  v12 = (void *)v25[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v19[5]);
    v12 = (void *)v25[5];
  }
  v13 = v12;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (id)resolveEntityWithRequest:(id)a3 enableSessionLogging:(BOOL)a4 configName:(id)a5 encodedConfig:(id)a6 withError:(id *)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD v24[6];
  _QWORD v25[5];
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t v32[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    *(_QWORD *)v32 = 0;
    v33 = v32;
    v34 = 0x3032000000;
    v35 = sub_1AE91CD7C;
    v36 = sub_1AE91CD8C;
    v37 = 0;
    GDXPCLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE4F2000, v15, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: resolveEntity called.", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v27 = buf;
    v28 = 0x3032000000;
    v29 = sub_1AE91CD7C;
    v30 = sub_1AE91CD8C;
    v16 = MEMORY[0x1E0C809B0];
    v31 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1AE91E89C;
    v25[3] = &unk_1E5DDA190;
    v25[4] = buf;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = sub_1AE91E964;
    v24[3] = &unk_1E5DD9DD0;
    v24[4] = v32;
    v24[5] = buf;
    objc_msgSend_resolveEntityWithRequest_enableSessionLogging_configName_encodedConfig_completion_(v18, v19, (uint64_t)v12, v10, v13, v14, v24);

    v20 = (void *)*((_QWORD *)v33 + 5);
    if (a7 && !v20)
    {
      *a7 = objc_retainAutorelease(*((id *)v27 + 5));
      v20 = (void *)*((_QWORD *)v33 + 5);
    }
    v21 = v20;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v32, 8);
  }
  else
  {
    GDXPCLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1AE4F2000, v22, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", v32, 2u);
    }

    v21 = 0;
  }

  return v21;
}

- (id)behaviorUnderstandingStatusWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1AE91CD7C;
  v26 = sub_1AE91CD8C;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding Status called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91E740;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91E828;
  v13[3] = &unk_1E5DDA098;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_behaviorUnderstandingStatusWithCompletion_(v8, v9, (uint64_t)v13);

  v10 = (void *)v23[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = (void *)v23[5];
  }
  v11 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (BOOL)behaviorUnderstandingClearAllDataWithShouldClearFeaturizer:(BOOL)a3 shouldClearSampleGenerator:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  int v14;
  BOOL v15;
  _QWORD v17[6];
  _QWORD v18[6];
  uint8_t buf[16];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a4;
  v7 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1AE91CD7C;
  v24 = sub_1AE91CD8C;
  v25 = 0;
  GDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding ClearAllData called.", buf, 2u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1AE91E640;
  v18[3] = &unk_1E5DDA140;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = sub_1AE91E720;
  v17[3] = &unk_1E5DDA168;
  v17[4] = &v26;
  v17[5] = &v20;
  objc_msgSend_behaviorUnderstandingClearAllDataWithShouldClearFeaturizer_shouldClearSampleGenerator_completion_(v12, v13, v7, v6, v17);

  v14 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
  {
    *a5 = objc_retainAutorelease((id)v21[5]);
    v14 = *((unsigned __int8 *)v27 + 24);
  }
  v15 = v14 != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v15;
}

- (BOOL)behaviorUnderstandingDigestWithShouldDigestFeaturizer:(BOOL)a3 shouldDigestSampleGenerator:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  int v14;
  BOOL v15;
  _QWORD v17[6];
  _QWORD v18[6];
  uint8_t buf[16];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a4;
  v7 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1AE91CD7C;
  v24 = sub_1AE91CD8C;
  v25 = 0;
  GDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding Digest called.", buf, 2u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1AE91E540;
  v18[3] = &unk_1E5DDA140;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = sub_1AE91E620;
  v17[3] = &unk_1E5DDA168;
  v17[4] = &v26;
  v17[5] = &v20;
  objc_msgSend_behaviorUnderstandingDigestWithShouldDigestFeaturizer_shouldDigestSampleGenerator_completion_(v12, v13, v7, v6, v17);

  v14 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
  {
    *a5 = objc_retainAutorelease((id)v21[5]);
    v14 = *((unsigned __int8 *)v27 + 24);
  }
  v15 = v14 != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v15;
}

- (id)behaviorUnderstandingRecentBehaviorsOfType:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1AE91CD7C;
  v31 = sub_1AE91CD8C;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1AE91CD7C;
  v25 = sub_1AE91CD8C;
  v26 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding recentBehaviorsOfType called [type=%@].", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1AE91E3D4;
  v17[3] = &unk_1E5DD9DF8;
  v9 = v6;
  v18 = v9;
  v19 = &v21;
  v20 = &v27;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = sub_1AE91E4CC;
  v16[3] = &unk_1E5DD9E20;
  v16[4] = &v27;
  v16[5] = &v21;
  objc_msgSend_behaviorUnderstandingRecentBehaviorsOfType_completion_(v11, v12, (uint64_t)v9, v16);

  v13 = (void *)v28[5];
  if (a4 && !v13)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v13 = (void *)v28[5];
  }
  v14 = v13;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (id)behaviorUnderstandingFeaturizeBehaviorOfType:(id)a3 identifier:(id)a4 usingContextAt:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1AE91CD7C;
  v41 = sub_1AE91CD8C;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1AE91CD7C;
  v35 = sub_1AE91CD8C;
  v36 = 0;
  GDXPCLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v44 = v10;
    v45 = 2112;
    v46 = v11;
    v47 = 2112;
    v48 = v12;
    _os_log_impl(&dword_1AE4F2000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding featurizeBehavior called [type=%@, identifier=%@, date=%@].", buf, 0x20u);
  }

  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1AE91E254;
  v25[3] = &unk_1E5DD9E48;
  v15 = v10;
  v26 = v15;
  v16 = v11;
  v27 = v16;
  v17 = v12;
  v28 = v17;
  v29 = &v31;
  v30 = &v37;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = sub_1AE91E360;
  v24[3] = &unk_1E5DDA040;
  v24[4] = &v37;
  v24[5] = &v31;
  objc_msgSend_behaviorUnderstandingFeaturizeBehaviorOfType_identifier_usingContextAt_completion_(v19, v20, (uint64_t)v15, v16, v17, v24);

  v21 = (void *)v38[5];
  if (a6 && !v21)
  {
    *a6 = objc_retainAutorelease((id)v32[5]);
    v21 = (void *)v38[5];
  }
  v22 = v21;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

- (id)behaviorUnderstandingHistogramsOfKind:(id)a3 behaviorType:(id)a4 viewName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  _QWORD v23[6];
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1AE91CD7C;
  v39 = sub_1AE91CD8C;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1AE91CD7C;
  v33 = sub_1AE91CD8C;
  v34 = 0;
  GDXPCLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v10;
    v43 = 2112;
    v44 = v11;
    _os_log_impl(&dword_1AE4F2000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding histograms called [kind=%@, behaviorType=%@].", buf, 0x16u);
  }

  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1AE91E0E0;
  v24[3] = &unk_1E5DD9E70;
  v15 = v10;
  v25 = v15;
  v16 = v11;
  v26 = v16;
  v27 = &v29;
  v28 = &v35;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = sub_1AE91E1E0;
  v23[3] = &unk_1E5DD9E98;
  v23[4] = &v35;
  v23[5] = &v29;
  objc_msgSend_behaviorUnderstandingHistogramsOfKind_behaviorType_viewName_completion_(v18, v19, (uint64_t)v15, v16, v12, v23);

  v20 = (void *)v36[5];
  if (a6 && !v20)
  {
    *a6 = objc_retainAutorelease((id)v30[5]);
    v20 = (void *)v36[5];
  }
  v21 = v20;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

- (id)behaviorUnderstandingFeaturizedBehaviorsForFeatureName:(id)a3 behaviorType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  _QWORD v20[6];
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_1AE91CD7C;
  v36 = sub_1AE91CD8C;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1AE91CD7C;
  v30 = sub_1AE91CD8C;
  v31 = 0;
  GDXPCLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v8;
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_1AE4F2000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding featurizedBehaviors called [featureName=%@, behaviorType=%@].", buf, 0x16u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1AE91DF6C;
  v21[3] = &unk_1E5DD9E70;
  v12 = v8;
  v22 = v12;
  v13 = v9;
  v23 = v13;
  v24 = &v26;
  v25 = &v32;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = sub_1AE91E06C;
  v20[3] = &unk_1E5DD9E98;
  v20[4] = &v32;
  v20[5] = &v26;
  objc_msgSend_behaviorUnderstandingFeaturizedBehaviorsForFeatureName_behaviorType_completion_(v15, v16, (uint64_t)v12, v13, v20);

  v17 = (void *)v33[5];
  if (a5 && !v17)
  {
    *a5 = objc_retainAutorelease((id)v27[5]);
    v17 = (void *)v33[5];
  }
  v18 = v17;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (id)contextDataForSource:(id)a3 startDate:(id)a4 endDate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1AE91CD7C;
  v41 = sub_1AE91CD8C;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1AE91CD7C;
  v35 = sub_1AE91CD8C;
  v36 = 0;
  GDXPCLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v44 = v11;
    v45 = 2112;
    v46 = v12;
    v47 = 2112;
    v48 = v10;
    _os_log_impl(&dword_1AE4F2000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: ContextData fetch called [startDate=%@, endDate=%@, source=%@].", buf, 0x20u);
  }

  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1AE91DDEC;
  v25[3] = &unk_1E5DD9E48;
  v15 = v11;
  v26 = v15;
  v16 = v12;
  v27 = v16;
  v17 = v10;
  v28 = v17;
  v29 = &v31;
  v30 = &v37;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = sub_1AE91DEF8;
  v24[3] = &unk_1E5DDA098;
  v24[4] = &v37;
  v24[5] = &v31;
  objc_msgSend_contextDataForSource_startDate_endDate_completion_(v19, v20, (uint64_t)v17, v15, v16, v24);

  v21 = (void *)v38[5];
  if (a6 && !v21)
  {
    *a6 = objc_retainAutorelease((id)v32[5]);
    v21 = (void *)v38[5];
  }
  v22 = v21;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

- (id)photosMetadataWithStartDate:(id)a3 endDate:(id)a4 maxEvents:(int64_t)a5 newestFirst:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  int64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  int64_t v49;
  __int16 v50;
  _BOOL4 v51;
  uint64_t v52;

  v8 = a6;
  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1AE91CD7C;
  v42 = sub_1AE91CD8C;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_1AE91CD7C;
  v36 = sub_1AE91CD8C;
  v37 = 0;
  GDXPCLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v45 = v12;
    v46 = 2112;
    v47 = v13;
    v48 = 2048;
    v49 = a5;
    v50 = 1024;
    v51 = v8;
    _os_log_impl(&dword_1AE4F2000, v14, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: PhotosMetadataWithStartDate [startDate=%@, endDate=%@, maxEvents=%ld, newestFirst=%d].", buf, 0x26u);
  }

  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1AE91DC58;
  v25[3] = &unk_1E5DD9EC0;
  v16 = v12;
  v26 = v16;
  v17 = v13;
  v31 = v8;
  v27 = v17;
  v28 = &v32;
  v29 = &v38;
  v30 = a5;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = sub_1AE91DD78;
  v24[3] = &unk_1E5DD9E98;
  v24[4] = &v38;
  v24[5] = &v32;
  objc_msgSend_photosMetadataWithStartDate_endDate_maxEvents_newestFirst_completion_(v19, v20, (uint64_t)v16, v17, a5, v8, v24);

  v21 = (void *)v39[5];
  if (a7 && !v21)
  {
    *a7 = objc_retainAutorelease((id)v33[5]);
    v21 = (void *)v39[5];
  }
  v22 = v21;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

- (id)behaviorUnderstandingEvaluateForBehaviorType:(id)a3 queryName:(id)a4 inferenceServiceInstanceId:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1AE91CD7C;
  v41 = sub_1AE91CD8C;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1AE91CD7C;
  v35 = sub_1AE91CD8C;
  v36 = 0;
  GDXPCLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v44 = v10;
    v45 = 2112;
    v46 = v11;
    v47 = 2112;
    v48 = v12;
    _os_log_impl(&dword_1AE4F2000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding evaluate called [behaviorType=%@, queryName=%@, inferenceServiceInstanceId=%@].", buf, 0x20u);
  }

  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1AE91DAD8;
  v25[3] = &unk_1E5DD9E48;
  v15 = v10;
  v26 = v15;
  v16 = v11;
  v27 = v16;
  v17 = v12;
  v28 = v17;
  v29 = &v31;
  v30 = &v37;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = sub_1AE91DBE4;
  v24[3] = &unk_1E5DDA040;
  v24[4] = &v37;
  v24[5] = &v31;
  objc_msgSend_behaviorUnderstandingEvaluateForBehaviorType_queryName_inferenceServiceInstanceId_completion_(v19, v20, (uint64_t)v15, v16, v17, v24);

  v21 = (void *)v38[5];
  if (a6 && !v21)
  {
    *a6 = objc_retainAutorelease((id)v32[5]);
    v21 = (void *)v38[5];
  }
  v22 = v21;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

- (id)behaviorUnderstandingSampleEntityTaggingFeaturesForPersonID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1AE91CD7C;
  v31 = sub_1AE91CD8C;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1AE91CD7C;
  v25 = sub_1AE91CD8C;
  v26 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding sampleEntityTaggingFeatures called [personID=%@].", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1AE91D96C;
  v17[3] = &unk_1E5DD9DF8;
  v9 = v6;
  v18 = v9;
  v19 = &v21;
  v20 = &v27;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = sub_1AE91DA64;
  v16[3] = &unk_1E5DDA098;
  v16[4] = &v27;
  v16[5] = &v21;
  objc_msgSend_behaviorUnderstandingSampleEntityTaggingFeaturesForPersonID_completion_(v11, v12, (uint64_t)v9, v16);

  v13 = (void *)v28[5];
  if (a4 && !v13)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v13 = (void *)v28[5];
  }
  v14 = v13;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (id)generateActivityCentricLifeEventsFromStartDate:(id)a3 toEndDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  _QWORD v18[6];
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1AE91CD7C;
  v30 = sub_1AE91CD8C;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1AE91CD7C;
  v24 = sub_1AE91CD8C;
  v25 = 0;
  GDXPCLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_1AE4F2000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: generateActivityCentricLifeEvents called [startDate: %@, endDate: %@].", buf, 0x16u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1AE91D810;
  v19[3] = &unk_1E5DDA140;
  v19[4] = &v20;
  v19[5] = &v26;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = sub_1AE91D8F8;
  v18[3] = &unk_1E5DD9E20;
  v18[4] = &v26;
  v18[5] = &v20;
  objc_msgSend_generateActivityCentricLifeEventsFromStartDate_toEndDate_completion_(v13, v14, (uint64_t)v8, v9, v18);

  v15 = (void *)v27[5];
  if (a5 && !v15)
  {
    *a5 = objc_retainAutorelease((id)v21[5]);
    v15 = (void *)v27[5];
  }
  v16 = v15;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (BOOL)behaviorUnderstandingTriggerEntityTaggingDataCollectionWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  int v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding triggerEntityTaggingDataCollection called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91D710;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91D7F0;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_behaviorUnderstandingTriggerEntityTaggingDataCollectionWithCompletion_(v8, v9, (uint64_t)v13);
  v10 = *((unsigned __int8 *)v23 + 24);
  if (a3 && !*((_BYTE *)v23 + 24))
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = *((unsigned __int8 *)v23 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

- (id)behaviorUnderstandingDumpEntityTaggingDataCollectionWithOutputPath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1AE91CD7C;
  v27 = sub_1AE91CD8C;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1AE91CD7C;
  v21 = sub_1AE91CD8C;
  v22 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding dumpEntityTaggingFeatures called with outputPath: %@", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE91D5B4;
  v16[3] = &unk_1E5DDA140;
  v16[4] = &v17;
  v16[5] = &v23;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE91D69C;
  v15[3] = &unk_1E5DDA098;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend_behaviorUnderstandingDumpEntityTaggingDataCollectionWithOutputPath_completion_(v10, v11, (uint64_t)v6, v15);

  v12 = (void *)v24[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v12 = (void *)v24[5];
  }
  v13 = v12;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (BOOL)behaviorUnderstandingMockEntityRelevanceContextWithDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  int v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1AE91CD7C;
  v21 = sub_1AE91CD8C;
  v22 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding mockEntityRelevanceContext called with date: %@", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE91D4B4;
  v16[3] = &unk_1E5DDA140;
  v16[4] = &v17;
  v16[5] = &v23;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE91D594;
  v15[3] = &unk_1E5DDA168;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend_behaviorUnderstandingMockEntityRelevanceContextWithDate_completion_(v10, v11, (uint64_t)v6, v15);

  v12 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v12 = *((unsigned __int8 *)v24 + 24);
  }
  v13 = v12 != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (BOOL)behaviorUnderstandingInjectTagForPersonID:(id)a3 tagType:(id)a4 confidence:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  int v17;
  BOOL v18;
  _QWORD v20[6];
  _QWORD v21[6];
  uint8_t buf[16];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v10 = a3;
  v11 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1AE91CD7C;
  v27 = sub_1AE91CD8C;
  v28 = 0;
  GDXPCLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v12, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding injectTagForPerson called.", buf, 2u);
  }

  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1AE91D3B4;
  v21[3] = &unk_1E5DDA140;
  v21[4] = &v23;
  v21[5] = &v29;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = sub_1AE91D494;
  v20[3] = &unk_1E5DDA168;
  v20[4] = &v29;
  v20[5] = &v23;
  objc_msgSend_behaviorUnderstandingInjectTagForPersonID_tagType_confidence_completion_(v15, v16, (uint64_t)v10, v11, v20, a5);
  v17 = *((unsigned __int8 *)v30 + 24);
  if (a6 && !*((_BYTE *)v30 + 24))
  {
    *a6 = objc_retainAutorelease((id)v24[5]);
    v17 = *((unsigned __int8 *)v30 + 24);
  }
  v18 = v17 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

- (id)behaviorUnderstandingShowEntityTaggingInjectedTagsWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1AE91CD7C;
  v26 = sub_1AE91CD8C;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding showEntityTaggingInjectedTags called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91D258;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91D340;
  v13[3] = &unk_1E5DDA098;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_behaviorUnderstandingShowEntityTaggingInjectedTagsWithCompletion_(v8, v9, (uint64_t)v13);
  v10 = (void *)v23[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = (void *)v23[5];
  }
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

- (BOOL)behaviorUnderstandingClearEntityTaggingInjectedTagsWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  int v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding clearEntityTaggingInjectedTags called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91D158;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91D238;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_behaviorUnderstandingClearEntityTaggingInjectedTagsWithCompletion_(v8, v9, (uint64_t)v13);
  v10 = *((unsigned __int8 *)v23 + 24);
  if (a3 && !*((_BYTE *)v23 + 24))
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = *((unsigned __int8 *)v23 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

- (id)viewInfoWithViewQuery:(id)a3 rows:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint8_t buf[16];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1AE91CD7C;
  v31 = sub_1AE91CD8C;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1AE91CD7C;
  v25 = sub_1AE91CD8C;
  v26 = 0;
  GDXPCLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewInfo called.", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1AE91D01C;
  v19[3] = &unk_1E5DDA190;
  v19[4] = &v21;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = sub_1AE91D0E4;
  v18[3] = &unk_1E5DD9E20;
  v18[4] = &v27;
  v18[5] = &v21;
  objc_msgSend_viewInfoWithViewQuery_rows_completion_(v13, v14, (uint64_t)v8, v9, v18);

  v15 = (void *)v28[5];
  if (a5 && !v15)
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v15 = (void *)v28[5];
  }
  v16 = v15;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v16;
}

- (id)viewSqlWithName:(id)a3 statement:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1AE91CD7C;
  v33 = sub_1AE91CD8C;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1AE91CD7C;
  v27 = sub_1AE91CD8C;
  v28 = 0;
  GDXPCLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v8;
    _os_log_impl(&dword_1AE4F2000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewSql called [name=%@].", buf, 0xCu);
  }

  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1AE91CED0;
  v20[3] = &unk_1E5DD9EE8;
  v12 = v8;
  v21 = v12;
  v22 = &v23;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = sub_1AE91CFA8;
  v19[3] = &unk_1E5DDA098;
  v19[4] = &v29;
  v19[5] = &v23;
  objc_msgSend_viewSqlWithName_statement_completion_(v14, v15, (uint64_t)v12, v9, v19);

  v16 = (void *)v30[5];
  if (a5 && !v16)
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v16 = (void *)v30[5];
  }
  v17 = v16;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (id)featureKeysWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1AE91CD7C;
  v26 = sub_1AE91CD8C;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91CD7C;
  v20 = sub_1AE91CD8C;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEBUG, "GDXPCInternalService: featureKeysWithError called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91CD94;
  v14[3] = &unk_1E5DDA190;
  v14[4] = &v16;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91CE5C;
  v13[3] = &unk_1E5DD9E20;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_featureKeys_(v8, v9, (uint64_t)v13);

  v10 = (void *)v23[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = (void *)v23[5];
  }
  v11 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
