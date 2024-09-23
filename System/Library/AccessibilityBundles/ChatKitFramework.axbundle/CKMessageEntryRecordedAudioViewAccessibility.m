@implementation CKMessageEntryRecordedAudioViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageEntryRecordedAudioView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CKActionMenuWindow"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryRecordedAudioView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKActionMenuWindow"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKAudioMediaObject"), CFSTR("CKAVMediaObject"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryRecordedAudioView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryRecordedAudioView"), CFSTR("audioMediaObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAVMediaObject"), CFSTR("duration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryRecordedAudioView"), CFSTR("waveformImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryRecordedAudioView"), CFSTR("updateProgress"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryRecordedAudioView"), CFSTR("isPlaying"), "B", 0);

}

- (void)_accessibilityApplyPlayPauseDeleteButtonLabel
{
  void *v2;
  id v3;

  -[CKMessageEntryRecordedAudioViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("playPauseDeleteButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("audio.message.delete.button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryRecordedAudioViewAccessibility;
  -[CKMessageEntryRecordedAudioViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CKMessageEntryRecordedAudioViewAccessibility _accessibilityApplyPlayPauseDeleteButtonLabel](self, "_accessibilityApplyPlayPauseDeleteButtonLabel");
}

- (CKMessageEntryRecordedAudioViewAccessibility)initWithFrame:(CGRect)a3
{
  CKMessageEntryRecordedAudioViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryRecordedAudioViewAccessibility;
  v3 = -[CKMessageEntryRecordedAudioViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CKMessageEntryRecordedAudioViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (BOOL)accessibilityViewIsModal
{
  void *v2;
  void *v3;

  objc_opt_class();
  -[objc_class sharedInstance](NSClassFromString(CFSTR("CKActionMenuWindow")), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "isHidden") ^ 1;
  return (char)v2;
}

- (void)updateProgress
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryRecordedAudioViewAccessibility;
  -[CKMessageEntryRecordedAudioViewAccessibility updateProgress](&v11, sel_updateProgress);
  -[CKMessageEntryRecordedAudioViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  objc_opt_class();
  -[CKMessageEntryRecordedAudioViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("waveformImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  v6 = objc_msgSend(v5, "accessibilityTraits");
  objc_msgSend(v5, "setAccessibilityTraits:", v6 & ~*MEMORY[0x24BDF73C8]);
  accessibilityLocalizedString(CFSTR("audio.duration.label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v7);

  -[CKMessageEntryRecordedAudioViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("audioMediaObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("duration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  AXDurationStringForDuration();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityValue:", v10);

  objc_msgSend(v5, "setAccessibilityRespondsToUserInteraction:", 0);
}

@end
