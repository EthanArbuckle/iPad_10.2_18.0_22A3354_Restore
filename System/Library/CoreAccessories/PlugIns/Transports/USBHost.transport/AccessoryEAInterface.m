@implementation AccessoryEAInterface

- (AccessoryEAInterface)initWithProtocol:(id)a3 endpointUUID:(id)a4 vid:(unsigned __int16)a5 pid:(unsigned __int16)a6 eaSessionUUID:(id)a7 USBDeviceID:(unint64_t)a8
{
  int v10;
  id v14;
  AccessoryEAInterface *v15;
  AccessoryEAInterface *v16;
  NSMutableArray *v17;
  NSMutableArray *writeBufferArray;
  NSMutableArray *v19;
  NSMutableArray *readBufferArray;
  NSMutableArray *v21;
  NSMutableArray *dataForAppArray;
  NSMutableArray *v23;
  NSMutableArray *allWriteBuffers;
  NSMutableArray *v25;
  NSMutableArray *allReadBuffers;
  uint64_t v27;
  NSString *protocolName;
  int v29;
  uint64_t v30;
  int v31;
  EAUSBBuffer *v32;
  int v33;
  EAUSBBuffer *v34;
  uint64_t v35;
  NSThread *runLoopThread;
  objc_super v38;

  v10 = a6;
  v14 = a3;
  v38.receiver = self;
  v38.super_class = (Class)AccessoryEAInterface;
  v15 = -[iAP2EASession initWithProtocol:endpointUUID:eaSessionUUID:](&v38, sel_initWithProtocol_endpointUUID_eaSessionUUID_, v14, a4, a7);
  v16 = v15;
  if (v15)
  {
    v15->_listenSockRef = 0;
    v15->_listenSockRls = 0;
    v15->_sockRef = 0;
    v15->_sockRls = 0;
    v15->_sockReadDisabled = 0;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    writeBufferArray = v16->_writeBufferArray;
    v16->_writeBufferArray = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    readBufferArray = v16->_readBufferArray;
    v16->_readBufferArray = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    dataForAppArray = v16->_dataForAppArray;
    v16->_dataForAppArray = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    allWriteBuffers = v16->_allWriteBuffers;
    v16->_allWriteBuffers = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    allReadBuffers = v16->_allReadBuffers;
    v16->_allReadBuffers = v25;

    v16->_deviceID = a8;
    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v14);
    protocolName = v16->_protocolName;
    v16->_protocolName = (NSString *)v27;

    v16->_vid = a5;
    v16->_pid = v10;
    v29 = v10 | (v16->_vid << 16);
    v16->_vidpid = v29;
    if (v29 == 95164176)
      v30 = 1024;
    else
      v30 = 0x20000;
    v31 = 8;
    do
    {
      v32 = -[EAUSBBuffer initWithSession:bufferSize:]([EAUSBBuffer alloc], "initWithSession:bufferSize:", v16, v30);
      -[NSMutableArray addObject:](v16->_allReadBuffers, "addObject:", v32);
      -[AccessoryEAInterface _enqueueReadBuffer:](v16, "_enqueueReadBuffer:", v32);

      --v31;
    }
    while (v31);
    v33 = 8;
    do
    {
      v34 = -[EAUSBBuffer initWithSession:bufferSize:]([EAUSBBuffer alloc], "initWithSession:bufferSize:", v16, v30);
      -[NSMutableArray addObject:](v16->_allWriteBuffers, "addObject:", v34);
      -[AccessoryEAInterface _enqueueWriteBuffer:](v16, "_enqueueWriteBuffer:", v34);

      --v33;
    }
    while (v33);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", v16, sel__run, 0);
    runLoopThread = v16->_runLoopThread;
    v16->_runLoopThread = (NSThread *)v35;

    -[NSThread start](v16->_runLoopThread, "start");
    -[AccessoryEAInterface performSelector:onThread:withObject:waitUntilDone:](v16, "performSelector:onThread:withObject:waitUntilDone:", sel__registerListenSocket, v16->_runLoopThread, 0, 1);
  }

  return v16;
}

