@implementation VKCImageTextSelectionView

void __67__VKCImageTextSelectionView_iOSAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  AXVKCImageTextSelectionViewAccessibilityElement *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "length"))
  {
    v7 = -[AXVKCImageTextSelectionViewAccessibilityElement initWithAccessibilityContainer:textRange:]([AXVKCImageTextSelectionViewAccessibilityElement alloc], "initWithAccessibilityContainer:textRange:", *(_QWORD *)(a1 + 32), a3, a4);
    -[AXVKCImageTextSelectionViewAccessibilityElement set_accessibilityContent:](v7, "set_accessibilityContent:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

  }
}

@end
