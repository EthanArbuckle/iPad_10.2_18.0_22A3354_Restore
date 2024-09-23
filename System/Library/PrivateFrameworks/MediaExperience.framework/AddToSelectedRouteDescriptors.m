@implementation AddToSelectedRouteDescriptors

uint64_t __routingContextResilientRemote_AddToSelectedRouteDescriptors_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 88);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

void __routingContext_AddToSelectedRouteDescriptors_block_invoke(uint64_t a1)
{
  OpaqueFigEndpoint *v2;
  OpaqueFigEndpoint *v3;
  void *v4;
  const void **v5;
  int v6;
  CFTypeRef v8;
  const void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v11;
  const __CFDictionary *v12;
  OpaqueFigEndpoint *v13;
  uint64_t v14;
  int IsEndpointPicked;
  uint64_t v16;
  const __CFDictionary *v17;
  __CFString **v18;
  NSObject *v19;
  NSObject *v20;
  const void *v21;
  const void *v22;
  const void *v23;

  v2 = FigEndpointDescriptorUtility_CopyEndpointFromDescriptor(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
  if (!v2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), *(const __CFDictionary **)(a1 + 64), CFSTR("configUpdateReasonStarted"));
    FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), *(const __CFDictionary **)(a1 + 64), CFSTR("configUpdateReasonEndedFailed"));
    goto LABEL_25;
  }
  v3 = v2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v2, 0);
  FigRoutingManagerCreateAggregateForContextIfNecessary(*(const void **)(*(_QWORD *)(a1 + 48) + 8), (CFIndex)v4);

  v5 = *(const void ***)(a1 + 48);
  v6 = *(_DWORD *)v5;
  if ((*(_DWORD *)v5 - 3) >= 2 && v6 != 1)
  {
    if (v6 == 9)
    {
      MXSystemRemotePool_AddEndpointToContext(v3, v5[1], *(const __CFDictionary **)(a1 + 64));
    }
    else if (MX_FeatureFlags_IsSystemRemoteDisplayContextEnabled()
           && (v14 = *(_QWORD *)(a1 + 48), *(_DWORD *)v14 == 14))
    {
      IsEndpointPicked = FigRoutingManagerUtilities_IsEndpointPicked(v3, *(_QWORD *)(v14 + 8));
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(const __CFDictionary **)(a1 + 64);
      if (IsEndpointPicked)
      {
        v18 = kFigRoutingContextNotificationPayloadValue_ConfigUpdateReasonEndedNoOp;
      }
      else
      {
        FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(v16, v17, CFSTR("configUpdateReasonStarted"));
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(const __CFDictionary **)(a1 + 64);
        v18 = kFigRoutingContextNotificationPayloadValue_ConfigUpdateReasonEndedFailed;
      }
      FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(v16, v17, *v18);
    }
    else
    {
      v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_24;
  }
  FigPredictedRouting_ResetSelectedRouteDescriptor((uint64_t)v5[1], 4);
  if (!FigRoutingManagerIsEndpointOfType((uint64_t)v3)
    || !FigRoutingManagerIsEndpointWHAGroupable((uint64_t)v3))
  {
    v11 = *(const void **)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(const __CFDictionary **)(a1 + 64);
    v13 = v3;
LABEL_15:
    FigRoutingManager_iOSAddEndpointToContext(v11, v13, v12);
    goto LABEL_24;
  }
  v8 = FigRoutingManagerCopyLocalAirPlayEndpoint();
  if (!v8)
  {
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v11 = *(const void **)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(const __CFDictionary **)(a1 + 64);
    v13 = 0;
    goto LABEL_15;
  }
  v9 = v8;
  FigRoutingManager_iOSAddEndpointToContext(*(const void **)(*(_QWORD *)(a1 + 48) + 8), v8, *(CFDictionaryRef *)(a1 + 64));
  CFRelease(v9);
LABEL_24:
  CFRelease(v3);
LABEL_25:
  v21 = *(const void **)(a1 + 72);
  if (v21)
    CFRelease(v21);
  v22 = *(const void **)(a1 + 40);
  if (v22)
    CFRelease(v22);
  v23 = *(const void **)(a1 + 64);
  if (v23)
    CFRelease(v23);
}

@end
