@implementation CSRemoteRecordClient

- (CSRemoteRecordClient)initWithDeviceId:(id)a3 audioStreamHandleId:(unint64_t)a4
{
  id v7;
  CSRemoteRecordClient *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *queue;
  CSDispatchGroup *v11;
  CSDispatchGroup *deviceWaitingGroup;
  OS_dispatch_queue *v13;
  OS_remote_device *v14;
  OS_remote_device *device;
  void *v16;
  OS_remote_device *v17;
  OS_remote_device *v18;
  NSObject *v20;
  id v21[5];
  id v22;
  id location;
  objc_super v24;
  uint8_t buf[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v24.receiver = self;
    v24.super_class = (Class)CSRemoteRecordClient;
    self = -[CSRemoteRecordClient init](&v24, sel_init);
    if (self)
    {
      v9 = (OS_dispatch_queue *)dispatch_queue_create("CSRemoteRecordClient Queue", 0);
      queue = self->_queue;
      self->_queue = v9;

      v11 = objc_alloc_init(CSDispatchGroup);
      deviceWaitingGroup = self->_deviceWaitingGroup;
      self->_deviceWaitingGroup = v11;

      objc_initWeak(&location, self);
      v13 = self->_queue;
      if (+[CSUtils hasRemoteBuiltInMic](CSUtils, "hasRemoteBuiltInMic")
        && (!v7 || objc_msgSend(v7, "isEqualToString:", CFSTR("BuiltInMicrophoneDevice"))))
      {
        v14 = (OS_remote_device *)remote_device_copy_unique_of_type();
        device = self->_device;
        self->_device = v14;

      }
      else
      {
        *(_OWORD *)buf = 0uLL;
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
        objc_msgSend(v16, "getUUIDBytes:", buf);
        v17 = (OS_remote_device *)remote_device_copy_device_with_uuid();
        v18 = self->_device;
        self->_device = v17;

      }
      if (!self->_device)
      {
        v20 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[CSRemoteRecordClient initWithDeviceId:audioStreamHandleId:]";
          _os_log_error_impl(&dword_1B502E000, v20, OS_LOG_TYPE_ERROR, "%s There is no remote device", buf, 0xCu);
        }

        objc_destroyWeak(&location);
        goto LABEL_2;
      }
      -[CSDispatchGroup enter](self->_deviceWaitingGroup, "enter");
      v21[1] = (id)MEMORY[0x1E0C809B0];
      v21[2] = (id)3221225472;
      v21[3] = __61__CSRemoteRecordClient_initWithDeviceId_audioStreamHandleId___block_invoke;
      v21[4] = &unk_1E6880C70;
      objc_copyWeak(&v22, &location);
      remote_device_set_connected_callback();
      objc_copyWeak(v21, &location);
      remote_device_set_disconnected_callback();
      self->_audioStreamHandleId = a4;
      objc_storeStrong((id *)&self->_deviceId, a3);
      objc_destroyWeak(v21);
      objc_destroyWeak(&v22);

      objc_destroyWeak(&location);
    }
    self = self;
    v8 = self;
    goto LABEL_12;
  }
LABEL_2:
  v8 = 0;
LABEL_12:

  return v8;
}

- (CSRemoteRecordClient)init
{
  CSRemoteRecordClient *v3;

  v3 = -[CSRemoteRecordClient initWithDeviceId:audioStreamHandleId:]([CSRemoteRecordClient alloc], "initWithDeviceId:audioStreamHandleId:", 0, 1);

  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSRemoteRecordClient dealloc]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (self->_connection)
    xpc_remote_connection_cancel();
  if (self->_device)
    remote_device_cancel();
  v4.receiver = self;
  v4.super_class = (Class)CSRemoteRecordClient;
  -[CSRemoteRecordClient dealloc](&v4, sel_dealloc);
}

- (CSRemoteRecordClient)initWithQueue:(id)a3 IsRemoteRecording:(BOOL)a4
{
  id v7;
  CSRemoteRecordClient *v8;
  CSRemoteRecordClient *v9;
  CSRemoteRecordClient *v10;
  objc_super v12;

  v7 = a3;
  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)CSRemoteRecordClient;
    v8 = -[CSRemoteRecordClient init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_queue, a3);
      v9->_isRemoteRecording = a4;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isRemoteDeviceGibraltar
{
  return remote_device_get_type() == 3;
}

- (BOOL)isRemoteDeviceDarwin
{
  return remote_device_get_type() == 11;
}

