@implementation RPDaemonProxy

+ (id)daemonProxy
{
  if (daemonProxy_onceToken != -1)
    dispatch_once(&daemonProxy_onceToken, &__block_literal_global_8);
  return (id)daemonProxy_daemonProxy;
}

void __28__RPDaemonProxy_daemonProxy__block_invoke()
{
  RPDaemonProxy *v0;
  void *v1;

  v0 = objc_alloc_init(RPDaemonProxy);
  v1 = (void *)daemonProxy_daemonProxy;
  daemonProxy_daemonProxy = (uint64_t)v0;

}

- (RPDaemonProxy)init
{
  RPDaemonProxy *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RPDaemonProxy;
  v2 = -[RPDaemonProxy init](&v13, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.replayd"), 256);
    -[RPDaemonProxy setConnection:](v2, "setConnection:", v3);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D82B58);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v4);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D82AD8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setDelegate:](v2->_connection, "setDelegate:", v2);
    objc_initWeak(&location, v2);
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __21__RPDaemonProxy_init__block_invoke;
    v10[3] = &unk_24D15DC50;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __21__RPDaemonProxy_init__block_invoke_143;
    v8[3] = &unk_24D15DC50;
    objc_copyWeak(&v9, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", v8);
    -[NSXPCConnection resume](v2->_connection, "resume");
    -[RPDaemonProxy issueSandboxExtensionForMainBundleRead](v2, "issueSandboxExtensionForMainBundleRead");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __21__RPDaemonProxy_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: connection invalidated", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ReplayKit.RPRecordingErrorDomain"), -5814, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "recordingDidStopWithError:movieURL:", v3, 0);

}

void __21__RPDaemonProxy_init__block_invoke_143(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint8_t v6[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: connection INTERRUPTED", v6, 2u);
  }
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ReplayKit.RPRecordingErrorDomain"), -5815, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "recordingDidStopWithError:movieURL:", v4, 0);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "issueSandboxExtensionForMainBundleRead");

}

- (void)issueSandboxExtensionForMainBundleRead
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!__RPLogLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446466;
    v3 = "-[RPDaemonProxy issueSandboxExtensionForMainBundleRead]";
    v4 = 1024;
    v5 = 121;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
}

- (id)issueSandboxExtensionForClientFileWrite:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "fileSystemRepresentation");
  v7 = sandbox_extension_issue_file();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    free(v8);
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446722;
      v12 = "-[RPDaemonProxy issueSandboxExtensionForClientFileWrite:]";
      v13 = 1024;
      v14 = 147;
      v15 = 2080;
      v16 = v6;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Issued sandbox extension for client folder path %s", (uint8_t *)&v11, 0x1Cu);
    }
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPDaemonProxy issueSandboxExtensionForClientFileWrite:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopCurrentActiveSessionWithHandler:withHandler:", v6, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_146);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopCurrentActiveSessionWithHandler:", v4);

}

void __53__RPDaemonProxy_stopCurrentActiveSessionWithHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __53__RPDaemonProxy_stopCurrentActiveSessionWithHandler___block_invoke_cold_1(a2, v3);
}

- (void)stopAllActiveClients
{
  void *v3;
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopAllActiveClients:withHandler:", v4, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_147);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllActiveClients");

}

void __37__RPDaemonProxy_stopAllActiveClients__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __37__RPDaemonProxy_stopAllActiveClients__block_invoke_cold_1(a2, v3);
}

- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  uint8_t v16[16];

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startInAppRecordingWithContextID:withHandler:", v16, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_148);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v13, v9, v8, v14, width, height);

}

void __105__RPDaemonProxy_startInAppRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __105__RPDaemonProxy_startInAppRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(a2, v3);
}

- (void)stopInAppRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopInAppRecordingWithHandler:withHandler:", v6, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_149);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopInAppRecordingWithHandler:", v4);

}

