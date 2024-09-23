@implementation UIDatePickerContainerViewAccessibility

uint64_t __69___UIDatePickerContainerViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissPresentationAnimated:", 1, a1, a1);
}

double __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  double v1;
  id WeakRetained;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v4 = v1;

  return v4;
}

double __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  double v1;
  id WeakRetained;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityFrame");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "accessibilityActivationPoint");
  CGPointMake_0();
  v5 = v1;

  return v5;
}

uint64_t __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "accessibilityPerformEscape");

  return v3 & 1;
}

@end
