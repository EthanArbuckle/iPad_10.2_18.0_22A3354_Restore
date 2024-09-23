@implementation GDXPCGraphSimulationService

- (GDXPCGraphSimulationService)init
{
  const char *v2;
  GDXPCGraphSimulationService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDXPCGraphSimulationService;
  v3 = -[GDXPCGraphSimulationService init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE28B50);
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
  v4.super_class = (Class)GDXPCGraphSimulationService;
  -[GDXPCGraphSimulationService dealloc](&v4, sel_dealloc);
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
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCGraphSimulationService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.KGSimulation"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DD9CD0);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE9168AC;
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
  GDXPCGraphSimulationService *v5;
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

- (BOOL)mockTripleEntityTaggingWithContactId:(id)a3 inferredRelationshipLabel:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  int v15;
  BOOL v16;
  _QWORD v18[6];
  _QWORD v19[6];
  uint8_t buf[16];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1AE916794;
  v29 = sub_1AE9167A4;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  GDXPCLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCGraphSimulationService: mock triples for entity tagging called.", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1AE9167AC;
  v19[3] = &unk_1E5DDA140;
  v19[4] = &v25;
  v19[5] = &v21;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = sub_1AE91688C;
  v18[3] = &unk_1E5DDA168;
  v18[4] = &v21;
  v18[5] = &v25;
  objc_msgSend_mockTripleEntityTaggingWithContactId_inferredRelationshipLabel_completion_(v13, v14, (uint64_t)v8, v9, v18);

  v15 = *((unsigned __int8 *)v22 + 24);
  if (a5 && !*((_BYTE *)v22 + 24))
  {
    *a5 = objc_retainAutorelease((id)v26[5]);
    v15 = *((unsigned __int8 *)v22 + 24);
  }
  v16 = v15 != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
