@implementation CKAudioMessageRecordingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAudioMessageRecordingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("CKAudioMessageRecordingView"), CFSTR("sendButton"), "UIButton");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKAudioMessageRecordingViewAccessibility;
  -[CKAudioMessageRecordingViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CKAudioMessageRecordingViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("sendButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("sendButton"));
  accessibilityLocalizedString(CFSTR("send.button.text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  accessibilityLocalizedString(CFSTR("send.message.button.hint.imessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetElementHelp:", v5);

}

@end
