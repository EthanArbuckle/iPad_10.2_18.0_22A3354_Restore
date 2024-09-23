@implementation GDXPCKnowledgeConstructionService

- (GDXPCKnowledgeConstructionService)init
{
  const char *v2;
  GDXPCKnowledgeConstructionService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDXPCKnowledgeConstructionService;
  v3 = -[GDXPCKnowledgeConstructionService init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE28D30);
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
  v4.super_class = (Class)GDXPCKnowledgeConstructionService;
  -[GDXPCKnowledgeConstructionService dealloc](&v4, sel_dealloc);
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
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.KnowledgeConstruction"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DD9FE8);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE921680;
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
  GDXPCKnowledgeConstructionService *v5;
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

- (BOOL)runFullPipelineWithReason:(unint64_t)a3 error:(id *)a4
{
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

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1AE921268;
  v22 = sub_1AE921278;
  v23 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: runFullPipeline called.", buf, 2u);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE921580;
  v16[3] = &unk_1E5DDA140;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE921660;
  v15[3] = &unk_1E5DDA168;
  v15[4] = &v24;
  v15[5] = &v18;
  objc_msgSend_runFullPipelineWithReason_completion_(v10, v11, a3, v15);

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

- (BOOL)runFastpassPipelineWithReason:(unint64_t)a3 error:(id *)a4
{
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

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1AE921268;
  v22 = sub_1AE921278;
  v23 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: runFullPipeline called.", buf, 2u);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE921480;
  v16[3] = &unk_1E5DDA140;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE921560;
  v15[3] = &unk_1E5DDA168;
  v15[4] = &v24;
  v15[5] = &v18;
  objc_msgSend_runFastpassPipelineWithReason_completion_(v10, v11, a3, v15);

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
  v19 = sub_1AE921268;
  v20 = sub_1AE921278;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: stopPipeline called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE921380;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE921460;
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

- (BOOL)checkInWithError:(id *)a3
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
  v19 = sub_1AE921268;
  v20 = sub_1AE921278;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: checkIn called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE921280;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE921360;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_checkInWithCompletion_(v8, v9, (uint64_t)v13);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
