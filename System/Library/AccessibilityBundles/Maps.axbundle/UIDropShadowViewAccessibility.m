@implementation UIDropShadowViewAccessibility

uint64_t __58__UIDropShadowViewAccessibility_Maps_AppKit__axExpandCard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLayoutIfSupported:animated:", 2, 1);
}

uint64_t __58__UIDropShadowViewAccessibility_Maps_AppKit__axExpandCard__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLayoutIfSupported:animated:", 3, 1);
}

uint64_t __60__UIDropShadowViewAccessibility_Maps_AppKit__axCollapseCard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLayoutIfSupported:animated:", 1, 1);
}

uint64_t __60__UIDropShadowViewAccessibility_Maps_AppKit__axCollapseCard__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLayoutIfSupported:animated:", 2, 1);
}

id __87__UIDropShadowViewAccessibility_Maps_AppKit__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityContaineeLayout");

  return AXMapsStringForContaineeLayout(v2);
}

uint64_t __71__UIDropShadowViewAccessibility_Maps_AppKit_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissContainee");
}

@end
