@implementation _TVLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("_TVShelfViewHeaderView"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[_TVLabelAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_TVLabelAccessibility;
  -[_TVLabelAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFFA80], "textByReconcilingClientText:withServerText:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)_accessibilityExplorerElementReadPriority
{
  void *v3;
  char v4;
  objc_super v6;

  -[_TVLabelAccessibility _atvaccessibilityITMLClass](self, "_atvaccessibilityITMLClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("banner-product-availability-title"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)_TVLabelAccessibility;
  return -[_TVLabelAccessibility _accessibilityExplorerElementReadPriority](&v6, sel__accessibilityExplorerElementReadPriority);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVLabelAccessibility;
  v3 = -[_TVLabelAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  -[_TVLabelAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73C0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
