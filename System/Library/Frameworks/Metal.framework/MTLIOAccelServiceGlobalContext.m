@implementation MTLIOAccelServiceGlobalContext

- (MTLIOAccelServiceGlobalContext)init
{
  MTLIOAccelServiceGlobalContext *v2;
  uint64_t v3;
  mach_port_t v4;
  const __CFDictionary *v5;
  uint64_t MatchingServices;
  uint64_t v8;
  uint64_t v9;
  void *MetalPluginClassForService;
  MTLIOAccelServiceDescriptor *v11;
  io_iterator_t existing;
  mach_port_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTLIOAccelServiceGlobalContext;
  v2 = -[MTLIOAccelServiceGlobalContext init](&v14, sel_init);
  if (v2)
  {
    v13 = 0;
    v3 = MEMORY[0x186DABB84](*MEMORY[0x1E0C81720], &v13);
    if ((_DWORD)v3)
    {
      NSLog(CFSTR("%s: IOMainPort failed %x"), "-[MTLIOAccelServiceGlobalContext init]", v3);
      return 0;
    }
    existing = 0;
    v4 = v13;
    v5 = IOServiceMatching("IOAcceleratorES");
    MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
    if ((_DWORD)MatchingServices)
    {
      NSLog(CFSTR("%s: IOServiceGetMatchingServices failed %x"), "-[MTLIOAccelServiceGlobalContext init]", MatchingServices);
      return 0;
    }
    v2->_pendingCreateAccelServiceRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = IOIteratorNext(existing);
    if ((_DWORD)v8)
    {
      v9 = v8;
      do
      {
        MetalPluginClassForService = getMetalPluginClassForService(v9);
        if (MetalPluginClassForService)
        {
          v11 = -[MTLIOAccelServiceDescriptor initWithAcceleratorPort:deviceClass:]([MTLIOAccelServiceDescriptor alloc], "initWithAcceleratorPort:deviceClass:", v9, MetalPluginClassForService);
          -[NSMutableArray addObject:](v2->_pendingCreateAccelServiceRequests, "addObject:", v11);

        }
        IOObjectRelease(v9);
        v9 = IOIteratorNext(existing);
      }
      while ((_DWORD)v9);
    }
    IOObjectRelease(existing);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelServiceGlobalContext;
  -[MTLIOAccelServiceGlobalContext dealloc](&v3, sel_dealloc);
}

- (void)processPendingCreateIOAccelServiceRequests
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = -[NSMutableArray count](self->_pendingCreateAccelServiceRequests, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      v6 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_pendingCreateAccelServiceRequests, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "deviceClass")), "initWithAcceleratorPort:", objc_msgSend(v6, "acceleratorPort"));
      if (v7)
      {
        v15 = v7;
        MTLAddDevice(v7, v8, v9, v10, v11, v12, v13, v14);

      }
    }
  }

  self->_pendingCreateAccelServiceRequests = 0;
}

@end
