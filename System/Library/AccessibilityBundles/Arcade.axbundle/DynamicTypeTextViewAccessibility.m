@implementation DynamicTypeTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.DynamicTypeTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
