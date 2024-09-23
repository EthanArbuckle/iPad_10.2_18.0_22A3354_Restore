@implementation HandleNewSecondaryConnection

void __figXPC_HandleNewSecondaryConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  const void *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char v18;
  _QWORD block[7];
  os_log_type_t type;
  int v21[2];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x193FFCDCC](a2);
  v5 = FigCFWeakReferenceLoadAndRetain((id *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = v5;
  if (v4 != MEMORY[0x1E0C812F8])
  {
    if (v4 == MEMORY[0x1E0C81310])
    {
      v7 = FigXPCRetain(*(xpc_object_t *)(a1 + 48));
      v8 = FigXPCRetain(a2);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(NSObject **)(v9 + 128);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = __figXPC_HandleNewSecondaryConnection_block_invoke_146;
      block[3] = &__block_descriptor_tmp_147;
      block[4] = v9;
      block[5] = v7;
      block[6] = v8;
      dispatch_async(v10, block);
    }
    if (!v6)
      return;
LABEL_8:
    CFRelease(v6);
    return;
  }
  if (v5)
  {
    figXPC_HandleMessage(*(_QWORD *)(a1 + 40), (int)v5, *(_QWORD *)(a1 + 48), a2);
    goto LABEL_8;
  }
  v21[0] = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 0, v21, &type);
  v12 = v21[0];
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
    v14 = v12;
  else
    v14 = v12 & 0xFFFFFFFE;
  if (v14)
  {
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
    v21[1] = 136315906;
    v22 = "figXPC_HandleNewSecondaryConnection_block_invoke";
    v23 = 2080;
    v24 = v16;
    v25 = 2048;
    v26 = v15;
    v27 = 2048;
    v28 = a2;
    v17 = (char *)_os_log_send_and_compose_impl();
    v18 = v21[0];
  }
  else
  {
    v18 = v12;
    v17 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(0, 0, 1, v17, v17 != &v29, v18, 0, v13);
}

void __figXPC_HandleNewSecondaryConnection_block_invoke_146(uint64_t a1)
{
  void *v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  pid_t pid;
  pthread_mutex_t **Value;
  pthread_mutex_t **v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  uint64_t *ValueAtIndex;
  uint64_t *v13;
  const __CFArray *v14;
  CFIndex FirstIndexOfValue;
  CFIndex v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  char *v23;
  os_log_type_t type;
  int v25[2];
  const char *v26;
  __int16 v27;
  _xpc_connection_s *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  char v33;
  uint64_t v34;
  CFRange v35;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 48);
  if (v2 == (void *)MEMORY[0x1E0C81260])
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_xpc_connection_s **)(a1 + 40);
    v5 = (void *)xpc_connection_copy_invalidation_reason();
    pid = xpc_connection_get_pid(v3);
    FigSimpleMutexLock(*(pthread_mutex_t **)(v4 + 112));
    Value = (pthread_mutex_t **)CFDictionaryGetValue(*(CFDictionaryRef *)(v4 + 104), (const void *)pid);
    if (Value)
    {
      v8 = Value;
      FigSimpleMutexLock(Value[10]);
      Count = CFArrayGetCount((CFArrayRef)v8[11]);
      if (Count >= 1)
      {
        v10 = Count;
        v11 = 0;
        do
        {
          ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex((CFArrayRef)v8[11], v11);
          if ((_xpc_connection_s *)ValueAtIndex[7] == v3)
          {
            v13 = ValueAtIndex;
            FigCFWeakReferenceTableRemoveValue((uint64_t)v8[6], ValueAtIndex[3]);
            figXPC_ForgetNotificationsForServedObject((uint64_t)v8[14], v13);
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)v8[11], v11);
            --v10;
          }
          else
          {
            ++v11;
          }
        }
        while (v11 < v10);
      }
      v14 = (const __CFArray *)v8[18];
      v35.length = CFArrayGetCount(v14);
      v35.location = 0;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v14, v35, v3);
      if (FirstIndexOfValue < 0 || (v16 = FirstIndexOfValue, FirstIndexOfValue >= CFArrayGetCount((CFArrayRef)v8[18])))
      {
        v25[0] = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 0, v25, &type);
        v18 = v25[0];
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
          v20 = v18;
        else
          v20 = v18 & 0xFFFFFFFE;
        if (v20)
        {
          v21 = *(_QWORD *)(v4 + 88);
          v22 = *((_DWORD *)v8 + 4);
          v25[1] = 136315906;
          v26 = "figXPC_TerminateSecondaryConnection";
          v27 = 2048;
          v28 = v3;
          v29 = 2082;
          v30 = v21;
          v31 = 1024;
          v32 = v22;
          v23 = (char *)_os_log_send_and_compose_impl();
          LOBYTE(v18) = v25[0];
        }
        else
        {
          v23 = 0;
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose(0, 0, 1, v23, v23 != &v33, v18, 0, v19);
        FigSimpleMutexUnlock(v8[10]);
      }
      else
      {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)v8[18], v16);
        FigSimpleMutexUnlock(v8[10]);
        xpc_release(v3);
      }
    }
    FigSimpleMutexUnlock(*(pthread_mutex_t **)(v4 + 112));
    free(v5);
    v2 = *(void **)(a1 + 48);
  }
  FigXPCRelease(v2);
  FigXPCRelease(*(xpc_object_t *)(a1 + 40));
}

@end
