@implementation FigCameraViewfinderStream

- (void)setDelegate:(id)a3 queue:(id)a4
{
  -[FigDelegateStorage setDelegate:queue:](self->_delegateStorage, "setDelegate:queue:", a3, a4);
}

- (FigCameraViewfinderStream)init
{
  FigCameraViewfinderStream *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigCameraViewfinderStream;
  v2 = -[FigCameraViewfinderStream init](&v4, sel_init);
  if (v2)
  {
    v2->_delegateStorage = objc_alloc_init(FigDelegateStorage);
    -[FigCameraViewfinderStream _setupStateMachine]((uint64_t)v2);
    if (init_sEndpointManagerOnceToken != -1)
      dispatch_once(&init_sEndpointManagerOnceToken, &__block_literal_global_16);
  }
  return v2;
}

- (uint64_t)_setupStateMachine
{
  uint64_t v1;
  FigStateMachine *v2;

  if (result)
  {
    v1 = result;
    v2 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("FigCameraViewfinderStreamStateMachine"), 4, 1, result);
    *(_QWORD *)(v1 + 16) = v2;
    -[FigStateMachine setLabel:forState:](v2, "setLabel:forState:", CFSTR("Idle"), 1);
    objc_msgSend(*(id *)(v1 + 16), "setLabel:forState:", CFSTR("Activating"), 2);
    objc_msgSend(*(id *)(v1 + 16), "setLabel:forState:", CFSTR("Active"), 4);
    objc_msgSend(*(id *)(v1 + 16), "setLabel:forState:", CFSTR("Deactivating"), 8);
    objc_msgSend(*(id *)(v1 + 16), "whenTransitioningToState:callHandler:", 4, &__block_literal_global_36);
    return objc_msgSend(*(id *)(v1 + 16), "whenTransitioningToState:callHandler:", 1, &__block_literal_global_40);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

const void *__33__FigCameraViewfinderStream_init__block_invoke()
{
  const void *result;

  result = (const void *)FigEndpointManagerForCameraPreviewGetShared();
  if (result)
    result = CFRetain(result);
  gEndpointManager = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  unsigned int v4;
  int v5;
  uint64_t v6;
  objc_super v7;

  v4 = -[FigStateMachine currentState](self->_stateMachine, "currentState");

  self->_delegateStorage = 0;
  if (v4 >= 2)
  {
    if (v4 != 8)
      -[FigCameraViewfinderStream close](self, "close");
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 1);
  }

  if (self->_displaySource)
  {
    v6 = v2;
    v5 = 0;
    FigDebugAssert3();
  }
  if (self->_endpoint)
  {
    v6 = v2;
    v5 = 0;
    FigDebugAssert3();
  }
  if (self->_stream)
  {
    v6 = v2;
    v5 = 0;
    FigDebugAssert3();
  }
  v7.receiver = self;
  v7.super_class = (Class)FigCameraViewfinderStream;
  -[FigCameraViewfinderStream dealloc](&v7, sel_dealloc, v5, v6);
}

- (void)openWithDestination:(id)a3
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v7;
  void *v8;
  uint64_t v9;
  OpaqueFigVirtualDisplaySource **p_displaySource;
  uint64_t v11;
  uint64_t CMBaseObject;
  void (*v13)(uint64_t, __CFString *, id);
  OpaqueFigVirtualDisplaySource *v14;
  uint64_t v15;
  void (*v16)(uint64_t, const __CFString *, OpaqueFigVirtualDisplaySource *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  os_log_type_t type;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE95B0)
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 2, 1, v17, v19))
  {
    if (gEndpointManager)
    {
      v7 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", self);
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = *MEMORY[0x1E0CA3A10];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __49__FigCameraViewfinderStream_openWithDestination___block_invoke;
      v21[3] = &unk_1E491EAC8;
      v21[4] = v7;
      self->_endpointsChangedNotificationToken = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v9, gEndpointManager, 0, v21);
      p_displaySource = &self->_displaySource;
      v11 = FigVirtualDisplaySourceCameraViewfinderStreamCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], &self->_displaySource);
      if ((_DWORD)v11)
      {
LABEL_6:
        -[FigStateMachine transitionToState:errorStatus:](self->_stateMachine, "transitionToState:errorStatus:", 1, v11, v18, v20);
        return;
      }
      CMBaseObject = FigVirtualDisplaySourceGetCMBaseObject();
      v13 = *(void (**)(uint64_t, __CFString *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v13)
        v13(CMBaseObject, CFSTR("Destination"), a3);
      v14 = *p_displaySource;
      v15 = FigEndpointManagerGetCMBaseObject();
      v16 = *(void (**)(uint64_t, const __CFString *, OpaqueFigVirtualDisplaySource *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                + 56);
      if (v16)
        v16(v15, CFSTR("CustomEndpoint"), v14);
    }
    else
    {
      v20 = v3;
      LODWORD(v18) = 0;
      FigDebugAssert3();
      v11 = FigSignalErrorAt();
      if ((_DWORD)v11)
        goto LABEL_6;
    }
  }
}

