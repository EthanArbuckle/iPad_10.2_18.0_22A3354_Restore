@implementation _HKMedicalIDMultilineStringCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_HKMedicalIDMultilineStringCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_HKMedicalIDMultilineStringCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_HKMedicalIDMultilineStringCell"), CFSTR("detailLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[_HKMedicalIDMultilineStringCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDMultilineStringCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AXBloodTypeStringFromString(v7, v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v7;
  v11 = v10;

  return v11;
}

- (_HKMedicalIDMultilineStringCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _HKMedicalIDMultilineStringCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKMedicalIDMultilineStringCellAccessibility;
  v4 = -[_HKMedicalIDMultilineStringCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[_HKMedicalIDMultilineStringCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_HKMedicalIDMultilineStringCellAccessibility;
  -[_HKMedicalIDMultilineStringCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[_HKMedicalIDMultilineStringCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

@end
