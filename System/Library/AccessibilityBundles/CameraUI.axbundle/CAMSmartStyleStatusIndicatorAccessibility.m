@implementation CAMSmartStyleStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSmartStyleStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSmartStyleStatusIndicator"), CFSTR("active"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSmartStyleStatusIndicator"), CFSTR("smartStyle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSmartStyle"), CFSTR("presetType"), "q", 0);

}

- (int64_t)_accessibilityExpandedStatus
{
  if (-[CAMSmartStyleStatusIndicatorAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("active")))return 1;
  else
    return 2;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUI3LocalizedString(CFSTR("smart.style.button"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[CAMSmartStyleStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("smartStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityDescriptionStringForPresetStyle(objc_msgSend(v2, "safeIntegerForKey:", CFSTR("presetType")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