void __49__FigCameraViewfinderStream_openWithDestination___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A858DD40]();
  -[FigCameraViewfinderStream _handleEndpointsChanged:](objc_msgSend(*(id *)(a1 + 32), "referencedObject"));
  objc_autoreleasePoolPop(v2);
}

- (void)_handleEndpointsChanged:(uint64_t)a1
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t CMBaseObject;
  unsigned int (*v4)(uint64_t, _QWORD, _QWORD, CFArrayRef *);
  NSObject *v5;
  const void *ValueAtIndex;
  CFArrayRef theArray[23];

  theArray[22] = *(CFArrayRef *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    theArray[0] = 0;
    if (dword_1ECFE95B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMBaseObject = FigEndpointManagerGetCMBaseObject();
    v4 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
    if (!v4 || v4(CMBaseObject, *MEMORY[0x1E0CA3A20], *MEMORY[0x1E0C9AE00], theArray))
    {
      FigDebugAssert3();
    }
    else
    {
      if (dword_1ECFE95B0)
      {
        v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (theArray[0] && CFArrayGetCount(theArray[0]) >= 1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray[0], 0);
        -[FigCameraViewfinderStream _setEndpoint:](a1, ValueAtIndex);
      }
      else
      {
        -[FigCameraViewfinderStream _setEndpoint:](a1, 0);
        objc_msgSend(*(id *)(a1 + 16), "transitionToState:fromStates:", 1, 14);
      }
    }
    if (theArray[0])
      CFRelease(theArray[0]);
  }
}

- (void)close
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigVirtualDisplaySource *displaySource;
  uint64_t CMBaseObject;
  void (*v6)(uint64_t, const __CFString *, _QWORD);
  OpaqueFigEndpointStream *stream;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE95B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[FigStateMachine transitionToState:fromStates:](self->_stateMachine, "transitionToState:fromStates:", 8, 6, v8, v9)&& self->_endpoint)
  {
    displaySource = self->_displaySource;
    if (displaySource)
    {
      CFRelease(displaySource);
      self->_displaySource = 0;
    }
    CMBaseObject = FigEndpointManagerGetCMBaseObject();
    v6 = *(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v6(CMBaseObject, CFSTR("CustomEndpoint"), 0);
    -[FigCameraViewfinderStream _setEndpoint:]((uint64_t)self, 0);
    stream = self->_stream;
    if (stream)
    {
      CFRelease(stream);
      self->_stream = 0;
    }
  }
}

- (void)_setEndpoint:(uint64_t)a1
{
  const void *v4;
  const void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];

  if (a1)
  {
    v4 = *(const void **)(a1 + 24);
    if (v4 != a2)
    {
      if (v4)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(a1 + 56));
        *(_QWORD *)(a1 + 56) = 0;
        v5 = *(const void **)(a1 + 24);
      }
      else
      {
        v5 = 0;
      }
      *(_QWORD *)(a1 + 24) = a2;
      if (a2)
        CFRetain(a2);
      if (v5)
        CFRelease(v5);
      if (a2)
      {
        v6 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", a1);
        v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v8 = *MEMORY[0x1E0CA3B10];
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __42__FigCameraViewfinderStream__setEndpoint___block_invoke;
        v9[3] = &unk_1E491EAC8;
        v9[4] = v6;
        *(_QWORD *)(a1 + 56) = objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, a2, 0, v9);
        -[FigCameraViewfinderStream _handleStreamsChanged:](a1);
      }
    }
  }
}

