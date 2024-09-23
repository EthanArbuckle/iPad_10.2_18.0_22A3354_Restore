@implementation UIViewAccessibility

uint64_t __63__UIViewAccessibility__MobileMail__UIKit_accessibilityElements__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", *(_QWORD *)(a1 + 32));
  v2 = (void *)accessibilityElements_showDraftsElement;
  accessibilityElements_showDraftsElement = v1;

  objc_msgSend((id)accessibilityElements_showDraftsElement, "setIsAccessibilityElement:", 1);
  return objc_msgSend((id)accessibilityElements_showDraftsElement, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
}

uint64_t __63__UIViewAccessibility__MobileMail__UIKit_accessibilityElements__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityElementsHidden") ^ 1;
}

@end
