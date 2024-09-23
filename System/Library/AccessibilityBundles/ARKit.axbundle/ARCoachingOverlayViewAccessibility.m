@implementation ARCoachingOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ARCoachingOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ARCoachingOverlayView"), CFSTR("setActive:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ARCoachingOverlayView"), CFSTR("crossFadeCoachingMessage:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ARCoachingOverlayView"), CFSTR("isActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ARCoachingOverlayView"), CFSTR("_coachingText"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ARCoachingOverlayView"), CFSTR("_coachingMessageType"), "q");

}

- (BOOL)_axIsActive
{
  return -[ARCoachingOverlayViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isActive"));
}

- (id)_axCoachingText
{
  void *v2;
  void *v3;

  -[ARCoachingOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_coachingText"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_axAnnounceCoachingText
{
  UIAccessibilityNotifications v2;
  id v3;

  v2 = *MEMORY[0x24BDF71E8];
  -[ARCoachingOverlayViewAccessibility _axCoachingText](self, "_axCoachingText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  BOOL v7;
  _BOOL4 v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v7 = -[ARCoachingOverlayViewAccessibility _axIsActive](self, "_axIsActive");
  v9.receiver = self;
  v9.super_class = (Class)ARCoachingOverlayViewAccessibility;
  -[ARCoachingOverlayViewAccessibility setActive:animated:](&v9, sel_setActive_animated_, v5, v4);
  v8 = -[ARCoachingOverlayViewAccessibility _axIsActive](self, "_axIsActive");
  if (!v7 && v8)
    -[ARCoachingOverlayViewAccessibility _axAnnounceCoachingText](self, "_axAnnounceCoachingText");
}

- (void)crossFadeCoachingMessage:(int64_t)a3
{
  uint64_t v5;
  objc_super v6;

  v5 = -[ARCoachingOverlayViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_coachingMessageType"));
  v6.receiver = self;
  v6.super_class = (Class)ARCoachingOverlayViewAccessibility;
  -[ARCoachingOverlayViewAccessibility crossFadeCoachingMessage:](&v6, sel_crossFadeCoachingMessage_, a3);
  if (v5 != a3)
    AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __63__ARCoachingOverlayViewAccessibility_crossFadeCoachingMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axAnnounceCoachingText");
}

@end
