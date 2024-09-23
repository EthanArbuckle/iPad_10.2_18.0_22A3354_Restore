@implementation ACCOOBBTPairingAccessory

- (ACCOOBBTPairingAccessory)init
{
  ACCOOBBTPairingAccessory *v2;
  ACCOOBBTPairingAccessory *v3;
  ACCiAP2ShimAccessory *iap2ShimAccessory;
  NSString *currentOOBBTPairingUID;
  NSString *displayName;
  dispatch_queue_t v7;
  OS_dispatch_queue *BTSessionQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *processingQueue;
  NSData *currentRemoteMACAddress;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *setup_complete_semaphore;
  NSObject *v14;
  uint64_t v15;
  ACCOOBBTPairingAccessory *v16;
  NSObject *v17;
  id v18;
  dispatch_time_t v19;
  _QWORD v21[4];
  ACCOOBBTPairingAccessory *v22;
  uint64_t *v23;
  void (*v24)(uint64_t, int, int, void *);
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  _QWORD block[4];
  ACCOOBBTPairingAccessory *v30;
  void (*v31)(uint64_t, int, int, void *);
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)ACCOOBBTPairingAccessory;
  v2 = -[ACCOOBBTPairingAccessory init](&v32, sel_init);
  v3 = v2;
  if (v2)
  {
    iap2ShimAccessory = v2->_iap2ShimAccessory;
    v2->_iap2ShimAccessory = 0;

    currentOOBBTPairingUID = v3->_currentOOBBTPairingUID;
    v3->_currentOOBBTPairingUID = 0;

    displayName = v3->_displayName;
    v3->_displayName = 0;

    v3->_isBTReady = 0;
    v3->_BTAccessoryManager = 0;
    v7 = dispatch_queue_create((const char *)kBTQueueName, 0);
    BTSessionQueue = v3->_BTSessionQueue;
    v3->_BTSessionQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create((const char *)kProcessingQueueName, 0);
    processingQueue = v3->_processingQueue;
    v3->_processingQueue = (OS_dispatch_queue *)v9;

    currentRemoteMACAddress = v3->_currentRemoteMACAddress;
    v3->_currentRemoteMACAddress = 0;

    v3->_currentRemoteBTDevice = 0;
    v12 = dispatch_semaphore_create(0);
    setup_complete_semaphore = v3->_setup_complete_semaphore;
    v3->_setup_complete_semaphore = (OS_dispatch_semaphore *)v12;

    v31 = __callbackSessionEvent;
    v14 = v3->_processingQueue;
    v15 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__ACCOOBBTPairingAccessory_init__block_invoke;
    block[3] = &unk_24D52BF58;
    v16 = v3;
    v30 = v16;
    dispatch_async(v14, block);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = -1431655766;
    v28 = BTSessionAttachWithQueue();
    if (*((_DWORD *)v26 + 6))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCOOBBTPairingAccessory init].cold.2();
        v17 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.1();

      v19 = dispatch_time(0, 5000000000);
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __32__ACCOOBBTPairingAccessory_init__block_invoke_4;
      v21[3] = &unk_24D52BF80;
      v23 = &v25;
      v24 = v31;
      v22 = v16;
      dispatch_after(v19, MEMORY[0x24BDAC9B8], v21);

    }
    _Block_object_dispose(&v25, 8);

  }
  return v3;
}

void __32__ACCOOBBTPairingAccessory_init__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21634E000, v4, OS_LOG_TYPE_DEFAULT, "Blocking the processing queue while waiting for the BT session initialization to finish...", buf, 2u);
  }

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 96), 0xFFFFFFFFFFFFFFFFLL);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21634E000, v5, OS_LOG_TYPE_DEFAULT, "Unblocking the processing queue", v7, 2u);
  }

}

void __32__ACCOOBBTPairingAccessory_init__block_invoke_4(uint64_t a1)
{
  BOOL v2;
  int v3;
  NSObject *v4;
  id v5;
  id v6;
  uint8_t v7[16];

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = BTSessionAttachWithQueue();
  if (gLogObjects)
    v2 = gNumLogObjects <= 0;
  else
    v2 = 1;
  v3 = !v2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (v3)
    {
      v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v4 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __32__ACCOOBBTPairingAccessory_init__block_invoke_4_cold_2();
  }
  else
  {
    if (v3)
    {
      v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v4 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21634E000, v4, OS_LOG_TYPE_DEFAULT, "2nd attempted to establish BT session succeeded", v7, 2u);
    }
  }

}

