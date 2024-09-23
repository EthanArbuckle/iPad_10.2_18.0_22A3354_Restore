@implementation HIDConnection

- (id)description
{
  return (id)(id)IOHIDEventSystemConnectionCopyDescription((time_t *)self);
}

- (void)dealloc
{
  objc_super v3;

  _IOHIDEventSystemConnectionReleasePrivate((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HIDConnection;
  -[HIDConnection dealloc](&v3, sel_dealloc);
}

@end
