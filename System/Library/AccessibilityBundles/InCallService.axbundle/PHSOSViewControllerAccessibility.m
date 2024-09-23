@implementation PHSOSViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHSOSViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHSOSViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("sosMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("infoLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("cancelButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("showSOSNumbersList"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("showSOSDialCountdown"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("showSOSDialCanceled"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("showSOSNotified"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("showSOSNotificationCountdown"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("showSOSNotificationCanceled"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("presentMedicalID"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSViewController"), CFSTR("buttonPressed:"), "v", "@", 0);

}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3;
  id v4;
  void *v6;

  v3 = -[PHSOSViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("sosMode"));
  if (v3 == 1)
  {
    -[PHSOSViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cancelButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    AXPerformSafeBlock();

  }
  return v3 == 1;
}

uint64_t __62__PHSOSViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "buttonPressed:", *(_QWORD *)(a1 + 40));
}

- (void)showSOSNumbersList
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHSOSViewControllerAccessibility;
  -[PHSOSViewControllerAccessibility showSOSNumbersList](&v2, sel_showSOSNumbersList);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)showSOSDialCountdown
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  -[PHSOSViewControllerAccessibility showSOSDialCountdown](&v3, sel_showSOSDialCountdown);
  -[PHSOSViewControllerAccessibility _axMoveToCancelButton](self, "_axMoveToCancelButton");
}

- (void)showSOSDialCanceled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  -[PHSOSViewControllerAccessibility showSOSDialCanceled](&v3, sel_showSOSDialCanceled);
  -[PHSOSViewControllerAccessibility _axSpeakInfo](self, "_axSpeakInfo");
  -[PHSOSViewControllerAccessibility _axMoveToCancelButton](self, "_axMoveToCancelButton");
}

- (void)showSOSNotified
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  -[PHSOSViewControllerAccessibility showSOSNotified](&v3, sel_showSOSNotified);
  -[PHSOSViewControllerAccessibility _axSpeakInfo](self, "_axSpeakInfo");
  -[PHSOSViewControllerAccessibility _axMoveToCancelButton](self, "_axMoveToCancelButton");
}

- (void)showSOSNotificationCountdown
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  -[PHSOSViewControllerAccessibility showSOSNotificationCountdown](&v3, sel_showSOSNotificationCountdown);
  -[PHSOSViewControllerAccessibility _axMoveToCancelButton](self, "_axMoveToCancelButton");
}

- (void)showSOSNotificationCanceled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  -[PHSOSViewControllerAccessibility showSOSNotificationCanceled](&v3, sel_showSOSNotificationCanceled);
  -[PHSOSViewControllerAccessibility _axSpeakInfo](self, "_axSpeakInfo");
}

- (void)presentMedicalID
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHSOSViewControllerAccessibility;
  -[PHSOSViewControllerAccessibility presentMedicalID](&v2, sel_presentMedicalID);
  UIAccessibilityPostNotification(0xBD6u, 0);
}

- (void)_axSpeakInfo
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[PHSOSViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infoLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", _axSpeakInfo_PreviousText) & 1) == 0)
  {
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    objc_storeStrong((id *)&_axSpeakInfo_PreviousText, v5);
  }

}

- (void)_axMoveToCancelButton
{
  id v2;

  -[PHSOSViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cancelButton"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v2);

}

@end
