@implementation FigCameraViewfinderSessionLocal

- (id)_initWithOwningViewfinder:(id)a3 captureSessionProxy:(id)a4 delegateStorage:(id)a5
{
  id *v8;
  id *v9;
  FigCameraViewfinderStream *v10;
  objc_super v12;

  if (a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)FigCameraViewfinderSessionLocal;
    v8 = -[FigCameraViewfinderSession initSubclass](&v12, sel_initSubclass);
    v9 = v8;
    if (v8)
    {
      -[FigCameraViewfinderSessionLocal _setupStateMachine]((uint64_t)v8);
      objc_storeWeak(v9 + 2, a3);
      v9[5] = a4;
      v9[6] = (id)objc_msgSend(a4, "identifier");
      v9[1] = a5;
      v9[8] = dispatch_queue_create("com.apple.coremedia.cameraviewfindersession.previewstream", 0);
      v10 = objc_alloc_init(FigCameraViewfinderStream);
      v9[7] = v10;
      -[FigCameraViewfinderStream setDelegate:queue:](v10, "setDelegate:queue:", v9, v9[8]);
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

- (uint64_t)_setupStateMachine
{
  uint64_t v1;
  FigStateMachine *v2;

  if (result)
  {
    v1 = result;
    v2 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("FigCameraViewfinderSessionLocalStateMachine"), 7, 1, result);
    *(_QWORD *)(v1 + 24) = v2;
    -[FigStateMachine setLabel:forState:](v2, "setLabel:forState:", CFSTR("Idle"), 1);
    objc_msgSend(*(id *)(v1 + 24), "setLabel:forState:", CFSTR("OpeningPreviewStream"), 2);
    objc_msgSend(*(id *)(v1 + 24), "setLabel:forState:", CFSTR("OpeningPreviewTap"), 4);
    objc_msgSend(*(id *)(v1 + 24), "setLabel:forState:", CFSTR("StreamingPreview"), 8);
    objc_msgSend(*(id *)(v1 + 24), "setLabel:forState:", CFSTR("ClosingPreviewTap"), 16);
    objc_msgSend(*(id *)(v1 + 24), "setLabel:forState:", CFSTR("ClosingPreviewStream"), 32);
    objc_msgSend(*(id *)(v1 + 24), "setLabel:forState:", CFSTR("SessionEnded"), 64);
    objc_msgSend(*(id *)(v1 + 24), "markStateAsTerminal:", 64);
    objc_msgSend(*(id *)(v1 + 24), "setPerformsAtomicStateTransitions:", 0);
    objc_msgSend(*(id *)(v1 + 24), "whenTransitioningToState:callHandler:", 8, &__block_literal_global_49);
    objc_msgSend(*(id *)(v1 + 24), "whenTransitioningToStates:callHandler:", 65, &__block_literal_global_123_0);
    return objc_msgSend(*(id *)(v1 + 24), "whenTransitioningToStateFails:callHandler:", 2, &__block_literal_global_127);
  }
  return result;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_viewfinder, 0);

  -[FigCameraViewfinderStream setDelegate:queue:](self->_previewStream, "setDelegate:queue:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderSessionLocal;
  -[FigCameraViewfinderSession dealloc](&v3, sel_dealloc);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_captureSessionProxy;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 clientAuditToken](result, "clientAuditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (void)openPreviewStreamWithOptions:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *previewStreamQueue;
  _QWORD v7[6];
  os_log_type_t type;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE97D0)
  {
    v9 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  previewStreamQueue = self->_previewStreamQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__FigCameraViewfinderSessionLocal_openPreviewStreamWithOptions___block_invoke;
  v7[3] = &unk_1E491E748;
  v7[4] = self;
  v7[5] = a3;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v7);
}

uint64_t __64__FigCameraViewfinderSessionLocal_openPreviewStreamWithOptions___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "transitionToState:fromState:", 2, 1);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "openWithDestination:", objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PreviewStreamDestination")));
  return result;
}

- (void)closePreviewStream
{
  NSObject *previewStreamQueue;
  _QWORD v3[5];

  previewStreamQueue = self->_previewStreamQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__FigCameraViewfinderSessionLocal_closePreviewStream__block_invoke;
  v3[3] = &unk_1E491E720;
  v3[4] = self;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v3);
}

uint64_t __53__FigCameraViewfinderSessionLocal_closePreviewStream__block_invoke(uint64_t a1)
{
  return -[FigCameraViewfinderSessionLocal _closePreviewStream](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_closePreviewStream
{
  uint64_t v1;
  id *v2;
  id *v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v2 = (id *)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v6 = v1;
      LODWORD(v5) = 0;
      FigDebugAssert3();
    }
    result = objc_msgSend(v2[3], "currentState", v5, v6);
    if ((_DWORD)result == 8 || (_DWORD)result == 4)
    {
      result = objc_msgSend(v2[3], "transitionToState:fromStates:", 16, 12);
      if ((_DWORD)result)
      {
        v4 = v2;
        return objc_msgSend(v2[5], "closePreviewTap");
      }
    }
    else if ((_DWORD)result == 2)
    {
      result = objc_msgSend(v2[3], "transitionToState:fromState:", 32, 2);
      if ((_DWORD)result)
        return objc_msgSend(v2[7], "close");
    }
  }
  return result;
}

