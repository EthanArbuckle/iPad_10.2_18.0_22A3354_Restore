@implementation CAMOverlayServiceControlHelpers

- (CAMOverlayServiceControlHelpers)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[CAMOverlayServiceControlHelpers init](&v3, "init");
}

+ (id)interpretControl:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)sub_10000823C();

  return v4;
}

@end
