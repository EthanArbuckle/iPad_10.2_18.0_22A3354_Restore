@implementation SidebarContentDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SidebarContentDimmingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SidebarContentDimmingView"), CFSTR("_passthroughView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SidebarContentDimmingView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserToolbar"), CFSTR("_barRegistration"), "<_SFBarRegistrationToken>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_bookmarksItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("bottomToolbar"), "@", 0);

}

- (id)_accessibilityObscuredScreenAllowedViews
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

  -[SidebarContentDimmingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("bottomToolbar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_barRegistration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_bookmarksItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCE30];
  -[SidebarContentDimmingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_passthroughView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "axArrayByIgnoringNilElementsWithCount:", 2, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
