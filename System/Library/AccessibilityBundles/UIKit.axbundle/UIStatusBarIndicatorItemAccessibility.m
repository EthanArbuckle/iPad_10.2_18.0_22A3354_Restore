@implementation UIStatusBarIndicatorItemAccessibility

id __84___UIStatusBarIndicatorItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  objc_class *v1;
  id v2;
  NSString *v4;
  id v5;
  id v6;
  id WeakRetained;
  id v9;
  id v10;
  char v11;
  id v12;
  id location[3];
  id v14;

  location[2] = a1;
  location[1] = a1;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v6 = -[_UIStatusBarIndicatorItemAccessibility _axLabelKeyForClassNameDict]((uint64_t)WeakRetained);
  v5 = objc_loadWeakRetained(a1 + 4);
  v1 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v1);
  location[0] = (id)objc_msgSend(v6, "objectForKey:");

  v9 = objc_loadWeakRetained(a1 + 4);
  v10 = (id)objc_msgSend(v9, "accessibilityLabel");
  v11 = 0;
  if (v10)
  {
    v2 = v10;
  }
  else
  {
    v12 = accessibilityLocalizedString(location[0]);
    v11 = 1;
    v2 = v12;
  }
  v14 = v2;
  if ((v11 & 1) != 0)

  objc_storeStrong(location, 0);
  return v14;
}

@end
