@implementation MRLegacyController

- (MRLegacyController)initWithExternalDevice:(id)a3 outputDeviceUID:(id)a4
{
  id v7;
  id v8;
  MRLegacyController *v9;
  MRLegacyController *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MRLegacyController;
  v9 = -[MRLegacyController init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    -[MRLegacyController setOutputDeviceUID:](v9, "setOutputDeviceUID:", v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.mediaremote/MRLegacyController", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_externalDevice, a3);
    -[MRLegacyController setupExternalDevice](v10, "setupExternalDevice");
  }

  return v10;
}

- (MRLegacyController)initWithAVOutputDevice:(id)a3
{
  id v4;
  MRAVOutputDeviceSourceInfo *v5;
  void *v6;
  MRAVOutputDeviceSourceInfo *v7;
  MRAVConcreteOutputDevice *v8;
  MRLegacyController *v9;

  v4 = a3;
  v5 = [MRAVOutputDeviceSourceInfo alloc];
  objc_msgSend(v4, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRAVOutputDeviceSourceInfo initWithRoutingContextUID:multipleBuiltInDevices:](v5, "initWithRoutingContextUID:multipleBuiltInDevices:", v6, 0);

  v8 = -[MRAVConcreteOutputDevice initWithAVOutputDevice:sourceInfo:]([MRAVConcreteOutputDevice alloc], "initWithAVOutputDevice:sourceInfo:", v4, v7);
  v9 = -[MRLegacyController initWithOutputDevice:](self, "initWithOutputDevice:", v8);

  return v9;
}

- (MRLegacyController)initWithOutputDevice:(id)a3
{
  void *v4;
  MRLegacyController *v5;

  objc_msgSend(a3, "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRLegacyController initWithExternalDevice:outputDeviceUID:](self, "initWithExternalDevice:outputDeviceUID:", 0, v4);

  return v5;
}

- (MRLegacyController)initWithOutputDeviceUID:(id)a3
{

  return 0;
}

- (void)connect
{
  MRExternalDevice *externalDevice;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  externalDevice = self->_externalDevice;
  v4 = CFSTR("MRExternalDeviceConnectionReasonUserInfoKey");
  v5[0] = CFSTR("MRLegacyController");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRExternalDevice connectWithOptions:userInfo:](externalDevice, "connectWithOptions:userInfo:", 0, v3);

}

- (void)addOutputDeviceIDs:(id)a3 completion:(id)a4
{
  -[MRLegacyController modifyTopologyAddingDevices:removingDevices:settingDevices:completion:](self, "modifyTopologyAddingDevices:removingDevices:settingDevices:completion:", a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a4);
}

- (void)removeOutputDeviceIDs:(id)a3 completion:(id)a4
{
  -[MRLegacyController modifyTopologyAddingDevices:removingDevices:settingDevices:completion:](self, "modifyTopologyAddingDevices:removingDevices:settingDevices:completion:", MEMORY[0x1E0C9AA60], a3, MEMORY[0x1E0C9AA60], a4);
}

- (void)setOutputDeviceIDs:(id)a3 completion:(id)a4
{
  -[MRLegacyController modifyTopologyAddingDevices:removingDevices:settingDevices:completion:](self, "modifyTopologyAddingDevices:removingDevices:settingDevices:completion:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a3, a4);
}

- (void)getMasterVolumeWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRLegacyController externalDevice](self, "externalDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputDeviceVolume:queue:completion:", 0, self->_queue, v4);

}

- (void)getOutputDeviceVolume:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MRLegacyController externalDevice](self, "externalDevice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputDeviceVolume:queue:completion:", v7, self->_queue, v6);

}

- (void)getMasterVolumeCapabilitiesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRLegacyController externalDevice](self, "externalDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputDeviceVolumeControlCapabilities:queue:completion:", 0, self->_queue, v4);

}

- (void)getOutputDeviceVolumeCapabilities:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MRLegacyController externalDevice](self, "externalDevice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputDeviceVolumeControlCapabilities:queue:completion:", v7, self->_queue, v6);

}

