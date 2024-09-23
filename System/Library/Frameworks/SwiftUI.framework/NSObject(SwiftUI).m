@implementation NSObject(SwiftUI)

+ (uint64_t)_isFromSwiftUI
{
  return 0;
}

- (void)_performSelector:()SwiftUI withObject:
{
  id v5;

  if (a4)
  {
    v5 = a4;
    ((void (*)(id, uint64_t))objc_msgSend(v5, "methodForSelector:", a3))(v5, a3);

  }
}

@end
