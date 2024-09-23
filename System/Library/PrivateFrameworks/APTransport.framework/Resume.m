@implementation Resume

void __stream_Resume_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, const void *, uint64_t (*)(int, const void *, const void *), uint64_t, _QWORD);
  int v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  _QWORD block[5];
  int v18;

  v2 = *(const void **)(a1 + 40);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APTransportStreamUnbuffered <= 30
    && (gLogCategory_APTransportStreamUnbuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    APSLogErrorAt();
    v16 = -16617;
    goto LABEL_22;
  }
  if (*(_BYTE *)(DerivedStorage + 25))
    goto LABEL_17;
  v4 = *(_QWORD *)DerivedStorage;
  if (*(_QWORD *)DerivedStorage == 1935897198)
    APSEventRecorderRecordEventWithFlags();
  v5 = *(_QWORD *)(DerivedStorage + 40);
  v6 = *(_QWORD *)(DerivedStorage + 104);
  v7 = *(uint64_t (**)(uint64_t, const void *, uint64_t (*)(int, const void *, const void *), uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (!v7)
  {
    v16 = -12782;
    goto LABEL_21;
  }
  v8 = v7(v5, v2, stream_handleEventFromSendConnection, v6, 0);
  if (v8)
  {
    v16 = v8;
    goto LABEL_21;
  }
  v9 = *(_QWORD *)(DerivedStorage + 40);
  v10 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v10)
  {
    v16 = -12782;
LABEL_21:
    APSLogErrorAt();
    goto LABEL_22;
  }
  v11 = v10(v9);
  if (v11)
  {
    v16 = v11;
    goto LABEL_21;
  }
  if (v4 == 1935897198)
    APSEventRecorderRecordEventWithFlags();
  *(_BYTE *)(DerivedStorage + 25) = 1;
  v12 = CMBaseObjectGetDerivedStorage();
  v13 = *(_DWORD *)(v12 + 28);
  if (v13)
  {
    v14 = v12;
    CFRetain(v2);
    v15 = *(NSObject **)(v14 + 104);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __stream_postCachedConnectionEvent_block_invoke;
    block[3] = &__block_descriptor_tmp_30;
    v18 = v13;
    block[4] = v2;
    dispatch_async(v15, block);
  }
LABEL_17:
  v16 = 0;
LABEL_22:
  *(_DWORD *)(DerivedStorage + 48) = v16;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v16;
}

void __tcpunbufnw_Resume_block_invoke(uint64_t a1)
{
  ASPrintF();
  APSLogErrorAt();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -72323;
  free(0);
  sec_release(0);
}

void __tcpunbufnw_Resume_block_invoke_2(int a1, nw_protocol_options_t options)
{
  nw_tcp_options_set_no_delay(options, 1);
}

void __tcpunbufnw_Resume_block_invoke_3(uint64_t a1, int a2, nw_error_t error)
{
  uint64_t v4;
  int error_code;
  int v6;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (error)
    error_code = nw_error_get_error_code(error);
  else
    error_code = 0;
  if (error_code)
    v6 = 90;
  else
    v6 = 50;
  if (v6 >= gLogCategory_APTransportConnectionTCPUnbufferedNW
    && (gLogCategory_APTransportConnectionTCPUnbufferedNW != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a2 != 2)
  {
    if (a2 == 3)
    {
      if (!error_code)
        error_code = -6700;
    }
    else
    {
      if (a2 != 4)
        return;
      error_code = -6723;
    }
  }
  if (!*(_BYTE *)(v4 + 32))
  {
    *(_BYTE *)(v4 + 32) = 1;
    *(_DWORD *)(v4 + 36) = error_code;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 40));
  }
  if (a2 == 4)
  {
    CFRelease(*(CFTypeRef *)(v4 + 24));
    dispatch_release(*(dispatch_object_t *)(v4 + 40));
  }
}

