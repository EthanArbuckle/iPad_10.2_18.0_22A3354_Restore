@implementation HUCameraMicrophoneControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCameraMicrophoneControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCameraMicrophoneControl"), CFSTR("isTalking"), "B", 0);
}

- (BOOL)_axIsTalking
{
  return -[HUCameraMicrophoneControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isTalking"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCameraMicrophoneControlAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HUCameraMicrophoneControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7430];
}

- (id)accessibilityLabel
{
  if (-[HUCameraMicrophoneControlAccessibility _axIsTalking](self, "_axIsTalking"))
    return accessibilityHomeUILocalizedString(CFSTR("camera.done.button"));
  else
    return accessibilityHomeUILocalizedString(CFSTR("camera.talk.button"));
}

- (id)accessibilityHint
{
  if (-[HUCameraMicrophoneControlAccessibility _axIsTalking](self, "_axIsTalking"))
    return accessibilityHomeUILocalizedString(CFSTR("camera.done.button.hint"));
  else
    return accessibilityHomeUILocalizedString(CFSTR("camera.talk.button.hint"));
}

@end