- (void)shuttingDownSession
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSString *protocolName;
  objc_super v7;
  uint8_t buf[4];
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138412290;
    v9 = protocolName;
    _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_DEFAULT, "Shutting down session for NativeEA protocol %@", buf, 0xCu);
  }

  -[AccessoryEAInterface closeDataPipes](self, "closeDataPipes");
  -[AccessoryEAInterface _sendSessionCloseNotification](self, "_sendSessionCloseNotification");
  v7.receiver = self;
  v7.super_class = (Class)AccessoryEAInterface;
  -[iAP2EASession shuttingDownSession](&v7, sel_shuttingDownSession);
}

- (void)dealloc
{
  NSString *protocolName;
  NSMutableArray *writeBufferArray;
  NSMutableArray *readBufferArray;
  NSMutableArray *dataForAppArray;
  NSMutableArray *allWriteBuffers;
  NSMutableArray *allReadBuffers;
  objc_super v9;

  protocolName = self->_protocolName;
  self->_protocolName = 0;

  writeBufferArray = self->_writeBufferArray;
  self->_writeBufferArray = 0;

  readBufferArray = self->_readBufferArray;
  self->_readBufferArray = 0;

  dataForAppArray = self->_dataForAppArray;
  self->_dataForAppArray = 0;

  allWriteBuffers = self->_allWriteBuffers;
  self->_allWriteBuffers = 0;

  allReadBuffers = self->_allReadBuffers;
  self->_allReadBuffers = 0;

  v9.receiver = self;
  v9.super_class = (Class)AccessoryEAInterface;
  -[iAP2EASession dealloc](&v9, sel_dealloc);
}

- (void)setDataInHandler:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int vidpid;
  void *v11;
  id dataInHandler;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x219A078D4](self->_dataInHandler);
    v9 = (void *)MEMORY[0x219A078D4](v4);
    vidpid = self->_vidpid;
    v13 = 134218496;
    v14 = v8;
    v15 = 2048;
    v16 = v9;
    v17 = 1024;
    v18 = vidpid;
    _os_log_impl(&dword_2171C1000, v7, OS_LOG_TYPE_DEFAULT, "EA Native USB: dataInHandler %p -> %p, vidpid 0x%x", (uint8_t *)&v13, 0x1Cu);

  }
  v11 = (void *)MEMORY[0x219A078D4](v4);
  dataInHandler = self->_dataInHandler;
  self->_dataInHandler = v11;

  if (self->_vidpid == 95164176)
    -[AccessoryEAInterface performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__readSessionDataFromUSB, self->_runLoopThread, 0, 0);

}

- (void)_writeData:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  -[AccessoryEAInterface _dequeueWriteBuffer](self, "_dequeueWriteBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "length");
    v7 = objc_msgSend(v5, "writeSpaceRemaining");
    if (gLogObjects)
      v8 = gNumLogObjects <= 0;
    else
      v8 = 1;
    v9 = !v8;
    if (v6 <= v7)
    {
      if (v9)
      {
        v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v13 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[AccessoryEAInterface _writeData:].cold.5(v6, v13, v17, v18, v19, v20, v21, v22);

      memcpy((void *)objc_msgSend(v5, "writePtr"), (const void *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), v6);
      objc_msgSend(v5, "moveWritePtr:", v6);
      if (objc_msgSend(v5, "dataLength"))
        -[AccessoryEAInterface _writeUSBData:](self, "_writeUSBData:", v5);
      else
        -[AccessoryEAInterface _enqueueWriteBuffer:](self, "_enqueueWriteBuffer:", v5);
    }
    else
    {
      if (v9)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v10 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AccessoryEAInterface _writeData:].cold.3(v5, v6, v10);

    }
  }
  else
  {
    if (gLogObjects)
      v11 = gNumLogObjects < 1;
    else
      v11 = 1;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v14 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    else
    {
      v14 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AccessoryEAInterface _writeData:].cold.1();

  }
}

- (BOOL)writeData:(id)a3
{
  -[AccessoryEAInterface performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__writeData_, self->_runLoopThread, a3, 0);
  return 1;
}

