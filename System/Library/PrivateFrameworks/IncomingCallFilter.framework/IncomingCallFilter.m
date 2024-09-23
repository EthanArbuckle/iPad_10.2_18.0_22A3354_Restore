void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t ICFRegisterCallFilterBlockWithIdentifier(void *a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = ICFDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = a1;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_2084A6000, v4, OS_LOG_TYPE_DEFAULT, "Registering filter block %@ with identifier %@", buf, 0x16u);
  }
  if (a1)
  {
    v5 = objc_msgSend(a1, "copy");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __ICFRegisterCallFilterBlockWithIdentifier_block_invoke;
    v8[3] = &unk_24C0A8BF0;
    v8[4] = v5;
    v6 = v8;
  }
  else
  {
    v6 = 0;
  }
  return ICFRegisterCallFilterResultBlockWithIdentifier(v6, a2);
}

uint64_t ICFRegisterCallFilterResultBlockWithIdentifier(void *a1, void *a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = ICFDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = a1;
    v10 = 2112;
    v11 = a2;
    _os_log_impl(&dword_2084A6000, v4, OS_LOG_TYPE_DEFAULT, "Registering filter result block %@ with identifier %@", (uint8_t *)&v8, 0x16u);
  }
  _ICFConfigureGlobals();
  objc_msgSend((id)sFilterLock, "lock");
  if (a1 && objc_msgSend(a2, "length"))
  {
    if (!sFilterBlocks)
      sFilterBlocks = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v5 = (void *)objc_msgSend(a1, "copy");
    objc_msgSend((id)sFilterBlocks, "setObject:forKey:", v5, a2);
    ICFPrintFilters();

    _ICFConnectToServer();
  }
  else
  {
    v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_2084A6000, v6, OS_LOG_TYPE_DEFAULT, "No block or block id - we're done", (uint8_t *)&v8, 2u);
    }
  }
  return objc_msgSend((id)sFilterLock, "unlock");
}

void _ICFConfigureGlobals()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2084A6000, v0, OS_LOG_TYPE_DEFAULT, "Configuring globals", v1, 2u);
  }
  if (_ICFConfigureGlobals_onceToken != -1)
    dispatch_once(&_ICFConfigureGlobals_onceToken, &__block_literal_global);
}

void ICFPrintFilters()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2084A6000, v0, OS_LOG_TYPE_DEFAULT, "*** Current filters ***", buf, 2u);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = (void *)objc_msgSend((id)sFilterBlocks, "allKeys");
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        v7 = ICFDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = objc_msgSend((id)sFilterBlocks, "objectForKey:", v6);
          *(_DWORD *)buf = 138412546;
          v15 = v6;
          v16 = 2048;
          v17 = v8;
          _os_log_impl(&dword_2084A6000, v7, OS_LOG_TYPE_DEFAULT, "* %@ -> %p", buf, 0x16u);
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
    }
    while (v3);
  }
  v9 = ICFDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2084A6000, v9, OS_LOG_TYPE_DEFAULT, "***********************", buf, 2u);
  }
}

void _ICFConnectToServer()
{
  NSObject *v0;
  _xpc_connection_s *v1;
  xpc_object_t v2;
  void *v3;
  NSObject *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2084A6000, v0, OS_LOG_TYPE_DEFAULT, "Connect to server", buf, 2u);
  }
  if (sServerConnection)
  {
    v1 = (_xpc_connection_s *)xpc_retain((xpc_object_t)sServerConnection);
  }
  else
  {
    v5 = (_xpc_connection_s *)IMXPCCreateConnectionForServiceWithQueue();
    sServerConnection = (uint64_t)v5;
    if (v5)
    {
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = ___ICFConnectToServer_block_invoke_10;
      handler[3] = &unk_24C0A8CB8;
      handler[4] = &__block_literal_global_8;
      xpc_connection_set_event_handler(v5, handler);
      v1 = (_xpc_connection_s *)xpc_retain((xpc_object_t)sServerConnection);
      xpc_connection_resume((xpc_connection_t)sServerConnection);
      v6 = ICFDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v10 = sServerConnection;
        _os_log_impl(&dword_2084A6000, v6, OS_LOG_TYPE_DEFAULT, "Creating server connection %p", buf, 0xCu);
      }
    }
    else
    {
      v7 = ICFDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        _ICFConnectToServer_cold_1(v7);
      v1 = 0;
    }
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2 && v1)
  {
    IMInsertBoolsToXPCDictionary();
    v4 = ICFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2084A6000, v4, OS_LOG_TYPE_DEFAULT, "Sending setup-request to server", buf, 2u);
    }
    xpc_connection_send_message(v1, v3);
    xpc_release(v3);
