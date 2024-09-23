@implementation UIActionSliderAccessibility

uint64_t __53___UIActionSliderAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "actionSliderDidBeginSlide:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "actionSlider:didUpdateSlideWithValue:", *(_QWORD *)(a1 + 40), 1.0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "actionSliderDidCompleteSlide:", *(_QWORD *)(a1 + 40));
  return result;
}

@end
