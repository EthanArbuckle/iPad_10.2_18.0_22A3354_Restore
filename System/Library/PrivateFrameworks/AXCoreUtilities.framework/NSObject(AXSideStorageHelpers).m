@implementation NSObject(AXSideStorageHelpers)

- (uint64_t)_axIsWrappedPointer
{
  return __UIAccessibilityGetAssociatedBool(a1, &__NSObject___axIsWrappedPointer);
}

- (void)_axSetIsWrappedPointer:()AXSideStorageHelpers
{
  __UIAccessibilitySetAssociatedBool(a1, &__NSObject___axIsWrappedPointer, a3);
}

@end
