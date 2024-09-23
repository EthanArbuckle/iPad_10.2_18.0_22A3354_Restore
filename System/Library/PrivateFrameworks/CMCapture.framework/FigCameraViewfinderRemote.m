@implementation FigCameraViewfinderRemote

+ (id)cameraViewfinder
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (FigCameraViewfinderRemote)init
{
  FigCameraViewfinderRemote *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigCameraViewfinderRemote;
  v2 = -[FigCameraViewfinder init](&v4, sel_init);
  if (v2)
  {
    v2->_weakSessionTable = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v2->_connectionManagementQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.cameraviewfinderremote.connectionmanagement", 0);
    -[FigCameraViewfinderRemote _setupStateMachine]((uint64_t)v2);
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
    v2 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("FigCameraViewfinderRemoteStateMachine"), 2, 1, result);
    *(_QWORD *)(v1 + 32) = v2;
    -[FigStateMachine setLabel:forState:](v2, "setLabel:forState:", CFSTR("Idle"), 1);
    objc_msgSend(*(id *)(v1 + 32), "setLabel:forState:", CFSTR("Running"), 2);
    return objc_msgSend(*(id *)(v1 + 32), "setPerformsAtomicStateTransitions:", 0);
  }
  return result;
}

uint64_t __46__FigCameraViewfinderRemote_startWithOptions___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "transitionToState:fromState:", 2, 1);
  if ((_DWORD)result)
    return -[FigCameraViewfinderRemote _bringupXPCConnectionAndStartRemoteViewfinderWithOptions:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (uint64_t)_bringupXPCConnectionAndStartRemoteViewfinderWithOptions:(uint64_t)result
{
  uint64_t v3;
  FigNSXPCConnection *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[7];

  if (result)
  {
    v3 = result;
    v4 = -[FigNSXPCConnection initWithMachServiceName:options:]([FigNSXPCConnection alloc], "initWithMachServiceName:options:", CFSTR("com.apple.coremedia.cameraviewfinder"), 4096);
    -[FigNSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7279D8));
    -[FigNSXPCConnection setExportedInterface:](v4, "setExportedInterface:", objc_msgSend((id)objc_opt_class(), "remoteObjectCallbacksInterface"));
    -[FigNSXPCConnection setExportedObject:](v4, "setExportedObject:", v3);
    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke;
    v8[3] = &unk_1E491EB90;
    v8[4] = v3;
    v8[5] = v4;
    v8[6] = a2;
    -[FigNSXPCConnection setInvalidationHandler:](v4, "setInvalidationHandler:", v8);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_3;
    v7[3] = &unk_1E491E748;
    v7[4] = v3;
    v7[5] = a2;
    -[FigNSXPCConnection setInterruptionHandler:](v4, "setInterruptionHandler:", v7);
    *(_QWORD *)(v3 + 40) = v4;
    -[FigNSXPCConnection resume](v4, "resume");
    v6 = (id)-[FigNSXPCConnection remoteObjectProxyWithErrorHandler:](v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_19);
    *(_QWORD *)(v3 + 56) = v6;
    return objc_msgSend(v6, "startWithOptions:", a2);
  }
  return result;
}

+ (id)remoteObjectCallbacksInterface
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6CF560);
  v3 = objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE727978);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_viewfinderSessionWillBegin_withIdentifier_clientAuditTokenData_, 0, 0);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_viewfinderSessionDidBegin_withIdentifier_clientAuditTokenData_, 0, 0);
  return v2;
}

- (void)startWithOptions:(id)a3
{
  NSObject *connectionManagementQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v7[6];
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (+[FigCameraViewfinder clientIsAllowedToUseCameraViewfinder:](FigCameraViewfinder, "clientIsAllowedToUseCameraViewfinder:", v8, FigCaptureGetCurrentProcessAuditToken(v8)))
  {
    connectionManagementQueue = self->_connectionManagementQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__FigCameraViewfinderRemote_startWithOptions___block_invoke;
    v7[3] = &unk_1E491E748;
    v7[4] = self;
    v7[5] = a3;
    fig_dispatch_async_autoreleasepool(connectionManagementQueue, v7);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
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

- (void)dealloc
{
  objc_super v3;

  -[FigNSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderRemote;
  -[FigCameraViewfinder dealloc](&v3, sel_dealloc);
}

- (void)stop
{
  NSObject *connectionManagementQueue;
  _QWORD v3[5];

  connectionManagementQueue = self->_connectionManagementQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__FigCameraViewfinderRemote_stop__block_invoke;
  v3[3] = &unk_1E491E720;
  v3[4] = self;
  fig_dispatch_async_autoreleasepool(connectionManagementQueue, v3);
}

uint64_t __33__FigCameraViewfinderRemote_stop__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "transitionToState:fromState:", 1, 2);
  if ((_DWORD)result)
  {
    -[FigCameraViewfinderRemote _teardownRemoteViewfinderAndInvalidateXPCConnection](*(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "blockUntilInvalidateHandlerHasBeenCalled");
    v3 = *(_QWORD *)(a1 + 32);

    *(_QWORD *)(v3 + 40) = 0;
    v4 = *(_QWORD *)(a1 + 32);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_msgSend(*(id *)(v4 + 24), "objectEnumerator", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDisconnectedFromServer");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    return objc_msgSend(*(id *)(a1 + 32), "viewfinderSessionDidEnd");
  }
  return result;
}

- (uint64_t)_teardownRemoteViewfinderAndInvalidateXPCConnection
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 56), "stop");

    *(_QWORD *)(v1 + 56) = 0;
    return objc_msgSend(*(id *)(v1 + 40), "invalidate");
  }
  return result;
}

