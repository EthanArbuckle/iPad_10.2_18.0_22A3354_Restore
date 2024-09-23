@implementation NSURL(IconFoundationAdditions_Internal)

+ (id)coreGlyphsBundleURL
{
  if (coreGlyphsBundleURL_onceToken != -1)
    dispatch_once(&coreGlyphsBundleURL_onceToken, &__block_literal_global_11);
  return (id)coreGlyphsBundleURL_url;
}

+ (id)coreGlyphsPrivateBundleURL
{
  if (coreGlyphsPrivateBundleURL_onceToken != -1)
    dispatch_once(&coreGlyphsPrivateBundleURL_onceToken, &__block_literal_global_35_0);
  return (id)coreGlyphsPrivateBundleURL_url;
}

@end
