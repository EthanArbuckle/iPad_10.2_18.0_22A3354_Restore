@implementation UICollectionViewAccessibility

uint64_t __88__UICollectionViewAccessibility__Music__UIKit_accessibilityShouldSpeakItemReorderEvents__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917228](CFSTR("Music.NowPlayingViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x234917228](CFSTR("Music.LibraryMainViewController")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x234917228](CFSTR("Music.PlaylistEditingViewController"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __102__UICollectionViewAccessibility__Music__UIKit__accessibilitySupplementaryViewSectionHeaderIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDF7630]) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ShelfSupplementaryViewKindGlobalHeader")) ^ 1;

  return v3;
}

@end
