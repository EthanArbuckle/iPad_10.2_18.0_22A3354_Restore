@implementation PUIStylePickerHomeScreenVariationSliderAccessibility

uint64_t __79___PUIStylePickerHomeScreenVariationSliderAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSliderValue:layout:fireActions:", 1, 1, *(double *)(a1 + 40));
}

uint64_t __79___PUIStylePickerHomeScreenVariationSliderAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSliderValue:layout:fireActions:", 1, 1, *(double *)(a1 + 40));
}

@end
