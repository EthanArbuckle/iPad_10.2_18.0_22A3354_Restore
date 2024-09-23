@implementation SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFocusEnablementIndicatorSystemApertureActivityElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFocusEnablementIndicatorSystemApertureActivityElement"), CFSTR("initWithActivityDescription:enabled:"), "@", "B", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("FCActivityDescribing"), CFSTR("activityDisplayName"), 1, 1);

}

- (SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility)initWithActivityDescription:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility;
  v5 = a3;
  v6 = -[SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility initWithActivityDescription:enabled:](&v12, sel_initWithActivityDescription_enabled_, v5, v4);
  objc_msgSend(v5, "safeStringForKey:", CFSTR("activityDisplayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v8 = CFSTR("focus.off");
  else
    v8 = CFSTR("focus.on");
  accessibilityLocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXCFormattedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v10);

  return v6;
}

@end
