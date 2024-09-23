@implementation RPBroadcastSampleHandler

- (id)group
{
  if (group_queueToken != -1)
    dispatch_once(&group_queueToken, &__block_literal_global_5);
  return (id)group_group;
}

void __33__RPBroadcastSampleHandler_group__block_invoke()
{
  dispatch_group_t v0;
  void *v1;

  v0 = dispatch_group_create();
  v1 = (void *)group_group;
  group_group = (uint64_t)v0;

}

- (id)audioQueue
{
  if (audioQueue_onceToken_0 != -1)
    dispatch_once(&audioQueue_onceToken_0, &__block_literal_global_1_0);
  return (id)audioQueue_sAudioQueue_0;
}

void __38__RPBroadcastSampleHandler_audioQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.replaykit.broadcast.AudioSampleQueue", v2);
  v1 = (void *)audioQueue_sAudioQueue_0;
  audioQueue_sAudioQueue_0 = (uint64_t)v0;

}

- (id)videoQueue
{
  if (videoQueue_onceToken_0 != -1)
    dispatch_once(&videoQueue_onceToken_0, &__block_literal_global_3_0);
  return (id)videoQueue_sVideoQueue_0;
}

void __38__RPBroadcastSampleHandler_videoQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.replaykit.broadcast.VideoSampleQueue", v2);
  v1 = (void *)videoQueue_sVideoQueue_0;
  videoQueue_sVideoQueue_0 = (uint64_t)v0;

}

- (void)updateServiceInfo:(id)a3
{
  -[RPBroadcastDaemonProtocol updateServiceInfo:](self->_daemonProxy, "updateServiceInfo:", a3);
}

- (void)updateBroadcastURL:(id)a3
{
  -[RPBroadcastDaemonProtocol updateBroadcastURL:](self->_daemonProxy, "updateBroadcastURL:", a3);
}

- (void)finishBroadcastWithError:(NSError *)error
{
  NSError *v4;
  NSObject *v5;
  NSObject *v6;
  NSError *v7;
  _QWORD v8[5];
  NSError *v9;

  v4 = error;
  -[RPBroadcastSampleHandler group](self, "group");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__RPBroadcastSampleHandler_finishBroadcastWithError___block_invoke;
  v8[3] = &unk_24D15D5A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(v5, v6, v8);

}

uint64_t __53__RPBroadcastSampleHandler_finishBroadcastWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "finishBroadcastWithError:", *(_QWORD *)(a1 + 40));
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;

  v4 = a3;
  -[RPBroadcastHandler setExtensionContext:](self, "setExtensionContext:", v4);
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)extensionContext:(id)a3 setEndpoint:(id)a4
{
  -[RPBroadcastSampleHandler _setupListenerWithEndpoint:](self, "_setupListenerWithEndpoint:", a4);
}

- (void)_processPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeySampleType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyActionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyFrontmostAppBundleID"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v6 == 1)
  {
    -[RPBroadcastSampleHandler _processPayloadWithVideoSample:](self, "_processPayloadWithVideoSample:", v4);
  }
  else if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[RPBroadcastSampleHandler _processPayloadWithAudioSample:type:](self, "_processPayloadWithAudioSample:type:", v4, v6);
  }
  else if (v9)
  {
    v17 = CFSTR("RPApplicationInfoBundleIdentifier");
    v18[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPBroadcastSampleHandler broadcastAnnotatedWithApplicationInfo:](self, "broadcastAnnotatedWithApplicationInfo:", v11);
LABEL_7:

  }
  else
  {
    switch(v8)
    {
      case 1:
        -[RPBroadcastSampleHandler group](self, "group");
        v12 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v12);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RPBroadcastExtensionKeyExtensionUserInfo"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPBroadcastSampleHandler broadcastStartedWithSetupInfo:](self, "broadcastStartedWithSetupInfo:", v11);
        -[RPBroadcastSampleHandler group](self, "group");
        v13 = objc_claimAutoreleasedReturnValue();
        dispatch_group_leave(v13);

        goto LABEL_7;
      case 2:
        -[RPBroadcastSampleHandler broadcastPaused](self, "broadcastPaused");
        break;
      case 3:
        -[RPBroadcastSampleHandler broadcastResumed](self, "broadcastResumed");
        break;
      case 4:
        -[RPBroadcastSampleHandler group](self, "group");
        v14 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v14);

        -[RPBroadcastSampleHandler broadcastFinished](self, "broadcastFinished");
        -[RPBroadcastSampleHandler group](self, "group");
        v15 = objc_claimAutoreleasedReturnValue();
        dispatch_group_leave(v15);

        -[RPBroadcastHandler extensionContext](self, "extensionContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "completeRequestReturningItems:completionHandler:", MEMORY[0x24BDBD1A8], &__block_literal_global_13);

        break;
      default:
        break;
    }
  }

}

