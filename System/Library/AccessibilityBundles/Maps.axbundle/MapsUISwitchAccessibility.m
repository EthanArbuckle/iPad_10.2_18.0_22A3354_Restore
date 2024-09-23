@implementation MapsUISwitchAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISwitch");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsUISwitchAccessibility;
  v3 = -[MapsUISwitchAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[MapsUISwitchAccessibility _accessibilityIsInSettingsTableViewCell](self, "_accessibilityIsInSettingsTableViewCell");
  v5 = *MEMORY[0x24BEBB178];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)_accessibilityIsInSettingsTableViewCell
{
  return self->__accessibilityIsInSettingsTableViewCell;
}

- (void)_accessibilitySetIsInSettingsTableViewCell:(BOOL)a3
{
  self->__accessibilityIsInSettingsTableViewCell = a3;
}

@end
