@implementation ICFCallServer

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1)
    dispatch_once(&sharedInstance_creation, &__block_literal_global_0);
  return (id)sharedInstance_sInstance;
}

ICFCallServer *__31__ICFCallServer_sharedInstance__block_invoke()
{
  ICFCallServer *result;

  result = objc_alloc_init(ICFCallServer);
  sharedInstance_sInstance = (uint64_t)result;
  return result;
}

- (ICFCallServer)init
{
  ICFCallServer *v2;
  ICFCallServer *v3;
  _xpc_connection_s *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[16];
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, _xpc_connection_s *, void *);
  void *v12;
  ICFCallServer *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  ICFCallServer *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICFCallServer;
  v2 = -[ICFCallServer init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v13 = v2;
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __21__ICFCallServer_init__block_invoke;
    v17 = &unk_24C0A8D28;
    v18 = v2;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __21__ICFCallServer_init__block_invoke_15;
    v12 = &unk_24C0A8D50;
    v4 = (_xpc_connection_s *)IMXPCCreateServerConnection();
    v3->_connection = v4;
    if (v4)
    {
      xpc_connection_resume(v4);
      notify_post("com.apple.incoming-call-filter-server-started");
    }
    else
    {
      v5 = ICFDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ICFCallServer init].cold.1(v5);
    }
    v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2084A6000, v6, OS_LOG_TYPE_DEFAULT, "Setup ICFCallServer", v8, 2u);
    }
  }
  return v3;
}

uint64_t __21__ICFCallServer_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = ICFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __21__ICFCallServer_init__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

void __21__ICFCallServer_init__block_invoke_15(uint64_t a1, _xpc_connection_s *a2, void *a3)
{
  pid_t pid;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  _BYTE v14[14];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  xpc_connection_get_audit_token();
  if (IMDAuditTokenTaskHasEntitlement())
    goto LABEL_5;
  pid = xpc_connection_get_pid(a2);
  v7 = IMProcessNameForPid();
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", a2, 0, 0, 0, 0);
  v9 = ICFDefaultLog();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412802;
      v12 = (const __CFString *)v7;
      v13 = 1024;
      *(_DWORD *)v14 = pid;
      *(_WORD *)&v14[4] = 2112;
      *(_QWORD *)&v14[6] = CFSTR("com.apple.private.icfcallserver");
      _os_log_impl(&dword_2084A6000, v9, OS_LOG_TYPE_DEFAULT, "Handling xpc event for previously configured peer(%@:%d) that does not have entitlement (%@).", buf, 0x1Cu);
    }
LABEL_5:
    __ICFXPCServer_peer_event_handler(a2, a3);
    return;
  }
  if (v10)
  {
    *(_DWORD *)buf = 138412802;
    v12 = CFSTR("com.apple.private.icfcallserver");
    v13 = 2112;
    *(_QWORD *)v14 = v7;
    *(_WORD *)&v14[8] = 1024;
    *(_DWORD *)&v14[10] = pid;
    _os_log_impl(&dword_2084A6000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Denying xpc connection, task does not have entitlement: %@  (%@:%d)", buf, 0x1Cu);
  }
  xpc_connection_cancel(a2);
}

