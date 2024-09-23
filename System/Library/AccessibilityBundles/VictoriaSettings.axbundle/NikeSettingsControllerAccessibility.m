@implementation NikeSettingsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NikeSettingsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)dismissModalViewControllerAnimated:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NikeSettingsControllerAccessibility;
  -[NikeSettingsControllerAccessibility dismissModalViewControllerAnimated:](&v3, sel_dismissModalViewControllerAnimated_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)showPowerSongPicker:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NikeSettingsControllerAccessibility;
  -[NikeSettingsControllerAccessibility showPowerSongPicker:](&v3, sel_showPowerSongPicker_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