void __47__RPDaemonProxy_stopInAppRecordingWithHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __47__RPDaemonProxy_stopInAppRecordingWithHandler___block_invoke_cold_1(a2, v3);
}

- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446466;
    v12 = "-[RPDaemonProxy stopInAppRecordingWithUrl:handler:]";
    v13 = 1024;
    v14 = 207;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v11, 0x12u);
  }
  -[RPDaemonProxy issueSandboxExtensionForClientFileWrite:](self, "issueSandboxExtensionForClientFileWrite:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_150);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "stopInAppRecordingWithUrl:extensionToken:handler:", v6, v8, v7);
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPDaemonProxy stopInAppRecordingWithUrl:handler:].cold.1();
    objc_msgSend(v10, "stopInAppRecordingWithUrl:handler:", v6, v7);
  }

}

void __51__RPDaemonProxy_stopInAppRecordingWithUrl_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __51__RPDaemonProxy_stopInAppRecordingWithUrl_handler___block_invoke_cold_1(v2);

}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: discardInAppRecordingWithHandler:withHandler:", v6, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_151);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discardInAppRecordingWithHandler:", v4);

}

void __50__RPDaemonProxy_discardInAppRecordingWithHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __50__RPDaemonProxy_discardInAppRecordingWithHandler___block_invoke_cold_1(a2, v3);
}

- (void)pauseInAppRecording
{
  void *v3;
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: pauseInAppRecording:", v4, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_152);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pauseInAppRecording");

}

void __36__RPDaemonProxy_pauseInAppRecording__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __36__RPDaemonProxy_pauseInAppRecording__block_invoke_cold_1(a2, v3);
}

- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPDaemonProxy resumeInAppRecordingWithWindowLayerContextID:completionHandler:]";
    v11 = 1024;
    v12 = 252;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_153);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeInAppRecordingWithWindowLayerContextID:completionHandler:", v6, v7);

}

void __80__RPDaemonProxy_resumeInAppRecordingWithWindowLayerContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __80__RPDaemonProxy_resumeInAppRecordingWithWindowLayerContextID_completionHandler___block_invoke_cold_1(v2);

}

- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  uint8_t v16[16];

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startInAppCaptureWithContextID:withHandler:", v16, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_154);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startInAppCaptureWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v13, v9, v8, v14, width, height);

}

void __103__RPDaemonProxy_startInAppCaptureWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __103__RPDaemonProxy_startInAppCaptureWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(a2, v3);
}

- (void)stopInAppCaptureWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopInAppCaptureWithHandler:withHandler:", v6, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_155);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopInAppCaptureWithHandler:", v4);

}

void __45__RPDaemonProxy_stopInAppCaptureWithHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __45__RPDaemonProxy_stopInAppCaptureWithHandler___block_invoke_cold_1(a2, v3);
}

- (void)pauseInAppCapture
{
  void *v3;
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: pauseInAppCapture", v4, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_156);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pauseInAppCapture");

}

void __34__RPDaemonProxy_pauseInAppCapture__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __34__RPDaemonProxy_pauseInAppCapture__block_invoke_cold_1(a2, v3);
}

- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPDaemonProxy resumeInAppCaptureWithWindowLayerContextID:completionHandler:]";
    v11 = 1024;
    v12 = 303;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_157);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeInAppCaptureWithWindowLayerContextID:completionHandler:", v6, v7);

}

void __78__RPDaemonProxy_resumeInAppCaptureWithWindowLayerContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __78__RPDaemonProxy_resumeInAppCaptureWithWindowLayerContextID_completionHandler___block_invoke_cold_1(v2);

}

- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint8_t v18[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: setupBroadcastWithHostBundleID:", v18, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_158);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:", v12, v13, v14, v15, v16);

}

void __119__RPDaemonProxy_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __119__RPDaemonProxy_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(a2, v3);
}

- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint8_t v19[16];

  v10 = a6;
  v11 = a5;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startInAppBroadcastWithContextID:withHandler:", v19, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_159);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v15, v11, v10, v16, v17, width, height);

}

