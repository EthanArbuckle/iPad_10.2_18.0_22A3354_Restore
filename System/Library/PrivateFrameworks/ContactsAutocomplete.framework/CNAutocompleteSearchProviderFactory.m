@implementation CNAutocompleteSearchProviderFactory

+ (id)nonCachingProvider
{
  return objc_alloc_init(_CNAutocompleteNonCachingSearchProvider);
}

+ (id)cachingProvider
{
  void *v2;
  _CNAutocompleteCachingSearchProvider *v3;

  +[CNAutocompleteSearchProviderFactory nonCachingProvider](CNAutocompleteSearchProviderFactory, "nonCachingProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_CNAutocompleteCachingSearchProvider initWithSearchProvider:]([_CNAutocompleteCachingSearchProvider alloc], "initWithSearchProvider:", v2);

  return v3;
}

@end