LABEL_13:
    xpc_release(v1);
    return;
  }
  if (v2)
    xpc_release(v2);
  if (v1)
    goto LABEL_13;
}

uint64_t ICFUnregisterCallFilterResultBlockWithIdentifier(void *a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = ICFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v8 = 138412290;
    *(_QWORD *)&v8[4] = a1;
    _os_log_impl(&dword_2084A6000, v2, OS_LOG_TYPE_DEFAULT, "Unregistering filter block with identifier %@", v8, 0xCu);
  }
  _ICFConfigureGlobals();
  objc_msgSend((id)sFilterLock, "lock");
  if (!objc_msgSend(a1, "length"))
  {
    v5 = ICFDefaultLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      return objc_msgSend((id)sFilterLock, "unlock", *(_QWORD *)v8);
    *(_WORD *)v8 = 0;
    v6 = "No block id - we're done";
LABEL_19:
    _os_log_impl(&dword_2084A6000, v5, OS_LOG_TYPE_DEFAULT, v6, v8, 2u);
    return objc_msgSend((id)sFilterLock, "unlock", *(_QWORD *)v8);
  }
  if (!sFilterBlocks)
  {
    v5 = ICFDefaultLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      return objc_msgSend((id)sFilterLock, "unlock", *(_QWORD *)v8);
    *(_WORD *)v8 = 0;
    v6 = "No filter blocks registered - we're done";
    goto LABEL_19;
  }
  if (!objc_msgSend((id)sFilterBlocks, "objectForKey:", a1))
  {
    v5 = ICFDefaultLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      return objc_msgSend((id)sFilterLock, "unlock", *(_QWORD *)v8);
    *(_WORD *)v8 = 0;
    v6 = "We're not keeping track of this filter - we're done";
    goto LABEL_19;
  }
  objc_msgSend((id)sFilterBlocks, "removeObjectForKey:", a1);
  ICFPrintFilters();
  if (!objc_msgSend((id)sFilterBlocks, "count"))
  {

    sFilterBlocks = 0;
    v3 = ICFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2084A6000, v3, OS_LOG_TYPE_DEFAULT, "No more filter blocks registered", v8, 2u);
    }
    if (sServerConnection)
    {
      v4 = ICFDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_2084A6000, v4, OS_LOG_TYPE_DEFAULT, "Disconnecting from server", v8, 2u);
      }
      xpc_connection_cancel((xpc_connection_t)sServerConnection);
    }
  }
  return objc_msgSend((id)sFilterLock, "unlock", *(_QWORD *)v8);
}

uint64_t OUTLINED_FUNCTION_2(xpc_connection_t connection)
{
  return xpc_connection_get_pid(connection);
}

