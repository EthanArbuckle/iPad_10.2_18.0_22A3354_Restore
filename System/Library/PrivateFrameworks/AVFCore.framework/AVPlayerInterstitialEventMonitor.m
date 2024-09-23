@implementation AVPlayerInterstitialEventMonitor

- (AVQueuePlayer)interstitialPlayer
{
  return self->_interstitialPlayer;
}

- (void)dealloc
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;
  os_log_type_t type;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B01B0)
  {
    v8 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVPlayerInterstitialEventMonitor _removeMonitorListeners](self, "_removeMonitorListeners", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)AVPlayerInterstitialEventMonitor;
  -[AVPlayerInterstitialEventMonitor dealloc](&v6, sel_dealloc);
}

- (void)_removeMonitorListeners
{
  id v3;

  v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avplayerinterstitialeventmonitor_fpNotificationCallback, *MEMORY[0x1E0CC56D0], self->_observedCoord);
  objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avplayerinterstitialeventmonitor_fpNotificationCallback, *MEMORY[0x1E0CC56C8], self->_observedCoord);
  objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avplayerinterstitialeventmonitor_fpNotificationCallback, *MEMORY[0x1E0CC56D8], self->_observedCoord);
  objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avplayerinterstitialeventmonitor_fpNotificationCallback, *MEMORY[0x1E0CC56A8], self->_observedCoord);
}

+ (AVPlayerInterstitialEventMonitor)interstitialEventMonitorWithPrimaryPlayer:(AVPlayer *)primaryPlayer
{
  return (AVPlayerInterstitialEventMonitor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPrimaryPlayer:", primaryPlayer);
}

- (AVPlayerInterstitialEventMonitor)initWithPrimaryPlayer:(AVPlayer *)primaryPlayer
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVPlayerInterstitialEventMonitor *v11;
  AVQueuePlayer *v12;
  OpaqueFigPlayerInterstitialCoordinator *v13;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  objc_super v19;

  if (-[AVPlayer _isInterstitialPlayer](primaryPlayer, "_isInterstitialPlayer"))
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("Cannot create an InterstitialEventMonitor for an interstitial player.");
    goto LABEL_9;
  }
  v19.receiver = self;
  v19.super_class = (Class)AVPlayerInterstitialEventMonitor;
  v11 = -[AVPlayerInterstitialEventMonitor init](&v19, sel_init);
  self = v11;
  if (!v11)
    goto LABEL_6;
  objc_storeWeak((id *)&v11->_primaryPlayer, primaryPlayer);
  v12 = (AVQueuePlayer *)-[AVPlayer interstitialPlayer](primaryPlayer, "interstitialPlayer");
  self->_interstitialPlayer = v12;
  if (!v12)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0CB2FC0];
    v17 = CFSTR("Could not obtain the interstitial player.");
LABEL_9:
    v18 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v17, v6, v7, v8, v9, v10, (uint64_t)v19.receiver), 0);
    objc_exception_throw(v18);
  }
  self->_weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", self);
  v13 = -[AVPlayer _copyInterstitialCoordinator](primaryPlayer, "_copyInterstitialCoordinator");
  -[AVPlayerInterstitialEventMonitor _addMonitorListeners:](self, "_addMonitorListeners:", v13);
  if (v13)
    CFRelease(v13);
LABEL_6:
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  return self;
}

- (void)_addMonitorListeners:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  id v5;

  v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avplayerinterstitialeventmonitor_fpNotificationCallback, *MEMORY[0x1E0CC56D0], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avplayerinterstitialeventmonitor_fpNotificationCallback, *MEMORY[0x1E0CC56C8], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avplayerinterstitialeventmonitor_fpNotificationCallback, *MEMORY[0x1E0CC56D8], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avplayerinterstitialeventmonitor_fpNotificationCallback, *MEMORY[0x1E0CC56A8], a3, 0);
  self->_observedCoord = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryPlayer);
}

- (id)makeCopyOf:(id)a3 immutable:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(a3);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "copy");
        v12 = v11;
        if (v4)
          objc_msgSend(v11, "setImmutable");
        objc_msgSend(v6, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  return v6;
}

- (NSArray)events
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  const void *v5;
  void (*v6)(const void *, id *);
  id v7;
  NSArray *v8;
  uint64_t v10;
  uint64_t v11;
  id v12[17];

  v12[16] = *(id *)MEMORY[0x1E0C80C00];
  if (dword_1EE2B01B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = objc_msgSend(objc_loadWeak((id *)&self->_primaryPlayer), "_copyInterstitialCoordinator");
  v12[0] = 0;
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = *(void (**)(const void *, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v6)
      v6(v5, v12);
    CFRelease(v5);
    v7 = v12[0];
  }
  else
  {
    v7 = 0;
  }
  v8 = -[AVPlayerInterstitialEventMonitor makeCopyOf:immutable:](self, "makeCopyOf:immutable:", v7, 1, v10, v11);

  return v8;
}

- (AVPlayerInterstitialEventMonitor)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  -[AVPlayerInterstitialEventMonitor init](self, "init");
  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_initWithPrimaryPlayer_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVPlayer)primaryPlayer
{
  return (AVPlayer *)objc_loadWeak((id *)&self->_primaryPlayer);
}

- (AVPlayerInterstitialEvent)currentEvent
{
  uint64_t v2;
  const void *v3;
  uint64_t (*v4)(const void *);
  void *v5;
  void *v6;

  v2 = objc_msgSend(objc_loadWeak((id *)&self->_primaryPlayer), "_copyInterstitialCoordinator");
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v4)
      v5 = (void *)v4(v3);
    else
      v5 = 0;
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_msgSend(v5, "copy");

  return (AVPlayerInterstitialEvent *)v6;
}

@end
