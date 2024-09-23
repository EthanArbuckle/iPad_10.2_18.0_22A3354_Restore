@implementation NSObject(FCSwizzle)

+ (void)replaceClassSelector:()FCSwizzle withSelector:
{
  FCSwizzleClassMethods(a1, a3, a4);
}

+ (void)replaceInstanceSelector:()FCSwizzle withSelector:
{
  FCSwizzleInstanceMethods(a1, a3, a4);
}

@end
