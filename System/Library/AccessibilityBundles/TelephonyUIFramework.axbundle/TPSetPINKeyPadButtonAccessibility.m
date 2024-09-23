@implementation TPSetPINKeyPadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPSetPINKeyPadButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TPSetPINKeyPadButton"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TPSetPINKeyPadButton"), CFSTR("TPNumberPadButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPNumberPadButton"), CFSTR("character"), "q", 0);

}

- (BOOL)_accessibilityIsBlankButton
{
  void *v2;
  uint64_t v3;

  -[TPSetPINKeyPadButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("character"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3 == 13;
}

- (BOOL)canBecomeFocused
{
  return !-[TPSetPINKeyPadButtonAccessibility _accessibilityIsBlankButton](self, "_accessibilityIsBlankButton");
}

- (unint64_t)accessibilityTraits
{
  if (-[TPSetPINKeyPadButtonAccessibility _accessibilityIsBlankButton](self, "_accessibilityIsBlankButton"))
    return *MEMORY[0x24BDF73E0];
  else
    return *MEMORY[0x24BDF73D0] | *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF73F0];
}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  -[TPSetPINKeyPadButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("character"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  v4 = 0;
  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      AXFormatInteger();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 12:
      v6 = CFSTR("number.pad.delete");
      accessibilityLocalizedString(CFSTR("number.pad.delete"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_3:
      v5 = v4;
      v6 = v5;
      break;
  }
  v7 = v5;

  return v7;
}

@end
