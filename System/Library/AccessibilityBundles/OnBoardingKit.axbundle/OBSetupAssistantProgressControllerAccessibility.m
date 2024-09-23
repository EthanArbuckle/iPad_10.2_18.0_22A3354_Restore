@implementation OBSetupAssistantProgressControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBSetupAssistantProgressController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBSetupAssistantProgressController"), CFSTR("OBWelcomeController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBSetupAssistantProgressController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBWelcomeController"), CFSTR("contentView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBSetupAssistantProgressControllerAccessibility;
  -[OBSetupAssistantProgressControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[OBSetupAssistantProgressControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetOverridesInvalidFrames:", 1);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBSetupAssistantProgressControllerAccessibility;
  -[OBSetupAssistantProgressControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[OBSetupAssistantProgressControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