- (void)_run
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "EA Native USB: failed to open USB Interface: 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_registerListenSocket
{
  int v3;
  const __CFAllocator *v4;
  __CFSocket *v5;
  __CFRunLoop *Current;
  CFSocketContext context;

  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  v3 = -[iAP2EASession _createListenSocket](self, "_createListenSocket");
  self->super._listenSock = v3;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFSocketCreateWithNative((CFAllocatorRef)*MEMORY[0x24BDBD240], v3, 2uLL, (CFSocketCallBack)_StaticSockCallback, &context);
  self->_listenSockRef = v5;
  self->_listenSockRls = CFSocketCreateRunLoopSource(v4, v5, 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_listenSockRls, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
}

- (void)_acceptSocketCB:(__CFSocket *)a3 acceptedSock:(int)a4
{
  __CFSocket *v5;
  __CFRunLoop *Current;
  NSObject *v7;
  id v8;
  id v9;
  __CFSocket *sockRef;
  __CFSocket *v11;
  __CFRunLoopSource *sockRls;
  __CFRunLoopSource *v13;
  id v14;
  int v15;
  int v16;
  CFSocketContext context;

  v16 = 1;
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  self->super._sock = a4;
  v5 = CFSocketCreateWithNative(0, a4, 9uLL, (CFSocketCallBack)_StaticSockCallback, &context);
  self->_sockRef = v5;
  CFSocketDisableCallBacks(v5, 9uLL);
  self->_sockRls = CFSocketCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], self->_sockRef, 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_sockRls, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  v15 = 0x20000;
  if (setsockopt(self->super._sock, 0xFFFF, 4097, &v15, 4u))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AccessoryEAInterface _acceptSocketCB:acceptedSock:].cold.5();
LABEL_24:

    sockRef = self->_sockRef;
    if (sockRef)
    {
      CFSocketInvalidate(sockRef);
      v11 = self->_sockRef;
      if (v11)
        CFRelease(v11);
      self->_sockRef = 0;
    }
    sockRls = self->_sockRls;
    if (sockRls)
    {
      CFRunLoopSourceInvalidate(sockRls);
      v13 = self->_sockRls;
      if (v13)
        CFRelease(v13);
      self->_sockRls = 0;
    }
    return;
  }
  if (setsockopt(self->super._sock, 0xFFFF, 4098, &v15, 4u))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v7 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AccessoryEAInterface _acceptSocketCB:acceptedSock:].cold.3();
    goto LABEL_24;
  }
  if (ioctl(self->super._sock, 0x8004667EuLL, &v16) < 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v7 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AccessoryEAInterface _acceptSocketCB:acceptedSock:].cold.1();
    goto LABEL_24;
  }
  CFRunLoopSourceInvalidate(self->_listenSockRls);
  CFRelease(self->_listenSockRls);
  self->_listenSockRls = 0;
  CFSocketInvalidate(self->_listenSockRef);
  CFRelease(self->_listenSockRef);
  self->_listenSockRef = 0;
  close(self->super._listenSock);
  self->super._listenSock = -1;
  if (self->super._openPipeToAppAfterAccept)
  {
    -[AccessoryEAInterface _openPipeToApp](self, "_openPipeToApp");
    self->super._openPipeToAppAfterAccept = 0;
  }
  if (self->super._openPipeFromAppAfterAccept)
  {
    -[AccessoryEAInterface _openPipeFromApp](self, "_openPipeFromApp");
    self->super._openPipeFromAppAfterAccept = 0;
  }
}

- (void)_openPipeToApp
{
  -[AccessoryEAInterface performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__openPipeToAppOnThread, self->_runLoopThread, 0, 0);
}

- (void)_openPipeFromApp
{
  -[AccessoryEAInterface performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__openPipeFromAppOnThread, self->_runLoopThread, 0, 0);
}

- (void)_openPipeFromAppOnThread
{
  CFSocketEnableCallBacks(self->_sockRef, 1uLL);
}

- (BOOL)closeDataPipes
{
  NSThread *runLoopThread;
  NSThread *v4;

  runLoopThread = self->_runLoopThread;
  if (runLoopThread)
  {
    -[NSThread cancel](runLoopThread, "cancel");
    -[AccessoryEAInterface performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__cancelThread, self->_runLoopThread, 0, 1);
    v4 = self->_runLoopThread;
    self->_runLoopThread = 0;

  }
  return 1;
}

