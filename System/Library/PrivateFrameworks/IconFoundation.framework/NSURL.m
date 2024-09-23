@implementation NSURL

void __62__NSURL_IconFoundationAdditions_Internal__coreGlyphsBundleURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/CoreGlyphs.bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreGlyphsBundleURL_url;
  coreGlyphsBundleURL_url = v0;

}

void __69__NSURL_IconFoundationAdditions_Internal__coreGlyphsPrivateBundleURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/CoreGlyphsPrivate.bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreGlyphsPrivateBundleURL_url;
  coreGlyphsPrivateBundleURL_url = v0;

}

@end
