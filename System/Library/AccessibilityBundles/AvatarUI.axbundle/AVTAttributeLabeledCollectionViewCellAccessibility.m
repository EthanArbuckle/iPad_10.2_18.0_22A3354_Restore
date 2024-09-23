@implementation AVTAttributeLabeledCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTAttributeLabeledCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAttributeLabeledCollectionViewCell"), CFSTR("label"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTAttributeLabeledCollectionViewCellAccessibility;
  -[AVTAttributeLabeledCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[AVTAttributeLabeledCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

@end
