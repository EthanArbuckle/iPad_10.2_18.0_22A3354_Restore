@implementation ProfileAvatarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.ProfileAvatarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.ProfileAvatarView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.ProfileAvatarView"), CFSTR("accessibilityIsEditable"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("GameCenterUI.PlayerProfileHeaderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.PlayerProfileHeaderView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.ProfileAvatarView"), CFSTR("accessibilityRoundedEditButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.ProfileAvatarView"), CFSTR("accessibilityProfileEditButtonBackground"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.ProfileAvatarView"), CFSTR("accessibilityProfileEditLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_axIsEditable
{
  return -[ProfileAvatarViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsEditable"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (-[ProfileAvatarViewAccessibility _axIsEditable](self, "_axIsEditable"))
    return *MEMORY[0x24BDF73B0];
  v4.receiver = self;
  v4.super_class = (Class)ProfileAvatarViewAccessibility;
  return -[ProfileAvatarViewAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ProfileAvatarViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23490F8D4](CFSTR("GameCenterUI.PlayerProfileHeaderView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  AXGameCenterUIFrameworkLocString(CFSTR("PLAYER_PHOTO_BUTTON_OF"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[ProfileAvatarViewAccessibility _axIsEditable](self, "_axIsEditable"))
  {
    AXGameCenterUIFrameworkLocString(CFSTR("PLAYER_PHOTO_BUTTON_HINT"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ProfileAvatarViewAccessibility;
    -[ProfileAvatarViewAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ProfileAvatarViewAccessibility;
  -[ProfileAvatarViewAccessibility automationElements](&v12, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[ProfileAvatarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRoundedEditButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v8, "_setIsAccessibilityElementBlock:", &__block_literal_global_4);
    objc_msgSend(v8, "_setAccessibilityLabelBlock:", &__block_literal_global_210);
    objc_msgSend(v8, "_setAccessibilityTraitsBlock:", &__block_literal_global_214);
    objc_msgSend(v7, "axSafelyAddObject:", v8);
  }
  -[ProfileAvatarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityProfileEditButtonBackground"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_accessibilityViewIsVisible"))
  {
    -[ProfileAvatarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityProfileEditLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setIsAccessibilityElementBlock:", &__block_literal_global_215);
    objc_msgSend(v10, "_setAccessibilityLabelBlock:", &__block_literal_global_216);
    objc_msgSend(v10, "_setAccessibilityTraitsBlock:", &__block_literal_global_217);
    objc_msgSend(v7, "axSafelyAddObject:", v10);

  }
  return v7;
}

uint64_t __52__ProfileAvatarViewAccessibility_automationElements__block_invoke()
{
  return 1;
}

id __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_2()
{
  return AXGameCenterUIFrameworkLocString(CFSTR("EDIT_PLAYER_PHOTO"));
}

uint64_t __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_3()
{
  return *MEMORY[0x24BDF73B0];
}

uint64_t __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_4()
{
  return 1;
}

id __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_5()
{
  return AXGameCenterUIFrameworkLocString(CFSTR("EDIT_PLAYER_PHOTO"));
}

uint64_t __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_6()
{
  return *MEMORY[0x24BDF73B0];
}

@end
