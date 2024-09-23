@implementation RPControlCenterAngelProxy

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_angelProxy;
}

void __43__RPControlCenterAngelProxy_sharedInstance__block_invoke()
{
  RPControlCenterAngelProxy *v0;
  void *v1;

  v0 = objc_alloc_init(RPControlCenterAngelProxy);
  v1 = (void *)sharedInstance_angelProxy;
  sharedInstance_angelProxy = (uint64_t)v0;

}

- (id)connectionManagerQueue
{
  if (connectionManagerQueue_onceToken != -1)
    dispatch_once(&connectionManagerQueue_onceToken, &__block_literal_global_1);
  return (id)connectionManagerQueue_connectionQueue;
}

void __51__RPControlCenterAngelProxy_connectionManagerQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.replaykitangel.angelProxyConnectionQueue", 0);
  v1 = (void *)connectionManagerQueue_connectionQueue;
  connectionManagerQueue_connectionQueue = (uint64_t)v0;

}

- (id)getBSServiceInterface
{
  if (getBSServiceInterface_onceToken != -1)
    dispatch_once(&getBSServiceInterface_onceToken, &__block_literal_global_3);
  return (id)getBSServiceInterface___interface;
}

void __50__RPControlCenterAngelProxy_getBSServiceInterface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0F9F8], "interfaceWithIdentifier:", CFSTR("com.apple.ReplayKitAngel.session"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_254D68888);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_254D68960);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 0);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)getBSServiceInterface___interface;
  getBSServiceInterface___interface = v2;

}

- (RPControlCenterAngelProxy)init
{
  RPControlCenterAngelProxy *v2;
  RPControlCenterAngelProxy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPControlCenterAngelProxy;
  v2 = -[RPControlCenterAngelProxy init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[RPControlCenterAngelProxy setupConnection](v2, "setupConnection");
  return v3;
}

- (void)setupConnection
{
  void *v3;
  BSServiceConnectionClient *v4;
  BSServiceConnectionClient *connection;
  BSServiceConnectionClient *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0FA08], "endpointForMachName:service:instance:", CFSTR("com.apple.ReplayKitAngel.mach"), CFSTR("com.apple.ReplayKitAngel.session"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE0FA00], "connectionWithEndpoint:", v3);
    v4 = (BSServiceConnectionClient *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__RPControlCenterAngelProxy_setupConnection__block_invoke;
    v7[3] = &unk_24D15D498;
    v7[4] = self;
    -[BSServiceConnectionClient configureConnection:](v6, "configureConnection:", v7);
    -[BSServiceConnectionClient activate](self->_connection, "activate");
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy setupConnection]";
    v10 = 1024;
    v11 = 106;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel endpoint nil", buf, 0x12u);
  }

}

void __44__RPControlCenterAngelProxy_setupConnection__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "connectionManagerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTargetQueue:", v5);

  objc_msgSend(MEMORY[0x24BE0FA38], "userInitiated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v6);

  objc_msgSend(*(id *)(a1 + 32), "getBSServiceInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v7);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setActivationHandler:", &__block_literal_global_82);
  v8 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__RPControlCenterAngelProxy_setupConnection__block_invoke_83;
  v10[3] = &unk_24D15D470;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setInterruptionHandler:", v10);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __44__RPControlCenterAngelProxy_setupConnection__block_invoke_88;
  v9[3] = &unk_24D15D470;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setInvalidationHandler:", v9);

}

void __44__RPControlCenterAngelProxy_setupConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke_2";
    v5 = 1024;
    v6 = 79;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Activation handler", (uint8_t *)&v3, 0x12u);
  }

}

