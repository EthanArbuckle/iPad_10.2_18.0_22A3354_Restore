@implementation MLNeuralEngineComputeDevice

void __45__MLNeuralEngineComputeDevice_physicalDevice__block_invoke()
{
  MLNeuralEngineComputeDevice *v0;
  void *v1;

  if (objc_msgSend(get_ANEDeviceInfoClass(), "hasANE"))
  {
    v0 = -[MLNeuralEngineComputeDevice initWithTotalCoreCount:]([MLNeuralEngineComputeDevice alloc], "initWithTotalCoreCount:", objc_msgSend(get_ANEDeviceInfoClass(), "numANECores"));
    v1 = (void *)+[MLNeuralEngineComputeDevice physicalDevice]::computeDevice;
    +[MLNeuralEngineComputeDevice physicalDevice]::computeDevice = (uint64_t)v0;

  }
}

- (MLNeuralEngineComputeDevice)initWithTotalCoreCount:(int64_t)a3
{
  MLNeuralEngineComputeDevice *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLNeuralEngineComputeDevice;
  result = -[MLNeuralEngineComputeDevice init](&v5, sel_init);
  if (result)
    result->_totalCoreCount = a3;
  return result;
}

+ (id)physicalDevice
{
  if (+[MLNeuralEngineComputeDevice physicalDevice]::onceToken != -1)
    dispatch_once(&+[MLNeuralEngineComputeDevice physicalDevice]::onceToken, &__block_literal_global_4217);
  return (id)+[MLNeuralEngineComputeDevice physicalDevice]::computeDevice;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MLNeuralEngineComputeDevice: %p>"), self);
}

- (BOOL)isAccessible
{
  return 1;
}

- (NSInteger)totalCoreCount
{
  return self->_totalCoreCount;
}

@end