void __ICFXPCServer_peer_event_handler(_xpc_connection_s *a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  pid_t v8;
  NSObject *v9;
  pid_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  pid_t v14;
  xpc_object_t reply;
  uint64_t v16;
  uint64_t v17;
  ICFCallServer *v18;
  NSObject *v19;
  _QWORD v20[6];
  uint8_t buf[4];
  pid_t pid;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = ICFDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    pid = xpc_connection_get_pid(a1);
    _os_log_impl(&dword_2084A6000, v4, OS_LOG_TYPE_DEFAULT, "Receiving message from peer (%d)", buf, 8u);
  }
  v5 = MEMORY[0x20BD0A09C](a2);
  if (v5 == MEMORY[0x24BDACFB8])
  {
    if (a2 == (void *)MEMORY[0x24BDACF38])
    {
      v12 = ICFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        ___ICFConnectToServer_block_invoke_6_cold_1(a1);
      -[ICFCallServer _cleanupClient:](+[ICFCallServer sharedInstance](ICFCallServer, "sharedInstance"), "_cleanupClient:", a1);
      xpc_connection_cancel(a1);
    }
    else if (a2 == (void *)MEMORY[0x24BDACF30])
    {
      v19 = ICFDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        ___ICFConnectToServer_block_invoke_6_cold_2(a1);
      -[ICFCallServer _cleanupClient:](+[ICFCallServer sharedInstance](ICFCallServer, "sharedInstance"), "_cleanupClient:", a1);
    }
    else if (a2 == (void *)MEMORY[0x24BDACF48])
    {
      v11 = ICFDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        ___ICFConnectToServer_block_invoke_6_cold_3(a1);
    }
  }
  else if (v5 == MEMORY[0x24BDACFA0])
  {
    v6 = (void *)MEMORY[0x20BD0A054](a2);
    v7 = ICFDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = xpc_connection_get_pid(a1);
      *(_DWORD *)buf = 67109378;
      pid = v8;
      v23 = 2080;
      v24 = v6;
      _os_log_impl(&dword_2084A6000, v7, OS_LOG_TYPE_DEFAULT, "Received message from peer(%d): %s", buf, 0x12u);
    }
    free(v6);
    if (xpc_dictionary_get_BOOL(a2, "setup-request"))
    {
      v9 = ICFDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = xpc_connection_get_pid(a1);
        *(_DWORD *)buf = 67109120;
        pid = v10;
        _os_log_impl(&dword_2084A6000, v9, OS_LOG_TYPE_DEFAULT, "Received setup-request from (%d)", buf, 8u);
      }
      -[ICFCallServer _configureWithClient:](+[ICFCallServer sharedInstance](ICFCallServer, "sharedInstance"), "_configureWithClient:", a1);
    }
    else if (xpc_dictionary_get_BOOL(a2, "call-request"))
    {
      v13 = ICFDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = xpc_connection_get_pid(a1);
        *(_DWORD *)buf = 67109120;
        pid = v14;
        _os_log_impl(&dword_2084A6000, v13, OS_LOG_TYPE_DEFAULT, "Received call-request from (%d)", buf, 8u);
      }
      reply = xpc_dictionary_create_reply(a2);
      v16 = IMGetXPCStringFromDictionary();
      v17 = IMGetXPCStringFromDictionary();
      v18 = +[ICFCallServer sharedInstance](ICFCallServer, "sharedInstance");
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = ____ICFXPCServer_peer_event_handler_block_invoke;
      v20[3] = &unk_24C0A8CE0;
      v20[4] = reply;
      v20[5] = a1;
      -[ICFCallServer shouldAllowIncomingCallForNumber:forProviderIdentifier:response:](v18, "shouldAllowIncomingCallForNumber:forProviderIdentifier:response:", v16, v17, v20);
    }
  }
}

uint64_t ICFCallServerCTServerConnection()
{
  uint64_t result;
  uint64_t v1;
  void (*v2)(uint64_t, dispatch_queue_global_t);
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _OWORD v5[2];
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  result = ICFCallServerCTServerConnection_sConnection;
  if (!ICFCallServerCTServerConnection_sConnection)
  {
    if (ICFCallServerCTServerConnection__pred__CTServerConnectionCreateWithIdentifierCoreTelephony != -1)
      dispatch_once(&ICFCallServerCTServerConnection__pred__CTServerConnectionCreateWithIdentifierCoreTelephony, &__block_literal_global_8_0);
    if (ICFCallServerCTServerConnection__pred__CTServerConnectionSetTargetQueueCoreTelephony != -1)
      dispatch_once(&ICFCallServerCTServerConnection__pred__CTServerConnectionSetTargetQueueCoreTelephony, &__block_literal_global_11);
    v6 = 0;
    memset(v5, 0, sizeof(v5));
    v1 = ICFCallServerCTServerConnection___CTServerConnectionCreateWithIdentifier(*MEMORY[0x24BDBD240], CFSTR("ICFCallServer"), _ServerConnectionCallback, v5);
    ICFCallServerCTServerConnection_sConnection = v1;
    v2 = (void (*)(uint64_t, dispatch_queue_global_t))ICFCallServerCTServerConnection___CTServerConnectionSetTargetQueue;
    global_queue = dispatch_get_global_queue(0, 0);
    v2(v1, global_queue);
    v4 = ICFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = ICFCallServerCTServerConnection_sConnection;
      _os_log_impl(&dword_2084A6000, v4, OS_LOG_TYPE_DEFAULT, "Setup CTServerConnection %p", buf, 0xCu);
    }
    return ICFCallServerCTServerConnection_sConnection;
  }
  return result;
}

