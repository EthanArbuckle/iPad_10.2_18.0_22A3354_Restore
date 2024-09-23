@implementation PXCapsuleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCapsuleButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("PXCapsuleButton"), CFSTR("UIButton"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PXCapsuleButtonAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
