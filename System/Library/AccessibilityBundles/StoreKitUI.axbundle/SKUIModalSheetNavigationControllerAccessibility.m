@implementation SKUIModalSheetNavigationControllerAccessibility

uint64_t __78___SKUIModalSheetNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
}

@end
