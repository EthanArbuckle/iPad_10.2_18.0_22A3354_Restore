@implementation UIViewAccessibility

uint64_t __86__UIViewAccessibility__MusicApplication__UIKit__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicApplication.LibraryRecommendationBannerViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
