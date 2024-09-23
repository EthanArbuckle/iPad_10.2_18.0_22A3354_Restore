@implementation LyricsSelectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.LyricsSelectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LyricsSelectionViewController"), CFSTR("accessibilityCharacterCount"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LyricsSelectionViewController"), CFSTR("accessibilityDidSelectItem"), "v", 0);

}

- (void)accessibilityDidSelectItem
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  AXPerformBlockOnMainThreadAfterDelay();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __72__LyricsSelectionViewControllerAccessibility_accessibilityDidSelectItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeIntegerForKey:", CFSTR("accessibilityCharacterCount"));

  accessibilityMusicLocalizedString(CFSTR("lyrics.sharing.characters.remaining"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AXCFormattedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakOrQueueIfNeeded();

}

@end
