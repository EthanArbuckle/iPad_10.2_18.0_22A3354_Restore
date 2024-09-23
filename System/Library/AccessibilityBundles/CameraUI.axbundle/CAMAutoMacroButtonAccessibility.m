@implementation CAMAutoMacroButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMAutoMacroButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMAutoMacroButton"), CFSTR("active"), "B", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("auto.macro.mode"));
}

- (id)accessibilityValue
{
  __CFString *v2;

  if (-[CAMAutoMacroButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("active")))
    v2 = CFSTR("on.state");
  else
    v2 = CFSTR("off.state");
  accessibilityCameraUILocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
