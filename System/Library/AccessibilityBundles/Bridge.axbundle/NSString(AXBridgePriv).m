@implementation NSString(AXBridgePriv)

+ (id)_accessibilityLastDrawnString
{
  return objc_getAssociatedObject(a1, &kAXBridgeLastDrawnStringStorage);
}

+ (void)_accessibilitySetLastDrawnString:()AXBridgePriv
{
  id value;

  value = a3;
  _AXLogWithFacility();
  objc_setAssociatedObject(a1, &kAXBridgeLastDrawnStringStorage, value, (void *)0x303);

}

@end
