@implementation ATLockdownListener

- (ATLockdownListener)initWithServiceName:(id)a3
{
  id v5;
  ATLockdownListener *v6;
  id v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATLockdownListener;
  v6 = -[ATLockdownListener init](&v9, sel_init);
  if (v6)
  {
    if ((objc_msgSend(&unk_1E928BAC8, "containsObject:", v5) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unknown service name"), 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v8);
    }
    objc_storeStrong((id *)&v6->_serviceName, a3);
  }

  return v6;
}

- (BOOL)start
{
  NSObject *v3;
  NSString *serviceName;
  const char *v5;
  OS_xpc_object *mach_service;
  OS_xpc_object *connection;
  OS_xpc_object *v8;
  _QWORD handler[5];
  _BYTE buf[24];
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  ATLockdownListener *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = serviceName;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting lockdown listener with service %{public}@", buf, 0x16u);
  }

  v5 = -[NSString UTF8String](self->_serviceName, "UTF8String");
  mach_service = xpc_connection_create_mach_service(v5, MEMORY[0x1E0C80D38], 1uLL);
  connection = self->_connection;
  self->_connection = mach_service;

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v12 = __Block_byref_object_copy__3221;
  v13 = __Block_byref_object_dispose__3222;
  v14 = self;
  v8 = self->_connection;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __27__ATLockdownListener_start__block_invoke;
  handler[3] = &unk_1E927D5E0;
  handler[4] = buf;
  xpc_connection_set_event_handler(v8, handler);
  xpc_connection_resume(self->_connection);
  _Block_object_dispose(buf, 8);

  return 1;
}

- (void)stop
{
  OS_xpc_object *connection;
  OS_xpc_object *v4;

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v4 = self->_connection;
    self->_connection = 0;

  }
}

- (void)_handleNewConnection:(id)a3
{
  _xpc_connection_s *v5;
  _QWORD handler[7];
  _QWORD v7[5];
  ATLockdownListener *v8;

  v5 = (_xpc_connection_s *)a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__3221;
  v7[4] = __Block_byref_object_dispose__3222;
  v8 = self;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __43__ATLockdownListener__handleNewConnection___block_invoke;
  handler[3] = &unk_1E927D608;
  handler[5] = v7;
  handler[6] = a2;
  handler[4] = v8;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_resume(v5);
  _Block_object_dispose(v7, 8);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __43__ATLockdownListener__handleNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ATLockdownSocket *v4;
  uint64_t v5;
  void *v6;
  int v7;
  __objc2_class *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1D823096C]() == MEMORY[0x1E0C812F8])
  {
    if (lockdown_copy_checkin_info())
    {
      _ATLogCategoryFramework();
      v4 = (ATLockdownSocket *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_INFO))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v18 = v5;
        v19 = 2114;
        v20 = v3;
        _os_log_impl(&dword_1D1868000, &v4->super.super, OS_LOG_TYPE_INFO, "%{public}@ received unexpected connection event %{public}@", buf, 0x16u);
      }
LABEL_14:

      goto LABEL_15;
    }
    v4 = -[ATLockdownSocket initWithLockdownInfo:]([ATLockdownSocket alloc], "initWithLockdownInfo:", 0);
    objc_msgSend(*(id *)(a1 + 32), "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.atc"));

    if (v7)
    {
      v8 = ATLegacyMessageLink;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.atc2"));

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 48);
        v14 = *(void **)(a1 + 32);
        objc_msgSend(v14, "serviceName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("ATLockdownListener.m"), 78, CFSTR("Unknown service name %@"), v15);

        v11 = 0;
        goto LABEL_11;
      }
      v8 = ATLockdownMessageLink;
    }
    v11 = (void *)objc_msgSend([v8 alloc], "initWithSocket:", v4);
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "listener:didReceiveMessageLinkRequest:", *(_QWORD *)(a1 + 32), v11);
    CFRelease(0);

    goto LABEL_14;
  }
LABEL_15:

}

void __27__ATLockdownListener_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1D823096C]() == MEMORY[0x1E0C812E0])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_handleNewConnection:", v3);
  }
  else
  {
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_INFO, "%{public}@ received unhandled service event %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

@end
