@implementation FigRoutingManagerAggregateRemoveEndpointCompletionCallback

void __FigRoutingManagerAggregateRemoveEndpointCompletionCallback_block_invoke(uint64_t a1)
{
  uint64_t CMBaseObject;
  void (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __CFArray *v5;
  char v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  CFTypeRef v12;
  CFArrayRef theArray;
  CFTypeRef cf[17];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v12 = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    CMBaseObject = FigEndpointGetCMBaseObject();
    v3 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v3)
      v3(CMBaseObject, *MEMORY[0x1E0CA4348], *MEMORY[0x1E0C9AE00], &v12);
  }
  if (dword_1EE2B3E28)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  cf[0] = 0;
  FigRoutingManagerContextUtilities_CopyPickedIndividualEndpoints(*(_QWORD *)(a1 + 64), (CFMutableArrayRef *)cf);
  v5 = FigEndpointDescriptorUtility_CopyDescriptorsForEndpoints((const __CFArray *)cf[0], 0);
  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  FigRoutingManagerContextUtilities_UpdateRouteDescriptorForGivenContext(*(_QWORD *)(a1 + 64), (uint64_t)v5);
  FigVolumeControllerSaveRoutingContextState(*(const void **)(a1 + 64));
  if (v5)
    CFRelease(v5);
  FigCFDictionaryGetBooleanIfPresent();
  FigRoutingManagerCrossfadePlayback();
  FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(_QWORD *)(a1 + 64), *(const __CFDictionary **)(a1 + 80), CFSTR("configUpdateReasonGroupDevicesChanged"));
  theArray = 0;
  FigRoutingManagerContextUtilities_CopyCurrentlyActivatingSubEndpoints(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), (uint64_t)&theArray);
  if (!theArray || !CFArrayGetCount(theArray))
    FigRoutingManagerContextUtilities_SetPickingState(*(_QWORD *)(a1 + 64), 0);
  v6 = FigRoutingManagerAggregateShouldEndpointRemovalInterruptSystemMusicSessions(0, 0, *(uint64_t **)(a1 + 96));
  FigRoutingManagerCleanupSystemMusicIfAggregateIsEmpty(*(CFTypeRef *)(a1 + 88), *(_QWORD *)(a1 + 48), v6);
  FigRoutingMangerDeactivateAggregateEndpointIfNecessary(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88));
  FigVolumeControllerRecomputeMainVolume(*(const void **)(a1 + 64), 0.0);
  FigRoutingManagerDestroyAggregateAddEndpointCompletionContext(*(const void ***)(a1 + 96));
  if (theArray)
  {
    CFRelease(theArray);
    theArray = 0;
  }
  if (v12)
  {
    CFRelease(v12);
    v12 = 0;
  }
  v7 = *(const void **)(a1 + 40);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 88);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 64);
  if (v9)
    CFRelease(v9);
  v10 = *(const void **)(a1 + 80);
  if (v10)
    CFRelease(v10);
  v11 = *(const void **)(a1 + 72);
  if (v11)
    CFRelease(v11);

}

@end
