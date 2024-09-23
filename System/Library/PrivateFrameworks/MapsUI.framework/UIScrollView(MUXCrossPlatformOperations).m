@implementation UIScrollView(MUXCrossPlatformOperations)

- (uint64_t)_mapsui_scrollToTopAnimated:()MUXCrossPlatformOperations
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(a1, "adjustedContentInset");
  v8 = v5 - v7;
  objc_msgSend(a1, "adjustedContentInset");
  return objc_msgSend(a1, "setContentOffset:animated:", a3, v8, v6 - v9);
}

- (uint64_t)_mapsui_scrollToContentOffset:()MUXCrossPlatformOperations animated:
{
  return objc_msgSend(a1, "setContentOffset:animated:", 1);
}

@end
