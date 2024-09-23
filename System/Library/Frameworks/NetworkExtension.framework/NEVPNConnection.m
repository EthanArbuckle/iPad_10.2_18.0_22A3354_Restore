@implementation NEVPNConnection

- (void)dealloc
{
  objc_super v3;

  if (self && self->_session)
  {
    ne_session_cancel();
    self->_session = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NEVPNConnection;
  -[NEVPNConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)startVPNTunnelAndReturnError:(NSError *)error
{
  return -[NEVPNConnection startVPNTunnelWithOptions:andReturnError:](self, "startVPNTunnelWithOptions:andReturnError:", 0, error);
}

- (BOOL)startVPNTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error
{
  NSDictionary *v6;
  NEVPNConnection *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v22;
  uint8_t buf[16];

  v6 = options;
  v7 = self;
  objc_sync_enter(v7);
  if (+[NEProvider isRunningInProvider](NEProvider, "isRunningInProvider"))
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "VPN tunnels cannot be started from Network Extension providers", buf, 2u);
    }

    if (error)
    {
      v9 = 3;
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), v9, 0);
      v15 = 0;
      v16 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (error)
    *error = 0;
  v10 = -[NEVPNConnection status](v7, "status");
  if (!v7 || !v10 || !v7->_session)
  {
    if (error)
    {
      v9 = 1;
      goto LABEL_17;
    }
LABEL_27:
    v15 = 0;
    v16 = 0;
    goto LABEL_28;
  }
  if (-[NEVPNConnection status](v7, "status") == NEVPNStatusDisconnected)
  {
    -[NEVPNConnection manager](v7, "manager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[NEVPNConnection manager](v7, "manager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "VPN");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEnabled") & 1) != 0)
      {

      }
      else
      {
        -[NEVPNConnection manager](v7, "manager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "configuration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appVPN");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v19, "isEnabled");

        if ((v22 & 1) == 0)
        {
          if (error)
          {
            v9 = 2;
            goto LABEL_17;
          }
          goto LABEL_27;
        }
      }
    }
  }
  if (v6
    || (-[NEVPNConnection manager](v7, "manager"),
        v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6)
    && (-[NEVPNConnection manager](v7, "manager"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (NSDictionary *)objc_msgSend(v20, "copyCurrentUserStartOptions"),
        v20,
        v6))
  {
    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  }
  else
  {
    v15 = 0;
  }
  ne_session_start_with_options();
  v16 = 1;
LABEL_28:

  objc_sync_exit(v7);
  return v16;
}

- (void)stopVPNTunnel
{
  NEVPNConnection *v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = self;
  objc_sync_enter(v2);
  if (+[NEProvider isRunningInProvider](NEProvider, "isRunningInProvider"))
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "VPN tunnels cannot be stopped from Network Extension providers", v4, 2u);
    }

  }
  else if (v2 && v2->_session)
  {
    ne_session_stop();
  }
  objc_sync_exit(v2);

}

- (NEVPNManager)manager
{
  return (NEVPNManager *)objc_loadWeakRetained((id *)&self->_weakmanager);
}

- (void)fetchLastDisconnectErrorWithCompletionHandler:(void *)handler
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = handler;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__NEVPNConnection_fetchLastDisconnectErrorWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3CC4218;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)self, 1, 1, v6);

}

- (void)fetchExtendedStatusWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__NEVPNConnection_fetchExtendedStatusWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3CC4138;
  v7 = v4;
  v5 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)self, 1, 0, v6);

}

- (void)fetchStatisticsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  ne_session_get_info();

}

- (NEVPNStatus)status
{
  return self->_status;
}

- (NSDate)connectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (BOOL)installNotify
{
  return self->_installNotify;
}

- (void)setInstallNotify:(BOOL)a3
{
  self->_installNotify = a3;
}

- (NSError)lastDisconnectError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisconnectError, 0);
  objc_destroyWeak((id *)&self->_weakmanager);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationName, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_connectedDate, 0);
}

