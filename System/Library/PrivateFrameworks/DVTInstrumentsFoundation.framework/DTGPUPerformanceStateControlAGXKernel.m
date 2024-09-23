@implementation DTGPUPerformanceStateControlAGXKernel

- (DTGPUPerformanceStateControlAGXKernel)initWithDevice:(id)a3
{
  id v4;
  DTGPUPerformanceStateControlAGXKernel *v5;
  DTGPUPerformanceStateControlAGXKernel *v6;
  io_service_t v7;
  DTGPUPerformanceStateControlAGXKernel *v8;
  mach_port_t connection;
  BOOL v11;
  uint64_t v12;
  objc_super v13;
  size_t outputStructCnt;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTGPUPerformanceStateControlAGXKernel;
  v5 = -[DTGPUPerformanceStateControlAGXKernel init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = -[DTGPUPerformanceStateControlAGXKernel getIOAccelerator](v5, "getIOAccelerator");
    if (!IOServiceOpen(v7, *MEMORY[0x24BDAEC58], 1u, &v6->_connection))
    {
      v12 = 258;
      connection = v6->_connection;
      if (!connection
        || ((outputStructCnt = 8, !IOConnectCallStructMethod(connection, 0x41u, &v12, 8uLL, &v12, &outputStructCnt))
          ? (v11 = outputStructCnt == 8)
          : (v11 = 0),
            !v11))
      {
        -[DTGPUPerformanceStateControlAGXKernel close](v6, "close", v12);
        v8 = 0;
        goto LABEL_4;
      }
      v6->_acceleratorId = objc_msgSend(v4, "registryID", v12);
    }
  }
  v8 = v6;
LABEL_4:

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[DTGPUPerformanceStateControlAGXKernel close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)DTGPUPerformanceStateControlAGXKernel;
  -[DTGPUPerformanceStateControlAGXKernel dealloc](&v3, sel_dealloc);
}

- (void)close
{
  id v3;
  io_connect_t connection;

  if (self->_holdingLock)
    v3 = -[DTGPUPerformanceStateControlAGXKernel disable](self, "disable");
  connection = self->_connection;
  if (connection)
    IOServiceClose(connection);
  self->_connection = 0;
}

- (unsigned)getIOAccelerator
{
  mach_port_t v2;
  const __CFDictionary *v3;
  unsigned int result;
  const __CFDictionary *v5;

  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceMatching("IOAccelerator");
  result = IOServiceGetMatchingService(v2, v3);
  if (!result)
  {
    v5 = IOServiceMatching("IOAcceleratorES");
    return IOServiceGetMatchingService(v2, v5);
  }
  return result;
}

- (id)currentState
{
  void *v3;
  mach_port_t connection;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  mach_port_t v10;
  void *v11;
  id v12;
  uint64_t outputStruct;
  size_t outputStructCnt;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  if (!self->_connection)
    return &unk_24EB4ED90;
  v3 = (void *)objc_opt_new();
  outputStruct = 258;
  connection = self->_connection;
  if (connection
    && (outputStructCnt = 8,
        !IOConnectCallStructMethod(connection, 0x41u, &outputStruct, 8uLL, &outputStruct, &outputStructCnt))
    && outputStructCnt == 8)
  {
    v16[0] = CFSTR("accelerator-id");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_acceleratorId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    v17[1] = MEMORY[0x24BDBD1C8];
    v16[1] = CFSTR("available");
    v16[2] = CFSTR("enabled");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", BYTE2(outputStruct) == 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v6;
    v16[3] = CFSTR("sustained");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", BYTE3(outputStruct) == 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v7;
    v16[4] = CFSTR("level");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", BYTE4(outputStruct));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v9);

    outputStruct = 259;
    v10 = self->_connection;
    if (v10
      && (outputStructCnt = 8,
          !IOConnectCallStructMethod(v10, 0x41u, &outputStruct, 8uLL, &outputStruct, &outputStructCnt))
      && outputStructCnt == 8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (BYTE1(outputStruct) << 24) | (BYTE2(outputStruct) << 16) | (BYTE3(outputStruct) << 8));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mapping"));

      v12 = v3;
    }
    else
    {
      v12 = &unk_24EB4EDE0;
    }
  }
  else
  {
    v12 = &unk_24EB4EDB8;
  }

  return v12;
}

- (BOOL)enable:(unint64_t)a3
{
  unsigned int connection;
  char v5;
  BOOL v6;
  BOOL v7;
  uint64_t v9;
  size_t outputStructCnt;

  connection = self->_connection;
  if (connection)
  {
    v5 = a3;
    v9 = 256;
    outputStructCnt = 8;
    if (IOConnectCallStructMethod(connection, 0x41u, &v9, 8uLL, &v9, &outputStructCnt))
      v6 = 0;
    else
      v6 = outputStructCnt == 8;
    if (v6)
    {
      v9 = 1;
      BYTE1(v9) = v5;
      connection = self->_connection;
      if (connection)
      {
        outputStructCnt = 8;
        if (IOConnectCallStructMethod(connection, 0x41u, &v9, 8uLL, &v9, &outputStructCnt))
          v7 = 0;
        else
          v7 = outputStructCnt == 8;
        LOBYTE(connection) = v7;
      }
    }
    else
    {
      LOBYTE(connection) = 0;
      self->_holdingLock = 1;
    }
  }
  return connection;
}

- (id)disable
{
  void *v3;
  mach_port_t connection;
  uint64_t v6;
  size_t outputStructCnt;

  -[DTGPUPerformanceStateControlAGXKernel currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  if (connection)
  {
    if (self->_holdingLock)
    {
      v6 = 0;
      outputStructCnt = 8;
      if (IOConnectCallStructMethod(connection, 0x41u, &v6, 8uLL, &v6, &outputStructCnt) || outputStructCnt != 8)
        self->_holdingLock = 0;
    }
  }
  return v3;
}

@end
