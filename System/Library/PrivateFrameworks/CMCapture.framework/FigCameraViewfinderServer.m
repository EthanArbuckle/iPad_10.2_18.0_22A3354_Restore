@implementation FigCameraViewfinderServer

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  if (a4)
    objc_msgSend(a4, "clientAuditToken", v7, v8);
  objc_msgSend((id)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, (uint64_t)a3), "viewfinderSessionDidBegin:withIdentifier:clientAuditTokenData:", a4, objc_msgSend(a4, "identifier"), objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 32));
}

- (uint64_t)_remoteViewfinderForLocalViewfinder:(uint64_t)a1
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  result = 0;
  v25 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = *(void **)(a1 + 16);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend((id)objc_msgSend(v10, "exportedObject"), "isEqual:", a2) & 1) != 0)
            return objc_msgSend(v10, "remoteObjectProxy");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v7)
          continue;
        break;
      }
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = *(void **)(a1 + 16);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v16;
      while (1)
      {
        if (*(_QWORD *)v16 != v14)
          objc_enumerationMutation(v11);
        if (!--v13)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (!v13)
            break;
        }
      }
    }
    FigLogBacktrace();
    return 0;
  }
  return result;
}

uint64_t __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  BOOL v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v8;
  NSObject *callbackQueue;
  uint64_t v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[7];
  _QWORD v16[6];
  os_log_type_t type;
  int v18;
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a4)
    objc_msgSend(a4, "auditToken");
  else
    memset(v19, 0, sizeof(v19));
  v6 = +[FigCameraViewfinder clientIsAllowedToUseCameraViewfinder:](FigCameraViewfinder, "clientIsAllowedToUseCameraViewfinder:", v19);
  if (v6)
  {
    if (dword_1ECFE95F0)
    {
      v18 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a4, "setExportedInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7279D8, v13, v14));
    v8 = +[FigCameraViewfinderLocal cameraViewfinder](FigCameraViewfinderLocal, "cameraViewfinder");
    callbackQueue = self->_callbackQueue;
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke;
    v16[3] = &unk_1E491E748;
    v16[4] = self;
    v16[5] = a4;
    fig_dispatch_async_autoreleasepool(callbackQueue, v16);
    objc_msgSend(v8, "setDelegate:queue:", self, self->_callbackQueue);
    objc_msgSend(a4, "setExportedObject:", v8);
    objc_msgSend(a4, "setRemoteObjectInterface:", +[FigCameraViewfinderRemote remoteObjectCallbacksInterface](FigCameraViewfinderRemote, "remoteObjectCallbacksInterface"));
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v15[3] = &unk_1E491EB90;
    v15[4] = v8;
    v15[5] = self;
    v15[6] = a4;
    objc_msgSend(a4, "setInvalidationHandler:", v15);
    objc_msgSend(a4, "setInterruptionHandler:", &__block_literal_global_66_0);
    objc_msgSend(a4, "resume");
  }
  else
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v6;
}

- (FigCameraViewfinderServer)init
{
  FigCameraViewfinderServer *v2;
  NSXPCListener *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)FigCameraViewfinderServer;
  v2 = -[FigCameraViewfinderServer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.coremedia.cameraviewfinder"));
    -[NSXPCListener setDelegate:](v3, "setDelegate:", v2);
    v2->_serviceListener = v3;
    v2->_connections = (NSMutableArray *)objc_opt_new();
    v2->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.cameraviewfinder.server.callbacks", 0);
    v2->_osStateHandle = -[FigCaptureOSStateHandle initWithTitle:queue:dataProvider:]([FigCaptureOSStateHandle alloc], "initWithTitle:queue:dataProvider:", CFSTR("FigCameraViewfinderServer"), v2->_callbackQueue, v2);
    -[NSXPCListener resume](v2->_serviceListener, "resume");
    if (dword_1ECFE95F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderServer;
  -[FigCameraViewfinderServer dealloc](&v3, sel_dealloc);
}

void __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  NSObject *v3;
  _QWORD v4[4];
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:queue:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "stop");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
  v4[2] = __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke_3;
  v4[3] = &unk_1E491E748;
  v5 = v2;
  fig_dispatch_async_autoreleasepool(v3, v4);
}

uint64_t __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionWillBegin:(id)a4
{
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  if (a4)
    objc_msgSend(a4, "clientAuditToken", v7, v8);
  objc_msgSend((id)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, (uint64_t)a3), "viewfinderSessionWillBegin:withIdentifier:clientAuditTokenData:", a4, objc_msgSend(a4, "identifier"), objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 32));
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  objc_msgSend((id)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, (uint64_t)a3), "viewfinderSessionDidEnd");
}

- (void)cameraViewfinderSession:(id)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6
{
  uint64_t v8;
  void *v10;
  uint64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v8 = *(_QWORD *)&a4;
  v10 = (void *)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, objc_msgSend(a3, "viewfinder"));
  v11 = objc_msgSend(a3, "identifier");
  v12 = *a6;
  objc_msgSend(v10, "viewfinderSession:didCapturePhotoWithStatus:thumbnailData:timestamp:", v11, v8, a5, &v12);
}

- (void)cameraViewfinderSessionPreviewStreamDidOpen:(id)a3
{
  objc_msgSend((id)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, objc_msgSend(a3, "viewfinder")), "viewfinderSessionPreviewStreamDidOpen:", objc_msgSend(a3, "identifier"));
}

- (void)cameraViewfinderSession:(id)a3 previewStreamDidCloseWithStatus:(int)a4
{
  objc_msgSend((id)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, objc_msgSend(a3, "viewfinder")), "viewfinderSession:previewStreamDidCloseWithStatus:", objc_msgSend(a3, "identifier"), *(_QWORD *)&a4);
}

- (void)cameraViewfinderSessionDidStartMovieRecording:(id)a3
{
  objc_msgSend((id)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, objc_msgSend(a3, "viewfinder")), "viewfinderSessionDidStartMovieRecording:", objc_msgSend(a3, "identifier"));
}

- (void)cameraViewfinderSessionDidFinishMovieRecording:(id)a3
{
  objc_msgSend((id)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, objc_msgSend(a3, "viewfinder")), "viewfinderSessionDidFinishMovieRecording:", objc_msgSend(a3, "identifier"));
}

- (id)osStatePropertyList
{
  void *v3;
  NSMutableArray *connections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const __CFString *v14;
  void *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_connections, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  connections = self->_connections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(connections);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "description"));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v6);
  }
  v14 = CFSTR("connections");
  v15 = v3;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
}

@end
