@implementation FileInfoStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FileInfoStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
