@implementation DynamicTypeLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProductPageExtension.DynamicTypeLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
