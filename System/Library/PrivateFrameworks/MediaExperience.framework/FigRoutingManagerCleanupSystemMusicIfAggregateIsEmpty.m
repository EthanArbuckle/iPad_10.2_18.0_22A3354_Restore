@implementation FigRoutingManagerCleanupSystemMusicIfAggregateIsEmpty

void __FigRoutingManagerCleanupSystemMusicIfAggregateIsEmpty_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v3;
  __CFDictionary *Mutable;
  uint64_t v5;
  CFIndex Count;
  _BOOL4 IsSystemAudioRouteWHAGroupableLocal;
  NSObject *v8;
  NSObject *v9;
  __CFArray *ArrayFromEndpoint;
  const void *v11;
  const void *v12;
  NSObject *v13;
  CFArrayRef theArray[25];

  theArray[23] = *(CFArrayRef *)MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    if (dword_1EE2B3E28)
    {
      LODWORD(theArray[0]) = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMUtility_InterruptSessionsWithRoutingContextUUID();
  }
  v3 = FigRoutingManagerCopyLocalAirPlayEndpoint();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("RouteChangeOptionKey_UserPickedRoute"), (const void *)*MEMORY[0x1E0C9AE40]);
  CFDictionarySetValue(Mutable, CFSTR("initiator"), CFSTR("SelectRouteInitiator_CleanupSystemMusic"));
  if (v3)
  {
    theArray[0] = 0;
    FigRoutingManagerCopyAirPlayEndpointsInUseForFeatures(v5, theArray, 0, 0, 0);
    if (theArray[0])
    {
      Count = CFArrayGetCount(theArray[0]);
      IsSystemAudioRouteWHAGroupableLocal = FigRoutingManagerUtilities_IsSystemAudioRouteWHAGroupableLocal();
      if (Count)
      {
        FigRoutingManagerLogEndpointIDs((uint64_t)CFSTR("The following AirPlay endpoints are activating: "), theArray[0], 0, 1);
LABEL_20:
        if (theArray[0])
          CFRelease(theArray[0]);
        goto LABEL_22;
      }
    }
    else
    {
      IsSystemAudioRouteWHAGroupableLocal = FigRoutingManagerUtilities_IsSystemAudioRouteWHAGroupableLocal();
    }
    if (IsSystemAudioRouteWHAGroupableLocal
      || FigRoutingManagerUtilities_IsSystemAudioRouteNull()
      || FigRoutingManagerUtilities_IsSystemAudioRouteAirPlayLowLatency())
    {
      if (dword_1EE2B3E28)
      {
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      ArrayFromEndpoint = FigRoutingManagerCreateArrayFromEndpoint(v3);
      FigRoutingManagerPickEndpointsForContext(*(_QWORD *)(a1 + 32), ArrayFromEndpoint, 0, Mutable);
      if (ArrayFromEndpoint)
        CFRelease(ArrayFromEndpoint);
    }
    else if (dword_1EE2B3E28)
    {
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_20;
  }
  if (dword_1EE2B3E28)
  {
    LODWORD(theArray[0]) = 0;
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  FigRoutingManagerPickRouteDescriptorsForContext(*(_QWORD *)(a1 + 32), 0, 0, (uint64_t)Mutable);
LABEL_22:
  if (Mutable)
    CFRelease(Mutable);
  if (v3)
    CFRelease(v3);
  v11 = *(const void **)(a1 + 40);
  if (v11)
    CFRelease(v11);
  v12 = *(const void **)(a1 + 32);
  if (v12)
    CFRelease(v12);
}

@end
