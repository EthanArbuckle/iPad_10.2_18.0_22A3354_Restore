@implementation WFWorkflowWizardNameIconButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFWorkflowWizardNameIconButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("icon.picker"));
}

@end
