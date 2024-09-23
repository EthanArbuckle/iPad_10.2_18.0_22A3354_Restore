@implementation UIKeyShortcutHUDWindowAccessibility

void __57___UIKeyShortcutHUDWindowAccessibility_makeKeyAndVisible__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications notification;
  id v2;

  notification = *MEMORY[0x24BDF7328];
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFirstDescendant");
  UIAccessibilityPostNotification(notification, v2);

}

@end