- (void)setMasterVolume:(float)a3 completion:(id)a4
{
  id v6;
  double v7;
  id v8;

  v6 = a4;
  -[MRLegacyController externalDevice](self, "externalDevice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v8, "setOutputDeviceVolume:outputDeviceUID:queue:completion:", 0, self->_queue, v6, v7);

}

- (void)setVolume:(float)a3 forOutputDeviceID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  double v10;
  id v11;

  v8 = a5;
  v9 = a4;
  -[MRLegacyController externalDevice](self, "externalDevice");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a3;
  objc_msgSend(v11, "setOutputDeviceVolume:outputDeviceUID:queue:completion:", v9, self->_queue, v8, v10);

}

- (void)tearDown
{
  MRExternalDevice *externalDevice;

  -[MRExternalDevice disconnect:](self->_externalDevice, "disconnect:", 0);
  externalDevice = self->_externalDevice;
  self->_externalDevice = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[MRLegacyController tearDown](self, "tearDown");
  v3.receiver = self;
  v3.super_class = (Class)MRLegacyController;
  -[MRLegacyController dealloc](&v3, sel_dealloc);
}

- (void)setupExternalDevice
{
  MRExternalDevice *externalDevice;
  uint64_t v4;
  MRExternalDevice *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[MRExternalDevice setWantsVolumeNotifications:](self->_externalDevice, "setWantsVolumeNotifications:", 1);
  -[MRExternalDevice setWantsOutputDeviceNotifications:](self->_externalDevice, "setWantsOutputDeviceNotifications:", 1);
  -[MRExternalDevice setWantsNowPlayingArtworkNotifications:](self->_externalDevice, "setWantsNowPlayingArtworkNotifications:", 0);
  -[MRExternalDevice setWantsNowPlayingNotifications:](self->_externalDevice, "setWantsNowPlayingNotifications:", 0);
  objc_initWeak(&location, self);
  externalDevice = self->_externalDevice;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__MRLegacyController_setupExternalDevice__block_invoke;
  v9[3] = &unk_1E30C5AA8;
  objc_copyWeak(&v10, &location);
  -[MRExternalDevice setVolumeCallback:withQueue:](externalDevice, "setVolumeCallback:withQueue:", v9, self->_queue);
  v5 = self->_externalDevice;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __41__MRLegacyController_setupExternalDevice__block_invoke_2;
  v7[3] = &unk_1E30C5AD0;
  objc_copyWeak(&v8, &location);
  -[MRExternalDevice setConnectionStateCallback:withQueue:](v5, "setConnectionStateCallback:withQueue:", v7, self->_queue);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleVolumeCapabilitiesDidChangeNotification_, CFSTR("kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification"), 0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __41__MRLegacyController_setupExternalDevice__block_invoke(uint64_t a1, float a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  double v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  *(float *)&v8 = a2;
  if (a4)
    objc_msgSend(v6, "legacyController:volumeDidChange:forOutputDevice:", WeakRetained, a4, v8);
  else
    objc_msgSend(v6, "legacyController:masterVolumeDidChange:", WeakRetained, v8);

}

void __41__MRLegacyController_setupExternalDevice__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 2)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    WeakRetained = v11;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v11, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "legacyControllerConnectionDidConnect:", v11);
      goto LABEL_7;
    }
  }
  else if (a2 == 3)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    WeakRetained = v11;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v11, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "legacyControllerConnectionDidDisconnect:withError:", v11, a3);
LABEL_7:

      WeakRetained = v11;
    }
  }

}

- (void)handleVolumeCapabilitiesDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRAVEndpointIdentifierUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "containsString:", self->_outputDeviceUID);
  objc_msgSend(v14, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMRAVEndpointOutputDeviceIdentifierUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isEqualToString:", self->_outputDeviceUID);
  if ((v6 & 1) != 0 || v9)
  {
    objc_msgSend(v14, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRAVEndpointVolumeControlCapabilitiesUserInfoKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    -[MRLegacyController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "legacyController:volumeControlAvailabilityDidChange:forOutputDevice:", self, v12 != 0, v8);

  }
}

- (MRLegacyControllerDelegate)delegate
{
  return (MRLegacyControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MRExternalDevice)externalDevice
{
  return self->_externalDevice;
}

- (void)setExternalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_externalDevice, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
