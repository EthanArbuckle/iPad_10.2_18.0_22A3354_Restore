@implementation SFReaderTextSizeStepperControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFReaderTextSizeStepperController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFReaderTextSizeStepperController"), CFSTR("prepareStepper:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFReaderTextSizeStepperController"), CFSTR("_updateStepperControls:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBSReaderConfigurationManager"), CFSTR("effectiveTextZoomIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFReaderTextSizeStepperController"), CFSTR("_readerContext"), "<SFReaderContext>");
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("SFReaderContext"), CFSTR("configurationManager"), 1, 1);

}

- (void)prepareStepper:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFReaderTextSizeStepperControllerAccessibility;
  v3 = a3;
  -[SFReaderTextSizeStepperControllerAccessibility prepareStepper:](&v5, sel_prepareStepper_, v3);
  accessibilitySafariServicesLocalizedString(CFSTR("text.size"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4, v5.receiver, v5.super_class);

}

- (void)_updateStepperControls:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFReaderTextSizeStepperControllerAccessibility;
  -[SFReaderTextSizeStepperControllerAccessibility _updateStepperControls:](&v12, sel__updateStepperControls_, v4);
  -[SFReaderTextSizeStepperControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_readerContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("configurationManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("effectiveTextZoomIndex"));
  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilitySafariServicesLocalizedString(CFSTR("text.zoom.level"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v11);

}

@end
