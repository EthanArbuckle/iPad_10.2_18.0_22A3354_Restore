@implementation AXSBHearingAidDeviceController

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global);
  return (id)sharedController_SharedController;
}

void __50__AXSBHearingAidDeviceController_sharedController__block_invoke()
{
  AXSBHearingAidDeviceController *v0;
  void *v1;

  v0 = objc_alloc_init(AXSBHearingAidDeviceController);
  v1 = (void *)sharedController_SharedController;
  sharedController_SharedController = (uint64_t)v0;

}

- (AXSBHearingAidDeviceController)init
{
  AXSBHearingAidDeviceController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXSBHearingAidDeviceController;
  v2 = -[AXSBHearingAidDeviceController init](&v6, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)screenDidDim, CFSTR("com.apple.springboardservices.eventobserver.internalSBSEventObserverEventDimmed"), 0, (CFNotificationSuspensionBehavior)0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_liveListenStatusBarActivated_, CFSTR("SBStatusBarReturnToHearingAidNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  void *v10;
  objc_super v11;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.springboardservices.eventobserver.internalSBSEventObserverEventDimmed"), 0);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, CFSTR("SBFaceTimeStateChangedNotification"), 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x24BE003D8], 0);
  v6 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v6, self, (CFNotificationName)*MEMORY[0x24BEB0EF8], 0);
  v7 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v7, self, (CFNotificationName)*MEMORY[0x24BEB0EF0], 0);
  v8 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v8, self, (CFNotificationName)*MEMORY[0x24BEB4AB0], 0);
  v9 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v9, self, (CFNotificationName)*MEMORY[0x24BEB4AA0], 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)AXSBHearingAidDeviceController;
  -[AXSBHearingAidDeviceController dealloc](&v11, sel_dealloc);
}

- (void)startServer
{
  id v3;

  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startServerWithDelegate:", self);

}

- (id)hearingUIClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__AXSBHearingAidDeviceController_hearingUIClient__block_invoke;
  block[3] = &unk_24DDE5710;
  block[4] = self;
  if (hearingUIClient_onceToken != -1)
    dispatch_once(&hearingUIClient_onceToken, block);
  return (id)hearingUIClient_HearingUIClient;
}

uint64_t __49__AXSBHearingAidDeviceController_hearingUIClient__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDFF8F0]), "initWithIdentifier:serviceBundleName:", CFSTR("HearingAidUIClient"), CFSTR("HearingAidUIServer"));
  v3 = (void *)hearingUIClient_HearingUIClient;
  hearingUIClient_HearingUIClient = v2;

  return objc_msgSend((id)hearingUIClient_HearingUIClient, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)_lockStateChanged
{
  if (-[AXSBHearingAidDeviceController isScreenLocked](self, "isScreenLocked"))
    -[AXSBHearingAidDeviceController showHearingAidControl:](self, "showHearingAidControl:", 0);
}

- (BOOL)isScreenLocked
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScreenLockedWithPasscode:", 0);

  return v3;
}

- (void)showHearingAidControl:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "allowHearingAidControlOnLockScreen"))
    {

    }
    else
    {
      v6 = -[AXSBHearingAidDeviceController isScreenLocked](self, "isScreenLocked");

      if (v6)
        return;
    }
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isControlCenterVisible");

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "showControlCenter:", 0);

    }
  }
  -[AXSBHearingAidDeviceController hearingUIClient](self, "hearingUIClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, CFSTR("shouldShow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__AXSBHearingAidDeviceController_showHearingAidControl___block_invoke;
  v15[3] = &unk_24DDE5738;
  v15[4] = self;
  objc_msgSend(v10, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v13, 1, v14, v15);

}

void __56__AXSBHearingAidDeviceController_showHearingAidControl___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "valueForKey:", CFSTR("result"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "setIsShowingHearingAidControl:", objc_msgSend(v3, "BOOLValue"));
    v3 = v4;
  }

}

- (void)hearingServerDidDie:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;

  objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedHearingAids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startServerWithDelegate:", self);

  }
  v7 = dispatch_time(0, 3000000000);
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v7, v8, &__block_literal_global_202);

}

void __54__AXSBHearingAidDeviceController_hearingServerDidDie___block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE4BE40], 0, 0, 1u);
}

- (void)liveListenStatusBarActivated:(id)a3
{
  -[AXSBHearingAidDeviceController showHearingAidControl:](self, "showHearingAidControl:", 1);
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v3;

  -[AXSBHearingAidDeviceController setIsShowingHearingAidControl:](self, "setIsShowingHearingAidControl:", 0);
  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHearingAidControlIsVisible:", 0);

}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  void *v7;
  void *v8;

  if (a5 == 1)
  {
    objc_msgSend(a4, "valueForKey:", CFSTR("result"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      -[AXSBHearingAidDeviceController setIsShowingHearingAidControl:](self, "setIsShowingHearingAidControl:", objc_msgSend(v7, "BOOLValue"));

  }
  return 0;
}

- (BOOL)isShowingHearingAidControl
{
  return self->isShowingHearingAidControl;
}

- (void)setIsShowingHearingAidControl:(BOOL)a3
{
  self->isShowingHearingAidControl = a3;
}

- (BOOL)shouldIgnoreRouteChanges
{
  return self->_shouldIgnoreRouteChanges;
}

- (void)setShouldIgnoreRouteChanges:(BOOL)a3
{
  self->_shouldIgnoreRouteChanges = a3;
}

- (BOOL)hearingAidIsConnected
{
  return self->_hearingAidIsConnected;
}

- (void)setHearingAidIsConnected:(BOOL)a3
{
  self->_hearingAidIsConnected = a3;
}

- (BOOL)holdingMediaForConnection
{
  return self->_holdingMediaForConnection;
}

- (void)setHoldingMediaForConnection:(BOOL)a3
{
  self->_holdingMediaForConnection = a3;
}

- (BOOL)holdingPhoneForConnection
{
  return self->_holdingPhoneForConnection;
}

- (void)setHoldingPhoneForConnection:(BOOL)a3
{
  self->_holdingPhoneForConnection = a3;
}

- (NSDictionary)preferredRoute
{
  return self->_preferredRoute;
}

- (void)setPreferredRoute:(id)a3
{
  objc_storeStrong((id *)&self->_preferredRoute, a3);
}

- (NSTimer)preferredRouteTimer
{
  return self->_preferredRouteTimer;
}

- (void)setPreferredRouteTimer:(id)a3
{
  objc_storeStrong((id *)&self->_preferredRouteTimer, a3);
}

- (OS_dispatch_queue)mediaUpdateQueue
{
  return self->_mediaUpdateQueue;
}

- (void)setMediaUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mediaUpdateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaUpdateQueue, 0);
  objc_storeStrong((id *)&self->_preferredRouteTimer, 0);
  objc_storeStrong((id *)&self->_preferredRoute, 0);
}

@end
