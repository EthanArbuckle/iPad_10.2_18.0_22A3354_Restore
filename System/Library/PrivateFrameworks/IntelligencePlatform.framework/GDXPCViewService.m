@implementation GDXPCViewService

- (id)accessTokenForViewName:(id)a3 isSandboxed:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1AE923D1C;
  v29 = sub_1AE923D2C;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1AE923D1C;
  v23 = sub_1AE923D2C;
  v24 = 0;
  GDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_1AE4F2000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: accessTokenForViewName called (viewName=%@).", buf, 0xCu);
  }

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1AE924040;
  v18[3] = &unk_1E5DDA190;
  v18[4] = &v19;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = sub_1AE924108;
  v17[3] = &unk_1E5DDA1B8;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend_accessTokenForViewName_isSandboxed_completion_(v12, v13, (uint64_t)v8, v6, v17);

  v14 = (void *)v26[5];
  if (a5 && !v14)
  {
    *a5 = objc_retainAutorelease((id)v20[5]);
    v14 = (void *)v26[5];
  }
  v15 = v14;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  GDXPCViewService *v5;
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
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.View"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DDA0F0);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE92427C;
    v13[3] = &unk_1E5DDA118;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend_setInvalidationHandler_(self->_connection, v10, (uint64_t)v13);
    objc_msgSend_resume(self->_connection, v11, v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (GDXPCViewService)init
{
  const char *v2;
  GDXPCViewService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDXPCViewService;
  v3 = -[GDXPCViewService init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE28E50);
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
  v4.super_class = (Class)GDXPCViewService;
  -[GDXPCViewService dealloc](&v4, sel_dealloc);
}

- (BOOL)performUpdateForViewNames:(id)a3 includeDependencies:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
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
  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1AE923D1C;
  v24 = sub_1AE923D2C;
  v25 = 0;
  GDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: runUpdateWithViewName called.", buf, 2u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1AE92417C;
  v18[3] = &unk_1E5DDA140;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = sub_1AE92425C;
  v17[3] = &unk_1E5DDA168;
  v17[4] = &v26;
  v17[5] = &v20;
  objc_msgSend_performUpdateForViewNames_includeDependencies_completion_(v12, v13, (uint64_t)v8, v6, v17);

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

- (id)accessTokenForFeaturesWithIsSandboxed:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
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

  v5 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1AE923D1C;
  v28 = sub_1AE923D2C;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1AE923D1C;
  v22 = sub_1AE923D2C;
  v23 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEBUG, "GDXPCViewService: accessTokenForFeaturesWithIsSandboxed called.", buf, 2u);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE923F04;
  v16[3] = &unk_1E5DDA190;
  v16[4] = &v18;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE923FCC;
  v15[3] = &unk_1E5DDA1B8;
  v15[4] = &v24;
  v15[5] = &v18;
  objc_msgSend_accessTokenForFeaturesWithIsSandboxed_completion_(v10, v11, v5, v15);

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

- (BOOL)reportUnknownErrorForViewName:(id)a3 error:(id *)a4
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
  _QWORD v16[5];
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
  v20 = sub_1AE923D1C;
  v21 = sub_1AE923D2C;
  v22 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: reportUnknownErrorForViewName called (viewName=%@).", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE923E1C;
  v16[3] = &unk_1E5DDA190;
  v16[4] = &v17;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE923EE4;
  v15[3] = &unk_1E5DDA168;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend_reportUnknownErrorForViewName_completion_(v10, v11, (uint64_t)v6, v15);

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

- (BOOL)reportSQLiteErrorForViewName:(id)a3 sqliteErrorCode:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  int v14;
  BOOL v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1AE923D1C;
  v23 = sub_1AE923D2C;
  v24 = 0;
  GDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v8;
    v31 = 2048;
    v32 = a4;
    _os_log_impl(&dword_1AE4F2000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: reportSQLiteErrorForViewName called (viewName=%@) (code=%lld).", buf, 0x16u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1AE923D34;
  v18[3] = &unk_1E5DDA190;
  v18[4] = &v19;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = sub_1AE923DFC;
  v17[3] = &unk_1E5DDA168;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend_reportSQLiteErrorForViewName_sqliteErrorCode_completion_(v12, v13, (uint64_t)v8, a4, v17);

  v14 = *((unsigned __int8 *)v26 + 24);
  if (a5 && !*((_BYTE *)v26 + 24))
  {
    *a5 = objc_retainAutorelease((id)v20[5]);
    v14 = *((unsigned __int8 *)v26 + 24);
  }
  v15 = v14 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
