@implementation CSEndpointerXPCClient

- (CSEndpointerXPCClient)init
{
  CSEndpointerXPCClient *v2;
  void *v3;
  uint64_t v4;
  OS_dispatch_queue *xpcClientQueue;
  uint64_t v6;
  OS_dispatch_queue *xpcConnectionQueue;
  uint64_t v8;
  OS_dispatch_queue *xpcDelegateQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSEndpointerXPCClient;
  v2 = -[CSEndpointerProxy init](&v11, sel_init);
  if (v2)
  {
    CSLogInitIfNeeded();
    if ((objc_msgSend(MEMORY[0x1E0D19260], "supportsDispatchWorkloop") & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D19260], "rootQueueWithFixedPriority:", *MEMORY[0x1E0D192F0]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CSEndpointerXPCClient _getSerialQueueWithName:targetQueue:](v2, "_getSerialQueueWithName:targetQueue:", CFSTR("com.apple.corespeech.endpointer.xpc.client"), v3);
    v4 = objc_claimAutoreleasedReturnValue();
    xpcClientQueue = v2->_xpcClientQueue;
    v2->_xpcClientQueue = (OS_dispatch_queue *)v4;

    -[CSEndpointerXPCClient _getSerialQueueWithName:targetQueue:](v2, "_getSerialQueueWithName:targetQueue:", CFSTR("com.apple.corespeech.endpointer.xpc.connection"), v3);
    v6 = objc_claimAutoreleasedReturnValue();
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v6;

    -[CSEndpointerXPCClient _getSerialQueueWithName:targetQueue:](v2, "_getSerialQueueWithName:targetQueue:", CFSTR("com.apple.corespeech.endpointer.xpc.delegate"), v3);
    v8 = objc_claimAutoreleasedReturnValue();
    xpcDelegateQueue = v2->_xpcDelegateQueue;
    v2->_xpcDelegateQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *endpointerConnection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_endpointerConnection, "invalidate");
  endpointerConnection = self->_endpointerConnection;
  self->_endpointerConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSEndpointerXPCClient;
  -[CSEndpointerXPCClient dealloc](&v4, sel_dealloc);
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if (v5)
  {
    v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueueWithQOS:name:fixedPriority:", 33, a3, *MEMORY[0x1E0D192F0]);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)setActiveChannel:(unint64_t)a3
{
  NSObject *xpcClientQueue;
  _QWORD v4[6];

  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CSEndpointerXPCClient_setActiveChannel___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

- (void)setStartWaitTime:(double)a3
{
  NSObject *xpcClientQueue;
  _QWORD v4[6];

  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CSEndpointerXPCClient_setStartWaitTime___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

- (void)setEndWaitTime:(double)a3
{
  NSObject *xpcClientQueue;
  _QWORD v4[6];

  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__CSEndpointerXPCClient_setEndWaitTime___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
  NSObject *xpcClientQueue;
  _QWORD v4[6];

  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__CSEndpointerXPCClient_setAutomaticEndpointingSuspensionEndTime___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

- (id)endpointerModelVersion
{
  void *v3;
  NSObject *xpcClientQueue;
  uint64_t *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7143;
  v21 = __Block_byref_object_dispose__7144;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7143;
  v15 = __Block_byref_object_dispose__7144;
  v16 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CSEndpointerXPCClient_endpointerModelVersion__block_invoke;
  block[3] = &unk_1E7C27C98;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_async_and_wait(xpcClientQueue, block);
  v5 = v12;
  if (v12[5])
  {
    v6 = (id)*MEMORY[0x1E0D18F40];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v5[5], "timeIntervalSinceDate:", v3);
      *(_DWORD *)buf = 136315394;
      v24 = "-[CSEndpointerXPCClient endpointerModelVersion]";
      v25 = 2050;
      v26 = v7;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s elapsed time = %{public}lf", buf, 0x16u);
    }

  }
  v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
  id v6;
  NSObject *xpcClientQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CSEndpointerXPCClient_processASRFeatures_fromServer___block_invoke;
  block[3] = &unk_1E7C28888;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(xpcClientQueue, block);

}

- (void)updateEndpointerThreshold:(float)a3
{
  NSObject *xpcClientQueue;
  _QWORD v4[5];
  float v5;

  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CSEndpointerXPCClient_updateEndpointerThreshold___block_invoke;
  v4[3] = &unk_1E7C27848;
  v4[4] = self;
  v5 = a3;
  dispatch_async(xpcClientQueue, v4);
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  NSObject *xpcClientQueue;
  _QWORD v4[5];
  BOOL v5;

  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__CSEndpointerXPCClient_updateEndpointerDelayedTrigger___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_async(xpcClientQueue, v4);
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  id v6;
  NSObject *xpcClientQueue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__CSEndpointerXPCClient_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke;
  block[3] = &unk_1E7C277F8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(xpcClientQueue, block);

}

- (double)postVoiceTriggerSilence
{
  void *v3;
  NSObject *xpcClientQueue;
  uint64_t *v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7143;
  v15 = __Block_byref_object_dispose__7144;
  v16 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSEndpointerXPCClient_postVoiceTriggerSilence__block_invoke;
  block[3] = &unk_1E7C27C98;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_async_and_wait(xpcClientQueue, block);
  v5 = v12;
  if (v12[5])
  {
    v6 = (id)*MEMORY[0x1E0D18F40];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v5[5], "timeIntervalSinceDate:", v3);
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSEndpointerXPCClient postVoiceTriggerSilence]";
      v23 = 2050;
      v24 = v7;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s elapsed time = %{public}lf", buf, 0x16u);
    }

  }
  v8 = v18[3];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (unint64_t)endPointAnalyzerType
{
  void *v3;
  NSObject *xpcClientQueue;
  uint64_t *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7143;
  v15 = __Block_byref_object_dispose__7144;
  v16 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSEndpointerXPCClient_endPointAnalyzerType__block_invoke;
  block[3] = &unk_1E7C27C98;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_async_and_wait(xpcClientQueue, block);
  v5 = v12;
  if (v12[5])
  {
    v6 = (id)*MEMORY[0x1E0D18F40];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v5[5], "timeIntervalSinceDate:", v3);
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSEndpointerXPCClient endPointAnalyzerType]";
      v23 = 2050;
      v24 = v7;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s elapsed time = %{public}lf", buf, 0x16u);
    }

  }
  v8 = v18[3];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3
{
  NSObject *xpcClientQueue;
  _QWORD v4[6];

  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__CSEndpointerXPCClient_resetForVoiceTriggerTwoShotWithSampleRate___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
  NSObject *xpcClientQueue;
  _QWORD v4[6];

  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__CSEndpointerXPCClient_setEndpointerOperationMode___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6
{
  id v8;
  id v9;
  NSObject *xpcDelegateQueue;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *xpcClientQueue;
  _QWORD v15[5];
  _QWORD block[5];
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  xpcDelegateQueue = self->_xpcDelegateQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__CSEndpointerXPCClient_resetForNewRequestWithSampleRate_recordContext_recordOption_voiceTriggerInfo___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  dispatch_async(xpcDelegateQueue, block);
  xpcClientQueue = self->_xpcClientQueue;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __102__CSEndpointerXPCClient_resetForNewRequestWithSampleRate_recordContext_recordOption_voiceTriggerInfo___block_invoke_12;
  v15[3] = &unk_1E7C292C8;
  v15[4] = self;
  dispatch_async(xpcClientQueue, v15);

}

- (id)cachedEndpointerMetrics
{
  NSObject *xpcDelegateQueue;
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
  v9 = __Block_byref_object_copy__7143;
  v10 = __Block_byref_object_dispose__7144;
  v11 = 0;
  xpcDelegateQueue = self->_xpcDelegateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CSEndpointerXPCClient_cachedEndpointerMetrics__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(xpcDelegateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  NSObject *xpcDelegateQueue;
  _QWORD block[5];

  xpcDelegateQueue = self->_xpcDelegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CSEndpointerXPCClient_recordingStoppedForReason___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(xpcDelegateQueue, block);
}

- (id)_getRemoteServiceProxyObject
{
  id remoteObjectProxy;
  os_log_t *v4;
  NSObject *v5;
  NSXPCConnection *endpointerConnection;
  void *v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  remoteObjectProxy = self->_remoteObjectProxy;
  if (!remoteObjectProxy || !self->_endpointerConnection)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D18F40];
    v5 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSEndpointerXPCClient _getRemoteServiceProxyObject]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
    }
    endpointerConnection = self->_endpointerConnection;
    if (endpointerConnection
      || (-[CSEndpointerXPCClient _createClientConnection](self, "_createClientConnection"),
          (endpointerConnection = self->_endpointerConnection) != 0))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __53__CSEndpointerXPCClient__getRemoteServiceProxyObject__block_invoke;
      v11[3] = &unk_1E7C285E8;
      v11[4] = self;
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](endpointerConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_remoteObjectProxy;
      self->_remoteObjectProxy = v7;
    }
    else
    {
      v10 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[CSEndpointerXPCClient _getRemoteServiceProxyObject]";
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Endpointer endpointerConnection is nil", buf, 0xCu);
      }
      v8 = self->_remoteObjectProxy;
      self->_remoteObjectProxy = 0;
    }

    remoteObjectProxy = self->_remoteObjectProxy;
  }
  return remoteObjectProxy;
}

