@implementation _SFPageFormatMenuControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFPageFormatMenuController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFPageFormatMenuController"), CFSTR("_readerTextSizeAlertItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFPageFormatMenuController"), CFSTR("_didTapButtonInStepper:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFPageFormatMenuController"), CFSTR("_viewController"), "UIViewController");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SFBrowsingAssistant"), CFSTR("stepperFocused"), "B");

}

- (id)_readerTextSizeAlertItem
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFPageFormatMenuControllerAccessibility;
  -[_SFPageFormatMenuControllerAccessibility _readerTextSizeAlertItem](&v5, sel__readerTextSizeAlertItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("page.zoom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (void)_didTapButtonInStepper:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;

  v4 = a3;
  -[_SFPageFormatMenuControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_viewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __67___SFPageFormatMenuControllerAccessibility__didTapButtonInStepper___block_invoke;
  v11 = &unk_25032D578;
  v6 = v5;
  v12 = v6;
  AXPerformSafeBlock();
  if (!UIAccessibilityIsVoiceOverRunning()
    && (_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0
    && !UIAccessibilityIsSwitchControlRunning())
  {
    v7.receiver = self;
    v7.super_class = (Class)_SFPageFormatMenuControllerAccessibility;
    -[_SFPageFormatMenuControllerAccessibility _didTapButtonInStepper:](&v7, sel__didTapButtonInStepper_, v4);
  }

}

@end
