@implementation ICFConnectToServer

void ___ICFConnectToServer_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2084A6000, v0, OS_LOG_TYPE_DEFAULT, "[WARN] Connection went invalid, exiting", v1, 2u);
  }
  xpc_release((xpc_object_t)sServerConnection);
  sServerConnection = 0;
}

void ___ICFConnectToServer_block_invoke_6(uint64_t a1, _xpc_connection_s *a2, void *a3)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  pid_t pid;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (**v19)(_QWORD, uint64_t, uint64_t);
  uint64_t v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  NSObject *v24;
  xpc_object_t reply;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  _xpc_connection_s *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const __CFString *v43;
  uint8_t buf[4];
  _BYTE v45[18];
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x20BD0A09C](a3);
  v6 = MEMORY[0x24BDACFB8];
  if (v5 == MEMORY[0x24BDACFB8])
  {
    if (v3 == (void *)MEMORY[0x24BDACF38])
    {
      v29 = ICFDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        ___ICFConnectToServer_block_invoke_6_cold_1(a2);
      xpc_connection_cancel(a2);
      v30 = ICFDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2084A6000, v30, OS_LOG_TYPE_DEFAULT, "Cleaning up connection", buf, 2u);
      }
      xpc_release((xpc_object_t)sServerConnection);
      sServerConnection = 0;
    }
    else if (v3 == (void *)MEMORY[0x24BDACF30])
    {
      v31 = ICFDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        ___ICFConnectToServer_block_invoke_6_cold_2(a2);
    }
    else if (v3 == (void *)MEMORY[0x24BDACF48])
    {
      v24 = ICFDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        ___ICFConnectToServer_block_invoke_6_cold_3(a2);
    }
  }
  v7 = (void *)MEMORY[0x20BD0A054](v3);
  v8 = ICFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    pid = xpc_connection_get_pid(a2);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v45 = pid;
    *(_WORD *)&v45[4] = 2080;
    *(_QWORD *)&v45[6] = v7;
    _os_log_impl(&dword_2084A6000, v8, OS_LOG_TYPE_DEFAULT, "received message from peer(%d): %s", buf, 0x12u);
  }
  free(v7);
  if (v5 != v6)
  {
    v10 = IMGetXPCStringFromDictionary();
    v11 = IMGetXPCStringFromDictionary();
    v12 = ICFDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v45 = v10;
      *(_WORD *)&v45[8] = 2112;
      *(_QWORD *)&v45[10] = v11;
      _os_log_impl(&dword_2084A6000, v12, OS_LOG_TYPE_DEFAULT, "Incoming call filtering query for number %@ and provider identifier %@", buf, 0x16u);
    }
    v13 = 0x253DA6000uLL;
    objc_msgSend((id)sFilterLock, "lock");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = (void *)objc_msgSend((id)sFilterBlocks, "allValues");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
    if (v15)
    {
      v16 = v15;
      v32 = v3;
      v33 = a2;
      v17 = *(_QWORD *)v35;
LABEL_9:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        v19 = *(uint64_t (***)(_QWORD, uint64_t, uint64_t))(*((_QWORD *)&v34 + 1) + 8 * v18);
        v20 = v19[2](v19, v10, v11);
        v21 = ICFDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = CFSTR("deny");
          if (!v20)
            v22 = CFSTR("allow");
          *(_DWORD *)v38 = 138412802;
          v39 = v19;
          v23 = CFSTR("not blocked");
          if (v20 == 2)
            v23 = CFSTR("blocked");
          v40 = 2112;
          v41 = (void *)v22;
          v42 = 2112;
          v43 = v23;
          _os_log_impl(&dword_2084A6000, v21, OS_LOG_TYPE_DEFAULT, "We asked the filter %@ and it's telling us to %@ the call, and that the call was %@", v38, 0x20u);
        }
        if (v20)
          break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
          if (v16)
            goto LABEL_9;
          break;
        }
      }
      v3 = v32;
      a2 = v33;
      v13 = 0x253DA6000;
    }
    objc_msgSend(*(id *)(v13 + 2216), "unlock");
    reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      v26 = reply;
      IMInsertBoolsToXPCDictionary();
      IMInsertBoolsToXPCDictionary();
      v27 = (void *)MEMORY[0x20BD0A054](v26);
      v28 = ICFDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v38 = 136315394;
        v39 = v27;
        v40 = 2048;
        v41 = a2;
        _os_log_impl(&dword_2084A6000, v28, OS_LOG_TYPE_DEFAULT, "Forwarding reply %s to connection %p", v38, 0x16u);
      }
      free(v27);
      xpc_connection_send_message(a2, v26);
      xpc_release(v26);
    }
  }
}

uint64_t ___ICFConnectToServer_block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___ICFConnectToServer_block_invoke_6_cold_1(_xpc_connection_s *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_0(&dword_2084A6000, v1, v2, "peer(%d) received XPC_ERROR_CONNECTION_INVALID", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

void ___ICFConnectToServer_block_invoke_6_cold_2(_xpc_connection_s *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_0(&dword_2084A6000, v1, v2, "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

void ___ICFConnectToServer_block_invoke_6_cold_3(_xpc_connection_s *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_0(&dword_2084A6000, v1, v2, "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

@end
