@implementation MRAVXPCPipeTransport

- (MRAVXPCPipeTransport)initWithOutputDevice:(id)a3 pipeEndpoint:(id)a4
{
  id v8;
  id v9;
  void *v10;
  MRAVXPCPipeTransport *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *serialQueue;
  uint64_t v15;
  NSXPCConnection *pipeConnection;
  uint64_t v17;
  MRAVXPCPipeTransport *v18;
  void *v19;
  void *v20;
  CURunLoopThread *v21;
  CURunLoopThread *runLoopThread;
  dispatch_semaphore_t v23;
  CURunLoopThread *v24;
  NSObject *v25;
  void *v27;
  void *v28;
  _QWORD v29[4];
  MRAVXPCPipeTransport *v30;
  NSObject *v31;
  _QWORD v32[4];
  MRAVXPCPipeTransport *v33;
  id v34;
  id location;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVXPCPipeTransport.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVXPCPipeTransport.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pipeEndpoint"));

LABEL_3:
  v36.receiver = self;
  v36.super_class = (Class)MRAVXPCPipeTransport;
  v11 = -[MRAVXPCPipeTransport init](&v36, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.mediaremote.externalDeviceTransport/serialQueue", v12);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v11->_outputDevice, a3);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v10);
    pipeConnection = v11->_pipeConnection;
    v11->_pipeConnection = (NSXPCConnection *)v15;

    objc_initWeak(&location, v11);
    v17 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __58__MRAVXPCPipeTransport_initWithOutputDevice_pipeEndpoint___block_invoke;
    v32[3] = &unk_1E30C6A78;
    objc_copyWeak(&v34, &location);
    v18 = v11;
    v33 = v18;
    v19 = (void *)MEMORY[0x194036C44](v32);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2DB3E0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v11->_pipeConnection, "setRemoteObjectInterface:", v20);
    -[NSXPCConnection setExportedInterface:](v11->_pipeConnection, "setExportedInterface:", v20);
    -[NSXPCConnection setExportedObject:](v11->_pipeConnection, "setExportedObject:", v18);
    -[NSXPCConnection setInterruptionHandler:](v11->_pipeConnection, "setInterruptionHandler:", v19);
    -[NSXPCConnection setInvalidationHandler:](v11->_pipeConnection, "setInvalidationHandler:", v19);
    -[NSXPCConnection resume](v11->_pipeConnection, "resume");
    v18->_useSystemAuthenticationPrompt = 1;
    if (!v18->_runLoop)
    {
      if (!v18->_runLoopThread)
      {
        v21 = (CURunLoopThread *)objc_alloc_init(getCURunLoopThreadClass());
        runLoopThread = v18->_runLoopThread;
        v18->_runLoopThread = v21;

        -[CURunLoopThread setDispatchQueue:](v18->_runLoopThread, "setDispatchQueue:", v11->_serialQueue);
        -[CURunLoopThread activate](v18->_runLoopThread, "activate");
      }
      v23 = dispatch_semaphore_create(0);
      v24 = v18->_runLoopThread;
      v29[0] = v17;
      v29[1] = 3221225472;
      v29[2] = __58__MRAVXPCPipeTransport_initWithOutputDevice_pipeEndpoint___block_invoke_2;
      v29[3] = &unk_1E30C5F40;
      v30 = v18;
      v25 = v23;
      v31 = v25;
      -[CURunLoopThread performBlock:](v24, "performBlock:", v29);
      dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);

    }
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __58__MRAVXPCPipeTransport_initWithOutputDevice_pipeEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "reset");
    WeakRetained = v3;
  }

}

intptr_t __58__MRAVXPCPipeTransport_initWithOutputDevice_pipeEndpoint___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[MRAVXPCPipeTransport reset](self, "reset");
  -[CURunLoopThread invalidate](self->_runLoopThread, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MRAVXPCPipeTransport;
  -[MRAVXPCPipeTransport dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromMRAVEndpointConnectionType(self->super._connectionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p connectionType=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)deviceInfo
{
  return 0;
}

- (id)uid
{
  return -[MRAVOutputDevice uid](self->_outputDevice, "uid");
}

- (id)name
{
  return -[MRAVOutputDevice name](self->_outputDevice, "name");
}

- (id)hostname
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__MRAVXPCPipeTransport_shouldUseSystemAuthenticationPrompt__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__MRAVXPCPipeTransport_shouldUseSystemAuthenticationPrompt__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__MRAVXPCPipeTransport_setShouldUseSystemAuthenticationPrompt___block_invoke;
  v4[3] = &unk_1E30C74F8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(serialQueue, v4);
}

uint64_t __63__MRAVXPCPipeTransport_setShouldUseSystemAuthenticationPrompt___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 104) = *(_BYTE *)(result + 40);
  return result;
}

- (id)error
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__MRAVXPCPipeTransport_error__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__MRAVXPCPipeTransport_error__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)createConnectionWithUserInfo:(id)a3
{
  _BOOL4 v3;
  id v4;
  id v5;
  MRStreamTransportConnection *v6;
  id v8;
  id v9;

  v8 = 0;
  v9 = 0;
  v3 = -[MRAVXPCPipeTransport getInputStream:outputStream:userInfo:](self, "getInputStream:outputStream:userInfo:", &v9, &v8, a3);
  v4 = v9;
  v5 = v8;
  v6 = 0;
  if (v3)
    v6 = -[MRStreamTransportConnection initWithInputStream:outputStream:]([MRStreamTransportConnection alloc], "initWithInputStream:outputStream:", v4, v5);

  return v6;
}

