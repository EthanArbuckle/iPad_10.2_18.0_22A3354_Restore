@implementation PSKeyboardNavigationSearchBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSKeyboardNavigationSearchBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSKeyboardNavigationSearchBar"), CFSTR("keyCommands"), "@", 0);
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (id)keyCommands
{
  void *v3;
  objc_super v5;

  if (-[PSKeyboardNavigationSearchBarAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[PSKeyboardNavigationSearchBarAccessibility _accessibilityKeyCommands](self, "_accessibilityKeyCommands");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PSKeyboardNavigationSearchBarAccessibility;
    -[PSKeyboardNavigationSearchBarAccessibility keyCommands](&v5, sel_keyCommands);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
