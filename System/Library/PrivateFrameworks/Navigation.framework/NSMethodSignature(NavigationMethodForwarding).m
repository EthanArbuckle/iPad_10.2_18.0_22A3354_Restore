@implementation NSMethodSignature(NavigationMethodForwarding)

+ (id)_navigation_methodSignatureForEmptyMethod
{
  if (qword_1ED0C3E18 != -1)
    dispatch_once(&qword_1ED0C3E18, &__block_literal_global_0);
  return (id)_MergedGlobals_16;
}

@end
