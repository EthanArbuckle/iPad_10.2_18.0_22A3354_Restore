@implementation CMSMNotificationUtility

void __CMSMNotificationUtility_PostDisplayLayoutDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("DisplayLayoutDidChange"), *(_QWORD *)(a1 + 32), 0);

}

void __CMSMNotificationUtility_PostReporterIDsDidChange_block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 32), "reporterIDs"), CFSTR("ReporterIDs"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MXSessionManagerSidekick postNotification:toSession:payload:](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "postNotification:toSession:payload:", CFSTR("ReporterIDsDidChange"), *(_QWORD *)(a1 + 32), v2);
  else
    CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), (uint64_t)CFSTR("ReporterIDsDidChange"));

}

void __CMSMNotificationUtility_PostSessionAudioCategoryDidChange_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 32), "audioCategory"), CFSTR("AudioCategory"), 0);
  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), (uint64_t)CFSTR("AudioCategoryDidChange"));

}

void __CMSMNotificationUtility_PostApplicationStateDidChange_block_invoke(uint64_t *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_IsSameClient, a1[4], (uint64_t)CFSTR("ApplicationStateDidChange"), a1[5], 0);
  v2 = (const void *)a1[5];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[4];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[6];
  if (v4)
    CFRelease(v4);
}

void __CMSMNotificationUtility_PostPickableRoutesDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, 0, 0, (uint64_t)CFSTR("PickableRoutesDidChange"), 0, 1);
  if (*(_BYTE *)(a1 + 32))
    vaemPostAvailableEndpointsChangedNotification(1);
}

void __CMSMNotificationUtility_PostSessionAudioModeDidChange_block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 32), "audioMode"), CFSTR("AudioMode"), 0);
  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), (uint64_t)CFSTR("AudioModeDidChange"));

}

void __CMSMNotificationUtility_PostSomeOtherPrimaryAudioCategoryIsPlayingDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(*(_QWORD *)(a1 + 32), (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_IsSomeOtherActiveSession, 0, (uint64_t)CFSTR("SomeOtherNonAmbientSessionIsPlayingDidChange"), 0, 0);

}

void __CMSMNotificationUtility_PostSomePrimaryAudioCategoryIsPlayingDidChange_block_invoke(uint64_t a1)
{
  const void *v2;

  CMSMUtility_NotifyEachMatchingSession(*(_QWORD *)(a1 + 32), (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_IsSomeOtherForegroundAndActiveSession, 0, (uint64_t)CFSTR("SomeNonAmbientAudioCategoryClientIsPlayingDidChange"), *(_QWORD *)(a1 + 40), 0);
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);

}

void __CMSMNotificationUtility_PostSessionPrefersConcurrentAirPlayAudioDidChange_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v3;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMUtility_NotifyEachSubscribedSession(0, (uint64_t)CFSTR("PrefersConcurrentAirPlayAudioDidChange"), *(_QWORD *)(a1 + 40), 0);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

void __CMSMNotificationUtility_PostSessionAudioBehaviourDidChange_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), (uint64_t)CFSTR("AudioBehaviourDidChange"));

}

void __CMSMNotificationUtility_PostSessionRouteControlFeaturesDidChange_block_invoke(void **a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (objc_loadWeak(a1 + 6))
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMUtility_PostNotificationToSession(a1[4], (uint64_t)CFSTR("RouteControlFeaturesDidChange"));
  }

}

void __CMSMNotificationUtility_PostVolumeDidChangeToVolumeButtonClientsWithPayload_block_invoke(uint64_t a1)
{
  const void *Value;
  const void *v3;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), CFSTR("AudioCategory"));
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_IsVolumeButtonClient, (uint64_t)Value, (uint64_t)CFSTR("SystemVolumeDidChange"), *(_QWORD *)(a1 + 32), 0);
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

