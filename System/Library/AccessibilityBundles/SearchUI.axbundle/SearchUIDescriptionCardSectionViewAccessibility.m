@implementation SearchUIDescriptionCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIDescriptionCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SearchUIDescriptionCardSectionView"), CFSTR("contentView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIDescriptionCardSectionView"), CFSTR("didPressMoreButton"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKDescriptionView"), CFSTR("text"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUIDescriptionCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didPressMoreButton
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SearchUIDescriptionCardSectionViewAccessibility;
  -[SearchUIDescriptionCardSectionViewAccessibility didPressMoreButton](&v2, sel_didPressMoreButton);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
