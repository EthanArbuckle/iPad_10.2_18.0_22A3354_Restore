@implementation PRPosterWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRPosterWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  return 1;
}

@end
