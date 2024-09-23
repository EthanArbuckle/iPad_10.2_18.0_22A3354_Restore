@implementation DynamicTypeLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.DynamicTypeLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
