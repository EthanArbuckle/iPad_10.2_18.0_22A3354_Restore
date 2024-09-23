@implementation DSScanManager

- (void)startScanning
{
  CBDiscovery *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD v11[4];
  CBDiscovery *v12;
  DSScanManager *v13;
  _QWORD v14[4];
  id v15;
  DSScanManager *v16;
  _QWORD v17[4];
  id v18;
  DSScanManager *v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = self->_bleDiscovery;
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBB250]);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v4, "setDiscoveryFlags:", self->_bleDiscoveryFlags);
    v5 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __30__DSScanManager_startScanning__block_invoke;
    v17[3] = &unk_24D910C40;
    v6 = v4;
    v18 = v6;
    v19 = self;
    objc_msgSend(v6, "setDeviceFoundHandler:", v17);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __30__DSScanManager_startScanning__block_invoke_2;
    v14[3] = &unk_24D910C40;
    v7 = v6;
    v15 = v7;
    v16 = self;
    objc_msgSend(v7, "setDeviceLostHandler:", v14);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __30__DSScanManager_startScanning__block_invoke_3;
    v11[3] = &unk_24D910C68;
    v3 = (CBDiscovery *)v7;
    v12 = v3;
    v13 = self;
    -[CBDiscovery activateWithCompletion:](v3, "activateWithCompletion:", v11);
    if (onceTokenDSScanManager != -1)
      dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
    v8 = logObjDSScanManager;
    if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "Starting Scanner", v10, 2u);
    }
    objc_storeStrong((id *)&self->_bleDiscovery, v4);

  }
  if (-[DSScanManager _shouldUpdateDiscovery](self, "_shouldUpdateDiscovery"))
  {
    if (onceTokenDSScanManager != -1)
      dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
    v9 = logObjDSScanManager;
    if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_DEFAULT, "Updating Discovery flags", v10, 2u);
    }
    -[CBDiscovery setDiscoveryFlags:](self->_bleDiscovery, "setDiscoveryFlags:", self->_bleDiscoveryFlags);
  }

}

_QWORD *__30__DSScanManager_startScanning__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[2])
    return (_QWORD *)objc_msgSend(result, "_deviceFound:", a2);
  return result;
}

_QWORD *__30__DSScanManager_startScanning__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[2])
    return (_QWORD *)objc_msgSend(result, "_deviceLost:", a2);
  return result;
}

void __30__DSScanManager_startScanning__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
  {
    if (v3)
    {
      if (onceTokenDSScanManager != -1)
        dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
      v5 = logObjDSScanManager;
      if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_ERROR, "Failed to activate CBDiscovery", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
    }
    else
    {
      if (onceTokenDSScanManager != -1)
        dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
      v6 = logObjDSScanManager;
      if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "CBDiscovery Activated", v7, 2u);
      }
    }
  }

}

- (void)setDsScanFlags:(unint64_t)a3
{
  if (self->_dsScanFlags != a3)
  {
    self->_dsScanFlags = a3;
    -[DSScanManager _updateBLEDiscoveryFlags](self, "_updateBLEDiscoveryFlags");
  }
}

- (void)_updateBLEDiscoveryFlags
{
  unint64_t dsScanFlags;
  unint64_t bleDiscoveryFlags;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  self->_bleDiscoveryFlags = 0;
  dsScanFlags = self->_dsScanFlags;
  if ((dsScanFlags & 2) == 0)
  {
    bleDiscoveryFlags = 0;
    if ((dsScanFlags & 4) == 0)
      goto LABEL_14;
    goto LABEL_9;
  }
  self->_bleDiscoveryFlags = 0x800000000000000;
  if (onceTokenDSScanManager != -1)
    dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
  v5 = logObjDSScanManager;
  if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "Set DSInfo Discovery flag", buf, 2u);
  }
  bleDiscoveryFlags = self->_bleDiscoveryFlags;
  if ((self->_dsScanFlags & 4) != 0)
  {
LABEL_9:
    self->_bleDiscoveryFlags = bleDiscoveryFlags | 0x1000000000000000;
    if (onceTokenDSScanManager != -1)
      dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
    v6 = logObjDSScanManager;
    if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "Set DSAction Discovery flag", v7, 2u);
    }
    bleDiscoveryFlags = self->_bleDiscoveryFlags;
  }
LABEL_14:
  if (bleDiscoveryFlags)
    self->_bleDiscoveryFlags = bleDiscoveryFlags | 0x1002000000;
}

- (BOOL)_shouldUpdateDiscovery
{
  CBDiscovery *bleDiscovery;
  NSObject *v4;
  uint8_t v6[16];

  bleDiscovery = self->_bleDiscovery;
  if (bleDiscovery)
  {
    if (-[CBDiscovery discoveryFlags](bleDiscovery, "discoveryFlags") == self->_bleDiscoveryFlags)
    {
      LOBYTE(bleDiscovery) = 0;
    }
    else
    {
      if (onceTokenDSScanManager != -1)
        dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
      v4 = logObjDSScanManager;
      if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "Discovery flags need to be updated", v6, 2u);
      }
      LOBYTE(bleDiscovery) = 1;
    }
  }
  return (char)bleDiscovery;
}

- (void)stopScanning
{
  NSObject *v3;
  CBDiscovery *bleDiscovery;
  id deviceLostHandler;
  id deviceFoundHandler;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSScanManager != -1)
    dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
  v3 = logObjDSScanManager;
  if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Stopping Scan", v7, 2u);
  }
  -[CBDiscovery invalidate](self->_bleDiscovery, "invalidate");
  bleDiscovery = self->_bleDiscovery;
  self->_bleDiscovery = 0;

  self->_bleDiscoveryFlags = 0;
  deviceLostHandler = self->_deviceLostHandler;
  self->_deviceLostHandler = 0;

  deviceFoundHandler = self->_deviceFoundHandler;
  self->_deviceFoundHandler = 0;

}

- (void)_deviceFound:(id)a3
{
  id v4;
  NSObject *v5;
  void (**deviceFoundHandler)(id, id);
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (onceTokenDSScanManager != -1)
    dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
  v5 = logObjDSScanManager;
  if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "Device found %@", (uint8_t *)&v7, 0xCu);
  }
  deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
  if (deviceFoundHandler)
    deviceFoundHandler[2](deviceFoundHandler, v4);

}

- (void)_deviceLost:(id)a3
{
  id v4;
  NSObject *v5;
  void (**deviceLostHandler)(id, id);
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (onceTokenDSScanManager != -1)
    dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
  v5 = logObjDSScanManager;
  if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "Device lost %@", (uint8_t *)&v7, 0xCu);
  }
  deviceLostHandler = (void (**)(id, id))self->_deviceLostHandler;
  if (deviceLostHandler)
    deviceLostHandler[2](deviceLostHandler, v4);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unint64_t)dsScanFlags
{
  return self->_dsScanFlags;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bleDiscovery, 0);
}

@end
