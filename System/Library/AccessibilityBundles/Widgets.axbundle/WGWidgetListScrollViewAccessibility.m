@implementation WGWidgetListScrollViewAccessibility

uint64_t __65___WGWidgetListScrollViewAccessibility__axAdjustedFrameForFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349254B8](CFSTR("WGMajorListViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