- (int)enqueueVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  const __CFDictionary *v5;
  __CVBuffer *ImageBuffer;
  double v7;
  double v8;
  double Height;
  double v10;
  double Width;
  __CVBuffer *v12;
  CGRect rect;

  if (a3 && -[FigStateMachine currentState](self->_stateMachine, "currentState") == 4)
  {
    if (self->_displaySource)
    {
      v5 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
      memset(&rect, 0, sizeof(rect));
      if (v5)
      {
        CGRectMakeWithDictionaryRepresentation(v5, &rect);
        ImageBuffer = CMSampleBufferGetImageBuffer(a3);
        CVPixelBufferGetWidth(ImageBuffer);
        CVPixelBufferGetHeight(ImageBuffer);
        FigCaptureMetadataUtilitiesDenormalizeCropRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        Width = v10;
      }
      else
      {
        v12 = CMSampleBufferGetImageBuffer(a3);
        Width = (double)CVPixelBufferGetWidth(v12);
        Height = (double)CVPixelBufferGetHeight(v12);
        v7 = 0.0;
        v8 = 0.0;
      }
      rect.origin.x = v7;
      rect.origin.y = v8;
      rect.size.width = Width;
      rect.size.height = Height;
      FigVirtualDisplaySourceCameraViewfinderStreamEnqueueFrame(v7, v8, Width, Height, (uint64_t)self->_displaySource, a3);
    }
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t __47__FigCameraViewfinderStream__setupStateMachine__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_2;
  v4[3] = &unk_1E491F2F8;
  v4[4] = a2;
  return objc_msgSend(v2, "invokeDelegateCallbackWithBlock:", v4);
}

uint64_t __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "cameraViewfinderStreamDidOpen:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  void *v7;
  _QWORD v9[5];
  int v10;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(a2 + 48));
  *(_QWORD *)(a2 + 48) = 0;
  v7 = *(void **)(a2 + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_4;
  v9[3] = &unk_1E491F320;
  v9[4] = a2;
  v10 = a5;
  return objc_msgSend(v7, "invokeDelegateCallbackWithBlock:", v9);
}

uint64_t __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "cameraViewfinderStream:didCloseWithStatus:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
  return result;
}

void __42__FigCameraViewfinderStream__setEndpoint___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A858DD40]();
  -[FigCameraViewfinderStream _handleStreamsChanged:](objc_msgSend(*(id *)(a1 + 32), "referencedObject"));
  objc_autoreleasePoolPop(v2);
}

- (void)_handleStreamsChanged:(uint64_t)a1
{
  uint64_t v1;
  uint64_t CMBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v15;
  NSObject *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CFTypeRef cf;
  CFTypeRef v23[16];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    cf = 0;
    CMBaseObject = FigEndpointGetCMBaseObject();
    v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
    if (!v3 || (v4 = *MEMORY[0x1E0C9AE00], v3(CMBaseObject, *MEMORY[0x1E0CA43C8], *MEMORY[0x1E0C9AE00], &cf)))
    {
      FigDebugAssert3();
      goto LABEL_31;
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (void *)cf;
    v6 = objc_msgSend((id)cf, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v6)
    {
      v7 = v6;
      v17 = v1;
      v8 = *(_QWORD *)v19;
      v9 = *MEMORY[0x1E0CA4820];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v11 = *(const void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v23[0] = 0;
          v12 = FigEndpointStreamGetCMBaseObject();
          v13 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
          if (v13)
            v13(v12, v9, v4, v23);
          if (FigCFEqual())
          {
            if (v23[0])
              CFRelease(v23[0]);
            goto LABEL_19;
          }
          if (v23[0])
            CFRelease(v23[0]);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v7)
          continue;
        break;
      }
      v11 = 0;
LABEL_19:
      v1 = v17;
    }
    else
    {
      v11 = 0;
    }
    if (dword_1ECFE95B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v15 = *(const void **)(v1 + 32);
    if (!v11 || v15)
    {
      *(_QWORD *)(v1 + 32) = v11;
      if (!v11)
      {
        if (!v15)
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    else
    {
      objc_msgSend(*(id *)(v1 + 16), "transitionToState:fromState:", 4, 2);
      if (dword_1ECFE95B0)
      {
        v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v15 = *(const void **)(v1 + 32);
      *(_QWORD *)(v1 + 32) = v11;
    }
    CFRetain(v11);
    if (!v15)
    {
LABEL_31:
      if (cf)
        CFRelease(cf);
      return;
    }
LABEL_30:
    CFRelease(v15);
    goto LABEL_31;
  }
}

@end
