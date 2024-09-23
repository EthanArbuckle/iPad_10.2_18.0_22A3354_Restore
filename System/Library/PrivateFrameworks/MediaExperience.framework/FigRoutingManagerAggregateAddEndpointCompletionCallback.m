@implementation FigRoutingManagerAggregateAddEndpointCompletionCallback

void __FigRoutingManagerAggregateAddEndpointCompletionCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v7;
  void (*v8)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v12;
  const void *v13;
  char IsCrossfadePlaybackSupported;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef v17;
  int v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  CFTypeRef v24;
  CFTypeRef v25;
  CFTypeRef v26;
  CFTypeRef v27;
  CFTypeRef cf;
  CFTypeRef v29[17];

  v29[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v26 = 0;
  v27 = 0;
  v24 = 0;
  v25 = 0;
  v2 = *MEMORY[0x1E0C9AE00];
  CMBaseObject = FigEndpointGetCMBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v4)
    v4(CMBaseObject, *MEMORY[0x1E0CA4348], v2, &v27);
  v5 = FigEndpointGetCMBaseObject();
  v6 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v6)
    v6(v5, *MEMORY[0x1E0CA4258], v2, &v26);
  v7 = FigEndpointGetCMBaseObject();
  v8 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v8)
    v8(v7, *MEMORY[0x1E0CA4128], v2, &v25);
  v9 = FigEndpointGetCMBaseObject();
  v10 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v10)
    v10(v9, *MEMORY[0x1E0CA4310], v2, &v24);
  if (dword_1EE2B3E28)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12 = *(_DWORD *)(a1 + 96);
  switch(v12)
  {
    case -16727:
      goto LABEL_34;
    case -15580:
      goto LABEL_17;
    case 0:
      if (CMSMVAUtility_IsPortAvailableForEndpoint(*(_QWORD *)(a1 + 72), 0))
      {
        FigRoutingManagerCrossfadePlayback();
      }
      else
      {
        IsCrossfadePlaybackSupported = FigRoutingManagerIsCrossfadePlaybackSupported();
        FigRoutingManagerUpdateFadeInUponMusicVADCreation(IsCrossfadePlaybackSupported);
      }
      if ((*(_BYTE *)(a1 + 56) & 0x10) == 0)
      {
        FigVolumeControllerAddAirPlayVolumeNotificationListeners(*(const void **)(a1 + 40));
        v29[0] = 0;
        FigRoutingManagerContextUtilities_CopySystemMusicContextUUID((uint64_t)v29);
        cf = 0;
        FigRoutingManagerContextUtilities_CopyAggregateEndpointAsFigEndpointAggregate((uint64_t)v29[0], (uint64_t)&cf);
        if (MX_FeatureFlags_IsBufferedBadgingAndCapabilitiesEnabled())
          FigRoutingManagerUtilities_RegisterAirPlayStreamCapabilitiesDidChangeListener((uint64_t)cf, *(_QWORD *)(a1 + 40));
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        if (v29[0])
          CFRelease(v29[0]);
      }
      if (FigRoutingManagerContextUtilities_GetContextType(*(_QWORD *)(a1 + 64)) == 3)
      {
        if (!*(_QWORD *)(a1 + 80))
          CMSMVAUtility_DisableBluetoothSharingSession();
        if (FigRoutingManagerUtilities_IsCurrentRouteHandoff())
          CMSMAP_MakeAirPlayHandOffPortRoutable(0, *(_QWORD *)(a1 + 64));
      }
LABEL_34:
      if (FigRoutingManagerContextUtilities_GetContextType(*(_QWORD *)(a1 + 64)) == 3
        || FigRoutingManagerContextUtilities_GetContextType(*(_QWORD *)(a1 + 64)) == 4
        || FigRoutingManagerContextUtilities_GetContextType(*(_QWORD *)(a1 + 64)) == 9)
      {
        FigRoutingManagerContextUtilities_SetPickedEndpointAsAnArray(*(const void **)(a1 + 64), *(const void **)(a1 + 72), (uint64_t)CFSTR("configUpdateReasonGroupDevicesChanged"), *(_QWORD *)(a1 + 80));
      }
      LODWORD(cf) = 0;
      FigRoutingManagerContextUtilities_ResetCurrentlyActivatingSubEndpointsInfo(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), (uint64_t)CFSTR("configUpdateReasonEndedSuccess"), *(_QWORD *)(a1 + 80));
      FigRoutingManagerContextUtilities_GetPickingState(*(_QWORD *)(a1 + 64), (uint64_t)&cf);
      if ((_DWORD)cf != 8)
      {
        v29[0] = 0;
        FigRoutingManagerContextUtilities_CopyCurrentlyActivatingSubEndpoints(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), (uint64_t)v29);
        if (!v29[0] || !CFArrayGetCount((CFArrayRef)v29[0]))
          FigRoutingManagerContextUtilities_SetPickingState(*(_QWORD *)(a1 + 64), 0);
        if (v29[0])
          CFRelease(v29[0]);
      }
      if (FigEndpointAuthRequestHandler_HasEndpoint(*(_QWORD *)(a1 + 40)))
      {
        v16 = v26;
        v15 = v27;
        v17 = v24;
        v18 = FigCFEqual();
        FigEndpointUIAgentHelper_CleanupPrompt(v15, (uint64_t)v16, (uint64_t)v17, v18);
      }
      goto LABEL_46;
  }
  if (FigRoutingManagerIsEndpointNonRemoteControlLocalAirPlay(*(_QWORD *)(a1 + 40)))
  {
LABEL_17:
    v13 = *(const void **)(a1 + 72);
    if (!v13 || (FigEndpointAggregateGetClassID(), !CMBaseObjectIsMemberOfClass()))
      v13 = 0;
    FigRoutingManagerRetryAddingEndpointToAggregate(v13, *(const void **)(a1 + 40), *(const void **)(a1 + 64), *(const void **)(a1 + 80), *(const void **)(a1 + 88), (uint64_t)FigRoutingManagerAggregateAddEndpointCompletionCallback);
  }
  else
  {
    FigRoutingManagerCrossfadePlayback();
    FigRoutingManagerHandleAddEndpointCompletionCallbackError(*(_QWORD *)(a1 + 72), *(const void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 96), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
    if (FigEndpointAuthRequestHandler_HasEndpoint(*(_QWORD *)(a1 + 40)))
      FigEndpointUIAgentHelper_CleanupPrompt(v27, (uint64_t)v26, (uint64_t)v24, 0);
    v29[0] = 0;
    FigRoutingManagerContextUtilities_CopyCurrentlyActivatingSubEndpoints(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), (uint64_t)v29);
    if (!v29[0] || !CFArrayGetCount((CFArrayRef)v29[0]))
      FigRoutingManagerContextUtilities_SetPickingState(*(_QWORD *)(a1 + 64), 0);
    FigRoutingManagerCleanupSystemMusicIfAggregateIsEmpty(*(CFTypeRef *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
    if (v29[0])
      CFRelease(v29[0]);
  }
LABEL_46:
  v19 = *(const void **)(a1 + 88);
  if (v19)
    CFRelease(v19);
  v20 = *(const void **)(a1 + 80);
  if (v20)
    CFRelease(v20);
  v21 = *(const void **)(a1 + 64);
  if (v21)
    CFRelease(v21);
  v22 = *(const void **)(a1 + 40);
  if (v22)
    CFRelease(v22);
  v23 = *(const void **)(a1 + 72);
  if (v23)
    CFRelease(v23);
  if (v25)
  {
    CFRelease(v25);
    v25 = 0;
  }
  if (v24)
  {
    CFRelease(v24);
    v24 = 0;
  }
  if (v26)
  {
    CFRelease(v26);
    v26 = 0;
  }
  if (v27)
  {
    CFRelease(v27);
    v27 = 0;
  }

}

@end
