@implementation GEOComposedString(LocalizationProviderInitializer)

+ (uint64_t)initialize
{
  return +[MNStringLocalizationProvider initLocalizationProvider](MNStringLocalizationProvider, "initLocalizationProvider");
}

@end
