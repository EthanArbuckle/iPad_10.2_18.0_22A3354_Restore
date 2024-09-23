@implementation AccessoryUSBCDCInterface

- (AccessoryUSBCDCInterface)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AccessoryUSBCDCInterface"), CFSTR("must call initWithInterface:protocol:endpointUUID:andDataInHandler:"));

  return 0;
}

- (void)dealloc
{
  NSString *protocolName;
  io_object_t cdcDataService;
  io_object_t usbService;
  IONotificationPort *notiPort;
  objc_super v7;

  protocolName = self->_protocolName;
  self->_protocolName = 0;

  -[AccessoryUSBCDCInterface closeCDCInterface](self, "closeCDCInterface");
  cdcDataService = self->_cdcDataService;
  if (cdcDataService)
    IOObjectRelease(cdcDataService);
  usbService = self->_usbService;
  if (usbService)
    IOObjectRelease(usbService);
  notiPort = self->_notiPort;
  if (notiPort)
  {
    IONotificationPortDestroy(notiPort);
    self->_notiPort = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AccessoryUSBCDCInterface;
  -[AccessoryUSBCDCInterface dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)AccessoryUSBCDCInterface;
  -[AccessoryUSBCDCInterface description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ endpointUUID: %@"), v4, self->_endpointUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AccessoryUSBCDCInterface)initWithInterface:(unsigned int)a3 protocol:(id)a4 endpointUUID:(id)a5 andDataInHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  AccessoryUSBCDCInterface *v13;
  uint64_t v14;
  NSString *protocolName;
  uint64_t v16;
  NSString *endpointUUID;
  uint64_t v18;
  id dataInHandler;
  objc_super v21;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AccessoryUSBCDCInterface;
  v13 = -[AccessoryUSBCDCInterface init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    protocolName = v13->_protocolName;
    v13->_protocolName = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    endpointUUID = v13->_endpointUUID;
    v13->_endpointUUID = (NSString *)v16;

    v18 = MEMORY[0x219A078D4](v12);
    dataInHandler = v13->_dataInHandler;
    v13->_dataInHandler = (id)v18;

    *(_QWORD *)&v13->_cdcDataService = 0;
    v13->_cdcConnect = 0;
    -[AccessoryUSBCDCInterface _processInterface:](v13, "_processInterface:", v8);
  }

  return v13;
}

- (void)shuttingDownSession
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSString *protocolName;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    protocolName = self->_protocolName;
    v7 = 138412290;
    v8 = protocolName;
    _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_DEFAULT, "Shutting down session for USB CDC protocol %@", (uint8_t *)&v7, 0xCu);
  }

  -[AccessoryUSBCDCInterface closeCDCInterface](self, "closeCDCInterface");
}

