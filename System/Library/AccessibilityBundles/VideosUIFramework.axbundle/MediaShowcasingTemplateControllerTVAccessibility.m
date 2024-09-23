@implementation MediaShowcasingTemplateControllerTVAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.MediaShowcasingTemplateControllerTV");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("didUpdateFocusInContext: withAnimationCoordinator:"), "v", "@", "@", 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaShowcasingTemplateControllerTVAccessibility;
  -[MediaShowcasingTemplateControllerTVAccessibility didUpdateFocusInContext:withAnimationCoordinator:](&v5, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x24BDF7238], 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MediaShowcasingTemplateControllerTVAccessibility;
  -[MediaShowcasingTemplateControllerTVAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

@end