id __CMSMNotificationUtility_PostSpeechDetectStyleDidChangeIfNeeded_block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0CB3740]);
  CMSMNotificationUtility_PostSpeechDetectStyleDidChangeIfNeeded_sLastSpeechDetectStyleLock = (uint64_t)result;
  return result;
}

void __CMSMNotificationUtility_PostSpeechDetectStyleDidChangeIfNeeded_block_invoke_2(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v3;
  void *v4;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32)), CFSTR("SpeechDetectStyle"), 0);
  CMSMUtility_NotifyEachSubscribedSession(0, (uint64_t)CFSTR("SpeechDetectStyleDidChange"), (uint64_t)v4, 0);

}

id __CMSMNotificationUtility_PostSomeSessionIsPlayingDidChange_block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0CB3740]);
  CMSMNotificationUtility_PostSomeSessionIsPlayingDidChange_sLastNotificationPayloadLock = (uint64_t)result;
  return result;
}

id __CMSMNotificationUtility_PostCallIsActiveDidChangeIfNeeded_block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0CB3740]);
  CMSMNotificationUtility_PostCallIsActiveDidChangeIfNeeded_sActivePhoneCallInfoLock = (uint64_t)result;
  return result;
}

void __CMSMNotificationUtility_PostSystemHasAudioInputDeviceDidChange_block_invoke()
{
  CMSMUtility_NotifyEachMatchingSession(0, 0, 0, (uint64_t)CFSTR("SystemHasAudioInputDeviceDidChange"), 0, 0);
}

void __CMSMNotificationUtility_PostSystemHasAudioInputDeviceExcludingBluetoothDidChange_block_invoke()
{
  CMSMUtility_NotifyEachMatchingSession(0, 0, 0, (uint64_t)CFSTR("SystemHasAudioInputDeviceExcludingBluetoothDidChange"), 0, 0);
}

void __CMSMNotificationUtility_PostVibeStopped_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_SessionWantsSystemSoundNotifications, 0, (uint64_t)CFSTR("SystemSoundVibrateDidFinish"), *(_QWORD *)(a1 + 32), 0);

}

void __CMSMNotificationUtility_PostVoicePromptStyleDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("VoicePromptStyleDidChange"), *(_QWORD *)(a1 + 32), 0);

}

void __CMSMNotificationUtility_PostForceSoundCheckDidChange_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_IsSameClient, *(_QWORD *)(a1 + 32), (uint64_t)CFSTR("ForceSoundCheckDidChange"), *(_QWORD *)(a1 + 40), 0);
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __CMSMNotificationUtility_PostActiveAudioRouteDidChange_block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;
  const void *v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
    CMSMUtility_PostNotificationToSession(v2, (uint64_t)CFSTR("ActiveAudioRouteDidChange"));
  else
    CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_IsSessionUsingRoutingContext, *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("ActiveAudioRouteDidChange"), *(_QWORD *)(a1 + 40), 0);

  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);
}

void __CMSMNotificationUtility_PostActiveNeroVisualStreamDidChange_block_invoke()
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("ActiveNeroVisualStreamDidChange"), 0, 0);
}

void __CMSMNotificationUtility_PostActiveNeroVisualStreamInfoDidChange_block_invoke()
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("ActiveNeroVisualStreamInfoDidChange"), 0, 0);
}

