@implementation FigRoutingManagerAvailableEndpointsDidChangeForEndpointManager

void __FigRoutingManagerAvailableEndpointsDidChangeForEndpointManager_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  CFTypeRef EndpointToAutoConnect;
  const void *v6;
  CFIndex v7;
  const __CFArray *Count;
  const void *ValueAtIndex;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFArray *v13;
  const __CFArray *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  uint64_t v19;
  CFTypeRef v20;
  CFTypeRef v21;
  CFTypeRef v22;
  CFTypeRef cf[18];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v22 = 0;
  v2 = *MEMORY[0x1E0C9AE00];
  CMBaseObject = FigEndpointManagerGetCMBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v4)
    v4(CMBaseObject, *MEMORY[0x1E0CA3A40], v2, &v22);
  EndpointToAutoConnect = FigRoutingManagerCopyFirstEndpointToAutoConnect(*(CFArrayRef *)(a1 + 40));
  if (EndpointToAutoConnect)
  {
    v6 = EndpointToAutoConnect;
    FigRoutingManagerProcessEndpointToAutoconnect(EndpointToAutoConnect);
    CFRelease(v6);
  }
  if (FigCFEqual()
    || FigCFEqual()
    || FigCFEqual()
    || FigCFEqual())
  {
    v7 = 0;
    v19 = *MEMORY[0x1E0CA43D0];
    while (1)
    {
      Count = *(const __CFArray **)(a1 + 48);
      if (Count)
        Count = (const __CFArray *)CFArrayGetCount(Count);
      if (v7 >= (uint64_t)Count)
        break;
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v7);
      if (FigRoutingManagerIsEndpointNonRemoteControlLocalAirPlay((uint64_t)ValueAtIndex)
        && !CMSMDeviceState_IsHomePodHub())
      {
        v20 = 0;
        v21 = 0;
        FigRoutingManagerContextUtilities_CopySystemMusicContextUUID((uint64_t)&v21);
        FigRoutingManagerContextUtilities_CopyAggregateEndpointAsFigEndpoint((uint64_t)v21, (uint64_t)&v20);
        if (FigRoutingManagerIsConfigurationWHASilentPrimary((uint64_t)v21))
        {
          cf[0] = 0;
          if (v20)
          {
            v10 = FigEndpointGetCMBaseObject();
            v11 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 48);
            if (v11)
              v11(v10, v19, v2, cf);
          }
          FigRoutingManagerLogEndpointIDs((uint64_t)CFSTR("FigRoutingManager_iOSHandleAvailableEndpointsDidChangeNotification - Skip adding local endpoint to aggregate. The sub-endpoints in the aggregate are: "), (const __CFArray *)cf[0], 0, 1);
          if (cf[0])
            CFRelease(cf[0]);
        }
        else
        {
          if (dword_1EE2B3E28)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          FigRoutingManagerAggregateAddLocalAirPlayEndpoint(v21, (void *)v20);
        }
        if (v20)
        {
          CFRelease(v20);
          v20 = 0;
        }
        if (v21)
          CFRelease(v21);
      }
      ++v7;
    }
  }
  else if (FigCFEqual())
  {
    if ((v13 = *(const __CFArray **)(a1 + 48)) != 0 && CFArrayGetCount(v13) > 0
      || (v14 = *(const __CFArray **)(a1 + 56)) != 0 && CFArrayGetCount(v14) >= 1)
    {
      cf[0] = 0;
      FigRoutingManagerContextUtilities_CopySidePlayContextUUID((uint64_t)cf);
      FigRoutingManagerContextUtilities_PostNotificationToClientsOfContextWithUUIDAndItsFollowers((uint64_t)cf[0], (uint64_t)CFSTR("currentRouteChanged"), 0);
      if (cf[0])
        CFRelease(cf[0]);
    }
  }
  v15 = *(const void **)(a1 + 32);
  if (v15)
    CFRelease(v15);
  v16 = *(const void **)(a1 + 40);
  if (v16)
    CFRelease(v16);
  v17 = *(const void **)(a1 + 48);
  if (v17)
    CFRelease(v17);
  v18 = *(const void **)(a1 + 56);
  if (v18)
    CFRelease(v18);
  if (v22)
    CFRelease(v22);
}

@end
