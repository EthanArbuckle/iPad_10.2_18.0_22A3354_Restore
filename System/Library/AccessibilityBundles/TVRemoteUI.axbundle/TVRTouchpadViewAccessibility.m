@implementation TVRTouchpadViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRTouchpadView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRTouchpadView"), CFSTR("touchProcessor"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("TVRMatchPointTouchProcessor"));

}

- (BOOL)isAccessibilityElement
{
  if (UIAccessibilityIsSwitchControlRunning())
    return 0;
  else
    return !-[TVRTouchpadViewAccessibility _accessibilityIsMatchPoint](self, "_accessibilityIsMatchPoint");
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[TVRTouchpadViewAccessibility _accessibilitySetIsDirectTouching:](self, "_accessibilitySetIsDirectTouching:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accessibilityFocusChanged_, *MEMORY[0x24BDF7238], 0);

  v4 = objc_alloc(MEMORY[0x24BDFEA60]);
  accessibilityLocalizedString(CFSTR("tv.remote.touchpad.start.interaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStringOrAttributedString:", v5);

  objc_msgSend(v6, "setAttribute:forKey:", &unk_2503B0288, *MEMORY[0x24BDFEAD8]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v6);

  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t *v3;

  v3 = (unint64_t *)MEMORY[0x24BDF73E0];
  if (!UIAccessibilityIsSwitchControlRunning()
    && -[TVRTouchpadViewAccessibility _accessibilityIsDirectTouching](self, "_accessibilityIsDirectTouching"))
  {
    v3 = (unint64_t *)MEMORY[0x24BDF73A8];
  }
  return *v3;
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (-[TVRTouchpadViewAccessibility _accessibilityIsDirectTouching](self, "_accessibilityIsDirectTouching"))
  {
    v5.receiver = self;
    v5.super_class = (Class)TVRTouchpadViewAccessibility;
    -[TVRTouchpadViewAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("tv.remote.touchpad.view"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[TVRTouchpadViewAccessibility _accessibilityIsDirectTouching](self, "_accessibilityIsDirectTouching"))
  {
    v5.receiver = self;
    v5.super_class = (Class)TVRTouchpadViewAccessibility;
    -[TVRTouchpadViewAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("tv.remote.touchpad.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (BOOL)_accessibilityIsMatchPoint
{
  void *v2;
  char isKindOfClass;

  -[TVRTouchpadViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("touchProcessor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("TVRMatchPointTouchProcessor"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_accessibilityFocusChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id argument;

  -[TVRTouchpadViewAccessibility _accessibilitySetIsDirectTouching:](self, "_accessibilitySetIsDirectTouching:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  v4 = (void *)MEMORY[0x24BDFEA60];
  accessibilityLocalizedString(CFSTR("tv.remote.touchpad.stopped.interaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axAttributedStringWithString:", v5);
  argument = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(argument, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDF7238], 0);

}

- (BOOL)_accessibilityIsDirectTouching
{
  void *v2;
  char v3;

  objc_getAssociatedObject(self, &isDirectTouching);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_accessibilitySetIsDirectTouching:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  NSLog(CFSTR("setting direct touching: %d"), a2, a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &isDirectTouching, v5, (void *)1);

}

@end