void __56__NEVPNConnection_fetchStatisticsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4 && MEMORY[0x1A1ACFDA4]() == MEMORY[0x1E0C812F8])
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v3 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __60__NEVPNConnection_fetchExtendedStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateSessionInfoForce:(uint64_t)a3 notify:(void *)a4 withCompletionHandler:
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[16];

  v5 = a4;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))v5;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 56))
    {
      v9 = v5;
      ne_session_get_info2();

    }
    else
    {
      ne_log_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEFAULT, "No ne_session available, cannot update session info", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v8, 0);

    }
  }

}

void __71__NEVPNConnection_updateSessionInfoForce_notify_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int64_t int64;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  unsigned int v18;
  const void *data;
  const void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  int v42;
  uint64_t v43;
  __int128 v44;
  uint8_t buf[16];
  uint64_t v46;
  size_t length;

  v3 = a2;
  v4 = v3;
  if (!v3 || (v5 = MEMORY[0x1A1ACFDA4](v3), v6 = MEMORY[0x1E0C812F8], v5 != MEMORY[0x1E0C812F8]))
  {
    v44 = *(_OWORD *)(a1 + 40);
    v7 = (id)v44;
    ne_session_get_status();

    goto LABEL_36;
  }
  int64 = xpc_dictionary_get_int64(v4, "NEStatus");
  xpc_dictionary_get_value(v4, "IPv4");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v4, "IPv6");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && MEMORY[0x1A1ACFDA4](v9) == v6)
  {
    v11 = 1;
    goto LABEL_10;
  }
  if (v10)
  {
    v11 = MEMORY[0x1A1ACFDA4](v10) == v6;
LABEL_10:
    LODWORD(v43) = v11;
    goto LABEL_11;
  }
  LODWORD(v43) = 0;
LABEL_11:
  xpc_dictionary_get_value(v4, "IPSec");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if ((v12 && MEMORY[0x1A1ACFDA4](v12) == v6
     || (xpc_dictionary_get_value(v4, "PPP"),
         v14 = objc_claimAutoreleasedReturnValue(),
         v13,
         (v13 = (void *)v14) != 0))
    && MEMORY[0x1A1ACFDA4](v13) == v6)
  {
    v18 = xpc_dictionary_get_int64(v4, "Status") + 1;
    if (v18 <= 4)
      int64 = qword_19BED72C8[v18];
    v17 = xpc_dictionary_get_int64(v13, "ConnectTime");
  }
  else
  {
    xpc_dictionary_get_value(v4, "VPN");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15 && MEMORY[0x1A1ACFDA4](v15) == v6)
      v17 = xpc_dictionary_get_int64(v16, "ConnectTime");
    else
      v17 = 0;

  }
  length = 0;
  data = xpc_dictionary_get_data(v4, "LastDisconnectError", &length);
  if (data)
  {
    v20 = data;
    v21 = objc_alloc(MEMORY[0x1E0C99D50]);
    v22 = (void *)objc_msgSend(v21, "initWithBytesNoCopy:length:freeWhenDone:", v20, length, 0);
    v46 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v22, &v46);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      ne_log_obj();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "Failed to decode the last disconnect error", buf, 2u);
      }

    }
  }
  else
  {
    v23 = 0;
  }
  v25 = *(_QWORD **)(a1 + 32);
  if (v25)
    v26 = v25[7];
  else
    v26 = 0;
  if (v26 != *(_QWORD *)(a1 + 48))
    goto LABEL_33;
  -[NEVPNConnection resetLastDisconnectError:](v25, v23);
  v28 = objc_msgSend(*(id *)(a1 + 32), "status");
  v29 = *(_QWORD **)(a1 + 32);
  if (v28 == int64)
  {
    if ((_DWORD)v43 == objc_msgSend(v29, "installed"))
      goto LABEL_33;
    goto LABEL_49;
  }
  v29[2] = int64;
  objc_msgSend(*(id *)(a1 + 32), "connectedDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);

    if (v31 == 1)
    {
      v32 = *(_QWORD *)(a1 + 32);
      v33 = *(void **)(v32 + 24);
      *(_QWORD *)(v32 + 24) = 0;
LABEL_47:

      v34 = *(_QWORD **)(a1 + 32);
      goto LABEL_48;
    }
  }
  v34 = *(_QWORD **)(a1 + 32);
  if (!v34[3] && v34[2] == 3 && v17 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "systemUptime");
    v37 = v36;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dateByAddingTimeInterval:", (double)v17 - v37);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = *(_QWORD *)(a1 + 32);
    v40 = *(void **)(v39 + 24);
    *(_QWORD *)(v39 + 24) = v38;

    goto LABEL_47;
  }
