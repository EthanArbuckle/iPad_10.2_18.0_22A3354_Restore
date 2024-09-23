@implementation FigRoutingSessionManagerInit

void __FigRoutingSessionManagerInit_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  const void *v3;
  void *v4;
  const void *SInt32;
  uint64_t DerivedStorage;
  CFTypeRef v7;
  NSObject *v8;
  dispatch_queue_t v9;
  uint64_t v10;
  CFMutableArrayRef Mutable;
  CFArrayRef v12;
  CFStringRef v13;
  const __CFDictionary *v14;
  const __CFNumber *v15;
  MXSystemController *v16;
  MXSystemController *v17;
  MXSystemController *v18;
  uint64_t *v19;
  uint64_t v20;
  unsigned int (*v21)(uint64_t, const __CFString *, const void *);
  uint64_t v22;
  unsigned int (*v23)(uint64_t, const __CFString *, CFStringRef);
  uint64_t v24;
  unsigned int (*v25)(uint64_t, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v27;
  CFTypeRef cf;
  const __CFString *v29;
  const __CFString **v30;
  uint64_t v31;
  const __CFString *v32;
  _QWORD valuePtr[18];

  valuePtr[16] = *MEMORY[0x1E0C80C00];
  if (sLongFormVideoManager)
    goto LABEL_44;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = *(const void **)(a1 + 32);
  v4 = (void *)MEMORY[0x194035B20]();
  getpid();
  SInt32 = (const void *)FigCFNumberCreateSInt32();
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  FigRoutingSessionManagerGetClassID();
  if (!CMDerivedObjectCreate())
  {
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (v3)
      v7 = CFRetain(v3);
    else
      v7 = 0;
    *(_QWORD *)DerivedStorage = v7;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_create("com.apple.coremedia.routing-session-manager.session-expiration", v8);
    *(_QWORD *)(DerivedStorage + 32) = v9;
    if (v9)
    {
      v10 = FigSimpleMutexCreate();
      *(_QWORD *)(DerivedStorage + 40) = v10;
      if (v10)
      {
        Mutable = CFArrayCreateMutable(v2, 0, MEMORY[0x1E0C9B378]);
        *(_QWORD *)(DerivedStorage + 104) = Mutable;
        if (Mutable)
        {
          v12 = CFArrayCreate(v2, 0, 0, MEMORY[0x1E0C9B378]);
          *(_QWORD *)(DerivedStorage + 48) = v12;
          if (v12)
          {
            v13 = CFStringCreateWithFormat(v2, 0, CFSTR("FigRoutingSessionManager - %p"), 0);
            v14 = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            FigCFDictionarySetInt();
            LODWORD(valuePtr[0]) = 0;
            getpid();
            v15 = (const __CFNumber *)FigCFNumberCreateSInt32();
            CFNumberGetValue(v15, kCFNumberSInt32Type, valuePtr);
            v16 = [MXSystemController alloc];
            v17 = -[MXSystemController initWithPID:](v16, "initWithPID:", LODWORD(valuePtr[0]));
            *(_QWORD *)(DerivedStorage + 16) = v17;
            v18 = v17;

            if (v15)
              CFRelease(v15);
            v19 = (uint64_t *)(DerivedStorage + 8);
            if (!FigRouteDiscovererCreate((int)v2, v14, (CFTypeRef *)(DerivedStorage + 8)))
            {
              v20 = *v19;
              v21 = *(unsigned int (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                             + 56);
              if (v21)
              {
                if (!v21(v20, CFSTR("clientPID"), SInt32))
                {
                  v22 = *v19;
                  v23 = *(unsigned int (**)(uint64_t, const __CFString *, CFStringRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                + 56);
                  if (v23)
                  {
                    if (!v23(v22, CFSTR("clientName"), v13))
                    {
                      v29 = 0;
                      v30 = &v29;
                      v31 = 0x2020000000;
                      LODWORD(v32) = 0;
                      valuePtr[0] = MEMORY[0x1E0C809B0];
                      valuePtr[1] = 3221225472;
                      valuePtr[2] = __routingSessionManager_loadAirPlayRoutePredictionFramework_block_invoke;
                      valuePtr[3] = &unk_1E3099018;
                      valuePtr[4] = &v29;
                      if (routingSessionManager_loadAirPlayRoutePredictionFramework_onceToken != -1)
                        dispatch_once(&routingSessionManager_loadAirPlayRoutePredictionFramework_onceToken, valuePtr);
                      _Block_object_dispose(&v29, 8);
                      *(_QWORD *)(DerivedStorage + 24) = (id)objc_msgSend((id)sARPRoutePredictorClass, "routePredictor");
                      CMNotificationCenterGetDefaultLocalCenter();
                      if (!FigNotificationCenterAddWeakListener())
                      {
                        CMNotificationCenterGetDefaultLocalCenter();
                        if (!FigNotificationCenterAddWeakListener())
                        {
                          v29 = CFSTR("SomeLongFormVideoClientIsActiveOverAirPlayVideoDidChange");
                          v30 = (const __CFString **)CFSTR("SomeLongFormVideoClientIsPlayingOverAirPlayVideo");
                          v31 = (uint64_t)CFSTR("SomeLongFormVideoClientIsPlayingDidChange");
                          v32 = CFSTR("SomeSharePlayCapableCallSessionIsActiveDidChange");
                          objc_msgSend(*(id *)(DerivedStorage + 16), "setAttributeForKey:andValue:", CFSTR("SubscribeToNotifications"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 4));
                          CMNotificationCenterGetDefaultLocalCenter();
                          if (!FigNotificationCenterAddWeakListener())
                          {
                            CMNotificationCenterGetDefaultLocalCenter();
                            if (!FigNotificationCenterAddWeakListener())
                            {
                              CMNotificationCenterGetDefaultLocalCenter();
                              if (!FigNotificationCenterAddWeakListener())
                              {
                                CMNotificationCenterGetDefaultLocalCenter();
                                FigNotificationCenterAddWeakListener();
                                if (!*(_QWORD *)(DerivedStorage + 24)
                                  || (CMNotificationCenterGetDefaultLocalCenter(),
                                      !FigNotificationCenterAddWeakListener()))
                                {
                                  cf = 0;
                                  v24 = *(_QWORD *)CMBaseObjectGetDerivedStorage();
                                  v25 = *(unsigned int (**)(uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                            + 64);
                                  if (v25 && !v25(v24, &cf))
                                  {
                                    if (routingSessionManager_routeIsBuiltIn((const __CFArray *)cf))
                                    {
                                      if (dword_1EE2B3E48)
                                      {
                                        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                                        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                                        fig_log_call_emit_and_clean_up_after_send_and_compose();
                                      }
                                    }
                                    else
                                    {
                                      routingSessionManager_establishRoutingSessionFromCurrentRoutes(0, (const __CFArray *)cf, CFSTR("Initial routes from FigRoutingContext"));
                                    }
                                  }
                                  if (cf)
                                    CFRelease(cf);
                                  *(_QWORD *)(DerivedStorage + 112) = routingSessionManager_copyEligibleInEarHeadphones(*(_QWORD *)(DerivedStorage + 8));
                                  routingSessionManager_updateSessionFromLatestInEarHeadphones(0);
                                  *(_BYTE *)(DerivedStorage + 120) = objc_msgSend(*(id *)(DerivedStorage + 16), "someSharePlayCapableCallSessionIsActive");
                                  routingSessionManager_updateSessionFromLatestActiveStatusOfSharePlayCapableCallSession(0);
                                  routingSessionManager_updatePredictedDestinations();
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      FigSignalErrorAt();
    }
  }
  v13 = 0;
  v14 = 0;
LABEL_37:
  if (v13)
    CFRelease(v13);
  if (v14)
    CFRelease(v14);
  if (SInt32)
    CFRelease(SInt32);
  objc_autoreleasePoolPop(v4);
LABEL_44:
  v27 = *(const void **)(a1 + 32);
  if (v27)
    CFRelease(v27);
}

@end
