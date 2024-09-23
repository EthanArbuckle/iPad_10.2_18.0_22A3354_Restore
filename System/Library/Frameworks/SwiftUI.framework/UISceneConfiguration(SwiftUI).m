@implementation UISceneConfiguration(SwiftUI)

- (id)sceneDelegate
{
  return objc_alloc_init((Class)objc_msgSend(a1, "delegateClass"));
}

@end
