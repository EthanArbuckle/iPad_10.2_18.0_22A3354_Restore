@implementation tvOS_AVInfoPanelAudioViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVInfoPanelAudioViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)tvOS_AVInfoPanelAudioViewControllerAccessibility;
  -[tvOS_AVInfoPanelAudioViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v22, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[tvOS_AVInfoPanelAudioViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("languageHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[tvOS_AVInfoPanelAudioViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("soundHeaderView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[tvOS_AVInfoPanelAudioViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("speakerHeaderView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subviews");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  objc_msgSend(v9, "setIsAccessibilityElement:", 1);
  objc_msgSend(v14, "setIsAccessibilityElement:", 1);
  objc_msgSend(v7, "setIsAccessibilityElement:", 0);
  objc_msgSend(v12, "setIsAccessibilityElement:", 0);
  objc_msgSend(v17, "setIsAccessibilityElement:", 0);
  objc_msgSend(v7, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v18);

  objc_msgSend(v12, "accessibilityLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v19);

  objc_msgSend(v17, "accessibilityLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v20);

  v21 = *MEMORY[0x24BDF73C0];
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_msgSend(v9, "setAccessibilityTraits:", v21);
  objc_msgSend(v14, "setAccessibilityTraits:", v21);

}

@end
