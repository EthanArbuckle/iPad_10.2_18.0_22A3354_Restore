@implementation CNAutocompleteProbeProviderFactory

+ (id)defaultProbeProvider
{
  return objc_alloc_init(_CNAutocompleteAggdProbeProvider);
}

@end