void __122__RPDaemonProxy_startInAppBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __122__RPDaemonProxy_startInAppBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke_cold_1(a2, v3);
}

- (void)stopInAppBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopInAppBroadcastWithHandler:withHandler:", v6, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_160);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopInAppBroadcastWithHandler:", v4);

}

void __47__RPDaemonProxy_stopInAppBroadcastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __47__RPDaemonProxy_stopInAppBroadcastWithHandler___block_invoke_cold_1(a2, v3);
}

- (void)pauseInAppBroadcast
{
  void *v3;
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: pauseInAppBroadcast:", v4, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_161);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pauseInAppBroadcast");

}

void __36__RPDaemonProxy_pauseInAppBroadcast__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __36__RPDaemonProxy_pauseInAppBroadcast__block_invoke_cold_1(a2, v3);
}

- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPDaemonProxy resumeInAppBroadcastWithWindowLayerContextID:completionHandler:]";
    v11 = 1024;
    v12 = 367;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_162);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeInAppBroadcastWithWindowLayerContextID:completionHandler:", v6, v7);

}

void __80__RPDaemonProxy_resumeInAppBroadcastWithWindowLayerContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __80__RPDaemonProxy_resumeInAppBroadcastWithWindowLayerContextID_completionHandler___block_invoke_cold_1(v2);

}

- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  uint8_t v16[16];

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startSystemRecordingWithContextID:withHandler:", v16, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_163);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v13, v9, v8, v14, width, height);

}

void __106__RPDaemonProxy_startSystemRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __106__RPDaemonProxy_startSystemRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(a2, v3);
}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopSystemRecordingWithHandler:withHandler:", v6, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_164);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSystemRecordingWithHandler:", v4);

}

void __48__RPDaemonProxy_stopSystemRecordingWithHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __48__RPDaemonProxy_stopSystemRecordingWithHandler___block_invoke_cold_1(a2, v3);
}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPDaemonProxy stopSystemRecordingWithURLHandler:]";
    v8 = 1024;
    v9 = 408;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_165);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSystemRecordingWithURLHandler:", v4);

}

void __51__RPDaemonProxy_stopSystemRecordingWithURLHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __51__RPDaemonProxy_stopSystemRecordingWithURLHandler___block_invoke_cold_1(v2);

}

- (void)resumeSystemRecordingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPDaemonProxy resumeSystemRecordingWithCompletionHandler:]";
    v8 = 1024;
    v9 = 423;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_166);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeSystemRecordingWithCompletionHandler:", v4);

}

void __60__RPDaemonProxy_resumeSystemRecordingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __60__RPDaemonProxy_resumeSystemRecordingWithCompletionHandler___block_invoke_cold_1(v2);

}

- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint8_t v18[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: setupSystemBroadcastWithHostBundleID:withHandler:", v18, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_167);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:", v12, v13, v14, v15, v16);

}

void __125__RPDaemonProxy_setupSystemBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __125__RPDaemonProxy_setupSystemBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(a2, v3);
}

- (void)startSystemBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint8_t v19[16];

  v10 = a6;
  v11 = a5;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startSystemBroadcastWithContextID:withHandler:", v19, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_168);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startSystemBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v15, v11, v10, v16, v17, width, height);

}

void __123__RPDaemonProxy_startSystemBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __123__RPDaemonProxy_startSystemBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke_cold_1(a2, v3);
}

- (void)stopSystemBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopSystemBroadcastWithHandler:withHandler:", v6, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_169);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSystemBroadcastWithHandler:", v4);

}

void __48__RPDaemonProxy_stopSystemBroadcastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __48__RPDaemonProxy_stopSystemBroadcastWithHandler___block_invoke_cold_1(a2, v3);
}

- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPDaemonProxy resumeSystemBroadcastWithCompletionHandler:]";
    v8 = 1024;
    v9 = 476;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_170);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeSystemBroadcastWithCompletionHandler:", v4);

}

