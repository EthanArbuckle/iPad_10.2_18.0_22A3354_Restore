@implementation UITransitionViewAccessibility__Podcasts__UIKit

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
  objc_msgSend(a3, "validateClass:", CFSTR("_UISearchControllerView"));
}

- (BOOL)_isSuperviewOfSearchControllerView
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  -[UITransitionViewAccessibility__Podcasts__UIKit subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__UITransitionViewAccessibility__Podcasts__UIKit__isSuperviewOfSearchControllerView__block_invoke;
  v5[3] = &unk_2502FD278;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)_foundSearchControllerDimmingView
{
  void *v2;
  char v3;

  -[UITransitionViewAccessibility__Podcasts__UIKit _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &__block_literal_global_4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
}

- (BOOL)accessibilityElementsHidden
{
  objc_super v4;

  if (-[UITransitionViewAccessibility__Podcasts__UIKit _isSuperviewOfSearchControllerView](self, "_isSuperviewOfSearchControllerView")&& !-[UITransitionViewAccessibility__Podcasts__UIKit _foundSearchControllerDimmingView](self, "_foundSearchControllerDimmingView"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UITransitionViewAccessibility__Podcasts__UIKit;
  return -[UITransitionViewAccessibility__Podcasts__UIKit accessibilityElementsHidden](&v4, sel_accessibilityElementsHidden);
}

- (BOOL)_accessibilityOverridesInvisibility
{
  _BOOL4 v3;
  objc_super v5;

  if (!-[UITransitionViewAccessibility__Podcasts__UIKit _isSuperviewOfSearchControllerView](self, "_isSuperviewOfSearchControllerView")|| (v3 = -[UITransitionViewAccessibility__Podcasts__UIKit _foundSearchControllerDimmingView](self, "_foundSearchControllerDimmingView")))
  {
    v5.receiver = self;
    v5.super_class = (Class)UITransitionViewAccessibility__Podcasts__UIKit;
    LOBYTE(v3) = -[UITransitionViewAccessibility__Podcasts__UIKit _accessibilityOverridesInvisibility](&v5, sel__accessibilityOverridesInvisibility);
  }
  return v3;
}

@end
