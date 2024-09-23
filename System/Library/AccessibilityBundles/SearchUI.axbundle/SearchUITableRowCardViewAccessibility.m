@implementation SearchUITableRowCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUITableRowCardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICardSectionView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKGridRowView"), CFSTR("labels"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUITableRowCardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("labels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491CD7C]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