void __CMSMNotificationUtility_PostAvailableVirtualFormatsDidChange_block_invoke()
{
  const __CFAllocator *v0;
  uint64_t CMBaseObject;
  void (*v2)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *);
  const __CFString *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  CFDictionaryRef v6;
  const __CFString *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  CFDictionaryRef v11;
  CFTypeRef cf;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  cf = 0;
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CMBaseObject = FigEndpointManagerGetCMBaseObject();
  v2 = *(void (**)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
  if (v2)
  {
    v2(CMBaseObject, CFSTR("VAEM_VirtualFormatsSupported"), v0, &cf);
    v2 = (void (*)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *))cf;
  }
  v3 = CFSTR("Formats");
  v4 = v2 != 0;
  v5 = CFSTR("Formats") != 0;
  if (!v5 || !v4)
  {
    v3 = 0;
    v2 = 0;
  }
  values = v2;
  keys[0] = (void *)v3;
  v6 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, v5 & v4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("AvailablePhysicalFormatsDidChange"), (uint64_t)v6, 0);
  if (v6)
    CFRelease(v6);
  v7 = CFSTR("Formats");
  v8 = (void *)cf;
  v9 = cf != 0;
  v10 = CFSTR("Formats") != 0;
  if (!v10 || !v9)
  {
    v7 = 0;
    v8 = 0;
  }
  values = v8;
  keys[0] = (void *)v7;
  v11 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, v10 & v9, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("AvailableFormatsDidChange"), (uint64_t)v11, 0);
  if (v11)
    CFRelease(v11);
  if (cf)
    CFRelease(cf);
}

void __CMSMNotificationUtility_PostInputDataSourcesDidChange_block_invoke()
{
  const __CFAllocator *v0;
  uint64_t CMBaseObject;
  void (*v2)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *);
  const __CFString *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  CFDictionaryRef v6;
  CFTypeRef cf;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  cf = 0;
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CMBaseObject = FigEndpointManagerGetCMBaseObject();
  v2 = *(void (**)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
  if (v2)
  {
    v2(CMBaseObject, CFSTR("VAEM_InputDataSources"), v0, &cf);
    v2 = (void (*)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *))cf;
  }
  v3 = CFSTR("Sources");
  v4 = v2 != 0;
  v5 = CFSTR("Sources") != 0;
  if (!v5 || !v4)
  {
    v3 = 0;
    v2 = 0;
  }
  values = v2;
  keys[0] = (void *)v3;
  v6 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, v5 & v4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("InputSourcesDidChange"), (uint64_t)v6, 0);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v6)
    CFRelease(v6);
}

void __CMSMNotificationUtility_PostOutputDataDestinationsDidChange_block_invoke()
{
  const __CFAllocator *v0;
  uint64_t CMBaseObject;
  void (*v2)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *);
  const __CFString *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  CFDictionaryRef v6;
  CFTypeRef cf;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  cf = 0;
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CMBaseObject = FigEndpointManagerGetCMBaseObject();
  v2 = *(void (**)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
  if (v2)
  {
    v2(CMBaseObject, CFSTR("VAEM_OutputDataDestinations"), v0, &cf);
    v2 = (void (*)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *))cf;
  }
  v3 = CFSTR("Destinations");
  v4 = v2 != 0;
  v5 = CFSTR("Destinations") != 0;
  if (!v5 || !v4)
  {
    v3 = 0;
    v2 = 0;
  }
  values = v2;
  keys[0] = (void *)v3;
  v6 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, v5 & v4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("OutputDestinationsDidChange"), (uint64_t)v6, 0);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v6)
    CFRelease(v6);
}

void __CMSMNotificationUtility_PostInputGainScalarDidChange_block_invoke()
{
  uint64_t CMBaseObject;
  unsigned int (*v1)(uint64_t, __CFString *, _QWORD, CFTypeRef *);
  const __CFAllocator *v2;
  const __CFString *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  CFDictionaryRef v7;
  CFTypeRef cf;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  cf = 0;
  CMBaseObject = FigEndpointManagerGetCMBaseObject();
  v1 = *(unsigned int (**)(uint64_t, __CFString *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 48);
  if (v1)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (!v1(CMBaseObject, CFSTR("VAEM_DeviceInputGainScalar"), *MEMORY[0x1E0C9AE00], &cf))
    {
      v3 = CFSTR("Gain");
      v4 = (void *)cf;
      v5 = cf != 0;
      v6 = CFSTR("Gain") != 0;
      if (!v6 || !v5)
      {
        v3 = 0;
        v4 = 0;
      }
      values = v4;
      keys[0] = (void *)v3;
      v7 = CFDictionaryCreate(v2, (const void **)keys, (const void **)&values, v6 & v5, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("InputGainDidChange"), (uint64_t)v7, 0);
      if (v7)
        CFRelease(v7);
    }
  }
  if (cf)
    CFRelease(cf);
}

