@implementation UIStatusBarBackgroundActivityItemAccessibility

id __76___UIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = AXStatusBarPillTimeView(WeakRetained);
  v2 = (id)objc_msgSend(v3, "accessibilityLabel");
  v5 = (id)__UIAXStringForVariables();

  return v5;
}

id __76___UIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = AXStatusBarPillTimeView(WeakRetained);
  v2 = (id)objc_msgSend(v3, "accessibilityLabel");
  v5 = (id)__UIAXStringForVariables();

  return v5;
}

void __93___UIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("setNeedsUpdate"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("backgroundView"));
  v4 = (id)objc_msgSend(v5, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  objc_msgSend(v4, "forceUpdate:", 1);

  NSClassFromString(CFSTR("_UIStatusBarPillBackgroundActivityItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("combinedView"));
    v2 = (id)objc_msgSend(v3, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    objc_msgSend(v2, "forceUpdate:", 1);

  }
}

uint64_t __82___UIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke()
{
  return 1;
}

id __82___UIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
