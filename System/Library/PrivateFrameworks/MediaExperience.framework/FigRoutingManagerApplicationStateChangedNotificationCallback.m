@implementation FigRoutingManagerApplicationStateChangedNotificationCallback

void __FigRoutingManagerApplicationStateChangedNotificationCallback_block_invoke(uint64_t a1)
{
  CFIndex Count;
  CFIndex v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;
  const void *v7;
  const void *Value;
  CFArrayRef v9;
  CFArrayRef theArray;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  theArray = 0;
  FigRoutingManagerContextUtilities_CopyEndpointsToDeactivateInfoAndUUIDsForPID(*(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), &theArray, &v9);
  if (!theArray)
    goto LABEL_12;
  Count = CFArrayGetCount(theArray);
  v2 = Count;
  if (Count < 1 || dword_1EE2B3E28 == 0)
  {
    if (Count < 1)
      goto LABEL_10;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = 0;
  do
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v5);
    v7 = CFArrayGetValueAtIndex(v9, v5);
    Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("ActivatedEndpointsInfo_Endpoint"));
    v11 = 0;
    FigCFDictionaryGetInt64IfPresent();
    FigRoutingManager_iOSDeactivateEndpoint(Value, v11);
    FigRoutingManagerContextUtilities_SetPickedEndpoints(v7, 0, (uint64_t)CFSTR("configUpdateReasonEndedApplicationStateChanged"), 0, 0);
    ++v5;
  }
  while (v2 != v5);
LABEL_10:
  if (theArray)
  {
    CFRelease(theArray);
    theArray = 0;
  }
LABEL_12:
  if (v9)
    CFRelease(v9);
}

@end