- (void)_requestCallGrantForIdentifier:(id)a3 forProviderIdentifier:(id)a4 waitForResponse:(BOOL)a5 completionBlock:(id)a6
{
  NSObject *v7;
  const __CFString *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  const void *v10;
  const void *v11;
  const void *v12;
  _BOOL4 v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  id v17;
  unint64_t i;
  NSMutableArray *clients;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  _xpc_connection_s *v23;
  xpc_object_t v24;
  NSObject *v25;
  xpc_object_t v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  const __CFString *v30;
  id v31;
  uint64_t v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  _BOOL4 v34;
  _QWORD v38[8];
  _QWORD handler[2];
  uint64_t (*v40)(uint64_t, void *);
  void *v41;
  ICFCallServer *v42;
  NSObject *v43;
  id v44;
  _BYTE *v45;
  uint64_t *v46;
  uint64_t *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _QWORD block[5];
  uint8_t v61[4];
  void *v62;
  uint8_t v63[128];
  _BYTE buf[24];
  const __CFString *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v34 = a5;
  v68 = *MEMORY[0x24BDAC8D0];
  v7 = ICFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = a3;
    if (v34)
      v8 = CFSTR("YES");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2112;
    v65 = v8;
    v66 = 2112;
    v67 = a6;
    _os_log_impl(&dword_2084A6000, v7, OS_LOG_TYPE_DEFAULT, "Requesting call grant for identifier %@ providerIdentifier %@ waitForResponse %@ completionBlock %@", buf, 0x2Au);
  }
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(a6, "copy");
  v10 = (const void *)CMFItemCreateWithEmailAddress();
  v11 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
  v12 = (const void *)CMFItemCreateWithPhoneNumber();
  if (!CMFBlockListIsItemBlocked())
  {
    v13 = CMFBlockListIsItemBlocked() != 0;
    if (!v10)
      goto LABEL_10;
    goto LABEL_9;
  }
  v13 = 1;
  if (v10)
LABEL_9:
    CFRelease(v10);
LABEL_10:
  if (v12)
    CFRelease(v12);
  if (v11)
    CFRelease(v11);
  v14 = ICFDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("NO");
    if (v13)
      v15 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl(&dword_2084A6000, v14, OS_LOG_TYPE_DEFAULT, "%@ returning %@", buf, 0x16u);
  }
  if (v13)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke;
    block[3] = &unk_24C0A8D78;
    block[4] = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else if (-[NSMutableArray count](self->_clients, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v65) = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v16 = dispatch_group_create();
    v17 = objc_alloc_init(MEMORY[0x24BDD1648]);
    objc_msgSend(v17, "lock");
    for (i = 0; -[NSMutableArray count](self->_clients, "count") > i; ++i)
    {
      dispatch_group_enter(v16);
      ++*((_DWORD *)v53 + 6);
    }
    objc_msgSend(v17, "unlock");
    v33 = v9;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    clients = self->_clients;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v49 != v21)
            objc_enumerationMutation(clients);
          v23 = *(_xpc_connection_s **)(*((_QWORD *)&v48 + 1) + 8 * j);
          v24 = xpc_dictionary_create(0, 0, 0);
          if (v24)
          {
            IMInsertNSStringsToXPCDictionary();
            v31 = a4;
            v32 = 0;
            IMInsertNSStringsToXPCDictionary();
            handler[0] = MEMORY[0x24BDAC760];
            handler[1] = 3221225472;
            v40 = __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_27;
            v41 = &unk_24C0A8DA0;
            v42 = self;
            v43 = v16;
            v44 = v17;
            v45 = buf;
            v46 = &v56;
            v47 = &v52;
            v25 = ICFDefaultLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v61 = 134217984;
              v62 = v23;
              _os_log_impl(&dword_2084A6000, v25, OS_LOG_TYPE_DEFAULT, "Asking peer %p if we should allow the call", v61, 0xCu);
            }
            if (v34)
            {
              v26 = xpc_connection_send_message_with_reply_sync(v23, v24);
              if (v26)
              {
                v40((uint64_t)handler, v26);
                xpc_release(v26);
              }
            }
            else
            {
              xpc_connection_send_message_with_reply(v23, v24, MEMORY[0x24BDAC9B8], handler);
            }
            xpc_release(v24);
          }
          else
          {
            dispatch_group_leave(v16);
            objc_msgSend(v17, "lock");
            --*((_DWORD *)v53 + 6);
            objc_msgSend(v17, "unlock");
          }
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
      }
      while (v20);
    }
    objc_msgSend(v17, "lock", v31, v32);
    v27 = *((_DWORD *)v53 + 6);
    objc_msgSend(v17, "unlock");
    if (v27 < 1)
    {
      v29 = ICFDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          v30 = CFSTR("NO");
        else
          v30 = CFSTR("YES");
        *(_DWORD *)v61 = 138412290;
        v62 = (void *)v30;
        _os_log_impl(&dword_2084A6000, v29, OS_LOG_TYPE_DEFAULT, "Sync - All done with group, overall result was: %@", v61, 0xCu);
      }
      ((void (**)(_QWORD, BOOL, _QWORD))v33)[2](v33, *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0, *((unsigned __int8 *)v57 + 24));
      dispatch_release(v16);
    }
    else
    {
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_29;
      v38[3] = &unk_24C0A8DC8;
      v38[6] = buf;
      v38[7] = &v56;
      v38[4] = v16;
      v38[5] = v33;
      dispatch_group_notify(v16, MEMORY[0x24BDAC9B8], v38);
    }

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v28 = ICFDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a4;
      _os_log_impl(&dword_2084A6000, v28, OS_LOG_TYPE_DEFAULT, "No client, but we're asking for %@ on %@", buf, 0x16u);
    }
    v9[2](v9, 1, 0);

  }
}

