@implementation SearchUIButtonCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIButtonCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TLKButtonView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SearchUIButtonCardSectionView"), CFSTR("contentView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKButtonView"), CFSTR("title"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SearchUIButtonCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
