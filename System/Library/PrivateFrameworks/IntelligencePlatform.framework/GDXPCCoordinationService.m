@implementation GDXPCCoordinationService

- (GDXPCCoordinationService)init
{
  const char *v2;
  GDXPCCoordinationService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDXPCCoordinationService;
  v3 = -[GDXPCCoordinationService init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE289D0);
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
  v4.super_class = (Class)GDXPCCoordinationService;
  -[GDXPCCoordinationService dealloc](&v4, sel_dealloc);
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
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.Coordination"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DD9B78);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE913EC4;
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
  GDXPCCoordinationService *v5;
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

- (BOOL)graphUpdatedWithSource:(id)a3 error:(id *)a4
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
  v21 = sub_1AE913958;
  v22 = sub_1AE913968;
  v23 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: graphUpdatedWithError called.", buf, 2u);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE913DC4;
  v16[3] = &unk_1E5DDA140;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE913EA4;
  v15[3] = &unk_1E5DDA168;
  v15[4] = &v24;
  v15[5] = &v18;
  objc_msgSend_graphUpdatedWithSource_completion_(v10, v11, (uint64_t)v6, v15);

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

- (BOOL)sourceUpdatedWithSourceType:(id)a3 sourceIdentifier:(id)a4 error:(id *)a5
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
  int v17;
  BOOL v18;
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
  char v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1AE913958;
  v30 = sub_1AE913968;
  v31 = 0;
  GDXPCLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_1AE4F2000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: sourceUpdatedWithError called. %@ %@", buf, 0x16u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1AE913CAC;
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
  v20[2] = sub_1AE913DA4;
  v20[3] = &unk_1E5DDA168;
  v20[4] = &v32;
  v20[5] = &v26;
  objc_msgSend_sourceUpdatedWithSourceType_sourceIdentifier_completion_(v15, v16, (uint64_t)v12, v13, v20);

  v17 = *((unsigned __int8 *)v33 + 24);
  if (a5 && !*((_BYTE *)v33 + 24))
  {
    *a5 = objc_retainAutorelease((id)v27[5]);
    v17 = *((unsigned __int8 *)v33 + 24);
  }
  v18 = v17 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (BOOL)streamUpdatedWithStreamName:(id)a3 isDelete:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  int v17;
  BOOL v18;
  _QWORD v20[6];
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v6 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1AE913958;
  v30 = sub_1AE913968;
  v31 = 0;
  GDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v8;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_1AE4F2000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: streamUpdatedWithStreamName called. %@ %@", buf, 0x16u);

  }
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1AE913B70;
  v21[3] = &unk_1E5DD9BA0;
  v13 = v8;
  v25 = v6;
  v22 = v13;
  v23 = &v26;
  v24 = &v32;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = sub_1AE913C8C;
  v20[3] = &unk_1E5DDA168;
  v20[4] = &v32;
  v20[5] = &v26;
  objc_msgSend_streamUpdatedWithStreamName_isDelete_completion_(v15, v16, (uint64_t)v13, v6, v20);

  v17 = *((unsigned __int8 *)v33 + 24);
  if (a5 && !*((_BYTE *)v33 + 24))
  {
    *a5 = objc_retainAutorelease((id)v27[5]);
    v17 = *((unsigned __int8 *)v33 + 24);
  }
  v18 = v17 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (BOOL)streamsChangedWithUpdated:(id)a3 deletes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  int v21;
  BOOL v22;
  _QWORD v24[6];
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1AE913958;
  v30 = sub_1AE913968;
  v31 = 0;
  GDXPCLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend_count(v8, v11, v12);
    v16 = objc_msgSend_count(v9, v14, v15);
    *(_DWORD *)buf = 134218240;
    v37 = v13;
    v38 = 2048;
    v39 = v16;
    _os_log_impl(&dword_1AE4F2000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: streamsChanged called with %tu updated and %tu deletes", buf, 0x16u);
  }

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1AE913A70;
  v25[3] = &unk_1E5DDA140;
  v25[4] = &v26;
  v25[5] = &v32;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = sub_1AE913B50;
  v24[3] = &unk_1E5DDA168;
  v24[4] = &v32;
  v24[5] = &v26;
  objc_msgSend_streamsChangedWithUpdated_deletes_completion_(v19, v20, (uint64_t)v8, v9, v24);

  v21 = *((unsigned __int8 *)v33 + 24);
  if (a5 && !*((_BYTE *)v33 + 24))
  {
    *a5 = objc_retainAutorelease((id)v27[5]);
    v21 = *((unsigned __int8 *)v33 + 24);
  }
  v22 = v21 != 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v22;
}

- (BOOL)migrateViewDatabasesWithError:(id *)a3
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
  v19 = sub_1AE913958;
  v20 = sub_1AE913968;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: migrateViewDatabases called", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE913970;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE913A50;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_migrateViewDatabasesWithCompletion_(v8, v9, (uint64_t)v13);

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
