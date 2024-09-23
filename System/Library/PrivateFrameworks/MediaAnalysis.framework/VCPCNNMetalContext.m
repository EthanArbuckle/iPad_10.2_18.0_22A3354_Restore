@implementation VCPCNNMetalContext

+ (BOOL)supportGPU
{
  return SocType() - 247 < 0xA;
}

+ (BOOL)supportVectorForward
{
  return SocType() - 246 < 0xB;
}

+ (id)sharedCommandQueue
{
  void *v2;
  void *v3;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("MTLCommandQueue"), &__block_literal_global_86);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __40__VCPCNNMetalContext_sharedCommandQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = MTLCreateSystemDefaultDevice();
  v1 = (void *)objc_msgSend(v0, "newCommandQueue");

  return v1;
}

- (id)initNewContext:(BOOL)a3
{
  _BOOL4 v3;
  VCPCNNMetalContext *v4;
  uint64_t v5;
  MTLCommandQueue *commandQueue;
  uint64_t v7;
  MTLDevice *device;
  MTLCommandQueue *v9;
  uint64_t v10;
  MTLCommandBuffer *commandBuffer;
  MTLDevice *v12;
  MTLDevice *v13;
  uint64_t v14;
  MTLCommandQueue *v15;
  uint64_t v16;
  void *v17;
  id v18;
  objc_super v20;

  v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VCPCNNMetalContext;
  v4 = -[VCPCNNMetalContext init](&v20, sel_init);
  if (v4 && SocType() != 246)
  {
    if (v3)
    {
      objc_msgSend((id)objc_opt_class(), "sharedCommandQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      commandQueue = v4->_commandQueue;
      v4->_commandQueue = (MTLCommandQueue *)v5;

      -[MTLCommandQueue device](v4->_commandQueue, "device");
      v7 = objc_claimAutoreleasedReturnValue();
      device = v4->_device;
      v4->_device = (MTLDevice *)v7;

      v9 = v4->_commandQueue;
      objc_sync_enter(v9);
      -[MTLCommandQueue commandBuffer](v4->_commandQueue, "commandBuffer");
      v10 = objc_claimAutoreleasedReturnValue();
      commandBuffer = v4->_commandBuffer;
      v4->_commandBuffer = (MTLCommandBuffer *)v10;

      objc_sync_exit(v9);
    }
    else
    {
      v12 = (MTLDevice *)MTLCreateSystemDefaultDevice();
      v13 = v4->_device;
      v4->_device = v12;

      v14 = -[MTLDevice newCommandQueue](v4->_device, "newCommandQueue");
      v15 = v4->_commandQueue;
      v4->_commandQueue = (MTLCommandQueue *)v14;

      -[MTLCommandQueue commandBuffer](v4->_commandQueue, "commandBuffer");
      v16 = objc_claimAutoreleasedReturnValue();
      v9 = v4->_commandBuffer;
      v4->_commandBuffer = (MTLCommandBuffer *)v16;
    }

    if (v4->_commandBuffer)
      MEMORY[0x1BCCA0AD0](0.0);
  }
  v17 = v4->_device;
  if (v17)
  {
    v17 = v4->_commandQueue;
    if (v17)
    {
      if (v4->_commandBuffer)
        v17 = v4;
      else
        v17 = 0;
    }
  }
  v18 = v17;

  return v18;
}

- (int)execute
{
  MTLCommandQueue *v3;
  MTLCommandBuffer *v4;
  MTLCommandBuffer *commandBuffer;

  -[MTLCommandBuffer commit](self->_commandBuffer, "commit");
  -[MTLCommandBuffer waitUntilCompleted](self->_commandBuffer, "waitUntilCompleted");
  v3 = self->_commandQueue;
  objc_sync_enter(v3);
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v4 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = v4;

  if (self->_commandBuffer)
    MEMORY[0x1BCCA0AD0](0.0);
  objc_sync_exit(v3);

  if (self->_commandBuffer)
    return 0;
  else
    return -108;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCommandQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MTLCommandBuffer)commandBuffer
{
  return (MTLCommandBuffer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCommandBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
