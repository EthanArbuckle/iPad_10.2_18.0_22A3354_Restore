@implementation ARSharedGPUDevice

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_114);
  return (id)sharedInstance_sharedInstance;
}

void __35__ARSharedGPUDevice_sharedInstance__block_invoke()
{
  ARSharedGPUDevice *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(ARSharedGPUDevice);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

  v2 = MTLCreateSystemDefaultDevice();
  objc_msgSend((id)sharedInstance_sharedInstance, "setDevice:", v2);

}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