LABEL_48:
  v41 = objc_msgSend(v34, "installed", v43);
  if ((_DWORD)v43 == v41)
    goto LABEL_51;
LABEL_49:
  objc_msgSend(*(id *)(a1 + 32), "setInstalled:", v43, v43);
  v42 = objc_msgSend(*(id *)(a1 + 32), "installNotify");
  if (v28 != int64 || v42)
  {
LABEL_51:
    if (*(_BYTE *)(a1 + 56))
      -[NEVPNConnection notifyStatusChanged](*(_QWORD *)(a1 + 32));
  }
LABEL_33:
  if (*(_QWORD *)(a1 + 40))
  {
    v27 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
LABEL_36:

}

- (void)resetLastDisconnectError:(void *)a1
{
  id v4;
  id *v5;
  id v6;
  id *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = a1;
    objc_sync_enter(v5);
    v7 = v5 + 9;
    v6 = v5[9];
    if (v6 == v4 || (objc_msgSend(v6, "isEqual:", v4) & 1) != 0)
    {
      objc_sync_exit(v5);

      goto LABEL_29;
    }
    v8 = (__CFString *)v5[5];
    objc_msgSend(v5, "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "manager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (__CFString *)v12;
    }
    if (v8)
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *v7;
        if (*v7)
        {
          objc_msgSend(*v7, "localizedDescription");
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v4)
          {
LABEL_11:
            objc_msgSend(v4, "localizedDescription");
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
        }
        else
        {
          v15 = CFSTR("none");
          if (v4)
            goto LABEL_11;
        }
        v16 = CFSTR("none");
LABEL_18:
        v19 = 138412802;
        v20 = v8;
        v21 = 2112;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEFAULT, "Last disconnect error for %@ changed from \"%@\" to \"%@\", (uint8_t *)&v19, 0x20u);
        if (v4)

        if (!v14)
          goto LABEL_28;
        goto LABEL_27;
      }
LABEL_28:

      objc_msgSend(v5, "willChangeValueForKey:", CFSTR("lastDisconnectError"));
      objc_storeStrong(v5 + 9, a2);

      objc_sync_exit(v5);
      objc_msgSend(v5, "didChangeValueForKey:", CFSTR("lastDisconnectError"));
      goto LABEL_29;
    }
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v17 = *v7;
    if (*v7)
    {
      objc_msgSend(*v7, "localizedDescription");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
LABEL_15:
        objc_msgSend(v4, "localizedDescription");
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else
    {
      v15 = CFSTR("none");
      if (v4)
        goto LABEL_15;
    }
    v18 = CFSTR("none");
LABEL_24:
    v19 = 138412546;
    v20 = v15;
    v21 = 2112;
    v22 = v18;
    _os_log_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEFAULT, "Last disconnect error changed from \"%@\" to \"%@\", (uint8_t *)&v19, 0x16u);
    if (v4)

    if (!v17)
      goto LABEL_28;
LABEL_27:

    goto LABEL_28;
  }
LABEL_29:

}

- (void)notifyStatusChanged
{
  id v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.networkextension.statuschanged"), a1);

  }
}

