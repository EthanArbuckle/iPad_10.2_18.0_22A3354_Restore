@implementation UIPrinterTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPrinterTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrinterTableViewCell"), CFSTR("checked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrinterTableViewCell"), CFSTR("printerState"), "i", 0);

}

- (id)accessibilityValue
{
  void *v2;

  if (-[UIPrinterTableViewCellAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("printerState"))- 1 > 3)
  {
    v2 = 0;
  }
  else
  {
    UIKitAccessibilityLocalizedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPrinterTableViewCellAccessibility;
  v3 = -[UIPrinterTableViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[UIPrinterTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("checked"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
