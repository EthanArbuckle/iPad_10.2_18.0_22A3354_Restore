@implementation SUCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
