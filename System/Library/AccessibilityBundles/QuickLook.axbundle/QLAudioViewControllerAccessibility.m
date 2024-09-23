@implementation QLAudioViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLAudioViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLAudioViewController"), CFSTR("_playButton"), "QLOverlayPlayButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLOverlayPlayButton"), CFSTR("_button"), "UIButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("QLAudioViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  char v8;

  accessibilityLocalizedString(CFSTR("audio.play.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_opt_class();
  -[QLAudioViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityLabel:", v3);
  v7.receiver = self;
  v7.super_class = (Class)QLAudioViewControllerAccessibility;
  -[QLAudioViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLAudioViewControllerAccessibility;
  -[QLAudioViewControllerAccessibility loadView](&v3, sel_loadView);
  -[QLAudioViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