uint64_t __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_27(uint64_t a1, void *a2)
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x20BD0A09C](a2) == MEMORY[0x24BDACFB8])
  {
    v10 = ICFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_27_cold_1((uint64_t)a2, a1, v10);
    v9 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    v4 = xpc_dictionary_get_BOOL(a2, "response");
    v5 = xpc_dictionary_get_BOOL(a2, "isBlocked");
    v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      if (v5)
        v7 = CFSTR("YES");
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_2084A6000, v6, OS_LOG_TYPE_DEFAULT, "Got allowCall: %@, blocked: %@", (uint8_t *)&v12, 0x16u);
    }
    v9 = !v4;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= v9;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "lock");
  --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 48), "unlock");
}

void __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_29(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = ICFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v3 = CFSTR("NO");
    else
      v3 = CFSTR("YES");
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_2084A6000, v2, OS_LOG_TYPE_DEFAULT, "Async - All done with group, overall result was: %@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (void)_clientConnected
{
  OUTLINED_FUNCTION_2_0(&dword_2084A6000, a1, a3, "Failed registering silent hours callback", a5, a6, a7, a8, 0);
}

void *__33__ICFCallServer__clientConnected__block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x20BD09E80]("_CTServerConnectionRegisterSilentHoursCallback", CFSTR("CoreTelephony"));
  _clientConnected___CTServerConnectionRegisterSilentHoursCallback = result;
  return result;
}

uint64_t __33__ICFCallServer__clientConnected__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__ICFCallServer__clientConnected__block_invoke_3;
  v7[3] = &unk_24C0A8E10;
  v7[4] = &v8;
  objc_msgSend(v2, "_requestCallGrantForIdentifier:forProviderIdentifier:waitForResponse:completionBlock:", a2, "com.apple.coretelephony", 1, v7);
  v3 = ICFDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v9 + 24))
      v4 = CFSTR("allowed");
    else
      v4 = CFSTR("not allowed");
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_2084A6000, v3, OS_LOG_TYPE_DEFAULT, "Telling CT that this call is %@", buf, 0xCu);
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __33__ICFCallServer__clientConnected__block_invoke_3(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_cleanup
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[16];

  if (self->_hasRegistered)
  {
    self->_hasRegistered = 0;
    v2 = ICFDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2084A6000, v2, OS_LOG_TYPE_DEFAULT, "Client Disconnected, unregistering", v5, 2u);
    }
    v3 = ICFCallServerCTServerConnection();
    if (v3)
    {
      v4 = v3;
      if (_cleanup__pred__CTServerConnectionUnregisterSilentHoursCallbackCoreTelephony != -1)
        dispatch_once(&_cleanup__pred__CTServerConnectionUnregisterSilentHoursCallbackCoreTelephony, &__block_literal_global_38);
      _cleanup___CTServerConnectionUnregisterSilentHoursCallback(v4);
    }
  }
}

