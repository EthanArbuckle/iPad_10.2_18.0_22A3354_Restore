@implementation AXBAVSDetectionManager

+ (void)initializeManager
{
  id v2;

  v2 = (id)objc_msgSend(a1, "controller");
}

+ (id)controller
{
  if (controller_onceToken_2 != -1)
    dispatch_once(&controller_onceToken_2, &__block_literal_global_17);
  return (id)controller__sManager_0;
}

void __36__AXBAVSDetectionManager_controller__block_invoke()
{
  AXBAVSDetectionManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBAVSDetectionManager);
  v1 = (void *)controller__sManager_0;
  controller__sManager_0 = (uint64_t)v0;

}

- (AXBAVSDetectionManager)init
{
  AXBAVSDetectionManager *v2;
  AXBAVSDetectionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXBAVSDetectionManager;
  v2 = -[AXBAVSDetectionManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXBAVSDetectionManager _bootstrapAVSDetection](v2, "_bootstrapAVSDetection");
  return v3;
}

- (void)_bootstrapAVSDetection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __48__AXBAVSDetectionManager__bootstrapAVSDetection__block_invoke;
  v7 = &unk_250187950;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "registerUpdateBlock:forRetrieveSelector:withListener:", &v4, sel_isAdaptiveVoiceShortcutsEnabled, self);

  -[AXBAVSDetectionManager _avsSettingsDidUpdate](self, "_avsSettingsDidUpdate", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__AXBAVSDetectionManager__bootstrapAVSDetection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_avsSettingsDidUpdate");

}

- (void)_avsSettingsDidUpdate
{
  NSObject *v3;
  AXUIClient *avsDetectionClient;
  _QWORD block[5];

  if (-[AXBAVSDetectionManager _shouldArmAVS](self, "_shouldArmAVS"))
  {
    dispatch_get_global_queue(21, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__AXBAVSDetectionManager__avsSettingsDidUpdate__block_invoke;
    block[3] = &unk_250187618;
    block[4] = self;
    dispatch_async(v3, block);

  }
  else
  {
    avsDetectionClient = self->_avsDetectionClient;
    self->_avsDetectionClient = 0;

  }
}

uint64_t __47__AXBAVSDetectionManager__avsSettingsDidUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startupAVSDetectionUIServer");
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  AXUIClient *avsDetectionClient;

  avsDetectionClient = self->_avsDetectionClient;
  if (avsDetectionClient == a3 && avsDetectionClient != 0)
    -[AXBAVSDetectionManager _startupAVSDetectionUIServer](self, "_startupAVSDetectionUIServer");
}

- (void)_startupAVSDetectionUIServer
{
  NSObject *v3;
  AXUIClient *v4;
  AXUIClient *avsDetectionClient;
  NSObject *v6;
  AXUIClient *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (!self->_avsDetectionClient)
  {
    AXLogAVS();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232455000, v3, OS_LOG_TYPE_DEFAULT, "Creating AVS Client", buf, 2u);
    }

    v4 = (AXUIClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDFF8F0]), "initWithIdentifier:serviceBundleName:", CFSTR("AX_adaptiveVoiceShortcutsClient-sb"), CFSTR("AXAVSPluginService"));
    avsDetectionClient = self->_avsDetectionClient;
    self->_avsDetectionClient = v4;

    -[AXUIClient setDelegate:](self->_avsDetectionClient, "setDelegate:", self);
  }
  if (-[AXBAVSDetectionManager _shouldArmAVS](self, "_shouldArmAVS"))
  {
    AXLogAVS();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_232455000, v6, OS_LOG_TYPE_DEFAULT, "Starting AVS UI Server", v9, 2u);
    }

    v7 = self->_avsDetectionClient;
    objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIClient sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:](v7, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x24BDBD1B8], 10000, v8, 0);

  }
}

- (BOOL)_shouldArmAVS
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAdaptiveVoiceShortcutsEnabled");

  return v3;
}

- (AXUIClient)avsDetectionClient
{
  return self->_avsDetectionClient;
}

- (void)setAvsDetectionClient:(id)a3
{
  objc_storeStrong((id *)&self->_avsDetectionClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avsDetectionClient, 0);
}

@end
