@implementation CAMDrawerSemanticStyleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDrawerSemanticStyleButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("CAMControlDrawerExpandableButton"), CFSTR("isExpanded"), 1, 1);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CAMControlDrawerCustomButton"), CFSTR("CAMControlDrawerExpandableButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerSemanticStyleButton"), CFSTR("CAMControlDrawerCustomButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerSemanticStyleButton"), CFSTR("isOn"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerSemanticStyleButton"), CFSTR("shouldShowSlashForCurrentState"), "B", 0);

}

- (int64_t)_accessibilityExpandedStatus
{
  if (-[CAMDrawerSemanticStyleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))return 1;
  else
    return 2;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUID6xLocalizedString(CFSTR("semantic.style"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("SemanticStyleButton");
}

- (id)accessibilityValue
{
  int v3;
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  if (-[CAMDrawerSemanticStyleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))
  {
    v3 = -[CAMDrawerSemanticStyleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldShowSlashForCurrentState"));
    v4 = CFSTR("on.state");
    v5 = CFSTR("off.state");
  }
  else
  {
    v3 = -[CAMDrawerSemanticStyleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isOn"));
    v4 = CFSTR("off.state");
    v5 = CFSTR("on.state");
  }
  if (v3)
    v6 = (__CFString *)v5;
  else
    v6 = (__CFString *)v4;
  accessibilityCameraUILocalizedString(v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