- (BOOL)openCDCInterface
{
  BOOL v3;
  id v4;
  NSObject *v5;
  unsigned int *v6;
  unsigned int *p_cdcConnect;
  kern_return_t v8;
  NSObject *v9;
  id v10;
  kern_return_t v11;
  NSObject *v12;
  id v13;
  kern_return_t v14;
  NSObject *v15;
  id v16;
  kern_return_t v17;
  NSObject *v18;
  id v19;
  kern_return_t v20;
  NSObject *v21;
  id v22;
  kern_return_t v23;
  NSObject *v24;
  id v25;
  kern_return_t v26;
  NSObject *v27;
  id v28;
  NSObject *v30;
  id v31;
  size_t inputStructCnt;
  uint64_t input[2];
  termios inputStruct;
  uint8_t v35[4];
  kern_return_t v36;
  uint8_t v37[8];
  uint8_t buf[8];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AccessoryUSBCDCInterface openCDCInterface].cold.9((uint64_t)self, v5);

  v6 = (unsigned int *)MEMORY[0x24BDAEC58];
  p_cdcConnect = &self->_cdcConnect;
  v8 = IOServiceOpen(self->_cdcDataService, *MEMORY[0x24BDAEC58], 0, &self->_cdcConnect);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    _os_log_impl(&dword_2171C1000, v9, OS_LOG_TYPE_DEFAULT, "openCDCInterface IOServiceOpen kr = 0x%X", buf, 8u);
  }

  if (!v8)
  {
    *(_QWORD *)buf = 0;
    v39 = 0;
    v11 = IOConnectCallMethod(*p_cdcConnect, 0, (const uint64_t *)buf, 2u, 0, 0, 0, 0, 0, 0);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v12 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 67109120;
      *(_DWORD *)&v37[4] = v11;
      _os_log_impl(&dword_2171C1000, v12, OS_LOG_TYPE_DEFAULT, "openCDCInterface IOConnectCallMethod kr = 0x%X", v37, 8u);
    }

  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v37 = 0xAAAAAAAAAAAAAAAALL;
  v14 = MEMORY[0x219A07448](*p_cdcConnect, 0, *v6, buf, v37, 1);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v35 = 67109120;
    v36 = v14;
    _os_log_impl(&dword_2171C1000, v15, OS_LOG_TYPE_INFO, "openCDCInterface kIOSerialMemoryArena kr = 0x%X", v35, 8u);
  }

  if (v14)
    goto LABEL_76;
  self->arena = *(SerialPortInterface **)buf;
  v17 = MEMORY[0x219A07448](self->_cdcConnect, 1, *v6, buf, v37, 1);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v18 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v35 = 67109120;
    v36 = v17;
    _os_log_impl(&dword_2171C1000, v18, OS_LOG_TYPE_INFO, "openCDCInterface kIOSerialMemoryRxBuf kr = 0x%X", v35, 8u);
  }

  if (v17)
    goto LABEL_76;
  self->rxBuf = (char *)(*(_QWORD *)buf + self->arena->var6);
  v20 = MEMORY[0x219A07448](self->_cdcConnect, 2, *v6, buf, v37, 1);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v21 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v21 = MEMORY[0x24BDACB70];
    v22 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v35 = 67109120;
    v36 = v20;
    _os_log_impl(&dword_2171C1000, v21, OS_LOG_TYPE_INFO, "openCDCInterface kIOSerialMemoryTxBuf kr = 0x%X", v35, 8u);
  }

  if (v20)
    goto LABEL_76;
  self->txBuf = (char *)(*(_QWORD *)buf + self->arena->var7);
  memset(&inputStruct, 0, sizeof(inputStruct));
  inputStructCnt = 72;
  *(_OWORD *)input = xmmword_2171DE290;
  v23 = IOConnectCallMethod(self->_cdcConnect, 2u, input, 1u, 0, 0, 0, 0, &inputStruct, &inputStructCnt);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v24 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v24 = MEMORY[0x24BDACB70];
    v25 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v35 = 67109120;
    v36 = v23;
    _os_log_impl(&dword_2171C1000, v24, OS_LOG_TYPE_INFO, "openCDCInterface IOConnectCallMethod 1 kr = 0x%X", v35, 8u);
  }

  if (v23)
    goto LABEL_76;
  inputStruct.c_cflag = inputStruct.c_cflag & 0xFFFFFFFFFFFF20FFLL | 0xCB00;
  cfsetispeed(&inputStruct, 0xE1000uLL);
  cfsetospeed(&inputStruct, 0xE1000uLL);
  v26 = IOConnectCallMethod(*p_cdcConnect, 2u, &input[1], 1u, &inputStruct, inputStructCnt, 0, 0, 0, 0);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v27 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v27 = MEMORY[0x24BDACB70];
    v28 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v35 = 67109120;
    v36 = v26;
    _os_log_impl(&dword_2171C1000, v27, OS_LOG_TYPE_INFO, "openCDCInterface IOConnectCallMethod 2 kr = 0x%X", v35, 8u);
  }

  if (v26)
  {
LABEL_76:
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v30 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v30 = MEMORY[0x24BDACB70];
      v31 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_2171C1000, v30, OS_LOG_TYPE_DEFAULT, "Failed to create CDC interface", v35, 2u);
    }

    -[AccessoryUSBCDCInterface closeCDCInterface](self, "closeCDCInterface");
    return 0;
  }
  else
  {
    -[AccessoryUSBCDCInterface _poll:txCommitted:](self, "_poll:txCommitted:", 0, 0);
    return 1;
  }
}

