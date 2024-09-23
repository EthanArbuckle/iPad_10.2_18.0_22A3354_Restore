@implementation MOXPCTransportOpen

void __MOXPCTransportOpen_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  char string;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  BOOL v34;
  char v35;
  pthread_mutex_t *v36;
  const void *v37;
  const __CFString *v38;
  _QWORD aBlock[6];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    MOLogWrite(0, 3, (uint64_t)"MOXPCTransportOpen_block_invoke", CFSTR("Got event on connection for %p when connection was NULL!"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
    return;
  }
  v11 = MEMORY[0x1E0BFF4F4](a2);
  if (v11 == MEMORY[0x1E0C812E0])
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v22 = xpc_retain(a2);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(NSObject **)(v23 + 16);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 0x40000000;
      aBlock[2] = __MOXPCTransportOpen_block_invoke_2;
      aBlock[3] = &__block_descriptor_tmp;
      aBlock[4] = v23;
      aBlock[5] = a2;
      MEMORY[0x1E0BFF518](v22);
      v25 = _Block_copy(aBlock);
      dispatch_async_f(v24, v25, (dispatch_function_t)transactionRunner);
      return;
    }
    v38 = CFSTR("Got connection on non-listener connection!?");
    goto LABEL_29;
  }
  if (v11 == MEMORY[0x1E0C81310])
  {
    v26 = *(_QWORD *)(a1 + 32);
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
    v32 = (void *)MEMORY[0x1E0C81260];
    v34 = a2 == (void *)MEMORY[0x1E0C81258] || a2 == (void *)MEMORY[0x1E0C81260];
    if (a2 != (void *)MEMORY[0x1E0C81288] && !v34)
      MOLogWrite(0, 3, (uint64_t)"_HandleConnectionError", CFSTR("unknown server connection error: %s"), v28, v29, v30, v31, string);
    v35 = !v34;
    if (!*(_QWORD *)v26)
      v35 = 1;
    if ((v35 & 1) == 0)
    {
      pthread_mutex_lock(*(pthread_mutex_t **)v26);
      v36 = *(pthread_mutex_t **)v26;
      v37 = *(const void **)(*(_QWORD *)v26 + 112);
      if (v37)
      {
        CFRelease(v37);
        v36 = *(pthread_mutex_t **)v26;
        *(_QWORD *)(*(_QWORD *)v26 + 112) = 0;
      }
      pthread_cond_broadcast((pthread_cond_t *)&v36[1]);
      pthread_mutex_unlock(*(pthread_mutex_t **)v26);
    }
    if (a2 == v32)
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v26 + 24));
  }
  else
  {
    if (v11 != MEMORY[0x1E0C812F8])
    {
      v17 = (void *)MEMORY[0x1E0BFF4DC](a2);
      MOLogWrite(0, 3, (uint64_t)"MOXPCTransportOpen_block_invoke", CFSTR("received unhandled event from server: %s"), v18, v19, v20, v21, (char)v17);
      free(v17);
      return;
    }
    if (*(_BYTE *)(a1 + 40))
    {
      v38 = CFSTR("Got dictionary on listener connection! Ignoring.");
LABEL_29:
      MOLogWrite(0, 3, (uint64_t)"MOXPCTransportOpen_block_invoke", v38, v13, v14, v15, v16, a9);
      return;
    }
    _HandleIncomingMessage(*(_QWORD *)(a1 + 32), *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 8), a2, v12, v13, v14, v15, v16, a9);
  }
}

void __MOXPCTransportOpen_block_invoke_2(uint64_t a1)
{
  _xpc_connection_s *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  xpc_object_t v6;
  uint64_t handler;
  uint64_t p_handler;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _xpc_connection_s *v12;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_xpc_connection_s **)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(v3 + 48))
  {
    v5 = *(NSObject **)(v3 + 56);
    if (v5)
    {
      handler = 0;
      p_handler = (uint64_t)&handler;
      v9 = 0x2000000000;
      LOBYTE(v10) = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = ___HandleListenerConnection_block_invoke;
      block[3] = &unk_1EA98D720;
      block[4] = &handler;
      block[5] = v3;
      block[6] = v2;
      dispatch_sync(v5, block);
      if (!*(_BYTE *)(p_handler + 24))
      {
        xpc_connection_cancel(v2);
        _Block_object_dispose(&handler, 8);
        goto LABEL_6;
      }
      _Block_object_dispose(&handler, 8);
    }
  }
  v6 = xpc_retain(v2);
  MEMORY[0x1E0BFF518](v6);
  xpc_connection_set_target_queue(v2, *(dispatch_queue_t *)(v3 + 16));
  handler = v4;
  p_handler = 0x40000000;
  v9 = (uint64_t)___HandleListenerConnection_block_invoke_2;
  v10 = &__block_descriptor_tmp_35;
  v11 = v3;
  v12 = v2;
  xpc_connection_set_event_handler(v2, &handler);
  xpc_connection_resume(v2);
LABEL_6:
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

@end
