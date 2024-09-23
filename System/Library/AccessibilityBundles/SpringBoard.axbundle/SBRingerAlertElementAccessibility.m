@implementation SBRingerAlertElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBRingerAlertElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_updateStateWithTransitionType:(unint64_t)a3
{
  UIAccessibilityNotifications v4;
  __CFString *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRingerAlertElementAccessibility;
  -[SBRingerAlertElementAccessibility _updateStateWithTransitionType:](&v7, sel__updateStateWithTransitionType_);
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      v4 = *MEMORY[0x24BDF71E8];
      v5 = CFSTR("silent.mode");
      goto LABEL_4;
    case 1uLL:
    case 3uLL:
      v4 = *MEMORY[0x24BDF71E8];
      v5 = CFSTR("ring.mode");
LABEL_4:
      accessibilityLocalizedString(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v4, v6);

      break;
    default:
      return;
  }
}

@end