void __44__RPControlCenterAngelProxy_setupConnection__block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  CFPropertyListRef v4;
  BOOL v5;
  CFPropertyListRef v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke";
    v10 = 1024;
    v11 = 82;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Interruption handler", (uint8_t *)&v8, 0x12u);
  }
  objc_msgSend(CFSTR("com.apple.replayd"), "UTF8String");
  if (os_variant_allows_internal_security_policies())
  {
    v4 = CFPreferencesCopyAppValue(CFSTR("RPHideStatusBar"), CFSTR("com.apple.replayd"));
    v5 = v4 != 0;
    if (__RPLogLevel <= 1)
    {
      v6 = v4;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136446722;
        v9 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke";
        v10 = 1024;
        v11 = 90;
        v12 = 1024;
        v13 = v6 != 0;
        _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d hideStatusBar=%d", (uint8_t *)&v8, 0x18u);
      }
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v7 && !v5)
    objc_msgSend(v7, "replayKitAngelDisconnected");
  objc_msgSend(v3, "activate");

}

void __44__RPControlCenterAngelProxy_setupConnection__block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke";
    v8 = 1024;
    v9 = 99;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Invalidation handler", (uint8_t *)&v6, 0x12u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

  objc_msgSend(*(id *)(a1 + 32), "stopCurrentSession");
}

- (void)startRecordingCountdown
{
  BSServiceConnectionClient *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy startRecordingCountdown]";
    v10 = 1024;
    v11 = 112;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "startRecordingCountdown");
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy startRecordingCountdown]";
    v10 = 1024;
    v11 = 119;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

}

- (void)setCountdownState:(id)a3
{
  id v4;
  BSServiceConnectionClient *connection;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[RPControlCenterAngelProxy setCountdownState:]";
    v12 = 1024;
    v13 = 124;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "setCountdownState:", v4);
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[RPControlCenterAngelProxy setCountdownState:]";
    v12 = 1024;
    v13 = 131;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

}

- (void)cancelRecordingCountdown
{
  BSServiceConnectionClient *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy cancelRecordingCountdown]";
    v10 = 1024;
    v11 = 136;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "cancelRecordingCountdown");
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy cancelRecordingCountdown]";
    v10 = 1024;
    v11 = 143;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

}

- (void)showRecordingBanner
{
  BSServiceConnectionClient *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy showRecordingBanner]";
    v10 = 1024;
    v11 = 148;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "showRecordingBanner");
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy showRecordingBanner]";
    v10 = 1024;
    v11 = 155;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

}

- (void)stopRecordingCalled
{
  BSServiceConnectionClient *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy stopRecordingCalled]";
    v10 = 1024;
    v11 = 160;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "stopRecordingCalled");
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy stopRecordingCalled]";
    v10 = 1024;
    v11 = 167;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

}

- (void)hideAndStopRecordingBanner
{
  BSServiceConnectionClient *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy hideAndStopRecordingBanner]";
    v10 = 1024;
    v11 = 172;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "hideAndStopRecordingBanner");
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy hideAndStopRecordingBanner]";
    v10 = 1024;
    v11 = 179;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

}

- (BOOL)showReactionsTipForApplication:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  BSServiceConnectionClient *connection;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPControlCenterAngelProxy showReactionsTipForApplication:bundleID:]";
    v16 = 1024;
    v17 = 184;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "showReactionsTipForApplication:bundleID:", v6, v7);
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPControlCenterAngelProxy showReactionsTipForApplication:bundleID:]";
    v16 = 1024;
    v17 = 191;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

  return v11 != 0;
}

- (void)stopCurrentSession
{
  RPControlCenterAngelProxyDelegate *delegate;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPControlCenterAngelProxy stopCurrentSession]";
    v6 = 1024;
    v7 = 199;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  delegate = self->_delegate;
  if (delegate)
    -[RPControlCenterAngelProxyDelegate stopCurrentSession](delegate, "stopCurrentSession");
}

- (void)countdownInterruptWithStatus:(id)a3
{
  id v4;
  RPControlCenterAngelProxyDelegate *delegate;
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
    v7 = "-[RPControlCenterAngelProxy countdownInterruptWithStatus:]";
    v8 = 1024;
    v9 = 208;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  delegate = self->_delegate;
  if (delegate)
    -[RPControlCenterAngelProxyDelegate countdownInterruptWithStatus:](delegate, "countdownInterruptWithStatus:", v4);

}

- (RPControlCenterAngelProxyDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
