@implementation UIPrintPanelWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPrintPanelWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
