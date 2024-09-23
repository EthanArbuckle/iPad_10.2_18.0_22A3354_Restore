@implementation SFPersonCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFPersonCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFPersonCollectionViewCell"), CFSTR("_secondLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFPersonCollectionViewCell"), CFSTR("_nameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFPersonCollectionViewCell"), CFSTR("cellState"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFPersonCollectionViewCell"), CFSTR("circleProgressView"), "@", 0);

}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(CFSTR("person.airdrop.label"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SFPersonCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    -[SFPersonCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  -[SFPersonCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[SFPersonCollectionViewCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("cellState")) == 3)
  {
    -[SFPersonCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("circleProgressView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SFPersonCollectionViewCellAccessibility;
    -[SFPersonCollectionViewCellAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("person.airdrop.hint"));
}

@end