- (void)closeCDCInterface
{
  unsigned int *v3;
  int v4;
  int v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (unsigned int *)MEMORY[0x24BDAEC58];
  if (self->rxBuf)
  {
    v4 = MEMORY[0x219A07454](self->_cdcConnect, 1, *MEMORY[0x24BDAEC58]);
    if (v4)
    {
      v5 = v4;
      if (gLogObjects)
        v6 = gNumLogObjects < 1;
      else
        v6 = 1;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v8 = MEMORY[0x24BDACB70];
        v7 = MEMORY[0x24BDACB70];
      }
      else
      {
        v8 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v17 = 67109120;
        v18 = v5;
        _os_log_impl(&dword_2171C1000, v8, OS_LOG_TYPE_INFO, "closeCDCInterface kIOSerialMemoryRxBuf kr = 0x%X", (uint8_t *)&v17, 8u);
      }

    }
    self->rxBuf = 0;
  }
  if (self->txBuf)
  {
    v9 = MEMORY[0x219A07454](self->_cdcConnect, 2, *v3);
    if (v9)
    {
      v10 = v9;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v11 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v17 = 67109120;
        v18 = v10;
        _os_log_impl(&dword_2171C1000, v11, OS_LOG_TYPE_INFO, "closeCDCInterface kIOSerialMemoryTxBuf kr = 0x%X", (uint8_t *)&v17, 8u);
      }

    }
    self->txBuf = 0;
  }
  if (self->arena)
  {
    v13 = MEMORY[0x219A07454](self->_cdcConnect, 0, *v3);
    if (v13)
    {
      v14 = v13;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v15 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = 67109120;
        v18 = v14;
        _os_log_impl(&dword_2171C1000, v15, OS_LOG_TYPE_INFO, "closeCDCInterface kIOSerialMemoryArena kr = 0x%X", (uint8_t *)&v17, 8u);
      }

    }
    self->arena = 0;
  }
  IOServiceClose(self->_cdcConnect);
}

- (int)writeData:(id)a3
{
  id v4;
  SerialPortInterface *arena;
  int v6;
  unsigned int var3;
  unsigned int v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  int v23;
  kern_return_t v24;
  kern_return_t v25;
  NSObject *v26;
  id v27;
  id v29;
  uint8_t v30[4];
  kern_return_t v31;
  _BYTE buf[20];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  arena = self->arena;
  v6 = -1 << arena->var9;
  var3 = arena->var3;
  v8 = (arena->var4 + ~var3) & ~v6;
  if (v8 >= objc_msgSend(v4, "length"))
    v8 = objc_msgSend(v4, "length");
  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_2171C1000, v11, OS_LOG_TYPE_DEFAULT, "CDC Data to write = %@", buf, 0xCu);
  }

  if (v8)
  {
    v12 = ~v6;
    v29 = v4;
    v13 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    v14 = 0;
    v15 = MEMORY[0x24BDACB70];
    do
    {
      v16 = (var3 + v14) & v12;
      self->txBuf[self->arena->var7 + v16] = *(_BYTE *)(v13 + v14);
      v17 = gLogObjects;
      v18 = gNumLogObjects;
      if (gLogObjects)
        v19 = gNumLogObjects < 1;
      else
        v19 = 1;
      if (v19)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v18;
          _os_log_error_impl(&dword_2171C1000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v20 = v15;
        v21 = v15;
      }
      else
      {
        v21 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = self->txBuf[self->arena->var7 + v16];
        v23 = *(unsigned __int8 *)(v13 + v14);
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v22;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v14;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v23;
        _os_log_debug_impl(&dword_2171C1000, v21, OS_LOG_TYPE_DEBUG, "txBuf[arena->txqoffset + ((pi++) & mask)] = 0x%X, dataBuf[%d] = 0x%X", buf, 0x14u);
      }

      ++v14;
    }
    while (v8 != v14);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = v8;
    v24 = IOConnectCallMethod(self->_cdcConnect, 1u, (const uint64_t *)buf, 2u, 0, 0, 0, 0, 0, 0);
    if (v24)
    {
      v25 = v24;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v26 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v26 = MEMORY[0x24BDACB70];
        v27 = MEMORY[0x24BDACB70];
      }
      v4 = v29;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v30 = 67109120;
        v31 = v25;
        _os_log_impl(&dword_2171C1000, v26, OS_LOG_TYPE_DEFAULT, "writeData kr = 0x%X", v30, 8u);
      }

      v8 = 0;
    }
    else
    {
      v4 = v29;
    }
  }

  return v8;
}

