@implementation CKSpeakerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKSpeakerButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSpeakerButton"), CFSTR("isSpeakerEnabled"), "B", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("speaker.button.label"));
}

- (id)accessibilityValue
{
  __CFString *v2;

  if (-[CKSpeakerButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSpeakerEnabled")))
    v2 = CFSTR("switch.on");
  else
    v2 = CFSTR("switch.off");
  accessibilityLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
