@implementation AVTSplashScreenViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTSplashScreenViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSplashScreenViewController"), CFSTR("playerViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSplashScreenViewController"), CFSTR("configuration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSplashScreenConfiguration"), CFSTR("primaryPlayerItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerItem"), CFSTR("_URL"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVTSplashScreenViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTSplashScreenViewControllerAccessibility;
  -[AVTSplashScreenViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[AVTSplashScreenViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("configuration.primaryPlayerItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTAvatarEditorSplashVideo();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("memoji.splash.video"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityLabel:", v10);

    objc_msgSend(v9, "setIsAccessibilityElement:", 1);
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTSplashScreenViewControllerAccessibility;
  -[AVTSplashScreenViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[AVTSplashScreenViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
