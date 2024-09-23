@implementation MapsSuggestionsMyPlacesEnabled

uint64_t __MapsSuggestionsMyPlacesEnabled_block_invoke()
{
  uint64_t result;

  result = MapsFeature_IsEnabled_MyPlacesFeatures();
  _MergedGlobals_54 = result;
  return result;
}

@end
