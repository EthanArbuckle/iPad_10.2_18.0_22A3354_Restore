@implementation MapsSuggestionsMeCardWithinDistance

BOOL __MapsSuggestionsMeCardWithinDistance_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "geoMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsLocationForMapItem(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "distanceFromLocation:", v6);
    v8 = v7 <= *(double *)(a1 + 40);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
