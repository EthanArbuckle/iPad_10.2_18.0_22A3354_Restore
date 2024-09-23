@implementation VideosUI_RootSideBarControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.RootSideBarController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.RootSideBarController"), CFSTR("delegate"), "Optional<RootSideBarControllerDelegate>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.RootSplitViewController"), CFSTR("pillView"), "RootSideBarPillView");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIAccessibilityNotifications v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VideosUI_RootSideBarControllerAccessibility;
  -[VideosUI_RootSideBarControllerAccessibility viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  -[VideosUI_RootSideBarControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("pillView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ax_mappedArrayUsingBlock:", &__block_literal_global_192);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 2)
  {
    v8 = *MEMORY[0x24BDF71E8];
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v8, v9);

  }
}

@end
