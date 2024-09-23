@implementation FootnoteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.FootnoteView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.FootnoteView"), CFSTR("accessibilityTextLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[FootnoteViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTextLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FootnoteViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[FootnoteViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
