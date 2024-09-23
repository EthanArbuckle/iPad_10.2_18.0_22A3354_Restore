@implementation HIDServiceClient

- (void)dealloc
{
  objc_super v3;

  _IOHIDServiceClientReleasePrivate(self);
  v3.receiver = self;
  v3.super_class = (Class)HIDServiceClient;
  -[HIDServiceClient dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return IOHIDServiceClientCopyDescription((uint64_t)self);
}

@end
