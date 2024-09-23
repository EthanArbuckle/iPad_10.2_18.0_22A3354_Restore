@implementation UITransitionViewAccessibility__MusicUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITransitionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITransitionView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UISearchPresentationController"), CFSTR("UIPresentationController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UIFormSheetPresentationController"), CFSTR("UIPresentationController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPresentationController"), CFSTR("presentedViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Music.NowPlayingViewController"), CFSTR("UIViewController"));

}

- (BOOL)accessibilityViewIsModal
{
  void *v3;
  void *v4;
  char isKindOfClass;
  BOOL v6;
  objc_super v8;

  -[UITransitionViewAccessibility__MusicUI__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917228](CFSTR("_UIFormSheetPresentationController"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "safeValueForKey:", CFSTR("presentedViewController")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        MEMORY[0x234917228](CFSTR("Music.NowPlayingViewController")),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0)
    || !v3
    && -[UITransitionViewAccessibility__MusicUI__UIKit _foundNowPlayingViewControllerForIPad](self, "_foundNowPlayingViewControllerForIPad"))
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITransitionViewAccessibility__MusicUI__UIKit;
    v6 = -[UITransitionViewAccessibility__MusicUI__UIKit accessibilityViewIsModal](&v8, sel_accessibilityViewIsModal);
  }

  return v6;
}

- (BOOL)_foundNowPlayingViewControllerForIPad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (AXDeviceIsPad())
  {
    -[UITransitionViewAccessibility__MusicUI__UIKit _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_199);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "safeValueForKey:", CFSTR("subviews"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v8, "safeValueForKey:", CFSTR("subviews"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v10, "_accessibilityViewController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            MEMORY[0x234917228](CFSTR("Music.NowPlayingViewController"));
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v13 = 1;
            }
            else
            {
              objc_msgSend(v10, "safeValueForKey:", CFSTR("subviews"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "firstObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "safeValueForKey:", CFSTR("subviews"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "firstObject");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "_accessibilityViewController");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              MEMORY[0x234917228](CFSTR("Music.NowPlayingViewController"));
              v13 = objc_opt_isKindOfClass();

            }
          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  return v13 & 1;
}

@end
