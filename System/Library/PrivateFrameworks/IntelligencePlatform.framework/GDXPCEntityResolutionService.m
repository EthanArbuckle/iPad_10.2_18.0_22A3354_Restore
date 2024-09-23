@implementation GDXPCEntityResolutionService

- (GDXPCEntityResolutionService)init
{
  const char *v2;
  GDXPCEntityResolutionService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDXPCEntityResolutionService;
  v3 = -[GDXPCEntityResolutionService init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE28A30);
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
  v4.super_class = (Class)GDXPCEntityResolutionService;
  -[GDXPCEntityResolutionService dealloc](&v4, sel_dealloc);
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
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.EntityResolution"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DD9BD0);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE914FE0;
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
  GDXPCEntityResolutionService *v5;
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

- (BOOL)warmupForMode:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    GDXPCLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: warmup called.", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = sub_1AE914B2C;
    v22 = sub_1AE914B3C;
    v8 = MEMORY[0x1E0C809B0];
    v23 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1AE914EF8;
    v17[3] = &unk_1E5DDA190;
    v17[4] = buf;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = sub_1AE914FC0;
    v16[3] = &unk_1E5DDA168;
    v16[4] = &v24;
    v16[5] = buf;
    objc_msgSend_warmupForMode_withCompletion_(v10, v11, a3, v16);

    v12 = *((unsigned __int8 *)v25 + 24);
    if (a4 && !*((_BYTE *)v25 + 24))
    {
      *a4 = objc_retainAutorelease(*((id *)v19 + 5));
      v12 = *((unsigned __int8 *)v25 + 24);
    }
    v13 = v12 != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    GDXPCLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE4F2000, v14, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", buf, 2u);
    }

    return 0;
  }
  return v13;
}

- (id)submitQuery:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    *(_QWORD *)v24 = 0;
    v25 = v24;
    v26 = 0x3032000000;
    v27 = sub_1AE914B2C;
    v28 = sub_1AE914B3C;
    v29 = 0;
    GDXPCLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: submitQuery called.", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = sub_1AE914B2C;
    v22 = sub_1AE914B3C;
    v8 = MEMORY[0x1E0C809B0];
    v23 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1AE914DBC;
    v17[3] = &unk_1E5DDA190;
    v17[4] = buf;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = sub_1AE914E84;
    v16[3] = &unk_1E5DD9DD0;
    v16[4] = v24;
    v16[5] = buf;
    objc_msgSend_submitQuery_withCompletion_(v10, v11, (uint64_t)v6, v16);

    v12 = (void *)*((_QWORD *)v25 + 5);
    if (a4 && !v12)
    {
      *a4 = objc_retainAutorelease(*((id *)v19 + 5));
      v12 = (void *)*((_QWORD *)v25 + 5);
    }
    v13 = v12;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v24, 8);
  }
  else
  {
    GDXPCLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1AE4F2000, v14, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", v24, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)submitCollectionQuery:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    *(_QWORD *)v24 = 0;
    v25 = v24;
    v26 = 0x3032000000;
    v27 = sub_1AE914B2C;
    v28 = sub_1AE914B3C;
    v29 = 0;
    GDXPCLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: submitCollectionQuery called.", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = sub_1AE914B2C;
    v22 = sub_1AE914B3C;
    v8 = MEMORY[0x1E0C809B0];
    v23 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1AE914C80;
    v17[3] = &unk_1E5DDA190;
    v17[4] = buf;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = sub_1AE914D48;
    v16[3] = &unk_1E5DD9BF8;
    v16[4] = v24;
    v16[5] = buf;
    objc_msgSend_submitCollectionQuery_withCompletion_(v10, v11, (uint64_t)v6, v16);

    v12 = (void *)*((_QWORD *)v25 + 5);
    if (a4 && !v12)
    {
      *a4 = objc_retainAutorelease(*((id *)v19 + 5));
      v12 = (void *)*((_QWORD *)v25 + 5);
    }
    v13 = v12;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v24, 8);
  }
  else
  {
    GDXPCLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1AE4F2000, v14, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", v24, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)generateMentionsForQuery:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    *(_QWORD *)v24 = 0;
    v25 = v24;
    v26 = 0x3032000000;
    v27 = sub_1AE914B2C;
    v28 = sub_1AE914B3C;
    v29 = 0;
    GDXPCLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: generateMentionsForQuery called.", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = sub_1AE914B2C;
    v22 = sub_1AE914B3C;
    v8 = MEMORY[0x1E0C809B0];
    v23 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1AE914B44;
    v17[3] = &unk_1E5DDA190;
    v17[4] = buf;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = sub_1AE914C0C;
    v16[3] = &unk_1E5DD9C20;
    v16[4] = v24;
    v16[5] = buf;
    objc_msgSend_generateMentionsForQuery_withCompletion_(v10, v11, (uint64_t)v6, v16);

    v12 = (void *)*((_QWORD *)v25 + 5);
    if (a4 && !v12)
    {
      *a4 = objc_retainAutorelease(*((id *)v19 + 5));
      v12 = (void *)*((_QWORD *)v25 + 5);
    }
    v13 = v12;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v24, 8);
  }
  else
  {
    GDXPCLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1AE4F2000, v14, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", v24, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