void __44__RPBroadcastSampleHandler__processPayload___block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "completed extension request", v0, 2u);
  }
}

- (void)_processPayloadWithVideoSample:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __IOSurface *v7;
  void *v8;
  CMSampleBufferRef v9;
  void *v10;
  CMSampleTimingInfo v11;
  CMSampleTimingInfo buf;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.duration.value) = 136446466;
    *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)"-[RPBroadcastSampleHandler _processPayloadWithVideoSample:]";
    LOWORD(buf.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = 150;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Broadcast extension received video payload from replayd", (uint8_t *)&buf, 0x12u);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyIOSurface"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ioSurface");
  if (v6)
  {
    v7 = (__IOSurface *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyTimingInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&buf, 0, sizeof(buf));
    objc_msgSend(v8, "getBytes:length:", &buf, 72);
    v11 = buf;
    v9 = RPSampleBufferUtilities_CreateSampleBufferFromIOSurface(v7, &v11);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RPSampleBufferVideoOrientation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    CMSetAttachment(v9, CFSTR("RPSampleBufferVideoOrientation"), v10, 0);
    if (v9)
    {
      -[RPBroadcastSampleHandler processSampleBuffer:withType:](self, "processSampleBuffer:withType:", v9, 1);
      CFRelease(v9);
    }
    else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[RPBroadcastSampleHandler _processPayloadWithVideoSample:].cold.2();
    }

  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[RPBroadcastSampleHandler _processPayloadWithVideoSample:].cold.1();
  }

}

- (void)_processPayloadWithAudioSample:(id)a3 type:(int64_t)a4
{
  id v6;
  CMSampleBufferRef DecodeAudioSampleBuffer;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPBroadcastSampleHandler _processPayloadWithAudioSample:type:]";
    v10 = 1024;
    v11 = 180;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Broadcast extension received audio payload from replayd", (uint8_t *)&v8, 0x12u);
  }
  DecodeAudioSampleBuffer = RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer(v6);
  -[RPBroadcastSampleHandler processSampleBuffer:withType:](self, "processSampleBuffer:withType:", DecodeAudioSampleBuffer, a4);
  if (DecodeAudioSampleBuffer)
    CFRelease(DecodeAudioSampleBuffer);

}

- (void)processPayload:(id)a3 completion:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  -[RPBroadcastSampleHandler _processPayload:](self, "_processPayload:", a3);
  v6[2]();

}

- (void)_setupListenerWithEndpoint:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[9];

  v20[8] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDD1988];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithListenerEndpoint:", v5);

  -[RPBroadcastHandler setConnection:](self, "setConnection:", v6);
  -[RPBroadcastHandler connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedObject:", self);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D81EA8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  v20[4] = objc_opt_class();
  v20[5] = objc_opt_class();
  v20[6] = objc_opt_class();
  v20[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_processPayload_completion_, 0, 0);

  -[RPBroadcastHandler connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExportedInterface:", v8);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D81F10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPBroadcastHandler connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRemoteObjectInterface:", v13);

  -[RPBroadcastHandler connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInvalidationHandler:", &__block_literal_global_83);

  -[RPBroadcastHandler connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInterruptionHandler:", &__block_literal_global_85);

  -[RPBroadcastHandler connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resume");

  -[RPBroadcastHandler connection](self, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_88);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPBroadcastSampleHandler setDaemonProxy:](self, "setDaemonProxy:", v19);

  -[RPBroadcastDaemonProtocol ping](self->_daemonProxy, "ping");
}

void __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "connection to replayd invalidated", v0, 2u);
  }
}

void __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke_84()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "connection to replayd interrupted", v0, 2u);
  }
}

void __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke_86(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke_86_cold_1(a2);
}

- (RPBroadcastDaemonProtocol)daemonProxy
{
  return self->_daemonProxy;
}

- (void)setDaemonProxy:(id)a3
{
  objc_storeStrong((id *)&self->_daemonProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonProxy, 0);
}

- (void)_processPayloadWithVideoSample:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Invalid video sample", v1, v2, v3, v4, v5);
}

- (void)_processPayloadWithVideoSample:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Invalid sample buffer", v1, v2, v3, v4, v5);
}

void __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke_86_cold_1(void *a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = objc_msgSend(a1, "code");
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "error = %d", (uint8_t *)v1, 8u);
}

@end
