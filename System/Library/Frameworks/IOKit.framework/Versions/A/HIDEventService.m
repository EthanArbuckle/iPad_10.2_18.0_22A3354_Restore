@implementation HIDEventService

- (id)description
{
  return (id)(id)IOHIDServiceCopyDescription((uint64_t)self);
}

- (void)dealloc
{
  objc_super v3;

  _IOHIDServiceReleasePrivate((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HIDEventService;
  -[HIDEventService dealloc](&v3, sel_dealloc);
}

@end
