@implementation FigRoutingManager

dispatch_queue_t __FigRoutingManager_GetDataTransmissionQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.mx.datatransmissionqueue", v0);
  FigRoutingManager_GetDataTransmissionQueue_dataTransmissionQueue = (uint64_t)result;
  return result;
}

void __FigRoutingManager_CloseRelayCommChannels_block_invoke(uint64_t a1)
{
  CFTypeRef v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void (*v3)(CFTypeRef);
  CFTypeRef cf[23];

  cf[22] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  FigRoutingManagerContextUtilities_CopyFigEndpointFromAggregateEndpointForClientUse(*(_QWORD *)(a1 + 32), (uint64_t)cf);
  v1 = cf[0];
  if (cf[0])
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      if (dword_1EE2B3E28)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v3 = *(void (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 144);
      if (v3)
        v3(v1);
    }
    if (cf[0])
      CFRelease(cf[0]);
  }
}

void __FigRoutingManager_iOSEndpointActivateCompletionCallback_block_invoke(uint64_t a1)
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
  CFTypeRef v13;
  CFTypeRef v14;
  CFTypeRef v15;
  int v16;
  CFTypeRef v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  CFArrayRef v21;
  NSObject *v22;
  uint64_t v23;
  void (*v24)(uint64_t, _QWORD, _QWORD, os_log_type_t *);
  NSObject *v25;
  const __CFArray *v26;
  const __CFString *v27;
  __CFArray *Mutable;
  __CFArray *v29;
  const void *v30;
  const __CFArray *v31;
  NSObject *v32;
  int v33;
  const void *v34;
  const void *v35;
  const void *v36;
  const void *v37;
  os_log_type_t v38[8];
  char v39;
  CFArrayRef theArray;
  os_log_type_t type[8];
  CFTypeRef cf;
  CFTypeRef v43;
  CFTypeRef v44;
  CFTypeRef v45;
  CFTypeRef v46;
  uint64_t valuePtr;
  CFNumberRef v48[17];

  v48[16] = *(CFNumberRef *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v45 = 0;
  v46 = 0;
  v43 = 0;
  v44 = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = *MEMORY[0x1E0C9AE00];
    CMBaseObject = FigEndpointGetCMBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v4)
      v4(CMBaseObject, *MEMORY[0x1E0CA4348], v2, &v46);
    v5 = FigEndpointGetCMBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v6)
      v6(v5, *MEMORY[0x1E0CA4258], v2, &v45);
    v7 = FigEndpointGetCMBaseObject();
    v8 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v8)
      v8(v7, *MEMORY[0x1E0CA4128], v2, &v44);
    v9 = FigEndpointGetCMBaseObject();
    v10 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v10)
      v10(v9, *MEMORY[0x1E0CA4310], v2, &v43);
  }
  if (dword_1EE2B3E28)
  {
    LODWORD(cf) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  cf = 0;
  FigRoutingManagerContextUtilities_CopyMostRecentCurrentlyActivatingEndpoint(*(_QWORD *)(a1 + 64), &cf);
  v12 = *(_DWORD *)(a1 + 104);
  if (v12 == -16727)
    goto LABEL_93;
  if (v12)
  {
    FigRoutingManagerCrossfadePlayback();
    if (FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
      FigEndpointUIAgentHelper_CleanupPrompt(v46, (uint64_t)v45, (uint64_t)v43, 0);
    if (cf == *(CFTypeRef *)(a1 + 40))
    {
      if (FigRoutingManagerIsEndpointOfType((uint64_t)cf))
        FigRoutingManagerProcessCarPlayEndpointDeactivation(1);
      FigRoutingManager_iOSHandleEndpointActivationError(*(const void **)(a1 + 40), *(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    }
    goto LABEL_93;
  }
  if (FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
  {
    v14 = v45;
    v13 = v46;
    v15 = v43;
    v16 = FigCFEqual();
    FigEndpointUIAgentHelper_CleanupPrompt(v13, (uint64_t)v14, (uint64_t)v15, v16);
  }
  v17 = *(CFTypeRef *)(a1 + 40);
  if (cf != v17 && !FigRoutingManagerIsEndpointOfType((uint64_t)v17))
  {
    *(_QWORD *)type = 0;
    if (cf)
    {
      v23 = FigEndpointGetCMBaseObject();
      v24 = *(void (**)(uint64_t, _QWORD, _QWORD, os_log_type_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
      if (v24)
        v24(v23, *MEMORY[0x1E0CA4348], *MEMORY[0x1E0C9AE00], type);
    }
    if (!FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
    {
      if (dword_1EE2B3E28)
      {
        LODWORD(theArray) = 0;
        v38[0] = OS_LOG_TYPE_DEFAULT;
        v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      FigRoutingManager_iOSDeactivateEndpoint(*(const void **)(a1 + 40), *(_QWORD *)(a1 + 48));
      FigRoutingManagerContextUtilities_ResetCurrentlyActivatingEndpointInfo(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), (uint64_t)CFSTR("configUpdateReasonEndedUserCancelled"));
    }
    if (*(_QWORD *)type)
    {
      CFRelease(*(CFTypeRef *)type);
      *(_QWORD *)type = 0;
    }
    FigRoutingManagerContextUtilities_SetPickingState(*(_QWORD *)(a1 + 64), 0);
    goto LABEL_93;
  }
  FigRoutingManagerContextUtilities_SetPickingState(*(_QWORD *)(a1 + 64), 7);
  FigRoutingManagerRegisterForFigEndpointNotifications(*(_QWORD *)(a1 + 40));
  if (FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
  {
    v48[0] = 0;
    v18 = *(_QWORD *)(a1 + 56);
    valuePtr = v18;
    v19 = FigEndpointGetCMBaseObject();
    v20 = *(void (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v20)
    {
      v20(v19, *MEMORY[0x1E0CA40A8], *MEMORY[0x1E0C9AE00], v48);
      if (v48[0])
      {
        CFNumberGetValue(v48[0], kCFNumberSInt64Type, &valuePtr);
        LOBYTE(v18) = valuePtr;
      }
    }
    FigRoutingManager_iOSHandleFigEndpointFeaturesActivation(*(void **)(a1 + 40), v18, *(_QWORD *)(a1 + 48), *(const void **)(a1 + 64), *(_QWORD *)(a1 + 72));
    FigRoutingManagerContextUtilities_AddActivatedEndpoint(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), valuePtr, *(_QWORD *)(a1 + 48));
    v21 = v48[0];
    if (!v48[0])
      goto LABEL_93;
LABEL_73:
    CFRelease(v21);
    goto LABEL_93;
  }
  if (!FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
  {
    if (!FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40))
      || CMSMDeviceState_IsHomePodHub())
    {
LABEL_89:
      FigRoutingManager_iOSHandleFigEndpointFeaturesActivation(*(void **)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(const void **)(a1 + 64), *(_QWORD *)(a1 + 72));
      FigRoutingManagerContextUtilities_AddActivatedEndpoint(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
      if (FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
      {
        if (MX_FeatureFlags_IsSystemRemoteDisplayContextEnabled())
          FigRoutingManagerNotifyClientsOfCarPlayActivation();
        CMSMNotificationUtility_PostCarPlayIsConnectedDidChange(1);
        notify_post("com.apple.coremedia.carplayisconnected");
        v33 = FigRoutingManager_iOSIsCarPlayAuxStreamSupported();
        CMSMNotificationUtility_PostCarPlayAuxStreamSupportDidChange(v33);
        FigRoutingManagerUtilities_RegisterAirPlayStreamCapabilitiesDidChangeListener(0, *(_QWORD *)(a1 + 40));
      }
      goto LABEL_93;
    }
    *(_QWORD *)type = 0;
    FigEndpointCopyProperty(*(_QWORD *)(a1 + 40), *MEMORY[0x1E0CA43D0], *MEMORY[0x1E0C9AE00], (uint64_t)type);
    theArray = 0;
    FigRoutingManagerContextUtilities_CopyCurrentlyActivatingSubEndpoints(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), (uint64_t)&theArray);
    if ((!theArray || !CFArrayGetCount(theArray)) && (!*(_QWORD *)type || !CFArrayGetCount(*(CFArrayRef *)type)))
    {
      if (dword_1EE2B3E28)
      {
        *(_DWORD *)v38 = 0;
        v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      FigRoutingManagerAggregateAddLocalAirPlayEndpoint(*(const void **)(a1 + 64), *(void **)(a1 + 40));
      goto LABEL_85;
    }
    if (theArray && CFArrayGetCount(theArray))
    {
      v26 = theArray;
      v27 = CFSTR("There are currently activating SubEndpoints: ");
    }
    else
    {
      if (!*(_QWORD *)type || !CFArrayGetCount(*(CFArrayRef *)type))
        goto LABEL_85;
      v26 = *(const __CFArray **)type;
      v27 = CFSTR("There are activated SubEndpoints: ");
    }
    FigRoutingManagerLogEndpointIDs((uint64_t)v27, v26, 0, 1);
LABEL_85:
    if (theArray)
    {
      CFRelease(theArray);
      theArray = 0;
    }
    if (*(_QWORD *)type)
      CFRelease(*(CFTypeRef *)type);
    goto LABEL_89;
  }
  *(_QWORD *)type = 0;
  FigRoutingManagerContextUtilities_CopyCurrentlyActivatingEndpoints(*(_QWORD *)(a1 + 64), (uint64_t)type);
  theArray = 0;
  FigRoutingManagerContextUtilities_CopyMostRecentCurrentlyActivatingEndpoint(*(_QWORD *)(a1 + 64), &theArray);
  if (!CMSMVAUtility_IsA2DPPortAvailableForEndpoint(*(_QWORD *)(a1 + 40), 0))
  {
    FigRoutingManagerContextUtilities_SetPickingState(*(_QWORD *)(a1 + 64), 8);
    goto LABEL_70;
  }
  v39 = 0;
  FigCFDictionaryGetBooleanIfPresent();
  *(_QWORD *)v38 = 0;
  FigRoutingManagerContextUtilities_CopyPickedEndpointAtIndex(*(_QWORD *)(a1 + 64), 0, (uint64_t)v38);
  if (dword_1EE2B3E28)
  {
    v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v29 = Mutable;
  if (Mutable)
  {
    if (*(_QWORD *)v38)
      CFArrayAppendValue(Mutable, *(const void **)v38);
    CFArrayAppendValue(v29, *(const void **)(a1 + 40));
  }
  if (!v39)
    goto LABEL_64;
  if (!*(_QWORD *)type
    || CFArrayGetCount(*(CFArrayRef *)type) < 2
    || !FigRoutingManagerAreAllEndpointsBluetoothShareable(*(const __CFArray **)type))
  {
    if (v29
      && FigRoutingManagerIsEndpointBluetoothShareable(*(uint64_t *)v38)
      && FigRoutingManagerIsEndpointBluetoothShareable(*(_QWORD *)(a1 + 40)))
    {
      v30 = *(const void **)(a1 + 64);
      v31 = v29;
      goto LABEL_63;
    }
LABEL_64:
    if (FigRoutingManagerIsEndpointOfType((uint64_t)theArray))
      FigRoutingManagerRouteToBluetoothDevice(*(const void **)(a1 + 64), (uint64_t)theArray);
    goto LABEL_66;
  }
  v30 = *(const void **)(a1 + 64);
  v31 = *(const __CFArray **)type;
LABEL_63:
  FigRoutingManagerEnableBluetoothSharingSession(v30, v31);
LABEL_66:
  if (*(_QWORD *)v38)
  {
    CFRelease(*(CFTypeRef *)v38);
    *(_QWORD *)v38 = 0;
  }
  if (v29)
    CFRelease(v29);
LABEL_70:
  if (*(_QWORD *)type)
  {
    CFRelease(*(CFTypeRef *)type);
    *(_QWORD *)type = 0;
  }
  v21 = theArray;
  if (theArray)
    goto LABEL_73;
LABEL_93:
  FigRoutingManagerDestroyEndpointActivateCompletionContext(*(CFTypeRef **)(a1 + 96));
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v46)
  {
    CFRelease(v46);
    v46 = 0;
  }
  if (v44)
  {
    CFRelease(v44);
    v44 = 0;
  }
  if (v43)
  {
    CFRelease(v43);
    v43 = 0;
  }
  if (v45)
  {
    CFRelease(v45);
    v45 = 0;
  }
  v34 = *(const void **)(a1 + 64);
  if (v34)
    CFRelease(v34);
  v35 = *(const void **)(a1 + 40);
  if (v35)
    CFRelease(v35);
  v36 = *(const void **)(a1 + 72);
  if (v36)
    CFRelease(v36);
  v37 = *(const void **)(a1 + 80);
  if (v37)
    CFRelease(v37);

}

void __FigRoutingManager_iOSEndpointDeactivateCompletionCallback_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef *v6;
  int v7;
  uint64_t v8;
  int IsMemberOfClass;
  const void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD, _QWORD, CFArrayRef *);
  CFIndex Count;
  CFIndex v14;
  CFIndex i;
  const void *ValueAtIndex;
  int v17;
  const void *v18;
  CFTypeRef v19;
  CFArrayRef theArray;
  CFTypeRef cf[17];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v19 = 0;
  v2 = (_QWORD *)MEMORY[0x1E0C9AE00];
  if (*(_QWORD *)(a1 + 40))
  {
    CMBaseObject = FigEndpointGetCMBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v4)
      v4(CMBaseObject, *MEMORY[0x1E0CA4348], *v2, &v19);
  }
  if (dword_1EE2B3E28)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = *(CFTypeRef **)(a1 + 64);
  if (v6)
  {
    cf[0] = *v6;
    if (cf[0])
    {
LABEL_8:
      v7 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    cf[0] = 0;
  }
  if (FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
  {
    FigRoutingManagerContextUtilities_CopySystemAudioContextUUID((uint64_t)cf);
    FigRoutingManagerUtilities_UnRegisterAirPlayStreamCapabilitiesDidChangeListener(0, *(const void **)(a1 + 40));
  }
  else
  {
    if (!FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
      goto LABEL_8;
    FigRoutingManagerContextUtilities_CopySystemMirroringContextUUID((uint64_t)cf);
  }
  v7 = 1;
LABEL_15:
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    FigEndpointAggregateGetClassID();
    IsMemberOfClass = CMBaseObjectIsMemberOfClass();
    v10 = *(const void **)(a1 + 40);
    if (!IsMemberOfClass)
      goto LABEL_26;
    theArray = 0;
    v11 = FigEndpointGetCMBaseObject();
    v12 = *(void (**)(uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v12)
    {
      v12(v11, *MEMORY[0x1E0CA43D0], *v2, &theArray);
      if (!theArray)
      {
LABEL_24:
        v10 = *(const void **)(a1 + 40);
        goto LABEL_26;
      }
      Count = CFArrayGetCount(theArray);
      if (Count >= 1)
      {
        v14 = Count;
        for (i = 0; i != v14; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
          FigRoutingManagerRemoveEndpointFromAggregate(v8, ValueAtIndex, 0, 0, 0, (uint64_t)FigRoutingManagerAggregateRemoveEndpointCompletionCallback);
        }
      }
    }
    if (theArray)
      CFRelease(theArray);
    goto LABEL_24;
  }
  v10 = 0;
LABEL_26:
  FigRoutingManager_iOSHandleFigEndpointFeaturesDeactivation(v10, *(_QWORD *)(a1 + 56), (uint64_t)cf[0]);
  if (FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
    FigRoutingManagerProcessCarPlayEndpointDeactivation(1);
  FigRoutingManagerContextUtilities_RemoveActivatedEndpoint((uint64_t)cf[0], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40))
    || FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 40)))
  {
    FigRoutingManagerRemoveCachedDelegateContext(*(_QWORD *)(a1 + 40));
  }
  if (cf[0])
    v17 = v7;
  else
    v17 = 0;
  if (v17 == 1)
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  FigRoutingManagerDestroyEndpointDeactivateCompletionContext(*(const void ***)(a1 + 72));
  v18 = *(const void **)(a1 + 40);
  if (v18)
    CFRelease(v18);
  if (v19)
    CFRelease(v19);

}

void __FigRoutingManager_iOSDeactivateEndpoint_block_invoke(uint64_t a1)
{
  const void *v2;

  FigRoutingManagerStopDeactivateAirPlayEndpointTimer();
  FigRoutingManagerStopCarPlayAudioMainPortPublishedCheckTimer();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

void __FigRoutingManager_iOSHandleEndpointFailedDelegate_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  const __CFDictionary *v4;
  const void *Value;
  const __CFDictionary *v6;
  const void *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  __CFDictionary *MutableCopy;
  __CFDictionary *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t CMBaseObject;
  void (*v17)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *);
  uint64_t v18;
  void (*v19)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *);
  __CFDictionary *v20;
  uint64_t v21;
  void (*v22)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *);
  CFMutableDictionaryRef RouteConfigUpdatedFailedPayload;
  __CFDictionary *v24;
  uint64_t v25;
  const void *v26;
  const void *v27;
  const void *v28;
  __CFDictionary *v29;
  uint64_t v30;
  void (*v31)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *);
  uint64_t v32;
  void (*v33)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *);
  __CFDictionary *v34;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __CFDictionary *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  unsigned int v41;
  unsigned int v42;
  const void *v43;
  const void *v44;
  const void *v45;
  unsigned __int8 v46;
  __CFDictionary *v47;
  void *v48;
  os_log_type_t type[8];
  CFTypeRef v50;
  uint64_t v51;
  int v52;
  CFTypeRef v53;
  int v54;
  const char *v55;
  __int16 v56;
  CFTypeRef v57;
  __int16 v58;
  int v59;
  __int16 v60;
  const void *v61;
  CFTypeRef cf[18];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v53 = 0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v4 = *(const __CFDictionary **)(a1 + 32);
  if (!v4)
  {
    Value = 0;
    goto LABEL_7;
  }
  Value = CFDictionaryGetValue(v4, CFSTR("EndpointDelegateContextKey_RoutingContextUUID"));
  v6 = *(const __CFDictionary **)(a1 + 32);
  if (!v6)
  {
LABEL_7:
    v7 = 0;
LABEL_8:
    MutableCopy = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    goto LABEL_9;
  }
  v7 = CFDictionaryGetValue(v6, CFSTR("EndpointDelegateContextKey_ClientRouteChangeOptions"));
  v8 = *(const __CFDictionary **)(a1 + 32);
  if (!v8)
    goto LABEL_8;
  v9 = (const __CFDictionary *)CFDictionaryGetValue(v8, CFSTR("EndpointDelegateContextKey_InternalRouteChangeOptions"));
  if (!v9)
    goto LABEL_8;
  MutableCopy = CFDictionaryCreateMutableCopy(v2, 0, v9);
LABEL_9:
  v11 = MutableCopy;
  v12 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(MutableCopy, CFSTR("RouteChangeOptionKey_IsRemoveOperation"), (const void *)*MEMORY[0x1E0C9AE50]);
  v52 = 0;
  FigCFDictionaryGetInt32IfPresent();
  v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x1E0CA39C0]);
  v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x1E0CA3788]);
  if (MX_FeatureFlags_IsAirPlayDaemonEnabled(v14, v15)
    && FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 48))
    && !v14)
  {
    FigRoutingManagerHandleAggregateFailure(*(_QWORD *)(a1 + 48));
    goto LABEL_61;
  }
  if (FigRoutingManagerIsEndpointOfType(*(_QWORD *)(a1 + 48)))
  {
    v51 = 0;
    FigCFDictionaryGetInt64IfPresent();
    if (!v14)
    {
      LODWORD(v50) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_61;
    }
    if (FigRoutingManagerIsEndpointActivated((uint64_t)v14))
    {
      v50 = 0;
      CMBaseObject = FigEndpointGetCMBaseObject();
      v17 = *(void (**)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                       + 48);
      if (v17)
        v17(CMBaseObject, *MEMORY[0x1E0CA4258], v2, &v50);
      v18 = FigEndpointGetCMBaseObject();
      v19 = *(void (**)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                       + 48);
      if (v19)
        v19(v18, *MEMORY[0x1E0CA4348], v2, &v53);
      v20 = FigEndpointDescriptorUtility_CopyDescriptorForEndpoint((uint64_t)v14, 0);
      FigCFDictionarySetValue();
      FigCFDictionarySetValue();
      v47 = v20;
      FigCFDictionarySetValue();
      if (v52)
      {
        cf[0] = 0;
        v21 = FigEndpointGetCMBaseObject();
        v22 = *(void (**)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                         + 48);
        if (v22)
          v22(v21, *MEMORY[0x1E0CA43D0], v2, cf);
        RouteConfigUpdatedFailedPayload = FigRoutingContextUtilities_CreateRouteConfigUpdatedFailedPayload(0, (uint64_t)v50, v52, (const __CFArray *)cf[0]);
        FigRoutingManagerContextUtilities_PostNotificationToClientsOfContextWithUUIDAndItsFollowers((uint64_t)Value, (uint64_t)CFSTR("routeConfigUpdated"), (uint64_t)RouteConfigUpdatedFailedPayload);
        if (RouteConfigUpdatedFailedPayload)
          CFRelease(RouteConfigUpdatedFailedPayload);
        if (cf[0])
          CFRelease(cf[0]);
      }
      *(_QWORD *)type = 0;
      FigRoutingManagerContextUtilities_CopyAggregateEndpointAsFigEndpointAggregate((uint64_t)Value, (uint64_t)type);
      if (*(_QWORD *)type)
      {
        v48 = 0;
        v24 = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionarySetValue(v24, CFSTR("RouteChangeOptionKey_IsRemoveOperation"), v12);
        FigRoutingManagerCreateAggregateAddEndpointCompletionContext(Value, v24, v24, &v48);
        v46 = FigRoutingManagerAggregateShouldEndpointRemovalInterruptSystemMusicSessions(*(uint64_t *)type, v14, (uint64_t *)v48);
        FigRoutingManagerDestroyAggregateAddEndpointCompletionContext((const void **)v48);
        if (v24)
          CFRelease(v24);
        if (*(_QWORD *)(a1 + 32))
        {
          FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers((uint64_t)Value, 0, CFSTR("configUpdateReasonEndedFailed"));
          v25 = *(_QWORD *)type;
          v26 = v14;
          v27 = Value;
          v28 = v7;
          v29 = v11;
        }
        else
        {
          v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v25 = *(_QWORD *)type;
          v26 = v14;
          v27 = 0;
          v28 = 0;
          v29 = 0;
        }
        if (FigRoutingManagerRemoveEndpointFromAggregate(v25, v26, v27, v28, v29, (uint64_t)FigRoutingManagerAggregateRemoveEndpointCompletionCallback))
        {
          v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        else
        {
          FigRoutingManagerLogEndpointID((uint64_t)CFSTR("HandleEndpointFailedDelegate: Removed endpoint with ID from aggregate: "), (uint64_t)v14, 0, 0);
        }
        v37 = v46;
      }
      else
      {
        v37 = 0;
      }
      FigRoutingManagerCleanupSystemMusicIfAggregateIsEmpty(*(CFTypeRef *)(a1 + 48), *(_QWORD *)(a1 + 56), v37);
      if (FigCFEqual())
        FigRoutingManager_iOSHandleStartupFailed(v52, Mutable);
      if (*(_QWORD *)type)
      {
        CFRelease(*(CFTypeRef *)type);
        *(_QWORD *)type = 0;
      }
      if (v50)
      {
        CFRelease(v50);
        v50 = 0;
      }
      v36 = v47;
      if (v47)
        goto LABEL_60;
    }
  }
  else if (FigRoutingManagerIsEndpointActivated(*(_QWORD *)(a1 + 48)))
  {
    cf[0] = 0;
    v30 = FigEndpointGetCMBaseObject();
    v31 = *(void (**)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48);
    if (v31)
      v31(v30, *MEMORY[0x1E0CA4258], v2, cf);
    v32 = FigEndpointGetCMBaseObject();
    v33 = *(void (**)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48);
    if (v33)
      v33(v32, *MEMORY[0x1E0CA4348], v2, &v53);
    v34 = FigEndpointDescriptorUtility_CopyDescriptorForEndpoint(*(_QWORD *)(a1 + 48), 0);
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigRoutingManager_iOSDeactivateEndpoint(*(const void **)(a1 + 48), *(_QWORD *)(a1 + 56));
    if (FigRoutingManagerContextUtilities_GetContextType((uint64_t)Value) == 1)
      FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers((uint64_t)Value, 0, CFSTR("configUpdateReasonEndedFailed"));
    else
      FigRoutingManagerContextUtilities_SetPickedEndpoints(Value, 0, (uint64_t)CFSTR("configUpdateReasonEndedFailed"), (uint64_t)v7, 0);
    if (FigCFEqual())
      FigRoutingManager_iOSHandleStartupFailed(v52, Mutable);
    if (cf[0])
    {
      CFRelease(cf[0]);
      cf[0] = 0;
    }
    if (v34)
    {
      v36 = v34;
LABEL_60:
      CFRelease(v36);
    }
  }
LABEL_61:
  if (dword_1EE2B3E28)
  {
    LODWORD(v51) = 0;
    LOBYTE(v50) = 0;
    v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v41 = v51;
    if (os_log_type_enabled(v40, (os_log_type_t)v50))
      v42 = v41;
    else
      v42 = v41 & 0xFFFFFFFE;
    if (v42)
    {
      v54 = 136315906;
      v55 = "FigRoutingManager_iOSHandleEndpointFailedDelegate_block_invoke";
      v56 = 2114;
      v57 = v53;
      v58 = 1024;
      v59 = v52;
      v60 = 2114;
      v61 = v13;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v53)
  {
    CFRelease(v53);
    v53 = 0;
  }
  if (Mutable)
    CFRelease(Mutable);
  if (v11)
    CFRelease(v11);
  v43 = *(const void **)(a1 + 48);
  if (v43)
    CFRelease(v43);
  v44 = *(const void **)(a1 + 40);
  if (v44)
    CFRelease(v44);
  v45 = *(const void **)(a1 + 32);
  if (v45)
    CFRelease(v45);
}

void __FigRoutingManager_HandleDidReceiveDataFromCommChannelDelegate_block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  const void *Value;
  uint64_t v4;
  uint64_t v5;
  __CFDictionary *Mutable;
  uint64_t CMBaseObject;
  void (*v8)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  CFTypeRef v11;
  const void *v12;
  const void *v13;
  const void *v14;
  CFTypeRef cf;
  CFTypeRef v16;

  v2 = *(const __CFDictionary **)(a1 + 32);
  if (v2)
  {
    Value = CFDictionaryGetValue(v2, CFSTR("EndpointDelegateContextKey_RoutingContextUUID"));
    if (Value)
    {
      v4 = (uint64_t)Value;
      v5 = *MEMORY[0x1E0C9AE00];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (FigRoutingManagerContextUtilities_GetContextType(v4) == 9)
      {
        v16 = 0;
        CMBaseObject = FigEndpointGetCMBaseObject();
        v8 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
        if (v8)
          v8(CMBaseObject, *MEMORY[0x1E0CA4348], v5, &v16);
        cf = 0;
        v9 = FigEndpointGetCMBaseObject();
        v10 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
        if (v10)
        {
          v10(v9, *MEMORY[0x1E0CA4258], v5, &cf);
          v11 = cf;
        }
        else
        {
          v11 = 0;
        }
        CFDictionarySetValue(Mutable, CFSTR("deviceID"), v11);
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        if (v16)
          CFRelease(v16);
      }
      CFDictionarySetValue(Mutable, CFSTR("commChannelUUID"), *(const void **)(a1 + 48));
      CFDictionarySetValue(Mutable, CFSTR("data"), *(const void **)(a1 + 56));
      FigRoutingManagerContextUtilities_PostNotificationToClientsOfContextWithUUIDAndItsFollowers(v4, (uint64_t)CFSTR("didReceiveData"), (uint64_t)Mutable);
      if (Mutable)
        CFRelease(Mutable);
    }
  }
  v12 = *(const void **)(a1 + 40);
  if (v12)
    CFRelease(v12);
  v13 = *(const void **)(a1 + 48);
  if (v13)
    CFRelease(v13);
  v14 = *(const void **)(a1 + 56);
  if (v14)
    CFRelease(v14);
}