uint64_t __71__NEVPNConnection_updateSessionInfoForce_notify_withCompletionHandler___block_invoke_24(uint64_t *a1, int a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;

  v4 = (_QWORD *)a1[4];
  if (v4)
    v5 = v4[7];
  else
    v5 = 0;
  if (v5 == a1[6] && objc_msgSend(v4, "status") != a2)
  {
    *(_QWORD *)(a1[4] + 16) = a2;
    -[NEVPNConnection notifyStatusChanged](a1[4]);
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __65__NEVPNConnection_fetchLastDisconnectErrorWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  unsigned int v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "lastDisconnectError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v2)
  {
    v15 = 0;
    goto LABEL_22;
  }
  v15 = v3;
  objc_msgSend(v15, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("NEVPNConnectionErrorDomainPlugin"));

  if (v6)
  {
    v7 = objc_msgSend(v15, "code");
    v8 = 1;
    switch(v7)
    {
      case 2:
        goto LABEL_21;
      case 3:
      case 5:
      case 8:
      case 9:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 18:
      case 19:
      case 21:
      case 24:
      case 27:
      case 28:
      case 29:
        goto LABEL_22;
      case 4:
        v8 = 2;
        goto LABEL_21;
      case 6:
        v8 = 14;
        goto LABEL_21;
      case 7:
        v8 = 12;
        goto LABEL_21;
      case 10:
        v8 = 4;
        goto LABEL_21;
      case 17:
        v8 = 5;
        goto LABEL_21;
      case 20:
        v8 = 6;
        goto LABEL_21;
      case 22:
        v8 = 7;
        goto LABEL_21;
      case 23:
        v8 = 8;
        goto LABEL_21;
      case 25:
        v8 = 9;
        goto LABEL_21;
      case 26:
        v8 = 10;
        goto LABEL_21;
      case 30:
        v8 = 11;
        goto LABEL_21;
      default:
        if (v7 != 38)
          goto LABEL_22;
        v8 = 13;
        break;
    }
    goto LABEL_21;
  }
  objc_msgSend(v15, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("NEVPNConnectionErrorDomainIPSec"));

  if (v10)
  {
    v11 = objc_msgSend(v15, "code") - 2;
    if (v11 <= 0x16 && ((0x7DFFBFu >> v11) & 1) != 0)
    {
      v8 = qword_19BED72F0[v11];
LABEL_21:
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v15, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("NEVPNConnectionErrorDomain"), v8, v13);

      v15 = (id)v14;
    }
  }
LABEL_22:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)createDisconnectErrorWithDomain:(id)a3 code:(unsigned int)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("NEVPNConnectionErrorDomainPlugin")))
  {
    v6 = 0;
    v7 = 0;
    switch(a4)
    {
      case 2u:
        v8 = CFSTR("VPN_DISCONNECT_ERROR_OVERSLEPT");
        goto LABEL_32;
      case 3u:
      case 8u:
      case 9u:
      case 0xBu:
      case 0xDu:
      case 0x13u:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x24u:
      case 0x25u:
        break;
      case 4u:
        goto LABEL_6;
      case 5u:
        goto LABEL_16;
      case 6u:
        v8 = CFSTR("VPN_DISCONNECT_ERROR_PLUGIN_NOT_AVAILABLE");
        goto LABEL_32;
      case 7u:
        goto LABEL_13;
      case 0xAu:
        goto LABEL_12;
      case 0xCu:
        v8 = CFSTR("VPN_DISCONNECT_ERROR_CONNECT_TIMEOUT");
        goto LABEL_32;
      case 0xEu:
        v8 = CFSTR("VPN_DISCONNECT_ERROR_CONFIGURATION_APP_REQUIRED");
        goto LABEL_32;
      case 0xFu:
        goto LABEL_9;
      case 0x10u:
        v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_ADDRESS_INVALID");
        goto LABEL_32;
      case 0x11u:
        goto LABEL_11;
      case 0x12u:
        goto LABEL_14;
      case 0x14u:
        v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_NOT_RESPONDING");
        goto LABEL_32;
      case 0x15u:
        goto LABEL_17;
      case 0x16u:
        goto LABEL_18;
      case 0x17u:
        goto LABEL_7;
      case 0x18u:
        goto LABEL_10;
      case 0x19u:
        goto LABEL_15;
      case 0x1Au:
        goto LABEL_19;
      case 0x1Bu:
        goto LABEL_20;
      case 0x1Cu:
        goto LABEL_8;
      case 0x1Du:
        goto LABEL_21;
      case 0x1Eu:
        goto LABEL_22;
      case 0x26u:
        v8 = CFSTR("VPN_DISCONNECT_ERROR_CONFIGURATION_NOT_FOUND");
        goto LABEL_32;
      default:
        goto LABEL_29;
    }
  }
  else
  {
    v6 = 0;
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("NEVPNConnectionErrorDomainIPSec")))
    {
      v7 = 0;
      switch(a4)
      {
        case 2u:
LABEL_9:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_ADDRESS_MISSING");
          goto LABEL_32;
        case 3u:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_SHARED_SECRET_MISSING");
          goto LABEL_32;
        case 4u:
LABEL_10:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_MISSING");
          goto LABEL_32;
        case 5u:
LABEL_11:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_ADDRESS_RESOLUTION_FAILED");
          goto LABEL_32;
        case 6u:
        case 0x12u:
LABEL_6:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_NO_NETWORK_AVAILABLE");
          goto LABEL_32;
        case 7u:
LABEL_12:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_CONFIGURATION_FAILED");
          goto LABEL_32;
        case 8u:
LABEL_13:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_INTERNAL_ERROR");
          goto LABEL_32;
        case 9u:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_CONNECTION_ERROR");
          goto LABEL_32;
        case 0xAu:
LABEL_14:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_NEGOTIATION_FAILED");
          goto LABEL_32;
        case 0xBu:
        case 0xEu:
LABEL_7:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_AUTHENTICATION_FAILED");
          goto LABEL_32;
        case 0xCu:
        case 0x18u:
LABEL_8:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_CERTIFICATE_INVALID");
          goto LABEL_32;
        case 0xDu:
LABEL_15:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_INVALID");
          goto LABEL_32;
        case 0xFu:
LABEL_16:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_NETWORK_CHANGE");
          goto LABEL_32;
        case 0x10u:
LABEL_17:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_DISCONNECTED");
          goto LABEL_32;
        case 0x11u:
LABEL_18:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_DEAD");
          goto LABEL_32;
        case 0x13u:
          break;
        case 0x14u:
LABEL_19:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_NOT_YET_VALID");
          goto LABEL_32;
        case 0x15u:
LABEL_20:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_EXPIRED");
          goto LABEL_32;
        case 0x16u:
LABEL_21:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_CERTIFICATE_NOT_YET_VALID");
          goto LABEL_32;
        case 0x17u:
LABEL_22:
          v8 = CFSTR("VPN_DISCONNECT_ERROR_SERVER_CERTIFICATE_EXPIRED");
LABEL_32:
          NEResourcesCopyLocalizedNSString(v8, v8);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6)
            goto LABEL_34;
          v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v12 = *MEMORY[0x1E0CB2D50];
          v13[0] = v6;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", v5, a4, v10);

          break;
        default:
LABEL_29:
          v7 = 0;
          break;
      }
    }
    else
    {
LABEL_34:
      v7 = 0;
    }
  }

  return v7;
}

