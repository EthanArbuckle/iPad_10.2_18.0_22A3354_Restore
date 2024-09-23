@implementation ACCTransportIOAccessoryBase

- (ACCTransportIOAccessoryBase)initWithIOAccessoryClass:(int)a3 ioService:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  ACCTransportIOAccessoryBase *v6;
  ACCTransportIOAccessoryBase *v7;
  unsigned int *p_ioServiceClassType;
  void *v9;
  id v10;
  void *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *notificationPortQueue;
  IONotificationPort *v15;
  int PrimaryPort;
  int v17;
  NSObject *v18;
  id v19;
  unsigned int ioService;
  int primaryPortNumber;
  unsigned int upstreamManagerService;
  id v23;
  objc_super v25;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)ACCTransportIOAccessoryBase;
  v6 = -[ACCTransportIOAccessoryBase init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ioServiceClassType = v5;
    p_ioServiceClassType = (unsigned int *)&v6->_ioServiceClassType;
    v6->_ioService = v4;
    v9 = (void *)MEMORY[0x24BDD17C8];
    +[ACCTransportIOAccessorySharedManager IOAccessoryClassStringForIOAccessoryClassType:](ACCTransportIOAccessorySharedManager, "IOAccessoryClassStringForIOAccessoryClassType:", v5);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.ACCTransportPlugin.%s.%d"), objc_msgSend(v10, "UTF8String"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
    notificationPortQueue = v7->_notificationPortQueue;
    v7->_notificationPortQueue = (OS_dispatch_queue *)v13;

    v15 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
    v7->_ioNotificationPort = v15;
    IONotificationPortSetDispatchQueue(v15, (dispatch_queue_t)v7->_notificationPortQueue);
    v7->_ioNotificationObject = 0;
    v7->_ioConnect = 0;
    v7->_primaryPortNumber = -1;
    v7->_upstreamManagerService = IOAccessoryManagerGetUpstreamService();
    switch(*p_ioServiceClassType)
    {
      case 0u:
      case 2u:
      case 3u:
      case 4u:
      case 6u:
        PrimaryPort = IOAccessoryManagerGetPrimaryPort();
        goto LABEL_4;
      case 1u:
        PrimaryPort = IOAccessoryPortGetManagerPrimaryPort();
LABEL_4:
        v7->_primaryPortNumber = PrimaryPort;
        if (PrimaryPort == -1)
          goto LABEL_17;
        v17 = logModuleForTransport(*p_ioServiceClassType);
        if (v17 < 0 || !gLogObjects || gNumLogObjects <= v17)
        {
          if (v17 != -1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v18 = MEMORY[0x24BDACB70];
          v19 = MEMORY[0x24BDACB70];
        }
        else
        {
          v18 = *(id *)(gLogObjects + 8 * v17);
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          ioService = v7->_ioService;
          primaryPortNumber = v7->_primaryPortNumber;
          upstreamManagerService = v7->_upstreamManagerService;
          *(_DWORD *)buf = 67109632;
          v27 = ioService;
          v28 = 1024;
          v29 = primaryPortNumber;
          v30 = 1024;
          v31 = upstreamManagerService;
          _os_log_impl(&dword_21722C000, v18, OS_LOG_TYPE_DEFAULT, "adding service with ioService %d, _primaryPortNumber %d, and _upstreamManager service %d", buf, 0x14u);
        }
        break;
      default:
        v7->_primaryPortNumber = -1;
LABEL_17:
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v18 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v18 = MEMORY[0x24BDACB70];
          v23 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryBase initWithIOAccessoryClass:ioService:].cold.1(&v7->_ioServiceClassType, v18);
        break;
    }

    IOObjectRetain(v7->_ioService);
  }
  return v7;
}

- (void)dealloc
{
  IONotificationPort *ioNotificationPort;
  io_connect_t ioConnect;
  io_object_t ioNotificationObject;
  io_object_t upstreamManagerService;
  OS_dispatch_queue *notificationPortQueue;
  objc_super v8;

  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  self->_primaryPortNumber = -1;
  ioConnect = self->_ioConnect;
  if (ioConnect)
    IOServiceClose(ioConnect);
  ioNotificationObject = self->_ioNotificationObject;
  if (ioNotificationObject)
  {
    IOObjectRelease(ioNotificationObject);
    self->_ioNotificationObject = 0;
  }
  IOObjectRelease(self->_ioService);
  upstreamManagerService = self->_upstreamManagerService;
  if (upstreamManagerService)
    IOObjectRelease(upstreamManagerService);
  notificationPortQueue = self->_notificationPortQueue;
  self->_notificationPortQueue = 0;

  v8.receiver = self;
  v8.super_class = (Class)ACCTransportIOAccessoryBase;
  -[ACCTransportIOAccessoryBase dealloc](&v8, sel_dealloc);
}

- (void)transportClassTerminated
{
  IONotificationPort *ioNotificationPort;
  io_object_t ioNotificationObject;

  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  ioNotificationObject = self->_ioNotificationObject;
  if (ioNotificationObject)
  {
    IOObjectRelease(ioNotificationObject);
    self->_ioNotificationObject = 0;
  }
}

- (BOOL)transmitData:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ACCTransportIOAccessoryBase transmitData:].cold.1(v6);

  return 0;
}

- (unsigned)ioService
{
  return self->_ioService;
}

- (int)ioServiceClassType
{
  return self->_ioServiceClassType;
}

- (int)primaryPortNumber
{
  return self->_primaryPortNumber;
}

- (void)setPrimaryPortNumber:(int)a3
{
  self->_primaryPortNumber = a3;
}

- (unsigned)upstreamManagerService
{
  return self->_upstreamManagerService;
}

- (void)setUpstreamManagerService:(unsigned int)a3
{
  self->_upstreamManagerService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationPortQueue, 0);
}

- (void)initWithIOAccessoryClass:(int *)a1 ioService:(NSObject *)a2 .cold.1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21722C000, a2, OS_LOG_TYPE_ERROR, "Invalid Port Connected! _ioServiceClassType %d, unable to find primary port number (setting to kIOAccesoryPortInvalid)", (uint8_t *)v3, 8u);
}

- (void)transmitData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21722C000, log, OS_LOG_TYPE_ERROR, "THIS METHOD MUST BE OVERRIDDEN! (transmitData:)", v1, 2u);
}

@end
