@implementation NSObject(SwiftUIAccessibilityPrivate)

- (id)accessibilitySwiftUIDefaultActionStoredBlock
{
  return objc_getAssociatedObject(a1, sel_accessibilitySwiftUIDefaultActionStoredBlock);
}

- (void)setAccessibilitySwiftUIDefaultActionStoredBlock:()SwiftUIAccessibilityPrivate
{
  id v4;

  v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, sel_accessibilitySwiftUIDefaultActionStoredBlock, v4, (void *)0x303);

}

- (id)accessibilitySwiftUIStoredLinkRotor
{
  return objc_getAssociatedObject(a1, sel_accessibilitySwiftUIStoredLinkRotor);
}

- (void)setAccessibilitySwiftUIStoredLinkRotor:()SwiftUIAccessibilityPrivate
{
  objc_setAssociatedObject(a1, sel_accessibilitySwiftUIStoredLinkRotor, a3, (void *)0x301);
}

@end
