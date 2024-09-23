@implementation SBUILongNumericPasscodeEntryFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUILongNumericPasscodeEntryField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUILongNumericPasscodeEntryField"), CFSTR("setShowsOkButton:"), "v", "B", 0);
}

- (void)setShowsOkButton:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUILongNumericPasscodeEntryFieldAccessibility;
  -[SBUILongNumericPasscodeEntryFieldAccessibility setShowsOkButton:](&v3, sel_setShowsOkButton_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
