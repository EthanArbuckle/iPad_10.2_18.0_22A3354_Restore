@implementation UIDocumentLaunchViewControllerAccessibility

uint64_t __90___UIDocumentLaunchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("_UIRemoteView"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

BOOL __90___UIDocumentLaunchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_browserPresentationController"));
  v2 = (id)objc_msgSend(v3, "safeStringForKey:", CFSTR("selectedDetentIdentifier"));
  v5 = objc_msgSend(v2, "isEqualToString:", CFSTR("_UIDocumentUnavailableViewBrowserViewControllerMediumDetent"));

  return (v5 & 1) != 0;
}

@end
