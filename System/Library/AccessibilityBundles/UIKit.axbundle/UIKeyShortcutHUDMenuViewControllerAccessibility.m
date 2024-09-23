@implementation UIKeyShortcutHUDMenuViewControllerAccessibility

uint64_t __94___UIKeyShortcutHUDMenuViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v11;
  double v12;
  double v14;
  id v15;
  id location[2];
  uint64_t v17;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15 = 0;
  objc_storeStrong(&v15, a3);
  objc_msgSend(location[0], "frame");
  v14 = v3;
  objc_msgSend(v15, "frame");
  if (v14 >= v4)
  {
    objc_msgSend(location[0], "frame", v14);
    v12 = v5;
    objc_msgSend(v15, "frame");
    if (v12 <= v6)
    {
      objc_msgSend(location[0], "frame", v12);
      v11 = v7;
      objc_msgSend(v15, "frame");
      v8 = 1;
      if (v11 < v9)
        v8 = -1;
      v17 = v8;
    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v17 = -1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17;
}

@end
