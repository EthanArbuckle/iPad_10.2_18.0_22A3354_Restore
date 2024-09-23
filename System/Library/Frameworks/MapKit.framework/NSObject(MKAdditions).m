@implementation NSObject(MKAdditions)

+ (BOOL)_mapkit_instanceImplementationOfSelector:()MKAdditions isFromSubclassOfClass:
{
  uint64_t v6;

  v6 = objc_msgSend(a1, "instanceMethodForSelector:");
  return v6 != objc_msgSend(a4, "instanceMethodForSelector:", a3);
}

- (BOOL)_mapkit_implementationOfSelector:()MKAdditions isFromSubclassOfClass:
{
  uint64_t v6;

  v6 = objc_msgSend(a1, "methodForSelector:");
  return v6 != objc_msgSend(a4, "instanceMethodForSelector:", a3);
}

@end
