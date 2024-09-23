@implementation RemoveFromSelectedRouteDescriptors

uint64_t __routingContextResilientRemote_RemoveFromSelectedRouteDescriptors_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

void __routingContext_RemoveFromSelectedRouteDescriptors_block_invoke(uint64_t a1)
{
  OpaqueFigEndpoint *v2;
  OpaqueFigEndpoint *v3;
  const void **v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v8;
  NSObject *v9;
  CFTypeRef v10;
  NSObject *v11;
  NSObject *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  CFTypeRef cf[23];

  cf[22] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v2 = FigEndpointDescriptorUtility_CopyEndpointFromDescriptor(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
  cf[0] = 0;
  if (!v2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), *(const __CFDictionary **)(a1 + 72), CFSTR("configUpdateReasonStarted"));
    FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), *(const __CFDictionary **)(a1 + 72), CFSTR("configUpdateReasonEndedFailed"));
    goto LABEL_23;
  }
  v3 = v2;
  v4 = *(const void ***)(a1 + 48);
  v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 > 0xDu)
  {
LABEL_10:
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_22;
  }
  if (((1 << v5) & 0x201A) == 0)
  {
    if (v5 == 9)
    {
      v8 = MXSystemRemotePool_RemoveEndpointFromContext(v2, v4[1], *(const __CFDictionary **)(a1 + 72));
LABEL_17:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
      goto LABEL_22;
    }
    goto LABEL_10;
  }
  FigPredictedRouting_ResetSelectedRouteDescriptor((uint64_t)v4[1], 5);
  v6 = *(_QWORD *)(a1 + 48);
  if (*(_DWORD *)v6 != 13
    || (FigRoutingManagerCopyPickedRouteDescriptorForRoutingContext(*(_QWORD *)(v6 + 8), (__CFDictionary **)cf),
        FigCFDictionaryGetValue(),
        FigCFDictionaryGetValue(),
        FigCFDictionaryGetValue(),
        !FigCFEqual())
    && FigCFEqual())
  {
    if (FigRoutingManagerIsEndpointOfType((uint64_t)v3)
      && FigRoutingManagerIsEndpointWHAGroupable((uint64_t)v3))
    {
      v10 = FigRoutingManagerCopyLocalAirPlayEndpoint();
      if (dword_1EE2B3E08)
      {
        v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!v10)
      {
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigRoutingManager_iOSRemoveEndpointFromContext(*(const void **)(*(_QWORD *)(a1 + 48) + 8), v10, *(CFDictionaryRef *)(a1 + 72));
      if (v10)
        CFRelease(v10);
      goto LABEL_22;
    }
    v8 = FigRoutingManager_iOSRemoveEndpointFromContext(*(const void **)(*(_QWORD *)(a1 + 48) + 8), v3, *(CFDictionaryRef *)(a1 + 72));
    goto LABEL_17;
  }
  FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), *(const __CFDictionary **)(a1 + 72), CFSTR("configUpdateReasonEndedNoop"));
LABEL_22:
  CFRelease(v3);
LABEL_23:
  v13 = *(const void **)(a1 + 80);
  if (v13)
    CFRelease(v13);
  v14 = *(const void **)(a1 + 40);
  if (v14)
    CFRelease(v14);
  v15 = *(const void **)(a1 + 72);
  if (v15)
    CFRelease(v15);
  if (cf[0])
    CFRelease(cf[0]);
}

@end
