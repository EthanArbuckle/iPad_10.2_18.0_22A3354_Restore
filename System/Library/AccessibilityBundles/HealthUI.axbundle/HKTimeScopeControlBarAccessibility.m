@implementation HKTimeScopeControlBarAccessibility

void __81___HKTimeScopeControlBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AXLocalizedStringFromTimeScope(objc_msgSend(*(id *)(a1 + 40), "_timeScopeForIndex:", *(_QWORD *)(a1 + 48)));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

@end
