@implementation AFKMemoryDescriptorManager

+ (id)withService:(unsigned int)a3
{
  return -[AFKMemoryDescriptorManager initWithService:]([AFKMemoryDescriptorManager alloc], "initWithService:", *(_QWORD *)&a3);
}

- (AFKMemoryDescriptorManager)initWithService:(unsigned int)a3
{
  AFKMemoryDescriptorManager *v4;
  AFKMemoryDescriptorManager *v5;
  NSObject *v6;
  objc_super v8;
  uint32_t outputCnt;
  _BYTE v10[32];
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  outputCnt = 1;
  v8.receiver = self;
  v8.super_class = (Class)AFKMemoryDescriptorManager;
  v4 = -[AFKMemoryDescriptorManager init](&v8, sel_init);
  if (!v4 || IOObjectRetain(a3))
    goto LABEL_16;
  v4->_service = a3;
  if (IOServiceOpen(a3, *MEMORY[0x1E0C83DA0], 0x6D646D72u, &v4->_connect))
  {
    _AFKUserLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[AFKMemoryDescriptorManager regID](v4, "regID");
      -[AFKMemoryDescriptorManager initWithService:].cold.3();
    }
    goto LABEL_15;
  }
  if (IOConnectCallScalarMethod(v4->_connect, 9u, 0, 0, output, &outputCnt))
  {
    _AFKUserLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[AFKMemoryDescriptorManager regID](v4, "regID");
      -[AFKMemoryDescriptorManager initWithService:].cold.2();
    }
    goto LABEL_15;
  }
  if (outputCnt != 1)
  {
    _AFKUserLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AFKMemoryDescriptorManager initWithService:].cold.1((uint64_t)&outputCnt, (uint64_t)v10, -[AFKMemoryDescriptorManager regID](v4, "regID"));
LABEL_15:

LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  v4->_regID = output[0];
  v5 = v4;
LABEL_17:

  return v5;
}

- (void)dealloc
{
  io_connect_t connect;
  io_object_t service;
  objc_super v5;

  connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_connect = 0;
  }
  service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_service = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AFKMemoryDescriptorManager;
  -[AFKMemoryDescriptorManager dealloc](&v5, sel_dealloc);
}

- (unint64_t)regID
{
  return self->_regID;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)initWithService:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_3(3.8521e-34, a1, a2, a3);
  OUTLINED_FUNCTION_1(&dword_1D3221000, "0x%llx: kGetIDMethod outputCount %u", v3, v4);
}

- (void)initWithService:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1D3221000, "0x%llx: kGetIDMethod:0x%x", v3, v4);
}

- (void)initWithService:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1D3221000, "0x%llx: IOServiceOpen:0x%x", v3, v4);
}

@end