- (void)_cancelThread
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "EA Native USB: failed to set alt USB Interface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_enqueueWriteBuffer:(id)a3
{
  __CFSocket *sockRef;

  -[NSMutableArray addObject:](self->_writeBufferArray, "addObject:", a3);
  if (self->_sockReadDisabled)
  {
    sockRef = self->_sockRef;
    if (sockRef)
      CFSocketEnableCallBacks(sockRef, 1uLL);
  }
}

- (id)_dequeueWriteBuffer
{
  void *v3;

  if (-[NSMutableArray count](self->_writeBufferArray, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_writeBufferArray, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_writeBufferArray, "removeObjectAtIndex:", 0);
    objc_msgSend(v3, "reset");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_enqueueReadBuffer:(id)a3
{
  -[NSMutableArray addObject:](self->_readBufferArray, "addObject:", a3);
}

- (id)_dequeueReadBuffer
{
  void *v3;

  if (-[NSMutableArray count](self->_readBufferArray, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_readBufferArray, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_readBufferArray, "removeObjectAtIndex:", 0);
    objc_msgSend(v3, "reset");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_readSessionDataFromApp
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_11(&dword_2171C1000, v2, v3, "EA Native USB:  read 0 bytes from app", v4);
}

- (void)_writeUSBData:(id)a3
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (!objc_msgSend(v7, "writeAttempts"))
    goto LABEL_11;
  v6 = objc_msgSend(v7, "dataLength");
  if (!v6)
    goto LABEL_11;
  while (1)
  {
    objc_msgSend(v7, "attemptWrite", v6);
    v4 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(void *, uint64_t, uint64_t), id))(*self->_usbInterface)->WritePipeAsyncTO)(self->_usbInterface, self->_outPipe, objc_msgSend(v7, "readPtr"), objc_msgSend(v7, "dataLength"), 5000, 15000, _StaticUSBWriteComplete, v7);
    if (!(_DWORD)v4)
      break;
    v5 = v4;
    objc_msgSend(v7, "setUsbError:", v4);
    if (v5 != -536854449 || -[AccessoryEAInterface _clearPipeStall:](self, "_clearPipeStall:", self->_outPipe))
      goto LABEL_11;
    if (!objc_msgSend(v7, "writeAttempts"))
      break;
    if (!objc_msgSend(v7, "dataLength"))
    {
      if (!v6)
        goto LABEL_11;
      break;
    }
  }
  if (!objc_msgSend(v7, "writeAttempts") || !objc_msgSend(v7, "dataLength"))
LABEL_11:
    -[AccessoryEAInterface _writeComplete:writeLength:](self, "_writeComplete:writeLength:", v7, 0, v6);

}

- (int)_clearPipeStall:(unsigned __int8)a3
{
  uint64_t v3;
  int result;

  v3 = a3;
  result = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD))(*self->_usbInterface)->GetPipeStatus)(self->_usbInterface, a3);
  if (result != -536870208 && result != -536870195 && result != 0)
    return ((uint64_t (*)(IOUSBInterfaceStruct942 **, uint64_t))(*self->_usbInterface)->ClearPipeStallBothEnds)(self->_usbInterface, v3);
  return result;
}

- (void)_writeComplete:(id)a3 writeLength:(unint64_t)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "moveReadPtr:", a4);
  if (!objc_msgSend(v6, "usbError"))
    goto LABEL_5;
  if (!objc_msgSend(v6, "writeAttempts"))
  {
    NSLog(CFSTR("Write timedout"));
LABEL_5:
    -[AccessoryEAInterface _enqueueWriteBuffer:](self, "_enqueueWriteBuffer:", v6);
    goto LABEL_6;
  }
  -[AccessoryEAInterface _writeUSBData:](self, "_writeUSBData:", v6);
LABEL_6:

}

