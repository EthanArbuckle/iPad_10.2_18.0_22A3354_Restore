@implementation AVOutputDeviceDiscoverySessionAvailableOutputDevices

- (NSArray)otherDevices
{
  NSArray *result;

  result = &self->_availableOutputDevices->_otherDevices->super;
  if (!result)
  {
    -[AVOutputDeviceDiscoverySessionAvailableOutputDevices _loadOutputDevices](self, "_loadOutputDevices");
    return &self->_availableOutputDevices->_otherDevices->super;
  }
  return result;
}

- (NSArray)recentlyUsedDevices
{
  NSArray *result;

  result = &self->_availableOutputDevices->_recentlyUsedDevices->super;
  if (!result)
  {
    -[AVOutputDeviceDiscoverySessionAvailableOutputDevices _loadOutputDevices](self, "_loadOutputDevices");
    return &self->_availableOutputDevices->_recentlyUsedDevices->super;
  }
  return result;
}

- (void)_loadOutputDevices
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(-[AVOutputDeviceDiscoverySessionAvailableOutputDevices impl](self, "impl"), "allDevices");
  self->_availableOutputDevices->_recentlyUsedDevices = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_availableOutputDevices->_otherDevices = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "frecencyScore");
        if (v9 <= 0.0)
          v10 = 24;
        else
          v10 = 16;
        objc_msgSend(*(id *)((char *)&self->_availableOutputDevices->super.isa + v10), "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  if (objc_msgSend(v3, "count"))
    -[NSMutableArray addObject:](self->_availableOutputDevices->_recentlyUsedDevices, "addObject:", +[AVOutputDevice sharedLocalDevice](AVOutputDevice, "sharedLocalDevice"));
  -[NSMutableArray sortUsingComparator:](self->_availableOutputDevices->_otherDevices, "sortUsingComparator:", &__block_literal_global_119);
}

- (id)impl
{
  return self->_availableOutputDevices->impl;
}

- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:(id)a3
{
  AVOutputDeviceDiscoverySessionAvailableOutputDevices *v4;
  AVOutputDeviceDiscoverySessionAvailableOutputDevicesInternal *v5;
  AVOutputDeviceDiscoverySessionAvailableOutputDevices *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceDiscoverySessionAvailableOutputDevices;
  v4 = -[AVOutputDeviceDiscoverySessionAvailableOutputDevices init](&v8, sel_init);
  if (v4
    && (v5 = objc_alloc_init(AVOutputDeviceDiscoverySessionAvailableOutputDevicesInternal),
        (v4->_availableOutputDevices = v5) != 0)
    && (v4->_availableOutputDevices->impl = (AVOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)a3) != 0)
  {
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  AVOutputDeviceDiscoverySessionAvailableOutputDevicesInternal *availableOutputDevices;
  objc_super v4;

  availableOutputDevices = self->_availableOutputDevices;
  if (availableOutputDevices)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVOutputDeviceDiscoverySessionAvailableOutputDevices;
  -[AVOutputDeviceDiscoverySessionAvailableOutputDevices dealloc](&v4, sel_dealloc);
}

- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)init
{
  AVEmptyOutputDeviceDiscoverySessionAvailableOutputDevices *v3;
  AVOutputDeviceDiscoverySessionAvailableOutputDevices *v4;

  v3 = objc_alloc_init(AVEmptyOutputDeviceDiscoverySessionAvailableOutputDevices);
  v4 = -[AVOutputDeviceDiscoverySessionAvailableOutputDevices initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:](self, "initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSArray isEqualToArray:](-[AVOutputDeviceDiscoverySessionAvailableOutputDevices recentlyUsedDevices](self, "recentlyUsedDevices"), "isEqualToArray:", objc_msgSend(a3, "recentlyUsedDevices"));
  return v5 & -[NSArray isEqualToArray:](-[AVOutputDeviceDiscoverySessionAvailableOutputDevices otherDevices](self, "otherDevices"), "isEqualToArray:", objc_msgSend(a3, "otherDevices"));
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](-[AVOutputDeviceDiscoverySessionAvailableOutputDevices recentlyUsedDevices](self, "recentlyUsedDevices"), "hash");
  return -[NSArray hash](-[AVOutputDeviceDiscoverySessionAvailableOutputDevices otherDevices](self, "otherDevices"), "hash") ^ v3;
}

uint64_t __74__AVOutputDeviceDiscoverySessionAvailableOutputDevices__loadOutputDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "localizedStandardCompare:", objc_msgSend(a3, "name"));
}

+ (AVOutputDeviceDiscoverySessionAvailableOutputDevices)outputDeviceDiscoverySessionAvailableOutputDevicesWithAvailableFigEndpoints:(id)a3
{
  AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *v3;
  AVOutputDeviceDiscoverySessionAvailableOutputDevices *v4;

  v3 = -[AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl initWithAvailableFigEndpoints:]([AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl alloc], "initWithAvailableFigEndpoints:", a3);
  v4 = -[AVOutputDeviceDiscoverySessionAvailableOutputDevices initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:]([AVOutputDeviceDiscoverySessionAvailableOutputDevices alloc], "initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:", v3);

  return v4;
}

@end