- (void)viewfinderSessionWillBegin:(id)a3 withIdentifier:(int64_t)a4 clientAuditTokenData:(id)a5
{
  FigCameraViewfinderSessionRemote *v8;
  FigDelegateStorage *delegateStorage;
  id v10;
  FigDelegateStorage *v11;
  _QWORD v12[6];
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a5, "getBytes:length:", &v14, 32);
  v8 = [FigCameraViewfinderSessionRemote alloc];
  delegateStorage = self->super._delegateStorage;
  v13[0] = v14;
  v13[1] = v15;
  v10 = -[FigCameraViewfinderSessionRemote _initWithRemoteViewfinderSession:clientAuditToken:delegateStorage:](v8, "_initWithRemoteViewfinderSession:clientAuditToken:delegateStorage:", a3, v13, delegateStorage);
  -[NSMapTable setObject:forKey:](self->_weakSessionTable, "setObject:forKey:", v10, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4));
  v11 = self->super._delegateStorage;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__FigCameraViewfinderRemote_viewfinderSessionWillBegin_withIdentifier_clientAuditTokenData___block_invoke;
  v12[3] = &unk_1E491F4A8;
  v12[4] = self;
  v12[5] = v10;
  -[FigDelegateStorage invokeDelegateCallbackWithBlock:](v11, "invokeDelegateCallbackWithBlock:", v12);
}

uint64_t __92__FigCameraViewfinderRemote_viewfinderSessionWillBegin_withIdentifier_clientAuditTokenData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setDelegateActiveViewfinderSession:", *(_QWORD *)(a1 + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (dword_1ECFE9BD0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinder:viewfinderSessionWillBegin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6, v7);
  }
  return result;
}

- (void)viewfinderSessionDidBegin:(id)a3 withIdentifier:(int64_t)a4 clientAuditTokenData:(id)a5
{
  id v9;
  id v10;
  FigCameraViewfinderSessionRemote *v11;
  FigDelegateStorage *delegateStorage;
  FigDelegateStorage *v13;
  _QWORD v14[6];
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  v9 = -[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4));
  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(a5, "getBytes:length:", &v16, 32);
    v11 = [FigCameraViewfinderSessionRemote alloc];
    delegateStorage = self->super._delegateStorage;
    v15[0] = v16;
    v15[1] = v17;
    v10 = -[FigCameraViewfinderSessionRemote _initWithRemoteViewfinderSession:clientAuditToken:delegateStorage:](v11, "_initWithRemoteViewfinderSession:clientAuditToken:delegateStorage:", a3, v15, delegateStorage);
    -[NSMapTable setObject:forKey:](self->_weakSessionTable, "setObject:forKey:", v10, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4));
  }
  v13 = self->super._delegateStorage;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__FigCameraViewfinderRemote_viewfinderSessionDidBegin_withIdentifier_clientAuditTokenData___block_invoke;
  v14[3] = &unk_1E491F4A8;
  v14[4] = self;
  v14[5] = v10;
  -[FigDelegateStorage invokeDelegateCallbackWithBlock:](v13, "invokeDelegateCallbackWithBlock:", v14);
}

uint64_t __91__FigCameraViewfinderRemote_viewfinderSessionDidBegin_withIdentifier_clientAuditTokenData___block_invoke(uint64_t a1, void *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setDelegateActiveViewfinderSession:", *(_QWORD *)(a1 + 40));
  if (dword_1ECFE9BD0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(a2, "cameraViewfinder:viewfinderSessionDidBegin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6, v7);
}

- (void)viewfinderSessionDidEnd
{
  FigDelegateStorage *delegateStorage;
  _QWORD v3[5];

  delegateStorage = self->super._delegateStorage;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__FigCameraViewfinderRemote_viewfinderSessionDidEnd__block_invoke;
  v3[3] = &unk_1E491F4D0;
  v3[4] = self;
  -[FigDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v3);
}

void __52__FigCameraViewfinderRemote_viewfinderSessionDidEnd__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "delegateActiveViewfinderSession");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "setDelegateActiveViewfinderSession:", 0);
    if (dword_1ECFE9BD0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a2, "cameraViewfinder:viewfinderSessionDidEnd:", *(_QWORD *)(a1 + 32), v5, v7, v8);

  }
}

