@implementation PrepareForPlayback

uint64_t __routingSessionManagerResilientRemote_PrepareForPlayback_block_invoke(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  void (*v5)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t);

  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void (**)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 32);
  if (v5)
  {
    v5(a2, v3, v4);
  }
  else if (v3)
  {
    v3(v4, 4294954514);
  }
  return 0;
}

uint64_t __routingSessionManager_PrepareForPlayback_block_invoke(uint64_t result)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(result + 32);
  if (v1)
    return v1(*(_QWORD *)(result + 40));
  return result;
}

void __routingSessionManager_PrepareForPlayback_block_invoke_82(_QWORD *a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const __CFArray *v9;
  CFIndex v10;
  void (**ValueAtIndex)(const void *, _QWORD);
  const void *v12;
  const void *v13;
  _QWORD v14[6];
  os_log_type_t type;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a2)
  {
    if (dword_1EE2B3E48)
    {
      v16 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = (const void *)a1[4];
    if (v5)
    {
      CFRetain(v5);
      v6 = a1[4];
    }
    else
    {
      v6 = 0;
    }
    v7 = a1[6];
    v8 = *(NSObject **)(a1[5] + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __routingSessionManager_PrepareForPlayback_block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = v6;
    v14[5] = v7;
    MXDispatchAsync((uint64_t)"routingSessionManager_PrepareForPlayback_block_invoke", (uint64_t)"FigRoutingSessionManager.m", 1560, 0, 0, v8, (uint64_t)v14);
  }
  MEMORY[0x1940352F8](*(_QWORD *)(a1[5] + 40));
  v9 = *(const __CFArray **)(a1[5] + 104);
  *(_QWORD *)(a1[5] + 104) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  MEMORY[0x194035304](*(_QWORD *)(a1[5] + 40));
  if (v9)
  {
    if (CFArrayGetCount(v9) >= 1)
    {
      v10 = 0;
      do
      {
        ValueAtIndex = (void (**)(const void *, _QWORD))CFArrayGetValueAtIndex(v9, v10);
        ValueAtIndex[2](ValueAtIndex, a2);
        ++v10;
      }
      while (v10 < CFArrayGetCount(v9));
    }
    CFRelease(v9);
  }
  v12 = (const void *)a1[6];
  if (v12)
    CFRelease(v12);
  v13 = (const void *)a1[4];
  if (v13)
    CFRelease(v13);
}

void __routingSessionManager_PrepareForPlayback_block_invoke_2(uint64_t a1)
{
  const void *v2;

  routingSessionManager_updateCurrentSession(*(const void **)(a1 + 32), 0, 0, 0, 0, 0, 0, 1, *(_QWORD *)(a1 + 40), 0, CFSTR("routingSessionManager_routeToDestinationOfCurrentSession failed"), 0);
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
