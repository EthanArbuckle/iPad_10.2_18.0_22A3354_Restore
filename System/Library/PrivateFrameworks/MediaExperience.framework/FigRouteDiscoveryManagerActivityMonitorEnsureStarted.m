@implementation FigRouteDiscoveryManagerActivityMonitorEnsureStarted

void __FigRouteDiscoveryManagerActivityMonitorEnsureStarted_block_invoke()
{
  unsigned __int8 v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  CFIndex v11;
  uint64_t v12;
  const __CFArray *Count;
  const void *ValueAtIndex;
  uint64_t v15;
  const void *v16;
  void (*v17)(const void *, const __CFString *, uint64_t, os_log_type_t *);
  NSObject *v18;
  NSObject *NotificationQueue;
  uint64_t v20;
  os_log_type_t type[8];
  _QWORD v22[6];
  int v23;
  uint64_t state64[18];

  state64[16] = *MEMORY[0x1E0C80C00];
  if (activityLevelNotifyToken != -1)
  {
    state64[0] = 0;
    notify_get_state(activityLevelNotifyToken, state64);
    v0 = state64[0];
    if (dword_1EE2B3DE8)
    {
      v23 = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v0 == 3)
    {
      if (discoverManager_getSharedManager_onceToken != -1)
        dispatch_once(&discoverManager_getSharedManager_onceToken, &__block_literal_global_15);
      v2 = qword_1EE2B3238;
      if (qword_1EE2B3238)
        v3 = (uint64_t)&unk_1EE2B3350;
      else
        v3 = 288;
      if (!*(_QWORD *)v3)
      {
        if (dword_1EE2B3DE8)
        {
          v23 = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v9 = 8;
        if (v2)
          v9 = (uint64_t)&qword_1EE2B3238;
        *(_QWORD *)v3 = FigRoutingManagerCreateOneShotTimer(*(NSObject **)v9, 5.0, (uint64_t)&__block_literal_global_58, 0, 0);
        goto LABEL_35;
      }
      if (!dword_1EE2B3DE8)
        goto LABEL_34;
    }
    else
    {
      if (v0 < 4u || currentActivityLevel != 3)
        goto LABEL_35;
      if (discoverManager_getSharedManager_onceToken != -1)
        dispatch_once(&discoverManager_getSharedManager_onceToken, &__block_literal_global_15);
      v5 = 288;
      if (qword_1EE2B3238)
        v5 = (uint64_t)&unk_1EE2B3350;
      if (!*(_QWORD *)v5)
      {
        if (dword_1EE2B3DE8)
        {
          v23 = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          if (discoverManager_getSharedManager_onceToken != -1)
            dispatch_once(&discoverManager_getSharedManager_onceToken, &__block_literal_global_15);
        }
        v11 = 0;
        if (qword_1EE2B3238)
          v12 = (uint64_t)&qword_1EE2B3348;
        else
          v12 = 280;
        v20 = *MEMORY[0x1E0C9AE00];
        while (1)
        {
          Count = *(const __CFArray **)v12;
          if (*(_QWORD *)v12)
            Count = (const __CFArray *)CFArrayGetCount(Count);
          if (v11 >= (uint64_t)Count)
            break;
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)v12, v11);
          v15 = discoveryManager_copyDiscovererFromWeakRef(ValueAtIndex);
          if (v15)
          {
            v16 = (const void *)v15;
            *(_QWORD *)type = 0;
            v17 = *(void (**)(const void *, const __CFString *, uint64_t, os_log_type_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
            if (v17)
              v17(v16, CFSTR("DiscoveryMode"), v20, type);
            if (FigCFEqual())
            {
              if (dword_1EE2B3DE8)
              {
                v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              FigRouteDiscovererSetDiscoveryModeDetailedOnDiscoverer();
              FigRouteDiscoveryManagerUpdateDiscoveryMode();
              NotificationQueue = FigRouteDiscoveryManagerGetNotificationQueue();
              v22[0] = MEMORY[0x1E0C809B0];
              v22[1] = 3221225472;
              v22[2] = __figRouteDiscoveryManager_setDiscoveryModeDetailedOnCachedDiscoverers_block_invoke;
              v22[3] = &__block_descriptor_40_e5_v8__0l;
              v22[4] = v16;
              MXDispatchAsync((uint64_t)"figRouteDiscoveryManager_setDiscoveryModeDetailedOnCachedDiscoverers", (uint64_t)"FigRouteDiscoveryManager.m", 1182, 0, 0, NotificationQueue, (uint64_t)v22);
            }
            if (*(_QWORD *)type)
              CFRelease(*(CFTypeRef *)type);
            CFRelease(v16);
          }
          ++v11;
        }
        goto LABEL_35;
      }
      if (!dword_1EE2B3DE8
        || (v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(),
            os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT),
            fig_log_call_emit_and_clean_up_after_send_and_compose(),
            !dword_1EE2B3DE8))
      {
LABEL_34:
        figRouteDiscoveryManager_stopTimerForActivityMonitoring(0);
LABEL_35:
        currentActivityLevel = v0;
        return;
      }
    }
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_34;
  }
}

@end
