@implementation SiriSharedUICompactUserUtteranceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriSharedUICompactUserUtteranceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriSharedUICompactUserUtteranceView"), CFSTR("_streamingTextView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUICStreamingTextView"), CFSTR("text"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SiriSharedUICompactUserUtteranceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_streamingTextView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("correction.hint"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUICompactUserUtteranceViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SiriSharedUICompactUserUtteranceViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
