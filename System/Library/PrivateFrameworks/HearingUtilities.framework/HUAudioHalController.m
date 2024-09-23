@implementation HUAudioHalController

- (HUAudioHalController)init
{
  HUAudioHalController *v2;
  HUAudioHalController *v3;
  _QWORD block[4];
  HUAudioHalController *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUAudioHalController;
  v2 = -[HUAudioHalController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__HUAudioHalController_init__block_invoke;
    block[3] = &unk_1EA8E8220;
    v6 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  return v3;
}

uint64_t __28__HUAudioHalController_init__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(*(id *)(a1 + 32), "addAudioHalListener");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)HearingDevicesDidChangeNotification, CFSTR("com.apple.accessibility.hearing.audio.transfer.availability"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  return objc_msgSend(*(id *)(a1 + 32), "registerForPropertyUpdate");
}

- (unsigned)getHearingPlugInID
{
  return 0;
}

- (void)hearingAidReachabilityDidChange
{
  id v3;

  nameOfHearingDeviceReachableForAudioHandoff();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAudioHalController updateHalWithReachableHearingAidsName:](self, "updateHalWithReachableHearingAidsName:", v3);

}

- (void)clearAudioHalDevice
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogHearingHalPlugin();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "AXAudioHalController clearAudioHalDevice", v4, 2u);
  }

  -[HUAudioHalController updateHalWithReachableHearingAidsName:](self, "updateHalWithReachableHearingAidsName:", 0);
}

- (void)registerForPropertyUpdate
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HUAudioHalController_registerForPropertyUpdate__block_invoke;
  v5[3] = &unk_1EA8E95C0;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0EB808](v5, a2);
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForPropertyUpdates:", v2);

  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForPropertyUpdates:", v2);

}

void __49__HUAudioHalController_registerForPropertyUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__HUAudioHalController_registerForPropertyUpdate__block_invoke_2;
    v4[3] = &unk_1EA8E8708;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
  }

}

void __49__HUAudioHalController_registerForPropertyUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3, char *a4)
{
  id v7;
  char isKindOfClass;
  char v9;
  id v10;

  v10 = a3;
  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v9 = objc_msgSend(*(id *)(a1 + 32), "processUpdateDescription:", v10);
  else
    v9 = 1;
  *a4 = v9;

}

- (BOOL)processUpdateDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "objectForKey:", &unk_1EA8FFDD0), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "intValue") == 2)
    {
      -[HUAudioHalController hearingAidConnectionDidChange:](self, "hearingAidConnectionDidChange:", 1);
    }
    else
    {
      objc_msgSend(v6, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAudioHalController hearingAidConnectionDidChange:](self, "hearingAidConnectionDidChange:", objc_msgSend(v9, "intValue") == 2);

    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)hearingAidConnectionDidChange:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  AXLogHearingHalPlugin();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "AXAudioHalController hearingAidConnectionDidChange connected: %d", (uint8_t *)v5, 8u);
  }

}

- (NSString)reachableHearingAidsName
{
  return self->_reachableHearingAidsName;
}

- (void)setReachableHearingAidsName:(id)a3
{
  objc_storeStrong((id *)&self->_reachableHearingAidsName, a3);
}

- (unsigned)plugInID
{
  return self->_plugInID;
}

- (void)setPlugInID:(unsigned int)a3
{
  self->_plugInID = a3;
}

- (id)routeChangeDispatchBlock
{
  return self->_routeChangeDispatchBlock;
}

- (void)setRouteChangeDispatchBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_routeChangeDispatchBlock, 0);
  objc_storeStrong((id *)&self->_reachableHearingAidsName, 0);
}

@end