- (void)didDeviceConnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  CSRemoteRecordClient *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSRemoteRecordClient didDeviceConnect:]";
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__CSRemoteRecordClient_didDeviceConnect___block_invoke;
  v8[3] = &unk_1E6880E88;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)didDeviceDisconnect:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSRemoteRecordClient didDeviceDisconnect:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CSRemoteRecordClient_didDeviceDisconnect___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)waitingForConnection:(double)a3 error:(id *)a4
{
  int64_t v6;
  NSObject *v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = -[CSDispatchGroup waitWithTimeout:](self->_deviceWaitingGroup, "waitWithTimeout:", dispatch_time(0, (uint64_t)(a3 * 1000000000.0)));
  if (!v6)
  {
    if (-[CSRemoteRecordClient isConnected](self, "isConnected"))
    {
      v9 = 1;
      return !v6 && v9;
    }
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[CSRemoteRecordClient waitingForConnection:error:]";
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Device is connected but RemoteXPC service is not connected", (uint8_t *)&v13, 0xCu);
      if (!a4)
        goto LABEL_14;
    }
    else if (!a4)
    {
      goto LABEL_14;
    }
    v8 = 302;
    goto LABEL_10;
  }
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315138;
    v14 = "-[CSRemoteRecordClient waitingForConnection:error:]";
    _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Device connection waiting timed out", (uint8_t *)&v13, 0xCu);
    if (a4)
      goto LABEL_4;
  }
  else if (a4)
  {
LABEL_4:
    v8 = 301;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), v8, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    *a4 = v11;
    return !v6 && v9;
  }
LABEL_14:
  v9 = 0;
  return !v6 && v9;
}

- (BOOL)isConnected
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CSRemoteRecordClient_isConnected__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_handleServerEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = MEMORY[0x1B5E46F84](v4);
    if (MEMORY[0x1B5E46F84](v4) == MEMORY[0x1E0C81310])
    {
      v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315138;
        v10 = "-[CSRemoteRecordClient _handleServerEvent:]";
        _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s remoteXPC connection get failed", (uint8_t *)&v9, 0xCu);
      }
      -[CSRemoteRecordClient _handleServerError:](self, "_handleServerError:", v4);
    }
    else
    {
      if (v5 == MEMORY[0x1E0C812F8])
      {
        -[CSRemoteRecordClient _handleServerMessage:](self, "_handleServerMessage:", v4);
        goto LABEL_13;
      }
      v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315138;
        v10 = "-[CSRemoteRecordClient _handleServerEvent:]";
        v7 = "%s Ignore unknown type message";
LABEL_8:
        _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[CSRemoteRecordClient _handleServerEvent:]";
      v7 = "%s cannot handle server event since event is nil";
      goto LABEL_8;
    }
  }
LABEL_13:

}

- (void)_handleServerError:(id)a3
{
  id v4;
  NSObject *v6;
  const char *string;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (v4 == (id)MEMORY[0x1E0C81260] || v4 == (id)MEMORY[0x1E0C81258])
    {
      v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[CSRemoteRecordClient _handleServerError:]";
        _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s connection disconnected", (uint8_t *)&v10, 0xCu);
      }
      if (self->_device)
        remote_device_cancel();
    }
    else
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
      v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315394;
        v11 = "-[CSRemoteRecordClient _handleServerError:]";
        v12 = 2082;
        v13 = string;
        _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", (uint8_t *)&v10, 0x16u);
      }
    }
  }

}

- (void)_handleServerMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), xpc_dictionary_get_string(v4, "COMMAND"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[CSRemoteRecordClient _handleServerMessage:]";
    v19 = 2114;
    v20 = v5;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("didStartRecording")))
  {
    -[CSRemoteRecordClient _handleDidStartRecordingMessage:](self, "_handleDidStartRecordingMessage:", v4);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("didStopRecording")))
  {
    self->_isRemoteRecording = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "remoteRecordDidStopRecordingWithWithStreamHandleId:error:", self->_audioStreamHandleId, 0);

    }
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("LPCMBufferAvailable")))
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(v12, "_cs_initWithXPCObject:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("buffer"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("buffer"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v16, "remoteRecordLPCMBufferAvailable:streamHandleId:", v15, self->_audioStreamHandleId);

        }
      }

    }
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("twoShotDetected")))
  {
    -[CSRemoteRecordClient _handleTwoShotDetectedMessage:](self, "_handleTwoShotDetectedMessage:", v4);
  }

}