- (void)_createClientConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *endpointerConnection;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corespeech.corespeechd.endpointer.service"), 0);
  endpointerConnection = self->_endpointerConnection;
  self->_endpointerConnection = v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C5750);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_endpointerConnection, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF79A0F8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_didDetectHardEndpointAtTime_withMetrics_, 1, 0);

  -[NSXPCConnection setExportedInterface:](self->_endpointerConnection, "setExportedInterface:", v6);
  -[NSXPCConnection setExportedObject:](self->_endpointerConnection, "setExportedObject:", self);
  -[NSXPCConnection _setQueue:](self->_endpointerConnection, "_setQueue:", self->_xpcConnectionQueue);
  objc_initWeak(&location, self);
  v10 = self->_endpointerConnection;
  v11 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__CSEndpointerXPCClient__createClientConnection__block_invoke;
  v15[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v16, &location);
  -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v15);
  v12 = self->_endpointerConnection;
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __48__CSEndpointerXPCClient__createClientConnection__block_invoke_2;
  v13[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v14, &location);
  -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v13);
  -[NSXPCConnection resume](self->_endpointerConnection, "resume");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)didDetectStartpointAtTime:(double)a3
{
  NSObject *xpcDelegateQueue;
  _QWORD v4[6];

  xpcDelegateQueue = self->_xpcDelegateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CSEndpointerXPCClient_didDetectStartpointAtTime___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(xpcDelegateQueue, v4);
}

