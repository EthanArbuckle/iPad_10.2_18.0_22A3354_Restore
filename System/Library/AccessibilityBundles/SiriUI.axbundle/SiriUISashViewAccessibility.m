@implementation SiriUISashViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUISashView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriUISashView"), CFSTR("sashItem"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SiriUISashItem"), CFSTR("SiriSharedUISashItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriSharedUISashItem"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriSharedUISashItem"), CFSTR("isHidden"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SiriUISashViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sashItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[SiriUISashViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sashItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isHidden")) ^ 1;

  return v3;
}

@end