- (void)dealloc
{
  int v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  id v7;
  const char *v8;
  id v9;
  ACCiAP2ShimAccessory *iap2ShimAccessory;
  NSString *currentOOBBTPairingUID;
  NSData *currentRemoteMACAddress;
  OS_dispatch_semaphore *setup_complete_semaphore;
  OS_dispatch_queue *BTSessionQueue;
  OS_dispatch_queue *processingQueue;
  objc_super v16;
  uint8_t buf[16];

  if (self->_BTSession)
  {
    v3 = BTSessionDetachWithQueue();
    if (gLogObjects)
      v4 = gNumLogObjects <= 0;
    else
      v4 = 1;
    v5 = !v4;
    if (v3)
    {
      if (v5)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCOOBBTPairingAccessory init].cold.2();
        v6 = MEMORY[0x24BDACB70];
        v7 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v8 = "BTSessionDetachWithQueue failed";
    }
    else
    {
      if (v5)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCOOBBTPairingAccessory init].cold.2();
        v6 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v8 = "Succesfully detached from BTSession";
    }
    _os_log_impl(&dword_21634E000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
LABEL_24:

  }
  iap2ShimAccessory = self->_iap2ShimAccessory;
  self->_iap2ShimAccessory = 0;

  currentOOBBTPairingUID = self->_currentOOBBTPairingUID;
  self->_currentOOBBTPairingUID = 0;

  currentRemoteMACAddress = self->_currentRemoteMACAddress;
  self->_currentRemoteMACAddress = 0;

  setup_complete_semaphore = self->_setup_complete_semaphore;
  *(_OWORD *)&self->_setup_complete_semaphore = 0u;

  BTSessionQueue = self->_BTSessionQueue;
  *(_OWORD *)&self->_BTAccessoryManager = 0u;

  processingQueue = self->_processingQueue;
  *(_OWORD *)&self->_BTSession = 0u;

  v16.receiver = self;
  v16.super_class = (Class)ACCOOBBTPairingAccessory;
  -[ACCOOBBTPairingAccessory dealloc](&v16, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCOOBBTPairingAccessory>[%@; displayName=%@; certData=%lu bytes; certSerial=%lu bytes; carPlaySupported=%d; oobPairing2Supported=%d; _currentOOBBTPairingUID=%@; _currentRemoteMACAddress=%@]"),
               self->_iap2ShimAccessory,
               self->_displayName,
               -[NSData length](self->_certData, "length"),
               -[NSData length](self->_certSerial, "length"),
               self->_carPlaySupported,
               self->_oobPairing2Supported,
               self->_currentOOBBTPairingUID,
               self->_currentRemoteMACAddress);
}

- (ACCiAP2ShimAccessory)iap2ShimAccessory
{
  return self->_iap2ShimAccessory;
}

- (void)setIap2ShimAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_iap2ShimAccessory, a3);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)certData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCertData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)certSerial
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCertSerial:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)carPlaySupported
{
  return self->_carPlaySupported;
}

- (void)setCarPlaySupported:(BOOL)a3
{
  self->_carPlaySupported = a3;
}

- (BOOL)oobPairing2Supported
{
  return self->_oobPairing2Supported;
}

- (void)setOobPairing2Supported:(BOOL)a3
{
  self->_oobPairing2Supported = a3;
}

- (NSString)currentOOBBTPairingUID
{
  return self->_currentOOBBTPairingUID;
}

- (void)setCurrentOOBBTPairingUID:(id)a3
{
  objc_storeStrong((id *)&self->_currentOOBBTPairingUID, a3);
}

- (NSData)currentRemoteMACAddress
{
  return self->_currentRemoteMACAddress;
}

- (void)setCurrentRemoteMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_currentRemoteMACAddress, a3);
}

- (BTAccessoryManagerImpl)BTAccessoryManager
{
  return self->_BTAccessoryManager;
}

- (void)setBTAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_BTAccessoryManager = a3;
}

- (OS_dispatch_queue)BTSessionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBTSessionQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BTSessionImpl)BTSession
{
  return self->_BTSession;
}

- (void)setBTSession:(BTSessionImpl *)a3
{
  self->_BTSession = a3;
}

- (BOOL)isBTReady
{
  return self->_isBTReady;
}

- (void)setIsBTReady:(BOOL)a3
{
  self->_isBTReady = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setProcessingQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_semaphore)setup_complete_semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSetup_complete_semaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BTDeviceImpl)currentRemoteBTDevice
{
  return self->_currentRemoteBTDevice;
}

- (void)setCurrentRemoteBTDevice:(BTDeviceImpl *)a3
{
  self->_currentRemoteBTDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setup_complete_semaphore, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_BTSessionQueue, 0);
  objc_storeStrong((id *)&self->_currentRemoteMACAddress, 0);
  objc_storeStrong((id *)&self->_currentOOBBTPairingUID, 0);
  objc_storeStrong((id *)&self->_certSerial, 0);
  objc_storeStrong((id *)&self->_certData, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_iap2ShimAccessory, 0);
}

- (void)init
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21634E000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __32__ACCOOBBTPairingAccessory_init__block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21634E000, v0, v1, "ERROR: Unable to establish connection to BTServer. (Not retrying)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
