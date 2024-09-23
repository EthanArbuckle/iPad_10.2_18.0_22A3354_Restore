@implementation MarmosetUITextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
