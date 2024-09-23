@implementation ListeningViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicRecognition.ListeningView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicRecognition.ListeningView"), CFSTR("cancelButton"), "UIButton");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ListeningViewAccessibility;
  -[ListeningViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[ListeningViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("cancelButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("ACCESSIBILITY_STOP_LISTENING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
