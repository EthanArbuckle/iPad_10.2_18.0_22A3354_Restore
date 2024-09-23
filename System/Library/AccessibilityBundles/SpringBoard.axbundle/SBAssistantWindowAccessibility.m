@implementation SBAssistantWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAssistantWindow");
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
