@implementation MainButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileSafari.MainButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MobileSafari.MainButton"), CFSTR("UIButton"));
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  _BOOL4 v3;

  -[MainButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("MoreMenuItem")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("FindOnPage")) & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = !UIAccessibilityIsVoiceOverRunning();
  }

  return v3;
}

- (BOOL)accessibilityActivate
{
  void *v2;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performPrimaryAction");

  return 1;
}

@end