uint64_t __tcpunbufnw_Resume_block_invoke_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD state_changed_handler[5];

  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 40));
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 168))
  {
    APSLogErrorAt();
    nw_connection_group_cancel(a2);
  }
  else
  {
    *(_QWORD *)(v4 + 168) = nw_retain(a2);
    CFRetain((CFTypeRef)v4);
    nw_connection_group_set_queue(a2, *(dispatch_queue_t *)(v4 + 320));
    v5 = MEMORY[0x1E0C809B0];
    state_changed_handler[0] = MEMORY[0x1E0C809B0];
    state_changed_handler[1] = 0x40000000;
    state_changed_handler[2] = __tcpunbufnwGuts_handleNewConnectionGroupInternal_block_invoke;
    state_changed_handler[3] = &__block_descriptor_tmp_46;
    state_changed_handler[4] = v4;
    nw_connection_group_set_state_changed_handler(a2, state_changed_handler);
    nw_connection_group_set_new_connection_limit();
    v7[0] = v5;
    v7[1] = 0x40000000;
    v7[2] = __tcpunbufnwGuts_handleNewConnectionGroupInternal_block_invoke_2;
    v7[3] = &__block_descriptor_tmp_47;
    v7[4] = v4;
    nw_connection_group_set_new_connection_handler(a2, v7);
    nw_connection_group_start(a2);
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __tcpunbufnw_Resume_block_invoke_5(uint64_t a1, NSObject *a2)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 40));
  tcpunbufnwGuts_handleNewConnectionInternal(*(_QWORD *)(a1 + 32), a2);
  return pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 40));
}

void __lowPowerKeepAliveController_Resume_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  NSObject *v5;
  _QWORD handler[5];

  v2 = *(_QWORD *)(a1 + 32);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_BYTE *)(DerivedStorage + 32))
  {
    v4 = DerivedStorage;
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(DerivedStorage + 16));
    *(_QWORD *)(v4 + 24) = v5;
    if (v5)
    {
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 0x40000000;
      handler[2] = __lowPowerKeepAliveController_resumeInternal_block_invoke;
      handler[3] = &__block_descriptor_tmp_12_3;
      handler[4] = v2;
      dispatch_source_set_event_handler(v5, handler);
      dispatch_source_set_timer(*(dispatch_source_t *)(v4 + 24), 0, 0x2540BE400uLL, 0x3B9ACA00uLL);
      dispatch_resume(*(dispatch_object_t *)(v4 + 24));
      *(_BYTE *)(v4 + 32) = 1;
    }
    else
    {
      APSLogErrorAt();
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __stream_Resume_block_invoke_0(uint64_t a1)
{
  const void *v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, const void *, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  unsigned __int16 v13;
  int v14;

  v2 = *(const void **)(a1 + 40);
  v14 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APTransportStream <= 30
    && (gLogCategory_APTransportStream != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(DerivedStorage + 72))
  {
    APSLogErrorAt();
    v14 = -16617;
    goto LABEL_20;
  }
  v4 = 56;
  if (!*(_DWORD *)(DerivedStorage + 24))
    v4 = 48;
  v5 = *(_QWORD *)(DerivedStorage + v4);
  if (!*(_BYTE *)(v5 + 9))
  {
    v7 = *(_QWORD *)(v5 + 24);
    v6 = *(_QWORD *)(v5 + 32);
    v8 = *(_QWORD *)(DerivedStorage + 184);
    v9 = *(_QWORD *)(DerivedStorage + 96);
    v10 = *(uint64_t (**)(uint64_t, const void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 16);
    if (v10)
    {
      v14 = v10(v7, v2, v6, v8, v9);
      if (!v14)
      {
        v11 = *(_QWORD *)(v5 + 24);
        v12 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
        if (v12)
        {
          v14 = v12(v11);
          if (!v14)
          {
            if (APTransportStreamIDGetStreamCategory(*(_QWORD *)DerivedStorage) == 2)
            {
              v13 = APSGetFBOPropertyInt64();
              *(_QWORD *)DerivedStorage = APTransportStreamIDInsertPort(*(_QWORD *)DerivedStorage, v13);
            }
            *(_BYTE *)(v5 + 9) = 1;
            stream_postCachedConnectionEvent(v2, v5);
            goto LABEL_20;
          }
        }
        else
        {
          v14 = -12782;
        }
      }
    }
    else
    {
      v14 = -12782;
    }
    APSLogErrorAt();
  }
LABEL_20:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v14;
}

@end