+ (id)createConnectionForEnabledEnterpriseConfiguration
{
  return +[NEVPNConnection createConnectionForEnabledEnterpriseConfigurationWithName:](NEVPNConnection, "createConnectionForEnabledEnterpriseConfigurationWithName:", 0);
}

+ (id)createConnectionForEnabledEnterpriseConfigurationWithName:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__NEVPNConnection_createConnectionForEnabledEnterpriseConfigurationWithName___block_invoke;
  block[3] = &unk_1E3CC41F0;
  v11 = v3;
  v4 = createConnectionForEnabledEnterpriseConfigurationWithName__onceToken;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&createConnectionForEnabledEnterpriseConfigurationWithName__onceToken, block);
    v7 = v11;
  }
  v8 = (id)createConnectionForEnabledEnterpriseConfigurationWithName__g_headless;

  return v8;
}

uint64_t __77__NEVPNConnection_createConnectionForEnabledEnterpriseConfigurationWithName___block_invoke(uint64_t a1)
{
  NEVPNConnection *v2;
  void *v3;
  id v4;
  NEConfigurationManager *v5;
  NEConfigurationManager *configManager;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v2 = [NEVPNConnection alloc];
  v3 = *(void **)(a1 + 32);
  v4 = v3;
  if (v2)
  {
    v2 = (NEVPNConnection *)-[NEVPNConnection initWithType:](v2, 1);
    if (v2)
    {
      v5 = -[NEConfigurationManager initForAllUsers]([NEConfigurationManager alloc], "initForAllUsers");
      configManager = v2->_configManager;
      v2->_configManager = v5;

      objc_storeStrong((id *)&v2->_configurationName, v3);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create("NEVPNConnection queue", v7);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v8;

    }
  }

  v10 = (void *)createConnectionForEnabledEnterpriseConfigurationWithName__g_headless;
  createConnectionForEnabledEnterpriseConfigurationWithName__g_headless = (uint64_t)v2;

  if (createConnectionForEnabledEnterpriseConfigurationWithName__g_headless)
  {
    v11 = *(void **)(createConnectionForEnabledEnterpriseConfigurationWithName__g_headless + 32);
    v12 = *(_QWORD *)(createConnectionForEnabledEnterpriseConfigurationWithName__g_headless + 48);
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  v13 = v11;
  objc_msgSend(v13, "setChangedQueue:andHandler:", v12, &__block_literal_global_23351);

  return -[NEVPNConnection reload](createConnectionForEnabledEnterpriseConfigurationWithName__g_headless);
}

- (uint64_t)reload
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  if (result)
  {
    v1 = (_QWORD *)result;
    *(_QWORD *)(result + 16) = 0;
    if (*(_QWORD *)(result + 56))
    {
      ne_session_cancel();
      v1[7] = 0;
    }
    v2 = (void *)v1[4];
    v3 = v1[6];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __25__NEVPNConnection_reload__block_invoke;
    v4[3] = &unk_1E3CC4188;
    v4[4] = v1;
    return objc_msgSend(v2, "loadConfigurationsWithCompletionQueue:handler:", v3, v4);
  }
  return result;
}

