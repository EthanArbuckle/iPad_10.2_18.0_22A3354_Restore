@implementation FigRoutingManagerHandleFigEndpointDescriptionChangedNotificationFromCache

void __FigRoutingManagerHandleFigEndpointDescriptionChangedNotificationFromCache_block_invoke(uint64_t *a1)
{
  CFTypeRef v2;
  uint64_t v3;
  uint64_t CMBaseObject;
  void (*v5)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  CFIndex Count;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, _BYTE *);
  CFIndex v10;
  const void *ValueAtIndex;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, CFStringRef *);
  CFTypeRef v14;
  const void *v15;
  CFTypeRef v16;
  __CFArray *v17;
  uint64_t v18;
  void (*v19)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v20;
  void (*v21)(uint64_t, _QWORD, uint64_t, CFStringRef *);
  uint64_t v22;
  void (*v23)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v25;
  unsigned int v26;
  const void *v27;
  const void *v28;
  const void *v29;
  CFTypeRef v30;
  os_log_type_t type;
  unsigned int v32;
  CFTypeRef cf;
  CFStringRef theString;
  CFTypeRef v35;
  _BYTE prefix[12];
  __int16 v37;
  CFTypeRef v38;
  __int16 v39;
  CFStringRef v40;
  __int16 v41;
  CFTypeRef v42;
  CFArrayRef theArray[18];

  theArray[16] = *(CFArrayRef *)MEMORY[0x1E0C80C00];
  v2 = (CFTypeRef)*MEMORY[0x1E0C9AE40];
  v30 = (CFTypeRef)*MEMORY[0x1E0C9AE40];
  v3 = *MEMORY[0x1E0C9AE00];
  CMBaseObject = FigEndpointGetCMBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v5)
  {
    v5(CMBaseObject, *MEMORY[0x1E0CA4260], v3, &v30);
    v2 = v30;
  }
  if (v2 == (CFTypeRef)*MEMORY[0x1E0C9AE50])
  {
    theArray[0] = 0;
    FigRoutingManagerContextUtilities_CopyAllRoutingContextUUIDs((uint64_t)theArray);
    if (theArray[0])
      Count = CFArrayGetCount(theArray[0]);
    else
      Count = 0;
    *(_QWORD *)prefix = 0;
    v7 = *MEMORY[0x1E0CA4258];
    v8 = FigEndpointGetCMBaseObject();
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t, _BYTE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v9)
      v9(v8, v7, v3, prefix);
    if (Count >= 1)
    {
      v10 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray[0], v10);
        if (!MX_FeatureFlags_IsSystemRemoteDisplayContextEnabled()
          || !FigRoutingManagerContextUtilities_IsContextSystemRemoteDisplay((uint64_t)ValueAtIndex))
        {
          break;
        }
        FigRoutingManagerHandleDescriptionChangedForRemoteDisplay(a1[4], a1[5]);
LABEL_35:
        if (Count == ++v10)
          goto LABEL_36;
      }
      v35 = 0;
      FigRoutingManagerContextUtilities_CopyPickedEndpointAtIndex((uint64_t)ValueAtIndex, 0, (uint64_t)&v35);
      theString = 0;
      if (v35)
      {
        v12 = FigEndpointGetCMBaseObject();
        v13 = *(void (**)(uint64_t, uint64_t, uint64_t, CFStringRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
        if (v13)
          v13(v12, v7, v3, &theString);
      }
      v14 = v35;
      if (v35 != (CFTypeRef)a1[4])
      {
        if (!*(_QWORD *)prefix || !theString)
          goto LABEL_22;
        if (!CFStringHasPrefix(theString, *(CFStringRef *)prefix))
        {
          v14 = v35;
LABEL_22:
          if (!FigRoutingManagerIsEndpointOfType((uint64_t)v14))
            goto LABEL_31;
          v15 = (const void *)a1[4];
          v16 = v35;
          if (!v35 || (FigEndpointAggregateGetClassID(), !CMBaseObjectIsMemberOfClass()))
            v16 = 0;
          if (!FigRoutingManagerIsEndpointPresentInAggregate(v15, (uint64_t)v16))
            goto LABEL_31;
        }
      }
      FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers((uint64_t)ValueAtIndex, 0, CFSTR("configUpdateReasonEndpointDescriptorChanged"));
      cf = 0;
      FigRoutingManagerContextUtilities_CopyPickedIndividualEndpoints((uint64_t)ValueAtIndex, (CFMutableArrayRef *)&cf);
      v17 = FigEndpointDescriptorUtility_CopyDescriptorsForEndpoints((const __CFArray *)cf, 0);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      FigRoutingManagerContextUtilities_UpdateRouteDescriptorForGivenContext((uint64_t)ValueAtIndex, (uint64_t)v17);
      if (v17)
        CFRelease(v17);
LABEL_31:
      if (theString)
      {
        CFRelease(theString);
        theString = 0;
      }
      if (v35)
        CFRelease(v35);
      goto LABEL_35;
    }
LABEL_36:
    if (*(_QWORD *)prefix)
    {
      CFRelease(*(CFTypeRef *)prefix);
      *(_QWORD *)prefix = 0;
    }
    if (theArray[0])
      CFRelease(theArray[0]);
  }
  if (FigRoutingManagerIsEndpointOfType(a1[4]))
  {
    v35 = 0;
    v18 = FigEndpointGetCMBaseObject();
    v19 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v19)
      v19(v18, *MEMORY[0x1E0CA4348], v3, &v35);
    theString = 0;
    v20 = FigEndpointGetCMBaseObject();
    v21 = *(void (**)(uint64_t, _QWORD, uint64_t, CFStringRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
    if (v21)
      v21(v20, *MEMORY[0x1E0CA4138], v3, &theString);
    cf = 0;
    v22 = FigEndpointGetCMBaseObject();
    v23 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v23)
      v23(v22, *MEMORY[0x1E0CA4338], v3, &cf);
    if (dword_1EE2B3E28)
    {
      v32 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v25 = v32;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v26 = v25;
      else
        v26 = v25 & 0xFFFFFFFE;
      if (v26)
      {
        *(_DWORD *)prefix = 136315906;
        *(_QWORD *)&prefix[4] = "routingManager_logBluetoothInfo";
        v37 = 2114;
        v38 = v35;
        v39 = 2114;
        v40 = theString;
        v41 = 2114;
        v42 = cf;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (theString)
    {
      CFRelease(theString);
      theString = 0;
    }
    if (v35)
      CFRelease(v35);
  }
  if (v30)
  {
    CFRelease(v30);
    v30 = 0;
  }
  v27 = (const void *)a1[4];
  if (v27)
    CFRelease(v27);
  v28 = (const void *)a1[5];
  if (v28)
    CFRelease(v28);
  v29 = (const void *)a1[6];
  if (v29)
    CFRelease(v29);
}

@end
