@implementation SKUIItemTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIItemTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIItemTableViewCell"), CFSTR("layout"), "@", 0);
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SKUIItemTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
