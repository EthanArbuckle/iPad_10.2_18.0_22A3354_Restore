@implementation CKAudioMessageBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.CKAudioMessageBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.CKAudioMessageBalloonView"), CFSTR("$__lazy_storage_$_timeLabel"), "Optional<UILabel>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.CKAudioMessageBalloonView"), CFSTR("$__lazy_storage_$_transcriptionLabel"), "Optional<CKTranscriptionView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.CKTranscriptionView"), CFSTR("text"), "Optional<String>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.CKTranscriptionView"), CFSTR("expansionButton"), "UIButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ChatKit.CKAudioMessageBalloonView"), CFSTR("CKBalloonView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKBalloonViewDelegate"), CFSTR("balloonViewTapped:withModifierFlags:selectedText:"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axMessageSender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("audio.message.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axReplyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axStickerDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axAcknowledgmentDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axMessageTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[CKAudioMessageBalloonViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("$__lazy_storage_$_timeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXDurationForDurationString();
  AXDurationStringForDuration();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAudioMessageBalloonViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("$__lazy_storage_$_transcriptionLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeSwiftStringForKey:", CFSTR("text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("no.transcript"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKAudioMessageBalloonViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("$__lazy_storage_$_transcriptionLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("expansionButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
