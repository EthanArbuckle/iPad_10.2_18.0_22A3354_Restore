@implementation NEVPNConnectivitySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_pendingCancelCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __56__NEVPNConnectivitySession_cancelWithCompletionHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_setProperty_atomic_copy(v3, a2, *(id *)(a1 + 40), 32);
  return ne_session_cancel();
}

- (id)initWithConfiguration:(void *)a3 delegate:(void *)a4 queue:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  id *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  NSObject *v31;
  void *v33;
  void *v34;
  uint64_t v35;
  id *v36;
  id v37;
  objc_super v38;
  _BYTE location[12];
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1
    && (v38.receiver = a1,
        v38.super_class = (Class)NEVPNConnectivitySession,
        v11 = (id *)objc_msgSendSuper2(&v38, sel_init),
        (v12 = v11) != 0))
  {
    objc_storeStrong(v11 + 1, a2);
    objc_storeWeak(v12 + 3, v9);
    objc_storeStrong(v12 + 5, a4);
    v44[0] = 0;
    v44[1] = 0;
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getUUIDBytes:", v44);

    objc_msgSend(v8, "VPN");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = v14 == 0;

    if ((_DWORD)v13)
    {
      objc_msgSend(v8, "appVPN");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
      {
        objc_msgSend(v8, "alwaysOnVPN");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 == 0;

        if (v19)
        {
          objc_msgSend(v8, "pathController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;

          if (v21)
          {
            objc_msgSend(v8, "contentFilter");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22 == 0;

            if (v23)
            {
              objc_msgSend(v8, "dnsProxy");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24 == 0;

              if (v25)
              {
                objc_msgSend(v8, "dnsSettings");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v26 == 0;

                if (v27)
                {
                  objc_msgSend(v8, "appPush");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = v28 == 0;

                  if (v29)
                  {
                    objc_msgSend(v8, "relay");

                  }
                }
              }
            }
          }
        }
      }
    }
    v30 = ne_session_create();
    if (v30)
    {
      objc_initWeak((id *)location, v12);
      objc_copyWeak(&v37, (id *)location);
      v36 = v12;
      ne_session_set_event_handler();
      v36[2] = (id)v30;
      v15 = v36;

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)location);
    }
    else
    {
      ne_log_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = ne_session_type_to_string();
        *(_DWORD *)location = 138412802;
        *(_QWORD *)&location[4] = v33;
        v40 = 2112;
        v41 = v34;
        v42 = 2080;
        v43 = v35;
        _os_log_error_impl(&dword_19BD16000, v31, OS_LOG_TYPE_ERROR, "Failed to create a ne_session for %@ (%@), session type %s", location, 0x20u);

      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __65__NEVPNConnectivitySession_initWithConfiguration_delegate_queue___block_invoke(uint64_t a1, const char *a2)
{
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  const char *v9;
  id Property;
  const char *v11;
  void *v12;
  void (**v13)(void);
  uint8_t buf[4];
  id *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a2 == 2)
  {
    v7 = *(_QWORD **)(a1 + 32);
    if (v7)
    {
      if (!v7[2]
        || (ne_session_release(), (v8 = *(_QWORD *)(a1 + 32)) != 0)
        && (*(_QWORD *)(v8 + 16) = 0, (v7 = *(_QWORD **)(a1 + 32)) != 0))
      {
        if (objc_getProperty(v7, a2, 32, 1))
        {
          Property = *(id *)(a1 + 32);
          if (Property)
            Property = objc_getProperty(Property, v9, 32, 1);
          v13 = (void (**)(void))Property;
          v12 = *(void **)(a1 + 32);
          if (v12)
            objc_setProperty_atomic_copy(v12, v11, 0, 32);
          v13[2]();

        }
      }
    }
  }
  else if ((_DWORD)a2 == 1)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained && (v5 = objc_loadWeakRetained(WeakRetained + 3)) != 0)
    {
      v6 = v5;
      -[NSObject sessionStatusDidChange:](v5, "sessionStatusDidChange:", v4);
    }
    else
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v15 = v4;
        v16 = 2048;
        v17 = 0;
        _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Failed to notify of a session status change because self (%p) or the delegate (%p) is nil", buf, 0x16u);
      }
    }

  }
}

@end
