@implementation SRGuideDetailSectionHeaderCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRGuideDetailSectionHeaderCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SRGuideDetailSectionHeaderCollectionViewCell"), CFSTR("_textContainerView"), "SiriUITextContainerView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriUITextContainerView"), CFSTR("text"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[SRGuideDetailSectionHeaderCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

@end
