@implementation _UIKeyboardPopoverAffordanceAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyboardPopoverAffordance");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("keyboard.floating.grabber"));
}

- (id)accessibilityHint
{
  id v2;
  char v4;
  id v5;
  char v6;
  id v7;
  void *v8;

  v6 = 0;
  v4 = 0;
  if ((objc_msgSend(MEMORY[0x24BDF6B38], "isFloatingForced") & 1) != 0)
  {
    v7 = accessibilityLocalizedString(CFSTR("keyboard.floating.grabber.hint.floating.forced"));
    v6 = 1;
    v2 = v7;
  }
  else
  {
    v5 = accessibilityLocalizedString(CFSTR("keyboard.floating.grabber.hint.default"));
    v4 = 1;
    v2 = v5;
  }
  v8 = v2;
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  return v8;
}

- (BOOL)accessibilityActivate
{
  objc_msgSend(MEMORY[0x24BDF6B38], "setFloating:positionedAtDefaultOffsetAnimated:", 0, 1);
  return objc_msgSend(MEMORY[0x24BDF6B38], "isFloating") & 1;
}

@end
