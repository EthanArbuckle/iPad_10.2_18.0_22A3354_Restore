@implementation VLFScanningInstructionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VLFScanningInstructionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VLFScanningInstructionView"), CFSTR("updateForCurrentState"), "v", 0);
}

- (void)updateForCurrentState
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VLFScanningInstructionViewAccessibility;
  -[VLFScanningInstructionViewAccessibility updateForCurrentState](&v2, sel_updateForCurrentState);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