- (void)didDetectHardEndpointAtTime:(double)a3 withMetrics:(id)a4
{
  id v6;
  NSObject *xpcDelegateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  xpcDelegateQueue = self->_xpcDelegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSEndpointerXPCClient_didDetectHardEndpointAtTime_withMetrics___block_invoke;
  block[3] = &unk_1E7C28B58;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(xpcDelegateQueue, block);

}

- (void)_deliverHardEndpointDetectedAtTime:(double)a3 withMetrics:(id)a4
{
  id v6;
  NSObject *v7;
  NSString *requestId;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    requestId = self->_requestId;
    v14 = 136315906;
    v15 = "-[CSEndpointerXPCClient _deliverHardEndpointDetectedAtTime:withMetrics:]";
    v16 = 2048;
    v17 = a3;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = requestId;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Endpointer didDetectHardEndpointAtTime %f withMetrics %@, current requestId %@", (uint8_t *)&v14, 0x2Au);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
      objc_msgSend(v13, "endpointer:didDetectHardEndpointAtTime:withMetrics:", self, v6, a3);

    }
  }

}

- (void)didDetectTwoShotAtTime:(double)a3
{
  NSObject *xpcDelegateQueue;
  _QWORD v4[6];

  xpcDelegateQueue = self->_xpcDelegateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__CSEndpointerXPCClient_didDetectTwoShotAtTime___block_invoke;
  v4[3] = &unk_1E7C29178;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(xpcDelegateQueue, v4);
}

- (id)endpointerDelegate
{
  return objc_loadWeakRetained((id *)&self->_endpointerDelegate);
}

- (void)setEndpointerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_endpointerDelegate, a3);
}

- (id)endpointerImplDelegate
{
  return objc_loadWeakRetained((id *)&self->_endpointerImplDelegate);
}

- (void)setEndpointerImplDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_endpointerImplDelegate, a3);
}

- (id)activeEndpointer
{
  return objc_loadWeakRetained((id *)&self->_activeEndpointer);
}

- (void)setActiveEndpointer:(id)a3
{
  objc_storeWeak((id *)&self->_activeEndpointer, a3);
}