void __25__NEVPNConnection_reload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "reloadWithCompletionHandler: failed to load configurations: %@", buf, 0xCu);
    }

    -[NEVPNConnection resetLastDisconnectError:](*(void **)(a1 + 32), v6);
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      *(_BYTE *)(v8 + 10) = 1;
  }
  else
  {
    if (v5
      && (v9 = MEMORY[0x1E0C809B0],
          v18[0] = MEMORY[0x1E0C809B0],
          v18[1] = 3221225472,
          v18[2] = __25__NEVPNConnection_reload__block_invoke_88,
          v18[3] = &unk_1E3CC4160,
          v18[4] = *(_QWORD *)(a1 + 32),
          v10 = objc_msgSend(v5, "indexOfObjectPassingTest:", v18),
          v10 != 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      if (v14)
        objc_storeStrong((id *)(v14 + 40), v13);

      v15 = *(void **)(a1 + 32);
      objc_msgSend(v11, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __25__NEVPNConnection_reload__block_invoke_2;
      v17[3] = &unk_1E3CC45C8;
      v17[4] = *(_QWORD *)(a1 + 32);
      -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v15, v16, 1, v17);

    }
    else
    {
      v11 = +[NEVPNConnection createDisconnectErrorWithDomain:code:](NEVPNConnection, "createDisconnectErrorWithDomain:code:", CFSTR("NEVPNConnectionErrorDomainPlugin"), 38);
      -[NEVPNConnection resetLastDisconnectError:](*(void **)(a1 + 32), v11);
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        *(_BYTE *)(v12 + 10) = 1;
    }

  }
}

