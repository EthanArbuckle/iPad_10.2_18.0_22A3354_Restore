@implementation DynamicTypeLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.DynamicTypeLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
