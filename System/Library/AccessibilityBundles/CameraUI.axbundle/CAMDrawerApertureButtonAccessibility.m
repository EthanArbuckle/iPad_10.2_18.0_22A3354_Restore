@implementation CAMDrawerApertureButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDrawerApertureButton");
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
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerApertureButton"), CFSTR("CAMControlDrawerCustomButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerApertureButton"), CFSTR("isOn"), "B", 0);

}

- (int64_t)_accessibilityExpandedStatus
{
  if (-[CAMDrawerApertureButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))return 1;
  else
    return 2;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("depth.button"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("DepthButton");
}

- (id)accessibilityValue
{
  void *v3;
  __CFString *v4;
  objc_super v6;

  if ((-[CAMDrawerApertureButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)CAMDrawerApertureButtonAccessibility;
    -[CAMDrawerApertureButtonAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((-[CAMDrawerApertureButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isOn")) & 1) != 0)
      v4 = CFSTR("on.state");
    else
      v4 = CFSTR("off.state");
    accessibilityCameraUILocalizedString(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
