@implementation AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl

- (NSArray)allDevices
{
  NSArray *v3;
  NSArray *routeDescriptors;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  routeDescriptors = self->_routeDescriptors;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](routeDescriptors, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(routeDescriptors);
        -[NSArray addObject:](v3, "addObject:", +[AVOutputDevice outputDeviceWithRouteDescriptor:routeDiscoverer:](AVOutputDevice, "outputDeviceWithRouteDescriptor:routeDiscoverer:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), self->_routeDiscoverer));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](routeDescriptors, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)initWithRouteDescriptors:(id)a3 routeDiscoverer:(OpaqueFigRouteDiscoverer *)a4
{
  AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *v6;
  uint64_t v7;
  OpaqueFigRouteDiscoverer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl;
  v6 = -[AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl init](&v10, sel_init);
  if (!v6)
    goto LABEL_8;
  v7 = objc_msgSend(a3, "copy");
  v6->_routeDescriptors = (NSArray *)v7;
  if (!v7)
    goto LABEL_8;
  if (!a4)
  {
    v6->_routeDiscoverer = 0;
    goto LABEL_7;
  }
  v8 = (OpaqueFigRouteDiscoverer *)CFRetain(a4);
  v6->_routeDiscoverer = v8;
  if (!v8)
  {
LABEL_8:
    a4 = 0;
    goto LABEL_7;
  }
  a4 = v6;
LABEL_7:

  return (AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)a4;
}

- (void)dealloc
{
  OpaqueFigRouteDiscoverer *routeDiscoverer;
  objc_super v4;

  routeDiscoverer = self->_routeDiscoverer;
  if (routeDiscoverer)
    CFRelease(routeDiscoverer);
  v4.receiver = self;
  v4.super_class = (Class)AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl;
  -[AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl dealloc](&v4, sel_dealloc);
}

- (AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_initWithRouteDescriptors_routeDiscoverer_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

@end
