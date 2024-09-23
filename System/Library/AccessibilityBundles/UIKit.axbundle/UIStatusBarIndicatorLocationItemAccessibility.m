@implementation UIStatusBarIndicatorLocationItemAccessibility

void __68___UIStatusBarIndicatorLocationItemAccessibility_accessibilityLabel__block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  char v9;
  id v10;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10 = 0;
  objc_storeStrong(&v10, a3);
  v7 = location[0];
  v8 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("_UIStatusBarIndicatorLocationItem")), "safeValueForKey:", CFSTR("prominentDisplayIdentifier"));
  v9 = 0;
  if ((objc_msgSend(v7, "isEqual:") & 1) != 0)
    v9 = objc_msgSend(v10, "safeBoolForKey:", CFSTR("isEnabled"));

  if ((v9 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

@end
