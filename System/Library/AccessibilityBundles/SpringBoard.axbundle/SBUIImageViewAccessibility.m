@implementation SBUIImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUIImageViewAccessibility;
  v3 = -[SBUIImageViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  -[SBUIImageViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("LockIcon"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("AlarmClock"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("TTY"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Play"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Plus")))
  {
    v3 |= *MEMORY[0x24BEBB180];
  }

  return v3;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  int v4;
  objc_super v6;

  -[SBUIImageViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NotificationRoller"));

  if (v4)
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "accessibilityPerformAction:withValue:fencePort:", 5000, *MEMORY[0x24BDBD268], 0);
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBUIImageViewAccessibility;
    return -[SBUIImageViewAccessibility accessibilityActivate](&v6, sel_accessibilityActivate);
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[SBUIImageViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotificationRoller")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("CameraGrabber")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBUIImageViewAccessibility;
    v4 = -[SBUIImageViewAccessibility _accessibilitySupportsActivateAction](&v6, sel__accessibilitySupportsActivateAction);
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  objc_super v11;

  if (!isAccessibilityElement_validAXIDSet)
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("LockIcon"), CFSTR("wallpaperView"), CFSTR("AlarmClock"), CFSTR("TTY"), CFSTR("Play"), CFSTR("Plus"), 0);
    v4 = (void *)isAccessibilityElement_validAXIDSet;
    isAccessibilityElement_validAXIDSet = v3;

  }
  -[SBUIImageViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)isAccessibilityElement_validAXIDSet, "containsObject:", v5);
  -[SBUIImageViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = 1;
  if (v8 != 1337 && (v6 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBUIImageViewAccessibility;
    v9 = -[SBUIImageViewAccessibility isAccessibilityElement](&v11, sel_isAccessibilityElement);
  }

  return v9;
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[SBUIImageViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("LockIcon")))
  {
    v4 = CFSTR("lock.icon.text");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("wallpaperView")))
  {
    v4 = CFSTR("wallpaper.text");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AlarmClock")))
  {
    v4 = CFSTR("statusbar.alarmclock.icon");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TTY")))
  {
    v4 = CFSTR("statusbar.tty.icon");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Play")))
  {
    v4 = CFSTR("statusbar.play.icon");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Plus")))
    {
      v8.receiver = self;
      v8.super_class = (Class)SBUIImageViewAccessibility;
      -[SBUIImageViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v4 = CFSTR("statusbar.plus.icon");
  }
  accessibilityLocalizedString(v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v6 = (void *)v5;

  return v6;
}

@end
