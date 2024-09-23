@implementation FigCapturePowerLogMissingCameraStopEventObserver

- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4
{
  NSObject *observerQueue;
  _QWORD v7[6];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_observerQueue);
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__FigCapturePowerLogMissingCameraStopEventObserver_layoutMonitor_didUpdateLayout___block_invoke;
  v7[3] = &unk_1E491E748;
  v7[4] = self;
  v7[5] = a4;
  dispatch_async(observerQueue, v7);
}

void __82__FigCapturePowerLogMissingCameraStopEventObserver_layoutMonitor_didUpdateLayout___block_invoke(uint64_t a1)
{
  -[FigCapturePowerLogMissingCameraStopEventObserver _handleLayoutUpdate:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_cancelCameraAppStreamingTimer
{
  NSObject *v2;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v2 = *(NSObject **)(a1 + 24);
    if (v2)
    {
      dispatch_source_cancel(v2);
      dispatch_release(*(dispatch_object_t *)(a1 + 24));
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
}

- (uint64_t)_cameraAppIsForegroundInLayout:(uint64_t)result
{
  if (result)
  {
    if ((objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "containsObject:", 0x1E493D4D8) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a2, "transitioningApps"), "containsObject:", 0x1E493D4D8) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "containsObject:", 0x1E493D5F8) & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend((id)objc_msgSend(a2, "transitioningApps"), "containsObject:", 0x1E493D5F8);
    }
  }
  return result;
}

- (_QWORD)initWithQueue:(void *)a1
{
  _QWORD *v3;
  id v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)FigCapturePowerLogMissingCameraStopEventObserver;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  if (v3)
  {
    v3[1] = a2;
    v3[2] = +[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor");
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v3[5] = v4;
    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ssZ"));
  }
  return v3;
}

- (void)startObserving
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 16), "addLayoutObserverWithoutImmediateCallback:", a1);
    -[FigCapturePowerLogMissingCameraStopEventObserver _handleLayoutUpdate:](a1, (void *)objc_msgSend(*(id *)(a1 + 16), "currentLayout"));
  }
}

- (void)stopObserving
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 16), "removeLayoutObserver:", a1);
    -[FigCapturePowerLogMissingCameraStopEventObserver _cancelCameraAppStreamingTimer](a1);
  }
}

- (void)dealloc
{
  NSObject *cameraAppStreamingTimer;
  objc_super v4;

  cameraAppStreamingTimer = self->_cameraAppStreamingTimer;
  if (cameraAppStreamingTimer)
    dispatch_release(cameraAppStreamingTimer);

  v4.receiver = self;
  v4.super_class = (Class)FigCapturePowerLogMissingCameraStopEventObserver;
  -[FigCapturePowerLogMissingCameraStopEventObserver dealloc](&v4, sel_dealloc);
}

- (void)_handleLayoutUpdate:(uint64_t)a1
{
  int v4;
  char v5;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v4 = -[FigCapturePowerLogMissingCameraStopEventObserver _cameraAppIsForegroundInLayout:](a1, a2);
    v5 = v4;
    if (!*(_BYTE *)(a1 + 32) || (v4 & 1) != 0)
    {
      if (v4)
        -[FigCapturePowerLogMissingCameraStopEventObserver _cancelCameraAppStreamingTimer](a1);
    }
    else
    {
      -[FigCapturePowerLogMissingCameraStopEventObserver _startCameraAppStreamingTimer](a1);
    }
    *(_BYTE *)(a1 + 32) = v5;
  }
}

- (void)_startCameraAppStreamingTimer
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD handler[5];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(_QWORD *)(a1 + 24))
      -[FigCapturePowerLogMissingCameraStopEventObserver _cancelCameraAppStreamingTimer](a1);
    v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 8));
    *(_QWORD *)(a1 + 24) = v2;
    v3 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x29A2241AF62C0000uLL);
    v4 = *(NSObject **)(a1 + 24);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __81__FigCapturePowerLogMissingCameraStopEventObserver__startCameraAppStreamingTimer__block_invoke;
    handler[3] = &unk_1E491E720;
    handler[4] = a1;
    dispatch_source_set_event_handler(v4, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 24));
  }
}

