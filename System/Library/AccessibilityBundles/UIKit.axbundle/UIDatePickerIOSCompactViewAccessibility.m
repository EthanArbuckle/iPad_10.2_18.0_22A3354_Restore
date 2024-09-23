@implementation UIDatePickerIOSCompactViewAccessibility

uint64_t __65___UIDatePickerIOSCompactViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setActiveComponent:", 1);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "_datePicker:didSelectComponent:", *(_QWORD *)(a1 + 48), 1);
  return result;
}

uint64_t __65___UIDatePickerIOSCompactViewAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setActiveComponent:", 2);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "_datePicker:didSelectComponent:", *(_QWORD *)(a1 + 48), 2);
  return result;
}

@end
