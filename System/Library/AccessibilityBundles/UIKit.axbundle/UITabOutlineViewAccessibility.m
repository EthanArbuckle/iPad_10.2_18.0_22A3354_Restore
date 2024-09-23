@implementation UITabOutlineViewAccessibility

id __62___UITabOutlineViewAccessibility__accessibilitySetupTabButton__block_invoke(id *a1)
{
  __CFString *v1;
  id v3;
  id v4;
  __CFString *v5;
  id v6;
  id v7[3];

  v7[2] = a1;
  v7[1] = a1;
  v7[0] = objc_loadWeakRetained(a1 + 4);
  v6 = (id)objc_msgSend(v7[0], "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("_UITabContainerView")));
  v3 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("sidebar"));
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("_isVisible")) & 1) != 0)
    v1 = CFSTR("hide.sidebar");
  else
    v1 = CFSTR("show.sidebar");
  v5 = v1;

  v4 = (id)UIKitAccessibilityLocalizedString();
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  return v4;
}

@end