uint64_t __25__NEVPNConnection_reload__block_invoke_88(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  int v14;
  uint64_t v15;

  v6 = a2;
  if (objc_msgSend(v6, "grade") == 1)
  {
    objc_msgSend(v6, "VPN");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEnabled") & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (!v8 || (v9 = *(id *)(v8 + 40)) == 0)
      {

LABEL_13:
        v15 = 1;
        *a4 = 1;
        goto LABEL_11;
      }
      v10 = v9;
      v11 = *(_QWORD **)(a1 + 32);
      if (v11)
        v11 = (_QWORD *)v11[5];
      v12 = v11;
      objc_msgSend(v6, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v14)
        goto LABEL_13;
    }
    else
    {

    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

void __25__NEVPNConnection_reload__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    *(_BYTE *)(v5 + 10) = 1;
  if (v3)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Failed to create a connection for the current enterprise configuration: %@", (uint8_t *)&v7, 0xCu);
    }

    -[NEVPNConnection resetLastDisconnectError:](*(void **)(a1 + 32), v4);
  }

}

- (void)createSessionWithConfigurationIdentifier:(uint64_t)a3 forceInfoFetch:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, int);
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = a1;
    objc_sync_enter(v9);
    v37[0] = 0;
    v37[1] = 0;
    if (v7)
    {
      if (v9[7])
      {
        ne_session_cancel();
        v9[7] = 0;
      }
      objc_msgSend(v7, "getUUIDBytes:", v37);
      v10 = ne_session_create();
      if (v10)
      {
        v11 = MEMORY[0x1E0C80D38];
        v12 = MEMORY[0x1E0C809B0];
        v21 = MEMORY[0x1E0C809B0];
        v22 = 3221225472;
        v23 = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_2;
        v24 = &unk_1E3CC4110;
        v25 = v9;
        v26 = v10;
        ne_session_set_event_handler();

        v9[7] = v10;
        v19[0] = v12;
        v19[1] = 3221225472;
        v19[2] = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_3;
        v19[3] = &unk_1E3CC4138;
        v20 = v8;
        -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)v9, a3, 1, v19);

      }
      else
      {
        ne_log_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]";
          v35 = 2112;
          v36 = v7;
          _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "%s: Cannot create ne_session for configID: %@", buf, 0x16u);
        }

        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 1, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_28;
          v27[3] = &unk_1E3CC46A8;
          v28 = v17;
          v29 = v8;
          v18 = v17;
          dispatch_async(MEMORY[0x1E0C80D38], v27);

        }
      }
    }
    else
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]";
        _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "%s: Cannot create ne_session for nil configID", buf, 0xCu);
      }

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 1, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke;
        block[3] = &unk_1E3CC46A8;
        v31 = v14;
        v32 = v8;
        v15 = v14;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }
    objc_sync_exit(v9);

  }
}

uint64_t __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  id obj;

  if (a2 == 2)
  {
    ne_session_release();
  }
  else if (a2 == 1)
  {
    obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(_QWORD *)(v3 + 56);
    else
      v4 = 0;
    if (v4 == *(_QWORD *)(a1 + 40))
      -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:](v3, 0, 1, 0);
    objc_sync_exit(obj);

  }
}

uint64_t __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__NEVPNConnection_createConnectionForEnabledEnterpriseConfigurationWithName___block_invoke_2()
{
  return -[NEVPNConnection reload](createConnectionForEnabledEnterpriseConfigurationWithName__g_headless);
}

- (id)initWithType:(void *)a1
{
  id *v3;
  id *v4;
  id v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)NEVPNConnection;
  v3 = (id *)objc_msgSendSuper2(&v7, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = 0;
    v3[7] = 0;
    *((_DWORD *)v3 + 3) = a2;
    objc_storeWeak(v3 + 8, 0);
    v5 = v4[9];
    v4[9] = 0;

  }
  return v4;
}

- (void)destroySession
{
  _QWORD *v1;
  void *v2;
  void *v3;
  _QWORD *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    v1 = obj;
    if (obj[7])
    {
      ne_session_cancel();
      v1 = obj;
      obj[7] = 0;
    }
    v2 = v1;
    if (v1[2])
    {
      v1[2] = 0;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.networkextension.statuschanged"), obj);

      v2 = obj;
    }
    objc_sync_exit(v2);

  }
}

@end
