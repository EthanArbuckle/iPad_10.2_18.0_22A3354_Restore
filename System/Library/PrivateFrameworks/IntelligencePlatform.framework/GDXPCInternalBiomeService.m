@implementation GDXPCInternalBiomeService

- (GDXPCInternalBiomeService)init
{
  const char *v2;
  GDXPCInternalBiomeService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDXPCInternalBiomeService;
  v3 = -[GDXPCInternalBiomeService init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE28C10);
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
  v4.super_class = (Class)GDXPCInternalBiomeService;
  -[GDXPCInternalBiomeService dealloc](&v4, sel_dealloc);
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
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCInternalBiomeService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.InternalBiome"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DB0F68);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE9188C0;
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
  GDXPCInternalBiomeService *v5;
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

- (id)viewRunUpdateWithViewQuery:(id)a3 forceRebuild:(BOOL)a4 priorityOverride:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
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
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1AE91809C;
  v33 = sub_1AE9180AC;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1AE91809C;
  v27 = sub_1AE9180AC;
  v28 = 0;
  GDXPCLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v12, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewRunUpdate called", buf, 2u);
  }

  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1AE918764;
  v21[3] = &unk_1E5DDA140;
  v21[4] = &v23;
  v21[5] = &v29;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = sub_1AE91884C;
  v20[3] = &unk_1E5DD9E20;
  v20[4] = &v29;
  v20[5] = &v23;
  objc_msgSend_viewRunUpdateWithViewQuery_forceRebuild_priorityOverride_completion_(v15, v16, (uint64_t)v10, v8, v11, v20);

  v17 = (void *)v30[5];
  if (a6 && !v17)
  {
    *a6 = objc_retainAutorelease((id)v24[5]);
    v17 = (void *)v30[5];
  }
  v18 = v17;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v18;
}

- (BOOL)viewStopWithError:(id *)a3
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
  v19 = sub_1AE91809C;
  v20 = sub_1AE9180AC;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewStop called", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE918664;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE918744;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_viewStopWithCompletion_(v8, v9, (uint64_t)v13);

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

- (id)viewClearAllDataWithViewQuery:(id)a3 error:(id *)a4
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
  v27 = sub_1AE91809C;
  v28 = sub_1AE9180AC;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1AE91809C;
  v22 = sub_1AE9180AC;
  v23 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewClearAllData called.", buf, 2u);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewClearAllData called.", buf, 2u);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE918508;
  v16[3] = &unk_1E5DDA140;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE9185F0;
  v15[3] = &unk_1E5DD9E20;
  v15[4] = &v24;
  v15[5] = &v18;
  objc_msgSend_viewClearAllDataWithViewQuery_completion_(v10, v11, (uint64_t)v6, v15);

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

- (BOOL)viewSetEnabledWithName:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  int v15;
  BOOL v16;
  _QWORD v18[6];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
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
  char v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1AE91809C;
  v27 = sub_1AE9180AC;
  v28 = 0;
  GDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v8;
    _os_log_impl(&dword_1AE4F2000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewSetEnabled called [name=%@].", buf, 0xCu);
  }

  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1AE9183F8;
  v19[3] = &unk_1E5DD9DF8;
  v11 = v8;
  v20 = v11;
  v21 = &v23;
  v22 = &v29;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = sub_1AE9184E8;
  v18[3] = &unk_1E5DDA168;
  v18[4] = &v29;
  v18[5] = &v23;
  objc_msgSend_viewSetEnabledWithName_enabled_completion_(v13, v14, (uint64_t)v11, v6, v18);

  v15 = *((unsigned __int8 *)v30 + 24);
  if (a5 && !*((_BYTE *)v30 + 24))
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v15 = *((unsigned __int8 *)v30 + 24);
  }
  v16 = v15 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

- (id)viewValidateWithViewQuery:(id)a3 applyFixes:(BOOL)a4 verbose:(int64_t)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[6];
  uint8_t buf[16];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a4;
  v10 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1AE91809C;
  v32 = sub_1AE9180AC;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1AE91809C;
  v26 = sub_1AE9180AC;
  v27 = 0;
  GDXPCLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v11, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewRunUpdate called", buf, 2u);
  }

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1AE91829C;
  v20[3] = &unk_1E5DDA140;
  v20[4] = &v22;
  v20[5] = &v28;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = sub_1AE918384;
  v19[3] = &unk_1E5DDA098;
  v19[4] = &v28;
  v19[5] = &v22;
  objc_msgSend_viewValidateWithViewQuery_applyFixes_verbose_completion_(v14, v15, (uint64_t)v10, v8, a5, v19);

  v16 = (void *)v29[5];
  if (a6 && !v16)
  {
    *a6 = objc_retainAutorelease((id)v23[5]);
    v16 = (void *)v29[5];
  }
  v17 = v16;
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v17;
}

- (BOOL)viewDumpStateWithError:(id *)a3
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
  v19 = sub_1AE91809C;
  v20 = sub_1AE9180AC;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewDumpState called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE91819C;
  v14[3] = &unk_1E5DDA140;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91827C;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_viewDumpStateWithCompletion_(v8, v9, (uint64_t)v13);

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

- (BOOL)viewValidateWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  int v10;
  BOOL v11;
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
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE91809C;
  v20 = sub_1AE9180AC;
  v21 = 0;
  GDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewValidate called.", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE9180B4;
  v14[3] = &unk_1E5DDA190;
  v14[4] = &v16;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_1AE91817C;
  v13[3] = &unk_1E5DDA168;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend_viewValidateWithCompletion_(v8, v9, (uint64_t)v13);

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
