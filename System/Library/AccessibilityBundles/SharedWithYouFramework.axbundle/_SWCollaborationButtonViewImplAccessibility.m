@implementation _SWCollaborationButtonViewImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SWCollaborationButtonViewImpl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("collaboration.button.view.label"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SWCollaborationButtonViewImplAccessibility;
  return *MEMORY[0x24BDF73B0] | -[_SWCollaborationButtonViewImplAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
