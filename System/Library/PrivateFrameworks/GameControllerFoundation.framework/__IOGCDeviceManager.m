@implementation __IOGCDeviceManager

- (__IOGCDeviceManager)init
{
  -[__IOGCDeviceManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)__IOGCDeviceManager;
  -[__IOGCDeviceManager dealloc](&v2, sel_dealloc);
}

@end
