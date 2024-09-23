@implementation DynamicTypeTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.DynamicTypeTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