void __60__RPDaemonProxy_resumeSystemBroadcastWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __60__RPDaemonProxy_resumeSystemBroadcastWithCompletionHandler___block_invoke_cold_1(v2);

}

- (void)getSystemBroadcastExtensionInfo:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: getSystemBroadcastExtensionInfo:", v6, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_171);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSystemBroadcastExtensionInfo:", v4);

}

void __49__RPDaemonProxy_getSystemBroadcastExtensionInfo___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __119__RPDaemonProxy_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(a2, v3);
}

- (void)consumeSandboxExtension:(id)a3 processNewConnection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPDaemonProxy consumeSandboxExtension:processNewConnection:]";
    v10 = 1024;
    v11 = 505;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_172);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "consumeSandboxExtension:processNewConnection:", v6, v4);

}

void __62__RPDaemonProxy_consumeSandboxExtension_processNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __62__RPDaemonProxy_consumeSandboxExtension_processNewConnection___block_invoke_cold_1(v2);

}

- (void)macApplicationDidResignActive
{
  void *v3;
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: macApplicationDidResignActive:", v4, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_173);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "macApplicationDidResignActive");

}

void __46__RPDaemonProxy_macApplicationDidResignActive__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __46__RPDaemonProxy_macApplicationDidResignActive__block_invoke_cold_1(a2, v3);
}

- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPDaemonProxy macApplicationDidBecomeActiveWithContextID:completionHandler:]";
    v11 = 1024;
    v12 = 528;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_174);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "macApplicationDidBecomeActiveWithContextID:completionHandler:", v6, v7);

}

void __78__RPDaemonProxy_macApplicationDidBecomeActiveWithContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __78__RPDaemonProxy_macApplicationDidBecomeActiveWithContextID_completionHandler___block_invoke_cold_1(v2);

}

- (void)saveVideo:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446466;
    v12 = "-[RPDaemonProxy saveVideo:handler:]";
    v13 = 1024;
    v14 = 557;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v11, 0x12u);
  }
  -[RPDaemonProxy issueSandboxExtensionForClientFileWrite:](self, "issueSandboxExtensionForClientFileWrite:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_175);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "saveVideo:extensionToken:handler:", v6, v8, v7);
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPDaemonProxy saveVideo:handler:].cold.1();
    objc_msgSend(v10, "saveVideo:handler:", v6, v7);
  }

}

void __35__RPDaemonProxy_saveVideo_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __35__RPDaemonProxy_saveVideo_handler___block_invoke_cold_1(v2);

}

- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: saveVideoToCameraRoll:", v9, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_176);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveVideoToCameraRoll:handler:", v6, v7);

}

void __47__RPDaemonProxy_saveVideoToCameraRoll_handler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __47__RPDaemonProxy_saveVideoToCameraRoll_handler___block_invoke_cold_1(a2, v3);
}

- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446466;
    v12 = "-[RPDaemonProxy saveClipToCameraRoll:handler:]";
    v13 = 1024;
    v14 = 592;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v11, 0x12u);
  }
  -[RPDaemonProxy issueSandboxExtensionForClientFileWrite:](self, "issueSandboxExtensionForClientFileWrite:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_177);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "saveClipToCameraRoll:extensionToken:handler:", v6, v8, v7);
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPDaemonProxy saveClipToCameraRoll:handler:].cold.1();
    objc_msgSend(v10, "saveClipToCameraRoll:handler:", v6, v7);
  }

}

void __46__RPDaemonProxy_saveClipToCameraRoll_handler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __46__RPDaemonProxy_saveClipToCameraRoll_handler___block_invoke_cold_1(a2, v3);
}

- (void)reportCameraUsage:(int64_t)a3
{
  void *v5;
  uint8_t v6[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: reportFrontCameraUsage", v6, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_178);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportCameraUsage:", a3);

}

