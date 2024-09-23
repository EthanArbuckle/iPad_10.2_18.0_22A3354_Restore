@implementation HIDSession

- (void)dealloc
{
  objc_super v3;

  _IOHIDSessionReleasePrivate((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HIDSession;
  -[HIDSession dealloc](&v3, sel_dealloc);
}

@end
