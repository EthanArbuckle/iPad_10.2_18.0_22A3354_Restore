@implementation AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl

- (AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)init
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
  v6 = NSStringFromSelector(sel_initWithAvailableFigEndpoints_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)initWithAvailableFigEndpoints:(id)a3
{
  AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl;
  v4 = -[AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl init](&v6, sel_init);
  if (v4)
    v4->_figEndpoints = (NSArray *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl;
  -[AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl dealloc](&v3, sel_dealloc);
}

- (NSArray)allDevices
{
  NSArray *v3;
  unint64_t v4;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[NSArray count](self->_figEndpoints, "count"))
  {
    v4 = 0;
    do
      -[NSArray addObject:](v3, "addObject:", +[AVOutputDevice outputDeviceWithFigEndpoint:](AVOutputDevice, "outputDeviceWithFigEndpoint:", -[NSArray objectAtIndex:](self->_figEndpoints, "objectAtIndex:", v4++)));
    while (-[NSArray count](self->_figEndpoints, "count") > v4);
  }
  return v3;
}

@end
