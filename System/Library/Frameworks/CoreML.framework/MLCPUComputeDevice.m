@implementation MLCPUComputeDevice

+ (id)physicalDevice
{
  if (physicalDevice_onceToken != -1)
    dispatch_once(&physicalDevice_onceToken, &__block_literal_global_8105);
  return (id)physicalDevice_cpuDevice;
}

void __36__MLCPUComputeDevice_physicalDevice__block_invoke()
{
  MLCPUComputeDevice *v0;
  void *v1;

  v0 = objc_alloc_init(MLCPUComputeDevice);
  v1 = (void *)physicalDevice_cpuDevice;
  physicalDevice_cpuDevice = (uint64_t)v0;

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MLCPUComputeDevice: %p>"), self);
}

@end
