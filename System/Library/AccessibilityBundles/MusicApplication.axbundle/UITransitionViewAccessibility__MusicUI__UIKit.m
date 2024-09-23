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
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.SearchResultsViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITransitionView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UISearchPresentationController"), CFSTR("UIPresentationController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UIFormSheetPresentationController"), CFSTR("UIPresentationController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPresentationController"), CFSTR("presentedViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.SearchResultsViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.NowPlayingViewController"), CFSTR("UIViewController"));

}

- (BOOL)accessibilityViewIsModal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  BOOL v8;
  void *v9;
  char v10;
  objc_super v12;

  -[UITransitionViewAccessibility__MusicUI__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("_UISearchPresentationController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("presentedViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchResultsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234917594](CFSTR("MusicApplication.SearchResultsViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

    v8 = 0;
    if ((isKindOfClass & 1) != 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  MEMORY[0x234917594](CFSTR("_UIFormSheetPresentationController"));
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v3, "safeValueForKey:", CFSTR("presentedViewController")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        MEMORY[0x234917594](CFSTR("MusicApplication.NowPlayingViewController")),
        v10 = objc_opt_isKindOfClass(),
        v9,
        (v10 & 1) == 0))
  {
    if (v3
      || !-[UITransitionViewAccessibility__MusicUI__UIKit _foundNowPlayingViewControllerForIPad](self, "_foundNowPlayingViewControllerForIPad"))
    {
LABEL_9:
      v12.receiver = self;
      v12.super_class = (Class)UITransitionViewAccessibility__MusicUI__UIKit;
      v8 = -[UITransitionViewAccessibility__MusicUI__UIKit accessibilityViewIsModal](&v12, sel_accessibilityViewIsModal);
      goto LABEL_10;
    }
  }
  v8 = 1;
LABEL_10:

  return v8;
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
    -[UITransitionViewAccessibility__MusicUI__UIKit _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_202);
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
            MEMORY[0x234917594](CFSTR("MusicApplication.NowPlayingViewController"));
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
              MEMORY[0x234917594](CFSTR("MusicApplication.NowPlayingViewController"));
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