void __81__FigCapturePowerLogMissingCameraStopEventObserver__startCameraAppStreamingTimer__block_invoke(uint64_t a1)
{
  -[FigCapturePowerLogMissingCameraStopEventObserver _cancelCameraAppStreamingTimer](*(_QWORD *)(a1 + 32));
  -[FigCapturePowerLogMissingCameraStopEventObserver _checkCameraAppPowerEventsForAnyStreamingCameras](*(_QWORD *)(a1 + 32));
}

- (void)_checkCameraAppPowerEventsForAnyStreamingCameras
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  os_log_type_t type;
  unsigned int v15;
  _BYTE v16[128];
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if ((-[FigCapturePowerLogMissingCameraStopEventObserver _cameraAppIsForegroundInLayout:](a1, (void *)objc_msgSend(*(id *)(a1 + 16), "currentLayout")) & 1) == 0)
    {
      if (sPendingPowerEventsCount)
      {
        if (dword_1ECFE9A30)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        v2 = cpls_portTypesReportedStreamingForCameraApp();
        if (objc_msgSend(v2, "count"))
        {
          v12 = 0u;
          v13 = 0u;
          v10 = 0u;
          v11 = 0u;
          v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
          if (v3)
          {
            v4 = v3;
            v5 = *(_QWORD *)v11;
            while (1)
            {
              if (*(_QWORD *)v11 != v5)
                objc_enumerationMutation(v2);
              if (!--v4)
              {
                v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
                if (!v4)
                  break;
              }
            }
          }
          v15 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v7 = v15;
          if (os_log_type_enabled(v6, type))
            v8 = v7;
          else
            v8 = v7 & 0xFFFFFFFE;
          if (v8)
          {
            v17 = 136315138;
            v18 = "-[FigCapturePowerLogMissingCameraStopEventObserver _checkCameraAppPowerEventsForAnyStreamingCameras]";
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          -[FigCapturePowerLogMissingCameraStopEventObserver _showTTRPromptIfNecessary](a1);
        }
      }
    }
  }
}

- (void)_showTTRPromptIfNecessary
{
  const __CFString *v2;
  const __CFString *v3;
  CFPropertyListRef v4;
  const void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (FigCaptureOSVariantHasInternalUI())
    {
      v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
      v4 = (id)CFPreferencesCopyValue(CFSTR("LastShownMissingCameraStopPowerEventTTRPromptDate"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      v5 = (const void *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"), "isDate:inSameDayAsDate:", v4, v5)|| (v6 = (id)CFPreferencesCopyValue(CFSTR("LastShownMissingCameraStopPowerEventTTRPromptBuildVersion"), CFSTR("com.apple.cameracapture.volatile"), v2, v3), v7 = (id)MGCopyAnswer(), objc_msgSend(v6, "isEqualToString:", v7)))
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = objc_msgSend(*(id *)(a1 + 40), "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
        FigCapturePromptOpenTapToRadar((uint64_t)CFSTR("Missing camera stop power event. Please file a radar."), (uint64_t)CFSTR("Missing camera stop power event!"), objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: Camera Streaming Power Events: %@"), v9, sCameraStreamingPowerEventsByPortType), 1, 3, 6, 0.0);
        CFPreferencesSetValue(CFSTR("LastShownMissingCameraStopPowerEventTTRPromptDate"), v5, CFSTR("com.apple.cameracapture.volatile"), v2, v3);
        CFPreferencesSetValue(CFSTR("LastShownMissingCameraStopPowerEventTTRPromptBuildVersion"), v7, CFSTR("com.apple.cameracapture.volatile"), v2, v3);
      }
    }
  }
}

@end
