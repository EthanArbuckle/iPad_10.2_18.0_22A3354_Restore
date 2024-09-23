@implementation SBNotificationBannerDestinationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBNotificationBannerDestination");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("_cancelReplaceTimer"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("_cancelDismissTimer"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("_dismissPresentableCompleted:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("notificationViewControllerWillBeginUserInteraction:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("notificationViewControllerDidEndUserInteraction:"), "v", "@", 0);

}

- (void)_dismissPresentableCompleted:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBNotificationBannerDestinationAccessibility;
  -[SBNotificationBannerDestinationAccessibility _dismissPresentableCompleted:](&v3, sel__dismissPresentableCompleted_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __77__SBNotificationBannerDestinationAccessibility__dismissPresentableCompleted___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "didPotentiallyDismissNonExclusiveSystemUI");

}

- (void)notificationViewControllerWillBeginUserInteraction:(id)a3
{
  id v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  SBNotificationBannerDestinationAccessibility *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "safeBoolForKey:", CFSTR("_axHasFinishedAnnouncement")) & 1) != 0
    || !UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)SBNotificationBannerDestinationAccessibility;
    -[SBNotificationBannerDestinationAccessibility notificationViewControllerWillBeginUserInteraction:](&v5, sel_notificationViewControllerWillBeginUserInteraction_, v4);
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __99__SBNotificationBannerDestinationAccessibility_notificationViewControllerWillBeginUserInteraction___block_invoke;
    v9 = &unk_250367AD0;
    v10 = self;
    AXPerformSafeBlock();
  }

}

uint64_t __99__SBNotificationBannerDestinationAccessibility_notificationViewControllerWillBeginUserInteraction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelDismissTimer");
}

@end