- (void)_readSessionDataFromUSB
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  id v7;

  -[AccessoryEAInterface _dequeueReadBuffer](self, "_dequeueReadBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    while (1)
    {
      v7 = v3;
      v4 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD, uint64_t, uint64_t, void (*)(void *, uint64_t, uint64_t), id))(*self->_usbInterface)->ReadPipeAsync)(self->_usbInterface, self->_inPipe, objc_msgSend(v3, "writePtr"), objc_msgSend(v7, "writeSpaceRemaining"), _StaticUSBReadComplete, v7);
      if ((_DWORD)v4)
      {
        v5 = v4;
        NSLog(CFSTR("%s::%u %x"), "-[AccessoryEAInterface _readSessionDataFromUSB]", 1119, v4);
        if (v5 == -536854449)
        {
          if (-[AccessoryEAInterface _clearPipeStall:](self, "_clearPipeStall:", self->_inPipe))
            break;
        }
        if (((unsigned int (*)(IOUSBInterfaceStruct942 **, _QWORD, uint64_t, uint64_t, void (*)(void *, uint64_t, uint64_t), id))(*self->_usbInterface)->ReadPipeAsync)(self->_usbInterface, self->_inPipe, objc_msgSend(v7, "writePtr"), objc_msgSend(v7, "writeSpaceRemaining"), _StaticUSBReadComplete, v7))
        {
          break;
        }
      }
      -[AccessoryEAInterface _dequeueReadBuffer](self, "_dequeueReadBuffer");
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
      if (!v6)
        return;
    }
    -[AccessoryEAInterface _enqueueReadBuffer:](self, "_enqueueReadBuffer:", v7);

  }
}

- (void)_readComplete:(id)a3 readLength:(unint64_t)a4
{
  __CFSocket *sockRef;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "usbError"))
  {
    -[AccessoryEAInterface _enqueueReadBuffer:](self, "_enqueueReadBuffer:", v7);
    -[AccessoryEAInterface _readSessionDataFromUSB](self, "_readSessionDataFromUSB");
    sockRef = self->_sockRef;
    if (sockRef)
      CFSocketEnableCallBacks(sockRef, 8uLL);
  }
  else
  {
    objc_msgSend(v7, "moveWritePtr:", a4);
    -[NSMutableArray insertObject:atIndex:](self->_dataForAppArray, "insertObject:atIndex:", v7, -[NSMutableArray count](self->_dataForAppArray, "count"));
    -[AccessoryEAInterface _writeSessionDataToApp](self, "_writeSessionDataToApp");
  }

}

- (void)_writeSessionDataToApp
{
  uint64_t v7;

  v7 = objc_msgSend(a2, "dataLength");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_2171C1000, a4, OS_LOG_TYPE_DEBUG, "EA Native USB: send %lu bytes to dataInHandler", a1, 0xCu);
}

