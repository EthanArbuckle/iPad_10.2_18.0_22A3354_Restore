@implementation UINavigationBarVisualProviderModernIOSAccessibility

void __70___UINavigationBarVisualProviderModernIOSAccessibility_layoutSubviews__block_invoke(id *a1)
{
  id location[3];

  location[2] = a1;
  location[1] = a1;
  objc_msgSend(a1[4], "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  location[0] = (id)objc_msgSend(a1[4], "accessibilityElements");
  if ((objc_msgSend(a1[5], "isEqual:", location[0]) & 1) == 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(location, 0);
}

@end
