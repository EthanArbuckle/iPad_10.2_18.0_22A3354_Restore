@implementation SetProperty

void __discoverer_SetProperty_block_invoke_2(uint64_t a1)
{
  const void *v2;
  NSObject *NotificationQueue;
  BOOL v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  CFTypeRef *v7;
  CFTypeRef v8;
  CFTypeRef v9;
  const void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t UpTimeNanoseconds;
  const __CFArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  const __CFArray *v23;
  CFIndex Count;
  id v25;
  uint64_t v26;
  const void *v27;
  const __CFArray *v28;
  const void *v29;
  NSObject *v30;
  const void *v31;
  _QWORD v32[5];
  _QWORD v33[2];
  const __CFArray *(*v34)(_QWORD *);
  void *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  _QWORD v39[5];
  os_log_type_t type;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!FigEndpointDescriptorUtility_IsAudiomxdGuardRailsEnabled()
    || FigCFEqual()
    || FigCFEqual())
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("DiscoveryMode")))
    {
      if (FigCFEqual() && MX_FeatureFlags_IsCorianderEnabled())
      {
        v2 = *(const void **)(a1 + 56);
        if (v2)
          CFRetain(v2);
        NotificationQueue = FigRouteDiscoveryManagerGetNotificationQueue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __discoverer_SetProperty_block_invoke_2_34;
        v39[3] = &__block_descriptor_40_e5_v8__0l;
        v39[4] = *(_QWORD *)(a1 + 56);
        MXDispatchAsync((uint64_t)"discoverer_SetProperty_block_invoke", (uint64_t)"FigRouteDiscoverer.m", 502, 0, 0, NotificationQueue, (uint64_t)v39);
      }
      else
      {
        if (FigCFEqual())
          v4 = dword_1EE2B3DE8 == 0;
        else
          v4 = 1;
        if (!v4)
        {
          v41 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v7 = *(CFTypeRef **)(a1 + 40);
        if (*v7)
        {
          v8 = CFRetain(*v7);
          v7 = *(CFTypeRef **)(a1 + 40);
          v9 = *v7;
        }
        else
        {
          v9 = 0;
          v8 = 0;
        }
        v10 = *(const void **)(a1 + 64);
        *v7 = v10;
        if (v10)
          CFRetain(v10);
        if (v9)
          CFRelease(v9);
        if (FigCFEqual())
        {
          if (dword_1EE2B3DE8)
          {
            v41 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          MEMORY[0x1940352BC](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
          v12 = *(_QWORD *)(a1 + 40);
          *(_BYTE *)(v12 + 72) = 0;
          MEMORY[0x1940352C8](*(_QWORD *)(v12 + 64));
        }
        if (MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled() && !FigCFEqual())
          FigRouteDiscoveryManagerRemoveCachedDiscoverers();
        if (FigCFEqual())
        {
          if (dword_1EE2B3DE8)
          {
            v41 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (v8)
            CFRelease(v8);
        }
        else
        {
          if (dword_1EE2B3DE8)
          {
            v41 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (!FigRouteDiscovereryManagerIsNewDiscoveryModeHigher() && FigRouteDiscovererShouldLogForClient())
          {
            UpTimeNanoseconds = FigGetUpTimeNanoseconds();
            MEMORY[0x1940352BC](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
            v16 = (const __CFArray *)*(id *)(*(_QWORD *)(a1 + 40) + 80);
            v17 = *(_QWORD *)(a1 + 40);
            *(_QWORD *)(v17 + 48) = UpTimeNanoseconds;
            MEMORY[0x1940352C8](*(_QWORD *)(v17 + 64));
            discoverer_logAvailableRouteDetails(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 40), v16);
            if (v16)
              CFRelease(v16);
          }
          if (MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled() && FigCFEqual())
            FigRouteDiscoveryManagerAddToCachedDiscoverers();
          FigRouteDiscoveryManagerUpdateDiscoveryMode();
          if (FigRouteDiscovereryManagerIsNewDiscoveryModeHigher())
          {
            v46 = 0;
            v47 = &v46;
            v48 = 0x2020000000;
            v49 = 0;
            v42 = 0;
            v43 = &v42;
            v44 = 0x2020000000;
            v45 = 0;
            v18 = MEMORY[0x1E0C809B0];
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v34 = __discoverer_SetProperty_block_invoke_36;
            v35 = &unk_1E309C7E0;
            v19 = *(_QWORD *)(a1 + 40);
            v37 = &v42;
            v38 = v19;
            v36 = &v46;
            if (MX_FeatureFlags_IsReduceRouteDiscoveryQueueHoppingEnabled())
              FigRouteDiscoveryManagerRunBlockOnSerialQueueIfOnEmbeddedPlatforms((uint64_t)v33);
            else
              v34(v33);
            MEMORY[0x1940352BC](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));

            v20 = (id)v47[3];
            v21 = *(_QWORD *)(a1 + 40);
            *(_QWORD *)(v21 + 88) = v20;

            v22 = v43;
            if (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 40) == 8)
            {
              v23 = (const __CFArray *)v43[3];
              if (v23)
              {
                Count = CFArrayGetCount(v23);
                v22 = v43;
                if (Count)
                {
                  objc_msgSend((id)objc_msgSend((id)v43[3], "objectAtIndex:", 0), "setValue:forKey:", CFSTR("Default"), CFSTR("RouteType"));
                  v22 = v43;
                }
              }
            }
            v25 = (id)v22[3];
            v26 = *(_QWORD *)(a1 + 40);
            *(_QWORD *)(v26 + 80) = v25;
            MEMORY[0x1940352C8](*(_QWORD *)(v26 + 64));
            v27 = (const void *)v43[3];
            if (v27)
            {
              CFRelease(v27);
              v43[3] = 0;
            }
            if (FigCFEqual() && FigCFEqual()
              || FigCFEqual()
              && FigCFEqual()
              && *(_DWORD *)(*(_QWORD *)(a1 + 40) + 40) == 8)
            {
              discoverer_updateUserSelectionAvailableAndNotifyIfRoutePresentChanged(*(const void **)(a1 + 56), (const __CFArray *)v47[3], 0);
            }
            v28 = (const __CFArray *)v47[3];
            if (v28 && CFArrayGetCount(v28))
            {
              v29 = *(const void **)(a1 + 56);
              if (v29)
                CFRetain(v29);
              v30 = FigRouteDiscoveryManagerGetNotificationQueue();
              v32[0] = v18;
              v32[1] = 3221225472;
              v32[2] = __discoverer_SetProperty_block_invoke_3;
              v32[3] = &__block_descriptor_40_e5_v8__0l;
              v32[4] = *(_QWORD *)(a1 + 56);
              MXDispatchAsync((uint64_t)"discoverer_SetProperty_block_invoke_2", (uint64_t)"FigRouteDiscoverer.m", 636, 0, 0, v30, (uint64_t)v32);
            }
            v31 = (const void *)v47[3];
            if (v31)
              CFRelease(v31);
            _Block_object_dispose(&v42, 8);
            _Block_object_dispose(&v46, 8);
          }
          if (v8)
            CFRelease(v8);
        }
      }
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12784;
    }
  }
  else if (dword_1EE2B3DE8)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __central_SetProperty_block_invoke(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  const __CFBoolean *v4;
  _BYTE *DerivedStorage;
  _BYTE *v6;
  CFTypeID v7;
  int Value;
  uint64_t v9;
  const __CFString *v10;
  uint64_t result;
  uint64_t CMBaseObject;
  uint64_t (*v13)(uint64_t, const void *, const __CFBoolean *);

  v3 = a1[5];
  v2 = (const void *)a1[6];
  v4 = (const __CFBoolean *)a1[7];
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage)
  {
    result = FigSignalErrorAt();
  }
  else
  {
    v6 = DerivedStorage;
    if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA44C0]))
    {
      if (*v6)
      {
        result = 4294954511;
      }
      else if (v4 && (v7 = CFGetTypeID(v4), v7 == CFBooleanGetTypeID()))
      {
        Value = CFBooleanGetValue(v4);
        if (Value)
          v9 = 0x100000000;
        else
          v9 = 0xFFFFFFFF00000000;
        if (Value)
          v10 = CFSTR("iOS navigation session started");
        else
          v10 = CFSTR("iOS navigation session ended");
        result = FigEndpointCentralUpdateiOSDeviceState(v3, v9, 0, (uint64_t)v10, 1);
      }
      else
      {
        result = 4294954516;
      }
    }
    else if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA4108]) || CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA41C0]))
    {
      CMBaseObject = FigEndpointGetCMBaseObject();
      v13 = *(uint64_t (**)(uint64_t, const void *, const __CFBoolean *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 56);
      if (v13)
        result = v13(CMBaseObject, v2, v4);
      else
        result = 4294954514;
    }
    else
    {
      result = 4294954509;
    }
  }
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void __discoverer_SetProperty_block_invoke_2_34(uint64_t a1)
{
  const void *v2;

  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

const __CFArray *__discoverer_SetProperty_block_invoke_36(_QWORD *a1)
{
  const __CFArray *result;

  FigRouteDiscoveryManagerCopyRoutesForTypeAndAudioSessionID(*MEMORY[0x1E0C9AE00], *(_DWORD *)(a1[6] + 40), *(_DWORD *)(a1[6] + 8), *(_QWORD *)(a1[6] + 24), (CFMutableArrayRef *)(*(_QWORD *)(a1[4] + 8) + 24));
  result = FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID(*(const __CFArray **)(*(_QWORD *)(a1[4] + 8) + 24), *(unsigned int *)(a1[6] + 8));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

void __discoverer_SetProperty_block_invoke_3(uint64_t a1)
{
  const void *v2;

  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

uint64_t __routingContextResilientRemote_SetProperty_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

uint64_t __endpointAggregate_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  CMBaseObject = FigEndpointGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    return v4(CMBaseObject, v1, v2);
  else
    return 4294954514;
}

@end
