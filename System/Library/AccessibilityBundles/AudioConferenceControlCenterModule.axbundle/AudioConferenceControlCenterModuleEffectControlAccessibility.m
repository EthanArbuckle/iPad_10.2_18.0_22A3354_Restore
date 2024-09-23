@implementation AudioConferenceControlCenterModuleEffectControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AudioConferenceControlCenterModule.EffectControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideoConferenceControlCenterModule.EffectControl"), CFSTR("isExpanded"), "Bool");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideoConferenceControlCenterModule.EffectControl"), CFSTR("buttonTitle"), "String");

}

- (BOOL)isAccessibilityElement
{
  return -[AudioConferenceControlCenterModuleEffectControlAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isExpanded")) ^ 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[AudioConferenceControlCenterModuleEffectControlAccessibility safeSwiftStringForKey:](self, "safeSwiftStringForKey:", CFSTR("buttonTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AudioConferenceControlCenterModuleEffectControlAccessibility;
    -[AudioConferenceControlCenterModuleEffectControlAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
