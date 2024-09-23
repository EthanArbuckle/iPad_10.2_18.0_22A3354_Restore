@implementation FigCaptureSourceVibeMitigation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (FigCaptureSourceVibeMitigation)initWithFigCaptureSourceBackings:(id)a3
{
  FigCaptureSourceVibeMitigation *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *positions;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v17;
  uint64_t v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)FigCaptureSourceVibeMitigation;
  v4 = -[FigCaptureSourceVibeMitigation init](&v25, sel_init);
  if (v4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = (id)objc_msgSend(a3, "sourceInfoDictionaries");
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v20 = *(_QWORD *)v22;
      v7 = *MEMORY[0x1E0D07E68];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v20)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E493B998);
          v11 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E493B8F8);
          v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
          v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Position")), "intValue");
          if (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v7), "BOOLValue"))
          {
            positions = v4->_positions;
            if (!positions)
            {
              positions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v4->_positions = positions;
            }
            if (!v4->_deviceTypes)
            {
              v4->_deviceTypes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              positions = v4->_positions;
            }
            -[NSMutableArray addObject:](positions, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13));
            -[NSMutableArray addObject:](v4->_deviceTypes, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }
    if (dword_1ECFE9610)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (-[NSMutableArray count](v4->_positions, "count", v17, v18))
    {
      v4->_vibeMitigationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      v4->_hapticDuration = 30;
      -[FigCaptureSourceVibeMitigation _setupStateMachine]((uint64_t)v4);
      -[FigCaptureSourceVibeMitigation _registerNotifications](v4);
      v4->_mitigationWhileCameraStreamingSupported = 0;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_setupStateMachine
{
  uint64_t v1;
  FigStateMachine *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (result)
  {
    v1 = result;
    v2 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("FigCaptureSourceVibeMitigationStateMachine"), 4, 1, result);
    *(_QWORD *)(v1 + 64) = v2;
    -[FigStateMachine setPerformsAtomicStateTransitions:](v2, "setPerformsAtomicStateTransitions:", 0);
    objc_msgSend(*(id *)(v1 + 64), "setLabel:forState:", CFSTR("Idle"), 1);
    objc_msgSend(*(id *)(v1 + 64), "setLabel:forState:", CFSTR("Activating"), 2);
    objc_msgSend(*(id *)(v1 + 64), "setLabel:forState:", CFSTR("Active"), 4);
    objc_msgSend(*(id *)(v1 + 64), "setLabel:forState:", CFSTR("Deactivating"), 8);
    v3 = MEMORY[0x1E0C809B0];
    v4 = *(void **)(v1 + 64);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke;
    v7[3] = &unk_1E491EB48;
    v7[4] = v1;
    objc_msgSend(v4, "whenTransitioningFromState:toState:callHandler:", 1, 2, v7);
    objc_msgSend(*(id *)(v1 + 64), "whenTransitioningFromState:toState:callHandler:", 4, 8, &__block_literal_global_6);
    objc_msgSend(*(id *)(v1 + 64), "whenTransitioningFromState:toState:callHandler:", 8, 1, &__block_literal_global_22);
    objc_msgSend(*(id *)(v1 + 64), "whenTransitioningFromState:toState:callHandler:", 4, 1, &__block_literal_global_23);
    v5 = *(void **)(v1 + 64);
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_5;
    v6[3] = &unk_1E491EB48;
    v6[4] = v1;
    return objc_msgSend(v5, "whenTransitioningFromState:toState:callHandler:", 8, 4, v6);
  }
  return result;
}

- (void)_registerNotifications
{
  __CFNotificationCenter *DistributedCenter;

  if (a1)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)fcsvm_vibeNotificationCallback, CFSTR("HapticActuatorProtectionModeNotification_MinimalProtection"), CFSTR("HapticEngineNotificationObject"), CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)fcsvm_vibeNotificationCallback, CFSTR("HapticActuatorProtectionModeNotification_DefaultProtection"), CFSTR("HapticEngineNotificationObject"), CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)fcsvm_vibeNotificationCallback, CFSTR("HapticSequenceNotification_SequenceWillStart"), CFSTR("HapticEngineNotificationObject"), CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)dealloc
{
  NSObject *timer;
  objc_super v4;

  timer = self->_timer;
  if (timer)
    dispatch_release(timer);

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSourceVibeMitigation;
  -[FigCaptureSourceVibeMitigation dealloc](&v4, sel_dealloc);
}

