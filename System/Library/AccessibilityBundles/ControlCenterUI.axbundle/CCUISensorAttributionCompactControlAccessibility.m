@implementation CCUISensorAttributionCompactControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUISensorAttributionCompactControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISensorAttributionCompactControl"), CFSTR("showingCamera"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISensorAttributionCompactControl"), CFSTR("showingLocation"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISensorAttributionCompactControl"), CFSTR("showingMicrophone"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISensorAttributionCompactControl"), CFSTR("setExpanded:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUISensorAttributionCompactControl"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("isUserInteractionEnabled"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return -[CCUISensorAttributionCompactControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isUserInteractionEnabled"));
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("control.center.services.used"));
}

- (id)accessibilityValue
{
  int v3;
  int v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  v3 = -[CCUISensorAttributionCompactControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showingCamera"));
  v4 = -[CCUISensorAttributionCompactControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showingMicrophone"));
  v5 = -[CCUISensorAttributionCompactControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showingLocation"));
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!v3)
  {
    if (!v4)
      goto LABEL_3;
LABEL_7:
    accessibilityLocalizedString(CFSTR("control.center.microphone.used"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axSafelyAddObject:", v11);

    if (!v5)
      goto LABEL_5;
    goto LABEL_4;
  }
  accessibilityLocalizedString(CFSTR("control.center.camera.used"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axSafelyAddObject:", v10);

  if (v4)
    goto LABEL_7;
LABEL_3:
  if (v5)
  {
LABEL_4:
    accessibilityLocalizedString(CFSTR("control.center.location.used"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axSafelyAddObject:", v7);

  }
LABEL_5:
  MEMORY[0x23490BCC4](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionCompactControlAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CCUISensorAttributionCompactControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("control.center.active.services"));
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUISensorAttributionCompactControlAccessibility;
  -[CCUISensorAttributionCompactControlAccessibility setExpanded:animated:](&v4, sel_setExpanded_animated_, a3, a4);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __73__CCUISensorAttributionCompactControlAccessibility_setExpanded_animated___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
