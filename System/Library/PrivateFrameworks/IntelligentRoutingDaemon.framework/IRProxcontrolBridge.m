@implementation IRProxcontrolBridge

- (IRProxcontrolBridge)initWithDelegate:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  IRProxcontrolBridge *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IRProxcontrolBridge;
  -[IRProxcontrolBridge self](&v12, sel_self);
  v8 = (IRProxcontrolBridge *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IRProxcontrolBridge setName:](v8, "setName:", v7);
    -[IRProxcontrolBridge setDelegate:](v8, "setDelegate:", v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.intelligentroutingd.proxcontrol-bridge", v9);
    -[IRProxcontrolBridge setQueue:](v8, "setQueue:", v10);

  }
  return v8;
}

- (void)_createProxControlObserver
{
  void *v3;
  void *v4;
  id v5;
  OS_dispatch_queue *queue;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v3 = (void *)-[NSString copy](self->_name, "copy");
  -[IRProxcontrolBridge pclControlsObserver](self, "pclControlsObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc_init(MEMORY[0x24BE7BA38]);
    -[IRProxcontrolBridge setPclControlsObserver:](self, "setPclControlsObserver:", v5);

    queue = self->_queue;
    -[IRProxcontrolBridge pclControlsObserver](self, "pclControlsObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDispatchQueue:", queue);

    v8 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __49__IRProxcontrolBridge__createProxControlObserver__block_invoke;
    v20[3] = &unk_251045C50;
    objc_copyWeak(&v22, &location);
    v9 = v3;
    v21 = v9;
    -[IRProxcontrolBridge pclControlsObserver](self, "pclControlsObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceLost:", v20);

    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_13;
    v17[3] = &unk_251045C50;
    objc_copyWeak(&v19, &location);
    v11 = v9;
    v18 = v11;
    -[IRProxcontrolBridge pclControlsObserver](self, "pclControlsObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDeviceUpdated:", v17);

    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_14;
    v14[3] = &unk_251045C78;
    objc_copyWeak(&v16, &location);
    v15 = v11;
    -[IRProxcontrolBridge pclControlsObserver](self, "pclControlsObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInvalidationHandler:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  IRNearbyDeviceDO *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  IRNearbyDeviceDO *v11;
  void *v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = [IRNearbyDeviceDO alloc];
    objc_msgSend(v3, "mediaRouteID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[IRNearbyDeviceDO initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:](v7, "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", 0, v8, v9, v10, 1000.0);

    objc_msgSend(v5, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didRemoveDevice:withName:", v11, v13);

    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
      __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_cold_1();

  }
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  IRNearbyDeviceDO *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  IRNearbyDeviceDO *v15;
  void *v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    objc_msgSend(v3, "distance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [IRNearbyDeviceDO alloc];
      objc_msgSend(v3, "distance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;
      objc_msgSend(v3, "mediaRouteID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[IRNearbyDeviceDO initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:](v8, "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", 0, v12, v13, v14, v11);

      objc_msgSend(v5, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "didUpdateNearbyDevice:withName:", v15, *(_QWORD *)(a1 + 32));

    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
      __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_13_cold_1();
  }

}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    objc_msgSend(v5, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didBridgeFail:", *(_QWORD *)(a1 + 32));

    v8 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_14_cold_1(v8, v3);
  }

}

- (void)_runProxControlObserver
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  v3 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_INFO, "#proxcontrol-bridge, Starting proximity control session", buf, 2u);
  }
  -[IRProxcontrolBridge pclControlsObserver](self, "pclControlsObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__IRProxcontrolBridge__runProxControlObserver__block_invoke;
  v5[3] = &unk_251044BA8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "activateWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __46__IRProxcontrolBridge__runProxControlObserver__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v7);

      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_msgSend(v6, "didBridgeFail:", v8);

        v9 = (void *)*MEMORY[0x24BE5B270];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
          __46__IRProxcontrolBridge__runProxControlObserver__block_invoke_cold_1(v9, v3);
      }
      else
      {
        objc_msgSend(v6, "didBridgeRunSuccesfully:", v8);

        v10 = *MEMORY[0x24BE5B270];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_23FFBA000, v10, OS_LOG_TYPE_INFO, "#proxcontrol-bridge, Activated PCLockscreenControlsObserver", v11, 2u);
        }
      }
    }

  }
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[IRProxcontrolBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__IRProxcontrolBridge_invalidate__block_invoke;
  v4[3] = &unk_251043FF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __33__IRProxcontrolBridge_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "pclControlsObserver");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidate");

    objc_msgSend(v3, "setPclControlsObserver:", 0);
    WeakRetained = v3;
  }

}

- (void)run
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[IRProxcontrolBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __26__IRProxcontrolBridge_run__block_invoke;
  v4[3] = &unk_251043FF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __26__IRProxcontrolBridge_run__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "pclControlsObserver");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v3;
    if (!v2)
    {
      objc_msgSend(v3, "_createProxControlObserver");
      objc_msgSend(v3, "_runProxControlObserver");
      WeakRetained = v3;
    }
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (IRProximityBridgeDelegateProtocol)delegate
{
  return (IRProximityBridgeDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (PCLockscreenControlsObserver)pclControlsObserver
{
  return self->_pclControlsObserver;
}

- (void)setPclControlsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_pclControlsObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pclControlsObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23FFBA000, v0, v1, "#proxcontrol-bridge, PCLockscreenControlsObserver:deviceLost: %@", v2, v3, v4, v5, v6);
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23FFBA000, v0, v1, "#proxcontrol-bridge, PCLockscreenControlsObserver:deviceUpdated: %@", v2, v3, v4, v5, v6);
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_14_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_5(&dword_23FFBA000, v5, v6, "#proxcontrol-bridge, [ErrorId - Prox control invalidated] PCLockscreenControlsObserver:invalidationHandler: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_0();
}

void __46__IRProxcontrolBridge__runProxControlObserver__block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_5(&dword_23FFBA000, v5, v6, "#proxcontrol-bridge, [ErrorId - Prox Control activation error] PCLockscreenControlsObserver:activateWithCompletion: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_0();
}

@end