- (void)_handleDidStartRecordingMessage:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  char v11;
  NSObject *v12;
  id v13;
  unint64_t audioStreamHandleId;
  void *v15;
  uint64_t type;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99D80];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v6, "_cs_initWithXPCObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSRemoteRecordClient _handleDidStartRecordingMessage:]";
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("didStartRecordingError"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    if (v9)
    {
      v12 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[CSRemoteRecordClient _handleDidStartRecordingMessage:]";
        v24 = 2114;
        v25 = v9;
        _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s DidStartRecording error : %{public}@", buf, 0x16u);
      }
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      audioStreamHandleId = self->_audioStreamHandleId;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 303, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "remoteRecordDidStartRecordingWithStreamHandleId:error:", audioStreamHandleId, v15);

      if (self->_device)
        type = remote_device_get_type();
      else
        type = 0;
      +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", type, CFSTR("Device Type"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = CFSTR("error");
      v21[0] = v18;
      v21[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "submitRemoteCoreSpeechIssueReport:context:", CFSTR("remoteCoreSpeechSubtypeStartAudioRecordingFailed"), v19);

    }
    else
    {
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v17, "remoteRecordDidStartRecordingWithStreamHandleId:error:", self->_audioStreamHandleId, 0);
    }

  }
}

- (void)_handleTwoShotDetectedMessage:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  CSRemoteRecordClientDelegate **p_delegate;
  id WeakRetained;
  char v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  NSObject *v16;
  const char *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99D80];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v6, "_cs_initWithXPCObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("time")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v16 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v18 = 136315138;
    v19 = "-[CSRemoteRecordClient _handleTwoShotDetectedMessage:]";
    v17 = "%s Cannot handle TwoShotDetected message since it failed to decode xpcObject to NSDictionary";
LABEL_9:
    _os_log_error_impl(&dword_1B502E000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v18, 0xCu);
    goto LABEL_10;
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
  {
    v16 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v18 = 136315138;
    v19 = "-[CSRemoteRecordClient _handleTwoShotDetectedMessage:]";
    v17 = "%s Cannot report two shot since delegate doesn't have protocol implemented";
    goto LABEL_9;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("time"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v15, "remoteRecordTwoShotDetectedAtTime:", v14);

LABEL_10:
}

- (BOOL)startRecordingWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  char v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26[0] = CFSTR("COMMAND");
  v26[1] = CFSTR("startRecordingOptions");
  v27[0] = CFSTR("startRecording");
  v27[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10693;
  v20 = __Block_byref_object_dispose__10694;
  v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CSRemoteRecordClient_startRecordingWithOptions_error___block_invoke;
  block[3] = &unk_1E6880CA0;
  block[4] = self;
  v9 = v7;
  v13 = v9;
  v14 = &v22;
  v15 = &v16;
  dispatch_sync(queue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v10 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)stopRecording:(id *)a3
{
  void *v5;
  NSObject *queue;
  id v7;
  char v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v24 = CFSTR("COMMAND");
  v25[0] = CFSTR("stopRecording");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10693;
  v18 = __Block_byref_object_dispose__10694;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSRemoteRecordClient_stopRecording___block_invoke;
  block[3] = &unk_1E6880CA0;
  block[4] = self;
  v7 = v5;
  v11 = v7;
  v12 = &v20;
  v13 = &v14;
  dispatch_sync(queue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v8 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (BOOL)didPlayEndpointBeep
{
  NSObject *v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *queue;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  char v11;
  _QWORD v13[5];
  id v14;
  NSObject *v15;
  __int128 *p_buf;
  uint8_t v17[4];
  const char *v18;
  __int128 buf;
  uint64_t v20;
  char v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSRemoteRecordClient didPlayEndpointBeep]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  v22 = CFSTR("COMMAND");
  v23[0] = CFSTR("didPlayEndpointBeep");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x2020000000;
  v21 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__CSRemoteRecordClient_didPlayEndpointBeep__block_invoke;
  v13[3] = &unk_1E6880CF0;
  v13[4] = self;
  v7 = v4;
  v14 = v7;
  p_buf = &buf;
  v8 = v5;
  v15 = v8;
  dispatch_async(queue, v13);
  v9 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v17 = 136315138;
      v18 = "-[CSRemoteRecordClient didPlayEndpointBeep]";
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Getting reply timed out!!", v17, 0xCu);
    }
  }
  v11 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v11;
}

