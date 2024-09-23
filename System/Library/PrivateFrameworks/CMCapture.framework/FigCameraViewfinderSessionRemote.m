@implementation FigCameraViewfinderSessionRemote

- (uint64_t)_setupStateMachine
{
  uint64_t v1;
  FigStateMachine *v2;

  if (result)
  {
    v1 = result;
    v2 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("FigCameraViewfinderSessionRemoteStateMachine"), 4, 1, result);
    *(_QWORD *)(v1 + 64) = v2;
    -[FigStateMachine setLabel:forState:](v2, "setLabel:forState:", CFSTR("Idle"), 1);
    objc_msgSend(*(id *)(v1 + 64), "setLabel:forState:", CFSTR("OpeningPreviewStream"), 2);
    objc_msgSend(*(id *)(v1 + 64), "setLabel:forState:", CFSTR("StreamingPreview"), 4);
    objc_msgSend(*(id *)(v1 + 64), "setLabel:forState:", CFSTR("DetachedFromServer"), 8);
    objc_msgSend(*(id *)(v1 + 64), "markStateAsTerminal:", 8);
    objc_msgSend(*(id *)(v1 + 64), "whenTransitioningToStates:callHandler:", 9, &__block_literal_global_142);
    objc_msgSend(*(id *)(v1 + 64), "whenTransitioningFromState:toState:callHandler:", 2, 4, &__block_literal_global_147);
    return objc_msgSend(*(id *)(v1 + 64), "whenTransitioningToStateFails:callHandler:", 2, &__block_literal_global_153);
  }
  return result;
}

- (id)_initWithRemoteViewfinderSession:(id)a3 clientAuditToken:(id *)a4 delegateStorage:(id)a5
{
  char *v8;
  __int128 v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FigCameraViewfinderSessionRemote;
  v8 = -[FigCameraViewfinderSession initSubclass](&v11, sel_initSubclass);
  if (v8)
  {
    *((_QWORD *)v8 + 2) = a3;
    v9 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)(v8 + 24) = *(_OWORD *)a4->var0;
    *(_OWORD *)(v8 + 40) = v9;
    *((_QWORD *)v8 + 1) = a5;
    *((_DWORD *)v8 + 19) = 0;
    -[FigCameraViewfinderSessionRemote _setupStateMachine]((uint64_t)v8);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderSessionRemote;
  -[FigCameraViewfinderSession dealloc](&v3, sel_dealloc);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)openPreviewStreamWithOptions:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9BD0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 2, 1, v6, v7))
  {
    -[FigCameraViewfinderSessionRemoteObject openPreviewStreamWithOptions:](self->_remoteViewfinderSession, "openPreviewStreamWithOptions:", a3);
  }
}

- (void)closePreviewStream
{
  unsigned int v3;

  v3 = -[FigStateMachine currentState](self->_stateMachine, "currentState");
  if (v3 == 4 || v3 == 2)
    -[FigCameraViewfinderSessionRemoteObject closePreviewStream](self->_remoteViewfinderSession, "closePreviewStream");
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD v9[5];
  int v10;
  uint64_t v11;
  uint64_t v12;

  if (a3 != 1)
  {
    v11 = v5;
    v12 = v6;
    v7 = *(void **)(a2 + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2;
    v9[3] = &unk_1E491F560;
    v9[4] = a2;
    v10 = a5;
    return objc_msgSend(v7, "invokeDelegateCallbackWithBlock:", v9);
  }
  return result;
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (dword_1ECFE9BD0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSession:previewStreamDidCloseWithStatus:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), v6, v7);
  }
  return result;
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_146(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2_148;
  v4[3] = &unk_1E491F588;
  v4[4] = a2;
  return objc_msgSend(v2, "invokeDelegateCallbackWithBlock:", v4);
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2_148(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (dword_1ECFE9BD0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSessionPreviewStreamDidOpen:", *(_QWORD *)(a1 + 32), v6, v7);
  }
  return result;
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_151(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  _QWORD v7[7];

  if (a3 == 8)
  {
    v7[5] = v3;
    v7[6] = v4;
    v5 = *(void **)(a2 + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2_154;
    v7[3] = &unk_1E491F588;
    v7[4] = a2;
    return objc_msgSend(v5, "invokeDelegateCallbackWithBlock:", v7);
  }
  return result;
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2_154(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (dword_1ECFE9BD0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSession:previewStreamDidCloseWithStatus:", *(_QWORD *)(a1 + 32), 4294951005, v6, v7);
  }
  return result;
}

- (void)_serverDied
{
  -[FigStateMachine transitionToState:errorStatus:](self->_stateMachine, "transitionToState:errorStatus:", 8, 4294951004);
  -[FigCameraViewfinderSessionRemote _movieRecordingDidFinish](self, "_movieRecordingDidFinish");
}

- (void)_clientDisconnectedFromServer
{
  -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 8);
}

- (void)_previewStreamDidOpen
{
  -[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 4, 2);
}

- (void)_previewStreamDidCloseWithStatus:(int)a3
{
  -[FigStateMachine transitionToState:errorStatus:](self->_stateMachine, "transitionToState:errorStatus:", 1, *(_QWORD *)&a3);
}

- (void)_movieRecordingDidStart
{
  os_unfair_lock_s *p_recordingMovieLock;
  _BOOL4 recordingMovie;
  FigDelegateStorage *delegateStorage;
  _QWORD v6[5];

  p_recordingMovieLock = &self->_recordingMovieLock;
  os_unfair_lock_lock(&self->_recordingMovieLock);
  recordingMovie = self->_recordingMovie;
  self->_recordingMovie = 1;
  os_unfair_lock_unlock(p_recordingMovieLock);
  if (!recordingMovie)
  {
    delegateStorage = self->super._delegateStorage;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__FigCameraViewfinderSessionRemote__movieRecordingDidStart__block_invoke;
    v6[3] = &unk_1E491F4D0;
    v6[4] = self;
    -[FigDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v6);
  }
}

uint64_t __59__FigCameraViewfinderSessionRemote__movieRecordingDidStart__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (dword_1ECFE9BD0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSessionDidStartMovieRecording:", *(_QWORD *)(a1 + 32), v6, v7);
  }
  return result;
}

- (void)_movieRecordingDidFinish
{
  os_unfair_lock_s *p_recordingMovieLock;
  _BOOL4 recordingMovie;
  FigDelegateStorage *delegateStorage;
  _QWORD v6[5];

  p_recordingMovieLock = &self->_recordingMovieLock;
  os_unfair_lock_lock(&self->_recordingMovieLock);
  recordingMovie = self->_recordingMovie;
  self->_recordingMovie = 0;
  os_unfair_lock_unlock(p_recordingMovieLock);
  if (recordingMovie)
  {
    delegateStorage = self->super._delegateStorage;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__FigCameraViewfinderSessionRemote__movieRecordingDidFinish__block_invoke;
    v6[3] = &unk_1E491F4D0;
    v6[4] = self;
    -[FigDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v6);
  }
}

uint64_t __60__FigCameraViewfinderSessionRemote__movieRecordingDidFinish__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (dword_1ECFE9BD0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSessionDidFinishMovieRecording:", *(_QWORD *)(a1 + 32), v6, v7);
  }
  return result;
}

@end
