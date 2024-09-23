@implementation MapsSuggestionsBestFlightLeg

uint64_t __MapsSuggestionsBestFlightLeg_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  MapsSuggestionsFlightDepartureTime(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsFlightDepartureTime(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

@end
