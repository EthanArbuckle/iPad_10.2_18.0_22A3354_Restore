@implementation FigRouteDiscoveryManagerLowerBTDiscoveryModeFromDetailed

void __FigRouteDiscoveryManagerLowerBTDiscoveryModeFromDetailed_block_invoke(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __FigRouteDiscoveryManagerLowerBTDiscoveryModeFromDetailed_block_invoke_2;
  v1[3] = &__block_descriptor_40_e5_v8__0l;
  v1[4] = *(_QWORD *)(a1 + 32);
  FigRouteDiscoveryManagerRunBlockWhileEndpointManagerInfoLockIsLocked((uint64_t)v1);
}

void __FigRouteDiscoveryManagerLowerBTDiscoveryModeFromDetailed_block_invoke_2(uint64_t a1)
{
  CFIndex i;
  const __CFArray *Count;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  CFTypeRef v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void (*v8)(const void *, _QWORD, _QWORD);

  for (i = 0; ; ++i)
  {
    Count = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 240);
    if (Count)
      Count = (const __CFArray *)CFArrayGetCount(Count);
    if (i >= (uint64_t)Count)
      break;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 240), i);
    Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("EndpointManager_RefKey"));
    CFDictionaryGetValue(ValueAtIndex, CFSTR("EndpointManager_TypeKey"));
    if (FigCFEqual())
    {
      v6 = discoveryManager_copyHighestRequestedDiscoveryModeForEndpointManager(ValueAtIndex, 0);
      if (Value && FigCFEqual())
      {
        if (dword_1EE2B3DE8)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v8 = *(void (**)(const void *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
        if (v8)
          v8(Value, *MEMORY[0x1E0CA39E0], 0);
      }
      if (v6)
        CFRelease(v6);
      return;
    }
  }
}

@end
