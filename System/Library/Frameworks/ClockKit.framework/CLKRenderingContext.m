@implementation CLKRenderingContext

+ (id)sharedRenderingContext
{
  if (sharedRenderingContext_onceToken != -1)
    dispatch_once(&sharedRenderingContext_onceToken, &__block_literal_global_18);
  return (id)sharedRenderingContext_sharedRenderingContext;
}

- (CLKDevice)device
{
  CLKDevice *device;

  device = self->_device;
  if (device)
    return device;
  +[CLKDevice currentDevice](CLKDevice, "currentDevice");
  return (CLKDevice *)(id)objc_claimAutoreleasedReturnValue();
}

void __45__CLKRenderingContext_sharedRenderingContext__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CLKRenderingContext _init]([CLKRenderingContext alloc], "_init");
  v1 = (void *)sharedRenderingContext_sharedRenderingContext;
  sharedRenderingContext_sharedRenderingContext = (uint64_t)v0;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKRenderingContext;
  return -[CLKRenderingContext init](&v3, sel_init);
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