void *__25__ICFCallServer__cleanup__block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x20BD09E80]("_CTServerConnectionUnregisterSilentHoursCallback", CFSTR("CoreTelephony"));
  _cleanup___CTServerConnectionUnregisterSilentHoursCallback = result;
  return result;
}

- (void)_cleanupClient:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  pid_t v7;
  int v8;
  pid_t pid;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = ICFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 67109120;
      pid = xpc_connection_get_pid((xpc_connection_t)a3);
      _os_log_impl(&dword_2084A6000, v5, OS_LOG_TYPE_DEFAULT, "Removing client %d", (uint8_t *)&v8, 8u);
    }
    -[NSMutableArray removeObject:](self->_clients, "removeObject:", a3);
    v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[NSMutableArray count](self->_clients, "count");
      v8 = 67109120;
      pid = v7;
      _os_log_impl(&dword_2084A6000, v6, OS_LOG_TYPE_DEFAULT, "We have %d clients left", (uint8_t *)&v8, 8u);
    }
    if (!-[NSMutableArray count](self->_clients, "count"))
    {
      -[ICFCallServer _cleanup](self, "_cleanup");

      self->_clients = 0;
    }
  }
}

- (void)_configureWithClient:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  pid_t pid;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = ICFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = a3;
    _os_log_impl(&dword_2084A6000, v5, OS_LOG_TYPE_DEFAULT, "Configuring with client: %@", (uint8_t *)&v8, 0xCu);
  }
  if (a3 && (-[NSMutableArray containsObject:](self->_clients, "containsObject:", a3) & 1) == 0)
  {
    if (!self->_clients)
      self->_clients = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      pid = xpc_connection_get_pid((xpc_connection_t)a3);
      v8 = 67109120;
      LODWORD(v9) = pid;
      _os_log_impl(&dword_2084A6000, v6, OS_LOG_TYPE_DEFAULT, "Adding client %d", (uint8_t *)&v8, 8u);
    }
    -[NSMutableArray addObject:](self->_clients, "addObject:", a3);
    -[ICFCallServer _clientConnected](self, "_clientConnected");
  }
}

- (void)shouldAllowIncomingCallForNumber:(id)a3 forProviderIdentifier:(id)a4 response:(id)a5
{
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = ICFDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = a3;
    v14 = 2112;
    v15 = a4;
    _os_log_impl(&dword_2084A6000, v9, OS_LOG_TYPE_DEFAULT, "Should allow incoming call for number %@ providerIdentifier %@", buf, 0x16u);
  }
  if (a5)
  {
    v10 = (void *)objc_msgSend(a5, "copy");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __81__ICFCallServer_shouldAllowIncomingCallForNumber_forProviderIdentifier_response___block_invoke;
    v11[3] = &unk_24C0A8E80;
    v11[4] = v10;
    -[ICFCallServer _requestCallGrantForIdentifier:forProviderIdentifier:waitForResponse:completionBlock:](self, "_requestCallGrantForIdentifier:forProviderIdentifier:waitForResponse:completionBlock:", a3, a4, 0, v11);

  }
}

uint64_t __81__ICFCallServer_shouldAllowIncomingCallForNumber_forProviderIdentifier_response___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = ICFDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2084A6000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing server", buf, 2u);
  }
  -[ICFCallServer _cleanup](self, "_cleanup");
  v4.receiver = self;
  v4.super_class = (Class)ICFCallServer;
  -[ICFCallServer dealloc](&v4, sel_dealloc);
}

- (void)init
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = CFSTR("com.apple.incoming-call-filter-server");
  _os_log_error_impl(&dword_2084A6000, log, OS_LOG_TYPE_ERROR, "Could not configure server: %@", (uint8_t *)&v1, 0xCu);
}

void __21__ICFCallServer_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_2084A6000, a1, a3, "port invalidated", a5, a6, a7, a8, 0);
}

void __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_27_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  _os_log_error_impl(&dword_2084A6000, log, OS_LOG_TYPE_ERROR, "Error requesting client: %@  (0x%X)", (uint8_t *)&v4, 0x12u);
}

@end