- (void)cameraViewfinderStreamDidOpen:(id)a3
{
  uint64_t v3;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  if (!_FigIsCurrentDispatchQueue())
  {
    v8 = v3;
    LODWORD(v7) = 0;
    FigDebugAssert3();
  }
  if (-[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 4, 2, v7, v8))
  {
    v5 = -[FigCaptureSessionProxy openPreviewTapWithDelegate:](self->_captureSessionProxy, "openPreviewTapWithDelegate:", self);
    if (v5)
    {
      v6 = v5;
      if (-[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 32, 4))
      {
        self->_previewStreamClosedErrorStatus = v6;
        -[FigCameraViewfinderStream close](self->_previewStream, "close");
      }
    }
  }
}

- (void)cameraViewfinderStream:(id)a3 didCloseWithStatus:(int)a4
{
  uint64_t v4;
  int v7;
  uint64_t v8;
  unsigned int previewStreamClosedErrorStatus;
  uint64_t v10;
  FigStateMachine *stateMachine;
  FigCameraViewfinderSessionLocal *v12;
  uint64_t v13;
  uint64_t v14;

  if (!_FigIsCurrentDispatchQueue())
  {
    v14 = v4;
    LODWORD(v13) = 0;
    FigDebugAssert3();
  }
  v7 = -[FigStateMachine currentState](self->_stateMachine, "currentState", v13, v14);
  if (v7 > 7)
  {
    if (v7 != 8)
    {
      if (v7 == 16)
      {
        self->_previewStreamClosed = 1;
        self->_previewStreamClosedErrorStatus = a4;
      }
      else if (v7 == 32)
      {
        if (self->_ended)
          v8 = 64;
        else
          v8 = 1;
        previewStreamClosedErrorStatus = self->_previewStreamClosedErrorStatus;
        if (previewStreamClosedErrorStatus)
          v10 = previewStreamClosedErrorStatus;
        else
          v10 = a4;
        self->_previewStreamClosedErrorStatus = v10;
        stateMachine = self->_stateMachine;
LABEL_24:
        -[FigStateMachine transitionToState:errorStatus:](stateMachine, "transitionToState:errorStatus:", v8, v10);
        return;
      }
      return;
    }
LABEL_16:
    if (-[FigStateMachine transitionToState:fromStates:](self->_stateMachine, "transitionToState:fromStates:", 16, 12))
    {
      self->_previewStreamClosed = 1;
      self->_previewStreamClosedErrorStatus = a4;
      v12 = self;
      -[FigCaptureSessionProxy closePreviewTap](self->_captureSessionProxy, "closePreviewTap");
    }
    return;
  }
  if (v7 == 2)
  {
    if (self->_ended)
      v8 = 64;
    else
      v8 = 1;
    stateMachine = self->_stateMachine;
    v10 = self->_previewStreamClosedErrorStatus;
    goto LABEL_24;
  }
  if (v7 == 4)
    goto LABEL_16;
}

- (void)captureSessionPreviewTapDidOpen:(id)a3
{
  NSObject *previewStreamQueue;
  _QWORD v4[5];

  previewStreamQueue = self->_previewStreamQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__FigCameraViewfinderSessionLocal_captureSessionPreviewTapDidOpen___block_invoke;
  v4[3] = &unk_1E491E720;
  v4[4] = self;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v4);
}

uint64_t __67__FigCameraViewfinderSessionLocal_captureSessionPreviewTapDidOpen___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "transitionToState:fromState:", 8, 4);
}

- (void)captureSessionPreviewTapDidClose:(id)a3
{
  NSObject *previewStreamQueue;
  _QWORD v4[5];

  previewStreamQueue = self->_previewStreamQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__FigCameraViewfinderSessionLocal_captureSessionPreviewTapDidClose___block_invoke;
  v4[3] = &unk_1E491E720;
  v4[4] = self;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v4);
}

void __68__FigCameraViewfinderSessionLocal_captureSessionPreviewTapDidClose___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "currentState") == 16)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v2 + 72))
    {
      if (*(_BYTE *)(v2 + 32))
        v3 = 64;
      else
        v3 = 1;
      objc_msgSend(*(id *)(v2 + 24), "transitionToState:errorStatus:", v3, *(unsigned int *)(v2 + 76));
    }
    else if (objc_msgSend(*(id *)(v2 + 24), "transitionToState:fromState:", 32, 16))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "close");
    }
  }

}

