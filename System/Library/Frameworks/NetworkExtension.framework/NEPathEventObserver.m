@implementation NEPathEventObserver

- (NEPathEventObserver)init
{

  return 0;
}

- (NEPathEventObserver)initWithQueue:(id)a3 eventHandler:(id)a4
{
  id v6;
  id v7;
  NEPathEventObserver *v8;
  const char *v9;
  NEPathEventObserver *v10;
  void *v11;
  id v13[5];
  id v14[5];
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NEPathEventObserver;
  v8 = -[NEPathEventObserver init](&v17, sel_init);
  v10 = v8;
  if (v8)
  {
    objc_setProperty_atomic_copy(v8, v9, v7, 32);
    objc_initWeak(&location, v10);
    v11 = (void *)MEMORY[0x1E0C809B0];
    v14[1] = (id)MEMORY[0x1E0C809B0];
    v14[2] = (id)3221225472;
    v14[3] = __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke;
    v14[4] = &unk_1E3CC2748;
    objc_copyWeak(&v15, &location);
    v10->_cellBlockedObserver = (network_config_cellular_blocked_observer_s *)network_config_cellular_blocked_observer_create();
    v13[1] = v11;
    v13[2] = (id)3221225472;
    v13[3] = __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke_2;
    v13[4] = &unk_1E3CC2748;
    objc_copyWeak(v14, &location);
    v10->_cellFailedObserver = (network_config_cellular_blocked_observer_s *)network_config_cellular_failed_observer_create();
    objc_copyWeak(v13, &location);
    v10->_wifiBlockedObserver = (network_config_cellular_blocked_observer_s *)network_config_wifi_blocked_observer_create();
    objc_destroyWeak(v13);
    objc_destroyWeak(v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)cancel
{
  network_config_cellular_blocked_observer_s *cellBlockedObserver;
  network_config_cellular_blocked_observer_s *cellFailedObserver;
  network_config_cellular_blocked_observer_s *wifiBlockedObserver;

  if (self)
  {
    cellBlockedObserver = self->_cellBlockedObserver;
    if (cellBlockedObserver)
    {
      MEMORY[0x1A1ACEBF8](cellBlockedObserver, a2);
      self->_cellBlockedObserver = 0;
    }
    cellFailedObserver = self->_cellFailedObserver;
    if (cellFailedObserver)
    {
      MEMORY[0x1A1ACEBF8](cellFailedObserver, a2);
      self->_cellFailedObserver = 0;
    }
    wifiBlockedObserver = self->_wifiBlockedObserver;
    if (wifiBlockedObserver)
    {
      MEMORY[0x1A1ACEBF8](wifiBlockedObserver, a2);
      self->_wifiBlockedObserver = 0;
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NEPathEventObserver cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)NEPathEventObserver;
  -[NEPathEventObserver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
}

void __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  -[NEPathEventObserver handleEvent:forPID:UUID:](WeakRetained, (void *)1, v6, v5);

}

void __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  -[NEPathEventObserver handleEvent:forPID:UUID:](WeakRetained, (void *)2, v6, v5);

}

void __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  -[NEPathEventObserver handleEvent:forPID:UUID:](WeakRetained, (void *)3, v6, v5);

}

- (void)handleEvent:(void *)a3 forPID:(void *)a4 UUID:
{
  id v7;
  id v8;
  const unsigned __int8 *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int value;
  const unsigned __int8 *bytes;
  NSObject *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  id *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  __CFString *v25;
  void (**Property)(id, id *);
  __CFString *v27;
  int v28;
  __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint8_t *v33;
  uint8_t buf[37];
  _DWORD out[12];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a1)
    goto LABEL_27;
  if (v7 && MEMORY[0x1A1ACFDA4](v7) == MEMORY[0x1E0C81398])
  {
    value = xpc_uint64_get_value(v7);
    if (v8)
    {
      if (MEMORY[0x1A1ACFDA4](v8) == MEMORY[0x1E0C813A0])
      {
        bytes = xpc_uuid_get_bytes(v8);
        v36 = 0;
        memset(out, 0, sizeof(out));
        if (proc_pidinfo(value, 17, 1uLL, out, 56) == 56)
        {
          if (uuid_compare(bytes, (const unsigned __int8 *)out))
          {
            memset(buf, 0, sizeof(buf));
            uuid_unparse(bytes, (char *)buf);
            ne_log_obj();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = off_1E3CC2768[(_QWORD)a2 - 1];
              v28 = 138412802;
              v29 = v16;
              v30 = 1024;
              v31 = value;
              v32 = 2080;
              v33 = buf;
              _os_log_impl(&dword_19BD16000, v15, OS_LOG_TYPE_INFO, "NEPathEvent %@ PID %u does not match UUID %s, is delegating traffic", (uint8_t *)&v28, 0x1Cu);
            }

            goto LABEL_5;
          }
        }
      }
    }
    v17 = NECopySigningIdentifierForPIDwithAuditToken();
    if (v17)
    {
      v18 = (void *)v17;
      ne_log_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = off_1E3CC2768[(_QWORD)a2 - 1];
        out[0] = 138412546;
        *(_QWORD *)&out[1] = v20;
        LOWORD(out[3]) = 2112;
        *(_QWORD *)((char *)&out[3] + 2) = v18;
        _os_log_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEFAULT, "NEPathEvent %@ for %@ by PID", (uint8_t *)out, 0x16u);
      }

      v21 = -[NEPathEvent initWithType:bundleID:]((id *)[NEPathEvent alloc], a2, v18);
      if (v21)
        goto LABEL_26;
    }
  }
  if (!v8)
    goto LABEL_27;
LABEL_5:
  if (MEMORY[0x1A1ACFDA4](v8) != MEMORY[0x1E0C813A0])
    goto LABEL_27;
  v9 = xpc_uuid_get_bytes(v8);
  memset(out, 0, 37);
  uuid_unparse(v9, (char *)out);
  v10 = NEHelperCacheCopySigningIdentifierMapping();
  v11 = (void *)v10;
  if (!v10 || MEMORY[0x1A1ACFDA4](v10) != MEMORY[0x1E0C81390])
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v27 = off_1E3CC2768[(_QWORD)a2 - 1];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = out;
      _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "NEPathEvent %@ failed to find bundle ID for UUID %s", buf, 0x16u);
    }

    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v11));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = off_1E3CC2768[(_QWORD)a2 - 1];
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = out;
    _os_log_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEFAULT, "NEPathEvent %@ for %@ by UUID %s", buf, 0x20u);
  }

  v21 = -[NEPathEvent initWithType:bundleID:]((id *)[NEPathEvent alloc], a2, v23);
  if (v21)
  {
LABEL_26:
    Property = (void (**)(id, id *))objc_getProperty(a1, v22, 32, 1);
    Property[2](Property, v21);

  }
LABEL_27:

}

@end