void __FigRoutingManager_HandleDidCloseCommChannelDelegate_block_invoke(_QWORD *a1)
{
  const __CFDictionary *v2;
  const void *Value;
  uint64_t v4;
  uint64_t v5;
  CFMutableDictionaryRef Mutable;
  uint64_t CMBaseObject;
  void (*v8)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v12;
  const void *v13;
  CFTypeRef cf;
  CFTypeRef v15[25];

  v15[24] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v2 = (const __CFDictionary *)a1[4];
  if (v2)
  {
    Value = CFDictionaryGetValue(v2, CFSTR("EndpointDelegateContextKey_RoutingContextUUID"));
    if (Value)
    {
      v4 = (uint64_t)Value;
      v5 = *MEMORY[0x1E0C9AE00];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (FigRoutingManagerContextUtilities_GetContextType(v4) == 9)
      {
        v15[0] = 0;
        CMBaseObject = FigEndpointGetCMBaseObject();
        v8 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
        if (v8)
          v8(CMBaseObject, *MEMORY[0x1E0CA4348], v5, v15);
        cf = 0;
        v9 = FigEndpointGetCMBaseObject();
        v10 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
        if (v10)
          v10(v9, *MEMORY[0x1E0CA4258], v5, &cf);
        FigCFDictionarySetValue();
        if (dword_1EE2B3E28)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        if (v15[0])
          CFRelease(v15[0]);
      }
      FigCFDictionarySetValue();
      FigRoutingManagerContextUtilities_PostNotificationToClientsOfContextWithUUIDAndItsFollowers(v4, (uint64_t)CFSTR("commChannelDidClose"), (uint64_t)Mutable);
      if (Mutable)
        CFRelease(Mutable);
    }
  }
  v12 = (const void *)a1[5];
  if (v12)
    CFRelease(v12);
  v13 = (const void *)a1[6];
  if (v13)
    CFRelease(v13);
}

@end
