@implementation PMiOSMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PMiOSMainViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PMiOSMainViewController"), CFSTR("MiroPlayerViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MiroPlayerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("PMiOSSliderViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSMainViewController"), CFSTR("moodSlider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSMainViewController"), CFSTR("durationSlider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSMainViewController"), CFSTR("editBBItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSMainViewController"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSMainViewController"), CFSTR("_setupBottomToolbar"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSMainViewController"), CFSTR("toggleControlVisibility"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSMainViewController"), CFSTR("setControlVisibility:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PMiOSMainViewControllerAccessibility;
  -[PMiOSMainViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[PMiOSMainViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("moodSlider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C07D8](CFSTR("PMiOSSliderViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_axSetMemoriesEditSliderType:", 0);
  -[PMiOSMainViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("durationSlider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C07D8](CFSTR("PMiOSSliderViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "_axSetMemoriesEditSliderType:", 1);
  -[PMiOSMainViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (id)editBBItem
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PMiOSMainViewControllerAccessibility;
  -[PMiOSMainViewControllerAccessibility editBBItem](&v5, sel_editBBItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityMemoriesLocalizedString(CFSTR("edit.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (void)_setupBottomToolbar
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMiOSMainViewControllerAccessibility;
  -[PMiOSMainViewControllerAccessibility _setupBottomToolbar](&v3, sel__setupBottomToolbar);
  -[PMiOSMainViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PMiOSMainViewControllerAccessibility;
  -[PMiOSMainViewControllerAccessibility viewDidLoad](&v5, sel_viewDidLoad);
  -[PMiOSMainViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityMemoriesLocalizedString(CFSTR("memory.movie.hint.reveal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityHint:", v4);

}

- (void)toggleControlVisibility
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PMiOSMainViewControllerAccessibility;
  -[PMiOSMainViewControllerAccessibility toggleControlVisibility](&v2, sel_toggleControlVisibility);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)setControlVisibility:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PMiOSMainViewControllerAccessibility;
  -[PMiOSMainViewControllerAccessibility setControlVisibility:](&v8, sel_setControlVisibility_);
  -[PMiOSMainViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("memory.movie.hint.hide");
  else
    v6 = CFSTR("memory.movie.hint.reveal");
  accessibilityMemoriesLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityHint:", v7);

}

@end
