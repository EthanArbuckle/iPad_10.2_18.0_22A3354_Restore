@implementation CCUIControlTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIControlTemplateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIControlTemplateView"), CFSTR("title"), ");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIControlTemplateView"), CFSTR("subtitle"), ");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIControlTemplateView"), CFSTR("isExpanded"), "B", 0);

}

- (id)accessibilityLabel
{
  return (id)-[CCUIControlTemplateViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
}

- (id)accessibilityValue
{
  return (id)-[CCUIControlTemplateViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("subtitle"));
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("control.expand.module"));
}

- (BOOL)isAccessibilityElement
{
  return -[CCUIControlTemplateViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) ^ 1;
}

@end