void __35__RPDaemonProxy_reportCameraUsage___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __35__RPDaemonProxy_reportCameraUsage___block_invoke_cold_1(a2, v3);
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPDaemonProxy setMicrophoneEnabled:]";
    v8 = 1024;
    v9 = 625;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_179);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMicrophoneEnabled:", v3);

}

void __38__RPDaemonProxy_setMicrophoneEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __38__RPDaemonProxy_setMicrophoneEnabled___block_invoke_cold_1(v2);

}

- (void)getSystemBroadcastPickerInfo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPDaemonProxy getSystemBroadcastPickerInfo:]";
    v8 = 1024;
    v9 = 634;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_180);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSystemBroadcastPickerInfo:", v4);

}

void __46__RPDaemonProxy_getSystemBroadcastPickerInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __46__RPDaemonProxy_getSystemBroadcastPickerInfo___block_invoke_cold_1(v2);

}

- (void)setBroadcastPickerPreferredExt:(id)a3 showsMicButton:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPDaemonProxy setBroadcastPickerPreferredExt:showsMicButton:]";
    v10 = 1024;
    v11 = 643;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_181);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBroadcastPickerPreferredExt:showsMicButton:", v6, v4);

}

void __63__RPDaemonProxy_setBroadcastPickerPreferredExt_showsMicButton___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __63__RPDaemonProxy_setBroadcastPickerPreferredExt_showsMicButton___block_invoke_cold_1(v2);

}

- (void)openControlCenterSystemRecordingView
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPDaemonProxy openControlCenterSystemRecordingView]";
    v6 = 1024;
    v7 = 653;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_182);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openControlCenterSystemRecordingView");

}

void __53__RPDaemonProxy_openControlCenterSystemRecordingView__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __53__RPDaemonProxy_openControlCenterSystemRecordingView__block_invoke_cold_1(v2);

}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPDaemonProxy updateProcessIDForAudioCaptureWithPID:]";
    v8 = 1024;
    v9 = 665;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_183);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateProcessIDForAudioCaptureWithPID:", v3);

}

void __55__RPDaemonProxy_updateProcessIDForAudioCaptureWithPID___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __55__RPDaemonProxy_updateProcessIDForAudioCaptureWithPID___block_invoke_cold_1(v2);

}

- (void)updateScreenRecordingStateWithCurrentState:(id)a3
{
  id v3;
  void *v4;
  uint8_t v5[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: updateScreenRecordingStateWithCurrentState", v5, 2u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateScreenRecordingStateWithCurrentState:", v3);

}

- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: recordingDidStopWithError:movieURL:", v8, 2u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordingDidStopWithError:movieURL:", v5, v6);

}

- (void)shouldResumeSessionType:(id)a3
{
  id v3;
  void *v4;
  uint8_t v5[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: shouldResumeSessionType", v5, 2u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shouldResumeSessionType:", v3);

}

- (void)recordingDidPause
{
  void *v2;
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: recordingDidPause", v3, 2u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordingDidPause");

}

- (void)updateBroadcastServiceInfo:(id)a3
{
  id v3;
  void *v4;
  uint8_t v5[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: updateBroadcastServiceInfo:", v5, 2u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientDidUpdateBroadcastServiceInfo:", v3);

}

- (void)updateBroadcastURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint8_t v9[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: updateBroadcastURL:", v9, 2u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeBroadcastController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBroadcastURL:", v3);
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "broadcastController:didUpdateBroadcastURL:", v5, v3);

  }
}

- (void)captureHandlerWithSample:(id)a3 timingData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!__RPLogLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPDaemonProxy captureHandlerWithSample:timingData:]";
    v10 = 1024;
    v11 = 725;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "captureHandlerWithSample:timingData:", v5, v6);

}

- (void)captureHandlerWithAudioSample:(id)a3 bufferType:(int64_t)a4
{
  id v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!__RPLogLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPDaemonProxy captureHandlerWithAudioSample:bufferType:]";
    v9 = 1024;
    v10 = 732;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captureHandlerWithAudioSample:bufferType:", v5, a4);

}

