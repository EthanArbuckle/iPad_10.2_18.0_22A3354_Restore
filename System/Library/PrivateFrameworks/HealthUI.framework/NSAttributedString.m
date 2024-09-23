@implementation NSAttributedString

void __77__NSAttributedString_HKAdditions__hk_attributedStringForSpacing_nonBreaking___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hk_attributedStringForSpacing_nonBreaking____spacerCache;
  hk_attributedStringForSpacing_nonBreaking____spacerCache = v0;

}

@end
