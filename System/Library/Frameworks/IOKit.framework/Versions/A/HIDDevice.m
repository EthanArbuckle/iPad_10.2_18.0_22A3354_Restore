@implementation HIDDevice

- (void)dealloc
{
  objc_super v3;

  _IOHIDDeviceReleasePrivate((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HIDDevice;
  -[HIDDevice dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return IOHIDDeviceCopyDescription((io_object_t *)self);
}

@end