- (IOUSBInterfaceStruct942)_createInterfaceFromUSBID:(unint64_t)a3
{
  mach_port_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_service_t v7;
  const __CFUUID *v8;
  const __CFUUID *v9;
  kern_return_t v10;
  IOUSBInterfaceStruct942 **v11;
  IOCFPlugInInterface **v12;
  BOOL v13;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFAllocator *v15;
  const __CFUUID *v16;
  CFUUIDBytes v17;
  int v18;
  NSObject *v19;
  id v20;
  io_object_t v21;
  io_service_t v22;
  NSObject *v23;
  const __CFUUID *v24;
  const __CFUUID *v25;
  void *InterfaceAndNameString;
  void *v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  id v41;
  char v43;
  _BYTE v44[15];
  char v45;
  _BYTE v46[3];
  io_iterator_t iterator;
  uint64_t v48;
  uint64_t v49;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  IOUSBInterfaceStruct942 **v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v52 = 0;
  v4 = *MEMORY[0x24BDD8B20];
  v5 = IORegistryEntryIDMatching(a3);
  MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!MatchingService)
    return 0;
  v7 = MatchingService;
  theInterface = 0;
  theScore = 0;
  v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v10 = IOCreatePlugInInterfaceForService(v7, v8, v9, &theInterface, &theScore);
  v11 = 0;
  v12 = theInterface;
  if (v10)
    v13 = 1;
  else
    v13 = theInterface == 0;
  if (!v13)
  {
    v49 = 0;
    QueryInterface = (*theInterface)->QueryInterface;
    v15 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
    v16 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
    v17 = CFUUIDGetUUIDBytes(v16);
    v18 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))QueryInterface)(v12, *(_QWORD *)&v17.byte0, *(_QWORD *)&v17.byte8, &v49);
    if (((unsigned int (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.9();

    }
    v11 = 0;
    if (!v18)
    {
      if (v49)
      {
        v48 = 0x100F000FFLL;
        iterator = 0;
        if ((*(unsigned int (**)(uint64_t, uint64_t *, io_iterator_t *))(*(_QWORD *)v49 + 224))(v49, &v48, &iterator)|| !iterator)
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v36 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
            v36 = MEMORY[0x24BDACB70];
            v37 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.7();

        }
        else
        {
          v21 = IOIteratorNext(iterator);
          if (v21)
          {
            v22 = v21;
            v11 = 0;
            v23 = MEMORY[0x24BDACB70];
            do
            {
              v24 = CFUUIDGetConstantUUIDWithBytes(v15, 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
              v25 = CFUUIDGetConstantUUIDWithBytes(0, 0xBCu, 0xEAu, 0xADu, 0xDCu, 0x88u, 0x4Du, 0x4Fu, 0x27u, 0x83u, 0x40u, 0x36u, 0xD6u, 0x9Fu, 0xABu, 0x90u, 0xF6u);
              InterfaceAndNameString = (void *)usbUtil_getInterfaceAndNameString(v7, v24, v22, v25, &v52);
              v27 = InterfaceAndNameString;
              if (InterfaceAndNameString
                && objc_msgSend(InterfaceAndNameString, "isEqualToString:", self->_protocolName))
              {
                v11 = v52;
              }
              else if (((unsigned int (*)(IOUSBInterfaceStruct942 **))(*v52)->Release)(v52))
              {
                v28 = gLogObjects;
                v29 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v30 = *(id *)gLogObjects;
                }
                else
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    v54 = v28;
                    v55 = 1024;
                    v56 = v29;
                    _os_log_error_impl(&dword_2171C1000, v23, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v31 = v23;
                  v30 = v23;
                }
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.6(&v45, v46);

              }
              if (IOObjectRelease(v22))
              {
                v32 = gLogObjects;
                v33 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v34 = *(id *)gLogObjects;
                }
                else
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    v54 = v32;
                    v55 = 1024;
                    v56 = v33;
                    _os_log_error_impl(&dword_2171C1000, v23, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v35 = v23;
                  v34 = v23;
                }
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.5(&v43, v44);

              }
              v22 = IOIteratorNext(iterator);
            }
            while (v22);
            goto LABEL_58;
          }
        }
        v11 = 0;
LABEL_58:
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v49 + 24))(v49))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v38 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
            v38 = MEMORY[0x24BDACB70];
            v39 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.3();

        }
      }
    }
  }
  if (IOObjectRelease(v7))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v40 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v40 = MEMORY[0x24BDACB70];
      v41 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.1();

  }
  return v11;
}