- (NSXPCConnection)endpointerConnection
{
  return self->_endpointerConnection;
}

- (void)setEndpointerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointerConnection, a3);
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setXpcConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionQueue, a3);
}

- (OS_dispatch_queue)xpcClientQueue
{
  return self->_xpcClientQueue;
}

- (void)setXpcClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClientQueue, a3);
}

- (OS_dispatch_queue)xpcDelegateQueue
{
  return self->_xpcDelegateQueue;
}

- (void)setXpcDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcDelegateQueue, a3);
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong(&self->_remoteObjectProxy, a3);
}

- (CSEndpointerMetrics)cachedMetrics
{
  return self->_cachedMetrics;
}

- (void)setCachedMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMetrics, a3);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcDelegateQueue, 0);
  objc_storeStrong((id *)&self->_xpcClientQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_endpointerConnection, 0);
  objc_destroyWeak((id *)&self->_activeEndpointer);
  objc_destroyWeak((id *)&self->_endpointerImplDelegate);
  objc_destroyWeak((id *)&self->_endpointerDelegate);
}

void __48__CSEndpointerXPCClient_didDetectTwoShotAtTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v10 = 136315394;
    v11 = "-[CSEndpointerXPCClient didDetectTwoShotAtTime:]_block_invoke";
    v12 = 2048;
    v13 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Endpointer didDetectTwoShotAtTime %f", (uint8_t *)&v10, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
      v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
      objc_msgSend(v8, "endpointer:detectedTwoShotAtTime:", v9, *(double *)(a1 + 40));

    }
  }
}

void __65__CSEndpointerXPCClient_didDetectHardEndpointAtTime_withMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_deliverHardEndpointDetectedAtTime:withMetrics:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  }
  else
  {
    v4 = (void *)*MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
      v7 = v4;
      objc_msgSend(v5, "requestId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315650;
      v10 = "-[CSEndpointerXPCClient didDetectHardEndpointAtTime:withMetrics:]_block_invoke";
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Do not deliver hardEndpoint right away since current requestId (%@) is not matching the event to fire (%@)", (uint8_t *)&v9, 0x20u);

    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
}

void __51__CSEndpointerXPCClient_didDetectStartpointAtTime___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  char v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
      objc_msgSend(v6, "endpointer:didDetectStartpointAtTime:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

    }
  }
}

void __48__CSEndpointerXPCClient__createClientConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "endpointerConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "endpointerConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSEndpointerXPCClient _createClientConnection]_block_invoke";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "endpointerConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "xpcConnectionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__CSEndpointerXPCClient__createClientConnection__block_invoke_55;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

void __48__CSEndpointerXPCClient__createClientConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "endpointerConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "endpointerConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSEndpointerXPCClient _createClientConnection]_block_invoke_2";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "endpointerConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "xpcConnectionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__CSEndpointerXPCClient__createClientConnection__block_invoke_56;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

uint64_t __48__CSEndpointerXPCClient__createClientConnection__block_invoke_56(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEndpointerConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", 0);
}

uint64_t __48__CSEndpointerXPCClient__createClientConnection__block_invoke_55(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "endpointerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setEndpointerConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", 0);
}

void __53__CSEndpointerXPCClient__getRemoteServiceProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
    {
      v7 = v4;
      v8 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[CSEndpointerXPCClient _getRemoteServiceProxyObject]_block_invoke";
      v12 = 2050;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Endpointer Remote Object Proxy returned error : %{public}ld (%{public}@)", (uint8_t *)&v10, 0x20u);

    }
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = 0;

  }
}

void __51__CSEndpointerXPCClient_recordingStoppedForReason___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 128);
  *(_QWORD *)(v1 + 128) = 0;

}

void __48__CSEndpointerXPCClient_cachedEndpointerMetrics__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