- (void)recordingLockInterrupted:(id)a3
{
  id v3;
  void *v4;
  uint8_t v5[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: recordingLockInterrupted:", v5, 2u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordingLockInterrupted:", v3);

}

- (void)recordingTimerDidUpdate:(id)a3
{
  id v3;
  void *v4;
  uint8_t v5[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: recordingTimerDidUpdate:", v5, 2u);
  }
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordingTimerDidUpdate:", v3);

}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v5)
  {
    if (!__RPLogLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136446466;
      v11 = "-[RPDaemonProxy connection:handleInvocation:isReply:]";
      v12 = 1024;
      v13 = 756;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d received reply for invocation", (uint8_t *)&v10, 0x12u);
    }
    objc_msgSend(v8, "retainArguments");
  }
  else if (!__RPLogLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136446466;
    v11 = "-[RPDaemonProxy connection:handleInvocation:isReply:]";
    v12 = 1024;
    v13 = 762;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d did not receive reply for invocation", (uint8_t *)&v10, 0x12u);
  }
  objc_msgSend(v8, "invoke");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTarget:", v9);

}

- (void)setBroadcastURL:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_188);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBroadcastURL:", v4);

}

void __33__RPDaemonProxy_setBroadcastURL___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __33__RPDaemonProxy_setBroadcastURL___block_invoke_cold_1(a2, v3);
}

- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v20 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a7;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136446466;
    v17 = "-[RPDaemonProxy startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:]";
    v18 = 1024;
    v19 = 780;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v16, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_189);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:", v13, v9, v8, v14, width, height);

}

void __114__RPDaemonProxy_startClipBufferingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __114__RPDaemonProxy_startClipBufferingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withCompletionHandler___block_invoke_cold_1(v2);

}

- (void)stopClipBufferingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPDaemonProxy stopClipBufferingWithCompletionHandler:]";
    v8 = 1024;
    v9 = 793;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_190);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopClipBufferingWithCompletionHandler:", v4);

}

void __56__RPDaemonProxy_stopClipBufferingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __56__RPDaemonProxy_stopClipBufferingWithCompletionHandler___block_invoke_cold_1(v2);

}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446466;
    v14 = "-[RPDaemonProxy exportClipToURL:duration:completionHandler:]";
    v15 = 1024;
    v16 = 806;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v13, 0x12u);
  }
  -[RPDaemonProxy issueSandboxExtensionForClientFileWrite:](self, "issueSandboxExtensionForClientFileWrite:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_191);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "exportClipToURL:duration:extensionToken:completionHandler:", v8, v10, v9, a4);
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPDaemonProxy exportClipToURL:duration:completionHandler:].cold.1();
    objc_msgSend(v12, "exportClipToURL:duration:completionHandler:", v8, v9, a4);
  }

}

void __60__RPDaemonProxy_exportClipToURL_duration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __60__RPDaemonProxy_exportClipToURL_duration_completionHandler___block_invoke_cold_1(v2);

}

- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPDaemonProxy resumeInAppClipWithWindowLayerContextID:completionHandler:]";
    v11 = 1024;
    v12 = 826;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_192);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeInAppClipWithWindowLayerContextID:completionHandler:", v6, v7);

}

void __75__RPDaemonProxy_resumeInAppClipWithWindowLayerContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __75__RPDaemonProxy_resumeInAppClipWithWindowLayerContextID_completionHandler___block_invoke_cold_1(v2);

}

- (NSURL)broadcastURL
{
  return self->_broadcastURL;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_broadcastURL, 0);
}

