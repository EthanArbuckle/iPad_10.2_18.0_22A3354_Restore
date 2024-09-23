@implementation UITransitionViewAccessibility

uint64_t __86__UITransitionViewAccessibility__MusicUI__UIKit__foundNowPlayingViewControllerForIPad__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234917594](CFSTR("UIDropShadowView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __86__UITransitionViewAccessibility__MusicUI__UIKit__foundNowPlayingViewControllerForIPad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char v3;

  v2 = a2;
  MEMORY[0x234917594](CFSTR("_UIRoundedRectShadowView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    MEMORY[0x234917594](CFSTR("UIDropShadowView"));
    v3 = objc_opt_isKindOfClass() ^ 1;
  }

  return v3 & 1;
}

@end
