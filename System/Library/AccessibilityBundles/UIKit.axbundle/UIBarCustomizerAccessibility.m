@implementation UIBarCustomizerAccessibility

uint64_t __75___UIBarCustomizerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  id WeakRetained;
  id v4;
  id v5;
  char v6;
  id v7[3];

  v7[2] = a1;
  v7[1] = a1;
  v6 = 0;
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v5 = (id)__UIAccessibilityCastAsClass();

  v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  objc_msgSend(v4, "end");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  objc_storeStrong(v7, 0);
  return 1;
}

@end
