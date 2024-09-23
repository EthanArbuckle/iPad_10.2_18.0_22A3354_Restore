@implementation __IOGCFastPathClient

- (void)dealloc
{
  IOGCFastPathClientInterface **clientInterface;
  IOCFPlugInInterface **pluginInterface;
  io_object_t service;
  __CFAllocator *allocator;
  objc_super v7;

  clientInterface = self->clientInterface;
  if (clientInterface)
  {
    ((void (*)(IOGCFastPathClientInterface **, SEL))(*clientInterface)->var3)(clientInterface, a2);
    self->clientInterface = 0;
  }
  pluginInterface = self->pluginInterface;
  if (pluginInterface)
  {
    IODestroyPlugInInterface(pluginInterface);
    self->pluginInterface = 0;
  }
  service = self->service;
  if (service)
  {
    IOObjectRelease(service);
    self->service = 0;
  }
  allocator = self->allocator;
  if (allocator)
  {
    objc_destructInstance(self);
    CFAllocatorDeallocate(allocator, self);
    CFRelease(allocator);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)__IOGCFastPathClient;
    -[__IOGCFastPathClient dealloc](&v7, sel_dealloc);
  }
}

- (id)description
{
  IOGCFastPathClientInterface **clientInterface;
  uint64_t (*var7)(IOGCFastPathClientInterface **, SEL);

  clientInterface = self->clientInterface;
  if (clientInterface
    && *clientInterface
    && (var7 = (uint64_t (*)(IOGCFastPathClientInterface **, SEL))(*clientInterface)->var7) != 0)
  {
    return (id)var7(self->clientInterface, a2);
  }
  else
  {
    return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("IOGCFastPathClient %#010llx"), self->providerID);
  }
}

@end