void __102__CSEndpointerXPCClient_resetForNewRequestWithSampleRate_recordContext_recordOption_voiceTriggerInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  id *v11;
  double v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "siriSessionUUID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 128);
  if (v6)
  {
    v7 = *(void **)(v5 + 136);
    objc_msgSend(v6, "requestId");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:") & 1) != 0)
    {
      v8 = objc_msgSend(*(id *)(a1 + 48), "isContinuousConversation");

      if (v8)
      {
        v9 = *MEMORY[0x1E0D18F40];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
          *(_DWORD *)buf = 136315394;
          v15 = "-[CSEndpointerXPCClient resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]_block_invoke";
          v16 = 2112;
          v17 = v10;
          _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Deliver cached endpointer event for requestId %@", buf, 0x16u);
        }
        v11 = *(id **)(a1 + 32);
        objc_msgSend(v11[16], "totalAudioRecorded");
        objc_msgSend(v11, "_deliverHardEndpointDetectedAtTime:withMetrics:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), v12 / 1000.0);
      }
    }
    else
    {

    }
  }
}

void __102__CSEndpointerXPCClient_resetForNewRequestWithSampleRate_recordContext_recordOption_voiceTriggerInfo___block_invoke_12(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setupConnection");

}

void __52__CSEndpointerXPCClient_setEndpointerOperationMode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEndpointerOperationMode:", *(_QWORD *)(a1 + 40));

}

void __67__CSEndpointerXPCClient_resetForVoiceTriggerTwoShotWithSampleRate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetForVoiceTriggerTwoShotWithSampleRate:", *(_QWORD *)(a1 + 40));

}

void __45__CSEndpointerXPCClient_endPointAnalyzerType__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__CSEndpointerXPCClient_endPointAnalyzerType__block_invoke_2;
  v3[3] = &unk_1E7C24CE8;
  v4 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "getEndPointAnalyzerTypeWithReply:", v3);

}

void __45__CSEndpointerXPCClient_endPointAnalyzerType__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSEndpointerXPCClient endPointAnalyzerType]_block_invoke_2";
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Endpointer Failed to get endPointAnalyzerType", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __48__CSEndpointerXPCClient_postVoiceTriggerSilence__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__CSEndpointerXPCClient_postVoiceTriggerSilence__block_invoke_2;
  v3[3] = &unk_1E7C24CC0;
  v4 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "getPostVoiceTriggerSilenceWithReply:", v3);

}

void __48__CSEndpointerXPCClient_postVoiceTriggerSilence__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSEndpointerXPCClient postVoiceTriggerSilence]_block_invoke_2";
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Endpointer Failed to get postVoiceTriggerSilence", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __85__CSEndpointerXPCClient_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shouldAcceptEagerResultForDuration:resultsCompletionHandler:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));

}

void __56__CSEndpointerXPCClient_updateEndpointerDelayedTrigger___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateEndpointerDelayedTrigger:", *(unsigned __int8 *)(a1 + 40));

}

void __51__CSEndpointerXPCClient_updateEndpointerThreshold___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "updateEndpointerThreshold:", v2);

}

void __55__CSEndpointerXPCClient_processASRFeatures_fromServer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 40), "wordCount");
  v3 = objc_msgSend(*(id *)(a1 + 40), "trailingSilenceDuration");
  objc_msgSend(*(id *)(a1 + 40), "eosLikelihood");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "pauseCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "silencePosterior");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 40), "taskName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 40), "processedAudioDurationInMilliseconds");
  objc_msgSend(*(id *)(a1 + 40), "acousticEndpointerScore");
  objc_msgSend(v12, "processASRFeaturesWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:fromServer:", v2, v3, v6, v9, v10, *(unsigned __int8 *)(a1 + 48), v5, v8, v11);

}

void __47__CSEndpointerXPCClient_endpointerModelVersion__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__CSEndpointerXPCClient_endpointerModelVersion__block_invoke_2;
  v3[3] = &unk_1E7C24C98;
  v4 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "getEndpointerModelVersionWithReply:", v3);

}

void __47__CSEndpointerXPCClient_endpointerModelVersion__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSEndpointerXPCClient endpointerModelVersion]_block_invoke_2";
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Endpointer Failed to get epVersion", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __66__CSEndpointerXPCClient_setAutomaticEndpointingSuspensionEndTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutomaticEndpointingSuspensionEndTime:", *(double *)(a1 + 40));

}

void __40__CSEndpointerXPCClient_setEndWaitTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEndWaitTime:", *(double *)(a1 + 40));

}

void __42__CSEndpointerXPCClient_setStartWaitTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStartWaitTime:", *(double *)(a1 + 40));

}

void __42__CSEndpointerXPCClient_setActiveChannel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveChannel:", *(_QWORD *)(a1 + 40));

}

@end
