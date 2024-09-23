@implementation AVRoutingSessionManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (id)longFormVideoRoutingSessionManager
{
  void *v3;

  if (FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager())
    v3 = 0;
  else
    v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFigRoutingSessionManager:", 0);
  return v3;
}

+ (BOOL)longFormVideoManagerCanHaveCurrentSessionWithDestinationOfType:(int64_t)a3 subType:(int64_t)a4
{
  unsigned int v4;

  v4 = (0x32800u >> a4) & 1;
  if ((unint64_t)a4 > 0x11)
    LOBYTE(v4) = 0;
  if (a3)
    return 0;
  else
    return v4;
}

- (AVRoutingSessionManager)initWithFigRoutingSessionManager:(OpaqueFigRoutingSessionManager *)a3
{
  AVRoutingSessionManager *v5;
  AVRoutingSessionManagerInternal *ivars;
  OpaqueFigRoutingSessionManager *v7;
  AVRoutingSessionManager *v8;
  objc_super v10;

  CMNotificationCenterGetDefaultLocalCenter();
  v10.receiver = self;
  v10.super_class = (Class)AVRoutingSessionManager;
  v5 = -[AVRoutingSessionManager init](&v10, sel_init);
  if (v5
    && (ivars = objc_alloc_init(AVRoutingSessionManagerInternal), (v5->_ivars = ivars) != 0)
    && (!a3
      ? (v7 = 0)
      : (OpaqueFigRoutingSessionManager *)(v7 = (OpaqueFigRoutingSessionManager *)CFRetain(a3), ivars = v5->_ivars),
        (ivars->figRoutingSessionManager = v7, v5->_ivars->figRoutingSessionManager)
     && !FigNotificationCenterAddWeakListener()
     && !FigNotificationCenterAddWeakListener()))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AVRoutingSessionManager)init
{
  return -[AVRoutingSessionManager initWithFigRoutingSessionManager:](self, "initWithFigRoutingSessionManager:", 0);
}

- (void)dealloc
{
  AVRoutingSessionManagerInternal *ivars;
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  objc_super v5;

  ivars = self->_ivars;
  if (ivars)
  {
    if (ivars->figRoutingSessionManager)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
      FigNotificationCenterRemoveWeakListener();
      ivars = self->_ivars;
      figRoutingSessionManager = ivars->figRoutingSessionManager;
      if (figRoutingSessionManager)
      {
        CFRelease(figRoutingSessionManager);
        ivars = self->_ivars;
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVRoutingSessionManager;
  -[AVRoutingSessionManager dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, currentRoutingSession=%@, likelyExternalDestinations=%@, allLikelyDestinations=%@, prefersLikelyDestinationsOverCurrentRoutingSession=%d>"), NSStringFromClass(v4), self, -[AVRoutingSessionManager currentRoutingSession](self, "currentRoutingSession"), -[AVRoutingSessionManager likelyExternalDestinations](self, "likelyExternalDestinations"), -[AVRoutingSessionManager allLikelyDestinations](self, "allLikelyDestinations"), -[AVRoutingSessionManager prefersLikelyDestinationsOverCurrentRoutingSession](self, "prefersLikelyDestinationsOverCurrentRoutingSession"));
}

- (AVRoutingSession)currentRoutingSession
{
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  uint64_t (*v3)(OpaqueFigRoutingSessionManager *, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  BOOL v6;
  AVRoutingSession *v7;
  AVRoutingSession *v8;
  CFTypeRef cf;

  cf = 0;
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  v3 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 8);
  if (v3)
  {
    v4 = v3(figRoutingSessionManager, &cf);
    v5 = cf;
    if (v4)
      v6 = 1;
    else
      v6 = cf == 0;
    if (!v6)
    {
      v7 = [AVRoutingSession alloc];
      v8 = -[AVRoutingSession initWithFigRoutingSession:](v7, "initWithFigRoutingSession:", cf);
      v5 = cf;
      if (!cf)
        return v8;
      goto LABEL_10;
    }
    v8 = 0;
    if (cf)
LABEL_10:
      CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSArray)likelyExternalDestinations
{
  NSArray *LikelyDestinationsFromFig;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t i;
  float v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = 0.0;
  FigRoutingSessionManagerGetConfidenceThresholds();
  LikelyDestinationsFromFig = (NSArray *)AVRoutingSessionManagerGetLikelyDestinationsFromFig((uint64_t)self->_ivars->figRoutingSessionManager, (uint64_t)&__block_literal_global_11);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](LikelyDestinationsFromFig, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(LikelyDestinationsFromFig);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "probability");
        v7 = v7 + v9;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](LikelyDestinationsFromFig, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }
  if (v7 >= v15)
    return LikelyDestinationsFromFig;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

uint64_t __53__AVRoutingSessionManager_likelyExternalDestinations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "providesExternalVideoPlayback");
}

- (NSArray)allLikelyDestinations
{
  return (NSArray *)AVRoutingSessionManagerGetLikelyDestinationsFromFig((uint64_t)self->_ivars->figRoutingSessionManager, (uint64_t)&__block_literal_global_18);
}

uint64_t __48__AVRoutingSessionManager_allLikelyDestinations__block_invoke()
{
  return 1;
}

- (BOOL)prefersLikelyDestinationsOverCurrentRoutingSession
{
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  unsigned int (*v3)(OpaqueFigRoutingSessionManager *, char *);
  BOOL v4;
  char v6;

  v6 = 0;
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  v3 = *(unsigned int (**)(OpaqueFigRoutingSessionManager *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (!v3)
    return 0;
  if (v3(figRoutingSessionManager, &v6))
    v4 = 1;
  else
    v4 = v6 == 0;
  return !v4;
}

- (void)updateCurrentRoutingSessionFromLikelyDestinationsWithCompletionHandler:(id)a3
{
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  uint64_t (*v8)(OpaqueFigRoutingSessionManager *, void (*)(void *, signed int), void *);
  signed int v9;
  signed int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "copy");
  if (dword_1EE2B0210)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  v8 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *, void (*)(void *, signed int), void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
  if (v8)
  {
    v9 = v8(figRoutingSessionManager, AVRoutingSessionManagerStartHighConfidenceDestinationComplete, v5);
    if (!v9)
      return;
    v10 = v9;
    if (v9 == -15395)
    {

      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Missing required entitlement com.apple.avfoundation.allows-set-output-device"), v11, v12, v13, v14, v15, v17), 0);
      objc_exception_throw(v16);
    }
  }
  else
  {
    v10 = -12782;
  }
  AVRoutingSessionManagerInvokeStartHighConfidenceCompletionHandler((uint64_t)v5, v10);

}

- (void)startRoutingSessionForHighConfidenceExternalDestinationIfPresentWithCompletionHandler:(id)a3
{
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  uint64_t (*v8)(OpaqueFigRoutingSessionManager *, void (*)(void *, signed int), void *);
  signed int v9;
  signed int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "copy");
  if (dword_1EE2B0210)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  v8 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *, void (*)(void *, signed int), void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v8)
  {
    v9 = v8(figRoutingSessionManager, AVRoutingSessionManagerStartHighConfidenceDestinationComplete, v5);
    if (!v9)
      return;
    v10 = v9;
    if (v9 == -15395)
    {

      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Missing required entitlement com.apple.avfoundation.allows-set-output-device"), v11, v12, v13, v14, v15, v17), 0);
      objc_exception_throw(v16);
    }
  }
  else
  {
    v10 = -12782;
  }
  AVRoutingSessionManagerInvokeStartHighConfidenceCompletionHandler((uint64_t)v5, v10);

}

