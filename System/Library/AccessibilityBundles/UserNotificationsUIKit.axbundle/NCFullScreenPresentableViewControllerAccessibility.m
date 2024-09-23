@implementation NCFullScreenPresentableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCFullScreenPresentableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCFullScreenPresentableViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCFullScreenPresentableViewController"), CFSTR("_bannerView"), "NCFullScreenStagingBannerView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCFullScreenStagingBannerView"), CFSTR("stage"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCFullScreenPresentableViewController"), CFSTR("_notificationRequest"), "NCNotificationRequest");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequest"), CFSTR("content"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContent"), CFSTR("defaultHeader"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCFullScreenStagingBannerView"), CFSTR("_dateLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCFullScreenStagingBannerView"), CFSTR("_detailPrimaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCFullScreenStagingBannerView"), CFSTR("_detailSecondaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCFullScreenPresentableViewController"), CFSTR("_animateTransitionToDetailStateForTrigger:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCFullScreenPresentableViewController"), CFSTR("requestTransitionBlockingAssertionWithReason:"), "@", "@", 0);

}

- (id)_axGetAssertion
{
  JUMPOUT(0x2349234C4);
}

- (void)_axSetAssertion:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCFullScreenPresentableViewControllerAccessibility;
  -[NCFullScreenPresentableViewControllerAccessibility viewIsAppearing:](&v6, sel_viewIsAppearing_, a3);
  -[NCFullScreenPresentableViewControllerAccessibility requestTransitionBlockingAssertionWithReason:](self, "requestTransitionBlockingAssertionWithReason:", CFSTR("brief banner load"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  AXPerformBlockOnMainThreadAfterDelay();

}

uint64_t __70__NCFullScreenPresentableViewControllerAccessibility_viewIsAppearing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateWithReason:", CFSTR("skip brief banner quickly"));
}

- (void)_axHandleStandByAnnouncementFinished
{
  void *v3;
  void *v4;
  void *v5;

  -[NCFullScreenPresentableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bannerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_detailPrimaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v4);
  AXPerformBlockOnMainThreadAfterDelay();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDF71D0], 0);

}

void __90__NCFullScreenPresentableViewControllerAccessibility__axHandleStandByAnnouncementFinished__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_axGetAssertion");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateWithReason:", CFSTR("vot finished speaking"));

}

- (void)_animateTransitionToDetailStateForTrigger:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NCFullScreenPresentableViewControllerAccessibility;
  -[NCFullScreenPresentableViewControllerAccessibility _animateTransitionToDetailStateForTrigger:](&v14, sel__animateTransitionToDetailStateForTrigger_, a3);
  -[NCFullScreenPresentableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bannerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "safeIntForKey:", CFSTR("stage")) == 2)
  {
    -[NCFullScreenPresentableViewControllerAccessibility requestTransitionBlockingAssertionWithReason:](self, "requestTransitionBlockingAssertionWithReason:", CFSTR("detail banner loaded"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCFullScreenPresentableViewControllerAccessibility _axSetAssertion:](self, "_axSetAssertion:", v5);
    -[NCFullScreenPresentableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_notificationRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("content"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("defaultHeader"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "safeValueForKey:", CFSTR("_dateLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_detailPrimaryLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_detailSecondaryLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v9, v10, v11, CFSTR("__AXStringForVariablesSentinel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__axHandleStandByAnnouncementFinished, *MEMORY[0x24BDF71D0], 0);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v12);
  }

}

@end
