@implementation INUIAddVoiceShortcutButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("INUIAddVoiceShortcutButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("INUIAddVoiceShortcutButton"), CFSTR("addToSiriLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("INUIAddVoiceShortcutButton"), CFSTR("phraseLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[INUIAddVoiceShortcutButtonAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("addToSiriLabel, phraseLabel"));
}

@end
