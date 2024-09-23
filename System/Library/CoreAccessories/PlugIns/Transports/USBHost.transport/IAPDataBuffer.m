@implementation IAPDataBuffer

- (IAPDataBuffer)initWithiAPInterface:(id)a3
{
  id v4;
  IAPDataBuffer *v5;
  IAPDataBuffer *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t v14[16];
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IAPDataBuffer;
  v5 = -[IAPDataBuffer init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_dataBufferInLen = 1024;
    v5->_dataBufferIn = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0xD90FDF98uLL);
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v9 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[IAPDataBuffer initWithiAPInterface:].cold.2((uint64_t *)&v6->_dataBufferInLen, v9, v10);

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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2171C1000, v11, OS_LOG_TYPE_DEFAULT, "hard-code dataBufferInLen to 1024, change to calculate similarly to old project", v14, 2u);
    }

    objc_storeWeak((id *)&v6->_parentiAPInterface, v4);
  }

  return v6;
}

- (void)dealloc
{
  char *dataBufferIn;
  objc_super v4;

  dataBufferIn = self->_dataBufferIn;
  if (dataBufferIn)
  {
    free(dataBufferIn);
    self->_dataBufferIn = 0;
  }
  self->_dataBufferInLen = 0;
  v4.receiver = self;
  v4.super_class = (Class)IAPDataBuffer;
  -[IAPDataBuffer dealloc](&v4, sel_dealloc);
}

- (AccessoryIAPInterface)parentiAPInterface
{
  return (AccessoryIAPInterface *)objc_loadWeakRetained((id *)&self->_parentiAPInterface);
}

- (void)setParentiAPInterface:(id)a3
{
  objc_storeWeak((id *)&self->_parentiAPInterface, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentiAPInterface);
}

- (void)initWithiAPInterface:(uint64_t)a3 .cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_9_0(&dword_2171C1000, a2, a3, "Setting bulk in reads to _dataBufferInLen = %zu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end