- (BOOL)isRecording
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CSRemoteRecordClient_isRecording__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)voiceTriggerEventInfo
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *queue;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[5];
  id v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v28 = CFSTR("COMMAND");
  v29[0] = CFSTR("voiceTriggerEventInfo");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10693;
  v22 = __Block_byref_object_dispose__10694;
  v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__CSRemoteRecordClient_voiceTriggerEventInfo__block_invoke;
  v14[3] = &unk_1E6880CF0;
  v14[4] = self;
  v6 = v3;
  v15 = v6;
  v17 = &v18;
  v7 = v4;
  v16 = v7;
  dispatch_async(queue, v14);
  v8 = dispatch_time(0, 1000000000);
  v9 = dispatch_semaphore_wait(v7, v8);
  v10 = CSLogContextFacilityCoreSpeech;
  if (v9 && os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CSRemoteRecordClient voiceTriggerEventInfo]";
    _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Getting reply timed out!!", buf, 0xCu);
    v10 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v19[5];
    *(_DWORD *)buf = 136315394;
    v25 = "-[CSRemoteRecordClient voiceTriggerEventInfo]";
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Raw VoiceTriggerEventInfo from remote = %{public}@", buf, 0x16u);
  }
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (BOOL)hasPendingTwoShotBeep
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *queue;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  char v10;
  _QWORD v12[5];
  id v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v22 = CFSTR("COMMAND");
  v23[0] = CFSTR("hasPendingTwoShotBeep");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__CSRemoteRecordClient_hasPendingTwoShotBeep__block_invoke;
  v12[3] = &unk_1E6880CF0;
  v12[4] = self;
  v6 = v3;
  v13 = v6;
  v15 = &v16;
  v7 = v4;
  v14 = v7;
  dispatch_async(queue, v12);
  v8 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSRemoteRecordClient hasPendingTwoShotBeep]";
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s Getting reply timed out!!", buf, 0xCu);
    }
  }
  v10 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (CSRemoteRecordClientDelegate)delegate
{
  return (CSRemoteRecordClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (OS_remote_device)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceWaitingGroup, 0);
  objc_storeStrong((id *)&self->_deviceBrowser, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__CSRemoteRecordClient_hasPendingTwoShotBeep__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  __int128 v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(a1 + 48);
    v3 = (id)v5;
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteRecordClient hasPendingTwoShotBeep]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Cannot ask hasPendingTwoShotBeep while connection does not exist", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __45__CSRemoteRecordClient_hasPendingTwoShotBeep__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (MEMORY[0x1B5E46F84]() == MEMORY[0x1E0C812F8])
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v3, "_cs_initWithXPCObject:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replyHasPendingTwoShotBeep"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replyHasPendingTwoShotBeep"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "BOOLValue");

      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  }
}

void __45__CSRemoteRecordClient_voiceTriggerEventInfo__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  __int128 v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(a1 + 48);
    v3 = (id)v5;
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteRecordClient voiceTriggerEventInfo]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Cannot ask VoiceTriggerEventInfo while connection does not exist", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __45__CSRemoteRecordClient_voiceTriggerEventInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (MEMORY[0x1B5E46F84]() == MEMORY[0x1E0C812F8])
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v3, "_cs_initWithXPCObject:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replyVoiceTriggerEventInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replyVoiceTriggerEventInfo"));
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  }
}

uint64_t __35__CSRemoteRecordClient_isRecording__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

void __43__CSRemoteRecordClient_didPlayEndpointBeep__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  __int128 v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(a1 + 48);
    v3 = (id)v5;
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteRecordClient didPlayEndpointBeep]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Cannot ask didPlayEndpointBeep while connection does not exist", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __43__CSRemoteRecordClient_didPlayEndpointBeep__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (MEMORY[0x1B5E46F84]() == MEMORY[0x1E0C812F8])
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v3, "_cs_initWithXPCObject:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replyDidPlayEndpointBeep"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replyDidPlayEndpointBeep"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "BOOLValue");

      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  }
}

void __38__CSRemoteRecordClient_stopRecording___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();

    v3 = 1;
  }
  else
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[CSRemoteRecordClient stopRecording:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Cannot stop recording while connection does not exist", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 302, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
}

void __56__CSRemoteRecordClient_startRecordingWithOptions_error___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();

    v3 = 1;
  }
  else
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[CSRemoteRecordClient startRecordingWithOptions:error:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Cannot start recording while connection does not exist", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 302, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
}

uint64_t __35__CSRemoteRecordClient_isConnected__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

void __44__CSRemoteRecordClient_didDeviceDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  char v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(v6, "remoteRecordConnectionDisconnected:", *(_QWORD *)(a1 + 32));

  }
}

void __41__CSRemoteRecordClient_didDeviceConnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _BYTE location[12];
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  remote_device_get_type();
  v2 = (void *)remote_device_copy_service();
  if (v2)
  {
    v3 = (void *)xpc_remote_connection_create_with_remote_service();
    objc_initWeak((id *)location, *(id *)(a1 + 40));
    objc_copyWeak(&v5, (id *)location);
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "leave");
    objc_destroyWeak(&v5);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[CSRemoteRecordClient didDeviceConnect:]_block_invoke";
      v7 = 2082;
      v8 = "com.apple.corespeech.xpc.remote.record";
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Service: %{public}s not found", location, 0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "leave");
  }

}

void __41__CSRemoteRecordClient_didDeviceConnect___block_invoke_10(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleServerEvent:", v3);

}

void __61__CSRemoteRecordClient_initWithDeviceId_audioStreamHandleId___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didDeviceConnect:", v3);

}

void __61__CSRemoteRecordClient_initWithDeviceId_audioStreamHandleId___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didDeviceDisconnect:", v3);

}

@end
