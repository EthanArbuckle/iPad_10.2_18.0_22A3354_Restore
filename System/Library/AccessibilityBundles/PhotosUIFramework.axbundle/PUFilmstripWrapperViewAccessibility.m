@implementation PUFilmstripWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUFilmstripWrapperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("PUFilmstripWrapperView"), CFSTR("UIView"));
}

- (BOOL)canBecomeFocused
{
  objc_super v4;

  if ((-[PUFilmstripWrapperViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)PUFilmstripWrapperViewAccessibility;
  return -[PUFilmstripWrapperViewAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
}

@end