- (void)captureSession:(id)a3 previewTapDidOutputSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  -[FigCameraViewfinderStream enqueueVideoSampleBuffer:](self->_previewStream, "enqueueVideoSampleBuffer:", a4);
}

- (void)_captureSessionDidStop
{
  NSObject *previewStreamQueue;
  _QWORD v3[5];

  previewStreamQueue = self->_previewStreamQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__FigCameraViewfinderSessionLocal__captureSessionDidStop__block_invoke;
  v3[3] = &unk_1E491E720;
  v3[4] = self;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v3);
}

uint64_t __57__FigCameraViewfinderSessionLocal__captureSessionDidStop__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "transitionToState:fromState:", 64, 1);
  if ((result & 1) == 0)
    return -[FigCameraViewfinderSessionLocal _closePreviewStream](*(_QWORD *)(a1 + 32));
  return result;
}

- (void)_captureSessionDidCapturePhotoWithStatus:(int)a3 thumbnailData:(id)a4 timestamp:(id *)a5
{
  FigDelegateStorage *delegateStorage;
  _QWORD v6[6];
  int v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  if (!self->_ended)
  {
    delegateStorage = self->super._delegateStorage;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __100__FigCameraViewfinderSessionLocal__captureSessionDidCapturePhotoWithStatus_thumbnailData_timestamp___block_invoke;
    v6[3] = &unk_1E4921628;
    v7 = a3;
    v6[4] = self;
    v6[5] = a4;
    v8 = *a5;
    -[FigDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v6);
  }
}

uint64_t __100__FigCameraViewfinderSessionLocal__captureSessionDidCapturePhotoWithStatus_thumbnailData_timestamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v5 = *(unsigned int *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_OWORD *)(a1 + 52);
    v9 = *(_QWORD *)(a1 + 68);
    return objc_msgSend(a2, "cameraViewfinderSession:didCapturePhotoWithStatus:thumbnailData:timestamp:", v6, v5, v7, &v8);
  }
  return result;
}

- (void)_captureSessionDidStartMovieRecording
{
  FigDelegateStorage *delegateStorage;
  _QWORD v3[5];

  if (!self->_ended)
  {
    delegateStorage = self->super._delegateStorage;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __72__FigCameraViewfinderSessionLocal__captureSessionDidStartMovieRecording__block_invoke;
    v3[3] = &unk_1E491F588;
    v3[4] = self;
    -[FigDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v3);
  }
}

uint64_t __72__FigCameraViewfinderSessionLocal__captureSessionDidStartMovieRecording__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "cameraViewfinderSessionDidStartMovieRecording:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_captureSessionDidFinishMovieRecording
{
  FigDelegateStorage *delegateStorage;
  _QWORD v3[5];

  if (!self->_ended)
  {
    delegateStorage = self->super._delegateStorage;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __73__FigCameraViewfinderSessionLocal__captureSessionDidFinishMovieRecording__block_invoke;
    v3[3] = &unk_1E491F588;
    v3[4] = self;
    -[FigDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v3);
  }
}

uint64_t __73__FigCameraViewfinderSessionLocal__captureSessionDidFinishMovieRecording__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "cameraViewfinderSessionDidFinishMovieRecording:", *(_QWORD *)(a1 + 32));
  return result;
}

- (id)viewfinder
{
  return objc_loadWeak((id *)&self->_viewfinder);
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_2;
  v4[3] = &unk_1E491F588;
  v4[4] = a2;
  return objc_msgSend(v2, "invokeDelegateCallbackWithBlock:", v4);
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "cameraViewfinderSessionPreviewStreamDidOpen:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_3(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v5;
  void *v6;
  uint64_t result;
  _QWORD v8[5];
  int v9;

  *(_BYTE *)(a2 + 72) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  if (a3 != 1)
  {
    if (a5 == -50)
      v5 = -16290;
    else
      v5 = a5;
    v6 = *(void **)(a2 + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_4;
    v8[3] = &unk_1E491F560;
    v8[4] = a2;
    v9 = v5;
    return objc_msgSend(v6, "invokeDelegateCallbackWithBlock:", v8);
  }
  return result;
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "cameraViewfinderSession:previewStreamDidCloseWithStatus:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
  return result;
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_5(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  _QWORD v7[7];

  if (a3 == 64)
  {
    v7[5] = v3;
    v7[6] = v4;
    v5 = *(void **)(a2 + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_6;
    v7[3] = &unk_1E491F588;
    v7[4] = a2;
    return objc_msgSend(v5, "invokeDelegateCallbackWithBlock:", v7);
  }
  return result;
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "cameraViewfinderSession:previewStreamDidCloseWithStatus:", *(_QWORD *)(a1 + 32), 4294951005);
  return result;
}

@end
