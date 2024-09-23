@implementation SBHAddWidgetSheetIconListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHAddWidgetSheetIconListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBHAddWidgetSheetIconListCell"), CFSTR("textLabel"), ");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetSheetIconListCellAccessibility;
  -[SBHAddWidgetSheetIconListCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBHAddWidgetSheetIconListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

@end
