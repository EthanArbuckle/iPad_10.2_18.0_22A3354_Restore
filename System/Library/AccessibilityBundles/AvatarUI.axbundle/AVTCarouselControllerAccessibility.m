@implementation AVTCarouselControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTCarouselController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTCarouselController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTCarouselController"), CFSTR("presentEditorForCreatingAvatar:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVTCarouselControllerAccessibility;
  -[AVTCarouselControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTCarouselControllerAccessibility;
  -[AVTCarouselControllerAccessibility loadView](&v3, sel_loadView);
  -[AVTCarouselControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)presentEditorForCreatingAvatar:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTCarouselControllerAccessibility;
  -[AVTCarouselControllerAccessibility presentEditorForCreatingAvatar:](&v3, sel_presentEditorForCreatingAvatar_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
