@implementation SKUILockupSwooshCellLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUILockupSwooshCellLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUILockupSwooshCellLayout"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUILockupSwooshCellLayout"), CFSTR("artistName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUILockupSwooshCellLayout"), CFSTR("category"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUILockupSwooshCellLayout"), CFSTR("price"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[SKUILockupSwooshCellLayoutAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupSwooshCellLayoutAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artistName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupSwooshCellLayoutAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupSwooshCellLayoutAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("price"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
