@implementation IRAVOutputDeviceDiscoverySessionController

- (void)_didUpdateAVOutputDevices:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke;
  block[3] = &unk_251044310;
  block[4] = self;
  dispatch_async(queue, block);
}

void __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "availableOutputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "copy");

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke_2;
  v7[3] = &unk_251044EA8;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "didUpdateAVOutputDevices:", v4);

}

void __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;

  +[IRAVOutputDeviceDO AVOutputDeviceToDO:](IRAVOutputDeviceDO, "AVOutputDeviceToDO:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
    __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke_2_cold_1((uint64_t)v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (IRAVOutputDeviceDiscoverySessionController)initWithAVOutputDeviceProvider:(id)a3
{
  id v4;
  IRAVOutputDeviceDiscoverySessionController *v5;
  IRAVOutputDeviceDiscoverySessionController *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  AVOutputDeviceDiscoverySession *session;
  uint64_t v12;
  NSNotificationCenter *notificationCenter;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IRAVOutputDeviceDiscoverySessionController;
  v5 = -[IRAVOutputDeviceDiscoverySessionController init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_avOutputDeviceProvider, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.intelligentroutingd.IRAVOutputDeviceDiscoverySessionController", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDB25F0]), "initWithDeviceFeatures:", 5);
    session = v6->_session;
    v6->_session = (AVOutputDeviceDiscoverySession *)v10;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v6->_notificationCenter;
    v6->_notificationCenter = (NSNotificationCenter *)v12;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[IRAVOutputDeviceDiscoverySessionController unregisterForAvailableOutputDevicesNotification](self, "unregisterForAvailableOutputDevicesNotification");
  -[AVOutputDeviceDiscoverySession setDiscoveryMode:](self->_session, "setDiscoveryMode:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IRAVOutputDeviceDiscoverySessionController;
  -[IRAVOutputDeviceDiscoverySessionController dealloc](&v3, sel_dealloc);
}

- (void)registerForAvailableOutputDevicesNotification
{
  -[NSNotificationCenter addObserver:selector:name:object:](self->_notificationCenter, "addObserver:selector:name:object:", self, sel__didUpdateAVOutputDevices_, *MEMORY[0x24BDB1F38], 0);
}

- (void)unregisterForAvailableOutputDevicesNotification
{
  -[NSNotificationCenter removeObserver:name:object:](self->_notificationCenter, "removeObserver:name:object:", self, *MEMORY[0x24BDB1F38], 0);
}

- (void)startDetailedDiscovery
{
  -[AVOutputDeviceDiscoverySession setDiscoveryMode:](self->_session, "setDiscoveryMode:", 2);
}

- (void)stopDetailedDiscovery
{
  -[AVOutputDeviceDiscoverySession setDiscoveryMode:](self->_session, "setDiscoveryMode:", 0);
}

- (IRAVOutputDeviceProvider)avOutputDeviceProvider
{
  return (IRAVOutputDeviceProvider *)objc_loadWeakRetained((id *)&self->_avOutputDeviceProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_avOutputDeviceProvider);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_23FFBA000, a2, OS_LOG_TYPE_DEBUG, "#discovery-session-controller, AVOutputDevice: device has been updated: %@", (uint8_t *)&v2, 0xCu);
}

@end
