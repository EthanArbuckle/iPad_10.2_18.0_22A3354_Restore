@implementation UIContextMenuUIControllerAccessibility

void __59___UIContextMenuUIControllerAccessibility__axPerformEscape__block_invoke(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v2[0] = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("delegate"));
  objc_msgSend(v2[0], "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", a1[4], 0);
  objc_storeStrong(v2, 0);
}

void __59___UIContextMenuUIControllerAccessibility__axPerformEscape__block_invoke_2()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

uint64_t __63___UIContextMenuUIControllerAccessibility_platterContainerView__block_invoke(id *a1)
{
  char v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = -[_UIContextMenuUIControllerAccessibility _axPerformEscape](v3[0]);
  objc_storeStrong(v3, 0);
  return v2 & 1;
}

void __71___UIContextMenuUIControllerAccessibility_presentationTransitionDidEnd__block_invoke(id *a1)
{
  id v2;
  UIAccessibilityNotifications notification;
  char v4;
  id v5;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  v2 = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("menuView"));
  location[0] = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("currentListView"));

  notification = *MEMORY[0x24BEBB030];
  v4 = 0;
  if (location[0])
  {
    UIAccessibilityPostNotification(notification, location[0]);
  }
  else
  {
    v5 = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("platterContainerView"));
    v4 = 1;
    UIAccessibilityPostNotification(notification, v5);
  }
  if ((v4 & 1) != 0)

  objc_storeStrong(location, 0);
}

double __85___UIContextMenuUIControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  double v1;
  id WeakRetained;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v4 = v1;

  return v4;
}

uint64_t __85___UIContextMenuUIControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  char v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = -[_UIContextMenuUIControllerAccessibility _axPerformEscape](v3[0]);
  objc_storeStrong(v3, 0);
  return v2 & 1;
}

@end
