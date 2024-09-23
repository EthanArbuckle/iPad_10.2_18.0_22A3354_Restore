@implementation VKKeyboardCameraGuidanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKKeyboardCameraGuidanceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKKeyboardCameraGuidanceView"), CFSTR("_reallyShowGuidance"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VKKeyboardCameraGuidanceView"), CFSTR("_text"), "NSString");

}

- (void)_reallyShowGuidance
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKKeyboardCameraGuidanceViewAccessibility;
  -[VKKeyboardCameraGuidanceViewAccessibility _reallyShowGuidance](&v4, sel__reallyShowGuidance);
  -[VKKeyboardCameraGuidanceViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

@end