- (void)issueSandboxExtensionForClientFileWrite:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Error issuing sandbox extension for client folder path %s", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __53__RPDaemonProxy_stopCurrentActiveSessionWithHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: stopCurrentActiveSessionWithHandler: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __37__RPDaemonProxy_stopAllActiveClients__block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: stopAllActiveClients: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __105__RPDaemonProxy_startInAppRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: startInAppRecordingWithContextID: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __47__RPDaemonProxy_stopInAppRecordingWithHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: stopInAppRecordingWithHandler: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)stopInAppRecordingWithUrl:handler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d error issuing sandbox extension for client file %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __51__RPDaemonProxy_stopInAppRecordingWithUrl_handler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __50__RPDaemonProxy_discardInAppRecordingWithHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: discardInAppRecordingWithHandler: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __36__RPDaemonProxy_pauseInAppRecording__block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: pauseInAppRecording: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __80__RPDaemonProxy_resumeInAppRecordingWithWindowLayerContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __103__RPDaemonProxy_startInAppCaptureWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: startInAppCaptureWithContextID: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __45__RPDaemonProxy_stopInAppCaptureWithHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: stopInAppCaptureWithHandler: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __34__RPDaemonProxy_pauseInAppCapture__block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: pauseInAppCapture: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __78__RPDaemonProxy_resumeInAppCaptureWithWindowLayerContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __119__RPDaemonProxy_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __122__RPDaemonProxy_startInAppBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: startInAppBroadcastWithContextID: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __47__RPDaemonProxy_stopInAppBroadcastWithHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: stopInAppBroadcastWithHandler: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __36__RPDaemonProxy_pauseInAppBroadcast__block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: pauseInAppBroadcast: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __80__RPDaemonProxy_resumeInAppBroadcastWithWindowLayerContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __106__RPDaemonProxy_startSystemRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: startSystemRecordingWithContextID: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __48__RPDaemonProxy_stopSystemRecordingWithHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: stopSystemRecordingWithHandler: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __51__RPDaemonProxy_stopSystemRecordingWithURLHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __60__RPDaemonProxy_resumeSystemRecordingWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __125__RPDaemonProxy_setupSystemBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: setupSystemBroadcastWithHostBundleID: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __123__RPDaemonProxy_startSystemBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: startSystemBroadcastWithContextID: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __48__RPDaemonProxy_stopSystemBroadcastWithHandler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: stopSystemBroadcastWithHandler: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __60__RPDaemonProxy_resumeSystemBroadcastWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __62__RPDaemonProxy_consumeSandboxExtension_processNewConnection___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __46__RPDaemonProxy_macApplicationDidResignActive__block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: macApplicationDidResignActive proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __78__RPDaemonProxy_macApplicationDidBecomeActiveWithContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)saveVideo:handler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d error issuing sandbox extension for client file %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __35__RPDaemonProxy_saveVideo_handler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __47__RPDaemonProxy_saveVideoToCameraRoll_handler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: saveVideoToCameraRoll proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)saveClipToCameraRoll:handler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d error issuing sandbox extension for client file %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __46__RPDaemonProxy_saveClipToCameraRoll_handler___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProxy: saveClipToCameraRoll proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __35__RPDaemonProxy_reportCameraUsage___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProtocol: reportFrontCameraUsage: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __38__RPDaemonProxy_setMicrophoneEnabled___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __46__RPDaemonProxy_getSystemBroadcastPickerInfo___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __63__RPDaemonProxy_setBroadcastPickerPreferredExt_showsMicButton___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __53__RPDaemonProxy_openControlCenterSystemRecordingView__block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __55__RPDaemonProxy_updateProcessIDForAudioCaptureWithPID___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __33__RPDaemonProxy_setBroadcastURL___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v2, "RPDaemonProtocol: hasUserConsentForMicrophone: proxy error: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __114__RPDaemonProxy_startClipBufferingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __56__RPDaemonProxy_stopClipBufferingWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)exportClipToURL:duration:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d error issuing sandbox extension for client file %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __60__RPDaemonProxy_exportClipToURL_duration_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __75__RPDaemonProxy_resumeInAppClipWithWindowLayerContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
