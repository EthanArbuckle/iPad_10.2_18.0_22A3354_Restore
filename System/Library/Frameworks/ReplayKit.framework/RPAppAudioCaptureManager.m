@implementation RPAppAudioCaptureManager

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3
{
  UInt32 v4;
  UInt32 v5;

  retstr->mSampleRate = 44100.0;
  *(_QWORD *)&retstr->mFormatID = 0xE6C70636DLL;
  if (a4)
    v4 = 4;
  else
    v4 = 2;
  if (a4)
    v5 = 2;
  else
    v5 = 1;
  retstr->mBytesPerFrame = v4;
  retstr->mChannelsPerFrame = v5;
  retstr->mBytesPerPacket = v4;
  retstr->mFramesPerPacket = 1;
  *(_QWORD *)&retstr->mBitsPerChannel = 16;
  return result;
}

- (RPAppAudioCaptureManager)init
{
  char *v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RPAppAudioCaptureManager;
  v2 = -[RPAppAudioCaptureManager init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ReplayKit.AppAudioCaptureQueue", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = 0;

    +[RPAppAudioCaptureManager audioStreamBasicDescriptionWithStereo:](RPAppAudioCaptureManager, "audioStreamBasicDescriptionWithStereo:", 1);
    *(_OWORD *)(v2 + 56) = v7;
    *(_OWORD *)(v2 + 72) = v8;
    *((_QWORD *)v2 + 11) = v9;
  }
  return (RPAppAudioCaptureManager *)v2;
}

- (BOOL)handleStartAudioQueueFailed:(int)a3 didFailHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;

  v5 = (void (**)(id, void *))a4;
  if (a3)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[RPAppAudioCaptureManager handleStartAudioQueueFailed:didFailHandler:].cold.1();
      if (!v5)
        goto LABEL_6;
      goto LABEL_5;
    }
    if (v5)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5803, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v6);

    }
  }
LABEL_6:

  return a3 != 0;
}

- (void)startWithConfig:(id)a3 outputHandler:(id)a4 didStartHandler:(id)a5
{
  id var2;
  uint64_t v7;
  id v9;
  id v10;
  NSObject *audioDispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  var2 = a3.var2;
  v7 = *(_QWORD *)&a3.var0;
  v9 = a4;
  v10 = a5;
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3254779904;
  block[2] = __74__RPAppAudioCaptureManager_startWithConfig_outputHandler_didStartHandler___block_invoke;
  block[3] = &unk_24D15D5D0;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v7;
  v19 = var2;
  v12 = var2;
  v13 = v10;
  v14 = v9;
  dispatch_async(audioDispatchQueue, block);

}