- (BOOL)startRoutingSessionWithOutputDeviceDescriptions:(id)a3 error:(id *)a4
{
  __CFArray *Mutable;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __CFDictionary *v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(OpaqueFigRoutingSessionManager *, __CFArray *);
  signed int v25;
  void *v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  os_log_type_t type;
  unsigned int v37;
  _BYTE v38[128];
  int v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (dword_1EE2B0210)
  {
    v37 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16, v28, v30);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(a3);
        v13 = AVCreateFigRouteDescriptorFromOutputDeviceDescription(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i));
        CFArrayAppendValue(Mutable, v13);
        if (v13)
          CFRelease(v13);
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v10);
  }
  if (dword_1EE2B0210)
  {
    v37 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v15 = v37;
    if (os_log_type_enabled(v14, type))
      v16 = v15;
    else
      v16 = v15 & 0xFFFFFFFE;
    if (v16)
    {
      v17 = AVSuccinctRouteDescriptorsDescription(Mutable);
      v39 = 136315395;
      v40 = "-[AVRoutingSessionManager startRoutingSessionWithOutputDeviceDescriptions:error:]";
      v41 = 2113;
      v42 = v17;
      v29 = &v39;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  v24 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *, __CFArray *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 72);
  if (v24)
  {
    v25 = v24(figRoutingSessionManager, Mutable);
    if (!v25)
    {
      if (Mutable)
        CFRelease(Mutable);
      return 1;
    }
  }
  else
  {
    v25 = -12782;
  }
  if (a4 && v25 != -15395)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v25, 0);
  if (Mutable)
    CFRelease(Mutable);
  if (v25 == -15395)
  {
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Missing required entitlement com.apple.avfoundation.allows-set-output-device"), v19, v20, v21, v22, v23, (uint64_t)v29), 0);
    objc_exception_throw(v27);
  }
  return 0;
}

- (BOOL)startSuppressingLikelyDestinationsUntilNextPlayEventAndReturnError:(id *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigRoutingSessionManager *);
  signed int v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B0210)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  v13 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
  if (v13)
  {
    v14 = v13(figRoutingSessionManager);
    if (!v14)
      return 1;
  }
  else
  {
    v14 = -12782;
  }
  if (a3 && v14 != -15395)
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
  if (v14 == -15395)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Missing required entitlement com.apple.avfoundation.allows-set-output-device"), v8, v9, v10, v11, v12, v17), 0);
    objc_exception_throw(v16);
  }
  return 0;
}

- (BOOL)stopSuppressingLikelyDestinationsAndReturnError:(id *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigRoutingSessionManager *);
  signed int v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B0210)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  v13 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 88);
  if (v13)
  {
    v14 = v13(figRoutingSessionManager);
    if (!v14)
      return 1;
  }
  else
  {
    v14 = -12782;
  }
  if (a3 && v14 != -15395)
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
  if (v14 == -15395)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Missing required entitlement com.apple.avfoundation.allows-set-output-device"), v8, v9, v10, v11, v12, v17), 0);
    objc_exception_throw(v16);
  }
  return 0;
}

@end
