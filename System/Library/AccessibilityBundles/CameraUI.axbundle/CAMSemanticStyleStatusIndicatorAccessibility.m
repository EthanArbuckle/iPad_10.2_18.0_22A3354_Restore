@implementation CAMSemanticStyleStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSemanticStyleStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStyleStatusIndicator"), CFSTR("semanticStyle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStyle"), CFSTR("displayName"), "@", 0);

}

- (id)accessibilityLabel
{
  return accessibilityCameraUID6xLocalizedString(CFSTR("semantic.style"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[CAMSemanticStyleStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("semanticStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("displayName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMSemanticStyleStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMSemanticStyleStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