+ (id)findNativeEAInterfacesForRegistryID:(unint64_t)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  mach_port_t v8;
  const __CFDictionary *v9;
  io_service_t MatchingService;
  io_service_t v11;
  const __CFUUID *v12;
  const __CFUUID *v13;
  kern_return_t v14;
  NSObject *v15;
  id v16;
  IOCFPlugInInterface **v17;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFAllocator *v19;
  const __CFUUID *v20;
  CFUUIDBytes v21;
  int v22;
  NSObject *v23;
  id v24;
  io_object_t v25;
  io_service_t v26;
  NSObject *v27;
  const __CFUUID *v28;
  const __CFUUID *v29;
  void *InterfaceAndNameString;
  uint64_t v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  id v40;
  io_iterator_t iterator;
  uint64_t v43;
  uint64_t v44;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint8_t buf[4];
  unint64_t v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v48 = a3;
    _os_log_impl(&dword_2171C1000, v7, OS_LOG_TYPE_DEFAULT, "Looking for Native USB EA interfaces with parent registry ID 0x%llX", buf, 0xCu);
  }

  v8 = *MEMORY[0x24BDD8B20];
  v9 = IORegistryEntryIDMatching(a3);
  MatchingService = IOServiceGetMatchingService(v8, v9);
  if (MatchingService)
  {
    v11 = MatchingService;
    theInterface = 0;
    theScore = 0;
    v12 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
    v13 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v14 = IOCreatePlugInInterfaceForService(v11, v12, v13, &theInterface, &theScore);
    if (IOObjectRelease(v11))
    {
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
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.1();

    }
    if (!v14)
    {
      v17 = theInterface;
      if (theInterface)
      {
        v44 = 0;
        QueryInterface = (*theInterface)->QueryInterface;
        v19 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
        v20 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
        v21 = CFUUIDGetUUIDBytes(v20);
        v22 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))QueryInterface)(v17, *(_QWORD *)&v21.byte0, *(_QWORD *)&v21.byte8, &v44);
        if (((unsigned int (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
            v23 = MEMORY[0x24BDACB70];
            v24 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.9();

        }
        if (!v22 && v44)
        {
          v43 = 0x100F000FFLL;
          iterator = 0;
          if ((*(unsigned int (**)(uint64_t, uint64_t *, io_iterator_t *))(*(_QWORD *)v44 + 224))(v44, &v43, &iterator)|| !iterator)
          {
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v35 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
              v35 = MEMORY[0x24BDACB70];
              v36 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.7();

          }
          else
          {
            v25 = IOIteratorNext(iterator);
            if (v25)
            {
              v26 = v25;
              v27 = MEMORY[0x24BDACB70];
              do
              {
                v28 = CFUUIDGetConstantUUIDWithBytes(v19, 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
                v29 = CFUUIDGetConstantUUIDWithBytes(0, 0xBCu, 0xEAu, 0xADu, 0xDCu, 0x88u, 0x4Du, 0x4Fu, 0x27u, 0x83u, 0x40u, 0x36u, 0xD6u, 0x9Fu, 0xABu, 0x90u, 0xF6u);
                InterfaceAndNameString = (void *)usbUtil_getInterfaceAndNameString(v11, v28, v26, v29, 0);
                if (InterfaceAndNameString)
                {
                  v31 = gLogObjects;
                  v32 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v33 = *(id *)gLogObjects;
                  }
                  else
                  {
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218240;
                      v48 = v31;
                      v49 = 1024;
                      v50 = v32;
                      _os_log_error_impl(&dword_2171C1000, v27, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                    }
                    v34 = v27;
                    v33 = v27;
                  }
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v48 = (unint64_t)InterfaceAndNameString;
                    _os_log_impl(&dword_2171C1000, v33, OS_LOG_TYPE_DEFAULT, "Found interfaceNameString %@", buf, 0xCu);
                  }

                  objc_msgSend(v4, "addObject:", InterfaceAndNameString);
                }

                v26 = IOIteratorNext(iterator);
              }
              while (v26);
            }
          }
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v44 + 24))(v44))
          {
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v37 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
              v37 = MEMORY[0x24BDACB70];
              v38 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.3();

          }
        }
      }
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v39 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v39 = MEMORY[0x24BDACB70];
    v40 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = (unint64_t)v4;
    _os_log_impl(&dword_2171C1000, v39, OS_LOG_TYPE_DEFAULT, "Native EA endpoint protocols found: %@", buf, 0xCu);
  }

  if (!objc_msgSend(v4, "count"))
  {

    v4 = 0;
  }
  return v4;
}

- (void)_sendSessionOpenNotification
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!_totalNumberOpenNativeSessions++)
  {
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
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_DEFAULT, "Created first EA Native Session, post notification", (uint8_t *)&v10, 2u);
    }

    EANativeSessionStatus = -1;
    if (notify_register_check("com.apple.accessories.ea.native.sessionStatusChanged", &EANativeSessionStatus))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v6 = MEMORY[0x24BDACB70];
        v8 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "com.apple.accessories.ea.native.sessionStatusChanged";
        _os_log_impl(&dword_2171C1000, v6, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", (uint8_t *)&v10, 0xCu);
      }

    }
    else
    {
      notify_set_state(EANativeSessionStatus, 1uLL);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v7 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10 = 136315138;
        v11 = "com.apple.accessories.ea.native.sessionStatusChanged";
        _os_log_impl(&dword_2171C1000, v7, OS_LOG_TYPE_INFO, "Post notification %s with state 1!", (uint8_t *)&v10, 0xCu);
      }

      notify_post("com.apple.accessories.ea.native.sessionStatusChanged");
    }
  }
}