- (void)_poll:(unsigned int)a3 txCommitted:(unsigned int)a4
{
  mach_port_t cdcConnect;
  mach_port_t MachPort;
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v8;
  id v9;
  uint32_t outputCnt;
  uint8_t buf[4];
  kern_return_t v12;
  uint64_t v13[2];
  uint64_t input[3];
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t reference[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  reference[0] = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  reference[1] = (uint64_t)_asyncCallback;
  v19 = (unint64_t)self;
  input[0] = a3;
  input[1] = a4;
  input[2] = 1;
  v15 = 0u;
  v16 = 0u;
  v17 = 0;
  v13[0] = 0;
  v13[1] = 0;
  outputCnt = 2;
  cdcConnect = self->_cdcConnect;
  MachPort = IONotificationPortGetMachPort(self->_notiPort);
  v6 = IOConnectCallAsyncMethod(cdcConnect, 1u, MachPort, reference, 3u, input, 3u, 0, 0, v13, &outputCnt, 0, 0);
  if (v6)
  {
    v7 = v6;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v12 = v7;
      _os_log_impl(&dword_2171C1000, v8, OS_LOG_TYPE_INFO, "_poll kr = 0x%X", buf, 8u);
    }

  }
}

- (void)_handleReadDataCallback:(int)a3 revent:(unint64_t)a4 t_look:(unint64_t)a5
{
  BOOL v6;
  id v7;
  NSObject *v8;
  SerialPortInterface *arena;
  unsigned __int8 var8;
  unsigned int var1;
  size_t v12;
  int v13;
  uint64_t v14;
  char *rxBuf;
  unsigned int var6;
  void *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AccessoryUSBCDCInterface _handleReadDataCallback:revent:t_look:].cold.2(v8);

  arena = self->arena;
  var8 = arena->var8;
  LODWORD(arena) = atomic_load(&arena->var0);
  var1 = self->arena->var1;
  v12 = arena - var1;
  if ((_DWORD)arena != var1)
  {
    v13 = ~(-1 << var8);
    MEMORY[0x24BDAC7A8]();
    memset(&buf[-((v12 + 15) & 0x1FFFFFFF0)], 170, v12);
    v14 = 0;
    rxBuf = self->rxBuf;
    var6 = self->arena->var6;
    do
    {
      buf[v14 - ((v12 + 15) & 0x1FFFFFFF0)] = rxBuf[var6 + ((var1 + (_DWORD)v14) & v13)];
      ++v14;
    }
    while (v12 != v14);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &buf[-((v12 + 15) & 0x1FFFFFFF0)], v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogObjects)
      v18 = gNumLogObjects < 1;
    else
      v18 = 1;
    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v20 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    else
    {
      v20 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_2171C1000, v20, OS_LOG_TYPE_DEFAULT, "receivedData %@", buf, 0xCu);
    }

    -[AccessoryUSBCDCInterface dataInHandler](self, "dataInHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[AccessoryUSBCDCInterface dataInHandler](self, "dataInHandler");
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, AccessoryUSBCDCInterface *, void *))v22)[2](v22, self, v17);

    }
  }
  -[AccessoryUSBCDCInterface _poll:txCommitted:](self, "_poll:txCommitted:", v12, 0);
}

