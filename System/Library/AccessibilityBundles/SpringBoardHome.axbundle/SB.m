@implementation SB

uint64_t __76__SB_UIScenePresentationViewAccessibility__accessibilitySpringBoardIconView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SBIconView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
