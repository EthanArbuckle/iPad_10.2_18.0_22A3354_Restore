@implementation ETMessageAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETMessage");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ETMessageAccessibility"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETMessage"), CFSTR("color"), "@", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("unknown.message.label"));
}

- (id)_accessibilityColorString
{
  void *v2;
  void *v3;

  -[ETMessageAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("color"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axColorStringForSpeaking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
