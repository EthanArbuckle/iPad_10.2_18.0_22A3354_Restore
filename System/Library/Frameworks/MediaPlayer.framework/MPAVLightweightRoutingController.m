@implementation MPAVLightweightRoutingController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MPAVLightweightRoutingController)initWithName:(id)a3
{
  id v4;
  MPAVLightweightRoutingController *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  AVOutputDeviceDiscoverySession *avDiscoverySession;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  AVOutputContext *avOutputContext;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPAVLightweightRoutingController;
  v5 = -[MPAVLightweightRoutingController init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2C8]), "initWithDeviceFeatures:", 1);
    avDiscoverySession = v5->_avDiscoverySession;
    v5->_avDiscoverySession = (AVOutputDeviceDiscoverySession *)v8;

    -[AVOutputDeviceDiscoverySession setDiscoveryMode:](v5->_avDiscoverySession, "setDiscoveryMode:", 0);
    v10 = (void *)MEMORY[0x1E0C8B2A8];
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "routingContextUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "outputContextForID:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    avOutputContext = v5->_avOutputContext;
    v5->_avOutputContext = (AVOutputContext *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel__availableOutputDevicesDidChangeNotification_, *MEMORY[0x1E0C8AB88], v5->_avDiscoverySession);
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel__outputContextDevicesDidChangeNotification_, *MEMORY[0x1E0C8AB28], v5->_avOutputContext);
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel__outputContextDevicesDidChangeNotification_, *MEMORY[0x1E0C8AB38], v5->_avOutputContext);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPAVLightweightRoutingController;
  -[MPAVLightweightRoutingController dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p \"%@\"), objc_opt_class(), self, self->_name);
}

- (BOOL)isDevicePresenceDetected
{
  return -[AVOutputDeviceDiscoverySession devicePresenceDetected](self->_avDiscoverySession, "devicePresenceDetected");
}

- (void)setDiscoveryMode:(int64_t)a3
{
  int64_t v3;
  void *v6;

  v3 = a3;
  if (a3)
  {
    if (a3 == 1)
    {
      a3 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVLightweightRoutingController.m"), 75, CFSTR("The lightweight routing controller only supports disabled and presence discovery modes. If detailed is needed please use MPAVRoutingController."));

      a3 = 0;
    }
  }
  self->_discoveryMode = v3;
  -[AVOutputDeviceDiscoverySession setDiscoveryMode:](self->_avDiscoverySession, "setDiscoveryMode:", a3);
  MRMediaRemoteSetWantsVolumeControlNotifications();
}

- (NSArray)pickedRoutes
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  MPAVOutputDeviceRoute *v10;
  void *v11;
  MPAVOutputDeviceRoute *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AVOutputContext outputDevices](self->_avOutputContext, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = (const void *)MRAVOutputDeviceCreateFromAVOutputDevice();
        v10 = [MPAVOutputDeviceRoute alloc];
        v19 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1, v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v10, "initWithOutputDevices:", v11);

        CFRelease(v9);
        -[MPAVRoute setPicked:](v12, "setPicked:", 1);
        objc_msgSend(v3, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v13;
}

- (void)_availableOutputDevicesDidChangeNotification:(id)a3
{
  void *v4;
  char v5;
  _QWORD block[5];

  -[MPAVLightweightRoutingController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MPAVLightweightRoutingController__availableOutputDevicesDidChangeNotification___block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_outputContextDevicesDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  MPAVLightweightRoutingController *v8;
  double v9;
  NSDate *lastOutputContextNotificationDate;
  _QWORD block[5];

  v4 = a3;
  -[MPAVLightweightRoutingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = self;
    objc_sync_enter(v8);
    -[NSDate timeIntervalSinceNow](v8->_lastOutputContextNotificationDate, "timeIntervalSinceNow");
    if (v8->_lastOutputContextNotificationDate && v9 >= -2.0)
    {
      -[MPAVLightweightRoutingController _onSyncSelf_schedulePickedRoutesChangedNotification](v8, "_onSyncSelf_schedulePickedRoutesChangedNotification");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__MPAVLightweightRoutingController__outputContextDevicesDidChangeNotification___block_invoke;
      block[3] = &unk_1E3163508;
      block[4] = v8;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    lastOutputContextNotificationDate = v8->_lastOutputContextNotificationDate;
    v8->_lastOutputContextNotificationDate = (NSDate *)v7;

    objc_sync_exit(v8);
  }

}

- (void)_onSyncSelf_schedulePickedRoutesChangedNotification
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (!self->_notificationScheduled)
  {
    self->_notificationScheduled = 1;
    v3 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__MPAVLightweightRoutingController__onSyncSelf_schedulePickedRoutesChangedNotification__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  }
}

- (void)_postPickedRoutesChangedNotification
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[MPAVLightweightRoutingController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPAVLightweightRoutingController pickedRoutes](self, "pickedRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lightweightRoutingController:didChangePickedRoutes:", self, v3);

}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (NSString)name
{
  return self->_name;
}

- (MPAVLightweightRoutingControllerDelegate)delegate
{
  return (MPAVLightweightRoutingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastOutputContextNotificationDate, 0);
  objc_storeStrong((id *)&self->_avOutputContext, 0);
  objc_storeStrong((id *)&self->_avDiscoverySession, 0);
}

uint64_t __87__MPAVLightweightRoutingController__onSyncSelf_schedulePickedRoutesChangedNotification__block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  objc_sync_exit(v2);

  return objc_msgSend(*(id *)(a1 + 32), "_postPickedRoutesChangedNotification");
}

uint64_t __79__MPAVLightweightRoutingController__outputContextDevicesDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postPickedRoutesChangedNotification");
}

void __81__MPAVLightweightRoutingController__availableOutputDevicesDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lightweightRoutingController:didChangeDevicePresenceDetected:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isDevicePresenceDetected"));

}

@end