uint64_t __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke(uint64_t a1, uint64_t a2)
{
  int started;
  uint64_t v5;
  uint64_t v6;

  started = -[FigCaptureSourceVibeMitigation _startMitigation](a2);
  v5 = *(_QWORD *)(a1 + 32);
  if (started)
  {
    v6 = 1;
  }
  else
  {
    -[FigCaptureSourceVibeMitigation _setupTimerWithDuration:](a2, *(_DWORD *)(v5 + 72));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 4;
  }
  return objc_msgSend(*(id *)(v5 + 64), "transitionToState:", v6);
}

- (uint64_t)_startMitigation
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  unsigned int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v23 = 0;
    if (*(_BYTE *)(result + 77))
    {
      *(_DWORD *)(result + 32) = 0;
      v2 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyDefaultDeviceForVibeMitigation:", &v23);
    }
    else
    {
      v3 = +[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor");
      v4 = getpid();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __50__FigCaptureSourceVibeMitigation__startMitigation__block_invoke;
      v22[3] = &unk_1E491EBB8;
      v22[4] = v1;
      *(_DWORD *)(v1 + 32) = objc_msgSend(v3, "registerClientWithPID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceAvailabilityChangedHandler:", v4, CFSTR("FigCaptureSourceVibeMitigation"), 2, 0, 0, v22);
      v2 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyDeviceForClient:informClientWhenDeviceAvailableAgain:error:", *(unsigned int *)(v1 + 32), 0, &v23);
    }
    *(_QWORD *)(v1 + 40) = v2;
    if (v2)
    {
      v5 = (void *)objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyStreamsWithoutControlFromDevice:positions:deviceTypes:error:", *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), &v23);
      *(_QWORD *)(v1 + 48) = v5;
      if (v23)
      {
        objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDeviceInvalidatedImmediately:", *(_QWORD *)(v1 + 40), *(unsigned int *)(v1 + 32), 0, 0);
        v6 = *(const void **)(v1 + 40);
        if (v6)
        {
          CFRelease(v6);
          *(_QWORD *)(v1 + 40) = 0;
        }
      }
      else if (*(_QWORD *)(v1 + 40))
      {
        v7 = v5;
        if (v5)
        {
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v19;
            v17 = *MEMORY[0x1E0D07878];
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v19 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
                if (*(_BYTE *)(v1 + 77))
                {
                  if (dword_1ECFE9610)
                  {
                    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  objc_msgSend(v12, "setVibeMitigationEnabled:", 1, v15, v16);
                }
                else
                {
                  v23 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setPropertyIfSupported:value:", v17, MEMORY[0x1E0C9AAB0]);
                  if (v23 || dword_1ECFE9610)
                  {
                    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                }
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
            }
            while (v9);
          }
          return v23;
        }
      }
      FigDebugAssert3();
    }
    return v23;
  }
  return result;
}

- (void)_setupTimerWithDuration:(uint64_t)a1
{
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD handler[5];

  if (a1)
  {
    -[FigCaptureSourceVibeMitigation _cancelCurrentTimer](a1);
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 24));
    *(_QWORD *)(a1 + 56) = v4;
    v5 = dispatch_time(0, 1000000000 * a2);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    v6 = *(NSObject **)(a1 + 56);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__FigCaptureSourceVibeMitigation__setupTimerWithDuration___block_invoke;
    handler[3] = &unk_1E491E720;
    handler[4] = a1;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 56));
  }
}

void __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_2(uint64_t a1, uint64_t a2)
{
  -[FigCaptureSourceVibeMitigation _setupTimerWithDuration:](a2, 2u);
}

void __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_3(uint64_t a1, uint64_t a2)
{
  -[FigCaptureSourceVibeMitigation _stopMitigation](a2);
}

