@implementation AXBTouchAccommodationsController

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_11 != -1)
    dispatch_once(&initializeMonitor_onceToken_11, &__block_literal_global_20);
}

uint64_t __53__AXBTouchAccommodationsController_initializeMonitor__block_invoke()
{
  AXBTouchAccommodationsController *v0;
  void *v1;

  v0 = objc_alloc_init(AXBTouchAccommodationsController);
  v1 = (void *)SharedManager_1;
  SharedManager_1 = (uint64_t)v0;

  objc_msgSend((id)SharedManager_1, "_registerForTouchAccommodationsAXSettingsUpdate");
  return objc_msgSend((id)SharedManager_1, "_updateTouchAccommodationsSetting");
}

+ (void)showHoldDurationTripleClickHelp
{
  objc_msgSend((id)SharedManager_1, "_showHoldDurationTripleClickHelp");
}

+ (void)hideHoldDurationTripleClickHelp
{
  objc_msgSend((id)SharedManager_1, "_hideHoldDurationTripleClickHelp");
}

- (void)_registerForTouchAccommodationsAXSettingsUpdate
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *touchAccommodationsQueue;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = (OS_dispatch_queue *)dispatch_queue_create("TouchAccommodationsQueue", 0);
  touchAccommodationsQueue = self->_touchAccommodationsQueue;
  self->_touchAccommodationsQueue = v3;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke;
  v13[3] = &unk_250187618;
  v13[4] = self;
  objc_msgSend(v5, "registerUpdateBlock:forRetrieveSelector:withListener:", v13, sel_touchAccommodationsHoldDurationEnabled, self);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_2;
  v12[3] = &unk_250187618;
  v12[4] = self;
  objc_msgSend(v7, "registerUpdateBlock:forRetrieveSelector:withListener:", v12, sel_touchAccommodationsIgnoreRepeatEnabled, self);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_3;
  v11[3] = &unk_250187618;
  v11[4] = self;
  objc_msgSend(v8, "registerUpdateBlock:forRetrieveSelector:withListener:", v11, sel_touchAccommodationsTapActivationMethod, self);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_4;
  v10[3] = &unk_250187618;
  v10[4] = self;
  objc_msgSend(v9, "registerUpdateBlock:forRetrieveSelector:withListener:", v10, sel_touchAccommodationsEnabled, self);

}

uint64_t __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTouchAccommodationsSetting");
}

uint64_t __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTouchAccommodationsSetting");
}

uint64_t __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTouchAccommodationsSetting");
}

uint64_t __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTouchAccommodationsSetting");
}

- (void)_updateTouchAccommodationsSetting
{
  NSObject *touchAccommodationsQueue;
  _QWORD block[5];

  touchAccommodationsQueue = self->_touchAccommodationsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__AXBTouchAccommodationsController__updateTouchAccommodationsSetting__block_invoke;
  block[3] = &unk_250187618;
  block[4] = self;
  dispatch_async(touchAccommodationsQueue, block);
}

void __69__AXBTouchAccommodationsController__updateTouchAccommodationsSetting__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "touchAccommodationsEnabled");
  if (v3)
    v3 = objc_msgSend(v2, "touchAccommodationsAreConfigured");
  v4 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 8) != v3)
  {
    *(_BYTE *)(v4 + 8) = v3;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 8))
    {
      AXLogTouchAccommodations();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_232455000, v6, OS_LOG_TYPE_DEFAULT, "Starting up touch accommodations", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "touchAccommodationsClient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, 2, 0, 0);

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
    }
    else if (*(_BYTE *)(v5 + 9))
    {
      AXLogTouchAccommodations();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_232455000, v8, OS_LOG_TYPE_DEFAULT, "Stopping touch accommodations", v10, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "touchAccommodationsClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, 1, 0, 0);

    }
  }

}

- (void)_showHoldDurationTripleClickHelp
{
  id v2;

  -[AXBTouchAccommodationsController touchAccommodationsClient](self, "touchAccommodationsClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, 3, 0, 0);

}

- (void)_hideHoldDurationTripleClickHelp
{
  id v2;

  -[AXBTouchAccommodationsController touchAccommodationsClient](self, "touchAccommodationsClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, 4, 0, 0);

}

- (id)_clientIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("TouchAccommodationsClientIdentifier-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AXUIClient)touchAccommodationsClient
{
  AXUIClient *touchAccommodationsClient;
  id v4;
  void *v5;
  AXUIClient *v6;
  AXUIClient *v7;

  touchAccommodationsClient = self->_touchAccommodationsClient;
  if (!touchAccommodationsClient)
  {
    v4 = objc_alloc(MEMORY[0x24BDFF8F0]);
    -[AXBTouchAccommodationsController _clientIdentifier](self, "_clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (AXUIClient *)objc_msgSend(v4, "initWithIdentifier:serviceBundleName:", v5, CFSTR("TouchAccommodations"));
    v7 = self->_touchAccommodationsClient;
    self->_touchAccommodationsClient = v6;

    -[AXUIClient setDelegate:](self->_touchAccommodationsClient, "setDelegate:", self);
    touchAccommodationsClient = self->_touchAccommodationsClient;
  }
  return touchAccommodationsClient;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  NSObject *touchAccommodationsQueue;
  _QWORD block[5];

  touchAccommodationsQueue = self->_touchAccommodationsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__AXBTouchAccommodationsController_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke;
  block[3] = &unk_250187618;
  block[4] = self;
  dispatch_async(touchAccommodationsQueue, block);
}

void __94__AXBTouchAccommodationsController_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BYTE *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_BYTE **)(a1 + 32);
  if (v4[8])
  {
    objc_msgSend(v4, "touchAccommodationsClient");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, 2, 0, 0);

  }
}

- (void)setTouchAccommodationsClient:(id)a3
{
  objc_storeStrong((id *)&self->_touchAccommodationsClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchAccommodationsClient, 0);
  objc_storeStrong((id *)&self->_touchAccommodationsQueue, 0);
}

@end