- (void)viewfinderSession:(int64_t)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6
{
  id v10;
  FigDelegateStorage *delegateStorage;
  _QWORD v12[7];
  int v13;
  __int128 v14;
  int64_t var3;

  v10 = -[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3));
  if (v10)
  {
    delegateStorage = self->super._delegateStorage;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__FigCameraViewfinderRemote_viewfinderSession_didCapturePhotoWithStatus_thumbnailData_timestamp___block_invoke;
    v12[3] = &unk_1E491F4F8;
    v13 = a4;
    v12[4] = self;
    v12[5] = v10;
    v12[6] = a5;
    v14 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    -[FigDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v12);
  }
}

uint64_t __97__FigCameraViewfinderRemote_viewfinderSession_didCapturePhotoWithStatus_thumbnailData_timestamp___block_invoke(uint64_t a1, void *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9BD0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = *(unsigned int *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = *(_OWORD *)(a1 + 60);
  v12 = *(_QWORD *)(a1 + 76);
  return objc_msgSend(a2, "cameraViewfinderSession:didCapturePhotoWithStatus:thumbnailData:timestamp:", v6, v5, v7, &v11, v9, v10);
}

- (void)viewfinderSessionPreviewStreamDidOpen:(int64_t)a3
{
  objc_msgSend(-[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3)), "_previewStreamDidOpen");
}

- (void)viewfinderSession:(int64_t)a3 previewStreamDidCloseWithStatus:(int)a4
{
  objc_msgSend(-[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3)), "_previewStreamDidCloseWithStatus:", *(_QWORD *)&a4);
}

- (void)viewfinderSessionDidStartMovieRecording:(int64_t)a3
{
  objc_msgSend(-[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3)), "_movieRecordingDidStart");
}

- (void)viewfinderSessionDidFinishMovieRecording:(int64_t)a3
{
  objc_msgSend(-[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3)), "_movieRecordingDidFinish");
}

void __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke(int8x16_t *a1)
{
  int8x16_t v1;
  NSObject *v2;
  _QWORD v3[4];
  int8x16_t v4;
  uint64_t v5;

  v1 = vextq_s8(a1[2], a1[2], 8uLL);
  v2 = *(NSObject **)(a1[2].i64[0] + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_2;
  v3[3] = &unk_1E491EB90;
  v4 = v1;
  v5 = a1[3].i64[0];
  fig_dispatch_async_autoreleasepool(v2, v3);
}

void __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "explicitlyInvalidated") & 1) == 0)
    -[FigCameraViewfinderRemote _handleServerDeathWithOptions:reconnect:](*(id **)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)_handleServerDeathWithOptions:(int)a3 reconnect:
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v14 = v3;
      LODWORD(v13) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(a1[4], "currentState", v13, v14) == 2)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = (void *)objc_msgSend(a1[3], "objectEnumerator");
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "_serverDied");
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }
      objc_msgSend(a1, "viewfinderSessionDidEnd");
      if (a3)
      {

        v12 = (id)objc_msgSend(a1[5], "remoteObjectProxyWithErrorHandler:", &__block_literal_global_115);
        a1[7] = v12;
        objc_msgSend(v12, "startWithOptions:", a2);
      }
      else if (objc_msgSend(a1[4], "transitionToState:fromState:", 1, 2))
      {
        objc_msgSend(a1[7], "stop");

        a1[7] = 0;
        objc_msgSend(a1[5], "invalidate");

        a1[5] = 0;
      }
    }
  }
}

void __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_3(uint64_t a1)
{
  __int128 v1;
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_4;
  v3[3] = &unk_1E491E748;
  v4 = v1;
  fig_dispatch_async_autoreleasepool(v2, v3);
}

void __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_4(uint64_t a1)
{
  int v2;
  _OWORD v3[2];

  v2 = +[FigCameraViewfinder clientIsAllowedToUseCameraViewfinder:](FigCameraViewfinder, "clientIsAllowedToUseCameraViewfinder:", v3, FigCaptureGetCurrentProcessAuditToken(v3));
  -[FigCameraViewfinderRemote _handleServerDeathWithOptions:reconnect:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40), v2);
}

@end