void sub_2084A935C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  uint64_t v50;

  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v50 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2084A9940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void ICFCallProviderShouldAllowIncomingCall(uint64_t a1, uint64_t a2, void *a3)
{
  ICFCallProviderShouldAllowIncomingCallWithQueue(a1, a2, 0, a3);
}

void ICFCallProviderShouldAllowIncomingCallWithQueue(uint64_t a1, uint64_t a2, NSObject *global_queue, void *a4)
{
  NSObject *v8;
  NSObject *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  NSObject *v11;
  xpc_object_t v12;
  NSObject *v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  _QWORD handler[6];
  uint8_t v17[4];
  xpc_object_t v18;
  _BYTE buf[24];
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = ICFDefaultLog();
  v9 = v8;
  if (a4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a2;
      _os_log_impl(&dword_2084A6000, v9, OS_LOG_TYPE_DEFAULT, "number %@,   providerIdentifier %@", buf, 0x16u);
    }
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(a4, "copy");
    if (ICFCallProviderShouldAllowIncomingCallWithQueue_onceToken != -1)
      dispatch_once(&ICFCallProviderShouldAllowIncomingCallWithQueue_onceToken, &__block_literal_global_1);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    v22 = IMXPCCreateConnectionForServiceWithQueue();
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v11 = ICFDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_2084A6000, v11, OS_LOG_TYPE_DEFAULT, "We have a remote connection let's build a request message", v17, 2u);
      }
      v12 = xpc_dictionary_create(0, 0, 0);
      if (v12)
      {
        IMInsertNSStringsToXPCDictionary();
        IMInsertNSStringsToXPCDictionary();
        xpc_dictionary_set_BOOL(v12, "call-request", 1);
        v13 = ICFDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v17 = 138412290;
          v18 = v12;
          _os_log_impl(&dword_2084A6000, v13, OS_LOG_TYPE_DEFAULT, "Sending request message %@", v17, 0xCu);
        }
        if (!global_queue)
          global_queue = dispatch_get_global_queue(2, 0);
        v14 = *(_xpc_connection_s **)(*(_QWORD *)&buf[8] + 40);
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_8;
        handler[3] = &unk_24C0A8EC8;
        handler[4] = v10;
        handler[5] = buf;
        xpc_connection_send_message_with_reply(v14, v12, global_queue, handler);
        xpc_release(v12);
      }
      else
      {
        xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)&buf[8] + 40));
        xpc_release(*(xpc_object_t *)(*(_QWORD *)&buf[8] + 40));
      }
    }
    else
    {
      v15 = ICFDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_2084A6000, v15, OS_LOG_TYPE_DEFAULT, "[WARN] No Connection !!", v17, 2u);
      }
      if (v10)
        v10[2](v10, 1, 1);
    }

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    ICFCallProviderShouldAllowIncomingCallWithQueue_cold_1(v9);
  }
}

void sub_2084AA1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t ICFDefaultLog()
{
  if (ICFDefaultLog_onceToken != -1)
    dispatch_once(&ICFDefaultLog_onceToken, &__block_literal_global_2);
  return ICFDefaultLog_ICFDefaultLog;
}

void _ICFConnectToServer_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2084A6000, log, OS_LOG_TYPE_ERROR, "Failed to create server connection", v1, 2u);
}

void ICFCallProviderShouldAllowIncomingCallWithQueue_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2084A6000, log, OS_LOG_TYPE_ERROR, "No response provided to ICFCallProviderShouldAllowIncomingCall", v1, 2u);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x24BE18E30]();
}

uint64_t CMFItemCreateWithEmailAddress()
{
  return MEMORY[0x24BE18E38]();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return MEMORY[0x24BE18E40]();
}

uint64_t IMDAuditTokenTaskHasEntitlement()
{
  return MEMORY[0x24BE50678]();
}

uint64_t IMDispatchForNotify()
{
  return MEMORY[0x24BE50680]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x24BE50708]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x24BE50720]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x24BE50750]();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return MEMORY[0x24BE507A0]();
}

uint64_t IMProcessNameForPid()
{
  return MEMORY[0x24BE507A8]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x24BE50848]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x24BE50858]();
}

uint64_t IMXPCCreateServerConnection()
{
  return MEMORY[0x24BE50860]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