void __74__RPAppAudioCaptureManager_startWithConfig_outputHandler_didStartHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  UInt32 ioDataSize;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
    v26 = 1024;
    v27 = 267;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v2 = MEMORY[0x2199C9C10](*(_QWORD *)(a1 + 40));
  v4 = (id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  *((_QWORD *)*v4 + 4) = malloc_type_malloc(0xA0uLL, 0x1020040115CD000uLL);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v7 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 56);
  *(_QWORD *)(v6 + 40) = v8;
  *(_OWORD *)(v6 + 24) = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = MEMORY[0x24BDC0D40];
  *(_OWORD *)(v9 + 96) = *MEMORY[0x24BDC0D40];
  *(_QWORD *)(v9 + 112) = *(_QWORD *)(v10 + 16);
  if ((objc_msgSend(*v4, "handleStartAudioQueueFailed:didFailHandler:", AudioQueueNewInput((const AudioStreamBasicDescription *)(*((_QWORD *)*v4 + 4) + 8), (AudioQueueInputCallback)handleInputBuffer, *v4, 0, 0, 0x800u, *((AudioQueueRef **)*v4 + 4)), *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
      v26 = 1024;
      v27 = 287;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Created Audio Queue Input", buf, 0x12u);
    }
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(id *)(a1 + 64);
    if (v11)
    {
      v14 = (void *)objc_msgSend(v11, "newAudioTapForAudioCaptureConfig:", v12, v13);
      if (v14)
      {
        v15 = v14;
        if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueSetProperty(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 0x71746F62u, v14, 8u), *(_QWORD *)(a1 + 48)) & 1) == 0)
        {
          if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
            v26 = 1024;
            v27 = 299;
            _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully set Audio Queue Process Tap", buf, 0x12u);
          }
          ioDataSize = 40;
          if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueGetProperty(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 0x61716674u, (void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8), &ioDataSize), *(_QWORD *)(a1 + 48)) & 1) == 0)
          {
            *(_DWORD *)(*((_QWORD *)*v4 + 4) + 136) = 4096;
            for (i = 48; i != 128; i += 8)
            {
              AudioQueueAllocateBuffer(**((AudioQueueRef **)*v4 + 4), *(_DWORD *)(*((_QWORD *)*v4 + 4) + 136), (AudioQueueBufferRef *)(*((_QWORD *)*v4 + 4) + i));
              AudioQueueEnqueueBuffer(**((AudioQueueRef **)*v4 + 4), *(AudioQueueBufferRef *)(*((_QWORD *)*v4 + 4) + i), 0, 0);
            }
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 144) = 0;
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 152) = 1;
            if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueAddPropertyListener(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 0x6171726Eu, (AudioQueuePropertyListenerProc)isRunningListenerCallback, *(void **)(a1 + 32)), *(_QWORD *)(a1 + 48)) & 1) == 0)
            {
              v17 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0);
              if ((_DWORD)v17 == -66665)
              {
                if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  v26 = 1024;
                  v27 = 330;
                  _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AudioQueueStart retry after can not start yet error", buf, 0x12u);
                }
                sleep(1u);
                v17 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0);
              }
              if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", v17, *(_QWORD *)(a1 + 48)) & 1) == 0)
              {
                if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  v26 = 1024;
                  v27 = 338;
                  _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully started Audio Queue Recording", buf, 0x12u);
                }
                v18 = MEMORY[0x2199C9C10](*(_QWORD *)(a1 + 48));
                v19 = *(_QWORD *)(a1 + 32);
                v20 = *(void **)(v19 + 24);
                *(_QWORD *)(v19 + 24) = v18;

              }
            }
          }
        }
LABEL_33:

        return;
      }
    }
    else
    {

    }
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __74__RPAppAudioCaptureManager_startWithConfig_outputHandler_didStartHandler___block_invoke_cold_1((uint64_t *)(a1 + 32));
    v21 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5803, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

    v15 = 0;
    goto LABEL_33;
  }
}

- (void)resumeWithConfig:(id)a3
{
  self->_resumed = 1;
  -[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:](self, "startWithConfig:outputHandler:didStartHandler:", *(_QWORD *)&a3.var0, a3.var2, self->_appAudioOutputHandler, &__block_literal_global_1);
}

void __45__RPAppAudioCaptureManager_resumeWithConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2 && __RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5833, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 136446722;
    v5 = "-[RPAppAudioCaptureManager resumeWithConfig:]_block_invoke";
    v6 = 1024;
    v7 = 356;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Error: %@", (uint8_t *)&v4, 0x1Cu);

  }
}

- (void)stop
{
  NSObject *audioDispatchQueue;
  _QWORD block[5];

  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__RPAppAudioCaptureManager_stop__block_invoke;
  block[3] = &unk_24D15D648;
  block[4] = self;
  dispatch_sync(audioDispatchQueue, block);
}

