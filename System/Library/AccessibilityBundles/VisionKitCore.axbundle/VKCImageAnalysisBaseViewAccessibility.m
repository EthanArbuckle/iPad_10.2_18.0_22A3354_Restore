@implementation VKCImageAnalysisBaseViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKCImageAnalysisBaseView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageAnalysisBaseView"), CFSTR("copyButtonPressed:"), "v", "@", 0);
}

- (void)copyButtonPressed:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisBaseViewAccessibility;
  -[VKCImageAnalysisBaseViewAccessibility copyButtonPressed:](&v4, sel_copyButtonPressed_, a3);
  -[VKCImageAnalysisBaseViewAccessibility _accessibilityPostPasteboardTextForOperation:](self, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF018]);
}

@end
