@implementation UICollectionViewAccessibility

uint64_t __99__UICollectionViewAccessibility__MusicApplication__UIKit_accessibilityShouldSpeakItemReorderEvents__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicApplication.NowPlayingViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x234917594](CFSTR("MusicApplication.PlaylistDetailSongsViewController"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __113__UICollectionViewAccessibility__MusicApplication__UIKit__accessibilitySupplementaryViewSectionHeaderIdentifiers__block_invoke(uint64_t a1, void *a2)
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
