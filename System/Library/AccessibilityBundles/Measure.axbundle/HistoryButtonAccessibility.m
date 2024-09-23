@implementation HistoryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.HistoryButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("Measure.HistoryView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.HistoryButton"), CFSTR("showHistoryFrom:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("HISTORY_BUTTON"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HistoryButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HistoryButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)showHistoryFrom:(id)a3
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HistoryButtonAccessibility;
  -[HistoryButtonAccessibility showHistoryFrom:](&v4, sel_showHistoryFrom_, a3);
  v3 = MEMORY[0x234913CC4](CFSTR("Measure.HistoryView"));
  AXMeasureDidPotentiallyShowCardViewWithAncestorClass(v3);
}

@end
