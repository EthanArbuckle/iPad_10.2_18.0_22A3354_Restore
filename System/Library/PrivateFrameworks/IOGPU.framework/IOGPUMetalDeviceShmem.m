@implementation IOGPUMetalDeviceShmem

- (IOGPUMetalDeviceShmem)initWithDevice:(id)a3 shmemSize:(unsigned int)a4 shmemType:(int)a5
{
  IOGPUMetalDeviceShmem *v9;
  IOGPUMetalDeviceShmem *v10;
  objc_super v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:].cold.6();
  v12.receiver = self;
  v12.super_class = (Class)IOGPUMetalDeviceShmem;
  v9 = -[IOGPUMetalDeviceShmem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!a4)
      -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:].cold.1();
    v9->_device = (IOGPUMetalDevice *)a3;
    if (IOGPUDeviceCreateDeviceShmem(objc_msgSend(a3, "deviceRef"), a4, a5, &v9->_virtualAddress, &v9->_shmemSize, &v9->_shmemID))-[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:].cold.5();
    v10->_priv.trim_level = 0;
    if (!v10->_virtualAddress)
      -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:].cold.2();
    if (!-[IOGPUMetalDeviceShmem shmemSize](v10, "shmemSize"))
      -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:].cold.3();
    if (!-[IOGPUMetalDeviceShmem shmemID](v10, "shmemID"))
      -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:].cold.4();
  }
  return v10;
}

- (unsigned)shmemSize
{
  return self->_shmemSize;
}

- (unsigned)shmemID
{
  return self->_shmemID;
}

- (void)dealloc
{
  __assert_rtn("-[IOGPUMetalDeviceShmem dealloc]", "IOGPUMetalDeviceShmem.m", 71, "0 && \"Failed to deallocate IOGPUDeviceShmem.\");
}

- (void)virtualAddress
{
  return self->_virtualAddress;
}

- (void)initWithDevice:shmemSize:shmemType:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]", "IOGPUMetalDeviceShmem.m", 29, "shmemSize");
}

- (void)initWithDevice:shmemSize:shmemType:.cold.2()
{
  __assert_rtn("-[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]", "IOGPUMetalDeviceShmem.m", 57, "NULL != _virtualAddress");
}

- (void)initWithDevice:shmemSize:shmemType:.cold.3()
{
  __assert_rtn("-[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]", "IOGPUMetalDeviceShmem.m", 58, "[self shmemSize]");
}

- (void)initWithDevice:shmemSize:shmemType:.cold.4()
{
  __assert_rtn("-[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]", "IOGPUMetalDeviceShmem.m", 59, "[self shmemID]");
}

- (void)initWithDevice:shmemSize:shmemType:.cold.5()
{
  __assert_rtn("-[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]", "IOGPUMetalDeviceShmem.m", 43, "0 && \"Failed to allocate IOGPUDeviceShmem.\");
}

- (void)initWithDevice:shmemSize:shmemType:.cold.6()
{
  __assert_rtn("-[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]", "IOGPUMetalDeviceShmem.m", 25, "[device isKindOfClass:[IOGPUMetalDevice class]]");
}

@end
