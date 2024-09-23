@implementation SiriUISnippetControllerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUISnippetControllerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityShouldBeScannedIfAncestorCanScroll
{
  return 1;
}

@end