void __32__RPAppAudioCaptureManager_stop__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  OSStatus v8;
  BOOL v9;
  OSStatus v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  OSStatus v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPAppAudioCaptureManager stop]_block_invoke";
    v14 = 1024;
    v15 = 363;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 32);
  if (v5)
  {
    if (*(_DWORD *)(v5 + 152))
    {
      *(_DWORD *)(v5 + 152) = 0;
      if (AudioQueueStop(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 1u))
      {
        if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __32__RPAppAudioCaptureManager_stop__block_invoke_cold_2();
      }
      else
      {
        if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v13 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          v14 = 1024;
          v15 = 378;
          _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Audio Queue successfully stopped", buf, 0x12u);
        }
        v6 = 48;
        v7 = MEMORY[0x24BDACB70];
        do
        {
          v8 = AudioQueueFreeBuffer(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), *(AudioQueueBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + v6));
          if (v8)
            v9 = __RPLogLevel > 2;
          else
            v9 = 1;
          if (!v9)
          {
            v10 = v8;
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v13 = "-[RPAppAudioCaptureManager stop]_block_invoke";
              v14 = 1024;
              v15 = 385;
              v16 = 1024;
              v17 = v10;
              _os_log_error_impl(&dword_214135000, v7, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d AudioQueueFreeBuffer error: %i", buf, 0x18u);
            }
          }
          v6 += 8;
        }
        while (v6 != 128);
        if (AudioQueueDispose(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 1u))
        {
          if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __32__RPAppAudioCaptureManager_stop__block_invoke_cold_1();
        }
        else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v13 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          v14 = 1024;
          v15 = 391;
          _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Audio Queue has been disposed", buf, 0x12u);
        }
      }
    }
    AudioQueueRemovePropertyListener(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 0x6171726Eu, (AudioQueuePropertyListenerProc)isRunningListenerCallback, *(void **)(a1 + 32));
    free(*(void **)(*(_QWORD *)(a1 + 32) + 32));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v4 = *(_QWORD *)(a1 + 32);
  }
  v11 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

}

+ ($966F72C73C657EC8069F9357E961626F)audioCaptureConfigForSystemRecording:(BOOL)a3 processID:(int)a4 contextID:(id)a5
{
  uint64_t v5;
  void *v6;
  $966F72C73C657EC8069F9357E961626F result;

  v5 = *(_QWORD *)&a4 << 32;
  v6 = 0;
  result.var2 = v6;
  result.var0 = v5;
  result.var1 = HIDWORD(v5);
  return result;
}

- (id)newAudioTapForAudioCaptureConfig:(id)a3
{
  id var2;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithStreamDescription:", &self->_audioBasicDescription);
  if (!v5)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPAppAudioCaptureManager newAudioTapForAudioCaptureConfig:].cold.1();
    goto LABEL_15;
  }
  if ((_DWORD)v4 == 2)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDB6BD0]), "initScreenSharingTapWithFormat:", v5);
  }
  else if ((_DWORD)v4 == 1)
  {
    if (!var2)
    {
      if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[RPAppAudioCaptureManager newAudioTapForAudioCaptureConfig:].cold.4();
      goto LABEL_15;
    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDB6BD0]), "initPreSpatialSceneIdentifierTapWithFormat:sceneIdentifier:", v5, var2);
  }
  else
  {
    if ((_DWORD)v4)
    {
LABEL_12:
      if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[RPAppAudioCaptureManager newAudioTapForAudioCaptureConfig:].cold.2();
LABEL_15:
      v7 = 0;
LABEL_16:
      v10 = 0;
      goto LABEL_17;
    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDB6BD0]), "initProcessTapWithFormat:PID:", v5, HIDWORD(v4));
  }
  v7 = (void *)v6;
  if (!v6)
    goto LABEL_12;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB6BC8]), "initWithTapDescription:", v6);
  v9 = v8;
  if (!v8)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPAppAudioCaptureManager newAudioTapForAudioCaptureConfig:].cold.3();
    goto LABEL_16;
  }
  objc_msgSend(v8, "setScreenSharingHost:", 1);
  v10 = v9;
LABEL_17:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong(&self->_appTapDidStartHandler, 0);
  objc_storeStrong(&self->_appAudioOutputHandler, 0);
  objc_storeStrong((id *)&self->_audioDispatchQueue, 0);
}

- (void)handleStartAudioQueueFailed:didFailHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d AudioQueue start error: %i", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void __74__RPAppAudioCaptureManager_startWithConfig_outputHandler_didStartHandler___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = 136446722;
  v3 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
  v4 = 1024;
  v5 = 291;
  v6 = 2048;
  v7 = v1;
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d (%p) Failed to create audio tap", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_9();
}

void __32__RPAppAudioCaptureManager_stop__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d error: %i", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void __32__RPAppAudioCaptureManager_stop__block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d error: %i", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)newAudioTapForAudioCaptureConfig:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d allocate audioFormat error", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)newAudioTapForAudioCaptureConfig:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Failed to create audio tap description", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)newAudioTapForAudioCaptureConfig:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Failed to create audio tap", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)newAudioTapForAudioCaptureConfig:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d contextID is nil", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

@end
