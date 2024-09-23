@implementation AccessibilityNodeAccessibility

__CFString *__81__AccessibilityNodeAccessibility__VideosUI__SwiftUI_accessibilityAttributedLabel__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;

  objc_msgSend(a2, "accessibilityLabel");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = &stru_2503D3D30;
  return v2;
}

@end
