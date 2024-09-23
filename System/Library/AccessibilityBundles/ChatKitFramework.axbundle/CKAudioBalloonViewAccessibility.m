@implementation CKAudioBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAudioBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAudioBalloonView"), CFSTR("duration"), "d", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axMessageSender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("audio.message.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axStickerDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axAcknowledgmentDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axMessageTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0];
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[CKAudioBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  AXDurationStringForDuration();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