- (void)_sendSessionCloseNotification
{
  BOOL v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!--_totalNumberOpenNativeSessions)
  {
    if (gLogObjects)
      v2 = gNumLogObjects < 1;
    else
      v2 = 1;
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v4 = MEMORY[0x24BDACB70];
      v3 = MEMORY[0x24BDACB70];
    }
    else
    {
      v4 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2171C1000, v4, OS_LOG_TYPE_DEFAULT, "No more EA Native Sessions, post notification", (uint8_t *)&v9, 2u);
    }

    EANativeSessionStatus = -1;
    if (notify_register_check("com.apple.accessories.ea.native.sessionStatusChanged", &EANativeSessionStatus))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v5 = MEMORY[0x24BDACB70];
        v7 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        v10 = "com.apple.accessories.ea.native.sessionStatusChanged";
        _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", (uint8_t *)&v9, 0xCu);
      }

    }
    else
    {
      notify_set_state(EANativeSessionStatus, 0);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v6 = MEMORY[0x24BDACB70];
        v8 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9 = 136315138;
        v10 = "com.apple.accessories.ea.native.sessionStatusChanged";
        _os_log_impl(&dword_2171C1000, v6, OS_LOG_TYPE_INFO, "Post notification %s with state 0!", (uint8_t *)&v9, 0xCu);
      }

      notify_post("com.apple.accessories.ea.native.sessionStatusChanged");
    }
  }
}

+ (void)initializeSessionClose
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (initializeSessionClose_onceToken != -1)
    dispatch_once(&initializeSessionClose_onceToken, &__block_literal_global_116);
  EANativeSessionStatus = -1;
  if (notify_register_check("com.apple.accessories.ea.native.sessionStatusChanged", &EANativeSessionStatus))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v2 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v2 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "com.apple.accessories.ea.native.sessionStatusChanged";
      _os_log_impl(&dword_2171C1000, v2, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    notify_set_state(EANativeSessionStatus, 0);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v3 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "com.apple.accessories.ea.native.sessionStatusChanged";
      _os_log_impl(&dword_2171C1000, v3, OS_LOG_TYPE_INFO, "Post initial notification %s with state 0!", (uint8_t *)&v6, 0xCu);
    }

    notify_post("com.apple.accessories.ea.native.sessionStatusChanged");
  }
}

void __46__AccessoryEAInterface_initializeSessionClose__block_invoke()
{
  _totalNumberOpenNativeSessions = 0;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

- (id)dataInHandler
{
  return self->_dataInHandler;
}

- (unsigned)vid
{
  return self->_vid;
}

- (unsigned)pid
{
  return self->_pid;
}

- (unsigned)vidpid
{
  return self->_vidpid;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataInHandler, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_runLoopThread, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_allWriteBuffers, 0);
  objc_storeStrong((id *)&self->_allReadBuffers, 0);
  objc_storeStrong((id *)&self->_dataForAppArray, 0);
  objc_storeStrong((id *)&self->_readBufferArray, 0);
  objc_storeStrong((id *)&self->_writeBufferArray, 0);
}

- (void)_writeData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "EA Native USB: read bytes from app, No Write Buffer available!!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_writeData:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = objc_msgSend(a1, "writeSpaceRemaining");
  _os_log_error_impl(&dword_2171C1000, a3, OS_LOG_TYPE_ERROR, "EA Native USB: read bytes from app, TOO Many Bytes!!! numberOfBytesRead %zd vs %lu", (uint8_t *)&v4, 0x16u);
}

- (void)_writeData:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_2171C1000, a2, a3, "EA Native USB:  read %zd bytes from app", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_acceptSocketCB:acceptedSock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "EA Native USB: Couldn't set socket to non-blocking mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_acceptSocketCB:acceptedSock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "EA Native USB: Couldn't set socket recv buffer size", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_acceptSocketCB:acceptedSock:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "EA Native USB: Couldn't set socket send buffer size", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_createInterfaceFromUSBID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "EA Native USB: error releasing USB Device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_createInterfaceFromUSBID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "EA Native USB: error releasing device interface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_createInterfaceFromUSBID:(_BYTE *)a1 .cold.5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_6(&dword_2171C1000, v2, (uint64_t)v2, "EA Native USB: error releasing USB Interface", v3);
}

- (void)_createInterfaceFromUSBID:(_BYTE *)a1 .cold.6(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_6(&dword_2171C1000, v2, (uint64_t)v2, "EA Native USB: error releasing plugin interface", v3);
}

- (void)_createInterfaceFromUSBID:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "EA Native USB: error creating interface iterator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_createInterfaceFromUSBID:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "EA Native USB: error releasing plugin interface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
