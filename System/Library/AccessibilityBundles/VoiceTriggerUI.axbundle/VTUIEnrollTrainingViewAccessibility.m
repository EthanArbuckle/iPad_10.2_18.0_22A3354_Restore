@implementation VTUIEnrollTrainingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VTUIEnrollTrainingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollTrainingView"), CFSTR("_instructionPagedLabel"), "VTUIPagedLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollTrainingView"), CFSTR("_radarButton"), "SiriUIContentButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIPagedLabel"), CFSTR("_instructionLabelLeft"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIPagedLabel"), CFSTR("_instructionLabelRight"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingView"), CFSTR("_setupUI"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingView"), CFSTR("orbView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VTUIEnrollTrainingViewAccessibility;
  -[VTUIEnrollTrainingViewAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[VTUIEnrollTrainingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_radarButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("button.radar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[VTUIEnrollTrainingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_instructionPagedLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_instructionLabelLeft"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXIsInstructionLabel"));

  -[VTUIEnrollTrainingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_instructionPagedLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("_instructionLabelRight"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_accessibilitySetRetainedValue:forKey:", v7, CFSTR("AXIsInstructionLabel"));

}

- (VTUIEnrollTrainingViewAccessibility)initWithFrame:(CGRect)a3
{
  VTUIEnrollTrainingViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollTrainingViewAccessibility;
  v3 = -[VTUIEnrollTrainingViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VTUIEnrollTrainingViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (void)_setupUI
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewAccessibility;
  -[VTUIEnrollTrainingViewAccessibility _setupUI](&v3, sel__setupUI);
  -[VTUIEnrollTrainingViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
