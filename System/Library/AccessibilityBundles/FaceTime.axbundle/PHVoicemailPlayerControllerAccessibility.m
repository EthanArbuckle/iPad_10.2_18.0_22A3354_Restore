@implementation PHVoicemailPlayerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHVoicemailPlayerController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailPlayerController"), CFSTR("play"), "v", 0);
}

- (void)play
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHVoicemailPlayerControllerAccessibility;
  -[PHVoicemailPlayerControllerAccessibility play](&v2, sel_play);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE30]);
}

@end
