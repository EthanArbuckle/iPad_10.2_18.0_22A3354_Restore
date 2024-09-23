@implementation MTLCaptureManager

- (BOOL)supportsDestination:(MTLCaptureDestination)destination
{
  return 0;
}

+ (MTLCaptureManager)sharedCaptureManager
{
  if (sharedCaptureManager_onceToken != -1)
    dispatch_once(&sharedCaptureManager_onceToken, &__block_literal_global_10);
  return (MTLCaptureManager *)sharedCaptureManager_sharedCaptureManager;
}

id __41__MTLCaptureManager_sharedCaptureManager__block_invoke()
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  sharedCaptureManager_sharedCaptureManager = (uint64_t)result;
  return result;
}

- (id)newCaptureScopeWithCommandQueue:(id)commandQueue
{
  return -[MTLCaptureScope initWithDevice:commandQueue:]([MTLCaptureScope alloc], "initWithDevice:commandQueue:", objc_msgSend(commandQueue, "device"), commandQueue);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCaptureManager;
  -[MTLCaptureManager dealloc](&v3, sel_dealloc);
}

- (id)newCaptureScopeWithDevice:(id)device
{
  return -[MTLCaptureScope initWithDevice:commandQueue:]([MTLCaptureScope alloc], "initWithDevice:commandQueue:", device, 0);
}

- (BOOL)startCaptureWithDescriptor:(MTLCaptureDescriptor *)descriptor error:(NSError *)error
{
  if (error)
    *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithMTLCaptureErrorCode:", 1);
  return 0;
}

- (void)startCaptureWithDevice:(id)device
{
  MTLCaptureDescriptor *v5;

  v5 = objc_alloc_init(MTLCaptureDescriptor);
  -[MTLCaptureDescriptor setCaptureObject:](v5, "setCaptureObject:", device);
  -[MTLCaptureDescriptor setDestination:](v5, "setDestination:", 1);
  -[MTLCaptureManager startCaptureWithDescriptor:error:](self, "startCaptureWithDescriptor:error:", v5, 0);

}

- (void)startCaptureWithCommandQueue:(id)commandQueue
{
  MTLCaptureDescriptor *v5;

  v5 = objc_alloc_init(MTLCaptureDescriptor);
  -[MTLCaptureDescriptor setCaptureObject:](v5, "setCaptureObject:", commandQueue);
  -[MTLCaptureDescriptor setDestination:](v5, "setDestination:", 1);
  -[MTLCaptureManager startCaptureWithDescriptor:error:](self, "startCaptureWithDescriptor:error:", v5, 0);

}

- (void)startCaptureWithScope:(id)captureScope
{
  MTLCaptureDescriptor *v5;

  v5 = objc_alloc_init(MTLCaptureDescriptor);
  -[MTLCaptureDescriptor setCaptureObject:](v5, "setCaptureObject:", captureScope);
  -[MTLCaptureDescriptor setDestination:](v5, "setDestination:", 1);
  -[MTLCaptureManager startCaptureWithDescriptor:error:](self, "startCaptureWithDescriptor:error:", v5, 0);

}

- (BOOL)isCapturing
{
  return self->_isCapturing;
}

- (id)defaultCaptureScope
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDefaultCaptureScope:(id)defaultCaptureScope
{
  objc_setProperty_atomic(self, a2, defaultCaptureScope, 16);
}

@end
