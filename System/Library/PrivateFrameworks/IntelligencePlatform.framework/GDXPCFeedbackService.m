@implementation GDXPCFeedbackService

- (GDXPCFeedbackService)init
{
  const char *v2;
  GDXPCFeedbackService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDXPCFeedbackService;
  v3 = -[GDXPCFeedbackService init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE28AF0);
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
  v4.super_class = (Class)GDXPCFeedbackService;
  -[GDXPCFeedbackService dealloc](&v4, sel_dealloc);
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
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCFeedbackService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.Feedback"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DD9C80);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE916204;
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
  GDXPCFeedbackService *v5;
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

- (BOOL)logWithFeedbackData:(id)a3 type:(id)a4 variant:(id)a5 eventId:(int64_t)a6 withTimestamp:(id)a7 shouldProcessImmediately:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  BOOL v25;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[16];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1AE916110;
  v34 = sub_1AE916120;
  v35 = 0;
  GDXPCLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v19, OS_LOG_TYPE_DEFAULT, "GDXPCFeedbackService: logWithFeedbackData called.", buf, 2u);
  }

  v20 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1AE916128;
  v28[3] = &unk_1E5DDA190;
  v28[4] = &v30;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v21, (uint64_t)v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20;
  v27[1] = 3221225472;
  v27[2] = sub_1AE9161F0;
  v27[3] = &unk_1E5DD9CA8;
  v27[4] = &v30;
  objc_msgSend_logFeedback_ofType_ofVariant_forEvent_withTimestamp_shouldProcessImmediately_completion_(v22, v23, (uint64_t)v15, v16, v17, a6, v18, v9, v27);

  if (a9 && (v24 = (void *)v31[5]) != 0)
  {
    v25 = 0;
    *a9 = objc_retainAutorelease(v24);
  }
  else
  {
    v25 = 1;
  }
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