- (BOOL)getInputStream:(id *)a3 outputStream:(id *)a4 userInfo:(id)a5
{
  NSObject *serialQueue;
  _QWORD block[9];
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__14;
  v24 = __Block_byref_object_dispose__14;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__14;
  v18 = __Block_byref_object_dispose__14;
  v19 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__14;
  v12[4] = __Block_byref_object_dispose__14;
  v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__14;
  v10[4] = __Block_byref_object_dispose__14;
  serialQueue = self->_serialQueue;
  v11 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRAVXPCPipeTransport_getInputStream_outputStream_userInfo___block_invoke;
  block[3] = &unk_1E30C97E8;
  block[4] = self;
  block[5] = &v20;
  block[6] = v10;
  block[7] = v12;
  block[8] = &v14;
  dispatch_sync(serialQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v21[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return 1;
}

_QWORD *__61__MRAVXPCPipeTransport_getInputStream_outputStream_userInfo___block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id obj;

  v1 = result;
  v2 = result[4];
  if (!*(_QWORD *)(v2 + 72))
  {
    v3 = *(_QWORD *)(result[5] + 8);
    v4 = *(void **)(v3 + 40);
    v5 = *(_QWORD *)(result[6] + 8);
    v11 = *(id *)(v5 + 40);
    obj = v4;
    objc_msgSend(MEMORY[0x1E0C99E70], "getBoundStreamsWithBufferSize:inputStream:outputStream:", 35840, &obj, &v11);
    objc_storeStrong((id *)(v3 + 40), obj);
    objc_storeStrong((id *)(v5 + 40), v11);
    objc_storeStrong((id *)(v1[4] + 72), *(id *)(*(_QWORD *)(v1[5] + 8) + 40));
    objc_storeStrong((id *)(v1[4] + 96), *(id *)(*(_QWORD *)(v1[6] + 8) + 40));
    objc_msgSend(*(id *)(v1[4] + 96), "scheduleInRunLoop:forMode:", *(_QWORD *)(v1[4] + 120), *MEMORY[0x1E0C99860]);
    result = (_QWORD *)objc_msgSend(*(id *)(v1[4] + 96), "open");
    v2 = v1[4];
  }
  if (!*(_QWORD *)(v2 + 88))
  {
    v6 = *(_QWORD *)(v1[7] + 8);
    v7 = *(void **)(v6 + 40);
    v8 = *(_QWORD *)(v1[8] + 8);
    v9 = *(id *)(v8 + 40);
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99E70], "getBoundStreamsWithBufferSize:inputStream:outputStream:", 35840, &v10, &v9);
    objc_storeStrong((id *)(v6 + 40), v10);
    objc_storeStrong((id *)(v8 + 40), v9);
    objc_storeStrong((id *)(v1[4] + 80), *(id *)(*(_QWORD *)(v1[7] + 8) + 40));
    objc_storeStrong((id *)(v1[4] + 88), *(id *)(*(_QWORD *)(v1[8] + 8) + 40));
    objc_msgSend(*(id *)(v1[4] + 80), "setDelegate:");
    objc_msgSend(*(id *)(v1[4] + 80), "scheduleInRunLoop:forMode:", *(_QWORD *)(v1[4] + 120), *MEMORY[0x1E0C99860]);
    return (_QWORD *)objc_msgSend(*(id *)(v1[4] + 80), "open");
  }
  return result;
}

- (void)reset
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__MRAVXPCPipeTransport_reset__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __29__MRAVXPCPipeTransport_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_resetStreams");
}

- (BOOL)requiresCustomPairing
{
  return 0;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  _BYTE v8[35840];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a4 == 2 && self->_inputStreamInternal == a3)
  {
    v5 = objc_msgSend(a3, "read:maxLength:", v8, 35840);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection remoteObjectProxy](self->_pipeConnection, "remoteObjectProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendData:", v6);

    }
  }
}

- (void)sendData:(id)a3
{
  id v4;
  NSRunLoop *runLoop;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  runLoop = self->_runLoop;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__MRAVXPCPipeTransport_sendData___block_invoke;
  v7[3] = &unk_1E30C6A78;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[NSRunLoop performBlock:](runLoop, "performBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __33__MRAVXPCPipeTransport_sendData___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[12], "write:maxLength:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));
    WeakRetained = v3;
  }

}

- (void)_onQueue_resetStreams
{
  NSRunLoop *runLoop;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  runLoop = self->_runLoop;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MRAVXPCPipeTransport__onQueue_resetStreams__block_invoke;
  v4[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v5, &location);
  -[NSRunLoop performBlock:](runLoop, "performBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__MRAVXPCPipeTransport__onQueue_resetStreams__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained[10], "close");
    objc_msgSend(v7[12], "close");
    v2 = *MEMORY[0x1E0C99860];
    objc_msgSend(v7[10], "removeFromRunLoop:forMode:", v7[15], *MEMORY[0x1E0C99860]);
    objc_msgSend(v7[12], "removeFromRunLoop:forMode:", v7[15], v2);
    v3 = v7[9];
    v7[9] = 0;

    v4 = v7[11];
    v7[11] = 0;

    v5 = v7[10];
    v7[10] = 0;

    v6 = v7[12];
    v7[12] = 0;

    WeakRetained = v7;
  }

}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (NSXPCListenerEndpoint)pipeEndpoint
{
  return self->_pipeEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeEndpoint, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
  objc_storeStrong((id *)&self->_runLoopThread, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_pipeConnection, 0);
  objc_storeStrong((id *)&self->_outputStreamInternal, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStreamInternal, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
