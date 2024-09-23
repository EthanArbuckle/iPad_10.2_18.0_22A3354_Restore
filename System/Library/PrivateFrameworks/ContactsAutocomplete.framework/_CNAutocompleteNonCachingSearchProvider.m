@implementation _CNAutocompleteNonCachingSearchProvider

- (id)localSearch
{
  return objc_alloc_init(CNAutocompleteLocalSearch);
}

- (id)recentsSearch
{
  return objc_alloc_init(CNAutocompleteRecentsSearch);
}

- (id)stewieSearch
{
  return objc_alloc_init(CNAutocompleteStewieSearch);
}

- (id)suggestionsSearch
{
  return objc_alloc_init(CNAutocompleteSuggestionsSearch);
}

- (id)predictionSearch
{
  return objc_alloc_init(CNAutocompletePredictionSearch);
}

- (id)localExtensionSearches
{
  CNAutocompleteLocalExtensionSearch *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(CNAutocompleteLocalExtensionSearch);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)directoryServerSearch
{
  return objc_alloc_init(CNAutocompleteDirectoryServerSearch);
}

- (id)calendarServerSearch
{
  return objc_alloc_init(CNAutocompleteCalendarServerSearch);
}

@end
