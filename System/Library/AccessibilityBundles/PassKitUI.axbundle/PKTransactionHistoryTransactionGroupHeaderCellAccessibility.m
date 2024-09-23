@implementation PKTransactionHistoryTransactionGroupHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKTransactionHistoryTransactionGroupHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKTransactionHistoryTransactionGroupHeaderCell"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKTransactionHistoryTransactionGroupHeaderCell"), CFSTR("_titleLabel"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCellAccessibility;
  -[PKTransactionHistoryTransactionGroupHeaderCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  -[PKTransactionHistoryTransactionGroupHeaderCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

}

- (PKTransactionHistoryTransactionGroupHeaderCellAccessibility)initWithFrame:(CGRect)a3
{
  PKTransactionHistoryTransactionGroupHeaderCellAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCellAccessibility;
  v3 = -[PKTransactionHistoryTransactionGroupHeaderCellAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKTransactionHistoryTransactionGroupHeaderCellAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