- (void)_stopMitigation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  NSObject *v10;
  const void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[FigCaptureSourceVibeMitigation _cancelCurrentTimer](a1);
    v2 = *(void **)(a1 + 48);
    if (v2 && *(_QWORD *)(a1 + 40))
    {
      if (!*(_BYTE *)(a1 + 76))
      {
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v3)
        {
          v4 = v3;
          v5 = *(_QWORD *)v18;
          v16 = *MEMORY[0x1E0D07878];
          do
          {
            v6 = 0;
            v15 = v4;
            do
            {
              if (*(_QWORD *)v18 != v5)
                objc_enumerationMutation(v2);
              v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
              if (*(_BYTE *)(a1 + 77))
              {
                if (dword_1ECFE9610)
                {
                  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                objc_msgSend(v7, "setVibeMitigationEnabled:", 0, v13, v14);
              }
              else if (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6), "setPropertyIfSupported:value:", v16, MEMORY[0x1E0C9AAA0]))
              {
                v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                v4 = v15;
              }
              else if (dword_1ECFE9610)
              {
                v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              ++v6;
            }
            while (v4 != v6);
            v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v4);
        }
      }
      objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor", v13), "takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDeviceInvalidatedImmediately:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 32), 0, 0);
      v11 = *(const void **)(a1 + 40);
      if (v11)
      {
        CFRelease(v11);
        *(_QWORD *)(a1 + 40) = 0;
      }
      v12 = *(const void **)(a1 + 48);
      if (v12)
      {
        CFRelease(v12);
        *(_QWORD *)(a1 + 48) = 0;
      }
      *(_DWORD *)(a1 + 32) = 0;
      *(_BYTE *)(a1 + 76) = 0;
    }
    else
    {
      FigDebugAssert3();
    }
  }
}

void __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_4(uint64_t a1, uint64_t a2)
{
  -[FigCaptureSourceVibeMitigation _stopMitigation](a2);
}

void __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_5(uint64_t a1, uint64_t a2)
{
  -[FigCaptureSourceVibeMitigation _setupTimerWithDuration:](a2, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)_handleVibeNotification:(uint64_t)a3 userInfo:
{
  NSObject *v3;
  _QWORD block[7];

  if (a1)
  {
    v3 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__FigCaptureSourceVibeMitigation__handleVibeNotification_userInfo___block_invoke;
    block[3] = &unk_1E491EB90;
    block[4] = a2;
    block[5] = a1;
    block[6] = a3;
    dispatch_async(v3, block);
  }
}

void __67__FigCaptureSourceVibeMitigation__handleVibeNotification_userInfo___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  float v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("HapticActuatorProtectionModeNotification_MinimalProtection")))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "currentState");
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    if (v2 == 1)
    {
      v4 = 2;
    }
    else
    {
      if (objc_msgSend(v3, "currentState") != 8)
        return;
      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
      v4 = 4;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("HapticActuatorProtectionModeNotification_DefaultProtection")))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "currentState") != 4)
      return;
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    v4 = 8;
LABEL_9:
    objc_msgSend(v3, "transitionToState:", v4);
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("HapticSequenceNotification_SequenceWillStart"))&& objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SequenceDuration"))&& objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "currentState") == 4)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SequenceDuration")), "floatValue");
    if (v5 <= 0x257)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 72) = v5 + 5;
      -[FigCaptureSourceVibeMitigation _setupTimerWithDuration:](*(_QWORD *)(a1 + 40), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 72));
    }
  }
}

uint64_t __50__FigCaptureSourceVibeMitigation__startMitigation__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "currentState");
  if ((_DWORD)result == 4 && (a3 & 1) == 0)
  {
    if (dword_1ECFE9610)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) = 1;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "transitionToState:", 1, v7, v8);
  }
  return result;
}

- (void)_cancelCurrentTimer
{
  NSObject *v2;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 56);
    if (v2)
    {
      dispatch_source_cancel(v2);

      *(_QWORD *)(a1 + 56) = 0;
    }
  }
}

uint64_t __58__FigCaptureSourceVibeMitigation__setupTimerWithDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "transitionToState:", 1);
}

@end