- (void)_processInterface:(unsigned int)a3
{
  uint64_t v3;
  const __CFAllocator *v5;
  kern_return_t v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  NSDictionary *ioregProperties;
  NSObject *v11;
  id v12;
  id v13;
  NSDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  int v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  unsigned int cdcDataService;
  kern_return_t v36;
  kern_return_t v37;
  uint64_t v38;
  int v39;
  BOOL v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  IONotificationPort *v46;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  unsigned int v49;
  NSObject *v50;
  id v51;
  io_object_t object;
  CFMutableDictionaryRef v53;
  io_iterator_t iterator;
  CFMutableDictionaryRef properties;
  uint8_t buf[16];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[4];
  _BYTE v65[10];
  int v66;
  uint64_t v67;

  v3 = *(_QWORD *)&a3;
  v67 = *MEMORY[0x24BDAC8D0];
  IOObjectRetain(a3);
  if ((_DWORD)v3)
  {
    self->_registryEntryID = +[AccessoryUSBCDCInterface getRegistryEntryIDFromService:](AccessoryUSBCDCInterface, "getRegistryEntryIDFromService:", v3);
    properties = 0;
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v6 = IORegistryEntryCreateCFProperties(v3, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (v6)
      v7 = 1;
    else
      v7 = properties == 0;
    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v8 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AccessoryUSBCDCInterface _processInterface:].cold.3(v6, v8);

    }
    else
    {
      -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("locationID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_locationID = objc_msgSend(v9, "intValue");

      ioregProperties = self->_ioregProperties;
      self->_ioregProperties = (NSDictionary *)properties;

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v11 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_ioregProperties;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_2171C1000, v11, OS_LOG_TYPE_DEFAULT, "_ioregProperties = %@", buf, 0xCu);
      }

      iterator = 0;
      object = v3;
      MEMORY[0x219A074FC](v3, "IOService", &iterator);
      v15 = IOIteratorNext(iterator);
      if ((_DWORD)v15)
      {
        v16 = v15;
        v17 = MEMORY[0x24BDACB70];
        do
        {
          v63 = 0u;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          *(_OWORD *)buf = 0u;
          v18 = MEMORY[0x219A07508](v16, buf);
          v19 = gLogObjects;
          v20 = gNumLogObjects;
          if (gLogObjects)
            v21 = gNumLogObjects <= 0;
          else
            v21 = 1;
          v22 = !v21;
          if (v18)
          {
            v23 = v18;
            if (v22)
            {
              v24 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v64 = 134218240;
                *(_QWORD *)v65 = v19;
                *(_WORD *)&v65[8] = 1024;
                v66 = v20;
                _os_log_error_impl(&dword_2171C1000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v64, 0x12u);
              }
              v25 = v17;
              v24 = v17;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v64 = 67109120;
              *(_DWORD *)v65 = v23;
              _os_log_error_impl(&dword_2171C1000, v24, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName failed: %08x", v64, 8u);
            }
          }
          else
          {
            if (v22)
            {
              v24 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v64 = 134218240;
                *(_QWORD *)v65 = v19;
                *(_WORD *)&v65[8] = 1024;
                v66 = v20;
                _os_log_error_impl(&dword_2171C1000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v64, 0x12u);
              }
              v26 = v17;
              v24 = v17;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v64 = 136315138;
              *(_QWORD *)v65 = buf;
              _os_log_debug_impl(&dword_2171C1000, v24, OS_LOG_TYPE_DEBUG, "Registry entry name: %s", v64, 0xCu);
            }
          }

          if (IOObjectConformsTo(v16, "IOSerialStreamSync"))
          {
            v27 = gLogObjects;
            v28 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v29 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v64 = 134218240;
                *(_QWORD *)v65 = v27;
                *(_WORD *)&v65[8] = 1024;
                v66 = v28;
                _os_log_error_impl(&dword_2171C1000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v64, 0x12u);
              }
              v30 = v17;
              v29 = v17;
            }
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v64 = 0;
              _os_log_impl(&dword_2171C1000, v29, OS_LOG_TYPE_DEFAULT, "Found IOSerialStreamSync", v64, 2u);
            }

            self->_cdcDataService = v16;
            IOObjectRetain(v16);
            v31 = gLogObjects;
            v32 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v33 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v64 = 134218240;
                *(_QWORD *)v65 = v31;
                *(_WORD *)&v65[8] = 1024;
                v66 = v32;
                _os_log_error_impl(&dword_2171C1000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v64, 0x12u);
              }
              v34 = v17;
              v33 = v17;
            }
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              cdcDataService = self->_cdcDataService;
              *(_DWORD *)v64 = 67109376;
              *(_DWORD *)v65 = cdcDataService;
              *(_WORD *)&v65[4] = 1024;
              *(_DWORD *)&v65[6] = v16;
              _os_log_impl(&dword_2171C1000, v33, OS_LOG_TYPE_DEFAULT, "_cdcDataService = %u, cdcService = %u", v64, 0xEu);
            }

          }
          v53 = 0;
          v36 = IORegistryEntryCreateCFProperties(v16, &v53, v5, 0);
          v37 = v36;
          v38 = gLogObjects;
          v39 = gNumLogObjects;
          if (gLogObjects)
            v40 = gNumLogObjects <= 0;
          else
            v40 = 1;
          v41 = !v40;
          if (v36 || !v53)
          {
            if (v41)
            {
              v43 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v64 = 134218240;
                *(_QWORD *)v65 = v38;
                *(_WORD *)&v65[8] = 1024;
                v66 = v39;
                _os_log_error_impl(&dword_2171C1000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v64, 0x12u);
              }
              v44 = v17;
              v43 = v17;
            }
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v64 = 67109120;
              *(_DWORD *)v65 = v37;
              _os_log_error_impl(&dword_2171C1000, v43, OS_LOG_TYPE_ERROR, "Failed to get childServiceProperties error: %08x", v64, 8u);
            }

          }
          else
          {
            if (v41)
            {
              v42 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v64 = 134218240;
                *(_QWORD *)v65 = v38;
                *(_WORD *)&v65[8] = 1024;
                v66 = v39;
                _os_log_error_impl(&dword_2171C1000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v64, 0x12u);
              }
              v45 = v17;
              v42 = v17;
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v64 = 138412290;
              *(_QWORD *)v65 = v53;
              _os_log_debug_impl(&dword_2171C1000, v42, OS_LOG_TYPE_DEBUG, "childServiceProperties = %@", v64, 0xCu);
            }

            CFRelease(v53);
          }
          IOObjectRelease(v16);
          v16 = IOIteratorNext(iterator);
        }
        while ((_DWORD)v16);
      }
      IOObjectRelease(iterator);
      v46 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
      self->_notiPort = v46;
      if (v46)
      {
        Main = CFRunLoopGetMain();
        RunLoopSource = IONotificationPortGetRunLoopSource(self->_notiPort);
        CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
        v49 = object;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v50 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
          v50 = MEMORY[0x24BDACB70];
          v51 = MEMORY[0x24BDACB70];
        }
        v49 = object;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2171C1000, v50, OS_LOG_TYPE_DEFAULT, "Could not create notification port", buf, 2u);
        }

      }
      self->_usbService = v49;
      IOObjectRetain(v49);
      IOObjectRelease(v49);
    }
  }
}

+ (unint64_t)getRegistryEntryIDFromService:(unsigned int)a3
{
  uint64_t entryID;

  entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(a3, &entryID))
    return 0;
  else
    return entryID;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

- (unsigned)locationID
{
  return self->_locationID;
}

- (unint64_t)parentDeviceRegistryEntryID
{
  return self->_parentDeviceRegistryEntryID;
}

- (NSDictionary)ioregProperties
{
  return self->_ioregProperties;
}

- (id)dataInHandler
{
  return self->_dataInHandler;
}

- (void)setDataInHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataInHandler, 0);
  objc_storeStrong((id *)&self->_ioregProperties, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_eaSessionUUID, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

- (void)openCDCInterface
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_2171C1000, a2, OS_LOG_TYPE_DEBUG, "_cdcDataService = %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_7();
}

- (void)_handleReadDataCallback:(os_log_t)log revent:t_look:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2171C1000, log, OS_LOG_TYPE_DEBUG, "_handleReadDataCallback", v1, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_processInterface:(int)a1 .cold.3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2171C1000, a2, OS_LOG_TYPE_ERROR, "Failed to get serviceProperties error: %08x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_7();
}

@end
