@implementation FeaturedLockupCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.FeaturedLockupCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FeaturedLockupCellAccessibility;
  v3 = -[FeaturedLockupCellAccessibility canBecomeFocused](&v5, sel_canBecomeFocused);
  return v3 & ~-[FeaturedLockupCellAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem");
}

@end