void __CMSMNotificationUtility_PostCurrentRouteHasInputGainControlDidChange_block_invoke(uint64_t a1)
{
  const void *v2;

  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("InputGainAvailableDidChange"), *(_QWORD *)(a1 + 32), 0);
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

void __CMSMNotificationUtility_PostNumberOfInputChannelsDidChange_block_invoke(uint64_t a1)
{
  CFDictionaryRef SInt32Payload;

  SInt32Payload = CMSMNotificationUtility_CreateSInt32Payload(CFSTR("ChannelCount"), *(_DWORD *)(a1 + 32));
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("NumberOfInputChannelsDidChange"), (uint64_t)SInt32Payload, 0);
  if (SInt32Payload)
    CFRelease(SInt32Payload);
}

void __CMSMNotificationUtility_PostNumberOfOutputChannelsDidChange_block_invoke(uint64_t a1)
{
  CFDictionaryRef SInt32Payload;

  SInt32Payload = CMSMNotificationUtility_CreateSInt32Payload(CFSTR("ChannelCount"), *(_DWORD *)(a1 + 32));
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_True, 0, (uint64_t)CFSTR("NumberOfOutputChannelsDidChange"), (uint64_t)SInt32Payload, 0);
  if (SInt32Payload)
    CFRelease(SInt32Payload);
}

void __CMSMNotificationUtility_PostBadgeTypeDidChange_block_invoke(uint64_t a1)
{
  id v2;

  if (objc_loadWeak((id *)(a1 + 40)))
  {
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 32), "badgeType"), CFSTR("BadgeType"), 0);
    CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_IsSameClient, objc_msgSend(*(id *)(a1 + 32), "clientPID"), (uint64_t)CFSTR("BadgeTypeDidChange"), (uint64_t)v2, 0);

  }
}

void __CMSMNotificationUtility_PostSupportedBufferedAudioCapabilitiesDidChange_block_invoke(uint64_t a1)
{
  id Weak;
  void *v2;
  id v3;

  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    v2 = Weak;
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(Weak, "supportedOutputChannelLayouts"), CFSTR("SupportedOutputChannelLayouts"), 0);
    CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_IsSameClient, objc_msgSend(v2, "clientPID"), (uint64_t)CFSTR("SupportedOutputChannelLayoutsDidChange"), (uint64_t)v3, 0);

  }
}

void __CMSMNotificationUtility_PostIsRecordingMutedDidChange_block_invoke(void **a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (objc_loadWeak(a1 + 6))
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMUtility_PostNotificationToSession(a1[4], (uint64_t)CFSTR("IsRecordingMutedDidChange"));
  }

}

id __CMSMNotificationUtility_PostHighestArbitrationPriorityForTipiDidChangeIfNeeded_block_invoke()
{
  id result;

  CMSMNotificationUtility_PostHighestArbitrationPriorityForTipiDidChangeIfNeeded_sOldHighestArbitrationPriorityForTipiInfo = 0;
  result = objc_alloc_init(MEMORY[0x1E0CB3740]);
  CMSMNotificationUtility_PostHighestArbitrationPriorityForTipiDidChangeIfNeeded_sOldHighestArbitrationPriorityForTipiInfoLock = (uint64_t)result;
  return result;
}

uint64_t __CMSMNotificationUtility_PostSilentModeEnabledDidChange_block_invoke(uint64_t a1)
{
  return CMSMDeviceState_PostRingerStateDarwinNotification(*(unsigned __int8 *)(a1 + 32) ^ 1u);
}

@end
