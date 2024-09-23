@implementation HRMetadataEducationTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HRMetadataEducationTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HRMetadataEducationTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HRMetadataEducationTableViewCell"), CFSTR("_setUpUI"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HRMetadataEducationTableViewCell"), CFSTR("titleLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HRMetadataEducationTableViewCellAccessibility;
  -[HRMetadataEducationTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HRMetadataEducationTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v4);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibleSubviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HRMetadataEducationTableViewCellAccessibility;
    -[HRMetadataEducationTableViewCellAccessibility accessibilityElements](&v8, sel_accessibilityElements);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_setUpUI
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HRMetadataEducationTableViewCellAccessibility;
  -[HRMetadataEducationTableViewCellAccessibility _setUpUI](&v3, sel__setUpUI);
  -[HRMetadataEducationTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
