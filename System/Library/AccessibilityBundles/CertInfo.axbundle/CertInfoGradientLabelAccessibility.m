@implementation CertInfoGradientLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CertInfoGradientLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return (id)-[CertInfoGradientLabelAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_text"));
}

@end
