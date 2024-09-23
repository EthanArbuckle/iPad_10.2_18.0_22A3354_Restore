@implementation SBScreenshotManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBScreenshotManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
