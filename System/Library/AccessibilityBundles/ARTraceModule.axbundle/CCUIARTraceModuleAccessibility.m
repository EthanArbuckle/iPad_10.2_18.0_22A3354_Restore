@implementation CCUIARTraceModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIARTraceModule");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CCUIARTraceModule"), CFSTR("CCUIToggleModule"));
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("ar.trace.label"));
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return CFSTR("ar-trace");
}

@end
